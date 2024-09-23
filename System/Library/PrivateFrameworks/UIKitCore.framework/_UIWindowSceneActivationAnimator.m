@implementation _UIWindowSceneActivationAnimator

- (_UIWindowSceneActivationAnimator)initWithConfiguration:(id)a3
{
  id v4;
  _UIWindowSceneActivationAnimator *v5;
  _UIWindowSceneActivationAnimator *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIWindowSceneActivationAnimator;
  v5 = -[_UIWindowSceneActivationAnimator init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[_UIWindowSceneActivationAnimator setConfiguration:](v5, "setConfiguration:", v4);

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[_UIWindowSceneActivationAnimator setIsDeallocating:](self, "setIsDeallocating:", 1);
  -[_UIWindowSceneActivationAnimator cancel](self, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)_UIWindowSceneActivationAnimator;
  -[_UIWindowSceneActivationAnimator dealloc](&v3, sel_dealloc);
}

- (void)prewarmWithCompletion:(id)a3
{
  id v4;
  UIView *v5;
  UIView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UIView *v11;
  void *v12;
  UIView *v13;
  void *v14;
  void *v15;
  UIView *v16;
  _UIPortalView *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
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
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  unsigned int v45;
  void *v46;
  void *v47;
  unsigned int v48;
  void *v49;
  _QWORD v50[4];
  id v51;
  id v52;
  id location;
  _QWORD v54[3];

  v54[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_UIWindowSceneActivationAnimator _sourceViewContainer](self, "_sourceViewContainer");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [UIView alloc];
  objc_msgSend(v49, "bounds");
  v6 = -[UIView initWithFrame:](v5, "initWithFrame:");
  -[UIView setAutoresizesSubviews:](v6, "setAutoresizesSubviews:", 1);
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2E78]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView layer](v6, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFilters:", v8);

  -[UIView layer](v6, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:forKeyPath:", &unk_1E1A95B40, CFSTR("filters.opacityPair.inputAmount"));

  -[_UIWindowSceneActivationAnimator setDeparentingWrapper:](self, "setDeparentingWrapper:", v6);
  v11 = [UIView alloc];
  -[_UIWindowSceneActivationAnimator deparentingWrapper](self, "deparentingWrapper");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  v13 = -[UIView initWithFrame:](v11, "initWithFrame:");

  -[UIView setAutoresizingMask:](v13, "setAutoresizingMask:", 18);
  -[_UIWindowSceneActivationAnimator deparentingWrapper](self, "deparentingWrapper");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSubview:", v13);

  -[_UIWindowSceneActivationAnimator setMorphContainerView:](self, "setMorphContainerView:", v13);
  -[_UIWindowSceneActivationAnimator deparentingWrapper](self, "deparentingWrapper");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "addSubview:", v15);

  v16 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", 0.0, 0.0, 1.0, 1.0);
  -[UIView setUserInteractionEnabled:](v16, "setUserInteractionEnabled:", 0);
  -[UIView setAlpha:](v16, "setAlpha:", 0.0);
  objc_msgSend(v49, "addSubview:", v16);
  -[_UIWindowSceneActivationAnimator setDeparentingPortalAlphaSourceView:](self, "setDeparentingPortalAlphaSourceView:", v16);

  v17 = -[_UIPortalView initWithFrame:]([_UIPortalView alloc], "initWithFrame:", 0.0, 0.0, 1.0, 1.0);
  +[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](v17, "setBackgroundColor:", v18);

  -[_UIPortalView setName:](v17, "setName:", CFSTR("_UIWindowSceneActivation.scene"));
  -[_UIPortalView setAllowsHitTesting:](v17, "setAllowsHitTesting:", 1);
  -[_UIPortalView setHidesSourceView:](v17, "setHidesSourceView:", 1);
  -[_UIWindowSceneActivationAnimator setIncomingScenePortalView:](self, "setIncomingScenePortalView:", v17);

  -[_UIWindowSceneActivationAnimator configuration](self, "configuration");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "options");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = objc_msgSend(v20, "_effectivelyWantsProminence");
  v48 = objc_msgSend(v20, "_effectivelyWantsFullscreen");
  objc_msgSend(v20, "requestingScene");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "session");
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (v47)
  {
    objc_msgSend(v47, "persistentIdentifier");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v46 = 0;
  }
  objc_msgSend(v49, "_window");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v48)
    v23 = _UISheetSize(v22, 0, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  else
    v23 = _UISheetSize(v22, 1, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v25 = v23;
  v26 = v24;

  objc_msgSend(v49, "_window");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "screen");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v28, "bounds");
  v30 = v29;
  v32 = v31;
  v34 = v33;
  v36 = v35;
  objc_msgSend(v28, "coordinateSpace");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "fixedCoordinateSpace");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "convertRect:toCoordinateSpace:", v38, round(v30 + v34 * 0.5 - v25 * 0.5), round(v32 + v36 * 0.5 - v26 * 0.5), v25, v26);
  -[_UIWindowSceneActivationAnimator setExpectedFrame:](self, "setExpectedFrame:");

  -[_UIWindowSceneActivationAnimator setExpectedCornerRadii:](self, "setExpectedCornerRadii:", 10.0, 10.0, 10.0, 10.0);
  objc_msgSend(v20, "_interactionIdentifier");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v39)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "UUIDString");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "_setInteractionIdentifier:", v39);
  }
  objc_initWeak(&location, self);
  -[_UIWindowSceneActivationAnimator morphContainerView](self, "morphContainerView");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIWindowSceneActivationAnimator deparentingPortalAlphaSourceView](self, "deparentingPortalAlphaSourceView");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __58___UIWindowSceneActivationAnimator_prewarmWithCompletion___block_invoke;
  v50[3] = &unk_1E16D7360;
  objc_copyWeak(&v52, &location);
  v43 = v4;
  v51 = v43;
  +[_UIWindowSceneActivationPrewarmAction actionWithMorphContainer:alphaSource:sourceIdentifier:interactionIdentifier:requestCenterSlot:requestFullscreen:responseHandler:](_UIWindowSceneActivationPrewarmAction, "actionWithMorphContainer:alphaSource:sourceIdentifier:interactionIdentifier:requestCenterSlot:requestFullscreen:responseHandler:", v41, v42, v46, v39, v45, v48, v50);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIWindowSceneActivationAnimator _sendBSAction:](self, "_sendBSAction:", v44);
  objc_destroyWeak(&v52);
  objc_destroyWeak(&location);

}

- (BOOL)animateWithSourcePreview:(id)a3 velocity:(double)a4
{
  id v6;
  int64_t v7;
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
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
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
  double v57;
  double v58;
  double v59;
  double v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  __int128 v66;
  id v67;
  int64_t v69;
  _QWORD v70[5];
  _QWORD v71[4];
  id v72;
  _UIWindowSceneActivationAnimator *v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _QWORD v83[4];
  double v84[2];
  _OWORD v85[3];
  __int128 v86;
  __int128 v87;
  __int128 v88;
  CGRect v89;

  v6 = a3;
  v7 = -[_UIWindowSceneActivationAnimator state](self, "state");
  if (v7 == 2)
  {
    -[_UIWindowSceneActivationAnimator cancel](self, "cancel");
  }
  else
  {
    objc_msgSend(v6, "target");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "container");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIWindowSceneActivationAnimator morphContainerView](self, "morphContainerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIWindowSceneActivationAnimator incomingSceneAnchorAnimation](self, "incomingSceneAnchorAnimation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addAnimation:forKey:", v12, CFSTR("_UIWindowSceneActivationAnimator.incomingScene.matchPosition"));

    objc_msgSend(v10, "window");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIWindowSceneActivationAnimator expectedFrame](self, "expectedFrame");
    objc_msgSend(v13, "_convertRectFromSceneReferenceSpace:");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;

    objc_msgSend(v10, "superview");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "window");
    v23 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "convertRect:fromView:", v23, v15, v17, v19, v21);
    objc_msgSend(v10, "setFrame:");

    -[_UIWindowSceneActivationAnimator deparentingWrapper](self, "deparentingWrapper");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v23) = objc_msgSend(v9, "isDescendantOfView:", v24);

    if ((v23 & 1) == 0)
    {
      objc_msgSend(v6, "view");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "superview");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      -[_UIWindowSceneActivationAnimator deparentingWrapper](self, "deparentingWrapper");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26 == v9)
      {
        objc_msgSend(v6, "view");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "insertSubview:aboveSubview:", v27, v28);

      }
      else
      {
        objc_msgSend(v9, "addSubview:", v27);
      }

    }
    v29 = (void *)objc_opt_new();
    objc_msgSend(v29, "setAllowsUserInteractionInExpandedPreview:", 1);
    -[_UIWindowSceneActivationAnimator expectedCornerRadii](self, "expectedCornerRadii");
    objc_msgSend(v29, "setOverrideExpandedCornerRadius:");
    -[_UIWindowSceneActivationAnimator _startingShadowIntensity](self, "_startingShadowIntensity");
    objc_msgSend(v29, "setCollapsedShadowIntensity:");
    objc_msgSend(v29, "setAllowsElasticMorph:", 1);
    objc_msgSend(v29, "setPreferredMorphingAxis:", 1);
    objc_msgSend(v29, "setHidesCollapsedSourceView:", 0);
    objc_msgSend(v29, "setCollapsedPreview:", v6);
    -[_UIWindowSceneActivationAnimator _previewForIncomingScenePortal](self, "_previewForIncomingScenePortal");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setExpandedPreview:", v30);

    objc_msgSend(v29, "setCollapsedShadowStyle:", -[_UIWindowSceneActivationAnimator _preferredCollapsedShadowStyle](self, "_preferredCollapsedShadowStyle"));
    objc_msgSend(v29, "setExpandedShadowStyle:", 3);
    objc_msgSend(v10, "addSubview:", v29);
    objc_msgSend(v8, "center");
    v32 = v31;
    v34 = v33;
    objc_msgSend(v6, "size");
    v36 = v35;
    v38 = v37;
    objc_msgSend(v29, "superview");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "convertRect:toView:", v39, 0.0, 0.0, v36, v38);
    objc_msgSend(v29, "setFrame:");

    objc_msgSend(v29, "superview");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "convertPoint:toView:", v40, v32, v34);
    v42 = v41;
    v44 = v43;

    if (-[UIView _subviewsNeedAxisFlipping](v9))
    {
      objc_msgSend(v29, "superview");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "bounds");
      v42 = CGRectGetWidth(v89) - v42;

    }
    objc_msgSend(v29, "setCenter:", v42, v44);
    v69 = v7;
    if (v8)
    {
      objc_msgSend(v8, "transform");
    }
    else
    {
      v87 = 0u;
      v88 = 0u;
      v86 = 0u;
    }
    v85[0] = v86;
    v85[1] = v87;
    v85[2] = v88;
    objc_msgSend(v29, "setTransform:", v85);
    objc_msgSend(v29, "setNeedsLayout");
    objc_msgSend(v29, "layoutIfNeeded");
    objc_msgSend(v10, "bounds");
    v47 = v46;
    v49 = v48;
    v51 = v50;
    v53 = v52;
    v54 = v46 + v50 * 0.5;
    v55 = v48 + v52 * 0.5;
    if (fabs(a4) >= 2.22044605e-16)
    {
      +[_UIWindowSceneActivationSettingsDomain rootSettings](_UIWindowSceneActivationSettingsDomain, "rootSettings");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "pinchEndPlatterVelocityMultiplier");
      v58 = v57;

      objc_msgSend(v29, "center");
      v84[0] = v58 * (v54 - v59);
      v84[1] = v58 * (v55 - v60);
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v84, "{CGPoint=dd}");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "_setVelocity:forKey:", v61, CFSTR("position"));

      v83[0] = 0;
      v83[1] = 0;
      *(double *)&v83[2] = v58 * a4;
      *(double *)&v83[3] = v58 * a4;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v83, "{CGRect={CGPoint=dd}{CGSize=dd}}");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "_setVelocity:forKey:", v62, CFSTR("bounds"));

    }
    +[_UIWindowSceneActivationSettingsDomain rootSettings](_UIWindowSceneActivationSettingsDomain, "rootSettings");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "morph");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "springAnimationBehavior");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v71[0] = MEMORY[0x1E0C809B0];
    v71[1] = 3221225472;
    v71[2] = __70___UIWindowSceneActivationAnimator_animateWithSourcePreview_velocity___block_invoke;
    v71[3] = &unk_1E16D7388;
    v74 = v54;
    v75 = v55;
    v76 = v47;
    v77 = v49;
    v78 = v51;
    v79 = v53;
    v66 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v80 = *MEMORY[0x1E0C9BAA8];
    v81 = v66;
    v82 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v72 = v29;
    v73 = self;
    v70[0] = MEMORY[0x1E0C809B0];
    v70[1] = 3221225472;
    v70[2] = __70___UIWindowSceneActivationAnimator_animateWithSourcePreview_velocity___block_invoke_2;
    v70[3] = &unk_1E16B2588;
    v70[4] = self;
    v67 = v29;
    +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v65, 0, v71, v70);

    -[_UIWindowSceneActivationAnimator deparent](self, "deparent");
    v7 = v69;
  }

  return v7 != 2;
}

- (void)deparent
{
  -[_UIWindowSceneActivationAnimator setDeparented:](self, "setDeparented:", 1);
}

- (void)reparent
{
  -[_UIWindowSceneActivationAnimator setDeparented:](self, "setDeparented:", 0);
}

- (void)cancel
{
  int64_t v3;
  int64_t v4;

  v3 = -[_UIWindowSceneActivationAnimator state](self, "state");
  if ((unint64_t)(v3 - 1) <= 1)
  {
    v4 = v3;
    -[_UIWindowSceneActivationAnimator setState:](self, "setState:", 3);
    -[_UIWindowSceneActivationAnimator reparent](self, "reparent");
    if (v4 == 1)
      -[_UIWindowSceneActivationAnimator _sendCompletionActionCallingAlongsideCompletions:](self, "_sendCompletionActionCallingAlongsideCompletions:", 0);
    else
      -[_UIWindowSceneActivationAnimator _cleanUp](self, "_cleanUp");
  }
}

- (void)addAnimations:(id)a3
{
  id v4;
  NSMutableArray *alongsideAnimations;
  NSMutableArray *v6;
  NSMutableArray *v7;
  void *v8;
  void *aBlock;

  v4 = a3;
  alongsideAnimations = self->_alongsideAnimations;
  aBlock = v4;
  if (!alongsideAnimations)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_alongsideAnimations;
    self->_alongsideAnimations = v6;

    v4 = aBlock;
    alongsideAnimations = self->_alongsideAnimations;
  }
  v8 = _Block_copy(v4);
  -[NSMutableArray addObject:](alongsideAnimations, "addObject:", v8);

}

- (void)addCompletion:(id)a3
{
  id v4;
  NSMutableArray *alongsideCompletions;
  NSMutableArray *v6;
  NSMutableArray *v7;
  void *v8;
  void *aBlock;

  v4 = a3;
  alongsideCompletions = self->_alongsideCompletions;
  aBlock = v4;
  if (!alongsideCompletions)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_alongsideCompletions;
    self->_alongsideCompletions = v6;

    v4 = aBlock;
    alongsideCompletions = self->_alongsideCompletions;
  }
  v8 = _Block_copy(v4);
  -[NSMutableArray addObject:](alongsideCompletions, "addObject:", v8);

}

- (void)setDeparented:(BOOL)a3
{
  void *v4;
  _QWORD v5[5];

  if (self->_deparented != a3)
  {
    self->_deparented = a3;
    +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:response:](UIViewSpringAnimationBehavior, "behaviorWithDampingRatio:response:", 1.0, 0.2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __50___UIWindowSceneActivationAnimator_setDeparented___block_invoke;
    v5[3] = &unk_1E16B1B28;
    v5[4] = self;
    +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v4, 0, v5, 0);

  }
}

- (id)_sourceViewContainer
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[_UIWindowSceneActivationAnimator configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "target");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "container");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_previewForIncomingScenePortal
{
  UIPreviewTarget *v3;
  void *v4;
  UIPreviewTarget *v5;
  void *v6;
  void *v7;
  void *v8;
  UITargetedPreview *v9;
  void *v10;
  UITargetedPreview *v11;

  v3 = [UIPreviewTarget alloc];
  -[_UIWindowSceneActivationAnimator _sourceViewContainer](self, "_sourceViewContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[UIPreviewTarget initWithContainer:center:](v3, "initWithContainer:center:", v4, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));

  v6 = (void *)objc_opt_new();
  -[_UIWindowSceneActivationAnimator incomingScenePortalView](self, "incomingScenePortalView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "backgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v8);

  v9 = [UITargetedPreview alloc];
  -[_UIWindowSceneActivationAnimator incomingScenePortalView](self, "incomingScenePortalView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[UITargetedPreview initWithView:parameters:target:](v9, "initWithView:parameters:target:", v10, v6, v5);

  return v11;
}

- (void)_sendCompletionActionCallingAlongsideCompletions:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  _UIWindowSceneActivationAnimator *v14;
  uint64_t v15;

  v3 = a3;
  -[_UIWindowSceneActivationAnimator setState:](self, "setState:", 3);
  -[_UIWindowSceneActivationAnimator configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "options");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_interactionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[_UIWindowSceneActivationAnimator isDeallocating](self, "isDeallocating"))
  {
    -[_UIWindowSceneActivationAnimator _cleanUp](self, "_cleanUp");
    if (v3)
      -[_UIWindowSceneActivationAnimator _performAllAlongsideCompletions](self, "_performAllAlongsideCompletions");
    v8 = (uint64_t *)&__block_literal_global_356;
  }
  else
  {
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __85___UIWindowSceneActivationAnimator__sendCompletionActionCallingAlongsideCompletions___block_invoke_2;
    v13 = &unk_1E16D73B0;
    v14 = self;
    LOBYTE(v15) = v3;
    v8 = &v10;
  }
  +[_UIWindowSceneActivationCleanupAction actionWithInteractionIdentifier:responseHandler:](_UIWindowSceneActivationCleanupAction, "actionWithInteractionIdentifier:responseHandler:", v7, v8, v10, v11, v12, v13, v14, v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIWindowSceneActivationAnimator _sendBSAction:](self, "_sendBSAction:", v9);

}

- (void)_cleanUp
{
  void *v3;
  void *v4;
  void *v5;

  -[_UIWindowSceneActivationAnimator deparentingWrapper](self, "deparentingWrapper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_UIWindowSceneActivationAnimator deparentingWrapper](self, "deparentingWrapper");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

    -[_UIWindowSceneActivationAnimator setDeparentingWrapper:](self, "setDeparentingWrapper:", 0);
    -[_UIWindowSceneActivationAnimator setMorphContainerView:](self, "setMorphContainerView:", 0);
    -[_UIWindowSceneActivationAnimator setIncomingScenePortalView:](self, "setIncomingScenePortalView:", 0);
    -[_UIWindowSceneActivationAnimator deparentingPortalAlphaSourceView](self, "deparentingPortalAlphaSourceView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFromSuperview");

    -[_UIWindowSceneActivationAnimator setDeparentingPortalAlphaSourceView:](self, "setDeparentingPortalAlphaSourceView:", 0);
    -[_UIWindowSceneActivationAnimator setState:](self, "setState:", 4);
  }
}

- (void)_performAllAlongsideAnimations:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *alongsideAnimations;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[_UIWindowSceneActivationAnimator alongsideAnimations](self, "alongsideAnimations", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9++) + 16))();
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  alongsideAnimations = self->_alongsideAnimations;
  self->_alongsideAnimations = 0;

}

- (void)_performAllAlongsideCompletions
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSMutableArray *alongsideCompletions;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[_UIWindowSceneActivationAnimator alongsideCompletions](self, "alongsideCompletions", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7++) + 16))();
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  alongsideCompletions = self->_alongsideCompletions;
  self->_alongsideCompletions = 0;

}

- (void)_sendBSAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[_UIWindowSceneActivationAnimator _sourceViewContainer](self, "_sourceViewContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_FBSScene");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "sendActions:", v8);
}

- (double)_startingShadowIntensity
{
  void *v2;
  uint64_t v3;
  double result;
  void *v5;
  double v6;
  double v7;

  -[_UIWindowSceneActivationAnimator configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_animationSource");

  if (v3 == 2)
  {
    +[_UIWindowSceneActivationSettingsDomain rootSettings](_UIWindowSceneActivationSettingsDomain, "rootSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pinchPlatterMaxShadowIntensity");
    v7 = v6;

    return v7;
  }
  else
  {
    result = 0.0;
    if (v3 == 1)
      return 1.0;
  }
  return result;
}

- (int64_t)_preferredCollapsedShadowStyle
{
  void *v2;
  uint64_t v3;

  -[_UIWindowSceneActivationAnimator configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_animationSource");

  if (v3 == 2)
    return 1;
  else
    return 2 * (v3 == 1);
}

- (UIWindowSceneActivationConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (_UIPortalView)incomingScenePortalView
{
  return self->_incomingScenePortalView;
}

- (void)setIncomingScenePortalView:(id)a3
{
  objc_storeStrong((id *)&self->_incomingScenePortalView, a3);
}

- (UIView)morphContainerView
{
  return self->_morphContainerView;
}

- (void)setMorphContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_morphContainerView, a3);
}

- (UIView)deparentingWrapper
{
  return self->_deparentingWrapper;
}

- (void)setDeparentingWrapper:(id)a3
{
  objc_storeStrong((id *)&self->_deparentingWrapper, a3);
}

- (UIView)deparentingPortalAlphaSourceView
{
  return self->_deparentingPortalAlphaSourceView;
}

- (void)setDeparentingPortalAlphaSourceView:(id)a3
{
  objc_storeStrong((id *)&self->_deparentingPortalAlphaSourceView, a3);
}

- (CGRect)expectedFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_expectedFrame.origin.x;
  y = self->_expectedFrame.origin.y;
  width = self->_expectedFrame.size.width;
  height = self->_expectedFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setExpectedFrame:(CGRect)a3
{
  self->_expectedFrame = a3;
}

- (UIRectCornerRadii)expectedCornerRadii
{
  double topLeft;
  double bottomLeft;
  double bottomRight;
  double topRight;
  UIRectCornerRadii result;

  topLeft = self->_expectedCornerRadii.topLeft;
  bottomLeft = self->_expectedCornerRadii.bottomLeft;
  bottomRight = self->_expectedCornerRadii.bottomRight;
  topRight = self->_expectedCornerRadii.topRight;
  result.topRight = topRight;
  result.bottomRight = bottomRight;
  result.bottomLeft = bottomLeft;
  result.topLeft = topLeft;
  return result;
}

- (void)setExpectedCornerRadii:(UIRectCornerRadii)a3
{
  self->_expectedCornerRadii = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSMutableArray)alongsideAnimations
{
  return self->_alongsideAnimations;
}

- (NSMutableArray)alongsideCompletions
{
  return self->_alongsideCompletions;
}

- (CAMatchMoveAnimation)incomingSceneAnchorAnimation
{
  return self->_incomingSceneAnchorAnimation;
}

- (void)setIncomingSceneAnchorAnimation:(id)a3
{
  objc_storeStrong((id *)&self->_incomingSceneAnchorAnimation, a3);
}

- (BOOL)deparented
{
  return self->_deparented;
}

- (BOOL)isDeallocating
{
  return self->_isDeallocating;
}

- (void)setIsDeallocating:(BOOL)a3
{
  self->_isDeallocating = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_incomingSceneAnchorAnimation, 0);
  objc_storeStrong((id *)&self->_alongsideCompletions, 0);
  objc_storeStrong((id *)&self->_alongsideAnimations, 0);
  objc_storeStrong((id *)&self->_deparentingPortalAlphaSourceView, 0);
  objc_storeStrong((id *)&self->_deparentingWrapper, 0);
  objc_storeStrong((id *)&self->_morphContainerView, 0);
  objc_storeStrong((id *)&self->_incomingScenePortalView, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
