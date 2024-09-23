@implementation _UIPlatterView

- (_UIPlatterView)initWithDUIPreview:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _UIPlatterView *v11;
  _UIPlatterView *v12;
  __int128 *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  _DUIPreview *preview;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  int v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  void *v35;
  CGFloat MinY;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double x;
  double y;
  double width;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  uint64_t v49;
  _UIDragPreviewShadowProperties *shadowProperties;
  BOOL v51;
  void *v52;
  uint64_t v53;
  _UIPlatterSoftShadowView *v54;
  UIView *shadowView;
  UIView *v56;
  UIView *backgroundView;
  void *v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  UIView *v66;
  UIView *portalWrapperView;
  _UIPlatterView *v68;
  double tx;
  CGRect rect;
  objc_super v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;

  v4 = a3;
  v5 = *MEMORY[0x1E0C9D538];
  v6 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  objc_msgSend(v4, "unscaledSize");
  v8 = v7;
  v10 = v9;
  v72.receiver = self;
  v72.super_class = (Class)_UIPlatterView;
  v11 = -[UIView initWithFrame:](&v72, sel_initWithFrame_, v5, v6, v7, v9);
  v12 = v11;
  if (!v11)
    goto LABEL_19;
  v13 = (__int128 *)MEMORY[0x1E0C9BAA8];
  v14 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  *(_OWORD *)&v11->_containerCounterScaleTransform.tx = v14;
  v16 = *v13;
  v15 = v13[1];
  *(_OWORD *)&v11->_containerCounterScaleTransform.a = *v13;
  *(_OWORD *)&v11->_containerCounterScaleTransform.c = v15;
  *(_OWORD *)&v11->_containerCounterRotationTransform.c = v15;
  *(_OWORD *)&v11->_containerCounterRotationTransform.tx = v14;
  *(_OWORD *)&v11->_containerCounterRotationTransform.a = v16;
  *(_OWORD *)&v11->_appliedTransform.c = v15;
  *(_OWORD *)&v11->_appliedTransform.tx = v14;
  *(_OWORD *)&v11->_appliedTransform.a = v16;
  *(_OWORD *)&v11->_additionalTransform.a = v16;
  *(_OWORD *)&v11->_additionalTransform.c = v15;
  *(_OWORD *)&v11->_additionalTransform.tx = v14;
  v17 = -[UIView _disableLayoutFlushingCount](v11, "_disableLayoutFlushingCount");
  if (v17 >= 1)
    v18 = v17 + 1;
  else
    v18 = 1;
  -[UIView _setDisableLayoutFlushingCount:](v12, "_setDisableLayoutFlushingCount:", v18);
  -[UIView _disableLayoutFlushing](v12, "_disableLayoutFlushing");
  -[UIView layer](v12, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setAllowsGroupOpacity:", 1);

  v20 = objc_msgSend(v4, "copy");
  preview = v12->_preview;
  v12->_preview = (_DUIPreview *)v20;

  objc_msgSend(v4, "previewMode");
  if (!-[_UIPlatterView _isLivePreviewContainer](v12, "_isLivePreviewContainer"))
  {
    objc_msgSend(v4, "effectiveShadowPath");
    v22 = objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      v23 = (void *)v22;
      objc_msgSend(v4, "shadowPath");
      v24 = objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        v25 = (void *)v24;
        v26 = dyld_program_sdk_at_least();

        if (v26)
        {
          objc_msgSend(v23, "bounds");
          v28 = v27;
          v30 = v29;
          v32 = v31;
          v34 = v33;
          v35 = (void *)objc_msgSend(v23, "copy");

          v73.origin.x = v28;
          rect.origin.x = v28;
          v73.origin.y = v30;
          v73.size.width = v32;
          v73.size.height = v34;
          tx = -CGRectGetMinX(v73);
          v74.origin.x = v28;
          v74.origin.y = v30;
          v74.size.width = v32;
          v74.size.height = v34;
          MinY = CGRectGetMinY(v74);
          CGAffineTransformMakeTranslation((CGAffineTransform *)&rect.origin.y, tx, -MinY);
          objc_msgSend(v35, "applyTransform:", &rect.origin.y);
          -[_UIPlatterView contentOffset](v12, "contentOffset");
          v38 = v37;
          -[_UIPlatterView contentOffset](v12, "contentOffset");
          v40 = v39;
          v75.origin.x = rect.origin.x;
          v75.origin.y = v30;
          v75.size.width = v32;
          v75.size.height = v34;
          v76 = CGRectOffset(v75, v38, v40);
          x = v76.origin.x;
          y = v76.origin.y;
          width = v76.size.width;
          rect.origin.x = v76.size.height;
          v23 = v35;
          goto LABEL_12;
        }
      }
    }
    else
    {
      +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", v5, v6, v8, v10);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    rect.origin.x = v10;
    width = v8;
    y = v6;
    x = v5;
LABEL_12:
    objc_msgSend(v4, "backgroundColor", *(_QWORD *)&tx);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView traitCollection](v12, "traitCollection");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "resolvedColorWithTraitCollection:", v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "alphaComponent");
    v48 = v47;

    objc_msgSend(v4, "shadowProperties");
    v49 = objc_claimAutoreleasedReturnValue();
    shadowProperties = v12->_shadowProperties;
    v12->_shadowProperties = (_UIDragPreviewShadowProperties *)v49;

    v51 = -[_UIPlatterView _hasRadiosityShadow](v12, "_hasRadiosityShadow");
    -[UIView traitCollection](v12, "traitCollection");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v52, "userInterfaceIdiom");

    if (v53 != 6 && !v51)
    {
      v54 = -[_UIPlatterSoftShadowView initWithFrame:shadowPath:]([_UIPlatterSoftShadowView alloc], "initWithFrame:shadowPath:", v23, x, y, width, rect.origin.x);
      -[UIView setAlpha:](v54, "setAlpha:", 0.0);
      -[_UIPlatterSoftShadowView setNeedsPunchOut:](v54, "setNeedsPunchOut:", v48 < 1.0);
      -[UIView addSubview:](v12, "addSubview:", v54);
      shadowView = v12->_shadowView;
      v12->_shadowView = &v54->super;

    }
  }
  v56 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v5, v6, v8, v10);
  backgroundView = v12->_backgroundView;
  v12->_backgroundView = v56;

  objc_msgSend(v4, "backgroundColor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v12->_backgroundView, "setBackgroundColor:", v58);

  -[UIView setAlpha:](v12->_backgroundView, "setAlpha:", 0.0);
  -[UIView layer](v12->_backgroundView, "layer");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "setAllowsEdgeAntialiasing:", 1);

  -[UIView addSubview:](v12, "addSubview:", v12->_backgroundView);
  objc_msgSend(v4, "contentOffset");
  v61 = v60;
  v63 = v62;
  objc_msgSend(v4, "contentSize");
  v66 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v61, v63, v64, v65);
  portalWrapperView = v12->_portalWrapperView;
  v12->_portalWrapperView = v66;

  -[UIView addSubview:](v12, "addSubview:", v12->_portalWrapperView);
  if (objc_msgSend(v4, "hasCustomOutline"))
    -[_UIPlatterView _updateMasking](v12, "_updateMasking");
  v68 = v12;
LABEL_19:

  return v12;
}

- (id)_applyMaskPath:(id)a3 toView:(id)a4 bounds:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  _UIShapeView *v32;
  uint64_t v33;
  void *v34;
  double v36;
  double v37;
  void *v38;
  int v39;
  uint64_t *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  CGRect v46;
  CGRect v47;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a3;
  v12 = a4;
  if (!objc_msgSend(v11, "_isRoundedRect"))
    goto LABEL_7;
  objc_msgSend(v12, "bounds");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  objc_msgSend(v11, "bounds");
  v47.origin.x = v21;
  v47.origin.y = v22;
  v47.size.width = v23;
  v47.size.height = v24;
  v46.origin.x = v14;
  v46.origin.y = v16;
  v46.size.width = v18;
  v46.size.height = v20;
  if (!CGRectEqualToRect(v46, v47))
    goto LABEL_7;
  -[_DUIPreview contentSize](self->_preview, "contentSize");
  v26 = v25;
  v28 = v27;
  objc_msgSend(v11, "bounds");
  if (v26 == v30 && v28 == v29)
  {
    objc_msgSend(v11, "_cornerRadius");
    v37 = v36;
    objc_msgSend(v12, "layer");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setCornerRadius:", v37);

    v39 = objc_msgSend(v11, "_hasContinuousCorners");
    v40 = (uint64_t *)MEMORY[0x1E0CD2A68];
    if (!v39)
      v40 = (uint64_t *)MEMORY[0x1E0CD2A60];
    v41 = *v40;
    objc_msgSend(v12, "layer");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setCornerCurve:", v41);

    v43 = objc_msgSend(v11, "_cornerMask");
    objc_msgSend(v12, "layer");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setMaskedCorners:", v43);

    objc_msgSend(v12, "layer");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setMasksToBounds:", 1);

    v32 = 0;
  }
  else
  {
LABEL_7:
    v32 = -[UIView initWithFrame:]([_UIShapeView alloc], "initWithFrame:", x, y, width, height);
    v33 = objc_msgSend(objc_retainAutorelease(v11), "CGPath");
    -[_UIShapeView shapeLayer](v32, "shapeLayer");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setPath:", v33);

    objc_msgSend(v12, "setMaskView:", v32);
  }

  return v32;
}

- (_UIPlatterView)initWithDUIPreview:(id)a3 imageComponent:(id)a4
{
  id v6;
  _UIPlatterView *v7;
  _UIPlatterView *v8;
  void *v9;
  UIImageView *v10;
  void *v11;
  UIImageView *v12;
  void *v13;

  v6 = a4;
  v7 = -[_UIPlatterView initWithDUIPreview:](self, "initWithDUIPreview:", a3);
  v8 = v7;
  if (v7)
  {
    -[_UIPlatterView componentView](v7, "componentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {

    }
    else
    {
      objc_msgSend(v6, "image");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v12 = [UIImageView alloc];
        objc_msgSend(v6, "image");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[UIImageView initWithImage:](v12, "initWithImage:", v13);

        -[_UIPlatterView setComponentView:](v8, "setComponentView:", v10);
        goto LABEL_7;
      }
    }
    objc_msgSend(v6, "view");
    v10 = (UIImageView *)objc_claimAutoreleasedReturnValue();
    -[_UIPlatterView setSourceView:](v8, "setSourceView:", v10);
LABEL_7:

  }
  return v8;
}

- (_UIPlatterView)initWithDroppedItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _UIPlatterView *v8;
  id v9;
  _UIPortalView *v10;
  _UIPortalView *v11;
  void *v12;
  uint64_t v13;
  _UIDragSlotHostingView *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  _OWORD v34[3];
  __int128 v35;
  __int128 v36;
  __int128 v37;

  v4 = a3;
  objc_msgSend(v4, "preview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageComponent");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  v8 = -[_UIPlatterView initWithDUIPreview:]([_UIPlatterView alloc], "initWithDUIPreview:", v7);

  v9 = v6;
  if (objc_msgSend(v9, "representsPortal"))
  {
    v10 = [_UIPortalView alloc];
    objc_msgSend(v9, "frame");
    v11 = -[_UIPortalView initWithFrame:](v10, "initWithFrame:");
    -[_UIPortalView portalLayer](v11, "portalLayer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSourceLayerRenderId:", objc_msgSend(v9, "renderID"));
    v13 = objc_msgSend(v9, "contextID");

    objc_msgSend(v12, "setSourceContextId:", v13);
    objc_msgSend(v12, "setHidesSourceLayer:", 1);
    -[_UIPortalView setAllowsBackdropGroups:](v11, "setAllowsBackdropGroups:", 1);

  }
  else
  {
    v14 = [_UIDragSlotHostingView alloc];
    objc_msgSend(v9, "frame");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    objc_msgSend(v9, "size3D");
    v24 = v23;
    v26 = v25;
    v28 = v27;
    v29 = objc_msgSend(v9, "slotID");

    v11 = -[_UIDragSlotHostingView initWithFrame:contentSize:slotID:](v14, "initWithFrame:contentSize:slotID:", v29, v16, v18, v20, v22, v24, v26, v28);
  }
  -[_UIPlatterView setComponentView:](v8, "setComponentView:", v11);

  objc_msgSend(v4, "rotation");
  -[_UIPlatterView setStackRotation:](v8, "setStackRotation:");
  -[_UIPlatterView setLifted:](v8, "setLifted:", 1);
  -[_UIPlatterView setConstrainSize:](v8, "setConstrainSize:", objc_msgSend(v4, "constrainSize"));
  objc_msgSend(v4, "preview");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "stackAlpha");
  -[UIView setAlpha:](v8, "setAlpha:");

  if (v4)
  {
    objc_msgSend(v4, "appliedTransform");
  }
  else
  {
    v36 = 0u;
    v37 = 0u;
    v35 = 0u;
  }
  v34[0] = v35;
  v34[1] = v36;
  v34[2] = v37;
  -[_UIPlatterView setAppliedTransform:](v8, "setAppliedTransform:", v34);
  objc_msgSend(v4, "preview");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "shadowProperties");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPlatterView setShadowProperties:](v8, "setShadowProperties:", v32);

  return v8;
}

- (void)setBackgroundVisible:(BOOL)a3
{
  double v3;
  id v4;

  if (self->_backgroundVisible != a3)
  {
    self->_backgroundVisible = a3;
    v3 = (double)a3;
    -[_UIPlatterView backgroundView](self, "backgroundView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAlpha:", v3);

  }
}

- (void)setShadowVisible:(BOOL)a3
{
  if (self->_shadowVisible != a3)
  {
    self->_shadowVisible = a3;
    -[_UIPlatterView _updateShadowViewState](self, "_updateShadowViewState");
  }
}

- (CGPoint)badgeLocation
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  CGFloat v20;
  CGFloat v21;
  double v22;
  double v23;
  double MinX;
  double v25;
  double MinY;
  double v27;
  CGPoint result;
  CGRect v29;

  if (-[_UIPlatterView constrainSize](self, "constrainSize"))
  {
    -[_UIPlatterView preview](self, "preview");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "croppedScaledSize");
    v5 = v4;
    v7 = v6;

    -[_UIPlatterView preview](self, "preview");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scaleFactor");
    v10 = 1.0 / v9;

    v11 = v5 * v10;
    v12 = v7 * v10;
    v13 = *MEMORY[0x1E0C9D538];
    v14 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  else
  {
    -[UIView bounds](self, "bounds");
    v13 = v15;
    v14 = v16;
    v11 = v17;
    v12 = v18;
  }
  v19 = objc_msgSend((id)UIApp, "userInterfaceLayoutDirection");
  v20 = v13;
  v21 = v14;
  v22 = v11;
  v23 = v12;
  if (v19)
    MinX = CGRectGetMinX(*(CGRect *)&v20);
  else
    MinX = CGRectGetMaxX(*(CGRect *)&v20);
  v25 = MinX;
  v29.origin.x = v13;
  v29.origin.y = v14;
  v29.size.width = v11;
  v29.size.height = v12;
  MinY = CGRectGetMinY(v29);
  v27 = v25;
  result.y = MinY;
  result.x = v27;
  return result;
}

- (CGPoint)initialBadgeLocation
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[_UIPlatterView preview](self, "preview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "initialBadgeLocation");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)setConstrainSize:(BOOL)a3
{
  if (self->_constrainSize != a3)
  {
    self->_constrainSize = a3;
    -[_UIPlatterView updateTransform](self, "updateTransform");
  }
}

- (CGPoint)contentOffset
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[_UIPlatterView preview](self, "preview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentOffset");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)setComponentView:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if ((-[UIView isEqual:](self->_componentView, "isEqual:") & 1) == 0)
  {
    -[UIView removeFromSuperview](self->_componentView, "removeFromSuperview");
    if (v5)
    {
      -[_UIPlatterView portalWrapperView](self, "portalWrapperView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addSubview:", v5);

    }
    -[_UIPlatterView _configureRadiosityShadowIfNeededWithSourceView:](self, "_configureRadiosityShadowIfNeededWithSourceView:", v5);
  }

}

- (BOOL)_hasRadiosityShadow
{
  void *v3;
  void *v4;
  BOOL v5;

  -[_UIPlatterView shadowProperties](self, "shadowProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[_UIPlatterView shadowProperties](self, "shadowProperties");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "shadowType") == 1;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)setShadowProperties:(id)a3
{
  UIView *componentView;
  UIView *v6;
  id v7;

  v7 = a3;
  objc_storeStrong((id *)&self->_shadowProperties, a3);
  componentView = self->_componentView;
  if (componentView)
  {
    v6 = componentView;
LABEL_4:
    -[_UIPlatterView _configureRadiosityShadowIfNeededWithSourceView:](self, "_configureRadiosityShadowIfNeededWithSourceView:", v6);

    goto LABEL_5;
  }
  -[_UIPortalView sourceView](self->_portalView, "sourceView");
  v6 = (UIView *)objc_claimAutoreleasedReturnValue();
  if (v6)
    goto LABEL_4;
LABEL_5:

}

- (void)_configureRadiosityShadowIfNeededWithSourceView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  UIView *v8;
  UIView *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  UIView *shadowView;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[_UIPlatterView _hasRadiosityShadow](self, "_hasRadiosityShadow"))
  {
    -[UIView removeFromSuperview](self->_shadowView, "removeFromSuperview");
    -[_UIPlatterView shadowProperties](self, "shadowProperties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_localShadowView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      objc_msgSend(v4, "snapshotViewAfterScreenUpdates:", 1);
      v8 = (UIView *)objc_claimAutoreleasedReturnValue();
    }
    v9 = v8;

    objc_msgSend(v4, "bounds");
    -[UIView setFrame:](v9, "setFrame:");
    -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", v9, 0);
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C88]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0CB37E8];
    -[_UIPlatterView shadowProperties](self, "shadowProperties");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "radiosityBlurRadius");
    objc_msgSend(v11, "numberWithDouble:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setValue:forKey:", v13, *MEMORY[0x1E0CD2D90]);

    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C00]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setValue:forKey:", &unk_1E1A956E0, *MEMORY[0x1E0CD2CB8]);
    v24[0] = v10;
    v24[1] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView layer](v9, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setFilters:", v15);

    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.75, 1.0);
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v18 = objc_msgSend(v17, "CGColor");
    -[UIView layer](v9, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setContentsMultiplyColor:", v18);

    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2E98]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView layer](v9, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setCompositingFilter:", v20);

    -[UIView layer](v9, "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setShouldRasterize:", 1);

    shadowView = self->_shadowView;
    self->_shadowView = v9;

    -[_UIPlatterView _updateShadowViewState](self, "_updateShadowViewState");
  }

}

- (void)_updateShadowViewState
{
  _UIDragPreviewShadowProperties *shadowProperties;
  _OWORD *v4;
  double v5;
  double v6;
  _UIDragPreviewShadowProperties *v7;
  __int128 v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  void *v12;
  _OWORD v13[3];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  CGAffineTransform t2;
  CGAffineTransform v18;
  CGAffineTransform t1;
  CGAffineTransform v20;
  CGAffineTransform v21;
  CGAffineTransform transform;
  CGAffineTransformComponents v23;
  CGAffineTransform v24;
  CGAffineTransform v25;

  shadowProperties = self->_shadowProperties;
  v4 = (_OWORD *)MEMORY[0x1E0C9BAA8];
  if (shadowProperties)
  {
    -[_UIDragPreviewShadowProperties liftedAlpha](shadowProperties, "liftedAlpha");
    v6 = v5;
    v7 = self->_shadowProperties;
    memset(&v25, 0, sizeof(v25));
    if (v7)
    {
      -[_UIDragPreviewShadowProperties liftedTransform](v7, "liftedTransform");
      goto LABEL_6;
    }
  }
  else
  {
    v6 = 1.0;
  }
  v8 = v4[1];
  *(_OWORD *)&v25.a = *v4;
  *(_OWORD *)&v25.c = v8;
  *(_OWORD *)&v25.tx = v4[2];
LABEL_6:
  -[_UIPlatterView appliedTransform](self, "appliedTransform");
  if (!CGAffineTransformIsIdentity(&v24))
  {
    memset(&v23, 0, sizeof(v23));
    -[_UIPlatterView appliedTransform](self, "appliedTransform");
    CGAffineTransformDecompose(&v23, &transform);
    memset(&v21, 0, sizeof(v21));
    CGAffineTransformMakeRotation(&v21, v23.rotation);
    t1 = v21;
    memset(&v20, 0, sizeof(v20));
    CGAffineTransformInvert(&v20, &t1);
    t1 = v25;
    t2 = v20;
    CGAffineTransformConcat(&v18, &t1, &t2);
    t2 = v21;
    CGAffineTransformConcat(&t1, &t2, &v18);
    v25 = t1;
  }
  if (!-[_UIPlatterView isShadowVisible](self, "isShadowVisible"))
    v6 = 0.0;
  -[_UIPlatterView shadowView](self, "shadowView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAlpha:", v6);

  if (-[_UIPlatterView isShadowVisible](self, "isShadowVisible"))
  {
    v14 = *(_OWORD *)&v25.a;
    v15 = *(_OWORD *)&v25.c;
    v10 = *(_OWORD *)&v25.tx;
  }
  else
  {
    v11 = v4[1];
    v14 = *v4;
    v15 = v11;
    v10 = v4[2];
  }
  v16 = v10;
  -[_UIPlatterView shadowView](self, "shadowView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v14;
  v13[1] = v15;
  v13[2] = v16;
  objc_msgSend(v12, "setTransform:", v13);

}

- (BOOL)_isLivePreviewContainer
{
  return (unint64_t)(-[_DUIPreview previewMode](self->_preview, "previewMode") - 3) < 2;
}

- (void)_updateMasking
{
  BOOL v3;
  UIView *v4;
  void *v5;
  _UIShapeView *v6;
  _UIShapeView *platterMaskView;
  _UIShapeView *v8;
  _UIShapeView *portalMaskView;
  void *v10;
  _BOOL4 v11;
  _DUIPreview *v12;

  if (!self->_hasAppliedMasking)
  {
    v12 = self->_preview;
    v3 = -[_DUIPreview wantsSuppressedMask](v12, "wantsSuppressedMask");
    if (-[_UIPlatterView _isLivePreviewContainer](self, "_isLivePreviewContainer"))
    {
      v4 = self->_backgroundView;
    }
    else
    {
      -[_DUIPreview outline](v12, "outline");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = self->_backgroundView;
      if (v5)
      {
        -[UIView bounds](self, "bounds");
        -[_UIPlatterView _applyMaskPath:toView:bounds:](self, "_applyMaskPath:toView:bounds:", v5, v4);
        v6 = (_UIShapeView *)objc_claimAutoreleasedReturnValue();
        platterMaskView = self->_platterMaskView;
        self->_platterMaskView = v6;

        -[UIView setClipsToBounds:](self->_portalWrapperView, "setClipsToBounds:", 0);
        if (!v3)
        {
          -[UIView bounds](self, "bounds");
          -[UIView convertRect:toView:](self, "convertRect:toView:", self->_portalWrapperView);
          -[_UIPlatterView _applyMaskPath:toView:bounds:](self, "_applyMaskPath:toView:bounds:", v5, self->_portalWrapperView);
          v8 = (_UIShapeView *)objc_claimAutoreleasedReturnValue();
          portalMaskView = self->_portalMaskView;
          self->_portalMaskView = v8;

        }
        goto LABEL_8;
      }
    }
    -[_DUIPreview shadowPath](v12, "shadowPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10 == 0;

    -[UIView setClipsToBounds:](self->_portalWrapperView, "setClipsToBounds:", v11 & ~-[_UIPlatterView _isLivePreviewContainer](self, "_isLivePreviewContainer"));
    v5 = 0;
LABEL_8:
    self->_hasAppliedMasking = 1;

  }
}

- (void)setLifted:(BOOL)a3
{
  _BOOL8 v3;

  if (self->_lifted != a3)
  {
    v3 = a3;
    self->_lifted = a3;
    if (a3)
      -[_UIPlatterView _updateMasking](self, "_updateMasking");
    -[_UIPlatterView setShadowVisible:](self, "setShadowVisible:", v3);
    -[_UIPlatterView setBackgroundVisible:](self, "setBackgroundVisible:", v3);
    -[_UIPlatterView updateTransform](self, "updateTransform");
  }
}

- (void)setOrientationRotation:(double)a3
{
  if (self->_orientationRotation != a3)
  {
    self->_orientationRotation = a3;
    -[_UIPlatterView updateTransform](self, "updateTransform");
  }
}

- (void)setOverrideSize:(CGSize)a3
{
  if (self->_overrideSize.width != a3.width || self->_overrideSize.height != a3.height)
  {
    self->_overrideSize = a3;
    -[_UIPlatterView updateTransform](self, "updateTransform");
  }
}

- (void)setAppliesOriginalRotation:(BOOL)a3
{
  if (self->_appliesOriginalRotation != a3)
  {
    self->_appliesOriginalRotation = a3;
    -[_UIPlatterView updateTransform](self, "updateTransform");
  }
}

- (double)scaleFactor
{
  void *v3;
  double v4;
  double v5;

  if (!-[_UIPlatterView constrainSize](self, "constrainSize")
    || !-[_UIPlatterView isLifted](self, "isLifted")
    && !-[_UIPlatterView constrainSizeWhenNotLifted](self, "constrainSizeWhenNotLifted"))
  {
    return 1.0;
  }
  -[_UIPlatterView preview](self, "preview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scaleFactor");
  v5 = v4;

  return v5;
}

- (UIView)sourceView
{
  void *v2;
  void *v3;

  -[_UIPlatterView portalView](self, "portalView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sourceView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (void)setSourceView:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  _UIPortalView *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  CGAffineTransform v26;
  CGAffineTransform v27;

  v4 = a3;
  -[_UIPlatterView portalView](self, "portalView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sourceView");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 != v4)
  {
    -[_UIPlatterView portalView](self, "portalView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[_UIPlatterView portalView](self, "portalView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeFromSuperview");

    }
    -[_UIPlatterView portalWrapperView](self, "portalWrapperView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    objc_msgSend(v4, "bounds");
    memset(&v27, 0, sizeof(v27));
    CGAffineTransformMakeScale(&v27, v15 / v18, v17 / v19);
    v20 = -[_UIPortalView initWithFrame:]([_UIPortalView alloc], "initWithFrame:", v11, v13, v15, v17);
    -[_UIPlatterView preview](self, "preview");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIPortalView setHidesSourceView:](v20, "setHidesSourceView:", objc_msgSend(v21, "hidesSourceView"));

    -[_UIPortalView setMatchesAlpha:](v20, "setMatchesAlpha:", 0);
    -[_UIPortalView setMatchesPosition:](v20, "setMatchesPosition:", 0);
    -[_UIPortalView setMatchesTransform:](v20, "setMatchesTransform:", 0);
    v26 = v27;
    -[UIView setTransform:](v20, "setTransform:", &v26);
    -[_UIPortalView setSourceView:](v20, "setSourceView:", v4);
    -[_UIPlatterView preview](self, "preview");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIPortalView setAllowsHitTesting:](v20, "setAllowsHitTesting:", objc_msgSend(v22, "previewMode") == 4);

    -[_UIPortalView setAllowsBackdropGroups:](v20, "setAllowsBackdropGroups:", 1);
    objc_msgSend(v4, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "flipsHorizontalAxis");
    -[UIView layer](v20, "layer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setFlipsHorizontalAxis:", v24);

    objc_msgSend(v9, "addSubview:", v20);
    -[_UIPlatterView setPortalView:](self, "setPortalView:", v20);

    if (v4)
      -[_UIPlatterView _configureRadiosityShadowIfNeededWithSourceView:](self, "_configureRadiosityShadowIfNeededWithSourceView:", v4);
  }

}

- (void)setStackRotation:(double)a3
{
  if (self->_stackRotation != a3)
  {
    self->_stackRotation = a3;
    -[_UIPlatterView updateTransform](self, "updateTransform");
  }
}

- (void)setAppliedTransform:(CGAffineTransform *)a3
{
  CGAffineTransform *p_appliedTransform;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  CGAffineTransform v10;
  CGAffineTransform t1;

  p_appliedTransform = &self->_appliedTransform;
  v6 = *(_OWORD *)&self->_appliedTransform.c;
  *(_OWORD *)&t1.a = *(_OWORD *)&self->_appliedTransform.a;
  *(_OWORD *)&t1.c = v6;
  *(_OWORD *)&t1.tx = *(_OWORD *)&self->_appliedTransform.tx;
  v7 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v10.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v10.c = v7;
  *(_OWORD *)&v10.tx = *(_OWORD *)&a3->tx;
  if (!CGAffineTransformEqualToTransform(&t1, &v10))
  {
    v8 = *(_OWORD *)&a3->a;
    v9 = *(_OWORD *)&a3->tx;
    *(_OWORD *)&p_appliedTransform->c = *(_OWORD *)&a3->c;
    *(_OWORD *)&p_appliedTransform->tx = v9;
    *(_OWORD *)&p_appliedTransform->a = v8;
    -[_UIPlatterView updateTransform](self, "updateTransform");
  }
}

- (void)setAdditionalTransform:(CGAffineTransform *)a3
{
  CGAffineTransform *p_additionalTransform;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  CGAffineTransform v10;
  CGAffineTransform t1;

  p_additionalTransform = &self->_additionalTransform;
  v6 = *(_OWORD *)&self->_additionalTransform.c;
  *(_OWORD *)&t1.a = *(_OWORD *)&self->_additionalTransform.a;
  *(_OWORD *)&t1.c = v6;
  *(_OWORD *)&t1.tx = *(_OWORD *)&self->_additionalTransform.tx;
  v7 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v10.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v10.c = v7;
  *(_OWORD *)&v10.tx = *(_OWORD *)&a3->tx;
  if (!CGAffineTransformEqualToTransform(&t1, &v10))
  {
    v8 = *(_OWORD *)&a3->a;
    v9 = *(_OWORD *)&a3->tx;
    *(_OWORD *)&p_additionalTransform->c = *(_OWORD *)&a3->c;
    *(_OWORD *)&p_additionalTransform->tx = v9;
    *(_OWORD *)&p_additionalTransform->a = v8;
    -[_UIPlatterView updateTransform](self, "updateTransform");
  }
}

- (CATransform3D)scaleTransform
{
  __int128 *v5;
  void *v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  void *v12;
  uint64_t v13;
  CGFloat v14;
  double v15;
  double v16;
  CGFloat v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  CGFloat v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  CATransform3D *result;
  double v28;
  double v29;
  BOOL v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  double v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  CATransform3D a;
  CGAffineTransform m;
  CATransform3D b;
  CATransform3D v82;

  v5 = (__int128 *)MEMORY[0x1E0CD2610];
  v69 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
  v70 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
  *(_OWORD *)&retstr->m31 = v70;
  *(_OWORD *)&retstr->m33 = v69;
  v67 = v5[7];
  v68 = v5[6];
  *(_OWORD *)&retstr->m41 = v68;
  *(_OWORD *)&retstr->m43 = v67;
  v65 = v5[1];
  v66 = *v5;
  *(_OWORD *)&retstr->m11 = *v5;
  *(_OWORD *)&retstr->m13 = v65;
  v63 = v5[3];
  v64 = v5[2];
  *(_OWORD *)&retstr->m21 = v64;
  *(_OWORD *)&retstr->m23 = v63;
  if (-[_UIPlatterView isLifted](self, "isLifted"))
  {
    -[_UIPlatterView preview](self, "preview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      objc_msgSend(v6, "liftTransform");
    else
      memset(&m, 0, sizeof(m));
    CATransform3DMakeAffineTransform(&b, &m);
    *(_OWORD *)&a.m31 = v70;
    *(_OWORD *)&a.m33 = v69;
    *(_OWORD *)&a.m41 = v68;
    *(_OWORD *)&a.m43 = v67;
    *(_OWORD *)&a.m11 = v66;
    *(_OWORD *)&a.m13 = v65;
    *(_OWORD *)&a.m21 = v64;
    *(_OWORD *)&a.m23 = v63;
    CATransform3DConcat(&v82, &a, &b);
    v8 = *(_OWORD *)&v82.m33;
    *(_OWORD *)&retstr->m31 = *(_OWORD *)&v82.m31;
    *(_OWORD *)&retstr->m33 = v8;
    v9 = *(_OWORD *)&v82.m43;
    *(_OWORD *)&retstr->m41 = *(_OWORD *)&v82.m41;
    *(_OWORD *)&retstr->m43 = v9;
    v10 = *(_OWORD *)&v82.m13;
    *(_OWORD *)&retstr->m11 = *(_OWORD *)&v82.m11;
    *(_OWORD *)&retstr->m13 = v10;
    v11 = *(_OWORD *)&v82.m23;
    *(_OWORD *)&retstr->m21 = *(_OWORD *)&v82.m21;
    *(_OWORD *)&retstr->m23 = v11;

  }
  -[UIView traitCollection](self, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "userInterfaceIdiom");

  v14 = 1.0;
  if (v13 == 6)
  {
    -[_UIPlatterView scaleFactor](self, "scaleFactor");
    v14 = v15;
  }
  -[_UIPlatterView scaleFactor](self, "scaleFactor");
  v17 = v16;
  -[_UIPlatterView scaleFactor](self, "scaleFactor");
  v18 = *(_OWORD *)&retstr->m33;
  *(_OWORD *)&a.m31 = *(_OWORD *)&retstr->m31;
  *(_OWORD *)&a.m33 = v18;
  v19 = *(_OWORD *)&retstr->m43;
  *(_OWORD *)&a.m41 = *(_OWORD *)&retstr->m41;
  *(_OWORD *)&a.m43 = v19;
  v20 = *(_OWORD *)&retstr->m13;
  *(_OWORD *)&a.m11 = *(_OWORD *)&retstr->m11;
  *(_OWORD *)&a.m13 = v20;
  v21 = *(_OWORD *)&retstr->m23;
  *(_OWORD *)&a.m21 = *(_OWORD *)&retstr->m21;
  *(_OWORD *)&a.m23 = v21;
  CATransform3DScale(&v82, &a, v17, v22, v14);
  v23 = *(_OWORD *)&v82.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v82.m31;
  *(_OWORD *)&retstr->m33 = v23;
  v24 = *(_OWORD *)&v82.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v82.m41;
  *(_OWORD *)&retstr->m43 = v24;
  v25 = *(_OWORD *)&v82.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v82.m11;
  *(_OWORD *)&retstr->m13 = v25;
  v26 = *(_OWORD *)&v82.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v82.m21;
  *(_OWORD *)&retstr->m23 = v26;
  result = (CATransform3D *)-[_UIPlatterView overrideSize](self, "overrideSize");
  if (v29 != *MEMORY[0x1E0C9D820] || v28 != *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    v30 = -[_UIPlatterView constrainSize](self, "constrainSize");
    -[_UIPlatterView preview](self, "preview");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (v30)
      objc_msgSend(v31, "croppedScaledSize");
    else
      objc_msgSend(v31, "unscaledSize");
    v35 = v33;
    v36 = v34;

    -[_UIPlatterView preview](self, "preview");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v37;
    if (v37)
    {
      objc_msgSend(v37, "liftTransform");
      v39 = v76;
      v40 = v75;
      v41 = v78;
      v42 = v77;
    }
    else
    {
      v41 = 0.0;
      v39 = 0.0;
      v42 = 0.0;
      v40 = 0.0;
    }
    v43 = v36 * v42 + v35 * v40;
    v44 = v36 * v41 + v35 * v39;

    -[_UIPlatterView preview](self, "preview");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v45;
    if (v45)
    {
      objc_msgSend(v45, "liftTransform");
      v47 = v72;
      v48 = v71;
      v49 = v74;
      v50 = v73;
    }
    else
    {
      v49 = 0.0;
      v47 = 0.0;
      v50 = 0.0;
      v48 = 0.0;
    }
    v51 = v44 * v50 + v43 * v48;
    v52 = v44 * v49 + v43 * v47;

    -[_UIPlatterView overrideSize](self, "overrideSize");
    v54 = *(_OWORD *)&retstr->m33;
    *(_OWORD *)&a.m31 = *(_OWORD *)&retstr->m31;
    *(_OWORD *)&a.m33 = v54;
    v55 = *(_OWORD *)&retstr->m43;
    *(_OWORD *)&a.m41 = *(_OWORD *)&retstr->m41;
    *(_OWORD *)&a.m43 = v55;
    v56 = *(_OWORD *)&retstr->m13;
    *(_OWORD *)&a.m11 = *(_OWORD *)&retstr->m11;
    *(_OWORD *)&a.m13 = v56;
    v57 = *(_OWORD *)&retstr->m23;
    *(_OWORD *)&a.m21 = *(_OWORD *)&retstr->m21;
    *(_OWORD *)&a.m23 = v57;
    result = CATransform3DScale(&v82, &a, v53 / v51, v58 / v52, 1.0);
    v59 = *(_OWORD *)&v82.m33;
    *(_OWORD *)&retstr->m31 = *(_OWORD *)&v82.m31;
    *(_OWORD *)&retstr->m33 = v59;
    v60 = *(_OWORD *)&v82.m43;
    *(_OWORD *)&retstr->m41 = *(_OWORD *)&v82.m41;
    *(_OWORD *)&retstr->m43 = v60;
    v61 = *(_OWORD *)&v82.m13;
    *(_OWORD *)&retstr->m11 = *(_OWORD *)&v82.m11;
    *(_OWORD *)&retstr->m13 = v61;
    v62 = *(_OWORD *)&v82.m23;
    *(_OWORD *)&retstr->m21 = *(_OWORD *)&v82.m21;
    *(_OWORD *)&retstr->m23 = v62;
  }
  return result;
}

- (CATransform3D)targetTransform
{
  return -[_UIPlatterView targetTransformIncludingAppliedTransform:](self, "targetTransformIncludingAppliedTransform:", 1);
}

- (CATransform3D)targetTransformIncludingAppliedTransform:(SEL)a3
{
  _BOOL4 v4;
  double v7;
  double m14;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  BOOL IsIdentity;
  double m21;
  double m22;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  double v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  void *v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  CGFloat v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  CATransform3D *result;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  CATransform3D v93;
  CATransform3D v94;
  CATransform3D v95;
  CATransform3D v96;
  CATransform3D b;
  CATransform3D v98;
  CGAffineTransform transform;
  CGAffineTransform v100;

  v4 = a4;
  *(_OWORD *)&retstr->m41 = 0u;
  *(_OWORD *)&retstr->m43 = 0u;
  *(_OWORD *)&retstr->m31 = 0u;
  *(_OWORD *)&retstr->m33 = 0u;
  *(_OWORD *)&retstr->m21 = 0u;
  *(_OWORD *)&retstr->m23 = 0u;
  *(_OWORD *)&retstr->m11 = 0u;
  *(_OWORD *)&retstr->m13 = 0u;
  -[_UIPlatterView scaleTransform](self, "scaleTransform");
  -[_UIPlatterView stackRotation](self, "stackRotation");
  m14 = v7;
  -[_UIPlatterView offset](self, "offset");
  v10 = v9;
  -[UIView bounds](self, "bounds");
  v12 = v11;
  -[_UIPlatterView offset](self, "offset");
  v14 = v13;
  -[UIView bounds](self, "bounds");
  v16 = v15;
  -[_UIPlatterView preview](self, "preview");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
    objc_msgSend(v17, "overrideStackTransform");
  else
    memset(&v100, 0, sizeof(v100));
  IsIdentity = CGAffineTransformIsIdentity(&v100);

  if (IsIdentity)
  {
    m21 = v10 * v12;
    m22 = v14 * v16;
  }
  else
  {
    memset(&v96, 0, 48);
    -[_UIPlatterView preview](self, "preview");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22)
      objc_msgSend(v22, "overrideStackTransform");
    else
      memset(&transform, 0, sizeof(transform));
    CGAffineTransformDecompose((CGAffineTransformComponents *)&v96, &transform);

    if (!-[_UIPlatterView constrainSize](self, "constrainSize"))
    {
      CATransform3DMakeScale(&v98, v96.m11, v96.m12, 1.0);
      v24 = *(_OWORD *)&v98.m33;
      *(_OWORD *)&retstr->m31 = *(_OWORD *)&v98.m31;
      *(_OWORD *)&retstr->m33 = v24;
      v25 = *(_OWORD *)&v98.m43;
      *(_OWORD *)&retstr->m41 = *(_OWORD *)&v98.m41;
      *(_OWORD *)&retstr->m43 = v25;
      v26 = *(_OWORD *)&v98.m13;
      *(_OWORD *)&retstr->m11 = *(_OWORD *)&v98.m11;
      *(_OWORD *)&retstr->m13 = v26;
      v27 = *(_OWORD *)&v98.m23;
      *(_OWORD *)&retstr->m21 = *(_OWORD *)&v98.m21;
      *(_OWORD *)&retstr->m23 = v27;
    }
    m14 = v96.m14;
    m21 = v96.m21;
    m22 = v96.m22;
  }
  v28 = *(_OWORD *)&self->_containerCounterScaleTransform.c;
  *(_OWORD *)&v98.m11 = *(_OWORD *)&self->_containerCounterScaleTransform.a;
  *(_OWORD *)&v98.m13 = v28;
  *(_OWORD *)&v98.m21 = *(_OWORD *)&self->_containerCounterScaleTransform.tx;
  CATransform3DMakeAffineTransform(&b, (CGAffineTransform *)&v98);
  v29 = *(_OWORD *)&retstr->m33;
  *(_OWORD *)&v96.m31 = *(_OWORD *)&retstr->m31;
  *(_OWORD *)&v96.m33 = v29;
  v30 = *(_OWORD *)&retstr->m43;
  *(_OWORD *)&v96.m41 = *(_OWORD *)&retstr->m41;
  *(_OWORD *)&v96.m43 = v30;
  v31 = *(_OWORD *)&retstr->m13;
  *(_OWORD *)&v96.m11 = *(_OWORD *)&retstr->m11;
  *(_OWORD *)&v96.m13 = v31;
  v32 = *(_OWORD *)&retstr->m23;
  *(_OWORD *)&v96.m21 = *(_OWORD *)&retstr->m21;
  *(_OWORD *)&v96.m23 = v32;
  CATransform3DConcat(&v98, &v96, &b);
  v33 = *(_OWORD *)&v98.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v98.m31;
  *(_OWORD *)&retstr->m33 = v33;
  v34 = *(_OWORD *)&v98.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v98.m41;
  *(_OWORD *)&retstr->m43 = v34;
  v35 = *(_OWORD *)&v98.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v98.m11;
  *(_OWORD *)&retstr->m13 = v35;
  v36 = *(_OWORD *)&v98.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v98.m21;
  *(_OWORD *)&retstr->m23 = v36;
  v37 = *(_OWORD *)&self->_containerCounterRotationTransform.c;
  *(_OWORD *)&v98.m11 = *(_OWORD *)&self->_containerCounterRotationTransform.a;
  *(_OWORD *)&v98.m13 = v37;
  *(_OWORD *)&v98.m21 = *(_OWORD *)&self->_containerCounterRotationTransform.tx;
  CATransform3DMakeAffineTransform(&v95, (CGAffineTransform *)&v98);
  v38 = *(_OWORD *)&retstr->m33;
  *(_OWORD *)&v96.m31 = *(_OWORD *)&retstr->m31;
  *(_OWORD *)&v96.m33 = v38;
  v39 = *(_OWORD *)&retstr->m43;
  *(_OWORD *)&v96.m41 = *(_OWORD *)&retstr->m41;
  *(_OWORD *)&v96.m43 = v39;
  v40 = *(_OWORD *)&retstr->m13;
  *(_OWORD *)&v96.m11 = *(_OWORD *)&retstr->m11;
  *(_OWORD *)&v96.m13 = v40;
  v41 = *(_OWORD *)&retstr->m23;
  *(_OWORD *)&v96.m21 = *(_OWORD *)&retstr->m21;
  *(_OWORD *)&v96.m23 = v41;
  CATransform3DConcat(&v98, &v96, &v95);
  v42 = *(_OWORD *)&v98.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v98.m31;
  *(_OWORD *)&retstr->m33 = v42;
  v43 = *(_OWORD *)&v98.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v98.m41;
  *(_OWORD *)&retstr->m43 = v43;
  v44 = *(_OWORD *)&v98.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v98.m11;
  *(_OWORD *)&retstr->m13 = v44;
  v45 = *(_OWORD *)&v98.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v98.m21;
  *(_OWORD *)&retstr->m23 = v45;
  -[_UIPlatterView orientationRotation](self, "orientationRotation");
  v47 = *(_OWORD *)&retstr->m33;
  *(_OWORD *)&v96.m31 = *(_OWORD *)&retstr->m31;
  *(_OWORD *)&v96.m33 = v47;
  v48 = *(_OWORD *)&retstr->m43;
  *(_OWORD *)&v96.m41 = *(_OWORD *)&retstr->m41;
  *(_OWORD *)&v96.m43 = v48;
  v49 = *(_OWORD *)&retstr->m13;
  *(_OWORD *)&v96.m11 = *(_OWORD *)&retstr->m11;
  *(_OWORD *)&v96.m13 = v49;
  v50 = *(_OWORD *)&retstr->m23;
  *(_OWORD *)&v96.m21 = *(_OWORD *)&retstr->m21;
  *(_OWORD *)&v96.m23 = v50;
  CATransform3DRotate(&v98, &v96, fmax(fmin(m14 + v46, 3.14159265), -3.14159253), 0.0, 0.0, 1.0);
  v51 = *(_OWORD *)&v98.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v98.m31;
  *(_OWORD *)&retstr->m33 = v51;
  v52 = *(_OWORD *)&v98.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v98.m41;
  *(_OWORD *)&retstr->m43 = v52;
  v53 = *(_OWORD *)&v98.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v98.m11;
  *(_OWORD *)&retstr->m13 = v53;
  v54 = *(_OWORD *)&v98.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v98.m21;
  *(_OWORD *)&retstr->m23 = v54;
  v55 = *(_OWORD *)&retstr->m33;
  *(_OWORD *)&v96.m31 = *(_OWORD *)&retstr->m31;
  *(_OWORD *)&v96.m33 = v55;
  v56 = *(_OWORD *)&retstr->m43;
  *(_OWORD *)&v96.m41 = *(_OWORD *)&retstr->m41;
  *(_OWORD *)&v96.m43 = v56;
  v57 = *(_OWORD *)&retstr->m13;
  *(_OWORD *)&v96.m11 = *(_OWORD *)&retstr->m11;
  *(_OWORD *)&v96.m13 = v57;
  v58 = *(_OWORD *)&retstr->m23;
  *(_OWORD *)&v96.m21 = *(_OWORD *)&retstr->m21;
  *(_OWORD *)&v96.m23 = v58;
  CATransform3DTranslate(&v98, &v96, m21, m22, 0.0);
  v59 = *(_OWORD *)&v98.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v98.m31;
  *(_OWORD *)&retstr->m33 = v59;
  v60 = *(_OWORD *)&v98.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v98.m41;
  *(_OWORD *)&retstr->m43 = v60;
  v61 = *(_OWORD *)&v98.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v98.m11;
  *(_OWORD *)&retstr->m13 = v61;
  v62 = *(_OWORD *)&v98.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v98.m21;
  *(_OWORD *)&retstr->m23 = v62;
  if (self->_appliesOriginalRotation)
  {
    -[_UIPlatterView preview](self, "preview");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "originalRotation");
    v64 = *(_OWORD *)&retstr->m33;
    *(_OWORD *)&v96.m31 = *(_OWORD *)&retstr->m31;
    *(_OWORD *)&v96.m33 = v64;
    v65 = *(_OWORD *)&retstr->m43;
    *(_OWORD *)&v96.m41 = *(_OWORD *)&retstr->m41;
    *(_OWORD *)&v96.m43 = v65;
    v66 = *(_OWORD *)&retstr->m13;
    *(_OWORD *)&v96.m11 = *(_OWORD *)&retstr->m11;
    *(_OWORD *)&v96.m13 = v66;
    v67 = *(_OWORD *)&retstr->m23;
    *(_OWORD *)&v96.m21 = *(_OWORD *)&retstr->m21;
    *(_OWORD *)&v96.m23 = v67;
    CATransform3DRotate(&v98, &v96, v68, 0.0, 0.0, 1.0);
    v69 = *(_OWORD *)&v98.m33;
    *(_OWORD *)&retstr->m31 = *(_OWORD *)&v98.m31;
    *(_OWORD *)&retstr->m33 = v69;
    v70 = *(_OWORD *)&v98.m43;
    *(_OWORD *)&retstr->m41 = *(_OWORD *)&v98.m41;
    *(_OWORD *)&retstr->m43 = v70;
    v71 = *(_OWORD *)&v98.m13;
    *(_OWORD *)&retstr->m11 = *(_OWORD *)&v98.m11;
    *(_OWORD *)&retstr->m13 = v71;
    v72 = *(_OWORD *)&v98.m23;
    *(_OWORD *)&retstr->m21 = *(_OWORD *)&v98.m21;
    *(_OWORD *)&retstr->m23 = v72;

  }
  if (v4)
  {
    v73 = *(_OWORD *)&self->_appliedTransform.c;
    *(_OWORD *)&v98.m11 = *(_OWORD *)&self->_appliedTransform.a;
    *(_OWORD *)&v98.m13 = v73;
    *(_OWORD *)&v98.m21 = *(_OWORD *)&self->_appliedTransform.tx;
    if (!CGAffineTransformIsIdentity((CGAffineTransform *)&v98))
    {
      v74 = *(_OWORD *)&self->_appliedTransform.c;
      *(_OWORD *)&v98.m11 = *(_OWORD *)&self->_appliedTransform.a;
      *(_OWORD *)&v98.m13 = v74;
      *(_OWORD *)&v98.m21 = *(_OWORD *)&self->_appliedTransform.tx;
      CATransform3DMakeAffineTransform(&v94, (CGAffineTransform *)&v98);
      v75 = *(_OWORD *)&retstr->m33;
      *(_OWORD *)&v96.m31 = *(_OWORD *)&retstr->m31;
      *(_OWORD *)&v96.m33 = v75;
      v76 = *(_OWORD *)&retstr->m43;
      *(_OWORD *)&v96.m41 = *(_OWORD *)&retstr->m41;
      *(_OWORD *)&v96.m43 = v76;
      v77 = *(_OWORD *)&retstr->m13;
      *(_OWORD *)&v96.m11 = *(_OWORD *)&retstr->m11;
      *(_OWORD *)&v96.m13 = v77;
      v78 = *(_OWORD *)&retstr->m23;
      *(_OWORD *)&v96.m21 = *(_OWORD *)&retstr->m21;
      *(_OWORD *)&v96.m23 = v78;
      CATransform3DConcat(&v98, &v96, &v94);
      v79 = *(_OWORD *)&v98.m33;
      *(_OWORD *)&retstr->m31 = *(_OWORD *)&v98.m31;
      *(_OWORD *)&retstr->m33 = v79;
      v80 = *(_OWORD *)&v98.m43;
      *(_OWORD *)&retstr->m41 = *(_OWORD *)&v98.m41;
      *(_OWORD *)&retstr->m43 = v80;
      v81 = *(_OWORD *)&v98.m13;
      *(_OWORD *)&retstr->m11 = *(_OWORD *)&v98.m11;
      *(_OWORD *)&retstr->m13 = v81;
      v82 = *(_OWORD *)&v98.m23;
      *(_OWORD *)&retstr->m21 = *(_OWORD *)&v98.m21;
      *(_OWORD *)&retstr->m23 = v82;
    }
  }
  v83 = *(_OWORD *)&self->_additionalTransform.c;
  *(_OWORD *)&v98.m11 = *(_OWORD *)&self->_additionalTransform.a;
  *(_OWORD *)&v98.m13 = v83;
  *(_OWORD *)&v98.m21 = *(_OWORD *)&self->_additionalTransform.tx;
  CATransform3DMakeAffineTransform(&v93, (CGAffineTransform *)&v98);
  v84 = *(_OWORD *)&retstr->m33;
  *(_OWORD *)&v96.m31 = *(_OWORD *)&retstr->m31;
  *(_OWORD *)&v96.m33 = v84;
  v85 = *(_OWORD *)&retstr->m43;
  *(_OWORD *)&v96.m41 = *(_OWORD *)&retstr->m41;
  *(_OWORD *)&v96.m43 = v85;
  v86 = *(_OWORD *)&retstr->m13;
  *(_OWORD *)&v96.m11 = *(_OWORD *)&retstr->m11;
  *(_OWORD *)&v96.m13 = v86;
  v87 = *(_OWORD *)&retstr->m23;
  *(_OWORD *)&v96.m21 = *(_OWORD *)&retstr->m21;
  *(_OWORD *)&v96.m23 = v87;
  result = CATransform3DConcat(&v98, &v96, &v93);
  v89 = *(_OWORD *)&v98.m33;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&v98.m31;
  *(_OWORD *)&retstr->m33 = v89;
  v90 = *(_OWORD *)&v98.m43;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&v98.m41;
  *(_OWORD *)&retstr->m43 = v90;
  v91 = *(_OWORD *)&v98.m13;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&v98.m11;
  *(_OWORD *)&retstr->m13 = v91;
  v92 = *(_OWORD *)&v98.m23;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&v98.m21;
  *(_OWORD *)&retstr->m23 = v92;
  return result;
}

- (void)takeCounterTransformsToAddToContainer:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  long double v21;
  long double v22;
  __int128 v23;
  double RotationAngleFromViewToView;
  __int128 v25;
  CGAffineTransform v26;

  v4 = a3;
  objc_msgSend(v4, "_window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0C9D538];
  v7 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v8 = v4;
  objc_msgSend(v5, "convertPoint:toView:", v8, v6, v7);
  v10 = v9;
  v12 = v11;
  objc_msgSend(v5, "convertPoint:toView:", v8, 1.0, 0.0);
  v14 = v13;
  v16 = v15;
  objc_msgSend(v5, "convertPoint:toView:", v8, 0.0, 1.0);
  v18 = v17;
  v20 = v19;
  v21 = hypot(v14 - v10, v16 - v12);
  v22 = hypot(v18 - v10, v20 - v12);
  CGAffineTransformMakeScale(&v26, v21, v22);
  v23 = *(_OWORD *)&v26.c;
  *(_OWORD *)&self->_containerCounterScaleTransform.a = *(_OWORD *)&v26.a;
  *(_OWORD *)&self->_containerCounterScaleTransform.c = v23;
  *(_OWORD *)&self->_containerCounterScaleTransform.tx = *(_OWORD *)&v26.tx;
  RotationAngleFromViewToView = DUIPreviewGetRotationAngleFromViewToView(v8, 0, 0);

  CGAffineTransformMakeRotation(&v26, -RotationAngleFromViewToView);
  v25 = *(_OWORD *)&v26.c;
  *(_OWORD *)&self->_containerCounterRotationTransform.a = *(_OWORD *)&v26.a;
  *(_OWORD *)&self->_containerCounterRotationTransform.c = v25;
  *(_OWORD *)&self->_containerCounterRotationTransform.tx = *(_OWORD *)&v26.tx;
  -[_UIPlatterView updateTransform](self, "updateTransform");

}

- (void)setTransformAppliedExternally:(BOOL)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  _OWORD v7[8];

  self->_transformAppliedExternally = a3;
  if (a3)
  {
    v3 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
    v7[4] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
    v7[5] = v3;
    v4 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
    v7[6] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
    v7[7] = v4;
    v5 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
    v7[0] = *MEMORY[0x1E0CD2610];
    v7[1] = v5;
    v6 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
    v7[2] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
    v7[3] = v6;
    -[UIView setTransform3D:](self, "setTransform3D:", v7);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[_UIPlatterView preview](self, "preview", a3.width, a3.height);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unscaledSize");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)didMoveToWindow
{
  void *v3;
  uint64_t v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIPlatterView;
  -[UIView didMoveToWindow](&v6, sel_didMoveToWindow);
  -[UIView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[UIView _subviewsNeedAxisFlipping](v3);
  -[UIView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFlipsHorizontalAxis:", v4);

}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  BOOL v16;
  BOOL v17;
  objc_super v19;
  CGPoint v20;
  CGRect v21;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (-[_UIPlatterView constrainSize](self, "constrainSize"))
  {
    -[_UIPlatterView preview](self, "preview");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scaleFactor");
    v10 = 1.0 / v9;

    -[_UIPlatterView preview](self, "preview");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "croppedScaledSize");
    v13 = v12;
    v15 = v14;

    v21.origin.x = *(CGFloat *)MEMORY[0x1E0C9D538];
    v21.origin.y = *(CGFloat *)(MEMORY[0x1E0C9D538] + 8);
    v21.size.width = v10 * v13;
    v21.size.height = v10 * v15;
    v20.x = x;
    v20.y = y;
    v16 = CGRectContainsPoint(v21, v20);
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)_UIPlatterView;
    v16 = -[UIView pointInside:withEvent:](&v19, sel_pointInside_withEvent_, v7, x, y);
  }
  v17 = v16;

  return v17;
}

- (void)didMoveToSuperview
{
  void *v3;
  NSValue *anchorPointValueToAdjustToOnMoveToWindow;
  NSValue *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  _UIPlatterView *v10;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  id v34;

  -[UIView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    anchorPointValueToAdjustToOnMoveToWindow = self->_anchorPointValueToAdjustToOnMoveToWindow;
    if (anchorPointValueToAdjustToOnMoveToWindow)
    {
      self->_anchorPointValueToAdjustToOnMoveToWindow = 0;
      v34 = v3;
      v5 = anchorPointValueToAdjustToOnMoveToWindow;

      -[NSValue CGPointValue](v5, "CGPointValue");
      v7 = v6;
      v9 = v8;

      v10 = self;
      -[UIView superview](v10, "superview");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView bounds](v10, "bounds");
      v13 = v12;
      v15 = v14;
      v17 = v16;
      v19 = v18;
      -[UIView layer](v10, "layer");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "anchorPoint");
      -[UIView convertPoint:toView:](v10, "convertPoint:toView:", v11, ___PlatterViewAdjustAnchorPointWhileKeepingPosition_block_invoke(v21, v22, v13, v15, v17, v19));
      v24 = v23;
      v26 = v25;

      -[UIView convertPoint:toView:](v10, "convertPoint:toView:", v11, ___PlatterViewAdjustAnchorPointWhileKeepingPosition_block_invoke(v7, v9, v13, v15, v17, v19));
      v28 = v27;
      v30 = v29;
      -[UIView center](v10, "center");
      -[UIView setCenter:](v10, "setCenter:", v31 + v28 - v24, v32 + v30 - v26);
      -[UIView layer](v10, "layer");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v33, "setAnchorPoint:", v7, v9);
      v3 = v34;
    }
  }

}

- (void)updateTransform
{
  _OWORD v3[16];

  if (!-[_UIPlatterView transformAppliedExternally](self, "transformAppliedExternally"))
  {
    -[_UIPlatterView targetTransform](self, "targetTransform");
    v3[4] = v3[12];
    v3[5] = v3[13];
    v3[6] = v3[14];
    v3[7] = v3[15];
    v3[0] = v3[8];
    v3[1] = v3[9];
    v3[2] = v3[10];
    v3[3] = v3[11];
    -[UIView setTransform3D:](self, "setTransform3D:", v3);
    -[_UIPlatterView _updateShadowViewState](self, "_updateShadowViewState");
  }
}

- (BOOL)_isEligibleForFocusOcclusion
{
  return 0;
}

- (_DUIPreview)preview
{
  return self->_preview;
}

- (UIView)componentView
{
  return self->_componentView;
}

- (_UIDragPreviewShadowProperties)shadowProperties
{
  return self->_shadowProperties;
}

- (BOOL)isLifted
{
  return self->_lifted;
}

- (BOOL)isBackgroundVisible
{
  return self->_backgroundVisible;
}

- (BOOL)isShadowVisible
{
  return self->_shadowVisible;
}

- (BOOL)transformAppliedExternally
{
  return self->_transformAppliedExternally;
}

- (BOOL)constrainSize
{
  return self->_constrainSize;
}

- (BOOL)constrainSizeWhenNotLifted
{
  return self->_constrainSizeWhenNotLifted;
}

- (void)setConstrainSizeWhenNotLifted:(BOOL)a3
{
  self->_constrainSizeWhenNotLifted = a3;
}

- (CGSize)overrideSize
{
  double width;
  double height;
  CGSize result;

  width = self->_overrideSize.width;
  height = self->_overrideSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (UIEdgeInsets)contentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInsets.top;
  left = self->_contentInsets.left;
  bottom = self->_contentInsets.bottom;
  right = self->_contentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (CGPoint)offset
{
  double x;
  double y;
  CGPoint result;

  x = self->_offset.x;
  y = self->_offset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setOffset:(CGPoint)a3
{
  self->_offset = a3;
}

- (double)orientationRotation
{
  return self->_orientationRotation;
}

- (BOOL)appliesOriginalRotation
{
  return self->_appliesOriginalRotation;
}

- (double)stackRotation
{
  return self->_stackRotation;
}

- (CGAffineTransform)appliedTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[12].tx;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[12].c;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[13].a;
  return self;
}

- (CGAffineTransform)additionalTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[13].tx;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[13].c;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[14].a;
  return self;
}

- (NSValue)anchorPointValueToAdjustToOnMoveToWindow
{
  return self->_anchorPointValueToAdjustToOnMoveToWindow;
}

- (void)setAnchorPointValueToAdjustToOnMoveToWindow:(id)a3
{
  objc_storeStrong((id *)&self->_anchorPointValueToAdjustToOnMoveToWindow, a3);
}

- (BOOL)isFlipped
{
  return self->_flipped;
}

- (void)setFlipped:(BOOL)a3
{
  self->_flipped = a3;
}

- (BOOL)precisionMode
{
  return self->_precisionMode;
}

- (void)setPrecisionMode:(BOOL)a3
{
  self->_precisionMode = a3;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (_UIShapeView)platterMaskView
{
  return self->_platterMaskView;
}

- (_UIShapeView)portalMaskView
{
  return self->_portalMaskView;
}

- (_UIPortalView)portalView
{
  return self->_portalView;
}

- (void)setPortalView:(id)a3
{
  objc_storeStrong((id *)&self->_portalView, a3);
}

- (UIView)portalWrapperView
{
  return self->_portalWrapperView;
}

- (UIView)shadowView
{
  return self->_shadowView;
}

- (CGAffineTransform)containerCounterScaleTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[14].tx;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[14].c;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[15].a;
  return self;
}

- (void)setContainerCounterScaleTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v4 = *(_OWORD *)&a3->c;
  v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_containerCounterScaleTransform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_containerCounterScaleTransform.c = v4;
  *(_OWORD *)&self->_containerCounterScaleTransform.tx = v3;
}

- (CGAffineTransform)containerCounterRotationTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[15].tx;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[15].c;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[16].a;
  return self;
}

- (void)setContainerCounterRotationTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v4 = *(_OWORD *)&a3->c;
  v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_containerCounterRotationTransform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_containerCounterRotationTransform.c = v4;
  *(_OWORD *)&self->_containerCounterRotationTransform.tx = v3;
}

- (BOOL)hasAppliedMasking
{
  return self->_hasAppliedMasking;
}

- (void)setHasAppliedMasking:(BOOL)a3
{
  self->_hasAppliedMasking = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_portalWrapperView, 0);
  objc_storeStrong((id *)&self->_portalView, 0);
  objc_storeStrong((id *)&self->_portalMaskView, 0);
  objc_storeStrong((id *)&self->_platterMaskView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_anchorPointValueToAdjustToOnMoveToWindow, 0);
  objc_storeStrong((id *)&self->_shadowProperties, 0);
  objc_storeStrong((id *)&self->_componentView, 0);
  objc_storeStrong((id *)&self->_preview, 0);
}

@end
