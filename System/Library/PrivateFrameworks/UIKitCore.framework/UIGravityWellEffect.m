@implementation UIGravityWellEffect

id __65___UIGravityWellEffect_effectWithDescriptor_continuationPreview___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;

  v3 = a2;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setPreview:", v3);
  objc_msgSend(v3, "target");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "container");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "target");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "center");
  v9 = v8;
  v11 = v10;
  objc_msgSend(*(id *)(a1 + 32), "container");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convertPoint:toView:", v12, v9, v11);
  v14 = v13;
  v16 = v15;

  objc_msgSend(v4, "setPositionInPrimaryContainer:", v14, v16, 0.0);
  return v4;
}

uint64_t __37___UIGravityWellEffect_endForHandOff__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_tearDownEffectViews");
  return objc_msgSend(*(id *)(a1 + 32), "_performAllCompletions");
}

void __43___UIGravityWellEffect__installEffectViews__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  BOOL v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  _UIPortalView *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  _UIPortalView *v41;
  void *v42;
  uint64_t v43;
  id obj;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD aBlock[4];
  BOOL v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v1 = a1;
  v57 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "secondaryBodies");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __43___UIGravityWellEffect__installEffectViews__block_invoke_2;
  aBlock[3] = &__block_descriptor_33_e54_v24__0___UIGravityWellEffectBody_8___UIMorphingView_16l;
  v54 = v3;
  v4 = _Block_copy(aBlock);
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  objc_msgSend(*(id *)(v1 + 32), "secondaryBodies");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v50 != v8)
          objc_enumerationMutation(v5);
        (*((void (**)(void *, _QWORD, _QWORD))v4 + 2))(v4, *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i), 0);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
    }
    while (v7);
  }

  objc_msgSend(*(id *)(v1 + 32), "continuationPreview");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "_isVisible"))
  {
    v43 = v1;
    v11 = (void *)objc_opt_new();
    objc_msgSend(v11, "setUseOpacityPairFilter:", 1);
    objc_msgSend(v10, "view");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[_UIPortalView initWithSourceView:]([_UIPortalView alloc], "initWithSourceView:", v42);
    -[_UIPortalView setHidesSourceView:](v12, "setHidesSourceView:", 1);
    v13 = v11;
    v41 = v12;
    objc_msgSend(v11, "addContentView:", v12);
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v14 = v10;
    objc_msgSend(v10, "_matchableProperties");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v46;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v46 != v17)
            objc_enumerationMutation(obj);
          v19 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * j);
          v20 = (void *)objc_opt_new();
          objc_msgSend(v14, "view");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "layer");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setSourceLayer:", v22);

          objc_msgSend(v20, "setKeyPath:", v19);
          objc_msgSend(v20, "setDuration:", INFINITY);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_UIGravityWellEffect.propertyMatch.%@"), v19);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addAnimation:forKey:", v20, v23);

        }
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
      }
      while (v16);
    }

    v1 = v43;
    v10 = v14;
    v24 = v13;
  }
  else
  {
    v24 = 0;
  }
  objc_msgSend(*(id *)(v1 + 32), "primaryBody");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(void *, void *, void *))v4 + 2))(v4, v25, v24);

  objc_msgSend(*(id *)(v1 + 32), "primaryBody");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "preview");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "target");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v28, "container");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v1 + 32), "primaryBody");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "preview");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "view");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v32, "superview");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(v1 + 32), "primaryBody");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "anchorView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29 == v33)
    objc_msgSend(v29, "insertSubview:aboveSubview:", v35, v32);
  else
    objc_msgSend(v29, "addSubview:", v35);

  objc_msgSend(*(id *)(v1 + 32), "primaryBody");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "anchorView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "bringSubviewToFront:", v37);

  objc_msgSend(v32, "_bringAncestorControlledCollectionSubviewToFrontAmongCoplanarPeers");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v38 = v29;
    objc_msgSend(v38, "_verticalScrollIndicator");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "bringSubviewToFront:", v39);

    objc_msgSend(v38, "_horizontalScrollIndicator");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "bringSubviewToFront:", v40);

  }
}

void __43___UIGravityWellEffect__installEffectViews__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _BOOL8 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  int v25;
  void *v26;
  _UIGravityWellEffectAnchorView *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  int v60;
  id v61;
  uint64_t v62;
  void *v63;
  void *v64;
  _OWORD v65[3];
  __int128 v66;
  __int128 v67;
  __int128 v68;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "preview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(unsigned __int8 *)(a1 + 32);
  objc_msgSend(v7, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _UIContextMenuGetPlatformMetrics(objc_msgSend(v10, "userInterfaceIdiom"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "shouldApplyShadowHandler");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
  {
    v14 = (*(uint64_t (**)(uint64_t, void *))(v12 + 16))(v12, v7);
    objc_msgSend(v7, "parameters");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = v14;
  }
  else
  {
    objc_msgSend(v7, "parameters");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = 1;
  }
  objc_msgSend(v15, "setAppliesShadow:", v17);
  v18 = v8 != 0;

  v19 = (void *)objc_opt_new();
  objc_msgSend(v11, "previewShadowSettings");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setShadowSettings:", v20);

  objc_msgSend(v11, "submenuSeparatedOptions");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setSeparatedOptions:", v21);

  objc_msgSend(v11, "shouldApplyClippingHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setShouldApplyClippingHandler:", v22);

  objc_msgSend(v19, "setAlwaysCompact:", v18);
  objc_msgSend(v19, "setCollapsedPreview:", v7);
  objc_msgSend(v19, "setCollapsedShadowStyle:", 1);
  objc_msgSend(v19, "setCollapsedShadowIntensity:", 0.0);
  objc_msgSend(v7, "size");
  objc_msgSend(v19, "setBounds:", 0.0, 0.0, v23, v24);
  objc_msgSend(v19, "setUserInteractionEnabled:", 0);
  objc_msgSend(v19, "setHideChromeWhenCollapsed:", 0);
  objc_msgSend(v19, "setWantsEdgeAntialiasing:", v18);
  if (_UIInternalPreferencesRevisionOnce != -1)
    dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_4_20);
  v25 = _UIInternalPreferencesRevisionVar;
  if (_UIInternalPreferencesRevisionVar >= 1)
  {
    v60 = _UIInternalPreference_ClickUIDebugEnabled;
    if (_UIInternalPreferencesRevisionVar != _UIInternalPreference_ClickUIDebugEnabled)
    {
      while (v25 >= v60)
      {
        _UIInternalPreferenceSync(v25, &_UIInternalPreference_ClickUIDebugEnabled, (uint64_t)CFSTR("ClickUIDebugEnabled"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
        v60 = _UIInternalPreference_ClickUIDebugEnabled;
        if (v25 == _UIInternalPreference_ClickUIDebugEnabled)
          goto LABEL_7;
      }
      if (byte_1EDDA7D7C)
      {
        +[UIColor redColor](UIColor, "redColor");
        v61 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v62 = objc_msgSend(v61, "CGColor");
        objc_msgSend(v19, "layer");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "setBorderColor:", v62);

        objc_msgSend(v19, "layer");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "setBorderWidth:", 1.0);

      }
    }
  }
LABEL_7:

  objc_msgSend(v5, "setEffectView:", v19);
  if (v6)
  {
    objc_msgSend(v5, "setAnchorView:", v6);
    objc_msgSend(v5, "effectView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addContentView:", v26);
  }
  else
  {
    v27 = -[UIView initWithFrame:]([_UIGravityWellEffectAnchorView alloc], "initWithFrame:", 0.0, 0.0, 2.0, 2.0);
    objc_msgSend(v5, "setAnchorView:", v27);

    objc_msgSend(v7, "target");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (v28)
    {
      objc_msgSend(v28, "transform");
    }
    else
    {
      v67 = 0u;
      v68 = 0u;
      v66 = 0u;
    }
    objc_msgSend(v5, "anchorView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v65[0] = v66;
    v65[1] = v67;
    v65[2] = v68;
    objc_msgSend(v30, "setTransform:", v65);

    objc_msgSend(v5, "anchorView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "effectView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addSubview:", v31);

  }
  objc_msgSend(v5, "anchorView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "bounds");
  v35 = v34 + v33 * 0.5;
  v38 = v37 + v36 * 0.5;
  objc_msgSend(v5, "effectView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setCenter:", v35, v38);

  objc_msgSend(v5, "anchorView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setUserInteractionEnabled:", 0);

  objc_msgSend(v7, "target");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "center");
  v43 = v42;
  v45 = v44;
  objc_msgSend(v5, "anchorView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setCenter:", v43, v45);

  objc_msgSend(v7, "target");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "container");
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "view");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "target");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "container");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = -[UIView _subviewsNeedAxisFlipping](v51);
  objc_msgSend(v5, "anchorView");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "layer");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setFlipsHorizontalAxis:", v52);

  objc_msgSend(v7, "target");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "container");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anchorView");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "addSubview:", v57);

  objc_msgSend(v49, "superview");
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "anchorView");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  if (v48 == v58)
    objc_msgSend(v48, "insertSubview:aboveSubview:", v59, v49);
  else
    objc_msgSend(v48, "addSubview:", v59);

}

void __48___UIGravityWellEffect__updateToProgress_state___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  double v26;
  long double v27;
  double v28;
  long double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  __double2 v41;
  void *v42;
  CATransform3D v43;
  CATransform3D v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  CGAffineTransform v49;
  CGAffineTransform v50;
  CGAffineTransform v51;
  CGAffineTransform v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setAnimationCount:", objc_msgSend(*(id *)(a1 + 32), "animationCount") + 1);
  objc_msgSend(*(id *)(a1 + 40), "preview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "size");
  v4 = v3;
  v6 = v5;

  if (v4 >= v6)
    v7 = v4;
  else
    v7 = v6;
  v8 = (v7 + 8.0) / v7;
  if (v8 < 0.9)
    v8 = 0.9;
  v9 = *(double *)(a1 + 48);
  v10 = 1.0 - v9 + v9 * v8;
  v11 = v9 + (1.0 - v9) * 0.0;
  objc_msgSend(*(id *)(a1 + 40), "effectView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCollapsedShadowIntensity:", v11);

  objc_msgSend(*(id *)(a1 + 32), "continuationPreview");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "_isVisible");

  if (v14)
    objc_msgSend(*(id *)(a1 + 32), "continuationPreview");
  else
    objc_msgSend(*(id *)(a1 + 40), "preview");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "target");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
    objc_msgSend(v16, "transform");
  else
    memset(&v51, 0, sizeof(v51));
  v52 = v51;

  v51 = v52;
  CGAffineTransformScale(&v50, &v51, v10, v10);
  objc_msgSend(*(id *)(a1 + 40), "anchorView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = v50;
  objc_msgSend(v18, "setTransform:", &v49);

  objc_msgSend(*(id *)(a1 + 40), "effectView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setHideChromeWhenCollapsed:", 0);

  if (!_AXSReduceMotionEnabled())
  {
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "secondaryBodies");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v46 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          objc_msgSend(v25, "positionInPrimaryContainer");
          v27 = v26 - *(double *)(a1 + 56);
          objc_msgSend(v25, "positionInPrimaryContainer");
          v29 = v28 - *(double *)(a1 + 64);
          objc_msgSend(v25, "positionInPrimaryContainer");
          v31 = v30 - *(double *)(a1 + 72);
          v32 = atan2(v29, v27);
          v33 = hypot(v27, v29);
          objc_msgSend(*(id *)(a1 + 32), "secondaryBodies");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "lastObject");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "distanceFromPrimaryBody");
          v37 = v33 / v36;

          v38 = (1.0 - v37) * (1.0 - v37);
          v39 = *(double *)(a1 + 48);
          v40 = v39 * (v38 * 20.0 + (1.0 - v38) * 10.0);
          if (v40 < v33)
            v33 = v40;
          v41 = __sincos_stret(v32);
          CATransform3DMakeTranslation(&v44, -(v33 * v41.__cosval), -(v33 * v41.__sinval), v31 * v39 + (1.0 - v39) * 0.0);
          objc_msgSend(v25, "effectView");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = v44;
          objc_msgSend(v42, "setTransform3D:", &v43);

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
      }
      while (v22);
    }

  }
}

uint64_t __48___UIGravityWellEffect__updateToProgress_state___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setAnimationCount:", objc_msgSend(*(id *)(a1 + 32), "animationCount") - 1);
  objc_msgSend(*(id *)(a1 + 32), "animationCount");
  result = objc_msgSend(*(id *)(a1 + 32), "animationCount");
  if (!result)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "state");
    if (!result)
    {
      objc_msgSend(*(id *)(a1 + 32), "_tearDownEffectViews");
      return objc_msgSend(*(id *)(a1 + 32), "_performAllCompletions");
    }
  }
  return result;
}

@end
