@implementation TVShelfLayoutSection

- (CGRect)itemFrameAtIndex:(int64_t)a3
{
  CGRect *v3;
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  v3 = &self->_itemFrames[a3];
  x = v3->origin.x;
  y = v3->origin.y;
  width = v3->size.width;
  height = v3->size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSectionInset:(UIEdgeInsets)a3
{
  self->_sectionInset = a3;
}

- (void)setSectionHeaderFrame:(CGRect)a3
{
  self->_sectionHeaderFrame = a3;
}

- (void)setNumberOfItems:(int64_t)numberOfItems
{
  CGRect *itemFrames;

  if (self->_numberOfItems != numberOfItems)
  {
    self->_numberOfItems = numberOfItems;
    itemFrames = self->_itemFrames;
    if (itemFrames)
    {
      free(itemFrames);
      self->_itemFrames = 0;
      numberOfItems = self->_numberOfItems;
    }
    if (numberOfItems)
      self->_itemFrames = (CGRect *)malloc_type_calloc(numberOfItems, 0x20uLL, 0x1000040E0EAB150uLL);
  }
}

- (void)setItemsBoundingFrame:(CGRect)a3
{
  self->_itemsBoundingFrame = a3;
}

- (void)setItemFrame:(CGRect)a3 atIndex:(int64_t)a4
{
  self->_itemFrames[a4] = a3;
}

- (UIEdgeInsets)sectionInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_sectionInset.top;
  left = self->_sectionInset.left;
  bottom = self->_sectionInset.bottom;
  right = self->_sectionInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (double)sectionHeaderHorizontalOffset
{
  return self->_sectionHeaderHorizontalOffset;
}

- (CGRect)sectionHeaderFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_sectionHeaderFrame.origin.x;
  y = self->_sectionHeaderFrame.origin.y;
  width = self->_sectionHeaderFrame.size.width;
  height = self->_sectionHeaderFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (int64_t)numberOfItems
{
  return self->_numberOfItems;
}

- (CGRect)lastItemFrame
{
  int64_t numberOfItems;
  CGRect *v3;
  double width;
  double height;
  double x;
  double y;
  CGRect result;

  numberOfItems = self->_numberOfItems;
  if (numberOfItems < 1)
    v3 = (CGRect *)MEMORY[0x24BDBF090];
  else
    v3 = &self->_itemFrames[numberOfItems - 1];
  width = v3->size.width;
  height = v3->size.height;
  x = v3->origin.x;
  y = v3->origin.y;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[TVShelfLayoutSection setNumberOfItems:](self, "setNumberOfItems:", 0);
  v3.receiver = self;
  v3.super_class = (Class)TVShelfLayoutSection;
  -[TVShelfLayoutSection dealloc](&v3, sel_dealloc);
}

- (CGRect)firstItemFrame
{
  CGRect *itemFrames;
  double width;
  double height;
  double x;
  double y;
  CGRect result;

  if (self->_numberOfItems < 1)
    itemFrames = (CGRect *)MEMORY[0x24BDBF090];
  else
    itemFrames = self->_itemFrames;
  width = itemFrames->size.width;
  height = itemFrames->size.height;
  x = itemFrames->origin.x;
  y = itemFrames->origin.y;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)itemsBoundingFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_itemsBoundingFrame.origin.x;
  y = self->_itemsBoundingFrame.origin.y;
  width = self->_itemsBoundingFrame.size.width;
  height = self->_itemsBoundingFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSectionHeaderHorizontalOffset:(double)a3
{
  self->_sectionHeaderHorizontalOffset = a3;
}

- (double)sectionHeaderVerticalBump
{
  return self->_sectionHeaderVerticalBump;
}

- (void)setSectionHeaderVerticalBump:(double)a3
{
  self->_sectionHeaderVerticalBump = a3;
}

@end
