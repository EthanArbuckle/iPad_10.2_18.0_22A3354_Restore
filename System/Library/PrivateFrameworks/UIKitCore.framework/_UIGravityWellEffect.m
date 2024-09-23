@implementation _UIGravityWellEffect

+ (id)effectWithDescriptor:(id)a3 continuationPreview:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void (**v11)(void *, void *);
  id *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  unint64_t i;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  id *v40;
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD aBlock[4];
  id v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "primaryPreview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "target");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __65___UIGravityWellEffect_effectWithDescriptor_continuationPreview___block_invoke;
  aBlock[3] = &unk_1E16BE728;
  v10 = v9;
  v48 = v10;
  v11 = (void (**)(void *, void *))_Block_copy(aBlock);
  v12 = (id *)objc_opt_new();
  objc_storeStrong(v12 + 1, a3);
  objc_msgSend(v12, "setContinuationPreview:", v7);
  objc_msgSend(v6, "primaryPreview");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2](v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPrimaryBody:", v14);

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  _UIContextMenuGetPlatformMetrics(objc_msgSend(v15, "userInterfaceIdiom"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "baseMenuOffset");
  objc_msgSend(v12, "setBaseZOffset:", v17);

  objc_msgSend(v6, "secondaryPreviews");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");

  if (v19)
  {
    v40 = v12;
    v41 = v7;
    v20 = (void *)objc_opt_new();
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v42 = v6;
    objc_msgSend(v6, "secondaryPreviews");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v44;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v44 != v24)
            objc_enumerationMutation(v21);
          v11[2](v11, *(void **)(*((_QWORD *)&v43 + 1) + 8 * v25));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "positionInPrimaryContainer");
          v28 = v27;
          v30 = v29;
          objc_msgSend(v10, "center");
          objc_msgSend(v26, "setDistanceFromPrimaryBody:", sqrt((v31 - v28) * (v31 - v28) + (v32 - v30) * (v32 - v30)));
          for (i = 0; i < objc_msgSend(v20, "count"); ++i)
          {
            objc_msgSend(v20, "objectAtIndexedSubscript:", i);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "distanceFromPrimaryBody");
            v36 = v35;
            objc_msgSend(v26, "distanceFromPrimaryBody");
            v38 = v37;

            if (v36 >= v38)
              break;
          }
          objc_msgSend(v20, "insertObject:atIndex:", v26, i);

          ++v25;
        }
        while (v25 != v23);
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
      }
      while (v23);
    }

    v12 = v40;
    objc_msgSend(v40, "setSecondaryBodies:", v20);

    v7 = v41;
    v6 = v42;
  }

  return v12;
}

- (NSArray)secondaryBodyPreviews
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  UITargetedPreview *v10;
  void *v11;
  UITargetedPreview *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[_UIGravityWellEffect secondaryBodies](self, "secondaryBodies", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v8);
        v10 = [UITargetedPreview alloc];
        objc_msgSend(v9, "effectView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[UITargetedPreview initWithView:](v10, "initWithView:", v11);

        objc_msgSend(v9, "preview");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "_internalIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[UITargetedPreview set_internalIdentifier:](v12, "set_internalIdentifier:", v14);

        objc_msgSend(v3, "addObject:", v12);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (void)begin
{
  void *v3;
  void *v4;
  void *v5;

  -[_UIGravityWellEffect primaryBody](self, "primaryBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "effectView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    -[_UIGravityWellEffect _installEffectViews](self, "_installEffectViews");
  -[_UIGravityWellEffect effectProgress](self, "effectProgress");
  -[_UIGravityWellEffect _updateToProgress:state:](self, "_updateToProgress:state:", 1);
}

- (void)updateWithProgress:(double)a3
{
  -[_UIGravityWellEffect _updateToProgress:state:](self, "_updateToProgress:state:", -[_UIGravityWellEffect state](self, "state"), a3);
}

- (void)end
{
  if (+[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled"))
  {
    -[_UIGravityWellEffect _updateToProgress:state:](self, "_updateToProgress:state:", 0, 0.0);
  }
  else
  {
    -[_UIGravityWellEffect _tearDownEffectViews](self, "_tearDownEffectViews");
    -[_UIGravityWellEffect _performAllCompletions](self, "_performAllCompletions");
    -[_UIGravityWellEffect setEffectProgress:](self, "setEffectProgress:", 0.0);
    -[_UIGravityWellEffect setState:](self, "setState:", 0);
  }
}

- (void)endForHandOff
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __37___UIGravityWellEffect_endForHandOff__block_invoke;
  v3[3] = &unk_1E16B1B28;
  v3[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v3);
  -[_UIGravityWellEffect setState:](self, "setState:", 2);
}

- (void)setDescriptor:(id)a3 andKey:(id)a4
{
  objc_storeStrong((id *)&self->_descriptor, a3);
}

- (id)previewForContinuingToEffectWithPreview:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  UIPreviewTarget *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  unint64_t v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  CGAffineTransform v43;
  CATransform3D v44;
  CGAffineTransform v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  -[_UIGravityWellEffect primaryBody](self, "primaryBody", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anchorView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "presentationLayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      objc_msgSend(v5, "layer");
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v10;

    memset(&v45, 0, sizeof(v45));
    v37 = v12;
    if (v12)
      objc_msgSend(v12, "transform");
    else
      memset(&v44, 0, sizeof(v44));
    CATransform3DGetAffineTransform(&v45, &v44);
    v13 = [UIPreviewTarget alloc];
    objc_msgSend(v5, "superview");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v5;
    objc_msgSend(v5, "center");
    v43 = v45;
    v15 = -[UIPreviewTarget initWithContainer:center:transform:](v13, "initWithContainer:center:transform:", v14, &v43);

    -[_UIGravityWellEffect primaryBody](self, "primaryBody");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "preview");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)v15;
    objc_msgSend(v17, "retargetedPreviewWithTarget:", v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UIGravityWellEffect primaryBody](self, "primaryBody");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "anchorView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "animationKeys");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "set_transferrableAnimationKeys:", v21);

    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    objc_msgSend(v11, "_transferrableAnimationKeys");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v40 != v25)
            objc_enumerationMutation(v22);
          v27 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
          objc_msgSend(v20, "animationForKey:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = (void *)objc_msgSend(v28, "copy");

          if (v29)
          {
            objc_msgSend(v20, "removeAnimationForKey:", v27);
            objc_msgSend(v11, "view");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "layer");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "addAnimation:forKey:", v29, v27);

          }
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
      }
      while (v24);
    }

    v5 = v38;
  }
  else
  {
    if (os_variant_has_internal_diagnostics())
    {
      if (os_variant_has_internal_diagnostics())
      {
        __UIFaultDebugAssertLog();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
        {
          LOWORD(v45.a) = 0;
          _os_log_fault_impl(&dword_185066000, v35, OS_LOG_TYPE_FAULT, "Presenting while the highlight platter isn't in a window. If you see this, please file a bug against UIKit | Context Menu with reproduction steps.", (uint8_t *)&v45, 2u);
        }

      }
      else
      {
        v33 = previewForContinuingToEffectWithPreview____s_category;
        if (!previewForContinuingToEffectWithPreview____s_category)
        {
          v33 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v33, (unint64_t *)&previewForContinuingToEffectWithPreview____s_category);
        }
        v34 = *(NSObject **)(v33 + 8);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v45.a) = 0;
          _os_log_impl(&dword_185066000, v34, OS_LOG_TYPE_ERROR, "Presenting while the highlight platter isn't in a window. If you see this, please file a bug against UIKit | Context Menu with reproduction steps.", (uint8_t *)&v45, 2u);
        }
      }
    }
    v11 = 0;
  }

  return v11;
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

- (void)_installEffectViews
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __43___UIGravityWellEffect__installEffectViews__block_invoke;
  v2[3] = &unk_1E16B1B28;
  v2[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v2);
}

- (void)_updateToProgress:(double)a3 state:(int64_t)a4
{
  double v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[6];
  _QWORD aBlock[5];
  id v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  if (-[_UIGravityWellEffect state](self, "state") != 2)
  {
    -[_UIGravityWellEffect effectProgress](self, "effectProgress");
    if (vabdd_f64(v8, a3) > 2.22044605e-16 || -[_UIGravityWellEffect state](self, "state") != a4)
    {
      -[_UIGravityWellEffect setEffectProgress:](self, "setEffectProgress:", a3);
      -[_UIGravityWellEffect setState:](self, "setState:", a4);
      -[_UIGravityWellEffect primaryBody](self, "primaryBody");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "positionInPrimaryContainer");
      v11 = v10;
      v13 = v12;
      v15 = v14;
      v16 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __48___UIGravityWellEffect__updateToProgress_state___block_invoke;
      aBlock[3] = &unk_1E16BE770;
      aBlock[4] = self;
      v17 = v9;
      v27 = v17;
      v28 = a3;
      v29 = v11;
      v30 = v13;
      v31 = v15;
      v18 = _Block_copy(aBlock);
      v25[0] = v16;
      v25[1] = 3221225472;
      v25[2] = __48___UIGravityWellEffect__updateToProgress_state___block_invoke_2;
      v25[3] = &unk_1E16BE798;
      v25[4] = self;
      v25[5] = a2;
      v19 = _Block_copy(v25);
      objc_msgSend(v17, "effectView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "traitCollection");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "userInterfaceIdiom");

      -[_UIGravityWellEffect _effectSpringBehavior](self, "_effectSpringBehavior");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22 == 6)
      {
        -[_UIGravityWellEffect _criticallyDampedEffectSpringBehavior](self, "_criticallyDampedEffectSpringBehavior");
        v24 = objc_claimAutoreleasedReturnValue();

        v23 = (void *)v24;
      }
      +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v23, 0, v18, v19);

    }
  }
}

- (void)_tearDownEffectViews
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[_UIGravityWellEffect primaryBody](self, "primaryBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anchorView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperview");

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[_UIGravityWellEffect secondaryBodies](self, "secondaryBodies", 0);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9), "anchorView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "removeFromSuperview");

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)_performAllCompletions
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
  -[_UIGravityWellEffect completions](self, "completions", 0);
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

- (id)_effectSpringBehavior
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)_effectSpringBehavior___behavior;
  if (!_effectSpringBehavior___behavior)
  {
    +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:response:](UIViewSpringAnimationBehavior, "behaviorWithDampingRatio:response:", 0.6, 0.4);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)_effectSpringBehavior___behavior;
    _effectSpringBehavior___behavior = v3;

    v2 = (void *)_effectSpringBehavior___behavior;
  }
  return v2;
}

- (id)_criticallyDampedEffectSpringBehavior
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)_criticallyDampedEffectSpringBehavior___behavior;
  if (!_criticallyDampedEffectSpringBehavior___behavior)
  {
    +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:response:](UIViewSpringAnimationBehavior, "behaviorWithDampingRatio:response:", 1.0, 0.4);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)_criticallyDampedEffectSpringBehavior___behavior;
    _criticallyDampedEffectSpringBehavior___behavior = v3;

    v2 = (void *)_criticallyDampedEffectSpringBehavior___behavior;
  }
  return v2;
}

- (_UIContentEffectDescriptor)descriptor
{
  return self->_descriptor;
}

- (UITargetedPreview)continuationPreview
{
  return self->_continuationPreview;
}

- (void)setContinuationPreview:(id)a3
{
  objc_storeStrong((id *)&self->_continuationPreview, a3);
}

- (_UIGravityWellEffectBody)primaryBody
{
  return self->_primaryBody;
}

- (void)setPrimaryBody:(id)a3
{
  objc_storeStrong((id *)&self->_primaryBody, a3);
}

- (NSArray)secondaryBodies
{
  return self->_secondaryBodies;
}

- (void)setSecondaryBodies:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryBodies, a3);
}

- (NSMutableArray)completions
{
  return self->_completions;
}

- (unint64_t)animationCount
{
  return self->_animationCount;
}

- (void)setAnimationCount:(unint64_t)a3
{
  self->_animationCount = a3;
}

- (double)effectProgress
{
  return self->_effectProgress;
}

- (void)setEffectProgress:(double)a3
{
  self->_effectProgress = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (double)baseZOffset
{
  return self->_baseZOffset;
}

- (void)setBaseZOffset:(double)a3
{
  self->_baseZOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completions, 0);
  objc_storeStrong((id *)&self->_secondaryBodies, 0);
  objc_storeStrong((id *)&self->_primaryBody, 0);
  objc_storeStrong((id *)&self->_continuationPreview, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
}

@end
