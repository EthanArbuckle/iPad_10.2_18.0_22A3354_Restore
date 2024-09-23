@implementation STUIStatusBarDisplayItemPlacementCellularGroup

- (STUIStatusBarDisplayItemPlacement)typePlacement
{
  return self->_typePlacement;
}

- (STUIStatusBarDisplayItemPlacement)dualNameAndTypePlacement
{
  return self->_dualNameAndTypePlacement;
}

- (STUIStatusBarDisplayItemPlacement)badgePlacement
{
  return self->_badgePlacement;
}

- (STUIStatusBarDisplayItemPlacement)warningPlacement
{
  return self->_warningPlacement;
}

- (STUIStatusBarDisplayItemPlacement)signalStrengthPlacement
{
  return self->_signalStrengthPlacement;
}

- (STUIStatusBarDisplayItemPlacement)rawPlacement
{
  return self->_rawPlacement;
}

- (STUIStatusBarDisplayItemPlacement)namePlacement
{
  return self->_namePlacement;
}

- (STUIStatusBarDisplayItemPlacement)callForwardingPlacement
{
  return self->_callForwardingPlacement;
}

- (void)setBadgePlacement:(id)a3
{
  objc_storeStrong((id *)&self->_badgePlacement, a3);
}

- (STUIStatusBarDisplayItemPlacement)dualSignalStrengthPlacement
{
  return self->_dualSignalStrengthPlacement;
}

- (STUIStatusBarDisplayItemPlacement)dualNamePlacement
{
  return self->_dualNamePlacement;
}

- (void)setWarningPlacement:(id)a3
{
  objc_storeStrong((id *)&self->_warningPlacement, a3);
}

- (void)setTypePlacement:(id)a3
{
  objc_storeStrong((id *)&self->_typePlacement, a3);
}

- (void)setSignalStrengthPlacement:(id)a3
{
  objc_storeStrong((id *)&self->_signalStrengthPlacement, a3);
}

- (void)setRawPlacement:(id)a3
{
  objc_storeStrong((id *)&self->_rawPlacement, a3);
}

- (void)setPlacementsAffectedByAirplaneMode:(id)a3
{
  objc_storeStrong((id *)&self->_placementsAffectedByAirplaneMode, a3);
}

- (void)setNamePlacement:(id)a3
{
  objc_storeStrong((id *)&self->_namePlacement, a3);
}

- (void)setCallForwardingPlacement:(id)a3
{
  objc_storeStrong((id *)&self->_callForwardingPlacement, a3);
}

- (NSArray)placementsAffectedByAirplaneMode
{
  return self->_placementsAffectedByAirplaneMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placementsAffectedByAirplaneMode, 0);
  objc_storeStrong((id *)&self->_dualNameAndTypePlacement, 0);
  objc_storeStrong((id *)&self->_dualNamePlacement, 0);
  objc_storeStrong((id *)&self->_dualSignalStrengthPlacement, 0);
  objc_storeStrong((id *)&self->_rawPlacement, 0);
  objc_storeStrong((id *)&self->_badgePlacement, 0);
  objc_storeStrong((id *)&self->_callForwardingPlacement, 0);
  objc_storeStrong((id *)&self->_namePlacement, 0);
  objc_storeStrong((id *)&self->_typePlacement, 0);
  objc_storeStrong((id *)&self->_warningPlacement, 0);
  objc_storeStrong((id *)&self->_signalStrengthPlacement, 0);
}

- (void)setDualSignalStrengthPlacement:(id)a3
{
  objc_storeStrong((id *)&self->_dualSignalStrengthPlacement, a3);
}

- (void)setDualNamePlacement:(id)a3
{
  objc_storeStrong((id *)&self->_dualNamePlacement, a3);
}

- (void)setDualNameAndTypePlacement:(id)a3
{
  objc_storeStrong((id *)&self->_dualNameAndTypePlacement, a3);
}

@end
