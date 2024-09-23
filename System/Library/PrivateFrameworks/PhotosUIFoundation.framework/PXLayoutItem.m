@implementation PXLayoutItem

- (PXLayoutItem)init
{
  return -[PXLayoutItem initWithSize:weight:](self, "initWithSize:weight:", *MEMORY[0x24BDBF148], *(double *)(MEMORY[0x24BDBF148] + 8), 0.0);
}

- (PXLayoutItem)initWithSize:(CGSize)a3 weight:(double)a4
{
  CGFloat height;
  CGFloat width;
  PXLayoutItem *result;
  objc_super v8;

  height = a3.height;
  width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)PXLayoutItem;
  result = -[PXLayoutItem init](&v8, sel_init);
  if (result)
  {
    result->_size.width = width;
    result->_size.height = height;
    result->_weight = a4;
    result->_preferredCropRect.origin = (CGPoint)PXRectUnit;
    result->_preferredCropRect.size = (CGSize)unk_24438BAA0;
    result->_acceptableCropRect.origin = (CGPoint)PXRectUnit;
    result->_acceptableCropRect.size = (CGSize)unk_24438BAA0;
  }
  return result;
}

- (double)weightUsingCriterion:(int64_t)a3
{
  return self->_weight;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (double)weight
{
  return self->_weight;
}

- (void)setWeight:(double)a3
{
  self->_weight = a3;
}

- (CGAffineTransform)transform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].tx;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[2].c;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[3].a;
  return self;
}

- (void)setTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_transform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_transform.tx = v4;
  *(_OWORD *)&self->_transform.a = v3;
}

- (CGPoint)positionOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_positionOffset.x;
  y = self->_positionOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPositionOffset:(CGPoint)a3
{
  self->_positionOffset = a3;
}

- (CGRect)preferredCropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_preferredCropRect.origin.x;
  y = self->_preferredCropRect.origin.y;
  width = self->_preferredCropRect.size.width;
  height = self->_preferredCropRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setPreferredCropRect:(CGRect)a3
{
  self->_preferredCropRect = a3;
}

- (CGRect)acceptableCropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_acceptableCropRect.origin.x;
  y = self->_acceptableCropRect.origin.y;
  width = self->_acceptableCropRect.size.width;
  height = self->_acceptableCropRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setAcceptableCropRect:(CGRect)a3
{
  self->_acceptableCropRect = a3;
}

@end
