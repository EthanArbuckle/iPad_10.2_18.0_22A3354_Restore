@implementation TVShelfViewLayoutInvalidationContext

- (BOOL)invalidateLayout
{
  return self->_invalidateLayout;
}

- (void)setInvalidateLayout:(BOOL)a3
{
  self->_invalidateLayout = a3;
}

- (BOOL)invalidateVerticalBumps
{
  return self->_invalidateVerticalBumps;
}

- (void)setInvalidateVerticalBumps:(BOOL)a3
{
  self->_invalidateVerticalBumps = a3;
}

- (NSIndexPath)focusedItemIndexPath
{
  return self->_focusedItemIndexPath;
}

- (void)setFocusedItemIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_focusedItemIndexPath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusedItemIndexPath, 0);
}

@end
