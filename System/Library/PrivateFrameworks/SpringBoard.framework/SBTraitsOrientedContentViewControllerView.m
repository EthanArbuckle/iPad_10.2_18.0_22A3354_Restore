@implementation SBTraitsOrientedContentViewControllerView

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  SBTraitsDirectionalRotationView *contentRotationView;
  UIView *contentView;
  UIView *overlayView;
  UIView *backgroundView;
  SBTraitsDirectionalRotationView *v12;
  UIView *v13;
  UIView *v14;
  SBTraitsDirectionalRotationView *v15;
  UIView *v16;
  UIView *v17;
  UIView *v18;
  UILabel *placeholderLabel;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  UILabel *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)SBTraitsOrientedContentViewControllerView;
  -[SBTraitsOrientedContentViewControllerView layoutSubviews](&v31, sel_layoutSubviews);
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fixedCoordinateSpace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBSceneLayoutCoordinateSpace coordinateSpaceForInterfaceOrientation:withReferenceCoordinateSpace:inOrientation:](SBSceneLayoutCoordinateSpace, "coordinateSpaceForInterfaceOrientation:withReferenceCoordinateSpace:inOrientation:", 1, v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[SBSceneLayoutCoordinateSpace coordinateSpaceForFrame:withinCoordinateSpace:](SBSceneLayoutCoordinateSpace, "coordinateSpaceForFrame:withinCoordinateSpace:", v5, self->_contentViewBoundsInReferenceSpace.origin.x, self->_contentViewBoundsInReferenceSpace.origin.y, self->_contentViewBoundsInReferenceSpace.size.width, self->_contentViewBoundsInReferenceSpace.size.height);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBSceneLayoutCoordinateSpace coordinateSpaceForInterfaceOrientation:withReferenceCoordinateSpace:inOrientation:](SBSceneLayoutCoordinateSpace, "coordinateSpaceForInterfaceOrientation:withReferenceCoordinateSpace:inOrientation:", self->_contentOrientation, v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  contentRotationView = self->_contentRotationView;
  objc_msgSend(v7, "bounds");
  -[SBTraitsDirectionalRotationView setBounds:](contentRotationView, "setBounds:");
  contentView = self->_contentView;
  -[SBTraitsDirectionalRotationView bounds](self->_contentRotationView, "bounds");
  -[UIView setBounds:](contentView, "setBounds:");
  overlayView = self->_overlayView;
  objc_msgSend(v7, "bounds");
  -[UIView setBounds:](overlayView, "setBounds:");
  backgroundView = self->_backgroundView;
  objc_msgSend(v7, "bounds");
  -[UIView setBounds:](backgroundView, "setBounds:");
  -[_UIDirectionalRotationView setCounterTransformView:](self->_contentRotationView, "setCounterTransformView:", -[SBTraitsOrientedContentViewControllerView _counterTransformedToIdentityForContainerChange](self, "_counterTransformedToIdentityForContainerChange"));
  v29 = 0u;
  v30 = 0u;
  v28 = 0u;
  SBFTransformFromOrientationToOrientation();
  v12 = self->_contentRotationView;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[SBTraitsDirectionalRotationView setTransform:](v12, "setTransform:", &v25);
  v13 = self->_backgroundView;
  v25 = v28;
  v26 = v29;
  v27 = v30;
  -[UIView setTransform:](v13, "setTransform:", &v25);
  v14 = self->_overlayView;
  v25 = v28;
  v26 = v29;
  v27 = v30;
  -[UIView setTransform:](v14, "setTransform:", &v25);
  self->_previousContainerLayoutOrientation = self->_containerOrientation;
  self->_previousContentLayoutOrientation = self->_contentOrientation;
  v15 = self->_contentRotationView;
  -[SBTraitsOrientedContentViewControllerView bounds](self, "bounds");
  UIRectGetCenter();
  -[SBTraitsDirectionalRotationView setCenter:](v15, "setCenter:");
  v16 = self->_contentView;
  -[SBTraitsDirectionalRotationView bounds](self->_contentRotationView, "bounds");
  UIRectGetCenter();
  -[UIView setCenter:](v16, "setCenter:");
  v17 = self->_backgroundView;
  -[SBTraitsOrientedContentViewControllerView bounds](self, "bounds");
  UIRectGetCenter();
  -[UIView setCenter:](v17, "setCenter:");
  v18 = self->_overlayView;
  -[SBTraitsOrientedContentViewControllerView bounds](self, "bounds");
  UIRectGetCenter();
  -[UIView setCenter:](v18, "setCenter:");
  placeholderLabel = self->_placeholderLabel;
  if (placeholderLabel)
  {
    v20 = (void *)MEMORY[0x1E0CB3940];
    BSInterfaceOrientationDescription();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    BSInterfaceOrientationDescription();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("<%p>\ncontainer:\n%@\n\ncontent:\n%@"), self, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](placeholderLabel, "setText:", v23);

    -[UILabel sizeToFit](self->_placeholderLabel, "sizeToFit");
    v24 = self->_placeholderLabel;
    -[UIView bounds](self->_contentView, "bounds");
    UIRectGetCenter();
    -[UILabel setCenter:](v24, "setCenter:");
  }

}

- (BOOL)_counterTransformedToIdentityForContainerChange
{
  int64_t previousContainerLayoutOrientation;
  int64_t containerOrientation;
  int64_t previousContentLayoutOrientation;
  BOOL v5;
  BOOL v6;
  BOOL v7;

  previousContainerLayoutOrientation = self->_previousContainerLayoutOrientation;
  containerOrientation = self->_containerOrientation;
  if (previousContainerLayoutOrientation == containerOrientation)
    return 0;
  previousContentLayoutOrientation = self->_previousContentLayoutOrientation;
  if (previousContentLayoutOrientation != self->_contentOrientation)
    return 0;
  v5 = (unint64_t)(previousContainerLayoutOrientation - 1) <= 1
    && (unint64_t)(previousContentLayoutOrientation - 1) < 2;
  if ((unint64_t)(previousContainerLayoutOrientation - 3) <= 1)
    v6 = (unint64_t)(previousContentLayoutOrientation - 3) < 2;
  else
    v6 = v5;
  v7 = previousContainerLayoutOrientation != previousContentLayoutOrientation && v6;
  return previousContentLayoutOrientation == containerOrientation && v7;
}

- (void)setContentViewBoundsInReferenceSpace:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_contentViewBoundsInReferenceSpace;
  CGRect v9;
  CGRect v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_contentViewBoundsInReferenceSpace = &self->_contentViewBoundsInReferenceSpace;
  if (CGRectEqualToRect(*MEMORY[0x1E0C9D648], a3))
  {
    p_contentViewBoundsInReferenceSpace->origin.x = 0.0;
    self->_contentViewBoundsInReferenceSpace.origin.y = 0.0;
    self->_contentViewBoundsInReferenceSpace.size = (CGSize)xmmword_1D0E89C20;
  }
  else
  {
    v9.origin.x = p_contentViewBoundsInReferenceSpace->origin.x;
    v9.origin.y = self->_contentViewBoundsInReferenceSpace.origin.y;
    v9.size.width = self->_contentViewBoundsInReferenceSpace.size.width;
    v9.size.height = self->_contentViewBoundsInReferenceSpace.size.height;
    v10.origin.x = x;
    v10.origin.y = y;
    v10.size.width = width;
    v10.size.height = height;
    if (!CGRectEqualToRect(v9, v10))
    {
      p_contentViewBoundsInReferenceSpace->origin.x = x;
      self->_contentViewBoundsInReferenceSpace.origin.y = y;
      self->_contentViewBoundsInReferenceSpace.size.width = width;
      self->_contentViewBoundsInReferenceSpace.size.height = height;
    }
  }
  -[SBTraitsOrientedContentViewControllerView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setContentOrientation:(int64_t)a3
{
  if (self->_contentOrientation != a3)
  {
    self->_contentOrientation = a3;
    -[SBTraitsOrientedContentViewControllerView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setContainerOrientation:(int64_t)a3
{
  if (self->_containerOrientation != a3)
  {
    self->_containerOrientation = a3;
    -[SBTraitsOrientedContentViewControllerView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (SBTraitsOrientedContentViewControllerView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  SBTraitsOrientedContentViewControllerView *v7;
  SBTraitsDirectionalRotationView *v8;
  SBTraitsDirectionalRotationView *contentRotationView;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)SBTraitsOrientedContentViewControllerView;
  v7 = -[SBTraitsOrientedContentViewControllerView initWithFrame:](&v11, sel_initWithFrame_);
  if (v7)
  {
    v8 = -[SBTraitsDirectionalRotationView initWithFrame:]([SBTraitsDirectionalRotationView alloc], "initWithFrame:", x, y, width, height);
    contentRotationView = v7->_contentRotationView;
    v7->_contentRotationView = v8;

    -[SBTraitsOrientedContentViewControllerView addSubview:](v7, "addSubview:", v7->_contentRotationView);
    -[SBTraitsOrientedContentViewControllerView setContentView:](v7, "setContentView:", 0);
    -[SBTraitsOrientedContentViewControllerView setContentViewBoundsInReferenceSpace:](v7, "setContentViewBoundsInReferenceSpace:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  }
  return v7;
}

- (void)setContentView:(id)a3
{
  UIView *v4;
  void *v5;
  UILabel *placeholderLabel;
  UIView *contentView;
  UIView *v8;
  void *v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIView *v15;
  UIView *v16;
  UILabel *v17;
  UILabel *v18;
  UILabel *v19;
  void *v20;
  UILabel *v21;
  void *v22;
  UIView *v23;

  v4 = (UIView *)a3;
  if (!v4 || self->_contentView != v4)
  {
    v23 = v4;
    if (v4)
    {
      -[SBTraitsOrientedContentViewControllerView bs_setHitTestingDisabled:](self, "bs_setHitTestingDisabled:", 0);
      -[SBTraitsOrientedContentViewControllerView window](self, "window");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bs_setHitTestingDisabled:", 0);

      -[UIView removeFromSuperview](self->_contentView, "removeFromSuperview");
      -[UILabel removeFromSuperview](self->_placeholderLabel, "removeFromSuperview");
      placeholderLabel = self->_placeholderLabel;
      self->_placeholderLabel = 0;

      contentView = self->_contentView;
      self->_contentView = 0;

      v8 = v23;
      v9 = self->_contentView;
      self->_contentView = v8;
    }
    else
    {
      v10 = objc_alloc(MEMORY[0x1E0DA9F28]);
      v11 = *MEMORY[0x1E0C9D648];
      v12 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v13 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v14 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      v15 = (UIView *)objc_msgSend(v10, "initWithFrame:", *MEMORY[0x1E0C9D648], v12, v13, v14);
      v16 = self->_contentView;
      self->_contentView = v15;

      v17 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v11, v12, v13, v14);
      v18 = self->_placeholderLabel;
      self->_placeholderLabel = v17;

      v19 = self->_placeholderLabel;
      objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v19, "setTextColor:", v20);

      v21 = self->_placeholderLabel;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%p>"), self);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setText:](v21, "setText:", v22);

      -[UILabel setNumberOfLines:](self->_placeholderLabel, "setNumberOfLines:", 8);
      -[UILabel sizeToFit](self->_placeholderLabel, "sizeToFit");
      -[UIView addSubview:](self->_contentView, "addSubview:", self->_placeholderLabel);
      -[SBTraitsOrientedContentViewControllerView bs_setHitTestingDisabled:](self, "bs_setHitTestingDisabled:", 1);
      -[SBTraitsOrientedContentViewControllerView window](self, "window");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bs_setHitTestingDisabled:", 1);
    }

    -[SBTraitsOrientedContentViewControllerView _setDebugColorsEnabled:](self, "_setDebugColorsEnabled:", v23 == 0);
    -[SBTraitsDirectionalRotationView addSubview:](self->_contentRotationView, "addSubview:", self->_contentView);
    -[SBTraitsOrientedContentViewControllerView setNeedsLayout](self, "setNeedsLayout");
    v4 = v23;
  }

}

- (void)setBackgroundView:(id)a3
{
  UIView *v5;
  UIView **p_backgroundView;
  UIView *backgroundView;
  UIView *v8;
  UIView *v9;

  v5 = (UIView *)a3;
  p_backgroundView = &self->_backgroundView;
  backgroundView = self->_backgroundView;
  if (backgroundView != v5)
  {
    v9 = v5;
    if (backgroundView)
    {
      -[UIView removeFromSuperview](backgroundView, "removeFromSuperview");
      v8 = *p_backgroundView;
      *p_backgroundView = 0;

    }
    objc_storeStrong((id *)&self->_backgroundView, a3);
    v5 = v9;
    if (v9)
    {
      -[SBTraitsOrientedContentViewControllerView insertSubview:atIndex:](self, "insertSubview:atIndex:", *p_backgroundView, 0);
      v5 = v9;
    }
  }

}

- (void)addOverlayView:(id)a3
{
  id v4;
  id v5;
  UIView *v6;
  UIView *overlayView;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];

  v22[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_overlayView)
  {
    v5 = objc_alloc(MEMORY[0x1E0CEABB0]);
    v6 = (UIView *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    overlayView = self->_overlayView;
    self->_overlayView = v6;

    -[SBTraitsOrientedContentViewControllerView addSubview:](self, "addSubview:", self->_overlayView);
    -[SBTraitsOrientedContentViewControllerView bringSubviewToFront:](self, "bringSubviewToFront:", self->_overlayView);
  }
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](self->_overlayView, "addSubview:", v4);
  v17 = (void *)MEMORY[0x1E0CB3718];
  -[UIView leadingAnchor](self->_overlayView, "leadingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v20);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v19;
  -[UIView trailingAnchor](self->_overlayView, "trailingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trailingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v9;
  -[UIView topAnchor](self->_overlayView, "topAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v12;
  -[UIView bottomAnchor](self->_overlayView, "bottomAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "activateConstraints:", v16);

}

- (void)setClipsToBounds:(BOOL)a3
{
  -[UIView setClipsToBounds:](self->_contentView, "setClipsToBounds:", a3);
}

- (void)_setContinuousCornerRadius:(double)a3
{
  -[UIView _setContinuousCornerRadius:](self->_contentView, "_setContinuousCornerRadius:", a3);
}

- (void)_setDebugColorsEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  UIView *contentView;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  v3 = a3;
  -[SBTraitsOrientedContentViewControllerView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "blueColor");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v5, "setBorderColor:", objc_msgSend(v6, "CGColor"));

    -[SBTraitsDirectionalRotationView layer](self->_contentRotationView, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "greenColor");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v7, "setBorderColor:", objc_msgSend(v8, "CGColor"));

    -[UIView layer](self->_contentView, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "magentaColor");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v9, "setBorderColor:", objc_msgSend(v10, "CGColor"));

    -[SBTraitsOrientedContentViewControllerView layer](self, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBorderWidth:", 2.0);

    -[SBTraitsDirectionalRotationView layer](self->_contentRotationView, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBorderWidth:", 3.0);

    -[UIView layer](self->_contentView, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setBorderWidth:", 1.0);

    contentView = self->_contentView;
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.0392156863, 0.784313725, 0.0784313725, 0.6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](contentView, "setBackgroundColor:", v15);

    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 1.0, 0.8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v5, "setBorderColor:", objc_msgSend(v16, "CGColor"));

    -[SBTraitsDirectionalRotationView layer](self->_contentRotationView, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v17, "setBorderColor:", objc_msgSend(v18, "CGColor"));

    -[UIView layer](self->_contentView, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v19, "setBorderColor:", objc_msgSend(v20, "CGColor"));

    -[SBTraitsOrientedContentViewControllerView layer](self, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setBorderWidth:", 0.0);

    -[UIView layer](self->_contentView, "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setBorderWidth:", 0.0);

    -[SBTraitsDirectionalRotationView layer](self->_contentRotationView, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setBorderWidth:", 0.0);

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  }
  v24 = (id)objc_claimAutoreleasedReturnValue();
  -[SBTraitsOrientedContentViewControllerView setBackgroundColor:](self, "setBackgroundColor:", v24);

}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBTraitsOrientedContentViewControllerView succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SBFStringForBSInterfaceOrientation();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SBFStringForBSInterfaceOrientation();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p container: %@, content: %@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SBFStringForBSInterfaceOrientation();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("containerOrientation"));

  SBFStringForBSInterfaceOrientation();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("contentOrientation"));

  NSStringFromCGRect(self->_contentViewBoundsInReferenceSpace);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v6, CFSTR("contentReferenceBounds"));

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBTraitsOrientedContentViewControllerView descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (CGRect)contentViewBoundsInReferenceSpace
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentViewBoundsInReferenceSpace.origin.x;
  y = self->_contentViewBoundsInReferenceSpace.origin.y;
  width = self->_contentViewBoundsInReferenceSpace.size.width;
  height = self->_contentViewBoundsInReferenceSpace.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (int64_t)contentOrientation
{
  return self->_contentOrientation;
}

- (int64_t)containerOrientation
{
  return self->_containerOrientation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentRotationView, 0);
  objc_storeStrong((id *)&self->_placeholderLabel, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
