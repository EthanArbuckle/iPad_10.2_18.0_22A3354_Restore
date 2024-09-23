@implementation SBIconDraggingEditContext

- (id)draggingUniqueIdentifier
{
  return self->_draggingUniqueIdentifier;
}

- (void)setDraggingUniqueIdentifier:(id)a3
{
  objc_storeStrong(&self->_draggingUniqueIdentifier, a3);
}

- (CGPoint)enteredScreenLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_enteredScreenLocation.x;
  y = self->_enteredScreenLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setEnteredScreenLocation:(CGPoint)a3
{
  self->_enteredScreenLocation = a3;
}

- (BOOL)enteredScreenLocationNeedsUpdate
{
  return self->_enteredScreenLocationNeedsUpdate;
}

- (void)setEnteredScreenLocationNeedsUpdate:(BOOL)a3
{
  self->_enteredScreenLocationNeedsUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_draggingUniqueIdentifier, 0);
}

@end
