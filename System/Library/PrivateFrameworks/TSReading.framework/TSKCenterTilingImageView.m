@implementation TSKCenterTilingImageView

- (void)setLeftCapImage:(id)a3
{
  id v5;

  if (self->mLeftCapImage != a3)
  {
    v5 = a3;

    self->mLeftCapImage = (UIImage *)a3;
    -[TSKCenterTilingImageView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setCenterTileImage:(id)a3
{
  id v5;

  if (self->mCenterTileImage != a3)
  {
    v5 = a3;

    self->mCenterTileImage = (UIImage *)a3;
    -[TSKCenterTilingImageView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)setRightCapImage:(id)a3
{
  id v5;

  if (self->mRightCapImage != a3)
  {
    v5 = a3;

    self->mRightCapImage = (UIImage *)a3;
    -[TSKCenterTilingImageView setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSKCenterTilingImageView;
  -[TSKCenterTilingImageView dealloc](&v3, sel_dealloc);
}

- (void)drawRect:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double MaxX;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect v16;

  -[TSKCenterTilingImageView bounds](self, "bounds", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  v7 = v6;
  -[TSKCenterTilingImageView bounds](self, "bounds");
  MaxX = CGRectGetMaxX(v16);
  -[UIImage size](self->mRightCapImage, "size");
  v10 = MaxX - v9;
  -[UIImage size](self->mLeftCapImage, "size");
  v12 = v5 + v11;
  v13 = v10 - (v5 + v11);
  -[TSKCenterTilingImageView bounds](self, "bounds");
  v15 = v14;
  -[UIImage drawAtPoint:](self->mLeftCapImage, "drawAtPoint:", v5, v7);
  -[UIImage drawAsPatternInRect:](self->mCenterTileImage, "drawAsPatternInRect:", v12, v7, v13, v15);
  -[UIImage drawAtPoint:](self->mRightCapImage, "drawAtPoint:", v10, v7);
}

- (UIImage)leftCapImage
{
  return self->mLeftCapImage;
}

- (UIImage)centerTileImage
{
  return self->mCenterTileImage;
}

- (UIImage)rightCapImage
{
  return self->mRightCapImage;
}

@end
