@implementation _UIStatusBarDisplayItemPlacementLocationGroup

- (_UIStatusBarDisplayItemPlacement)regularPlacement
{
  return self->_regularPlacement;
}

- (void)setRegularPlacement:(id)a3
{
  objc_storeStrong((id *)&self->_regularPlacement, a3);
}

- (_UIStatusBarDisplayItemPlacement)prominentPlacement
{
  return self->_prominentPlacement;
}

- (void)setProminentPlacement:(id)a3
{
  objc_storeStrong((id *)&self->_prominentPlacement, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prominentPlacement, 0);
  objc_storeStrong((id *)&self->_regularPlacement, 0);
}

@end
