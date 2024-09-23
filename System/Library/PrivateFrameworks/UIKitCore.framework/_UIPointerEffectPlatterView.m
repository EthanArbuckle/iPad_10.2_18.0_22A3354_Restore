@implementation _UIPointerEffectPlatterView

- (_UIPointerEffectPlatterView)initWithTargetedPreview:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  _UIPointerEffectPlatterView *v9;
  _UIPointerEffectPlatterView *v10;
  void *v11;
  void *v12;
  _UIPortalView *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  _UIPortalView *v21;
  void *v22;
  _UIPortalView *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  unint64_t v36;
  NSObject *v37;
  NSObject *v38;
  uint64_t v39;
  void *v40;
  int v41;
  void *v42;
  id v43;
  uint64_t v44;
  void *v45;
  void *v46;
  _UIPortalView *v48;
  void *v49;
  uint8_t buf[16];
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  objc_super v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0C9D538];
  v6 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  objc_msgSend(v4, "size");
  v55.receiver = self;
  v55.super_class = (Class)_UIPointerEffectPlatterView;
  v9 = -[UIView initWithFrame:](&v55, sel_initWithFrame_, v5, v6, v7, v8);
  v10 = v9;
  if (v9)
  {
    -[UIView setUserInteractionEnabled:](v9, "setUserInteractionEnabled:", 0);
    -[UIView layer](v10, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAllowsGroupBlending:", 0);

    -[_UIPointerEffectPlatterView setTargetedPreview:](v10, "setTargetedPreview:", v4);
    v10->_tintDisabled = 1;
    objc_msgSend(v4, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    if (objc_msgSend(v4, "_sourceViewIsInViewHierarchy"))
    {
      v13 = -[_UIPortalView initWithSourceView:]([_UIPortalView alloc], "initWithSourceView:", v12);
      -[_UIPortalView setName:](v13, "setName:", CFSTR("_UIPointerEffectPlatterView.originalContent"));
      -[_UIPortalView setHidesSourceView:](v13, "setHidesSourceView:", 1);
      -[_UIPortalView setMatchesAlpha:](v13, "setMatchesAlpha:", 1);
      -[_UIPortalView setAllowsBackdropGroups:](v13, "setAllowsBackdropGroups:", 1);
      -[_UIPortalView setAllowsHitTesting:](v13, "setAllowsHitTesting:", 1);
      -[UIView layer](v13, "layer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setAllowsGroupBlending:", 0);

    }
    else
    {
      v13 = v12;
    }
    -[_UIPointerEffectPlatterView setContentSourceView:](v10, "setContentSourceView:", v13);
    -[_UIPointerEffectPlatterView contentSourceView](v10, "contentSourceView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "frame");
    v17 = v16;
    v19 = v18;
    -[_UIPointerEffectPlatterView contentSourceView](v10, "contentSourceView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setFrame:", 0.0, 0.0, v17, v19);

    -[UIView addSubview:](v10, "addSubview:", v13);
    -[_UIPointerEffectPlatterView _updateContentMask](v10, "_updateContentMask");
    v21 = [_UIPortalView alloc];
    -[_UIPointerEffectPlatterView contentSourceView](v10, "contentSourceView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[_UIPortalView initWithSourceView:](v21, "initWithSourceView:", v22);

    -[_UIPortalView setName:](v23, "setName:", CFSTR("_UIPointerEffectPlatterView.content"));
    -[_UIPortalView setHidesSourceView:](v23, "setHidesSourceView:", 1);
    -[_UIPortalView setMatchesPosition:](v23, "setMatchesPosition:", 1);
    -[_UIPortalView setMatchesTransform:](v23, "setMatchesTransform:", 1);
    -[_UIPortalView setMatchesAlpha:](v23, "setMatchesAlpha:", 1);
    -[_UIPortalView setAllowsBackdropGroups:](v23, "setAllowsBackdropGroups:", 1);
    -[_UIPortalView setAllowsHitTesting:](v23, "setAllowsHitTesting:", 1);
    -[UIView layer](v23, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setAllowsGroupBlending:", 0);

    -[_UIPointerEffectPlatterView setContentPortalView:](v10, "setContentPortalView:", v23);
    -[_UIPointerEffectPlatterView contentPortalView](v10, "contentPortalView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v10, "addSubview:", v25);

    objc_msgSend(v4, "_accessoryViews");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "count");

    if (v27)
    {
      v48 = v13;
      v49 = v12;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIPointerEffectPlatterView setAccessoryPortals:](v10, "setAccessoryPortals:", v28);

      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      objc_msgSend(v4, "_accessoryViews");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
      if (v30)
      {
        v31 = v30;
        v32 = *(_QWORD *)v52;
        do
        {
          v33 = 0;
          do
          {
            if (*(_QWORD *)v52 != v32)
              objc_enumerationMutation(v29);
            v34 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v33);
            objc_msgSend(v34, "window");
            v35 = (void *)objc_claimAutoreleasedReturnValue();

            if (v35)
            {
              -[_UIPointerEffectPlatterView _installAccessoryView:](v10, "_installAccessoryView:", v34);
            }
            else if (os_variant_has_internal_diagnostics())
            {
              __UIFaultDebugAssertLog();
              v38 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_fault_impl(&dword_185066000, v38, OS_LOG_TYPE_FAULT, "All of UITargetedPreview's _accessoryViews must be in a window.", buf, 2u);
              }

            }
            else
            {
              v36 = initWithTargetedPreview____s_category;
              if (!initWithTargetedPreview____s_category)
              {
                v36 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
                atomic_store(v36, (unint64_t *)&initWithTargetedPreview____s_category);
              }
              v37 = *(NSObject **)(v36 + 8);
              if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_185066000, v37, OS_LOG_TYPE_ERROR, "All of UITargetedPreview's _accessoryViews must be in a window.", buf, 2u);
              }
            }
            ++v33;
          }
          while (v31 != v33);
          v39 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
          v31 = v39;
        }
        while (v39);
      }

      v12 = v49;
      v13 = v48;
    }
    +[_UIPointerSettingsDomain rootSettings](_UIPointerSettingsDomain, "rootSettings");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "showEffectPlatter");

    if (v41)
    {
      +[UIColor greenColor](UIColor, "greenColor");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "colorWithAlphaComponent:", 0.75);
      v43 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v44 = objc_msgSend(v43, "CGColor");
      -[UIView layer](v10, "layer");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "setBorderColor:", v44);

      -[UIView layer](v10, "layer");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setBorderWidth:", 1.0);

    }
  }

  return v10;
}

- (void)_installAccessoryView:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  _UIPortalView *v13;

  v4 = a3;
  v13 = -[_UIPortalView initWithSourceView:]([_UIPortalView alloc], "initWithSourceView:", v4);
  -[_UIPortalView setName:](v13, "setName:", CFSTR("_UIPointerEffectPlatterView.accessory"));
  -[_UIPortalView setHidesSourceView:](v13, "setHidesSourceView:", 1);
  -[_UIPortalView setMatchesAlpha:](v13, "setMatchesAlpha:", 1);
  -[_UIPortalView setAllowsBackdropGroups:](v13, "setAllowsBackdropGroups:", 1);
  objc_msgSend(v4, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "center");
  v7 = v6;
  v9 = v8;

  -[_UIPointerEffectPlatterView targetedPreview](self, "targetedPreview");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convertPoint:toView:", v11, v7, v9);
  -[_UIPortalView setCenter:](v13, "setCenter:");

  -[_UIPointerEffectPlatterView accessoryPortals](self, "accessoryPortals");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v13);

  -[UIView addSubview:](self, "addSubview:", v13);
}

- (void)setTargetedPreview:(id)a3
{
  UITargetedPreview *targetedPreview;
  void *v5;
  void *v6;
  UITargetedPreview *v7;
  UITargetedPreview *v8;
  id v9;

  v9 = a3;
  if ((objc_msgSend(v9, "isEqual:", self->_targetedPreview) & 1) == 0)
  {
    targetedPreview = self->_targetedPreview;
    if (!targetedPreview
      || (-[UITargetedPreview view](targetedPreview, "view"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v9, "view"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v6,
          v5,
          v5 == v6))
    {
      v7 = (UITargetedPreview *)objc_msgSend(v9, "copy");
      v8 = self->_targetedPreview;
      self->_targetedPreview = v7;

      -[_UIPointerEffectPlatterView _updateContentMask](self, "_updateContentMask");
    }
  }

}

- (void)_updateContentMask
{
  void *v3;
  void *v4;
  void *v5;
  CGFloat v6;
  CGFloat v7;
  _UIShapeView *v8;
  void *v9;
  _UIShapeView *v10;
  uint64_t v11;
  void *v12;
  id v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  -[_UIPointerEffectPlatterView targetedPreview](self, "targetedPreview");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIPointerEffectPlatterView contentSourceView](self, "contentSourceView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "parameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "visiblePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5 || objc_msgSend(v13, "_previewMode") == 4 || objc_msgSend(v13, "_previewMode") == 5)
  {
    objc_msgSend(v3, "setMaskView:", 0);
  }
  else
  {
    objc_msgSend(v5, "bounds");
    v6 = -CGRectGetMinX(v14);
    objc_msgSend(v5, "bounds");
    v7 = -CGRectGetMinY(v15);
    objc_msgSend(v3, "bounds");
    v17 = CGRectOffset(v16, v6, v7);
    objc_msgSend(v3, "setFrame:", v17.origin.x, v17.origin.y, v17.size.width, v17.size.height);
    v8 = [_UIShapeView alloc];
    objc_msgSend(v13, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    v10 = -[UIView initWithFrame:](v8, "initWithFrame:");

    v11 = objc_msgSend(objc_retainAutorelease(v5), "CGPath");
    -[_UIShapeView shapeLayer](v10, "shapeLayer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPath:", v11);

    objc_msgSend(v3, "setMaskView:", v10);
  }

}

- (void)setShadowAlpha:(double)a3
{
  void *v4;
  double shadowAlpha;
  id v6;
  _QWORD v7[5];

  if (self->_shadowAlpha != a3)
  {
    self->_shadowAlpha = a3;
    if (a3 > 0.0)
    {
      -[_UIPointerEffectPlatterView shadowView](self, "shadowView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v4)
      {
        v7[0] = MEMORY[0x1E0C809B0];
        v7[1] = 3221225472;
        v7[2] = __46___UIPointerEffectPlatterView_setShadowAlpha___block_invoke;
        v7[3] = &unk_1E16B1B28;
        v7[4] = self;
        +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v7);
      }
    }
    shadowAlpha = self->_shadowAlpha;
    -[_UIPointerEffectPlatterView shadowView](self, "shadowView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAlpha:", shadowAlpha);

  }
}

- (void)setTintDisabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_tintDisabled != a3)
  {
    v3 = a3;
    self->_tintDisabled = a3;
    -[_UIPointerEffectPlatterView tintView](self, "tintView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDisabled:", v3);

  }
}

- (void)setTintMode:(int64_t)a3
{
  _QWORD v3[5];

  if (self->_tintMode != a3)
  {
    self->_tintMode = a3;
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __43___UIPointerEffectPlatterView_setTintMode___block_invoke;
    v3[3] = &unk_1E16B1B28;
    v3[4] = self;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v3);
  }
}

- (void)setTintViewScale:(double)a3
{
  void *v4;
  CGAffineTransform v5;
  CGAffineTransform v6;

  if (vabdd_f64(a3, self->_tintViewScale) >= 2.22044605e-16)
  {
    self->_tintViewScale = a3;
    CGAffineTransformMakeScale(&v6, a3, a3);
    -[_UIPointerEffectPlatterView tintView](self, "tintView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v6;
    objc_msgSend(v4, "setTransform:", &v5);

  }
}

- (void)setTintViewShape:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->_tintViewShape) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_tintViewShape, a3);
    -[_UIPointerEffectPlatterView _layoutTintView](self, "_layoutTintView");
  }

}

- (void)setSpecularHighlight:(id)a3
{
  UIView *v5;
  id v6;
  _QWORD v7[5];

  v5 = (UIView *)a3;
  if (self->_specularHighlight != v5)
    objc_storeStrong((id *)&self->_specularHighlight, a3);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52___UIPointerEffectPlatterView_setSpecularHighlight___block_invoke;
  v7[3] = &unk_1E16B1B28;
  v7[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v7, v5);

}

- (void)setPressed:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  if (self->_pressed != a3)
  {
    v3 = a3;
    self->_pressed = a3;
    -[_UIPointerEffectPlatterView tintView](self, "tintView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPressed:", v3);

  }
}

- (void)layoutSubviews
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  CGFloat v37;
  void *v38;
  CGFloat v39;
  void *v40;
  double x;
  double y;
  double width;
  double height;
  void *v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  void *v57;
  double v58;
  double v59;
  void *v60;
  void *v61;
  void *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  objc_super v67;
  _BYTE v68[128];
  uint64_t v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;

  v69 = *MEMORY[0x1E0C80C00];
  v67.receiver = self;
  v67.super_class = (Class)_UIPointerEffectPlatterView;
  -[UIView layoutSubviews](&v67, sel_layoutSubviews);
  v3 = -[_UIPointerEffectPlatterView tintMode](self, "tintMode");
  if (v3 == 2)
  {
    -[_UIPointerEffectPlatterView tintView](self, "tintView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIPointerEffectPlatterView contentPortalView](self, "contentPortalView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v7, v8);

    -[_UIPointerEffectPlatterView lumaTrackingView](self, "lumaTrackingView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView sendSubviewToBack:](self, "sendSubviewToBack:", v5);
  }
  else
  {
    if (v3 != 1)
      goto LABEL_6;
    -[_UIPointerEffectPlatterView tintView](self, "tintView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bringSubviewToFront:](self, "bringSubviewToFront:", v4);

    -[_UIPointerEffectPlatterView lumaTrackingView](self, "lumaTrackingView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIPointerEffectPlatterView tintView](self, "tintView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v5, v6);

  }
LABEL_6:
  -[_UIPointerEffectPlatterView lumaTrackingView](self, "lumaTrackingView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[_UIPointerEffectPlatterView lumaTrackingView](self, "lumaTrackingView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPaused:", 0);

  }
  -[_UIPointerEffectPlatterView specularHighlight](self, "specularHighlight");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[_UIPointerEffectPlatterView specularOverlayView](self, "specularOverlayView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bringSubviewToFront:](self, "bringSubviewToFront:", v12);

  }
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  -[_UIPointerEffectPlatterView accessoryPortals](self, "accessoryPortals", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v64;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v64 != v16)
          objc_enumerationMutation(v13);
        -[UIView bringSubviewToFront:](self, "bringSubviewToFront:", *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * v17++));
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
    }
    while (v15);
  }

  -[UIView bounds](self, "bounds");
  v20 = v19 + v18 * 0.5;
  v23 = v22 + v21 * 0.5;
  -[_UIPointerEffectPlatterView targetedPreview](self, "targetedPreview");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "parameters");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "effectiveShadowPath");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "visiblePath");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = v23;
  v29 = v20;
  if (v26 != v27)
  {
    objc_msgSend(v25, "effectiveShadowPath");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "bounds");
    v29 = v32 + v31 * 0.5;
    v28 = v34 + v33 * 0.5;

  }
  objc_msgSend(v25, "visiblePath");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    objc_msgSend(v25, "visiblePath");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "bounds");
    v37 = -CGRectGetMinX(v70);

    objc_msgSend(v25, "visiblePath");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "bounds");
    v39 = -CGRectGetMinY(v71);

    -[_UIPointerEffectPlatterView contentSourceView](self, "contentSourceView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "bounds");
    v73 = CGRectOffset(v72, v37, v39);
    x = v73.origin.x;
    y = v73.origin.y;
    width = v73.size.width;
    height = v73.size.height;
    -[_UIPointerEffectPlatterView contentSourceView](self, "contentSourceView");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setFrame:", x, y, width, height);

  }
  else
  {
    -[_UIPointerEffectPlatterView contentSourceView](self, "contentSourceView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setCenter:", v20, v23);
  }

  -[_UIPointerEffectPlatterView shadowView](self, "shadowView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setCenter:", v29, v28);

  -[UIView bounds](self, "bounds");
  v48 = v47;
  v50 = v49;
  v52 = v51;
  v54 = v53;
  -[_UIPointerEffectPlatterView contentPortalView](self, "contentPortalView");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setFrame:", v48, v50, v52, v54);

  -[_UIPointerEffectPlatterView specularOverlayView](self, "specularOverlayView");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[_UIPointerEffectPlatterView specularOptions](self, "specularOptions") & 2) != 0)
  {
    -[_UIPointerEffectPlatterView tintViewShape](self, "tintViewShape");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "rect");
    objc_msgSend(v56, "setFrame:");
    objc_msgSend(v57, "effectiveCornerRadius");
    v59 = v58;
    objc_msgSend(v56, "layer");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setCornerRadius:", v59);

    objc_msgSend(v57, "cornerCurve");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "layer");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setCornerCurve:", v61);

    objc_msgSend(v56, "setClipsToBounds:", 1);
  }
  else
  {
    -[UIView bounds](self, "bounds");
    objc_msgSend(v56, "setFrame:");
  }
  -[_UIPointerEffectPlatterView _layoutTintView](self, "_layoutTintView");

}

- (void)setHidden:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (!-[_UIPointerEffectPlatterView geometryFrozen](self, "geometryFrozen"))
  {
    v5.receiver = self;
    v5.super_class = (Class)_UIPointerEffectPlatterView;
    -[UIView setHidden:](&v5, sel_setHidden_, v3);
  }
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!-[_UIPointerEffectPlatterView geometryFrozen](self, "geometryFrozen"))
  {
    v8.receiver = self;
    v8.super_class = (Class)_UIPointerEffectPlatterView;
    -[UIView setFrame:](&v8, sel_setFrame_, x, y, width, height);
  }
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!-[_UIPointerEffectPlatterView geometryFrozen](self, "geometryFrozen"))
  {
    v8.receiver = self;
    v8.super_class = (Class)_UIPointerEffectPlatterView;
    -[UIView setBounds:](&v8, sel_setBounds_, x, y, width, height);
  }
}

- (void)setCenter:(CGPoint)a3
{
  double y;
  double x;
  objc_super v6;

  y = a3.y;
  x = a3.x;
  if (!-[_UIPointerEffectPlatterView geometryFrozen](self, "geometryFrozen"))
  {
    v6.receiver = self;
    v6.super_class = (Class)_UIPointerEffectPlatterView;
    -[UIView setCenter:](&v6, sel_setCenter_, x, y);
  }
}

- (id)_newShadowView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  CGFloat v7;
  CGFloat MinY;
  void *v9;
  void *v10;
  void *v11;
  _UIRadiosityShadowView *v12;
  void *v13;
  _UIRadiosityShadowView *v14;
  uint64_t v15;
  void *v16;
  double v17;
  void *v18;
  CGAffineTransform v20;
  CGRect v21;
  CGRect v22;

  -[_UIPointerEffectPlatterView targetedPreview](self, "targetedPreview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "effectiveShadowPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  if (v6)
  {
    objc_msgSend(v6, "bounds");
    v7 = -CGRectGetMinX(v21);
    objc_msgSend(v6, "bounds");
    MinY = CGRectGetMinY(v22);
    CGAffineTransformMakeTranslation(&v20, v7, -MinY);
    objc_msgSend(v6, "applyTransform:", &v20);
    v9 = v6;
  }
  else
  {
    -[_UIPointerEffectPlatterView targetedPreview](self, "targetedPreview");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_cornerRadius");

    -[UIView bounds](self, "bounds");
    +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12 = [_UIRadiosityShadowView alloc];
  -[_UIPointerEffectPlatterView contentSourceView](self, "contentSourceView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[_UIRadiosityShadowView initWithSourceView:shadowPath:isSoft:](v12, "initWithSourceView:shadowPath:isSoft:", v13, v9, -[_UIPointerEffectPlatterView useSoftShadow](self, "useSoftShadow"));

  if (v6)
  {
    v15 = 1;
  }
  else
  {
    objc_msgSend(v4, "backgroundColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "alphaComponent");
    if (fabs(v17) < 2.22044605e-16)
    {
      v15 = 0;
    }
    else
    {
      objc_msgSend(v4, "backgroundColor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v18, "_isOpaque") ^ 1;

    }
  }
  -[_UIRadiosityShadowView setNeedsPunchout:](v14, "setNeedsPunchout:", v15);
  -[UIView setAlpha:](v14, "setAlpha:", 0.0);

  return v14;
}

- (id)_newTintView
{
  _UIPointerEffectTintView *v3;
  void *v4;
  _UIPointerEffectTintView *v5;

  v3 = [_UIPointerEffectTintView alloc];
  -[_UIPointerEffectPlatterView tintColorMatrixProvider](self, "tintColorMatrixProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_UIPointerEffectTintView initWithTintColorMatrixProvider:](v3, "initWithTintColorMatrixProvider:", v4);

  -[UIView setClipsToBounds:](v5, "setClipsToBounds:", 1);
  -[_UIPointerEffectTintView setDisabled:](v5, "setDisabled:", -[_UIPointerEffectPlatterView isTintDisabled](self, "isTintDisabled"));
  return v5;
}

- (void)_layoutTintView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  _BOOL8 v25;
  void *v26;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  CGFloat v31;
  CGFloat MinY;
  _UIShapeView *v33;
  _UIShapeView *v34;
  uint64_t v35;
  void *v36;
  CGAffineTransform v37;
  CGRect v38;
  CGRect v39;

  -[_UIPointerEffectPlatterView tintView](self, "tintView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[_UIPointerEffectPlatterView targetedPreview](self, "targetedPreview");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "target");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIPointerEffectPlatterView tintViewShape](self, "tintViewShape");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "path");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v9, "copy");

      if (v10)
        objc_msgSend(v10, "bounds");
      else
        objc_msgSend(v8, "rect");
      v29 = v11;
      v28 = v12;
      v18 = v13;
      v20 = v14;
      objc_msgSend(v8, "effectiveCornerRadius");
      v22 = v30;
      objc_msgSend(v8, "cornerCurve");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v26 == (void *)*MEMORY[0x1E0CD2A68];
      v27 = 15;
    }
    else
    {
      objc_msgSend(v4, "parameters");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "visiblePath");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v16, "copy");

      objc_msgSend(v4, "size");
      v18 = v17;
      v20 = v19;
      objc_msgSend(v5, "_cornerRadius");
      v22 = v21;
      objc_msgSend(v5, "layer");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "cornerCurve");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24 == (void *)*MEMORY[0x1E0CD2A68];

      objc_msgSend(v5, "layer");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "maskedCorners");
      v28 = 0.0;
      v29 = 0.0;
    }

    objc_msgSend(v3, "setCenter:", v29 + v18 * 0.5, v28 + v20 * 0.5);
    objc_msgSend(v3, "setBounds:", 0.0, 0.0, v18, v20);
    if (v10)
    {
      objc_msgSend(v10, "bounds");
      v31 = -CGRectGetMinX(v38);
      objc_msgSend(v10, "bounds");
      MinY = CGRectGetMinY(v39);
      CGAffineTransformMakeTranslation(&v37, v31, -MinY);
      objc_msgSend(v10, "applyTransform:", &v37);
      v33 = [_UIShapeView alloc];
      objc_msgSend(v10, "bounds");
      v34 = -[UIView initWithFrame:](v33, "initWithFrame:");
      v35 = objc_msgSend(objc_retainAutorelease(v10), "CGPath");
      -[_UIShapeView shapeLayer](v34, "shapeLayer");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setPath:", v35);

      objc_msgSend(v3, "setMaskView:", v34);
    }
    else
    {
      objc_msgSend(v3, "_setCornerRadius:continuous:maskedCorners:", v25, v27, v22);
    }

  }
}

- (id)_newLumaTrackingViewForTintView:(id)a3
{
  id v3;
  _UILumaTrackingBackdropView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  _UILumaTrackingBackdropView *v9;

  v3 = a3;
  v4 = [_UILumaTrackingBackdropView alloc];
  objc_msgSend(v3, "frame");
  v9 = -[_UILumaTrackingBackdropView initWithTransitionBoundaries:delegate:frame:](v4, "initWithTransitionBoundaries:delegate:frame:", v3, 0.4, 0.6, v5, v6, v7, v8);

  return v9;
}

- (id)_specularOverlayView:(id)a3 withOptions:(unint64_t)a4
{
  char v4;
  id v6;
  void *v7;
  void *v8;
  UIView *v9;
  UIView *v10;
  void *v11;
  UIView *v12;
  UIView *v13;
  _UIPortalView *v14;
  _UIPortalView *v15;
  uint64_t v16;
  void *v17;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if ((v4 & 2) != 0)
  {
    v10 = (UIView *)v6;
  }
  else
  {
    -[_UIPointerEffectPlatterView contentSourceView](self, "contentSourceView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = [UIView alloc];
    objc_msgSend(v8, "bounds");
    v10 = -[UIView initWithFrame:](v9, "initWithFrame:");
    -[UIView layer](v10, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAllowsGroupBlending:", 0);

    v12 = [UIView alloc];
    -[UIView bounds](v10, "bounds");
    v13 = -[UIView initWithFrame:](v12, "initWithFrame:");
    if ((v4 & 1) != 0)
    {
      v14 = [_UIPortalView alloc];
      -[UIView bounds](v13, "bounds");
      v15 = -[_UIPortalView initWithFrame:](v14, "initWithFrame:");
      -[_UIPortalView setName:](v15, "setName:", CFSTR("_UIPointerEffectPlatterView.specularOverlayMask"));
      -[_UIPortalView setSourceView:](v15, "setSourceView:", v8);
      -[_UIPortalView setMatchesAlpha:](v15, "setMatchesAlpha:", 1);
      -[_UIPortalView setMatchesPosition:](v15, "setMatchesPosition:", 1);
      -[_UIPortalView setMatchesTransform:](v15, "setMatchesTransform:", 1);
      -[UIView setUserInteractionEnabled:](v15, "setUserInteractionEnabled:", 0);
      -[UIView setMaskView:](v13, "setMaskView:", v15);

    }
    if ((v4 & 4) == 0)
    {
      v16 = *MEMORY[0x1E0CD2EA0];
      -[UIView layer](v13, "layer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setCompositingFilter:", v16);

    }
    -[UIView addSubview:](v13, "addSubview:", v7);
    -[UIView addSubview:](v10, "addSubview:", v13);

  }
  return v10;
}

- (BOOL)_isEligibleForFocusOcclusion
{
  return 0;
}

- (UITargetedPreview)targetedPreview
{
  return self->_targetedPreview;
}

- (double)shadowAlpha
{
  return self->_shadowAlpha;
}

- (BOOL)isTintDisabled
{
  return self->_tintDisabled;
}

- (int64_t)tintMode
{
  return self->_tintMode;
}

- (double)tintViewScale
{
  return self->_tintViewScale;
}

- (UIPointerShape)tintViewShape
{
  return self->_tintViewShape;
}

- (UIView)specularHighlight
{
  return self->_specularHighlight;
}

- (unint64_t)specularOptions
{
  return self->_specularOptions;
}

- (void)setSpecularOptions:(unint64_t)a3
{
  self->_specularOptions = a3;
}

- (BOOL)useSoftShadow
{
  return self->_useSoftShadow;
}

- (void)setUseSoftShadow:(BOOL)a3
{
  self->_useSoftShadow = a3;
}

- (BOOL)geometryFrozen
{
  return self->_geometryFrozen;
}

- (void)setGeometryFrozen:(BOOL)a3
{
  self->_geometryFrozen = a3;
}

- (BOOL)isPressed
{
  return self->_pressed;
}

- (id)tintColorMatrixProvider
{
  return self->_tintColorMatrixProvider;
}

- (void)setTintColorMatrixProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 480);
}

- (UIView)contentSourceView
{
  return self->_contentSourceView;
}

- (void)setContentSourceView:(id)a3
{
  objc_storeStrong((id *)&self->_contentSourceView, a3);
}

- (UIView)shadowView
{
  return self->_shadowView;
}

- (void)setShadowView:(id)a3
{
  objc_storeStrong((id *)&self->_shadowView, a3);
}

- (_UIPortalView)contentPortalView
{
  return self->_contentPortalView;
}

- (void)setContentPortalView:(id)a3
{
  objc_storeStrong((id *)&self->_contentPortalView, a3);
}

- (_UIPointerEffectTintView)tintView
{
  return self->_tintView;
}

- (void)setTintView:(id)a3
{
  objc_storeStrong((id *)&self->_tintView, a3);
}

- (_UILumaTrackingBackdropView)lumaTrackingView
{
  return self->_lumaTrackingView;
}

- (void)setLumaTrackingView:(id)a3
{
  objc_storeStrong((id *)&self->_lumaTrackingView, a3);
}

- (UIView)specularOverlayView
{
  return self->_specularOverlayView;
}

- (void)setSpecularOverlayView:(id)a3
{
  objc_storeStrong((id *)&self->_specularOverlayView, a3);
}

- (NSMutableArray)accessoryPortals
{
  return self->_accessoryPortals;
}

- (void)setAccessoryPortals:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryPortals, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryPortals, 0);
  objc_storeStrong((id *)&self->_specularOverlayView, 0);
  objc_storeStrong((id *)&self->_lumaTrackingView, 0);
  objc_storeStrong((id *)&self->_tintView, 0);
  objc_storeStrong((id *)&self->_contentPortalView, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_contentSourceView, 0);
  objc_storeStrong(&self->_tintColorMatrixProvider, 0);
  objc_storeStrong((id *)&self->_specularHighlight, 0);
  objc_storeStrong((id *)&self->_tintViewShape, 0);
  objc_storeStrong((id *)&self->_targetedPreview, 0);
}

@end
