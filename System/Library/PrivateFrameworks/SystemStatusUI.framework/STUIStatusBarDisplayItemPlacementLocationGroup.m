@implementation STUIStatusBarDisplayItemPlacementLocationGroup

- (STUIStatusBarDisplayItemPlacement)regularPlacement
{
  return self->_regularPlacement;
}

- (STUIStatusBarDisplayItemPlacement)prominentPlacement
{
  return self->_prominentPlacement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prominentPlacement, 0);
  objc_storeStrong((id *)&self->_regularPlacement, 0);
}

- (void)setRegularPlacement:(id)a3
{
  objc_storeStrong((id *)&self->_regularPlacement, a3);
}

- (void)setProminentPlacement:(id)a3
{
  objc_storeStrong((id *)&self->_prominentPlacement, a3);
}

@end
