@implementation SBSwitcherSnapshotImageView

- (void)setHasOpaqueContents:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  if (self->_hasOpaqueContents != a3)
  {
    v3 = a3;
    self->_hasOpaqueContents = a3;
    -[SBSwitcherSnapshotImageView layer](self, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setContentsOpaque:", self->_hasOpaqueContents);

    -[UIImageView layer](self->_imageView, "layer");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setContentsOpaque:", v3);

  }
}

- (void)setAllowsEdgeAntialiasing:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_allowsEdgeAntialiasing != a3)
  {
    v3 = a3;
    self->_allowsEdgeAntialiasing = a3;
    -[UIImageView layer](self->_imageView, "layer");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAllowsEdgeAntialiasing:", v3);

  }
}

- (UIImage)image
{
  return -[UIImageView image](self->_imageView, "image");
}

- (void)setUsesNonuniformScaling:(BOOL)a3
{
  self->_usesNonuniformScaling = a3;
}

- (void)setStretchToFillBounds:(BOOL)a3
{
  if (self->_stretchToFillBounds != a3)
  {
    self->_stretchToFillBounds = a3;
    -[SBSwitcherSnapshotImageView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  UIView *scalingView;
  UIImageView *imageView;
  UIView *v13;
  CGAffineTransform v14;
  CGAffineTransform v15;
  CGAffineTransform v16;
  CGRect v17;
  CGRect v18;

  -[SBSwitcherSnapshotImageView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIView setBounds:](self->_scalingView, "setBounds:");
  scalingView = self->_scalingView;
  UIRectGetCenter();
  -[UIView setCenter:](scalingView, "setCenter:");
  -[UIImageView sizeToFit](self->_imageView, "sizeToFit");
  memset(&v16, 0, sizeof(v16));
  -[SBSwitcherSnapshotImageView scalingTransform](self, "scalingTransform");
  if (self->_stretchToFillBounds)
  {
    v14 = v16;
    memset(&v15, 0, sizeof(v15));
    CGAffineTransformInvert(&v15, &v14);
    v14 = v15;
    v17.origin.x = v4;
    v17.origin.y = v6;
    v17.size.width = v8;
    v17.size.height = v10;
    v18 = CGRectApplyAffineTransform(v17, &v14);
    -[UIImageView setBounds:](self->_imageView, "setBounds:", v18.origin.x, v18.origin.y, v18.size.width, v18.size.height);
  }
  imageView = self->_imageView;
  -[UIView center](self->_scalingView, "center");
  -[UIImageView setCenter:](imageView, "setCenter:");
  v13 = self->_scalingView;
  v15 = v16;
  -[UIView setTransform:](v13, "setTransform:", &v15);
  -[SBSwitcherSnapshotImageView _updateCornerRadius](self, "_updateCornerRadius");
}

- (void)_updateCornerRadius
{
  UIImageView *imageView;
  __int128 v4;
  double v5;
  double v6;
  UIImageView *v7;
  int64_t orientationForClassicLayout;
  void *v9;
  _OWORD v10[3];

  imageView = self->_imageView;
  v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v10[0] = *MEMORY[0x1E0C9BAA8];
  v10[1] = v4;
  v10[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  -[UIImageView setTransform:](imageView, "setTransform:", v10);
  -[SBSwitcherSnapshotImageView _transformScale](self, "_transformScale");
  v6 = 1.0 / v5 * self->_cornerRadius;
  if (-[SBSwitcherSnapshotImageView _isUsingExternalClassicLayout](self, "_isUsingExternalClassicLayout"))
  {
    if (SBFEffectiveHomeButtonType() == 2)
    {
      v7 = self->_imageView;
      orientationForClassicLayout = self->_orientationForClassicLayout;
      -[SBSwitcherSnapshotImageView _transformScale](self, "_transformScale");
      -[UIImageView sbClassicLayout_applyTransformsForClassicPresentationInLayoutSpaceForInterfaceOrientation:withInheritedScaleFromContainer:applyInheritedScaleToTranslationAndCorners:allowStatusBarToOverlap:useDeviceCornerRadius:](v7, "sbClassicLayout_applyTransformsForClassicPresentationInLayoutSpaceForInterfaceOrientation:withInheritedScaleFromContainer:applyInheritedScaleToTranslationAndCorners:allowStatusBarToOverlap:useDeviceCornerRadius:", orientationForClassicLayout, 1, self->_allowStatusBarToOverlap, self->_cornerRadius > 5.0);
    }
  }
  else
  {
    -[UIImageView _setContinuousCornerRadius:](self->_imageView, "_setContinuousCornerRadius:", v6);
    -[UIImageView layer](self->_imageView, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setMaskedCorners:", self->_maskedCorners);

  }
}

- (double)_transformScale
{
  double v3;
  double v4;
  double result;

  -[SBSwitcherSnapshotImageView _transformHorizontalScale](self, "_transformHorizontalScale");
  v4 = v3;
  -[SBSwitcherSnapshotImageView _transformVerticalScale](self, "_transformVerticalScale");
  if (v4 < result)
    return v4;
  return result;
}

- (CGAffineTransform)scalingTransform
{
  double v5;
  CGFloat v6;
  CGFloat v7;

  if (-[SBSwitcherSnapshotImageView usesNonuniformScaling](self, "usesNonuniformScaling"))
  {
    -[SBSwitcherSnapshotImageView _transformHorizontalScale](self, "_transformHorizontalScale");
    v6 = v5;
    -[SBSwitcherSnapshotImageView _transformVerticalScale](self, "_transformVerticalScale");
  }
  else
  {
    -[SBSwitcherSnapshotImageView _transformScale](self, "_transformScale");
    v6 = v7;
  }
  return CGAffineTransformMakeScale(retstr, v6, v7);
}

- (double)_transformVerticalScale
{
  double Height;
  char IsZero;
  double result;
  CGRect v6;
  CGRect v7;

  -[UIImageView bounds](self->_imageView, "bounds");
  Height = CGRectGetHeight(v6);
  IsZero = BSFloatIsZero();
  result = 1.0;
  if ((IsZero & 1) == 0)
  {
    -[SBSwitcherSnapshotImageView bounds](self, "bounds", 1.0);
    return CGRectGetHeight(v7) / Height;
  }
  return result;
}

- (double)_transformHorizontalScale
{
  double Width;
  char IsZero;
  double result;
  CGRect v6;
  CGRect v7;

  -[UIImageView bounds](self->_imageView, "bounds");
  Width = CGRectGetWidth(v6);
  IsZero = BSFloatIsZero();
  result = 1.0;
  if ((IsZero & 1) == 0)
  {
    -[SBSwitcherSnapshotImageView bounds](self, "bounds", 1.0);
    return CGRectGetWidth(v7) / Width;
  }
  return result;
}

- (BOOL)usesNonuniformScaling
{
  return self->_usesNonuniformScaling;
}

- (BOOL)_isUsingExternalClassicLayout
{
  return self->_orientationForClassicLayout != 0;
}

- (SBSwitcherSnapshotImageView)initWithImage:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  SBSwitcherSnapshotImageView *v9;
  SBSwitcherSnapshotImageView *v10;
  uint64_t v11;
  UIView *scalingView;
  uint64_t v13;
  UIImageView *imageView;
  void *v15;
  void *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SBSwitcherSnapshotImageView;
  v5 = *MEMORY[0x1E0C9D648];
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v9 = -[SBSwitcherSnapshotImageView initWithFrame:](&v18, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v6, v7, v8);
  v10 = v9;
  if (v9)
  {
    v9->_maskedCorners = 15;
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v5, v6, v7, v8);
    scalingView = v10->_scalingView;
    v10->_scalingView = (UIView *)v11;

    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v4);
    imageView = v10->_imageView;
    v10->_imageView = (UIImageView *)v13;

    -[UIImageView setClipsToBounds:](v10->_imageView, "setClipsToBounds:", 1);
    -[SBSwitcherSnapshotImageView addSubview:](v10, "addSubview:", v10->_scalingView);
    -[UIView addSubview:](v10->_scalingView, "addSubview:", v10->_imageView);
    -[SBSwitcherSnapshotImageView layer](v10, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setAllowsEdgeAntialiasing:", 0);

    -[UIImageView layer](v10->_imageView, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAllowsEdgeAntialiasing:", 0);

    -[SBSwitcherSnapshotImageView setHasOpaqueContents:](v10, "setHasOpaqueContents:", 1);
    -[SBSwitcherSnapshotImageView layoutSubviews](v10, "layoutSubviews");
  }

  return v10;
}

- (void)setImage:(id)a3
{
  -[UIImageView setImage:](self->_imageView, "setImage:", a3);
  -[UIImageView sizeToFit](self->_imageView, "sizeToFit");
  -[SBSwitcherSnapshotImageView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    -[SBSwitcherSnapshotImageView _updateCornerRadius](self, "_updateCornerRadius");
  }
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setMaskedCorners:(unint64_t)a3
{
  if (self->_maskedCorners != a3)
  {
    self->_maskedCorners = a3;
    -[SBSwitcherSnapshotImageView _updateCornerRadius](self, "_updateCornerRadius");
  }
}

- (unint64_t)maskedCorners
{
  return self->_maskedCorners;
}

- (void)setOrientationForClassicLayout:(int64_t)a3
{
  if (self->_orientationForClassicLayout != a3)
  {
    self->_orientationForClassicLayout = a3;
    -[SBSwitcherSnapshotImageView _updateCornerRadius](self, "_updateCornerRadius");
  }
}

- (void)prepareForReuse
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIView *scalingView;
  __int128 v8;
  _OWORD v9[3];

  -[SBSwitcherSnapshotImageView setImage:](self, "setImage:", 0);
  -[SBSwitcherSnapshotImageView setAlpha:](self, "setAlpha:", 1.0);
  -[SBSwitcherSnapshotImageView setHidden:](self, "setHidden:", 0);
  -[SBSwitcherSnapshotImageView setHasOpaqueContents:](self, "setHasOpaqueContents:", 0);
  -[SBSwitcherSnapshotImageView setAllowsEdgeAntialiasing:](self, "setAllowsEdgeAntialiasing:", 0);
  -[SBSwitcherSnapshotImageView setAllowStatusBarToOverlap:](self, "setAllowStatusBarToOverlap:", 0);
  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  -[UIView setBounds:](self->_scalingView, "setBounds:", *MEMORY[0x1E0C9D648], v4, v5, v6);
  scalingView = self->_scalingView;
  v8 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v9[0] = *MEMORY[0x1E0C9BAA8];
  v9[1] = v8;
  v9[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  -[UIView setTransform:](scalingView, "setTransform:", v9);
  -[UIImageView setBounds:](self->_imageView, "setBounds:", v3, v4, v5, v6);
  self->_stretchToFillBounds = 0;
  self->_usesNonuniformScaling = 0;
  self->_orientationForClassicLayout = 0;
  self->_maskedCorners = 15;
  -[SBSwitcherSnapshotImageView _updateCornerRadius](self, "_updateCornerRadius");
}

- (BOOL)hasOpaqueContents
{
  return self->_hasOpaqueContents;
}

- (BOOL)stretchToFillBounds
{
  return self->_stretchToFillBounds;
}

- (BOOL)allowsEdgeAntialiasing
{
  return self->_allowsEdgeAntialiasing;
}

- (BOOL)allowStatusBarToOverlap
{
  return self->_allowStatusBarToOverlap;
}

- (void)setAllowStatusBarToOverlap:(BOOL)a3
{
  self->_allowStatusBarToOverlap = a3;
}

- (int64_t)orientationForClassicLayout
{
  return self->_orientationForClassicLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scalingView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
