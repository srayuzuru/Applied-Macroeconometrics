% U.S. state-level data for 
% employment, output, wages and interstate migration
% For 48 U.S. states excluding Alaska, the District of Columbia and Hawaii
% Daniela Hauser, July 2018
clear all
close all
clc

labels = ['Alabama      ';'Arizona      ';'Arkansas     ';'California   ';'Colorado     ';'Connecticut  ';
          'Delaware     ';'Florida      ';'Georgia      ';'Idaho        ';'Illinois     ';'Indiana      ';
          'Iowa         ';'Kansas       ';'Kentucky     ';'Louisiana    ';'Maine        ';'Maryland     ';
          'Massachusetts';'Michigan     ';'Minnesota    ';'Mississippi  ';'Missouri     ';'Montana      ';
          'Nebraska     ';'Nevada       ';'NewHampshire ';'NewJersey    ';'NewMexico    ';'NewYork      ';
          'NorthCarolina';'NorthDakota  ';'Ohio         ';'Oklahoma     ';'Oregon       ';'Pennsylvania ';
          'RhodeIsland  ';'SouthCarolina';'SouthDakota  ';'Tennessee    ';'Texas        ';'Utah         ';
          'Vermont      ';'Virginia     ';'Washington   ';'WestVirginia ';'Wisconsin    ';'Wyoming      '];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% U.S. state-level employment data from BEA
% for the period 1976 - 2016 (annual frequency)
% http://www.bea.gov/iTable/index_regional.cfm
% Choose the following: 
% Annual State Personal Income and Employment
% Personal Income and Employment by Major Component (SA4)
% Statistic: Total Employment
%
load('employment.mat')
%
% size 41 x 49
% rows correspond to time period (1976-2016)
% columns 1 - 48 represent states (in the order as defined in "labels")
% column 49 is aggregate U.S. employment
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Real gross domestic product by state
% nominal series from BEA for the period 1976 - 2016 (annual frequency)
% http://www.bea.gov/iTable/index_regional.cfm
% Choose the following: 
% Annual Gross Domestic Product (GDP) by state
% GDP in current dollars
% Deflated by state-specific prices constructed by DelNegro (1998),
% following Canova and Pappa (2007), Appendix A
%
load('realGSP.mat')
%
% size 41 x 49
% rows correspond to time period (1976-2016)
% columns 1 - 48 represent states (in the order as defined in "labels")
% column 49 is aggregate U.S. real GDP
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Real wages
% nominal series from BEA for the period 1976 - 2016 (annual frequency)
% http://www.bea.gov/iTable/index_regional.cfm
% Choose the following: 
% Annual State Personal Income and Employment
% Wages and Salaries by Industry (SA7)
% Statistic: Wages and salaries by place of work (thousands of dollars)
% Deflated by state-specific prices constructed by DelNegro (1998),
% following Canova and Pappa (2007), Appendix A
% 
load('RealWages.mat')
%
% size 41 x 49
% rows correspond to time period (1976-2016)
% columns 1 - 48 represent states (in the order as defined in "labels")
% column 49 is aggregate U.S. real wages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% State Deflator, constructed by DelNegro (1998), 
% following Canova and Pappa (2007), Appendix A
% Normalized to 100 in year 2009
% Note, that for all states this price index is similar to the one proposed
% in Berry et al (2000, Journal of Politics)
% https://onlinelibrary.wiley.com/doi/abs/10.1111/0022-3816.00025
%
load('StateDefl.mat')
%
% size 41 x 49
% rows correspond to time period (1976-2016)
% columns 1 - 48 represent states (in the order as defined in "labels")
% column 49 is deflator for aggregate U.S. GDP
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Interstate Migration Flows taken from the IRS for 1976 - 2016
% https://www.irs.gov/statistics/soi-tax-stats-migration-data
%
% Gross inflows
load('INFLOWS.mat')
%
% size 41 x 48 x 48
% rows correspond to time period (1976-2016)
% columns and third dimension 1 - 48 represent states (in the order as defined in "labels")
% Example: INFLOWS(:,2,1) respresents inflows from Arizona (2) into Alabama (1)
%
% Gross outflows
load('OUTFLOWS.mat')
%
% size 41 x 48 x 48
% rows correspond to time period (1976-2016)
% columns and third dimension 1 - 48 represent states (in the order as defined in "labels")
% Example: OUTFLOWS(:,3,4) respresents outflows from California (4) to Arkansas (3)