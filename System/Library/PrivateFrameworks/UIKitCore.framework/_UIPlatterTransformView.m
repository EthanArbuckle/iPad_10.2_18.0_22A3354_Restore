@implementation _UIPlatterTransformView

- (_UIPlatterTransformView)initWithFrame:(CGRect)a3
{
  _UIPlatterTransformView *v3;
  _UIPlatterTransformView *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIPlatterTransformView;
  v3 = -[UIView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAnchorPoint:", 0.5, 0.0);

    -[UIView setAutoresizesSubviews:](v4, "setAutoresizesSubviews:", 0);
    -[UIView _setShouldAdaptToMaterials:](v4, "_setShouldAdaptToMaterials:", 0);
  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[_UIPlatterTransformView backgroundCaptureView](self, "backgroundCaptureView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  v4.receiver = self;
  v4.super_class = (Class)_UIPlatterTransformView;
  -[UIView dealloc](&v4, sel_dealloc);
}

- (UIView)sourceView
{
  void *v2;
  void *v3;

  -[_UIPlatterTransformView sourcePreview](self, "sourcePreview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (void)setSourcePreview:(id)a3
{
  UITargetedPreview *v5;
  UITargetedPreview **p_sourcePreview;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  _BOOL4 v17;
  _UIPortalView *v18;
  _UIPortalView *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _UIPortalView *v29;
  void *v30;
  _UIPortalView *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double x;
  double y;
  double width;
  double height;
  void *v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  void *v57;
  UITargetedPreview *v58;
  CGRect v59;
  CGRect v60;

  v5 = (UITargetedPreview *)a3;
  p_sourcePreview = &self->_sourcePreview;
  if (self->_sourcePreview != v5)
  {
    v58 = v5;
    if (-[_UIPlatterTransformView shouldTakeOwnershipOfSourceView](self, "shouldTakeOwnershipOfSourceView"))
    {
      -[UITargetedPreview view](*p_sourcePreview, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeFromSuperview");

    }
    objc_storeStrong((id *)&self->_sourcePreview, a3);
    if (-[_UIPlatterTransformView allowsUserInteraction](self, "allowsUserInteraction"))
      v8 = 1;
    else
      v8 = -[UITargetedPreview _sourceViewIsInViewHierarchy](*p_sourcePreview, "_sourceViewIsInViewHierarchy") ^ 1;
    -[_UIPlatterTransformView setShouldTakeOwnershipOfSourceView:](self, "setShouldTakeOwnershipOfSourceView:", v8);
    -[UIView bounds](self, "bounds");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v17 = -[_UIPlatterTransformView shouldTakeOwnershipOfSourceView](self, "shouldTakeOwnershipOfSourceView");
    -[_UIPlatterTransformView portalView](self, "portalView");
    v18 = (_UIPortalView *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v17)
    {
      -[UIView removeFromSuperview](v18, "removeFromSuperview");

      -[_UIPlatterTransformView sourceView](self, "sourceView");
      v19 = (_UIPortalView *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!v18)
      {
        v19 = -[_UIPortalView initWithFrame:]([_UIPortalView alloc], "initWithFrame:", v10, v12, v14, v16);
        -[_UIPortalView setAllowsBackdropGroups:](v19, "setAllowsBackdropGroups:", 1);
        -[_UIPortalView setHidesSourceView:](v19, "setHidesSourceView:", -[_UIPlatterTransformView hidesSourceView](self, "hidesSourceView"));
        -[_UIPortalView setMatchesAlpha:](v19, "setMatchesAlpha:", -[_UIPlatterTransformView matchesAlpha](self, "matchesAlpha"));
        -[_UIPortalView setForwardsClientHitTestingToSourceView:](v19, "setForwardsClientHitTestingToSourceView:", -[_UIPlatterTransformView forwardsHitTestingToSourceView](self, "forwardsHitTestingToSourceView"));
        -[_UIPlatterTransformView sourceView](self, "sourceView");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "layer");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "flipsHorizontalAxis");
        -[UIView layer](v19, "layer");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setFlipsHorizontalAxis:", v22);

        -[_UIPortalView setName:](v19, "setName:", CFSTR("_UIPlatterTransformView.content"));
        -[_UIPlatterTransformView setPortalView:](self, "setPortalView:", v19);
      }
      -[_UIPlatterTransformView sourceView](self, "sourceView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIPortalView setSourceView:](v19, "setSourceView:", v24);

    }
    -[UIView addSubview:](self, "addSubview:", v19);

    -[UIView sizeToFit](self, "sizeToFit");
    if (-[UITargetedPreview _captureHierarchyBelowSourceView](v58, "_captureHierarchyBelowSourceView")
      && -[UITargetedPreview _sourceViewIsInViewHierarchy](v58, "_sourceViewIsInViewHierarchy"))
    {
      -[_UIPlatterTransformView backgroundCaptureView](self, "backgroundCaptureView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v25)
      {
        v26 = (void *)objc_opt_new();
        -[_UIPlatterTransformView setBackgroundCaptureView:](self, "setBackgroundCaptureView:", v26);

        -[_UIPlatterTransformView backgroundCaptureView](self, "backgroundCaptureView");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setAlpha:", 0.002);

      }
      -[_UIPlatterTransformView backgroundPortalView](self, "backgroundPortalView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v28)
      {
        v29 = [_UIPortalView alloc];
        -[_UIPlatterTransformView backgroundCaptureView](self, "backgroundCaptureView");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = -[_UIPortalView initWithSourceView:](v29, "initWithSourceView:", v30);
        -[_UIPlatterTransformView setBackgroundPortalView:](self, "setBackgroundPortalView:", v31);

        -[_UIPlatterTransformView backgroundPortalView](self, "backgroundPortalView");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setName:", CFSTR("_UIPlatterTransformView.backgroundCapture"));

        -[_UIPlatterTransformView backgroundPortalView](self, "backgroundPortalView");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setAllowsBackdropGroups:", 1);

      }
      -[UITargetedPreview target](v58, "target");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "container");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIPlatterTransformView backgroundCaptureView](self, "backgroundCaptureView");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITargetedPreview view](v58, "view");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "insertSubview:belowSubview:", v36, v37);

      -[_UIPlatterTransformView backgroundPortalView](self, "backgroundPortalView");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", v38, 0);

      -[UITargetedPreview view](v58, "view");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "frame");
      v60 = CGRectInset(v59, -50.0, 0.0);
      x = v60.origin.x;
      y = v60.origin.y;
      width = v60.size.width;
      height = v60.size.height;
      -[_UIPlatterTransformView backgroundCaptureView](self, "backgroundCaptureView");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setFrame:", x, y, width, height);

      -[_UIPlatterTransformView backgroundCaptureView](self, "backgroundCaptureView");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "bounds");
      v47 = v46;
      v49 = v48;
      -[UIView bounds](self, "bounds");
      v54 = round(v53 + v52 * 0.5 - v49 * 0.5);
      v55 = round(v51 + v50 * 0.5 - v47 * 0.5);
      -[_UIPlatterTransformView backgroundPortalView](self, "backgroundPortalView");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "setFrame:", v55, v54, v47, v49);

    }
    else
    {
      -[_UIPlatterTransformView backgroundCaptureView](self, "backgroundCaptureView");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "removeFromSuperview");

      -[_UIPlatterTransformView backgroundPortalView](self, "backgroundPortalView");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "removeFromSuperview");
    }

    v5 = v58;
  }

}

- (void)didTearOffForDrag
{
  void *v3;
  id v4;

  -[_UIPlatterTransformView sourceView](self, "sourceView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v4, "setHidesSourceView:", 0);
  -[_UIPlatterTransformView setHidesSourceView:](self, "setHidesSourceView:", 0);
  -[_UIPlatterTransformView backgroundCaptureView](self, "backgroundCaptureView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  BOOL v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v47;
  objc_super v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  v48.receiver = self;
  v48.super_class = (Class)_UIPlatterTransformView;
  -[UIView layoutSubviews](&v48, sel_layoutSubviews);
  if (-[_UIPlatterTransformView shouldTakeOwnershipOfSourceView](self, "shouldTakeOwnershipOfSourceView"))
    -[_UIPlatterTransformView sourceView](self, "sourceView");
  else
    -[_UIPlatterTransformView portalView](self, "portalView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPlatterTransformView sourcePreview](self, "sourcePreview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "visiblePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIPlatterTransformView sourceView](self, "sourceView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  v9 = v7;
  v10 = v9;
  if (v8)
  {
    if ((objc_msgSend(v8, "_isRoundedRect") & 1) == 0)
    {

LABEL_11:
      -[_UIPlatterTransformView sourceView](self, "sourceView");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "bounds");
      v36 = v35;
      v47 = v35;
      v38 = v37;
      v40 = v39;
      v42 = v41;

      objc_msgSend(v8, "bounds");
      x = v50.origin.x;
      y = v50.origin.y;
      width = v50.size.width;
      height = v50.size.height;
      v32 = v36 + v40 * 0.5 - CGRectGetMinX(v50);
      v51.origin.x = x;
      v51.origin.y = y;
      v51.size.width = width;
      v51.size.height = height;
      v33 = v38 + v42 * 0.5 - CGRectGetMinY(v51);
      objc_msgSend(v3, "setBounds:", v47, v38, v40, v42);
      goto LABEL_12;
    }
    objc_msgSend(v8, "bounds");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    objc_msgSend(v10, "bounds");
    v52.origin.x = v19;
    v52.origin.y = v20;
    v52.size.width = v21;
    v52.size.height = v22;
    v49.origin.x = v12;
    v49.origin.y = v14;
    v49.size.width = v16;
    v49.size.height = v18;
    v23 = CGRectEqualToRect(v49, v52);

    if (!v23)
      goto LABEL_11;
  }
  else
  {

  }
  -[UIView bounds](self, "bounds");
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;
  objc_msgSend(v3, "setBounds:");
  v32 = v25 + v29 * 0.5;
  v33 = v27 + v31 * 0.5;
LABEL_12:
  objc_msgSend(v3, "setCenter:", v32, v33);

}

- (void)didMoveToWindow
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIPlatterTransformView;
  -[UIView didMoveToWindow](&v6, sel_didMoveToWindow);
  -[_UIPlatterTransformView _updateMinificationFilter](self, "_updateMinificationFilter");
  -[UIView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[_UIPlatterTransformView backgroundCaptureView](self, "backgroundCaptureView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

    -[_UIPlatterTransformView backgroundPortalView](self, "backgroundPortalView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFromSuperview");

  }
}

- (void)setHidesSourceView:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_hidesSourceView != a3)
  {
    v3 = a3;
    self->_hidesSourceView = a3;
    -[_UIPlatterTransformView portalView](self, "portalView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHidesSourceView:", v3);

  }
}

- (void)setForwardsHitTestingToSourceView:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_forwardsHitTestingToSourceView != a3)
  {
    v3 = a3;
    self->_forwardsHitTestingToSourceView = a3;
    -[_UIPlatterTransformView portalView](self, "portalView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setForwardsClientHitTestingToSourceView:", v3);

  }
}

- (void)setMatchesAlpha:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_matchesAlpha != a3)
  {
    v3 = a3;
    self->_matchesAlpha = a3;
    -[_UIPlatterTransformView portalView](self, "portalView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setMatchesAlpha:", v3);

  }
}

- (void)setAppliesMinificationFilter:(BOOL)a3
{
  if (self->_appliesMinificationFilter != a3)
  {
    self->_appliesMinificationFilter = a3;
    -[_UIPlatterTransformView _updateMinificationFilter](self, "_updateMinificationFilter");
  }
}

- (void)_updateMinificationFilter
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  uint64_t *v12;
  uint64_t v13;
  id v14;

  -[UIView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = -[_UIPlatterTransformView appliesMinificationFilter](self, "appliesMinificationFilter");
    -[UIView layer](self, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4)
    {
      objc_msgSend(v5, "setShouldRasterize:", 1);

      -[UIView window](self, "window");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "screen");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "scale");
      v10 = v9;
      -[UIView layer](self, "layer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setRasterizationScale:", v10);

      v12 = (uint64_t *)MEMORY[0x1E0CD2B98];
    }
    else
    {
      objc_msgSend(v5, "setShouldRasterize:", 0);

      v12 = (uint64_t *)MEMORY[0x1E0CD2DF0];
    }
    v13 = *v12;
    -[UIView layer](self, "layer");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setMinificationFilter:", v13);

  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  BOOL v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  objc_super v38;
  CGSize result;
  CGRect v40;
  CGRect v41;

  height = a3.height;
  width = a3.width;
  -[_UIPlatterTransformView sourceView](self, "sourceView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_UIPlatterTransformView sourcePreview](self, "sourcePreview");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "parameters");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "visiblePath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UIPlatterTransformView sourceView](self, "sourceView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v9;
    v12 = v10;
    v13 = v12;
    if (v11)
    {
      if ((objc_msgSend(v11, "_isRoundedRect") & 1) == 0)
      {

LABEL_10:
        objc_msgSend(v11, "bounds");
        v28 = v34;
        v30 = v35;
        goto LABEL_11;
      }
      objc_msgSend(v11, "bounds");
      v15 = v14;
      v17 = v16;
      v19 = v18;
      v21 = v20;
      objc_msgSend(v13, "bounds");
      v41.origin.x = v22;
      v41.origin.y = v23;
      v41.size.width = v24;
      v41.size.height = v25;
      v40.origin.x = v15;
      v40.origin.y = v17;
      v40.size.width = v19;
      v40.size.height = v21;
      v26 = CGRectEqualToRect(v40, v41);

      if (!v26)
        goto LABEL_10;
    }
    else
    {

    }
    -[_UIPlatterTransformView sourceView](self, "sourceView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "bounds");
    v28 = v32;
    v30 = v33;

LABEL_11:
    goto LABEL_12;
  }
  v38.receiver = self;
  v38.super_class = (Class)_UIPlatterTransformView;
  -[UIView sizeThatFits:](&v38, sel_sizeThatFits_, width, height);
  v28 = v27;
  v30 = v29;
LABEL_12:
  v36 = v28;
  v37 = v30;
  result.height = v37;
  result.width = v36;
  return result;
}

- (BOOL)hidesSourceView
{
  return self->_hidesSourceView;
}

- (BOOL)forwardsHitTestingToSourceView
{
  return self->_forwardsHitTestingToSourceView;
}

- (BOOL)matchesAlpha
{
  return self->_matchesAlpha;
}

- (BOOL)appliesMinificationFilter
{
  return self->_appliesMinificationFilter;
}

- (BOOL)allowsUserInteraction
{
  return self->_allowsUserInteraction;
}

- (void)setAllowsUserInteraction:(BOOL)a3
{
  self->_allowsUserInteraction = a3;
}

- (UITargetedPreview)sourcePreview
{
  return self->_sourcePreview;
}

- (_UIPortalView)portalView
{
  return self->_portalView;
}

- (void)setPortalView:(id)a3
{
  objc_storeStrong((id *)&self->_portalView, a3);
}

- (BOOL)shouldTakeOwnershipOfSourceView
{
  return self->_shouldTakeOwnershipOfSourceView;
}

- (void)setShouldTakeOwnershipOfSourceView:(BOOL)a3
{
  self->_shouldTakeOwnershipOfSourceView = a3;
}

- (_UIPortalView)backgroundPortalView
{
  return self->_backgroundPortalView;
}

- (void)setBackgroundPortalView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundPortalView, a3);
}

- (_UIMorphingPlatterBackgroundCaptureView)backgroundCaptureView
{
  return self->_backgroundCaptureView;
}

- (void)setBackgroundCaptureView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundCaptureView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundCaptureView, 0);
  objc_storeStrong((id *)&self->_backgroundPortalView, 0);
  objc_storeStrong((id *)&self->_portalView, 0);
  objc_storeStrong((id *)&self->_sourcePreview, 0);
}

@end
