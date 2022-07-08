function [output,subs_rough] = volumemodel_monolayer_bilayer(params,bulk_in,bulk_out,contrast)
%SINGLEBILAYERTEST  RASCAL Custom Layer Model File.
%
%
% This file accepts 3 vectors containing the values for
% Params, bulk in and bulk out
% The final parameter is an index of the contrast being calculated
% The m-file should output a matrix of layer values, in the form..
% Output = [thick 1, SLD 1, Rough 1, Hydration 1 , Hydrate How 1...
%           ....
%           thick n, SLD n, Rough n, Hydration n , Hydrate How n]
% The "hydrate how" parameter decides if the layer is hydrated with
% Bulk out or Bulk in phases. Set to 1 for Bulk out, zero for Bulk in.
% Alternatively, leave out hydration and just return..
% Output = [thick 1, SLD 1, Rough 1,
%           ....
%           thick n, SLD n, Rough n] };

subs_rough = params(1);
APM = params(2);
LW_thick = params(3);
CW_thick = params(4);
bilayer_hydration_lower = params(5);
diff_hydration = params(6);
bilayer_rough_lower = params(7);
Diffthick= params(8);
APMD = params(9);
monolayer_hydration = params(10);
surf_rough = params(11);


%Define all the neutron b's
bc = 0.6646e-4;	%Carbon
bo = 0.5804e-4;	%Oxygen
bh = -0.3739e-4;	%Hydrogen
bp = 0.513e-4;	%Phosphorus
bn = 0.936e-4;	%Nitrogen
bd = 0.6671e-4;	%Deuterium

%Formulae of the molecule sections...
CH2 = (1*bc) + (2*bh);
CH = (1*bc) + (1*bh);
CH3 = (1*bc) + (3*bh);
%D2O = (2*bd) + (1*bo);
%H2O = (2*bh) + (1*bo);

%Calculate mole fraction of D2O from the bulk SLD..
%d2o_molfr = (1/D2O-H2O)*((bulk_out(contrast)*27.64)-H2O);
%wMol = (d2o_molfr * D2O) + ((1-d2o_molfr)*H2O);

%sum b's of all the different fragments
sum_b_tails = (28*CH2) + (2*CH) + (2*CH3);
sum_popc_heads = (8*bo) + (1*bp) + (1*bn) + (2*bc) + (4*CH2) + (3*CH3) + (1*CH);
sum_popg_heads = (10*bo) + (1*bp) + (2*bc) + (4*CH2) + (2*CH) + (2*bh);
%average composition of lipids in bilayer
sum_b_heads = (1/4)*(3*(sum_popc_heads) + (sum_popg_heads));


sum_m  = -3.06E-4;

%volumes of each fragment
%volumes of each fragment
%vol_w = 29.7;
volume_tails = 932.5;
volume_popc_heads = 331;
volume_popg_heads = 291;
volume_heads = (1/4)*((3*volume_popc_heads)+(volume_popg_heads));
volume_m_tails = 1061;
volume_m_heads = 113;
volume_m = volume_m_tails + volume_m_heads;
%Calculate thickness of each fragment
TailThick = volume_tails / APM;
HeadThick = volume_heads / APM;

Thickm = (volume_m_tails + volume_m_heads) / APMD;


%HeadThicku = volume_heads / APMupperbilayer;
%TailThickm = volume_m_tails / APMD;
%HeadThickm = volume_m_heads / APMD;

%and thus the SLD
Rho_heads = sum_b_heads / volume_heads;
Rho_tails = sum_b_tails / volume_tails;
Rho_m=sum_m/volume_m;



%Group all the parameters into layers
Monolayer = [Thickm , Rho_m , surf_rough , monolayer_hydration , 0];
LW_layer = [LW_thick , bulk_out(contrast) , surf_rough , 0 , 1];
Head_layer_lower = [HeadThick , Rho_heads , bilayer_rough_lower , bilayer_hydration_lower , 1];
Tail_layer_lower = [TailThick , Rho_tails , bilayer_rough_lower , bilayer_hydration_lower , 1];

central_water = [CW_thick , bulk_out(contrast), subs_rough , 0 , 1];

Tail_layer_upper = [Diffthick , Rho_tails , subs_rough , diff_hydration , 1];
%Monolayer_tail = [HeadThickm , Rho_m_heads , biilayer_rough_lower , 0 , 0];
%Monolayer_head = [TailThickm , Rho_m_tails , bilayer_rough_lower , 0 , 1];


lower_bilayer = [Head_layer_lower ; Tail_layer_lower ; Tail_layer_lower ; Head_layer_lower];
upper_bilayer  = [Tail_layer_upper];

%Put the layers together into the final model.
output = [Monolayer; LW_layer ; lower_bilayer ; central_water ; upper_bilayer];
    




