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

APMD = params(2);
monolayer_hydration = params(3);




sum_m  = -3.06E-4;

volume_m_tails = 1061;
volume_m_heads = 113;
volume_m = volume_m_tails + volume_m_heads;

Thickm = (volume_m_tails + volume_m_heads) / APMD;

Rho_m=sum_m/volume_m;



%Group all the parameters into layers
Monolayer = [Thickm , Rho_m , subs_rough , monolayer_hydration , 0];

%Put the layers together into the final model.
output = [Monolayer];
    





