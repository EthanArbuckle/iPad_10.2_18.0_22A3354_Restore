@implementation PKRightAngleRotatingView

- (PKRightAngleRotatingView)initWithRotatedView:(id)a3
{
  id v5;
  PKRightAngleRotatingView *v6;
  PKRightAngleRotatingView *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKRightAngleRotatingView;
  v6 = -[PKRightAngleRotatingView init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_rotatedView, a3);
    -[PKRightAngleRotatingView addSubview:](v7, "addSubview:", v5);
    v7->_orientation = 0;
    -[PKRightAngleRotatingView updateTransform](v7, "updateTransform");
  }

  return v7;
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
  -[PKRightAngleRotatingView updateTransform](self, "updateTransform");
}

- (void)updateTransform
{
  int64_t orientation;
  CGFloat v4;
  __int128 v5;
  double v6;
  CGFloat v7;
  double v8;
  UIView *rotatedView;
  CGAffineTransform v10;
  CGAffineTransform v11;
  CGAffineTransform v12;

  orientation = self->_orientation;
  v4 = 0.0;
  if ((unint64_t)(orientation - 1) <= 6)
    v4 = dbl_19DF14E28[orientation - 1];
  memset(&v12, 0, sizeof(v12));
  v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v11.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v11.c = v5;
  *(_OWORD *)&v11.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  CGAffineTransformRotate(&v12, &v11, v4);
  if ((unint64_t)(orientation - 4) < 2)
  {
    -[UIView bounds](self->_rotatedView, "bounds");
    v7 = v8;
    goto LABEL_7;
  }
  if ((unint64_t)(orientation - 6) < 2)
  {
    -[UIView bounds](self->_rotatedView, "bounds");
    v7 = v6;
LABEL_7:
    v10 = v12;
    CGAffineTransformTranslate(&v11, &v10, v7, 0.0);
    v12 = v11;
    v10 = v11;
    CGAffineTransformScale(&v11, &v10, -1.0, 1.0);
    v12 = v11;
  }
  *(CGAffineTransform *)_transform = v12;
  rotatedView = self->_rotatedView;
  v11 = v12;
  -[UIView setTransform:](rotatedView, "setTransform:", &v11);
  -[PKRightAngleRotatingView setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)_dimensionsAreRotated
{
  return ((self->_orientation - 2) & 0xFFFFFFFFFFFFFFFALL) == 0;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[UIView sizeThatFits:](self->_rotatedView, "sizeThatFits:", a3.height * *(double *)&_transform[16] + *(double *)_transform * a3.width, a3.height * *(double *)&_transform[24] + *(double *)&_transform[8] * a3.width);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)sizeToFit
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGAffineTransform v7;
  CGAffineTransform v8;

  -[UIView sizeToFit](self->_rotatedView, "sizeToFit");
  -[UIView bounds](self->_rotatedView, "bounds");
  v4 = v3;
  v6 = v5;
  v7 = *(CGAffineTransform *)_transform;
  CGAffineTransformInvert(&v8, &v7);
  -[PKRightAngleRotatingView setBounds:](self, "setBounds:", 0.0, 0.0, v6 * v8.c + v8.a * v4, v6 * v8.d + v8.b * v4);
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  -[UIView intrinsicContentSize](self->_rotatedView, "intrinsicContentSize");
  v4 = v2 * *(double *)&_transform[16] + *(double *)_transform * v3;
  v5 = v2 * *(double *)&_transform[24] + *(double *)&_transform[8] * v3;
  v6 = v4;
  result.height = v5;
  result.width = v6;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  _BOOL4 v7;
  double v8;
  double v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PKRightAngleRotatingView;
  -[PKRightAngleRotatingView layoutSubviews](&v10, sel_layoutSubviews);
  -[PKRightAngleRotatingView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v7 = -[PKRightAngleRotatingView _dimensionsAreRotated](self, "_dimensionsAreRotated");
  if (v7)
    v8 = v6;
  else
    v8 = v4;
  if (v7)
    v9 = v4;
  else
    v9 = v6;
  -[UIView setBounds:](self->_rotatedView, "setBounds:", 0.0, 0.0, v8, v9);
  -[UIView setCenter:](self->_rotatedView, "setCenter:", v4 * 0.5, v6 * 0.5);
}

- (UIView)rotatedView
{
  return self->_rotatedView;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rotatedView, 0);
}

@end
