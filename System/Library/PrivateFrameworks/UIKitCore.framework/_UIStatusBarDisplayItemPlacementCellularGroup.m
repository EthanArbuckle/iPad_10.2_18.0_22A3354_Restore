@implementation _UIStatusBarDisplayItemPlacementCellularGroup

- (_UIStatusBarDisplayItemPlacement)signalStrengthPlacement
{
  return self->_signalStrengthPlacement;
}

- (void)setSignalStrengthPlacement:(id)a3
{
  objc_storeStrong((id *)&self->_signalStrengthPlacement, a3);
}

- (_UIStatusBarDisplayItemPlacement)warningPlacement
{
  return self->_warningPlacement;
}

- (void)setWarningPlacement:(id)a3
{
  objc_storeStrong((id *)&self->_warningPlacement, a3);
}

- (_UIStatusBarDisplayItemPlacement)typePlacement
{
  return self->_typePlacement;
}

- (void)setTypePlacement:(id)a3
{
  objc_storeStrong((id *)&self->_typePlacement, a3);
}

- (_UIStatusBarDisplayItemPlacement)namePlacement
{
  return self->_namePlacement;
}

- (void)setNamePlacement:(id)a3
{
  objc_storeStrong((id *)&self->_namePlacement, a3);
}

- (_UIStatusBarDisplayItemPlacement)callForwardingPlacement
{
  return self->_callForwardingPlacement;
}

- (void)setCallForwardingPlacement:(id)a3
{
  objc_storeStrong((id *)&self->_callForwardingPlacement, a3);
}

- (_UIStatusBarDisplayItemPlacement)badgePlacement
{
  return self->_badgePlacement;
}

- (void)setBadgePlacement:(id)a3
{
  objc_storeStrong((id *)&self->_badgePlacement, a3);
}

- (_UIStatusBarDisplayItemPlacement)rawPlacement
{
  return self->_rawPlacement;
}

- (void)setRawPlacement:(id)a3
{
  objc_storeStrong((id *)&self->_rawPlacement, a3);
}

- (_UIStatusBarDisplayItemPlacement)dualSignalStrengthPlacement
{
  return self->_dualSignalStrengthPlacement;
}

- (void)setDualSignalStrengthPlacement:(id)a3
{
  objc_storeStrong((id *)&self->_dualSignalStrengthPlacement, a3);
}

- (_UIStatusBarDisplayItemPlacement)dualNamePlacement
{
  return self->_dualNamePlacement;
}

- (void)setDualNamePlacement:(id)a3
{
  objc_storeStrong((id *)&self->_dualNamePlacement, a3);
}

- (_UIStatusBarDisplayItemPlacement)dualNameAndTypePlacement
{
  return self->_dualNameAndTypePlacement;
}

- (void)setDualNameAndTypePlacement:(id)a3
{
  objc_storeStrong((id *)&self->_dualNameAndTypePlacement, a3);
}

- (NSArray)placementsAffectedByAirplaneMode
{
  return self->_placementsAffectedByAirplaneMode;
}

- (void)setPlacementsAffectedByAirplaneMode:(id)a3
{
  objc_storeStrong((id *)&self->_placementsAffectedByAirplaneMode, a3);
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

@end
