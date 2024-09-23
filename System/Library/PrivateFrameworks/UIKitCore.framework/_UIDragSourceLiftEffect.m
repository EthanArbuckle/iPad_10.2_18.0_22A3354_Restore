@implementation _UIDragSourceLiftEffect

- (_UIDragSourceLiftEffect)init
{
  _UIDragSourceLiftEffect *v2;
  uint64_t v3;
  NSMapTable *liftOperationByContext;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIDragSourceLiftEffect;
  v2 = -[_UIDragSourceLiftEffect init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    liftOperationByContext = v2->_liftOperationByContext;
    v2->_liftOperationByContext = (NSMapTable *)v3;

    v2->_scrollCancelling = 0;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_liftOperationByContext, 0);
}

- (UITimingCurveProvider)liftTimingParameters
{
  return (UITimingCurveProvider *)+[_UIDragLiftEffectOperation defaultTimingParameters](_UIDragLiftEffectOperation, "defaultTimingParameters");
}

- (double)liftAnimationDuration
{
  return 0.0;
}

- (id)existingOperationForContext:(id)a3
{
  return -[NSMapTable objectForKey:](self->_liftOperationByContext, "objectForKey:", a3);
}

- (void)_addworkaroundForPropertyAnimator:(id)a3 inView:(id)a4
{
  id v5;
  id v6;
  UIView *v7;
  uint64_t v8;
  UIView *v9;
  UIView *v10;
  _QWORD v11[4];
  UIView *v12;
  _QWORD v13[4];
  UIView *v14;

  v5 = a4;
  v6 = a3;
  v7 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", -500.0, -500.0, 0.0, 0.0);
  -[UIView setUserInteractionEnabled:](v7, "setUserInteractionEnabled:", 0);
  -[UIView setAlpha:](v7, "setAlpha:", 0.0);
  objc_msgSend(v5, "addSubview:", v7);

  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __68___UIDragSourceLiftEffect__addworkaroundForPropertyAnimator_inView___block_invoke;
  v13[3] = &unk_1E16B1B28;
  v9 = v7;
  v14 = v9;
  objc_msgSend(v6, "addAnimations:", v13);
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __68___UIDragSourceLiftEffect__addworkaroundForPropertyAnimator_inView___block_invoke_3;
  v11[3] = &unk_1E16B42D0;
  v12 = v9;
  v10 = v9;
  objc_msgSend(v6, "addCompletion:", v11);

}

- (void)interaction:(id)a3 didChangeWithContext:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  _UIDragLiftEffectOperation *v9;
  _UIDragLiftEffectOperation *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _UIDragSourceLiftEffect *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  int v25;
  _QWORD v26[4];
  id v27;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "state");
  -[NSMapTable objectForKey:](self->_liftOperationByContext, "objectForKey:", v7);
  v9 = (_UIDragLiftEffectOperation *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    if (!v8)
    {
      v9 = 0;
      goto LABEL_16;
    }
    v10 = [_UIDragLiftEffectOperation alloc];
    -[_UIDragSourceLiftEffect liftAnimationDuration](self, "liftAnimationDuration");
    v12 = v11;
    -[_UIDragSourceLiftEffect liftTimingParameters](self, "liftTimingParameters");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[_UIDragLiftEffectOperation initWithLiftAnimationDuration:liftTimingParameters:](v10, "initWithLiftAnimationDuration:liftTimingParameters:", v13, v12);

    -[_UIDragLiftEffectOperation setContext:](v9, "setContext:", v7);
    -[_UIDragLiftEffectOperation setInteraction:](v9, "setInteraction:", v6);
    -[_UIDragLiftEffectOperation propertyAnimator](v9, "propertyAnimator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __60___UIDragSourceLiftEffect_interaction_didChangeWithContext___block_invoke;
    v26[3] = &unk_1E16B1B28;
    v15 = v7;
    v27 = v15;
    objc_msgSend(v14, "addAnimations:", v26);

    -[_UIDragLiftEffectOperation propertyAnimator](v9, "propertyAnimator");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "completion");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addCompletion:", v17);

    -[_UIDragLiftEffectOperation propertyAnimator](v9, "propertyAnimator");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_window");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIDragSourceLiftEffect _addworkaroundForPropertyAnimator:inView:](self, "_addworkaroundForPropertyAnimator:inView:", v18, v20);

    -[NSMapTable setObject:forKey:](self->_liftOperationByContext, "setObject:forKey:", v9, v15);
  }
  switch(v8)
  {
    case 2:
      -[_UIDragSourceLiftEffect _uninstallInteractionPlattersForOperation:](self, "_uninstallInteractionPlattersForOperation:", v9);
      -[_UIDragLiftEffectOperation propertyAnimator](v9, "propertyAnimator");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v23, "state"))
      {
        objc_msgSend(v23, "setPausesOnCompletion:", 0);
        objc_msgSend(v23, "stopAnimation:", 0);
        objc_msgSend(v23, "finishAnimationAtPosition:", 0);
      }

      break;
    case 1:
      -[_UIDragLiftEffectOperation context](v9, "context");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "shouldAnimateLift");

      if (v25)
        -[_UIDragSourceLiftEffect _installInteractionPlattersForOperation:](self, "_installInteractionPlattersForOperation:", v9);
      v21 = self;
      v22 = 1;
      goto LABEL_14;
    case 0:
      v21 = self;
      v22 = 0;
LABEL_14:
      -[_UIDragSourceLiftEffect _setInteractionEffectsLifted:withOperation:](v21, "_setInteractionEffectsLifted:withOperation:", v22, v9);
      break;
  }
LABEL_16:

}

- (void)_installInteractionPlattersForOperation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _UIPlatterView *v20;
  void *v21;
  uint64_t v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  __int128 v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  id v43;
  _UIDragSourceLiftEffect *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  id obj;
  void *v51;
  _QWORD v52[5];
  id v53;
  _QWORD v54[4];
  id v55;
  _OWORD v56[3];
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v44 = self;
    v48 = (void *)objc_opt_new();
    v6 = (void *)objc_opt_new();
    v45 = v4;
    objc_msgSend(v4, "context");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "items");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    obj = v8;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v58;
      v46 = *(_QWORD *)v58;
      v47 = v6;
      do
      {
        v13 = 0;
        v49 = v10;
        do
        {
          if (*(_QWORD *)v58 != v12)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * v13), "_targetedLiftPreview");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "view");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15 && (objc_msgSend(v6, "containsObject:", v15) & 1) == 0)
          {
            objc_msgSend(v6, "addObject:", v15);
            objc_msgSend(v15, "window");
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v16)
            {
              objc_msgSend(v14, "target");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "container");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "addSubview:", v15);

            }
            objc_msgSend(v14, "_duiPreview");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = -[_UIPlatterView initWithDUIPreview:imageComponent:]([_UIPlatterView alloc], "initWithDUIPreview:imageComponent:", v19, 0);
            -[UIView setUserInteractionEnabled:](v20, "setUserInteractionEnabled:", 0);
            -[_UIPlatterView setSourceView:](v20, "setSourceView:", v15);
            objc_msgSend(v14, "parameters");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "_previewMode");

            v23 = 0.1;
            if (v22 != 1)
              objc_msgSend(v19, "liftAlpha", 0.1);
            v51 = v19;
            -[UIView setAlpha:](v20, "setAlpha:", v23);
            -[_UIPlatterView setAppliesOriginalRotation:](v20, "setAppliesOriginalRotation:", 1);
            objc_msgSend(v14, "target");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "container");
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            -[_UIPlatterView takeCounterTransformsToAddToContainer:](v20, "takeCounterTransformsToAddToContainer:", v25);
            objc_msgSend(v14, "_previewContainer");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            if (v26)
            {
              -[UIView bounds](v20, "bounds");
              objc_msgSend(v26, "setBounds:");
              objc_msgSend(v14, "target");
              v27 = v11;
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "center");
              objc_msgSend(v26, "setCenter:");

              objc_msgSend(v25, "addSubview:", v26);
              -[_UIPlatterView sourceView](v20, "sourceView");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
              v56[0] = *MEMORY[0x1E0C9BAA8];
              v56[1] = v30;
              v56[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
              objc_msgSend(v26, "_preparePreviewContainerWithPreview:source:initialTransform:", v20, v29, v56);

              objc_msgSend(v15, "layer");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "zPosition");
              v33 = v32 + 1.0 + (double)v27;
              objc_msgSend(v26, "layer");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "setZPosition:", v33);

            }
            else
            {
              objc_msgSend(v15, "layer");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "zPosition");
              v37 = v36 + 1.0 + (double)v11;
              -[UIView layer](v20, "layer");
              v27 = v11;
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "setZPosition:", v37);

              objc_msgSend(v14, "target");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "center");
              -[UIView setCenter:](v20, "setCenter:");

              objc_msgSend(v25, "addSubview:", v20);
            }
            v11 = v27 + 1;
            -[UIView layoutIfNeeded](v20, "layoutIfNeeded");
            v40 = (void *)objc_opt_new();
            objc_msgSend(v40, "setPreviewContainer:", v26);
            objc_msgSend(v40, "setPlatterView:", v20);
            objc_msgSend(v40, "setTargetedPreview:", v14);
            objc_msgSend(v40, "setSourceViewWasAdded:", v16 == 0);
            objc_msgSend(v51, "liftAlpha");
            objc_msgSend(v40, "setLiftAlpha:");
            objc_msgSend(v48, "addObject:", v40);

            v12 = v46;
            v6 = v47;
            v10 = v49;
          }

          ++v13;
        }
        while (v10 != v13);
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
      }
      while (v10);
    }

    v4 = v45;
    objc_msgSend(v45, "setItems:", v48);
    objc_msgSend(v45, "propertyAnimator");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = MEMORY[0x1E0C809B0];
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __67___UIDragSourceLiftEffect__installInteractionPlattersForOperation___block_invoke;
    v54[3] = &unk_1E16B1B28;
    v43 = v45;
    v55 = v43;
    objc_msgSend(v41, "addAnimations:", v54);
    v52[0] = v42;
    v52[1] = 3221225472;
    v52[2] = __67___UIDragSourceLiftEffect__installInteractionPlattersForOperation___block_invoke_3;
    v52[3] = &unk_1E16BE3C0;
    v52[4] = v44;
    v53 = v43;
    objc_msgSend(v41, "addCompletion:", v52);

  }
}

- (void)_uninstallInteractionPlattersForOperation:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMapTable *liftOperationByContext;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v4, "items", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v10, "previewContainer");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
          objc_msgSend(v10, "previewContainer");
        else
          objc_msgSend(v10, "platterView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "removeFromSuperview");

        objc_msgSend(v10, "targetedPreview");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "view");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v10, "sourceViewWasAdded"))
          objc_msgSend(v14, "removeFromSuperview");

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "setItems:", 0);
  liftOperationByContext = self->_liftOperationByContext;
  objc_msgSend(v4, "context");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable removeObjectForKey:](liftOperationByContext, "removeObjectForKey:", v16);

}

- (id)reversedTimingParametersForTimingParameters:(id)a3
{
  return a3;
}

- (void)_setInteractionEffectsLifted:(BOOL)a3 withOperation:(id)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  int v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;

  v4 = a3;
  v15 = a4;
  objc_msgSend(v15, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "propertyAnimator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "shouldAnimateLift");
  if (objc_msgSend(v6, "state"))
    v9 = 1;
  else
    v9 = v4;
  if (v8)
  {
    if ((v9 & 1) != 0)
    {
      if (v4)
      {
        objc_msgSend(v7, "setPausesOnCompletion:", 1);
        if (objc_msgSend(v7, "isReversed"))
        {
          if (objc_msgSend(v7, "isRunning"))
            objc_msgSend(v7, "pauseAnimation");
          objc_msgSend(v7, "setReversed:", 0);
          objc_msgSend(v7, "timingParameters");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "continueAnimationWithTimingParameters:durationFactor:", v10, 1.0);

        }
        else
        {
          objc_msgSend(v7, "startAnimation");
        }
      }
    }
    else
    {
      objc_msgSend(v7, "setPausesOnCompletion:", 0);
      if (objc_msgSend(v7, "isRunning"))
        objc_msgSend(v7, "pauseAnimation");
      objc_msgSend(v7, "setReversed:", 1);
      objc_msgSend(v7, "timingParameters");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDragSourceLiftEffect reversedTimingParametersForTimingParameters:](self, "reversedTimingParametersForTimingParameters:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "continueAnimationWithTimingParameters:durationFactor:", v12, 1.0);
      -[_UIDragSourceLiftEffect setScrollCancelling:](self, "setScrollCancelling:", 0);
      objc_msgSend(v15, "items");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");

      if (!v14)
      {
        objc_msgSend(v7, "stopAnimation:", 0);
        objc_msgSend(v7, "finishAnimationAtPosition:", 1);
      }

    }
  }
  else if ((v9 & 1) != 0)
  {
    objc_msgSend(v7, "pauseAnimation");
  }
  else
  {
    objc_msgSend(v7, "stopAnimation:", 0);
    objc_msgSend(v7, "finishAnimationAtPosition:", 1);
    -[_UIDragSourceLiftEffect _uninstallInteractionPlattersForOperation:](self, "_uninstallInteractionPlattersForOperation:", v15);
  }

}

- (BOOL)scrollCancelling
{
  return self->_scrollCancelling;
}

- (void)setScrollCancelling:(BOOL)a3
{
  self->_scrollCancelling = a3;
}

@end
