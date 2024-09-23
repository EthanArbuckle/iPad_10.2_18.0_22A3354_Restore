@implementation THAspectFitImageView

- (THAspectFitImageView)initWithFrame:(CGRect)a3
{
  THAspectFitImageView *v3;
  THAspectFitImageView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)THAspectFitImageView;
  v3 = -[THAspectFitImageView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[THAspectFitImageView setContentMode:](v3, "setContentMode:", 1);
  return v4;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  objc_super v16;
  CGSize result;

  v16.receiver = self;
  v16.super_class = (Class)THAspectFitImageView;
  -[THAspectFitImageView intrinsicContentSize](&v16, "intrinsicContentSize");
  v4 = v3;
  v6 = v5;
  v7 = -[THAspectFitImageView image](self, "image");
  if (v7)
  {
    objc_msgSend(v7, "size");
    v9 = v8;
    v11 = v10;
    -[THAspectFitImageView preferredMaxLayoutHeight](self, "preferredMaxLayoutHeight");
    v13 = v12 / v11;
    v4 = ceil(v9 * v13);
    v6 = ceil(v11 * v13);
  }
  v14 = v4;
  v15 = v6;
  result.height = v15;
  result.width = v14;
  return result;
}

- (double)preferredMaxLayoutHeight
{
  return self->_preferredMaxLayoutHeight;
}

- (void)setPreferredMaxLayoutHeight:(double)a3
{
  self->_preferredMaxLayoutHeight = a3;
}

@end
