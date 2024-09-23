@implementation _UIHighlightPlatterView

- (_UIHighlightPlatterView)initWithTargetedPreview:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  _UIHighlightPlatterView *v20;
  _UIHighlightPlatterView *v21;
  _UIPortalView *v22;
  _UIPortalView *v23;
  void *v24;
  id v25;
  void *v26;
  double v27;
  double v28;
  _UIShapeView *v29;
  _UIShapeView *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  uint64_t v36;
  UIView *v37;
  UIView *v38;
  _UIShapeView *v39;
  _UIShapeView *v40;
  void *v41;
  id v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  _UIPlatterSoftShadowView *v47;
  _UIPlatterSoftShadowView *v48;
  void *v49;
  void *v51;
  CGAffineTransform v52;
  objc_super v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;

  v4 = a3;
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "visiblePath");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  objc_msgSend(v5, "bounds");
  if (v7)
  {
    v19 = v15;
    v18 = v13;
    v17 = 0.0;
    v16 = 0.0;
  }
  v53.receiver = self;
  v53.super_class = (Class)_UIHighlightPlatterView;
  v20 = -[UIView initWithFrame:](&v53, sel_initWithFrame_, v16, v17, v18, v19, 0.0);
  v21 = v20;
  if (v20)
  {
    -[UIView setUserInteractionEnabled:](v20, "setUserInteractionEnabled:", 0);
    -[_UIHighlightPlatterView setTargetedPreview:](v21, "setTargetedPreview:", v4);
    if (objc_msgSend(v4, "_sourceViewIsInViewHierarchy"))
    {
      v22 = [_UIPortalView alloc];
      objc_msgSend(v5, "bounds");
      v23 = -[_UIPortalView initWithFrame:](v22, "initWithFrame:");
      -[_UIPortalView setName:](v23, "setName:", CFSTR("_UIHighlightPlatterView.contentPortal"));
      objc_msgSend(v4, "view");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIPortalView setSourceView:](v23, "setSourceView:", v24);

      -[_UIPortalView setHidesSourceView:](v23, "setHidesSourceView:", 1);
      -[_UIPortalView setMatchesAlpha:](v23, "setMatchesAlpha:", 1);
      -[UIView setUserInteractionEnabled:](v23, "setUserInteractionEnabled:", 0);
      -[_UIPortalView setAllowsBackdropGroups:](v23, "setAllowsBackdropGroups:", 1);
      -[UIView addSubview:](v21, "addSubview:", v23);
      -[_UIHighlightPlatterView setPortalView:](v21, "setPortalView:", v23);

      -[_UIHighlightPlatterView portalView](v21, "portalView");
      v25 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[UIView addSubview:](v21, "addSubview:", v5);
      v25 = v5;
    }
    v26 = v25;
    v54.origin.x = v9;
    v54.origin.y = v11;
    v54.size.width = v13;
    v54.size.height = v15;
    v27 = -CGRectGetMinX(v54);
    v55.origin.x = v9;
    v55.origin.y = v11;
    v55.size.width = v13;
    v55.size.height = v15;
    v28 = -CGRectGetMinY(v55);
    if (objc_msgSend(v4, "_previewMode") != 4)
    {
      objc_msgSend(v26, "bounds");
      v57 = CGRectOffset(v56, v27, v28);
      objc_msgSend(v26, "setFrame:", v57.origin.x, v57.origin.y, v57.size.width, v57.size.height);
      if (objc_msgSend(v4, "_previewMode") != 5)
      {
        if (v7)
        {
          v29 = [_UIShapeView alloc];
          objc_msgSend(v26, "bounds");
          v30 = -[UIView initWithFrame:](v29, "initWithFrame:");
          v7 = objc_retainAutorelease(v7);
          v31 = objc_msgSend(v7, "CGPath");
          -[_UIShapeView shapeLayer](v30, "shapeLayer");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setPath:", v31);

          -[UIView _setSafeMaskView:](v26, v30);
        }
        else
        {
          -[UIView _outlinePath](v5);
          v7 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
    }
    objc_msgSend(v4, "parameters");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "appliesShadow");

    if (v34)
    {
      objc_msgSend(v4, "parameters");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "backgroundColor");
      v36 = objc_claimAutoreleasedReturnValue();

      v37 = [UIView alloc];
      v51 = (void *)v36;
      if (v7)
      {
        -[UIView bounds](v21, "bounds");
        v38 = -[UIView initWithFrame:](v37, "initWithFrame:");
        -[UIView setBackgroundColor:](v38, "setBackgroundColor:", v36);
        -[UIView setAlpha:](v38, "setAlpha:", 0.0);
        v39 = [_UIShapeView alloc];
        -[UIView bounds](v38, "bounds");
        v40 = -[UIView initWithFrame:](v39, "initWithFrame:");
        v41 = (void *)objc_msgSend(v7, "copy");
        CGAffineTransformMakeTranslation(&v52, v27, v28);
        objc_msgSend(v41, "applyTransform:", &v52);
        v42 = objc_retainAutorelease(v41);
        v43 = objc_msgSend(v42, "CGPath");
        -[_UIShapeView shapeLayer](v40, "shapeLayer");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "setPath:", v43);

        -[UIView setMaskView:](v38, "setMaskView:", v40);
      }
      else
      {
        objc_msgSend(v26, "frame");
        v38 = -[UIView initWithFrame:](v37, "initWithFrame:");
        -[UIView setBackgroundColor:](v38, "setBackgroundColor:", v36);
      }
      -[_UIHighlightPlatterView setBackgroundView:](v21, "setBackgroundView:", v38);

      objc_msgSend(v4, "parameters");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "effectiveShadowPath");
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v46)
      {
        -[UIView _outlinePath](v5);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v47 = [_UIPlatterSoftShadowView alloc];
      objc_msgSend(v26, "frame");
      v48 = -[_UIPlatterSoftShadowView initWithFrame:shadowPath:](v47, "initWithFrame:shadowPath:", v46);
      -[UIView setAlpha:](v48, "setAlpha:", 0.0);
      if ((objc_msgSend(v51, "_isOpaque") & 1) != 0)
      {
        objc_msgSend(v5, "backgroundColor");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIPlatterSoftShadowView setNeedsPunchOut:](v48, "setNeedsPunchOut:", objc_msgSend(v49, "_isOpaque") ^ 1);

      }
      else
      {
        -[_UIPlatterSoftShadowView setNeedsPunchOut:](v48, "setNeedsPunchOut:", 1);
      }
      -[_UIHighlightPlatterView setShadowView:](v21, "setShadowView:", v48);

    }
  }

  return v21;
}

- (void)setShadowAlpha:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  double shadowAlpha;
  id v8;

  if (self->_shadowAlpha != a3)
  {
    self->_shadowAlpha = a3;
    -[_UIHighlightPlatterView shadowView](self, "shadowView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      -[_UIHighlightPlatterView shadowView](self, "shadowView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", v6, 0);

    }
    shadowAlpha = self->_shadowAlpha;
    -[_UIHighlightPlatterView shadowView](self, "shadowView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAlpha:", shadowAlpha);

  }
}

- (void)setBackgroundAlpha:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double backgroundAlpha;
  id v11;

  if (self->_backgroundAlpha != a3)
  {
    self->_backgroundAlpha = a3;
    -[_UIHighlightPlatterView backgroundView](self, "backgroundView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      -[_UIHighlightPlatterView shadowView](self, "shadowView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "superview");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      -[_UIHighlightPlatterView backgroundView](self, "backgroundView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        -[_UIHighlightPlatterView shadowView](self, "shadowView");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v8, v9);

      }
      else
      {
        -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", v8, 0);
      }

    }
    backgroundAlpha = self->_backgroundAlpha;
    -[_UIHighlightPlatterView backgroundView](self, "backgroundView");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAlpha:", backgroundAlpha);

  }
}

- (BOOL)_isEligibleForFocusOcclusion
{
  return 0;
}

- (double)shadowAlpha
{
  return self->_shadowAlpha;
}

- (double)backgroundAlpha
{
  return self->_backgroundAlpha;
}

- (UITargetedPreview)targetedPreview
{
  return self->_targetedPreview;
}

- (void)setTargetedPreview:(id)a3
{
  objc_storeStrong((id *)&self->_targetedPreview, a3);
}

- (_UIPortalView)portalView
{
  return self->_portalView;
}

- (void)setPortalView:(id)a3
{
  objc_storeStrong((id *)&self->_portalView, a3);
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (_UIPlatterSoftShadowView)shadowView
{
  return self->_shadowView;
}

- (void)setShadowView:(id)a3
{
  objc_storeStrong((id *)&self->_shadowView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_portalView, 0);
  objc_storeStrong((id *)&self->_targetedPreview, 0);
}

@end
