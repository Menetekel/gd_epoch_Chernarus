﻿private["_l0","_l1","_l2","_l3","_l4","_l5","_l6","_l7","_l8","_l9","_l10","_l11","_l12","_l13","_l14","_l15","_l16","_l17","_l18","_l19","_l20","_l21","_l22","_l23","_l24"];_l0=4000;_l11=30;_l9=300;_l2=20;_l7=true;_l6=1000;_l1=false;_l5=50;_l24=21;_l15=false;_l16=getPosASL player;_l17=_l16 select 0;_l18=_l16 select 1;_l19=_l16 select 2;_l20=_l19+40;_l21=[_l17,_l18,_l20];_l22=lineIntersects[_l16,_l21];_l23=count nearestObjects[player,["Land_A_Hospital"],_l24];if((_l23>0)&& _l22)then{_l15=true;};if(!_l15)exitWith{cutText[format["You need to be inside a Hospital to do this!Or use a Wooden Arrow,a Razor and Toilet Paper for a Improvised Self Bloodbag!"],"PLAIN DOWN"];};_l10=time-lastBloodbag;_l12=time;_l14=player getVariable["combattimeout",0];_l13=if(_l14>=diag_tickTime)then{true}else{false};if(_l10<_l9)exitWith{cutText[format["You may not use Self Bloodbag this soon please wait %1!",(_l10-_l9)],"PLAIN DOWN"];};if(_l13)then{cutText[format["You are in Combat and cannot give yourself a Bloodbag"],"PLAIN DOWN"];}else{player removeAction s_player_selfBloodbag;player playActionNow"Medic";r_interrupt=false;_l25=animationState player;r_doLoop=true;_l26=false;_l27=false;while{r_doLoop}do{_l25=animationState player;_l28=["medic",_l25]call fnc_inString;if(_l28)then{_l26=true;};if(!_l28 &&!r_interrupt &&(time-_l12)<_l11)then{player playActionNow"Medic";_l28=true;};if(_l26 &&!_l28 &&(time-_l12)>_l11)then{r_doLoop=false;_l27=true;lastBloodbag=time;};if(r_interrupt)then{r_doLoop=false;};sleep 0.1;};r_doLoop=false;if(_l27)then{player removeMagazine"ItemBloodbag";r_player_blood=r_player_blood+_l0;if(r_player_blood>12000)then{r_player_blood=12000;};if(random(_l2)<1)then{r_player_infected=true;player setVariable["USEC_infected",true,true];cutText[format["You have used a bloodbag on yourself but the bloodbag was infected!"],"PLAIN DOWN"];if(_l7)then{r_player_blood=r_player_blood-_l6;player setVariable["USEC_BloodQty",r_player_blood,true];}else{r_player_lowblood=false;10 fadeSound 1;"dynamicBlur"ppEffectAdjust[0];"dynamicBlur"ppEffectCommit 5;"colorCorrections"ppEffectAdjust[1,1,0,[1,1,1,0.0],[1,1,1,1],[1,1,1,1]];"colorCorrections"ppEffectCommit 5;r_player_lowblood=false;player setVariable["USEC_BloodQty",r_player_blood,true];};}else{r_player_lowblood=false;10 fadeSound 1;"dynamicBlur"ppEffectAdjust[0];"dynamicBlur"ppEffectCommit 5;"colorCorrections"ppEffectAdjust[1,1,0,[1,1,1,0.0],[1,1,1,1],[1,1,1,1]];"colorCorrections"ppEffectCommit 5;r_player_lowblood=false;player setVariable["USEC_BloodQty",r_player_blood,true];cutText[format["You have used a bloodbag on yourself!"],"PLAIN DOWN"];};if(_l1)then{[player,_l5]call player_humanityChange;};}else{r_interrupt=false;player switchMove"";player playActionNow"stop";cutText[format["You have interrupted giving yourself a bloodbag!"],"PLAIN DOWN"];};};