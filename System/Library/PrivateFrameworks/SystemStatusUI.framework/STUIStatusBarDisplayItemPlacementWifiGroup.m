@implementation STUIStatusBarDisplayItemPlacementWifiGroup

- (void)setSignalStrengthPlacement:(id)a3
{
  objc_storeStrong((id *)&self->_signalStrengthPlacement, a3);
}

- (void)setIconPlacement:(id)a3
{
  objc_storeStrong((id *)&self->_iconPlacement, a3);
}

- (STUIStatusBarDisplayItemPlacement)signalStrengthPlacement
{
  return self->_signalStrengthPlacement;
}

- (STUIStatusBarDisplayItemPlacement)iconPlacement
{
  return self->_iconPlacement;
}

- (void)setRawPlacement:(id)a3
{
  objc_storeStrong((id *)&self->_rawPlacement, a3);
}

- (STUIStatusBarDisplayItemPlacement)rawPlacement
{
  return self->_rawPlacement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawPlacement, 0);
  objc_storeStrong((id *)&self->_iconPlacement, 0);
  objc_storeStrong((id *)&self->_signalStrengthPlacement, 0);
}

@end
