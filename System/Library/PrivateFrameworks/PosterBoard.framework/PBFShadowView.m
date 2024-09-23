@implementation PBFShadowView

- (CGRect)frameWithContentWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (-[PBFShadowView shadowType](self, "shadowType") == 1)
  {
    -[UIView frameWithContentWithFrame:](self->_shadowView, "frameWithContentWithFrame:", x, y, width, height);
    x = v8;
    y = v9;
    width = v10;
    height = v11;
  }
  v12 = x;
  v13 = y;
  v14 = width;
  v15 = height;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGAffineTransform)shadowSupplementaryTransform
{
  CGAffineTransform *result;
  uint64_t v5;
  __int128 v6;

  result = -[PBFShadowView shadowType](self, "shadowType");
  if (result == (CGAffineTransform *)2)
    return CGAffineTransformMakeScale(retstr, 0.25, 0.25);
  v5 = MEMORY[0x1E0C9BAA8];
  v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->c = v6;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v5 + 32);
  return result;
}

- (void)setCornerRadius:(double)a3
{
  void *v5;
  void *v6;

  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_cornerRadius = a3;
    -[PBFShadowView layer](self, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCornerRadius:", a3);

    -[PBFShadowView layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);

    -[PBFShadowView _configureForShadowType](self, "_configureForShadowType");
  }
}

- (void)setShadowType:(int64_t)a3
{
  if (self->_shadowType != a3)
  {
    self->_shadowType = a3;
    -[PBFShadowView _configureForShadowType](self, "_configureForShadowType");
  }
}

- (void)layoutSubviews
{
  UIView *shadowView;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PBFShadowView;
  -[PBFShadowView layoutSubviews](&v4, sel_layoutSubviews);
  shadowView = self->_shadowView;
  -[PBFShadowView bounds](self, "bounds");
  -[UIView setFrame:](shadowView, "setFrame:");
}

- (void)_configureForShadowType
{
  UIView *shadowView;
  int64_t shadowType;
  double cornerRadius;
  id v6;
  double v7;
  UIView *v8;
  UIView *v9;
  id v10;
  UIView *v11;
  void *v12;
  id v13;
  double v14;
  UIView *v15;
  _QWORD v16[4];

  -[UIView removeFromSuperview](self->_shadowView, "removeFromSuperview");
  shadowView = self->_shadowView;
  self->_shadowView = 0;

  shadowType = self->_shadowType;
  if (shadowType == 2)
  {
    v10 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[PBFShadowView bounds](self, "bounds");
    v11 = (UIView *)objc_msgSend(v10, "initWithFrame:");
    -[UIView layer](v11, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setShadowPathIsBounds:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v12, "setShadowColor:", objc_msgSend(v13, "CGColor"));

    objc_msgSend(v12, "setShadowOffset:", 0.0, self->_cornerRadius);
    objc_msgSend(v12, "setShadowRadius:", self->_cornerRadius);
    LODWORD(v14) = 1041865114;
    objc_msgSend(v12, "setShadowOpacity:", v14);
    objc_msgSend(v12, "setCornerRadius:", self->_cornerRadius);
    objc_msgSend(v12, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);
    v15 = self->_shadowView;
    self->_shadowView = v11;

  }
  else if (shadowType == 1)
  {
    cornerRadius = self->_cornerRadius;
    v6 = objc_alloc(MEMORY[0x1E0D474A0]);
    v7 = self->_cornerRadius;
    v16[0] = 1065353216;
    v16[1] = 0;
    *(double *)&v16[2] = cornerRadius;
    *(double *)&v16[3] = cornerRadius;
    v8 = (UIView *)objc_msgSend(v6, "initWithShadowAttributes:maskCornerRadius:continuousCorners:", v16, 1, v7);
    v9 = self->_shadowView;
    self->_shadowView = v8;

  }
  -[PBFShadowView addSubview:](self, "addSubview:", self->_shadowView);
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (int64_t)shadowType
{
  return self->_shadowType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowView, 0);
}

@end
