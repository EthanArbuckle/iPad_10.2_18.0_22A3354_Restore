@implementation _UIAnchoredClickHighlightPlatterView

- (_UIAnchoredClickHighlightPlatterView)initWithTargetedPreview:(id)a3
{
  _UIAnchoredClickHighlightPlatterView *v3;
  int v4;
  int v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)_UIAnchoredClickHighlightPlatterView;
  v3 = -[_UIHighlightPlatterView initWithTargetedPreview:](&v23, sel_initWithTargetedPreview_, a3);
  if (v3)
  {
    if (_UIInternalPreferencesRevisionOnce != -1)
      dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_4_20);
    v4 = _UIInternalPreferencesRevisionVar;
    if (_UIInternalPreferencesRevisionVar >= 1)
    {
      v6 = _UIInternalPreference_ClickUIDebugEnabled;
      if (_UIInternalPreferencesRevisionVar != _UIInternalPreference_ClickUIDebugEnabled)
      {
        while (v4 >= v6)
        {
          _UIInternalPreferenceSync(v4, &_UIInternalPreference_ClickUIDebugEnabled, (uint64_t)CFSTR("ClickUIDebugEnabled"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
          v6 = _UIInternalPreference_ClickUIDebugEnabled;
          if (v4 == _UIInternalPreference_ClickUIDebugEnabled)
            return v3;
        }
        if (byte_1EDDA7D7C)
        {
          +[UIColor systemOrangeColor](UIColor, "systemOrangeColor");
          v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v8 = objc_msgSend(v7, "CGColor");
          -[_UIHighlightPlatterView portalView](v3, "portalView");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "layer");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setBorderColor:", v8);

          -[_UIHighlightPlatterView portalView](v3, "portalView");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "layer");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setBorderWidth:", 1.0);

          +[UIColor redColor](UIColor, "redColor");
          v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v14 = objc_msgSend(v13, "CGColor");
          -[UIView layer](v3, "layer");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setBorderColor:", v14);

          -[UIView layer](v3, "layer");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setBorderWidth:", 1.0);

          +[UIColor blueColor](UIColor, "blueColor");
          v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v18 = objc_msgSend(v17, "CGColor");
          -[_UIAnchoredClickHighlightPlatterView anchorView](v3, "anchorView");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "layer");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setBorderColor:", v18);

          -[_UIAnchoredClickHighlightPlatterView anchorView](v3, "anchorView");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "layer");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setBorderWidth:", 1.0);

        }
      }
    }
  }
  return v3;
}

- (void)anchorToContainer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
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
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _OWORD v43[3];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[2];

  v47[1] = *MEMORY[0x1E0C80C00];
  -[_UIHighlightPlatterView targetedPreview](self, "targetedPreview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "target");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setUserInteractionEnabled:", 0);
  objc_msgSend(v5, "setUseOpacityPairFilter:", 1);
  -[_UIAnchoredClickHighlightPlatterView setAnchorView:](self, "setAnchorView:", v5);
  objc_msgSend(v3, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "container");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v5);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    objc_msgSend(v8, "_verticalScrollIndicator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bringSubviewToFront:", v9);

    objc_msgSend(v8, "_horizontalScrollIndicator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bringSubviewToFront:", v10);

  }
  objc_msgSend(v4, "center");
  objc_msgSend(v5, "setCenter:");
  if ((objc_msgSend(v3, "hasCustomTarget") & 1) != 0)
  {
    if (objc_msgSend(v3, "_sourceViewIsInViewHierarchy"))
    {
      v11 = v6;
      objc_msgSend(v4, "center");
      v13 = v12;
      v15 = v14;
      objc_msgSend(v4, "container");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "convertPoint:fromView:", v16, v13, v15);
      v18 = v17;
      v20 = v19;
LABEL_8:

      goto LABEL_11;
    }
    objc_msgSend(v4, "container");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "center");
    v18 = v28;
    v20 = v29;
  }
  else
  {
    v11 = v6;
    objc_msgSend(v3, "parameters");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "visiblePath");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v3, "parameters");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "visiblePath");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "bounds");
      v18 = v25 + v24 * 0.5;
      v20 = v27 + v26 * 0.5;

      goto LABEL_8;
    }
    objc_msgSend(v11, "bounds");
    v18 = v31 + v30 * 0.5;
    v20 = v33 + v32 * 0.5;
  }
LABEL_11:
  objc_msgSend(v3, "overridePositionTrackingView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    objc_msgSend(v11, "convertPoint:toView:", v34, v18, v20);
    v18 = v35;
    v20 = v36;
    v37 = v34;

    v11 = v37;
  }
  v38 = (void *)objc_opt_new();
  objc_msgSend(v11, "layer");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setSourceLayer:", v39);

  objc_msgSend(v38, "setKeyPath:", CFSTR("position"));
  objc_msgSend(v38, "setDuration:", INFINITY);
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v18, v20);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = v40;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 1);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setSourcePoints:", v41);

  objc_msgSend(v5, "layer");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "addAnimation:forKey:", v38, CFSTR("_UIClickHighlightMatchMoveAnimation"));

  if (v4)
  {
    objc_msgSend(v4, "transform");
  }
  else
  {
    v45 = 0u;
    v46 = 0u;
    v44 = 0u;
  }
  v43[0] = v44;
  v43[1] = v45;
  v43[2] = v46;
  objc_msgSend(v5, "setTransform:", v43);

}

- (void)deAnchor
{
  id v2;

  -[_UIAnchoredClickHighlightPlatterView anchorView](self, "anchorView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

}

- (_UIMorphingView)anchorView
{
  return (_UIMorphingView *)objc_loadWeakRetained((id *)&self->_anchorView);
}

- (void)setAnchorView:(id)a3
{
  objc_storeWeak((id *)&self->_anchorView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_anchorView);
}

@end
