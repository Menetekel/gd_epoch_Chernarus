﻿private["_l0","_l1","_l2"];_l0=_this select 0;_l1=_l0 getVariable"R3F_LOG_disabled";if(isNil"_l1")then{_l0 setVariable["R3F_LOG_disabled",false];};_l2=_l0 getVariable"R3F_LOG_remorque";if(isNil"_l2")then{_l0 setVariable["R3F_LOG_remorque",objNull,false];};_l0 addAction[("<t color=""#dddd00"">"+Tow_settings_action_remorquer_deplace+"</t>"),"germandayz\R3F\R3F_LOG\remorqueur\remorquer_deplace.sqf",nil,6,true,true,"","R3F_LOG_objet_addAction==_target && R3F_LOG_action_remorquer_deplace_valide"];_l0 addAction[("<t color=""#eeeeee"">"+Tow_settings_action_remorquer_selection+"</t>"),"germandayz\R3F\R3F_LOG\remorqueur\remorquer_selection.sqf",nil,6,true,true,"","R3F_LOG_objet_addAction==_target && R3F_LOG_action_remorquer_selection_valide"];