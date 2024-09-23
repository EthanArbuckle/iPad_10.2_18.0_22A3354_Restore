@implementation SBWindowDragSwitcherModifierEvent

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBWindowDragSwitcherModifierEvent;
  result = -[SBGestureSwitcherModifierEvent copyWithZone:](&v5, sel_copyWithZone_, a3);
  *((_BYTE *)result + 152) = self->_draggingFromContinuousExposeStrips;
  *((_OWORD *)result + 10) = self->_locationInSelectedDisplayItem;
  *((_OWORD *)result + 11) = self->_sizeOfSelectedDisplayItem;
  return result;
}

- (BOOL)isWindowDragGestureEvent
{
  return 1;
}

- (BOOL)isDraggingFromContinuousExposeStrips
{
  return self->_draggingFromContinuousExposeStrips;
}

- (void)setDraggingFromContinuousExposeStrips:(BOOL)a3
{
  self->_draggingFromContinuousExposeStrips = a3;
}

- (CGPoint)locationInSelectedDisplayItem
{
  double x;
  double y;
  CGPoint result;

  x = self->_locationInSelectedDisplayItem.x;
  y = self->_locationInSelectedDisplayItem.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLocationInSelectedDisplayItem:(CGPoint)a3
{
  self->_locationInSelectedDisplayItem = a3;
}

- (CGSize)sizeOfSelectedDisplayItem
{
  double width;
  double height;
  CGSize result;

  width = self->_sizeOfSelectedDisplayItem.width;
  height = self->_sizeOfSelectedDisplayItem.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSizeOfSelectedDisplayItem:(CGSize)a3
{
  self->_sizeOfSelectedDisplayItem = a3;
}

@end
