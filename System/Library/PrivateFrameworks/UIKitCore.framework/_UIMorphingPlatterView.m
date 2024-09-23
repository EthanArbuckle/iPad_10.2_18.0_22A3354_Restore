@implementation _UIMorphingPlatterView

- (_UIMorphingPlatterView)initWithFrame:(CGRect)a3
{
  _UIMorphingPlatterView *v3;
  _UIMorphingPlatterView *v4;
  _UIPlatterClippingView *v5;
  _UIPlatterClippingView *v6;
  void *v7;
  _UIPlatterTransformView *v8;
  _UIPlatterTransformView *v9;
  void *v10;
  void *v11;
  void *v12;
  _UIPlatterClippingView *v13;
  _UIPlatterClippingView *v14;
  void *v15;
  _UIPlatterTransformView *v16;
  _UIPlatterTransformView *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)_UIMorphingPlatterView;
  v3 = -[UIView initWithFrame:](&v23, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIView setClipsToBounds:](v3, "setClipsToBounds:", 0);
    v5 = [_UIPlatterClippingView alloc];
    -[UIView bounds](v4, "bounds");
    v6 = -[_UIPlatterClippingView initWithFrame:](v5, "initWithFrame:");
    -[_UIMorphingPlatterView setExpandedClippingView:](v4, "setExpandedClippingView:", v6);

    -[_UIMorphingPlatterView expandedClippingView](v4, "expandedClippingView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v4, "addSubview:", v7);

    v8 = [_UIPlatterTransformView alloc];
    -[UIView bounds](v4, "bounds");
    v9 = -[_UIPlatterTransformView initWithFrame:](v8, "initWithFrame:");
    -[_UIMorphingPlatterView setExpandedTransformView:](v4, "setExpandedTransformView:", v9);

    -[_UIMorphingPlatterView expandedTransformView](v4, "expandedTransformView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setHidesSourceView:", 1);

    -[_UIMorphingPlatterView expandedClippingView](v4, "expandedClippingView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIMorphingPlatterView expandedTransformView](v4, "expandedTransformView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v12);

    v13 = [_UIPlatterClippingView alloc];
    -[UIView bounds](v4, "bounds");
    v14 = -[_UIPlatterClippingView initWithFrame:](v13, "initWithFrame:");
    -[_UIMorphingPlatterView setCollapsedClippingView:](v4, "setCollapsedClippingView:", v14);

    -[_UIMorphingPlatterView collapsedClippingView](v4, "collapsedClippingView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v4, "addSubview:", v15);

    v16 = [_UIPlatterTransformView alloc];
    -[UIView bounds](v4, "bounds");
    v17 = -[_UIPlatterTransformView initWithFrame:](v16, "initWithFrame:");
    -[_UIMorphingPlatterView setCollapsedTransformView:](v4, "setCollapsedTransformView:", v17);

    -[_UIMorphingPlatterView collapsedTransformView](v4, "collapsedTransformView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setHidesSourceView:", 1);

    -[_UIMorphingPlatterView collapsedClippingView](v4, "collapsedClippingView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIMorphingPlatterView collapsedTransformView](v4, "collapsedTransformView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addSubview:", v20);

    -[_UIMorphingPlatterView setPreventPreviewRasterization:](v4, "setPreventPreviewRasterization:", 0);
    -[UIView _setSafeAreaInsetsFrozen:](v4, "_setSafeAreaInsetsFrozen:", 1);
    -[_UIMorphingPlatterView setShouldMorphContents:](v4, "setShouldMorphContents:", 1);
    -[_UIMorphingPlatterView setOverrideCollapsedCornerRadius:](v4, "setOverrideCollapsedCornerRadius:", 2.22507386e-308);
    -[_UIMorphingPlatterView setOverrideExpandedCornerRadius:](v4, "setOverrideExpandedCornerRadius:", 2.22507386e-308);
    -[_UIMorphingPlatterView setCollapsedShadowIntensity:](v4, "setCollapsedShadowIntensity:", 1.0);
    -[_UIMorphingPlatterView setExpandedShadowIntensity:](v4, "setExpandedShadowIntensity:", 1.0);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIMorphingPlatterView setShadowViews:](v4, "setShadowViews:", v21);

    -[_UIMorphingPlatterView _prepareAnimatableProperties](v4, "_prepareAnimatableProperties");
  }
  return v4;
}

- (void)setAllowsUserInteractionInExpandedPreview:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[_UIMorphingPlatterView expandedTransformView](self, "expandedTransformView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowsUserInteraction:", v3);

}

- (BOOL)allowsUserInteractionInExpandedPreview
{
  void *v2;
  char v3;

  -[_UIMorphingPlatterView expandedTransformView](self, "expandedTransformView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "allowsUserInteraction");

  return v3;
}

- (void)setPreventPreviewRasterization:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_preventPreviewRasterization != a3)
  {
    self->_preventPreviewRasterization = a3;
    v3 = !a3;
    -[_UIMorphingPlatterView expandedTransformView](self, "expandedTransformView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAppliesMinificationFilter:", v3);

  }
}

- (void)setAlwaysCompact:(BOOL)a3
{
  int64_t v4;

  if (self->_alwaysCompact != a3)
  {
    self->_alwaysCompact = a3;
    if (a3)
      v4 = -[_UIMorphingPlatterView collapsedShadowStyle](self, "collapsedShadowStyle");
    else
      v4 = 2;
    -[_UIMorphingPlatterView setExpandedShadowStyle:](self, "setExpandedShadowStyle:", v4);
  }
}

- (void)setHidesCollapsedSourceView:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[_UIMorphingPlatterView collapsedTransformView](self, "collapsedTransformView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidesSourceView:", v3);

}

- (BOOL)hidesCollapsedSourceView
{
  void *v2;
  char v3;

  -[_UIMorphingPlatterView collapsedTransformView](self, "collapsedTransformView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hidesSourceView");

  return v3;
}

- (void)setWantsEdgeAntialiasing:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[_UIMorphingPlatterView collapsedClippingView](self, "collapsedClippingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAllowsEdgeAntialiasing:", v3);

  -[_UIMorphingPlatterView expandedClippingView](self, "expandedClippingView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAllowsEdgeAntialiasing:", v3);

}

- (BOOL)wantsEdgeAntialiasing
{
  void *v2;
  void *v3;
  char v4;

  -[_UIMorphingPlatterView collapsedClippingView](self, "collapsedClippingView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "allowsEdgeAntialiasing");

  return v4;
}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIMorphingPlatterView;
  -[UIView didMoveToWindow](&v7, sel_didMoveToWindow);
  if (-[_UIMorphingPlatterView alwaysCompact](self, "alwaysCompact"))
  {
    -[UIView window](self, "window");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      -[_UIMorphingPlatterView collapsedPreview](self, "collapsedPreview");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIView _internalTraitOverrides](v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_removeTraitToken:", 0x1E1A99588);

    }
  }
}

- (void)layoutSubviews
{
  _BOOL4 v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  unint64_t v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  double v45;
  double v46;
  CGFloat v47;
  unint64_t v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  double v57;
  void *v58;
  double v59;
  void *v60;
  double v61;
  void *v62;
  CGFloat v63;
  CGFloat v64;
  CGFloat rect;
  CGFloat recta;
  CGFloat rectb;
  double rect_8;
  CGFloat rect_8a;
  CGFloat rect_8b;
  CGFloat rect_16;
  CGFloat rect_24;
  CGFloat v73;
  CGFloat v74;
  CGAffineTransform v75;
  CGAffineTransform v76;
  CGAffineTransform v77;
  CGAffineTransform v78;
  objc_super v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;

  v79.receiver = self;
  v79.super_class = (Class)_UIMorphingPlatterView;
  -[UIView layoutSubviews](&v79, sel_layoutSubviews);
  v3 = -[_UIMorphingPlatterView expanded](self, "expanded");
  -[UIView bounds](self, "bounds");
  rect_16 = v5;
  rect_24 = v4;
  v73 = v7;
  v74 = v6;
  -[_UIMorphingPlatterView collapsedTransformView](self, "collapsedTransformView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIMorphingPlatterView expandedTransformView](self, "expandedTransformView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_UIMorphingPlatterView contentSizeDidChange](self, "contentSizeDidChange"))
  {
    -[_UIMorphingPlatterView setContentSizeDidChange:](self, "setContentSizeDidChange:", 0);
    objc_msgSend(v8, "sizeToFit");
    objc_msgSend(v9, "sizeToFit");
  }
  -[_UIMorphingPlatterView _updatePathShadowTransform](self, "_updatePathShadowTransform");
  -[_UIMorphingPlatterView _updateClippingViews](self, "_updateClippingViews");
  if (!-[_UIMorphingPlatterView preferredMorphingAxis](self, "preferredMorphingAxis"))
  {
    objc_msgSend(v8, "bounds");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    objc_msgSend(v9, "bounds");
    rect = v80.origin.x;
    y = v80.origin.y;
    width = v80.size.width;
    height = v80.size.height;
    v21 = CGRectGetWidth(v80);
    v81.origin.x = v11;
    v81.origin.y = v13;
    v81.size.width = v15;
    v81.size.height = v17;
    v22 = vabdd_f64(v21, CGRectGetWidth(v81));
    v82.origin.x = v11;
    v82.origin.y = v13;
    v82.size.width = v15;
    v82.size.height = v17;
    rect_8 = v22 / CGRectGetWidth(v82);
    v83.origin.x = rect;
    v83.origin.y = y;
    v83.size.width = width;
    v83.size.height = height;
    v23 = CGRectGetHeight(v83);
    v84.origin.x = v11;
    v84.origin.y = v13;
    v84.size.width = v15;
    v84.size.height = v17;
    v24 = vabdd_f64(v23, CGRectGetHeight(v84));
    v85.origin.x = v11;
    v85.origin.y = v13;
    v85.size.width = v15;
    v85.size.height = v17;
    if (rect_8 <= v24 / CGRectGetHeight(v85))
      v25 = 1;
    else
      v25 = 2;
    -[_UIMorphingPlatterView setPreferredMorphingAxis:](self, "setPreferredMorphingAxis:", v25);
  }
  objc_msgSend(v8, "bounds");
  v27 = v26;
  v63 = v28;
  recta = v26;
  v29 = v28;
  v31 = v30;
  rect_8a = v32;
  v33 = -[_UIMorphingPlatterView preferredMorphingAxis](self, "preferredMorphingAxis");
  v86.origin.x = rect_24;
  v86.origin.y = rect_16;
  v86.size.width = v74;
  v86.size.height = v73;
  v34 = CGRectGetWidth(v86);
  v87.origin.x = v27;
  v87.origin.y = v29;
  v87.size.width = v31;
  v87.size.height = rect_8a;
  v35 = v34 / CGRectGetWidth(v87);
  v88.origin.x = rect_24;
  v88.origin.y = rect_16;
  v88.size.width = v74;
  v88.size.height = v73;
  v36 = CGRectGetHeight(v88);
  v89.origin.y = v63;
  v89.origin.x = recta;
  v89.size.width = v31;
  v89.size.height = rect_8a;
  v37 = CGRectGetHeight(v89);
  v38 = v36 / v37;
  if (v33 == 1)
    v39 = v35;
  else
    v39 = v36 / v37;
  if (v33 == 2)
    v40 = v36 / v37;
  else
    v40 = v35;
  if (v33 != 2)
    v38 = v39;
  CGAffineTransformMakeScale(&v78, v40, v38);
  v77 = v78;
  objc_msgSend(v8, "setTransform:", &v77);
  objc_msgSend(v9, "bounds");
  v42 = v41;
  v64 = v43;
  rectb = v41;
  v44 = v43;
  rect_8b = v45;
  v47 = v46;
  v48 = -[_UIMorphingPlatterView preferredMorphingAxis](self, "preferredMorphingAxis");
  v90.origin.x = rect_24;
  v90.origin.y = rect_16;
  v90.size.width = v74;
  v90.size.height = v73;
  v49 = CGRectGetWidth(v90);
  v91.origin.x = v42;
  v91.origin.y = v44;
  v91.size.width = rect_8b;
  v91.size.height = v47;
  v50 = v49 / CGRectGetWidth(v91);
  v92.origin.x = rect_24;
  v92.origin.y = rect_16;
  v92.size.width = v74;
  v92.size.height = v73;
  v51 = CGRectGetHeight(v92);
  v93.origin.y = v64;
  v93.origin.x = rectb;
  v93.size.width = rect_8b;
  v93.size.height = v47;
  v52 = CGRectGetHeight(v93);
  v53 = v51 / v52;
  if (v48 == 1)
    v54 = v50;
  else
    v54 = v51 / v52;
  if (v48 == 2)
    v55 = v51 / v52;
  else
    v55 = v50;
  if (v48 != 2)
    v53 = v54;
  CGAffineTransformMakeScale(&v76, v55, v53);
  v75 = v76;
  objc_msgSend(v9, "setTransform:", &v75);
  if (-[_UIMorphingPlatterView bothViewsAreLikelyOpaque](self, "bothViewsAreLikelyOpaque"))
  {
    -[_UIMorphingPlatterView collapsedClippingView](self, "collapsedClippingView");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bringSubviewToFront:](self, "bringSubviewToFront:", v56);

  }
  if (!+[UIView _isInRetargetableAnimationBlock](UIView, "_isInRetargetableAnimationBlock"))
    -[_UIMorphingPlatterView _modelUpdates](self, "_modelUpdates");
  if (v3)
    v57 = 1.0;
  else
    v57 = 0.0;
  -[_UIMorphingPlatterView expansionProgress](self, "expansionProgress");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setValue:", v57);

  v94.origin.x = rect_24;
  v94.origin.y = rect_16;
  v94.size.width = v74;
  v94.size.height = v73;
  v59 = CGRectGetWidth(v94);
  -[_UIMorphingPlatterView platterWidth](self, "platterWidth");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setValue:", v59);

  v95.origin.x = rect_24;
  v95.origin.y = rect_16;
  v95.size.width = v74;
  v95.size.height = v73;
  v61 = CGRectGetHeight(v95);
  -[_UIMorphingPlatterView platterHeight](self, "platterHeight");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setValue:", v61);

  -[_UIMorphingPlatterView _updateCollapsedChrome](self, "_updateCollapsedChrome");
}

- (void)_modelUpdates
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;

  -[UIView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = v3 + v7 * 0.5;
  v12 = v5 + v9 * 0.5;
  -[_UIMorphingPlatterView collapsedClippingView](self, "collapsedClippingView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBounds:", v4, v6, v8, v10);

  -[_UIMorphingPlatterView collapsedClippingView](self, "collapsedClippingView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setCenter:", v11, v12);

  -[_UIMorphingPlatterView expandedClippingView](self, "expandedClippingView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setBounds:", v4, v6, v8, v10);

  -[_UIMorphingPlatterView expandedClippingView](self, "expandedClippingView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setCenter:", v11, v12);

  -[_UIMorphingPlatterView collapsedTransformView](self, "collapsedTransformView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0.0;
  objc_msgSend(v17, "setCenter:", v11, 0.0);

  -[_UIMorphingPlatterView expandedTransformView](self, "expandedTransformView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setCenter:", v11, 0.0);

  if (-[_UIMorphingPlatterView expanded](self, "expanded"))
    v18 = 1.0;
  if (-[_UIMorphingPlatterView alwaysCompact](self, "alwaysCompact"))
  {
    -[_UIMorphingPlatterView collapsedClippingView](self, "collapsedClippingView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setAlpha:", 1.0);

    -[_UIMorphingPlatterView expandedClippingView](self, "expandedClippingView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    v23 = 0.0;
  }
  else
  {
    -[_UIMorphingPlatterView collapsedClippingView](self, "collapsedClippingView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setAlpha:", 1.0 - v18);

    -[_UIMorphingPlatterView expandedClippingView](self, "expandedClippingView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    v23 = v18;
  }
  objc_msgSend(v21, "setAlpha:", v23);

  -[_UIMorphingPlatterView _updateShadowsWithExpansionProgress:contentBounds:center:forPresentation:](self, "_updateShadowsWithExpansionProgress:contentBounds:center:forPresentation:", 0, v18, v4, v6, v8, v10, v11, v12);
}

- (void)_prepareAnimatableProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  id location;
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[_UIMorphingPlatterView setExpansionProgress:](self, "setExpansionProgress:", v3);

  v4 = (void *)objc_opt_new();
  -[_UIMorphingPlatterView setPlatterWidth:](self, "setPlatterWidth:", v4);

  v5 = (void *)objc_opt_new();
  -[_UIMorphingPlatterView setPlatterHeight:](self, "setPlatterHeight:", v5);

  -[_UIMorphingPlatterView expansionProgress](self, "expansionProgress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v6;
  -[_UIMorphingPlatterView platterWidth](self, "platterWidth");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v7;
  -[_UIMorphingPlatterView platterHeight](self, "platterHeight");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v10 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __54___UIMorphingPlatterView__prepareAnimatableProperties__block_invoke;
  v13[3] = &unk_1E16B3F40;
  objc_copyWeak(&v14, &location);
  v11[0] = v10;
  v11[1] = 3221225472;
  v11[2] = __54___UIMorphingPlatterView__prepareAnimatableProperties__block_invoke_2;
  v11[3] = &unk_1E16B3F40;
  objc_copyWeak(&v12, &location);
  +[UIView _createTransformerWithInputAnimatableProperties:modelValueSetter:presentationValueSetter:](UIView, "_createTransformerWithInputAnimatableProperties:modelValueSetter:presentationValueSetter:", v9, v13, v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

- (void)_updateClippingViews
{
  _BOOL4 v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  id *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  _QWORD v33[8];
  _QWORD v34[8];
  uint64_t v35;
  char v36;

  v3 = -[_UIMorphingPlatterView expanded](self, "expanded");
  -[UIView bounds](self, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[_UIMorphingPlatterView collapsedClippingView](self, "collapsedClippingView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIMorphingPlatterView expandedClippingView](self, "expandedClippingView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  v35 = 15;
  if (v3)
  {
    -[_UIMorphingPlatterView _expandedCornerRadius:maskedCorners:ignoreLiftScale:](self, "_expandedCornerRadius:maskedCorners:ignoreLiftScale:", &v36, &v35, 0);
    v15 = _UIClampedCornerRadius(15, v14, v5, v7, v9, v11);
  }
  else
  {
    -[_UIMorphingPlatterView _collapsedCornerRadius:maskedCorners:](self, "_collapsedCornerRadius:maskedCorners:", &v36, &v35);
  }
  v16 = v15;
  v17 = (id *)MEMORY[0x1E0CD2A68];
  if (!v36)
    v17 = (id *)MEMORY[0x1E0CD2A60];
  v18 = *v17;
  if (fabs(v16) < 2.22044605e-16)
  {
    v35 = 15;
    if (v3)
      v19 = v12;
    else
      v19 = v13;
    objc_msgSend(v19, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "cornerCurve");
    v21 = objc_claimAutoreleasedReturnValue();

    v18 = (id)v21;
  }
  objc_msgSend(v12, "layer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setCornerCurve:", v18);

  objc_msgSend(v13, "layer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setCornerCurve:", v18);

  -[UIView traitCollection](self, "traitCollection");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "userInterfaceIdiom");

  if (v25 == 6)
  {
    objc_msgSend(v12, "layer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setCornerRadius:", v16);

    objc_msgSend(v13, "layer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setCornerRadius:", v16);
  }
  else
  {
    if ((v35 & 1) != 0)
      v28 = v16;
    else
      v28 = 0.0;
    if ((v35 & 2) != 0)
      v29 = v16;
    else
      v29 = 0.0;
    if ((v35 & 4) != 0)
      v30 = v16;
    else
      v30 = 0.0;
    if ((v35 & 8) != 0)
      v31 = v16;
    else
      v31 = 0.0;
    objc_msgSend(v12, "layer");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(double *)v34 = v30;
    *(double *)&v34[1] = v30;
    *(double *)&v34[2] = v31;
    *(double *)&v34[3] = v31;
    *(double *)&v34[4] = v29;
    *(double *)&v34[5] = v29;
    *(double *)&v34[6] = v28;
    *(double *)&v34[7] = v28;
    objc_msgSend(v32, "setCornerRadii:", v34);

    objc_msgSend(v13, "layer");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(double *)v33 = v30;
    *(double *)&v33[1] = v30;
    *(double *)&v33[2] = v31;
    *(double *)&v33[3] = v31;
    *(double *)&v33[4] = v29;
    *(double *)&v33[5] = v29;
    *(double *)&v33[6] = v28;
    *(double *)&v33[7] = v28;
    objc_msgSend(v27, "setCornerRadii:", v33);
  }

  -[UIView _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:", v16);
}

- (double)_collapsedCornerRadius:(BOOL *)a3 maskedCorners:(unint64_t *)a4
{
  double v7;
  double result;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;

  *a4 = 15;
  *a3 = 1;
  -[_UIMorphingPlatterView overrideCollapsedCornerRadius](self, "overrideCollapsedCornerRadius");
  if (v7 <= 2.22507386e-308)
  {
    -[_UIMorphingPlatterView collapsedPreview](self, "collapsedPreview");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_outlineShape");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "cornerRadius");
    v12 = v11;
    objc_msgSend(v10, "cornerCurve");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *a3 = v13 == (void *)*MEMORY[0x1E0CD2A68];

    *a4 = objc_msgSend(v10, "cornerMask");
    return v12;
  }
  else
  {
    -[_UIMorphingPlatterView overrideCollapsedCornerRadius](self, "overrideCollapsedCornerRadius");
  }
  return result;
}

- (double)_expandedCornerRadius:(BOOL *)a3 maskedCorners:(unint64_t *)a4 ignoreLiftScale:(BOOL)a5
{
  double v9;
  double result;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double Width;
  double v23;
  CGRect v24;

  *a4 = 15;
  *a3 = 1;
  -[_UIMorphingPlatterView overrideExpandedCornerRadius](self, "overrideExpandedCornerRadius");
  if (v9 > 2.22507386e-308)
  {
    -[_UIMorphingPlatterView overrideExpandedCornerRadius](self, "overrideExpandedCornerRadius");
    return result;
  }
  if (-[_UIMorphingPlatterView alwaysCompact](self, "alwaysCompact"))
    -[_UIMorphingPlatterView collapsedPreview](self, "collapsedPreview");
  else
    -[_UIMorphingPlatterView expandedPreview](self, "expandedPreview");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_outlineShape");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "cornerRadius");
  v14 = v13;
  if (-[_UIMorphingPlatterView alwaysCompact](self, "alwaysCompact"))
  {
    objc_msgSend(v12, "cornerCurve");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *a3 = v15 == (void *)*MEMORY[0x1E0CD2A68];

    v16 = objc_msgSend(v12, "cornerMask");
  }
  else
  {
    *a3 = 1;
    v16 = 15;
  }
  *a4 = v16;
  objc_msgSend(v11, "parameters");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "visiblePath");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {

LABEL_14:
    goto LABEL_15;
  }

  if (fabs(v14) < 2.22044605e-16)
  {
    objc_msgSend(v11, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "traitCollection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    _UIContextMenuGetPlatformMetrics(objc_msgSend(v20, "userInterfaceIdiom"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "previewPlatterCornerRadius");
    if (v14 < v21)
      v14 = v21;
    goto LABEL_14;
  }
LABEL_15:
  if (-[_UIMorphingPlatterView alwaysCompact](self, "alwaysCompact"))
  {
    if (!a5)
    {
      -[UIView bounds](self, "bounds");
      Width = CGRectGetWidth(v24);
      objc_msgSend(v11, "size");
      v14 = v14 * (Width / v23);
    }
    *a4 = 15;
  }

  return v14;
}

- (void)freezeExpandedPreview
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  UITargetedPreview *v9;
  void *v10;
  void *v11;
  UITargetedPreview *v12;
  id v13;

  if (!-[_UIMorphingPlatterView isFrozen](self, "isFrozen")
    && !-[_UIMorphingPlatterView alwaysCompact](self, "alwaysCompact"))
  {
    -[_UIMorphingPlatterView setFrozen:](self, "setFrozen:", 1);
    -[_UIMorphingPlatterView expandedPreview](self, "expandedPreview");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    _UISnapshotViewRectAfterCommit(v3, 0, v4, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    objc_msgSend(v8, "setFrame:");
    if (v8)
    {
      v9 = [UITargetedPreview alloc];
      objc_msgSend(v13, "parameters");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "target");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[UITargetedPreview initWithView:parameters:target:](v9, "initWithView:parameters:target:", v8, v10, v11);
      -[_UIMorphingPlatterView setExpandedPreview:](self, "setExpandedPreview:", v12);

    }
  }
}

- (void)didTearOffForDrag
{
  void *v3;
  void *v4;
  uint64_t v5;
  CGAffineTransform v6;
  CGAffineTransform v7;

  -[_UIMorphingPlatterView collapsedTransformView](self, "collapsedTransformView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didTearOffForDrag");

  if (-[_UIMorphingPlatterView alwaysCompact](self, "alwaysCompact"))
  {
    -[_UIMorphingPlatterView collapsedPreview](self, "collapsedPreview");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "_previewMode");

    if (v5 == 4)
    {
      CGAffineTransformMakeScale(&v7, 0.909090909, 0.909090909);
      v6 = v7;
      -[UIView setTransform:](self, "setTransform:", &v6);
    }
  }
}

- (BOOL)bothViewsAreLikelyOpaque
{
  void *v3;
  void *v4;
  char v5;

  -[_UIMorphingPlatterView collapsedPreview](self, "collapsedPreview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "_isLikelyOpaque"))
  {
    -[_UIMorphingPlatterView expandedPreview](self, "expandedPreview");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "_isLikelyOpaque");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_previewPrefersApplyingMask:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "_previewMode") != 4 && objc_msgSend(v3, "_previewMode") != 5;

  return v4;
}

- (void)setCollapsedPreview:(id)a3
{
  UITargetedPreview *v5;
  UITargetedPreview **p_collapsedPreview;
  UITargetedPreview *collapsedPreview;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  UITargetedPreview *v12;
  void *v13;
  void *v14;
  UITargetedPreview *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  UITargetedPreview *v23;

  v5 = (UITargetedPreview *)a3;
  p_collapsedPreview = &self->_collapsedPreview;
  collapsedPreview = self->_collapsedPreview;
  if (collapsedPreview != v5)
  {
    v23 = v5;
    if (collapsedPreview)
    {
      if (-[_UIMorphingPlatterView alwaysCompact](self, "alwaysCompact"))
      {
        -[UITargetedPreview view](*p_collapsedPreview, "view");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITargetedPreview view](v23, "view");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8 != v9)
        {
          -[UITargetedPreview view](*p_collapsedPreview, "view");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIView _internalTraitOverrides](v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "_removeTraitToken:", 0x1E1A99588);

        }
      }
    }
    objc_storeStrong((id *)&self->_collapsedPreview, a3);
    v12 = *p_collapsedPreview;
    -[_UIMorphingPlatterView collapsedTransformView](self, "collapsedTransformView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSourcePreview:", v12);

    if (_AXSReduceMotionEnabled())
    {
      -[_UIMorphingPlatterView collapsedTransformView](self, "collapsedTransformView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setHidesSourceView:", 0);

    }
    v15 = *p_collapsedPreview;
    -[_UIMorphingPlatterView collapsedClippingView](self, "collapsedClippingView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIMorphingPlatterView collapsedTransformView](self, "collapsedTransformView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIMorphingPlatterView _installPreview:inClippingView:transformView:](self, "_installPreview:inClippingView:transformView:", v15, v16, v17);

    -[UITargetedPreview parameters](*p_collapsedPreview, "parameters");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "backgroundColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "_isOpaque");
    -[_UIMorphingPlatterView collapsedClippingView](self, "collapsedClippingView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setAllowsGroupOpacity:", v20);

    -[_UIMorphingPlatterView _updatePathShadow](self, "_updatePathShadow");
    v5 = v23;
  }

}

- (void)_updatePathShadow
{
  int64_t v3;
  int64_t v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  BOOL v13;

  if (-[_UIMorphingPlatterView expanded](self, "expanded"))
    v3 = -[_UIMorphingPlatterView expandedShadowStyle](self, "expandedShadowStyle");
  else
    v3 = -[_UIMorphingPlatterView collapsedShadowStyle](self, "collapsedShadowStyle");
  v4 = v3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __43___UIMorphingPlatterView__updatePathShadow__block_invoke;
  v12[3] = &unk_1E16B1B78;
  v12[4] = self;
  v13 = v3 == 1;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v12);
  -[_UIMorphingPlatterView pathShadowView](self, "pathShadowView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (v4 == 1)
      v6 = 1.0;
    else
      v6 = 0.0;
    -[_UIMorphingPlatterView pathShadowView](self, "pathShadowView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAlpha:", v6);

    -[_UIMorphingPlatterView shadowViews](self, "shadowViews");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", &unk_1E1A99720);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeFromSuperview");

    -[_UIMorphingPlatterView pathShadowView](self, "pathShadowView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIMorphingPlatterView shadowViews](self, "shadowViews");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, &unk_1E1A99720);

  }
}

- (void)setCollapsedShadowStyle:(int64_t)a3
{
  if (self->_collapsedShadowStyle != a3)
  {
    self->_collapsedShadowStyle = a3;
    if (-[_UIMorphingPlatterView alwaysCompact](self, "alwaysCompact"))
      -[_UIMorphingPlatterView setExpandedShadowStyle:](self, "setExpandedShadowStyle:", self->_collapsedShadowStyle);
    -[_UIMorphingPlatterView _installShadowViewForStyleIfNecessary:](self, "_installShadowViewForStyleIfNecessary:", self->_collapsedShadowStyle);
  }
}

- (void)setCollapsedShadowIntensity:(double)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  float v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  id v14;

  if (vabdd_f64(a3, self->_collapsedShadowIntensity) > 2.22044605e-16)
  {
    self->_collapsedShadowIntensity = a3;
    -[_UIMorphingPlatterView expansionProgress](self, "expansionProgress");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "value");
    -[_UIMorphingPlatterView _collapsedShadowAlphaForExpansionProgress:](self, "_collapsedShadowAlphaForExpansionProgress:");
    v6 = v5;

    -[_UIMorphingPlatterView shadowSettings](self, "shadowSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[_UIMorphingPlatterView shadowSettings](self, "shadowSettings");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "shadowOpacity");
      v9 = v6 * v8;
      -[UIView layer](self, "layer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v11 = v9;
      objc_msgSend(v10, "setShadowOpacity:", v11);

    }
    else
    {
      -[_UIMorphingPlatterView shadowViews](self, "shadowViews");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[_UIMorphingPlatterView collapsedShadowStyle](self, "collapsedShadowStyle"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", v13);
      v14 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "setAlpha:", v6);
    }

  }
}

- (void)setExpandedShadowStyle:(int64_t)a3
{
  if (self->_expandedShadowStyle != a3)
  {
    self->_expandedShadowStyle = a3;
    -[_UIMorphingPlatterView _installShadowViewForStyleIfNecessary:](self, "_installShadowViewForStyleIfNecessary:");
  }
}

- (void)setExpandedShadowIntensity:(double)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  float v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  id v14;

  if (vabdd_f64(a3, self->_expandedShadowIntensity) > 2.22044605e-16)
  {
    self->_expandedShadowIntensity = a3;
    -[_UIMorphingPlatterView expansionProgress](self, "expansionProgress");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "value");
    -[_UIMorphingPlatterView _expandedShadowAlphaForExpansionProgress:](self, "_expandedShadowAlphaForExpansionProgress:");
    v6 = v5;

    -[_UIMorphingPlatterView shadowSettings](self, "shadowSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[_UIMorphingPlatterView shadowSettings](self, "shadowSettings");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "shadowOpacity");
      v9 = v6 * v8;
      -[UIView layer](self, "layer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v11 = v9;
      objc_msgSend(v10, "setShadowOpacity:", v11);

    }
    else
    {
      -[_UIMorphingPlatterView shadowViews](self, "shadowViews");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[_UIMorphingPlatterView expandedShadowStyle](self, "expandedShadowStyle"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", v13);
      v14 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "setAlpha:", v6);
    }

  }
}

- (void)setHideChromeWhenCollapsed:(BOOL)a3
{
  if (self->_hideChromeWhenCollapsed != a3)
  {
    self->_hideChromeWhenCollapsed = a3;
    -[_UIMorphingPlatterView _updateCollapsedChrome](self, "_updateCollapsedChrome");
  }
}

- (void)_updateCollapsedChrome
{
  void *v3;
  char v4;
  void *v5;
  id v6;

  if (-[_UIMorphingPlatterView hideChromeWhenCollapsed](self, "hideChromeWhenCollapsed"))
  {
    -[_UIMorphingPlatterView collapsedPreview](self, "collapsedPreview");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "_isLikelyOpaque");

    if ((v4 & 1) == 0)
    {
      +[UIColor clearColor](UIColor, "clearColor");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      -[_UIMorphingPlatterView collapsedTransformView](self, "collapsedTransformView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setBackgroundColor:", v6);

    }
  }
}

- (void)setExpandedPreview:(id)a3
{
  UITargetedPreview *v5;
  UITargetedPreview **p_expandedPreview;
  void *v7;
  UITargetedPreview *v8;
  void *v9;
  UITargetedPreview *v10;
  void *v11;
  void *v12;
  UITargetedPreview *v13;

  v5 = (UITargetedPreview *)a3;
  p_expandedPreview = &self->_expandedPreview;
  if (self->_expandedPreview != v5)
  {
    v13 = v5;
    objc_storeStrong((id *)&self->_expandedPreview, a3);
    if (-[_UIMorphingPlatterView alwaysCompact](self, "alwaysCompact"))
    {
      -[_UIMorphingPlatterView collapsedPreview](self, "collapsedPreview");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITargetedPreview _setPreviewMode:](*p_expandedPreview, "_setPreviewMode:", objc_msgSend(v7, "_previewMode"));

    }
    v8 = *p_expandedPreview;
    -[_UIMorphingPlatterView expandedTransformView](self, "expandedTransformView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSourcePreview:", v8);

    v10 = *p_expandedPreview;
    -[_UIMorphingPlatterView expandedClippingView](self, "expandedClippingView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIMorphingPlatterView expandedTransformView](self, "expandedTransformView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIMorphingPlatterView _installPreview:inClippingView:transformView:](self, "_installPreview:inClippingView:transformView:", v10, v11, v12);

    v5 = v13;
  }

}

- (void)setExpanded:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  uint64_t v7;
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
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;

  if (self->_expanded != a3)
  {
    v3 = a3;
    self->_expanded = a3;
    -[_UIMorphingPlatterView expandedTransformView](self, "expandedTransformView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidesSourceView:", 0);

    -[_UIMorphingPlatterView collapsedTransformView](self, "collapsedTransformView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setForwardsHitTestingToSourceView:", !v3);

    if (v3)
    {
      v7 = 1;
    }
    else
    {
      -[_UIMorphingPlatterView collapsedPreview](self, "collapsedPreview");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "target");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "container");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "traitCollection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v11, "userInterfaceLevel");

    }
    if (-[_UIMorphingPlatterView alwaysCompact](self, "alwaysCompact"))
    {
      -[_UIMorphingPlatterView collapsedPreview](self, "collapsedPreview");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIView _internalTraitOverrides](v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setUserInterfaceLevel:", v7);

    }
    -[UIView _internalTraitOverrides](self);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setUserInterfaceLevel:", v7);

    -[UIView setNeedsLayout](self, "setNeedsLayout");
    -[_UIMorphingPlatterView shadowSettings](self, "shadowSettings");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      if (v3)
        -[_UIMorphingPlatterView expandedPreview](self, "expandedPreview");
      else
        -[_UIMorphingPlatterView collapsedPreview](self, "collapsedPreview");
      v25 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "parameters");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "effectiveShadowPath");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIView layer](self, "layer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v18)
      {
        objc_msgSend(v19, "setShadowPathIsBounds:", 0);

        v21 = objc_msgSend(objc_retainAutorelease(v18), "CGPath");
        -[UIView layer](self, "layer");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v22;
        v24 = v21;
      }
      else
      {
        objc_msgSend(v19, "setShadowPathIsBounds:", 1);

        -[UIView layer](self, "layer");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v22;
        v24 = 0;
      }
      objc_msgSend(v22, "setShadowPath:", v24);

    }
  }
}

- (void)updateContentSize
{
  -[_UIMorphingPlatterView setContentSizeDidChange:](self, "setContentSizeDidChange:", 1);
  -[UIView setNeedsLayout](self, "setNeedsLayout");
  if (+[UIView _isInAnimationBlock](UIView, "_isInAnimationBlock"))
    -[UIView layoutIfNeeded](self, "layoutIfNeeded");
}

- (void)_installShadowViewForStyleIfNecessary:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  _UIDiffuseShadowView *v8;
  void *v9;
  objc_class *v10;
  id v11;
  void *v12;
  uint64_t v13;
  _UIDiffuseShadowView *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  _UIMorphingPlatterView *v22;
  _UIDiffuseShadowView *v23;
  uint64_t v24;
  char v25;

  -[_UIMorphingPlatterView shadowSettings](self, "shadowSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[_UIMorphingPlatterView shadowViews](self, "shadowViews");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v7);
    v8 = (_UIDiffuseShadowView *)objc_claimAutoreleasedReturnValue();

    if (v8)
      goto LABEL_12;
    switch(a3)
    {
      case 1:
        -[_UIMorphingPlatterView pathShadowView](self, "pathShadowView");
        v8 = (_UIDiffuseShadowView *)objc_claimAutoreleasedReturnValue();
        break;
      case 3:
        v14 = [_UIDiffuseShadowView alloc];
        -[_UIMorphingPlatterView expandedClippingView](self, "expandedClippingView");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "bounds");
        v8 = -[_UIDiffuseShadowView initWithFrame:](v14, "initWithFrame:");

        break;
      case 2:
        -[_UIMorphingPlatterView expandedPreview](self, "expandedPreview");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "_previewMode");
        v10 = (objc_class *)objc_opt_class();

        v25 = 0;
        v24 = 0;
        v11 = [v10 alloc];
        -[_UIMorphingPlatterView _expandedCornerRadius:maskedCorners:ignoreLiftScale:](self, "_expandedCornerRadius:maskedCorners:ignoreLiftScale:", &v25, &v24, 1);
        v8 = (_UIDiffuseShadowView *)objc_msgSend(v11, "initWithCornerRadius:");
        +[UIDevice currentDevice](UIDevice, "currentDevice");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "userInterfaceIdiom");

        -[_UIDiffuseShadowView setUseLowerIntensity:](v8, "setUseLowerIntensity:", (v13 & 0xFFFFFFFFFFFFFFFBLL) == 1);
        break;
      default:
        v8 = 0;
LABEL_12:
        -[_UIMorphingPlatterView shadowViews](self, "shadowViews", v18, v19, v20, v21, v22);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v8, v17);

        -[UIView setNeedsLayout](self, "setNeedsLayout");
        return;
    }
    if (v8)
    {
      -[UIView setUserInteractionEnabled:](v8, "setUserInteractionEnabled:", 0);
      v18 = MEMORY[0x1E0C809B0];
      v19 = 3221225472;
      v20 = __64___UIMorphingPlatterView__installShadowViewForStyleIfNecessary___block_invoke;
      v21 = &unk_1E16B1B50;
      v22 = self;
      v8 = v8;
      v23 = v8;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", &v18);

    }
    goto LABEL_12;
  }
}

- (void)_updateShadowsWithExpansionProgress:(double)a3 contentBounds:(CGRect)a4 center:(CGPoint)a5 forPresentation:(BOOL)a6
{
  _BOOL4 v6;
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  CGFloat v11;
  CGFloat v12;
  double v15;
  int64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  float v30;
  double v31;
  CGFloat v32;
  id v33;
  id v34;
  _QWORD v35[14];
  BOOL v36;

  v6 = a6;
  y = a5.y;
  x = a5.x;
  height = a4.size.height;
  width = a4.size.width;
  v11 = a4.origin.y;
  v12 = a4.origin.x;
  v15 = a3;
  if (a6)
    v15 = fmax(fmin(a3 / 0.4, 1.0), 0.0);
  v16 = -[_UIMorphingPlatterView collapsedShadowStyle](self, "collapsedShadowStyle");
  v32 = y;
  if (v16 == -[_UIMorphingPlatterView expandedShadowStyle](self, "expandedShadowStyle"))
  {
    v19 = 1.0;
    v17 = 1.0;
    if (!-[_UIMorphingPlatterView alwaysCompact](self, "alwaysCompact"))
      goto LABEL_8;
    -[_UIMorphingPlatterView collapsedShadowIntensity](self, "collapsedShadowIntensity");
    v19 = v20;
  }
  else
  {
    -[_UIMorphingPlatterView _expandedShadowAlphaForExpansionProgress:](self, "_expandedShadowAlphaForExpansionProgress:", v15);
    v19 = v18;
    -[_UIMorphingPlatterView _collapsedShadowAlphaForExpansionProgress:](self, "_collapsedShadowAlphaForExpansionProgress:", v15);
  }
  v17 = v20;
LABEL_8:
  -[_UIMorphingPlatterView shadowSettings](self, "shadowSettings", *(_QWORD *)&v32);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v22 = 0.0;
    v23 = 0.0;
    if (-[_UIMorphingPlatterView collapsedShadowStyle](self, "collapsedShadowStyle"))
    {
      -[_UIMorphingPlatterView collapsedShadowIntensity](self, "collapsedShadowIntensity");
      v23 = v24;
    }
    if (-[_UIMorphingPlatterView expandedShadowStyle](self, "expandedShadowStyle"))
    {
      -[_UIMorphingPlatterView expandedShadowIntensity](self, "expandedShadowIntensity");
      v22 = v25;
    }
    -[_UIMorphingPlatterView shadowSettings](self, "shadowSettings");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "shadowOpacity");
    v28 = ((1.0 - a3) * v23 + v22 * a3) * v27;

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v28);
      v34 = (id)objc_claimAutoreleasedReturnValue();
      -[UIView _setPresentationValue:forKey:](self, "_setPresentationValue:forKey:", v34, CFSTR("shadowOpacity"));
    }
    else
    {
      -[UIView layer](self, "layer");
      v34 = (id)objc_claimAutoreleasedReturnValue();
      v30 = v28;
      *(float *)&v31 = v30;
      objc_msgSend(v34, "setShadowOpacity:", v31);
    }

  }
  else
  {
    -[_UIMorphingPlatterView shadowViews](self, "shadowViews");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __99___UIMorphingPlatterView__updateShadowsWithExpansionProgress_contentBounds_center_forPresentation___block_invoke;
    v35[3] = &unk_1E16DC0F0;
    *(CGFloat *)&v35[5] = v12;
    *(CGFloat *)&v35[6] = v11;
    *(CGFloat *)&v35[7] = width;
    *(CGFloat *)&v35[8] = height;
    v35[4] = self;
    *(double *)&v35[9] = v19;
    *(double *)&v35[10] = v17;
    v36 = v6;
    *(double *)&v35[11] = a3;
    *(CGFloat *)&v35[12] = x;
    v35[13] = v33;
    objc_msgSend(v29, "enumerateKeysAndObjectsUsingBlock:", v35);

  }
}

- (void)_updatePathShadowTransform
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double Width;
  CGFloat v22;
  double Height;
  CGFloat v24;
  CGFloat rect;
  CGAffineTransform rect_8;
  CGAffineTransform v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  -[UIView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[_UIMorphingPlatterView pathShadowView](self, "pathShadowView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  rect = v4;
  objc_msgSend(v11, "setCenter:", v4 + v8 * 0.5, v6 + v10 * 0.5);
  -[_UIMorphingPlatterView collapsedTransformView](self, "collapsedTransformView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v28.origin.x = v4;
  v28.origin.y = v6;
  v28.size.width = v8;
  v28.size.height = v10;
  Width = CGRectGetWidth(v28);
  v29.origin.x = v14;
  v29.origin.y = v16;
  v29.size.width = v18;
  v29.size.height = v20;
  v22 = Width / CGRectGetWidth(v29);
  v30.origin.x = rect;
  v30.origin.y = v6;
  v30.size.width = v8;
  v30.size.height = v10;
  Height = CGRectGetHeight(v30);
  v31.origin.x = v14;
  v31.origin.y = v16;
  v31.size.width = v18;
  v31.size.height = v20;
  v24 = CGRectGetHeight(v31);
  CGAffineTransformMakeScale(&v27, v22, Height / v24);
  rect_8 = v27;
  objc_msgSend(v11, "setTransform:", &rect_8);

}

- (double)_expandedShadowAlphaForExpansionProgress:(double)a3
{
  double v4;

  -[_UIMorphingPlatterView expandedShadowIntensity](self, "expandedShadowIntensity");
  return (1.0 - a3) * 0.0 + v4 * a3;
}

- (double)_collapsedShadowAlphaForExpansionProgress:(double)a3
{
  double v4;

  -[_UIMorphingPlatterView collapsedShadowIntensity](self, "collapsedShadowIntensity");
  return a3 * 0.0 + (1.0 - a3) * v4;
}

- (void)_installPreview:(id)a3 inClippingView:(id)a4 transformView:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  BOOL v32;
  void *v33;
  uint64_t (**v34)(_QWORD, _QWORD);
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v39;
  CGFloat MinY;
  _UIShapeView *v41;
  _UIShapeView *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  CGAffineTransform v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!-[_UIMorphingPlatterView _previewPrefersApplyingMask:](self, "_previewPrefersApplyingMask:", v8))
    goto LABEL_19;
  objc_msgSend(v8, "parameters");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "backgroundColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "parameters");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "visiblePath");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copy");

  objc_msgSend(v8, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v15;
  v18 = v16;
  v19 = v18;
  if (v17)
  {
    if ((objc_msgSend(v17, "_isRoundedRect") & 1) == 0)
    {

LABEL_10:
      objc_msgSend(v17, "bounds");
      x = v50.origin.x;
      y = v50.origin.y;
      width = v50.size.width;
      height = v50.size.height;
      v39 = -CGRectGetMinX(v50);
      v51.origin.x = x;
      v51.origin.y = y;
      v51.size.width = width;
      v51.size.height = height;
      MinY = CGRectGetMinY(v51);
      CGAffineTransformMakeTranslation(&v48, v39, -MinY);
      objc_msgSend(v17, "applyTransform:", &v48);
      v41 = [_UIShapeView alloc];
      objc_msgSend(v10, "bounds");
      v42 = -[UIView initWithFrame:](v41, "initWithFrame:");
      v43 = objc_msgSend(objc_retainAutorelease(v17), "CGPath");
      -[_UIShapeView shapeLayer](v42, "shapeLayer");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setPath:", v43);

      objc_msgSend(v10, "setMaskView:", v42);
      objc_msgSend(v10, "setBackgroundColor:", v12);
      +[UIColor clearColor](UIColor, "clearColor");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setBackgroundColor:", v45);

      objc_msgSend(v9, "setClipsToBounds:", 0);
LABEL_15:

      goto LABEL_16;
    }
    objc_msgSend(v17, "bounds");
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;
    objc_msgSend(v19, "bounds");
    v52.origin.x = v28;
    v52.origin.y = v29;
    v52.size.width = v30;
    v52.size.height = v31;
    v49.origin.x = v21;
    v49.origin.y = v23;
    v49.size.width = v25;
    v49.size.height = v27;
    v32 = CGRectEqualToRect(v49, v52);

    if (!v32)
      goto LABEL_10;
  }
  else
  {

  }
  objc_msgSend(v10, "setMaskView:", 0);
  objc_msgSend(v10, "setBackgroundColor:", v12);
  -[_UIMorphingPlatterView shouldApplyClippingHandler](self, "shouldApplyClippingHandler");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    -[_UIMorphingPlatterView shouldApplyClippingHandler](self, "shouldApplyClippingHandler");
    v34 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setClipsToBounds:", ((uint64_t (**)(_QWORD, id))v34)[2](v34, v8));

  }
  else
  {
    objc_msgSend(v9, "setClipsToBounds:", 1);
  }
  if (!objc_msgSend(v12, "_isOpaque"))
  {
    +[UIColor clearColor](UIColor, "clearColor");
    v42 = (_UIShapeView *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColor:", v42);
    goto LABEL_15;
  }
  objc_msgSend(v9, "setBackgroundColor:", v12);
LABEL_16:
  if (-[_UIMorphingPlatterView bothViewsAreLikelyOpaque](self, "bothViewsAreLikelyOpaque"))
  {
    +[UIColor clearColor](UIColor, "clearColor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIMorphingPlatterView collapsedClippingView](self, "collapsedClippingView");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setBackgroundColor:", v46);

  }
LABEL_19:

}

- (UITargetedPreview)collapsedPreview
{
  return self->_collapsedPreview;
}

- (UITargetedPreview)expandedPreview
{
  return self->_expandedPreview;
}

- (BOOL)expanded
{
  return self->_expanded;
}

- (BOOL)hideChromeWhenCollapsed
{
  return self->_hideChromeWhenCollapsed;
}

- (BOOL)alwaysCompact
{
  return self->_alwaysCompact;
}

- (BOOL)preventPreviewRasterization
{
  return self->_preventPreviewRasterization;
}

- (BOOL)shouldMorphContents
{
  return self->_shouldMorphContents;
}

- (void)setShouldMorphContents:(BOOL)a3
{
  self->_shouldMorphContents = a3;
}

- (BOOL)allowsElasticMorph
{
  return self->_allowsElasticMorph;
}

- (void)setAllowsElasticMorph:(BOOL)a3
{
  self->_allowsElasticMorph = a3;
}

- (unint64_t)preferredMorphingAxis
{
  return self->_preferredMorphingAxis;
}

- (void)setPreferredMorphingAxis:(unint64_t)a3
{
  self->_preferredMorphingAxis = a3;
}

- (double)collapsedShadowIntensity
{
  return self->_collapsedShadowIntensity;
}

- (int64_t)collapsedShadowStyle
{
  return self->_collapsedShadowStyle;
}

- (double)expandedShadowIntensity
{
  return self->_expandedShadowIntensity;
}

- (int64_t)expandedShadowStyle
{
  return self->_expandedShadowStyle;
}

- (_UIPlatterShadowSettings)shadowSettings
{
  return self->_shadowSettings;
}

- (void)setShadowSettings:(id)a3
{
  objc_storeStrong((id *)&self->_shadowSettings, a3);
}

- (double)overrideCollapsedCornerRadius
{
  return self->_overrideCollapsedCornerRadius;
}

- (void)setOverrideCollapsedCornerRadius:(double)a3
{
  self->_overrideCollapsedCornerRadius = a3;
}

- (double)overrideExpandedCornerRadius
{
  return self->_overrideExpandedCornerRadius;
}

- (void)setOverrideExpandedCornerRadius:(double)a3
{
  self->_overrideExpandedCornerRadius = a3;
}

- (NSDictionary)separatedOptions
{
  return self->_separatedOptions;
}

- (void)setSeparatedOptions:(id)a3
{
  objc_storeStrong((id *)&self->_separatedOptions, a3);
}

- (id)shouldApplyClippingHandler
{
  return self->_shouldApplyClippingHandler;
}

- (void)setShouldApplyClippingHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 512);
}

- (_UIPlatterClippingView)collapsedClippingView
{
  return self->_collapsedClippingView;
}

- (void)setCollapsedClippingView:(id)a3
{
  objc_storeStrong((id *)&self->_collapsedClippingView, a3);
}

- (_UIPlatterTransformView)collapsedTransformView
{
  return self->_collapsedTransformView;
}

- (void)setCollapsedTransformView:(id)a3
{
  objc_storeStrong((id *)&self->_collapsedTransformView, a3);
}

- (_UIPlatterClippingView)expandedClippingView
{
  return self->_expandedClippingView;
}

- (void)setExpandedClippingView:(id)a3
{
  objc_storeStrong((id *)&self->_expandedClippingView, a3);
}

- (_UIPlatterTransformView)expandedTransformView
{
  return self->_expandedTransformView;
}

- (void)setExpandedTransformView:(id)a3
{
  objc_storeStrong((id *)&self->_expandedTransformView, a3);
}

- (NSMutableDictionary)shadowViews
{
  return self->_shadowViews;
}

- (void)setShadowViews:(id)a3
{
  objc_storeStrong((id *)&self->_shadowViews, a3);
}

- (_UIPlatterSoftShadowView)pathShadowView
{
  return self->_pathShadowView;
}

- (void)setPathShadowView:(id)a3
{
  objc_storeStrong((id *)&self->_pathShadowView, a3);
}

- (BOOL)isFrozen
{
  return self->_frozen;
}

- (void)setFrozen:(BOOL)a3
{
  self->_frozen = a3;
}

- (BOOL)contentSizeDidChange
{
  return self->_contentSizeDidChange;
}

- (void)setContentSizeDidChange:(BOOL)a3
{
  self->_contentSizeDidChange = a3;
}

- (_UIMorphingPlatterAnimatableFloat)expansionProgress
{
  return self->_expansionProgress;
}

- (void)setExpansionProgress:(id)a3
{
  objc_storeStrong((id *)&self->_expansionProgress, a3);
}

- (_UIMorphingPlatterAnimatableFloat)platterWidth
{
  return self->_platterWidth;
}

- (void)setPlatterWidth:(id)a3
{
  objc_storeStrong((id *)&self->_platterWidth, a3);
}

- (_UIMorphingPlatterAnimatableFloat)platterHeight
{
  return self->_platterHeight;
}

- (void)setPlatterHeight:(id)a3
{
  objc_storeStrong((id *)&self->_platterHeight, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platterHeight, 0);
  objc_storeStrong((id *)&self->_platterWidth, 0);
  objc_storeStrong((id *)&self->_expansionProgress, 0);
  objc_storeStrong((id *)&self->_pathShadowView, 0);
  objc_storeStrong((id *)&self->_shadowViews, 0);
  objc_storeStrong((id *)&self->_expandedTransformView, 0);
  objc_storeStrong((id *)&self->_expandedClippingView, 0);
  objc_storeStrong((id *)&self->_collapsedTransformView, 0);
  objc_storeStrong((id *)&self->_collapsedClippingView, 0);
  objc_storeStrong(&self->_shouldApplyClippingHandler, 0);
  objc_storeStrong((id *)&self->_separatedOptions, 0);
  objc_storeStrong((id *)&self->_shadowSettings, 0);
  objc_storeStrong((id *)&self->_expandedPreview, 0);
  objc_storeStrong((id *)&self->_collapsedPreview, 0);
}

@end
