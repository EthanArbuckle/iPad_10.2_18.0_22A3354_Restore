@implementation TUIRatingsBoxLayout

- (TUIRatingsBoxLayout)initWithModel:(id)a3 parent:(id)a4 controller:(id)a5
{
  TUIRatingsBoxLayout *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TUIRatingsBoxLayout;
  result = -[TUILayout initWithModel:parent:controller:](&v6, "initWithModel:parent:controller:", a3, a4, a5);
  if (result)
    result->_intrinsicContentSize = CGSizeZero;
  return result;
}

- (void)_computeIntrinsicContentSize
{
  double height;
  CGSize *p_intrinsicContentSize;
  CGFloat v5;
  CGFloat v6;
  id v7;

  height = CGSizeZero.height;
  p_intrinsicContentSize = &self->_intrinsicContentSize;
  if (CGSizeZero.width == self->_intrinsicContentSize.width && height == self->_intrinsicContentSize.height)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[TUILayout box](self, "box", CGSizeZero.width, height));
    +[TUIRatingsBox imageSizeForSize:](TUIRatingsBox, "imageSizeForSize:", objc_msgSend(v7, "size"));
    p_intrinsicContentSize->width = v5;
    p_intrinsicContentSize->height = v6;

  }
}

- (void)invalidateIntrinsicSize
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)TUIRatingsBoxLayout;
  -[TUILayout invalidateIntrinsicSize](&v2, "invalidateIntrinsicSize");
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicWidth
{
  double width;
  unsigned int v5;
  uint64_t v7;

  -[TUIRatingsBoxLayout _computeIntrinsicContentSize](self, "_computeIntrinsicContentSize");
  width = self->_intrinsicContentSize.width;
  if (width <= -3.40282347e38)
  {
    v7 = 4286578687;
  }
  else
  {
    if (width < 3.40282347e38)
    {
      *(float *)&v5 = width;
      return ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v5 | 0x7FC0000000000000);
    }
    v7 = 2139095039;
  }
  return ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v7 & 0xFFFFFFFFFFFFLL | 0x7FC0000000000000);
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)computeIntrinsicHeight
{
  double height;
  unsigned int v5;
  uint64_t v7;

  -[TUIRatingsBoxLayout _computeIntrinsicContentSize](self, "_computeIntrinsicContentSize");
  height = self->_intrinsicContentSize.height;
  if (height <= -3.40282347e38)
  {
    v7 = 4286578687;
  }
  else
  {
    if (height < 3.40282347e38)
    {
      *(float *)&v5 = height;
      return ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v5 | 0x7FC0000000000000);
    }
    v7 = 2139095039;
  }
  return ($881BB7C90C7D0DFCC1492E3DC022A30F *)(v7 & 0xFFFFFFFFFFFFLL | 0x7FC0000000000000);
}

- (double)computeIntrinsicAspectRatio
{
  double width;
  double result;

  -[TUIRatingsBoxLayout _computeIntrinsicContentSize](self, "_computeIntrinsicContentSize");
  width = self->_intrinsicContentSize.width;
  result = 1.0;
  if (width > 0.0)
    return self->_intrinsicContentSize.height / width;
  return result;
}

- (void)computeLayout
{
  double v3;
  double v4;
  double v5;

  -[TUILayout computeWidth](self, "computeWidth");
  v4 = v3;
  -[TUILayout computeHeight](self, "computeHeight");
  -[TUILayout setComputedNaturalSize:](self, "setComputedNaturalSize:", fmax(v4, 1.0), fmax(v5, 1.0));
}

@end
