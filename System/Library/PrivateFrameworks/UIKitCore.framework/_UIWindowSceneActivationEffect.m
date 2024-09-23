@implementation _UIWindowSceneActivationEffect

- (_UIWindowSceneActivationEffect)initWithDescriptor:(id)a3
{
  id v5;
  _UIWindowSceneActivationEffect *v6;
  _UIWindowSceneActivationEffect *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIWindowSceneActivationEffect;
  v6 = -[_UIWindowSceneActivationEffect init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_descriptor, a3);

  return v7;
}

- (UITargetedPreview)handOffPreview
{
  void *v3;
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
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  UIPreviewTarget *v24;
  UIPreviewTarget *v25;
  void *v26;
  _OWORD v28[3];
  __int128 v29;
  __int128 v30;
  __int128 v31;

  -[_UIWindowSceneActivationEffect descriptor](self, "descriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "targetedPreview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = 0u;
  v31 = 0u;
  v29 = 0u;
  -[_UIWindowSceneActivationEffect platterView](self, "platterView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentationLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "affineTransform");
  }
  else
  {
    -[_UIWindowSceneActivationEffect platterView](self, "platterView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "affineTransform");
    }
    else
    {
      v30 = 0u;
      v31 = 0u;
      v29 = 0u;
    }

  }
  -[_UIWindowSceneActivationEffect platterContainer](self, "platterContainer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "target");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "center");
  v15 = v14;
  v17 = v16;
  objc_msgSend(v4, "target");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "container");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "convertPoint:fromView:", v19, v15, v17);
  v21 = v20;
  v23 = v22;

  v24 = [UIPreviewTarget alloc];
  v28[0] = v29;
  v28[1] = v30;
  v28[2] = v31;
  v25 = -[UIPreviewTarget initWithContainer:center:transform:](v24, "initWithContainer:center:transform:", v12, v28, v21, v23);
  objc_msgSend(v4, "retargetedPreviewWithTarget:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITargetedPreview *)v26;
}

- (void)begin
{
  void *v3;
  void *v4;
  _UIHighlightPlatterView *v5;
  void *v6;
  void *v7;
  UIView *v8;
  UIView *v9;
  UIView *platterContainer;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  id v28;

  -[_UIWindowSceneActivationEffect setState:](self, "setState:", 1);
  -[_UIWindowSceneActivationEffect descriptor](self, "descriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "targetedPreview");
  v28 = (id)objc_claimAutoreleasedReturnValue();

  -[_UIWindowSceneActivationEffect platterView](self, "platterView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = -[_UIHighlightPlatterView initWithTargetedPreview:]([_UIHighlightPlatterView alloc], "initWithTargetedPreview:", v28);
    -[_UIWindowSceneActivationEffect setPlatterView:](self, "setPlatterView:", v5);

  }
  objc_msgSend(v28, "target");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "container");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = [UIView alloc];
  objc_msgSend(v7, "bounds");
  v9 = -[UIView initWithFrame:](v8, "initWithFrame:");
  platterContainer = self->_platterContainer;
  self->_platterContainer = v9;

  -[_UIWindowSceneActivationEffect platterContainer](self, "platterContainer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIWindowSceneActivationEffect platterView](self, "platterView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v12);

  objc_msgSend(v28, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "superview");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIWindowSceneActivationEffect platterContainer](self, "platterContainer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14 == v7)
  {
    objc_msgSend(v28, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "insertSubview:aboveSubview:", v15, v16);

  }
  else
  {
    objc_msgSend(v7, "addSubview:", v15);
  }

  objc_msgSend(v28, "target");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "center");
  v19 = v18;
  v21 = v20;
  -[_UIWindowSceneActivationEffect platterContainer](self, "platterContainer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "convertPoint:toView:", v22, v19, v21);
  v24 = v23;
  v26 = v25;
  -[_UIWindowSceneActivationEffect platterView](self, "platterView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setCenter:", v24, v26);

}

- (void)advanceToScale:(double)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[5];
  _QWORD v14[6];

  +[_UIWindowSceneActivationSettingsDomain rootSettings](_UIWindowSceneActivationSettingsDomain, "rootSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pinchActivationScaleThreshold");
  v7 = v6 + -1.0;

  v8 = a3 + -1.0;
  if (a3 + -1.0 <= 0.0)
  {
    if (a3 + -1.0 < 0.0)
      v8 = -((1.0 - 1.0 / (v8 / v7 * -0.55 + 1.0)) * v7);
  }
  else
  {
    v8 = v7 * (1.0 - 1.0 / (v8 / v7 * 0.55 + 1.0));
  }
  v9 = v8 + 1.0;
  -[_UIWindowSceneActivationEffect _interactiveScaleBehavior](self, "_interactiveScaleBehavior");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __49___UIWindowSceneActivationEffect_advanceToScale___block_invoke;
  v14[3] = &unk_1E16B1888;
  v14[4] = self;
  *(double *)&v14[5] = v9;
  +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v10, 0, v14, 0);

  -[_UIWindowSceneActivationEffect _shadowBehavior](self, "_shadowBehavior");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v11;
  v13[1] = 3221225472;
  v13[2] = __49___UIWindowSceneActivationEffect_advanceToScale___block_invoke_2;
  v13[3] = &unk_1E16B1B28;
  v13[4] = self;
  +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v12, 0, v13, 0);

}

- (void)endExpanded:(BOOL)a3 withVelocity:(double)a4
{
  _BOOL4 v5;
  void *v7;
  uint64_t v8;
  void (**v9)(void *, uint64_t, _QWORD);
  void *v10;
  double v11;
  double v12;
  double v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  double v52;
  double v53;
  void *v54;
  double v55;
  double v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  _QWORD v61[4];
  id v62;
  uint64_t *v63;
  _QWORD v64[4];
  id v65;
  uint64_t *v66;
  double v67;
  double v68;
  double v69;
  __int128 v70;
  __int128 v71;
  double v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint64_t v77;
  double v78;
  _QWORD aBlock[6];
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  int v83;

  v5 = a3;
  -[_UIWindowSceneActivationEffect setState:](self, "setState:", 0);
  -[_UIWindowSceneActivationEffect platterView](self, "platterView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = 0;
  v81 = &v80;
  v82 = 0x2020000000;
  v83 = 0;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __59___UIWindowSceneActivationEffect_endExpanded_withVelocity___block_invoke;
  aBlock[3] = &unk_1E16EAE78;
  aBlock[4] = self;
  aBlock[5] = &v80;
  v9 = (void (**)(void *, uint64_t, _QWORD))_Block_copy(aBlock);
  if (+[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"))
  {
    +[_UIWindowSceneActivationSettingsDomain rootSettings](_UIWindowSceneActivationSettingsDomain, "rootSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pinchEndingProjectionDuration");
    v12 = v11 * a4;

    v13 = fabs(v12);
    v14 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 24);
    v70 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 8);
    v71 = v14;
    v15 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
    v75 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
    v76 = v15;
    v77 = *(_QWORD *)(MEMORY[0x1E0CD2610] + 112);
    v16 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
    v74 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
    v73 = v16;
    v17 = *(double *)(MEMORY[0x1E0CD2610] + 120);
    if (v12 < 0.0)
      v17 = NAN;
    v69 = v13;
    v72 = v13;
    v78 = v17;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v69);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_setVelocity:forKey:", v18, CFSTR("transform"));

    -[_UIWindowSceneActivationEffect descriptor](self, "descriptor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "targetedPreview");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "target");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "center");
    v23 = v22;
    v25 = v24;

    if (v5)
    {
      objc_msgSend(v7, "window");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "screen");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v27, "coordinateSpace");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "bounds");
      v30 = v29;
      v32 = v31;
      v34 = v33;
      v36 = v35;
      objc_msgSend(v7, "superview");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "convertPoint:toCoordinateSpace:", v37, v30 + v34 * 0.5, v32 + v36 * 0.5);
      v23 = v38;
      v25 = v39;
    }
    else
    {
      if (!objc_msgSend(v20, "_sourceViewIsInViewHierarchy"))
      {
LABEL_10:
        objc_msgSend(v7, "center");
        v48 = v47;
        v50 = v49;
        +[_UIWindowSceneActivationSettingsDomain rootSettings](_UIWindowSceneActivationSettingsDomain, "rootSettings");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "pinchEndPlatterVelocityMultiplier");
        v53 = v52;

        +[_UIWindowSceneActivationSettingsDomain rootSettings](_UIWindowSceneActivationSettingsDomain, "rootSettings");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "pinchEndPlatterVelocityMultiplier");
        v56 = (v25 - v50) * v55;

        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", (v23 - v48) * v53, v56);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "_setVelocity:forKey:", v57, CFSTR("position"));

        -[_UIWindowSceneActivationEffect _settlingBehavior](self, "_settlingBehavior");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v64[0] = v8;
        v64[1] = 3221225472;
        v64[2] = __59___UIWindowSceneActivationEffect_endExpanded_withVelocity___block_invoke_2;
        v64[3] = &unk_1E16C6D18;
        v66 = &v80;
        v59 = v7;
        v65 = v59;
        v67 = v23;
        v68 = v25;
        +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v58, 0, v64, v9);

        -[_UIWindowSceneActivationEffect _shadowBehavior](self, "_shadowBehavior");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61[0] = v8;
        v61[1] = 3221225472;
        v61[2] = __59___UIWindowSceneActivationEffect_endExpanded_withVelocity___block_invoke_3;
        v61[3] = &unk_1E16BACE0;
        v63 = &v80;
        v62 = v59;
        +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v60, 0, v61, v9);

        goto LABEL_11;
      }
      objc_msgSend(v20, "view");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "superview");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "view");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "center");
      v41 = v40;
      v43 = v42;
      objc_msgSend(v7, "superview");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "convertPoint:toView:", v44, v41, v43);
      v23 = v45;
      v25 = v46;

    }
    goto LABEL_10;
  }
  *((_DWORD *)v81 + 6) = 1;
  v9[2](v9, 1, 0);
LABEL_11:

  _Block_object_dispose(&v80, 8);
}

- (id)_interactiveScaleBehavior
{
  void *v2;
  void *v3;
  void *v4;

  +[_UIWindowSceneActivationSettingsDomain rootSettings](_UIWindowSceneActivationSettingsDomain, "rootSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pinchInteractiveScale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "springAnimationBehavior");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_settlingBehavior
{
  void *v2;
  void *v3;
  void *v4;

  +[_UIWindowSceneActivationSettingsDomain rootSettings](_UIWindowSceneActivationSettingsDomain, "rootSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pinchSettle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "springAnimationBehavior");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_shadowBehavior
{
  void *v2;
  void *v3;
  void *v4;

  +[_UIWindowSceneActivationSettingsDomain rootSettings](_UIWindowSceneActivationSettingsDomain, "rootSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pinchShadow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "springAnimationBehavior");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setDescriptor:(id)a3 andKey:(id)a4
{
  objc_storeStrong((id *)&self->_descriptor, a3);
}

- (id)previewForContinuingToEffectWithPreview:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UIPreviewTarget *v9;
  void *v10;
  UIPreviewTarget *v11;
  void *v12;
  void *v13;
  UITargetedPreview *v14;
  _OWORD v16[3];
  __int128 v17;
  __int128 v18;
  __int128 v19;

  -[_UIWindowSceneActivationEffect platterView](self, "platterView", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v17 = 0u;
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentationLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "affineTransform");
  }
  else
  {
    objc_msgSend(v3, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "affineTransform");
    }
    else
    {
      v18 = 0u;
      v19 = 0u;
      v17 = 0u;
    }

  }
  v9 = [UIPreviewTarget alloc];
  objc_msgSend(v3, "superview");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "center");
  v16[0] = v17;
  v16[1] = v18;
  v16[2] = v19;
  v11 = -[UIPreviewTarget initWithContainer:center:transform:](v9, "initWithContainer:center:transform:", v10, v16);

  v12 = (void *)objc_opt_new();
  +[UIColor clearColor](UIColor, "clearColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBackgroundColor:", v13);

  v14 = -[UITargetedPreview initWithView:parameters:target:]([UITargetedPreview alloc], "initWithView:parameters:target:", v3, v12, v11);
  return v14;
}

- (void)addCompletion:(id)a3
{
  id v4;
  NSMutableArray *completions;
  NSMutableArray *v6;
  NSMutableArray *v7;
  void *v8;
  void *aBlock;

  v4 = a3;
  completions = self->_completions;
  aBlock = v4;
  if (!completions)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_completions;
    self->_completions = v6;

    v4 = aBlock;
    completions = self->_completions;
  }
  v8 = _Block_copy(v4);
  -[NSMutableArray addObject:](completions, "addObject:", v8);

}

- (void)_performAllCompletionBlocks
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[_UIWindowSceneActivationEffect completions](self, "completions", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++) + 16))();
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (_UIContentEffectDescriptor)descriptor
{
  return self->_descriptor;
}

- (UIView)platterContainer
{
  return self->_platterContainer;
}

- (NSMutableArray)completions
{
  return self->_completions;
}

- (_UIHighlightPlatterView)platterView
{
  return self->_platterView;
}

- (void)setPlatterView:(id)a3
{
  objc_storeStrong((id *)&self->_platterView, a3);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (double)currentScale
{
  return self->_currentScale;
}

- (void)setCurrentScale:(double)a3
{
  self->_currentScale = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_storeStrong((id *)&self->_completions, 0);
  objc_storeStrong((id *)&self->_platterContainer, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
}

@end
