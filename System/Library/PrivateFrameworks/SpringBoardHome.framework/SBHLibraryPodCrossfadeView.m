@implementation SBHLibraryPodCrossfadeView

- (SBHLibraryPodCrossfadeView)initWithForegroundView:(id)a3 podIconView:(id)a4
{
  id v7;
  id v8;
  SBHLibraryPodCrossfadeView *v9;
  SBHLibraryPodCrossfadeView *v10;
  CGFloat v11;
  CGFloat v12;
  double v13;
  double v14;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "bounds");
  v16.receiver = self;
  v16.super_class = (Class)SBHLibraryPodCrossfadeView;
  v9 = -[SBHLibraryPodCrossfadeView initWithFrame:](&v16, sel_initWithFrame_);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_podIconView, a4);
    objc_storeStrong((id *)&v10->_foregroundView, a3);
    objc_msgSend(v8, "iconImageInfo");
    v10->_iconImageInfo.size.width = v11;
    v10->_iconImageInfo.size.height = v12;
    v10->_iconImageInfo.scale = v13;
    v10->_iconImageInfo.continuousCornerRadius = v14;
  }

  return v10;
}

- (SBHLibraryPodCrossfadeView)initWithBackgroundView:(id)a3 podIconView:(id)a4
{
  id v7;
  id v8;
  SBHLibraryPodCrossfadeView *v9;
  SBHLibraryPodCrossfadeView *v10;
  CGFloat v11;
  CGFloat v12;
  double v13;
  double v14;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "bounds");
  v16.receiver = self;
  v16.super_class = (Class)SBHLibraryPodCrossfadeView;
  v9 = -[SBHLibraryPodCrossfadeView initWithFrame:](&v16, sel_initWithFrame_);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_podIconView, a4);
    objc_storeStrong((id *)&v10->_backgroundView, a3);
    objc_msgSend(v8, "iconImageInfo");
    v10->_iconImageInfo.size.width = v11;
    v10->_iconImageInfo.size.height = v12;
    v10->_iconImageInfo.scale = v13;
    v10->_iconImageInfo.continuousCornerRadius = v14;
  }

  return v10;
}

- (SBHLibraryPodCrossfadeView)initWithFrame:(CGRect)a3
{

  return 0;
}

- (SBHLibraryPodCrossfadeView)initWithCoder:(id)a3
{

  return 0;
}

- (void)setIconImageInfo:(SBIconImageInfo *)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  SBIconImageInfo *p_iconImageInfo;

  v7 = v6;
  v8 = v5;
  v9 = v4;
  v10 = v3;
  p_iconImageInfo = &self->_iconImageInfo;
  if (!SBIconImageInfoEqualToIconImageInfo(self->_iconImageInfo.size.width, self->_iconImageInfo.size.height, self->_iconImageInfo.scale, self->_iconImageInfo.continuousCornerRadius, v3, v4, v5, v6))
  {
    p_iconImageInfo->size.width = v10;
    p_iconImageInfo->size.height = v9;
    p_iconImageInfo->scale = v8;
    p_iconImageInfo->continuousCornerRadius = v7;
    -[SBHLibraryPodCrossfadeView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setPodIconViewCrossfadeFraction:(double)a3
{
  SBIconView *podIconView;
  void *v6;
  id v7;

  podIconView = self->_podIconView;
  if (self->_foregroundView)
  {
    -[SBIconView setIconImageAlpha:](podIconView, "setIconImageAlpha:", a3);
  }
  else
  {
    -[SBIconView customIconImageViewController](podIconView, "customIconImageViewController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "backgroundView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAlpha:", a3);

  }
}

- (void)setSourceViewCrossfadeFraction:(double)a3
{
  SBHLibraryCategoryStackView *foregroundView;

  foregroundView = self->_foregroundView;
  if (!foregroundView)
    foregroundView = (SBHLibraryCategoryStackView *)self->_backgroundView;
  -[SBHLibraryCategoryStackView setAlpha:](foregroundView, "setAlpha:", 1.0 - a3);
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[SBIconView intrinsicContentSize](self->_podIconView, "intrinsicContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[SBIconView sizeThatFits:](self->_podIconView, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  UIView *v3;
  UIView *v4;
  SBHLibraryPodCrossfadeView *v5;
  SBIconView *v6;
  SBHLibraryPodCrossfadeView *v7;
  SBHLibraryCategoryStackView *v8;
  SBHLibraryCategoryStackView *v9;
  SBHLibraryCategoryStackView *v10;
  SBHLibraryPodCrossfadeView *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  SBHLibraryCategoryStackView *v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  double continuousCornerRadius;
  double v22;
  SBHLibraryCategoryStackView *v23;
  CGAffineTransform v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)SBHLibraryPodCrossfadeView;
  -[SBHLibraryPodCrossfadeView layoutSubviews](&v25, sel_layoutSubviews);
  v3 = self->_backgroundView;
  v4 = v3;
  if (v3)
  {
    -[UIView superview](v3, "superview");
    v5 = (SBHLibraryPodCrossfadeView *)objc_claimAutoreleasedReturnValue();

    if (v5 != self)
      -[SBHLibraryPodCrossfadeView addSubview:](self, "addSubview:", v4);
  }
  v6 = self->_podIconView;
  -[SBIconView superview](v6, "superview");
  v7 = (SBHLibraryPodCrossfadeView *)objc_claimAutoreleasedReturnValue();

  if (v7 != self)
    -[SBHLibraryPodCrossfadeView addSubview:](self, "addSubview:", v6);
  v8 = self->_foregroundView;
  v9 = v8;
  v10 = (SBHLibraryCategoryStackView *)v4;
  if (v8)
  {
    -[SBHLibraryCategoryStackView superview](v8, "superview");
    v11 = (SBHLibraryPodCrossfadeView *)objc_claimAutoreleasedReturnValue();

    v10 = v9;
    if (v11 != self)
    {
      -[SBHLibraryPodCrossfadeView addSubview:](self, "addSubview:", v9);
      v10 = v9;
    }
  }
  -[SBHLibraryPodCrossfadeView bounds](self, "bounds");
  UIRectGetCenter();
  v13 = v12;
  v15 = v14;
  -[SBIconView setCenter:](v6, "setCenter:");
  -[SBHLibraryCategoryStackView setCenter:](v9, "setCenter:", v13, v15);
  -[UIView setCenter:](v4, "setCenter:", v13, v15);
  v16 = v10;
  -[SBIconView bounds](v6, "bounds");
  v18 = v17;
  -[SBHLibraryCategoryStackView bounds](v16, "bounds");
  v20 = v18 / v19;
  CGAffineTransformMakeScale(&v24, v20, v20);
  -[SBHLibraryCategoryStackView setTransform:](v16, "setTransform:", &v24);
  continuousCornerRadius = self->_iconImageInfo.continuousCornerRadius;
  -[SBIconView setIconImageInfo:](v6, "setIconImageInfo:", self->_iconImageInfo.size.width, self->_iconImageInfo.size.height, self->_iconImageInfo.scale, continuousCornerRadius);
  v22 = continuousCornerRadius / v20;
  if (v9)
  {
    v23 = v9;
    -[SBHLibraryCategoryStackView iconImageInfo](v23, "iconImageInfo");
    -[SBHLibraryCategoryStackView setIconImageInfo:](v23, "setIconImageInfo:");

  }
  else
  {
    -[UIView _setContinuousCornerRadius:](v4, "_setContinuousCornerRadius:", v22);
  }

}

- (SBIconView)podIconView
{
  return self->_podIconView;
}

- (SBIconImageInfo)iconImageInfo
{
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_podIconView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_foregroundView, 0);
}

@end
