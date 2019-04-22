# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "X_ACTIVE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "X_BLANKING" -parent ${Page_0}
  ipgui::add_param $IPINST -name "Y_ACTIVE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "Y_BLANKING" -parent ${Page_0}


}

proc update_PARAM_VALUE.X_ACTIVE { PARAM_VALUE.X_ACTIVE } {
	# Procedure called to update X_ACTIVE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.X_ACTIVE { PARAM_VALUE.X_ACTIVE } {
	# Procedure called to validate X_ACTIVE
	return true
}

proc update_PARAM_VALUE.X_BLANKING { PARAM_VALUE.X_BLANKING } {
	# Procedure called to update X_BLANKING when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.X_BLANKING { PARAM_VALUE.X_BLANKING } {
	# Procedure called to validate X_BLANKING
	return true
}

proc update_PARAM_VALUE.Y_ACTIVE { PARAM_VALUE.Y_ACTIVE } {
	# Procedure called to update Y_ACTIVE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.Y_ACTIVE { PARAM_VALUE.Y_ACTIVE } {
	# Procedure called to validate Y_ACTIVE
	return true
}

proc update_PARAM_VALUE.Y_BLANKING { PARAM_VALUE.Y_BLANKING } {
	# Procedure called to update Y_BLANKING when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.Y_BLANKING { PARAM_VALUE.Y_BLANKING } {
	# Procedure called to validate Y_BLANKING
	return true
}


proc update_MODELPARAM_VALUE.Y_ACTIVE { MODELPARAM_VALUE.Y_ACTIVE PARAM_VALUE.Y_ACTIVE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.Y_ACTIVE}] ${MODELPARAM_VALUE.Y_ACTIVE}
}

proc update_MODELPARAM_VALUE.Y_BLANKING { MODELPARAM_VALUE.Y_BLANKING PARAM_VALUE.Y_BLANKING } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.Y_BLANKING}] ${MODELPARAM_VALUE.Y_BLANKING}
}

proc update_MODELPARAM_VALUE.X_ACTIVE { MODELPARAM_VALUE.X_ACTIVE PARAM_VALUE.X_ACTIVE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.X_ACTIVE}] ${MODELPARAM_VALUE.X_ACTIVE}
}

proc update_MODELPARAM_VALUE.X_BLANKING { MODELPARAM_VALUE.X_BLANKING PARAM_VALUE.X_BLANKING } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.X_BLANKING}] ${MODELPARAM_VALUE.X_BLANKING}
}

