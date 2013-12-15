/**
 * Initialise un v�hicule h�liporteur
 * 
 * @param 0 l'h�liporteur
 */

private ["_heliporteur", "_is_inactive", "_heliporte"];

_heliporteur = _this select 0;

_is_inactive = _heliporteur getVariable "R3F_LOG_disabled";
if (isNil "_is_inactive") then
{
	_heliporteur setVariable ["R3F_LOG_disabled", false];
};

// D�finition locale de la variable si elle n'est pas d�finie sur le r�seau
_heliporte = _heliporteur getVariable "R3F_LOG_heliporte";
if (isNil "_heliporte") then
{
	_heliporteur setVariable ["R3F_LOG_heliporte", objNull, false];
};

_heliporteur addAction [("<t color=""#dddd00"">" + Tow_settings_action_heliporter + "</t>"), "germandayz\R3F\R3F_LOG\heliporteur\heliporter.sqf", nil, 6, true, true, "", "R3F_LOG_objet_addAction == _target && R3F_LOG_action_heliporter_valide"];

_heliporteur addAction [("<t color=""#dddd00"">" + Tow_settings_action_heliport_larguer + "</t>"), "germandayz\R3F\R3F_LOG\heliporteur\larguer.sqf", nil, 6, true, true, "", "R3F_LOG_objet_addAction == _target && R3F_LOG_action_heliport_larguer_valide"];