@implementation SBDodgingResolverViewController

- (SBDodgingResolverViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  SBDodgingResolverViewController *v4;
  uint64_t v5;
  NSMutableArray *eventQueue;
  uint64_t v7;
  NSMutableSet *itemsNeedingUpdate;
  uint64_t v9;
  NSMutableSet *itemsNeedingNonAnimatedUpdate;
  SBRootDodgingLayerModifier *v11;
  SBRootDodgingLayerModifier *rootModifier;
  SBDodgingModel *v13;
  uint64_t v14;
  SBDodgingModel *model;
  uint64_t v16;
  NSMutableDictionary *itemsForIdentifiers;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)SBDodgingResolverViewController;
  v4 = -[SBDodgingResolverViewController initWithNibName:bundle:](&v19, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    v5 = objc_opt_new();
    eventQueue = v4->_eventQueue;
    v4->_eventQueue = (NSMutableArray *)v5;

    v7 = objc_opt_new();
    itemsNeedingUpdate = v4->_itemsNeedingUpdate;
    v4->_itemsNeedingUpdate = (NSMutableSet *)v7;

    v9 = objc_opt_new();
    itemsNeedingNonAnimatedUpdate = v4->_itemsNeedingNonAnimatedUpdate;
    v4->_itemsNeedingNonAnimatedUpdate = (NSMutableSet *)v9;

    v11 = objc_alloc_init(SBRootDodgingLayerModifier);
    rootModifier = v4->_rootModifier;
    v4->_rootModifier = v11;

    -[SBRootDodgingLayerModifier setDelegate:](v4->_rootModifier, "setDelegate:", v4);
    v13 = [SBDodgingModel alloc];
    v14 = -[SBDodgingModel initWithReferenceBounds:](v13, "initWithReferenceBounds:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    model = v4->_model;
    v4->_model = (SBDodgingModel *)v14;

    v16 = objc_opt_new();
    itemsForIdentifiers = v4->_itemsForIdentifiers;
    v4->_itemsForIdentifiers = (NSMutableDictionary *)v16;

  }
  return v4;
}

- (id)addItemWithIdentifier:(id)a3 view:(id)a4 initialCenter:(CGPoint)a5 initialSize:(CGSize)a6 delegate:(id)a7
{
  double height;
  double width;
  double y;
  double x;
  id v15;
  id v16;
  id v17;
  void *v18;
  SBDodgingItem *v19;
  void *v20;
  void *v21;
  SBInsertionDodgingModifierEvent *v22;
  void *v24;
  void *v25;

  height = a6.height;
  width = a6.width;
  y = a5.y;
  x = a5.x;
  v15 = a3;
  v16 = a4;
  v17 = a7;
  -[NSMutableDictionary objectForKey:](self->_itemsForIdentifiers, "objectForKey:", v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBDodgingResolverViewController description](self, "description");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDodgingResolverViewController.m"), 78, CFSTR("%@ already exists in %@"), v15, v25);

  }
  v19 = -[SBDodgingItem initWithUniqueIdentifier:view:delegate:dodgingResolverViewController:]([SBDodgingItem alloc], "initWithUniqueIdentifier:view:delegate:dodgingResolverViewController:", v15, v16, v17, self);
  -[NSMutableDictionary setObject:forKey:](self->_itemsForIdentifiers, "setObject:forKey:", v19, v15);
  if (v16)
  {
    -[SBDodgingResolverViewController view](self, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addSubview:", v16);

  }
  objc_msgSend(v17, "dodgingResolver:preferenceForDodgingItem:", self, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDodgingItem setPreference:](v19, "setPreference:", v21);

  v22 = -[SBInsertionDodgingModifierEvent initWithIdentifier:center:size:]([SBInsertionDodgingModifierEvent alloc], "initWithIdentifier:center:size:", v15, x, y, width, height);
  -[SBDodgingResolverViewController _dispatchOrAppendEvent:](self, "_dispatchOrAppendEvent:", v22);

  return v19;
}

- (id)invalidateItem:(id)a3
{
  id v4;
  SBRemovalDodgingModifierEvent *v5;
  void *v6;
  SBRemovalDodgingModifierEvent *v7;
  void *v8;
  void *v9;
  NSMutableDictionary *itemsForIdentifiers;
  void *v11;

  v4 = a3;
  v5 = [SBRemovalDodgingModifierEvent alloc];
  objc_msgSend(v4, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SBRemovalDodgingModifierEvent initWithIdentifier:](v5, "initWithIdentifier:", v6);

  -[SBDodgingResolverViewController _dispatchOrAppendEvent:](self, "_dispatchOrAppendEvent:", v7);
  objc_msgSend(v4, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    objc_msgSend(v8, "removeFromSuperview");
  itemsForIdentifiers = self->_itemsForIdentifiers;
  objc_msgSend(v4, "uniqueIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](itemsForIdentifiers, "removeObjectForKey:", v11);

  return v9;
}

- (void)setItemNeedsUpdate:(id)a3 animated:(BOOL)a4
{
  __uint64_t v6;
  id v7;

  v7 = a3;
  v6 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  -[NSMutableSet addObject:](self->_itemsNeedingUpdate, "addObject:", v7);
  if (!a4)
    -[NSMutableSet addObject:](self->_itemsNeedingNonAnimatedUpdate, "addObject:", v7);
  -[SBDodgingResolverViewController _updateItemIfNeeded:](self, "_updateItemIfNeeded:", v7);
  self->_lastUpdateTimeNS = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) - v6;

}

- (void)performTransitionFromOrientation:(int64_t)a3 toOrientation:(int64_t)a4 animated:(BOOL)a5 mutationBlock:(id)a6
{
  _BOOL4 v6;
  id v10;
  void *v11;
  SBRotationDodgingModifierEvent *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  SBDodgingResolverViewController *v20;
  int64_t v21;
  int64_t v22;
  _QWORD v23[5];
  id v24;
  id v25;
  int64_t v26;
  int64_t v27;

  v6 = a5;
  v10 = a6;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SBRotationDodgingModifierEvent initWithIdentifier:fromOrientation:toOrientation:phase:]([SBRotationDodgingModifierEvent alloc], "initWithIdentifier:fromOrientation:toOrientation:phase:", v11, a3, a4, 0);
  -[SBDodgingResolverViewController _dispatchOrAppendEvent:](self, "_dispatchOrAppendEvent:", v12);
  v13 = 0;
  if (v6)
  {
    +[SBAnimationUtilities animationSettingsForRotationFromInterfaceOrientation:toInterfaceOrientation:](SBAnimationUtilities, "animationSettingsForRotationFromInterfaceOrientation:toInterfaceOrientation:", a3, a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)MEMORY[0x1E0D01908];
  v15 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __105__SBDodgingResolverViewController_performTransitionFromOrientation_toOrientation_animated_mutationBlock___block_invoke;
  v23[3] = &unk_1E8EBB4E0;
  v25 = v10;
  v26 = a4;
  v23[4] = self;
  v24 = v11;
  v27 = a3;
  v18[0] = v15;
  v18[1] = 3221225472;
  v18[2] = __105__SBDodgingResolverViewController_performTransitionFromOrientation_toOrientation_animated_mutationBlock___block_invoke_2;
  v18[3] = &unk_1E8EBB508;
  v21 = a3;
  v22 = a4;
  v19 = v24;
  v20 = self;
  v16 = v24;
  v17 = v10;
  objc_msgSend(v14, "animateWithSettings:actions:completion:", v13, v23, v18);

}

void __105__SBDodgingResolverViewController_performTransitionFromOrientation_toOrientation_animated_mutationBlock___block_invoke(uint64_t a1)
{
  SBRotationDodgingModifierEvent *v2;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1000) = *(_QWORD *)(a1 + 56);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "_setAllItemsNeedUpdate");
  objc_msgSend(*(id *)(a1 + 32), "_updateItemsIfNeeded");
  v2 = -[SBRotationDodgingModifierEvent initWithIdentifier:fromOrientation:toOrientation:phase:]([SBRotationDodgingModifierEvent alloc], "initWithIdentifier:fromOrientation:toOrientation:phase:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56), 1);
  objc_msgSend(*(id *)(a1 + 32), "_dispatchOrAppendEvent:", v2);

}

void __105__SBDodgingResolverViewController_performTransitionFromOrientation_toOrientation_animated_mutationBlock___block_invoke_2(uint64_t a1)
{
  SBRotationDodgingModifierEvent *v2;

  v2 = -[SBRotationDodgingModifierEvent initWithIdentifier:fromOrientation:toOrientation:phase:]([SBRotationDodgingModifierEvent alloc], "initWithIdentifier:fromOrientation:toOrientation:phase:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 2);
  objc_msgSend(*(id *)(a1 + 40), "_dispatchOrAppendEvent:", v2);

}

- (SBDodgingModel)model
{
  return self->_model;
}

- (CGRect)contentViewBounds
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
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[SBDodgingResolverViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (int64_t)interfaceOrientation
{
  return self->_contentOrientation;
}

- (id)preferenceForIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[NSMutableDictionary objectForKey:](self->_itemsForIdentifiers, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)spaceBetweenIdentifiers
{
  return 20.0;
}

- (void)_dispatchOrAppendEvent:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDodgingResolverViewController.m"), 167, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("event"));

    v5 = 0;
  }
  -[NSMutableArray _sb_enqueue:](self->_eventQueue, "_sb_enqueue:", v5);
  -[SBDodgingResolverViewController _dispatchNextEventIfNeededAndHandleResponse](self, "_dispatchNextEventIfNeededAndHandleResponse");

}

- (void)_dispatchNextEventIfNeededAndHandleResponse
{
  void *v3;
  void *v4;
  void *v5;

  if (!self->_dispatchingEvent)
  {
    -[NSMutableArray _sb_dequeue](self->_eventQueue, "_sb_dequeue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      self->_dispatchingEvent = 1;
      v5 = v3;
      -[SBChainableModifier handleEvent:](self->_rootModifier, "handleEvent:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
        -[SBDodgingResolverViewController _handleEventResponse:](self, "_handleEventResponse:", v4);
      -[SBDodgingResolverViewController _updateItemsIfNeeded](self, "_updateItemsIfNeeded");
      -[SBDodgingResolverViewController _updateModelIfNeeded](self, "_updateModelIfNeeded");
      -[SBDodgingResolverViewController _updateLayoutIfNeeded](self, "_updateLayoutIfNeeded");
      self->_dispatchingEvent = 0;
      -[SBDodgingResolverViewController _dispatchNextEventIfNeededAndHandleResponse](self, "_dispatchNextEventIfNeededAndHandleResponse");

      v3 = v5;
    }

  }
}

- (void)_setNeedsModelUpdate
{
  self->_needsModelUpdate = 1;
}

- (void)_updateModelIfNeeded
{
  SBDodgingModel *v3;
  SBDodgingModel *model;

  if (self->_needsModelUpdate)
  {
    -[SBRootDodgingLayerModifier modelForInvalidatedModel:](self->_rootModifier, "modelForInvalidatedModel:", self->_model);
    v3 = (SBDodgingModel *)objc_claimAutoreleasedReturnValue();
    model = self->_model;
    self->_model = v3;

    self->_needsModelUpdate = 0;
  }
}

- (void)_setNeedsLayout
{
  self->_needsLayout = 1;
}

- (void)_updateLayoutIfNeeded
{
  if (self->_needsLayout)
  {
    -[SBDodgingResolverViewController _updateLayoutWithItemIdentifier:completion:](self, "_updateLayoutWithItemIdentifier:completion:", 0, 0);
    self->_needsLayout = 0;
  }
}

- (void)_updateLayoutWithItemIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[SBRootDodgingLayerModifier zOrderedIdentifiers](self->_rootModifier, "zOrderedIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reverseObjectEnumerator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        -[NSMutableDictionary objectForKey:](self->_itemsForIdentifiers, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v13));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "view");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          -[SBDodgingResolverViewController view](self, "view");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "bringSubviewToFront:", v15);

        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v11);
  }

  v17 = (void *)MEMORY[0x1E0DA9D48];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __78__SBDodgingResolverViewController__updateLayoutWithItemIdentifier_completion___block_invoke;
  v19[3] = &unk_1E8EA4760;
  v19[4] = self;
  v20 = v6;
  v18 = v6;
  objc_msgSend(v17, "perform:finalCompletion:", v19, v7);

}

void __78__SBDodgingResolverViewController__updateLayoutWithItemIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t i;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  id obj;
  void *v28;
  void (**v29)(id, const __CFString *);
  uint64_t v30;
  uint64_t v31;
  _QWORD v32[4];
  id v33;
  uint64_t v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v29 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "framesForIdentifiers");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 984), "identifiers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (v31)
  {
    v30 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v31; ++i)
      {
        if (*(_QWORD *)v45 != v30)
          objc_enumerationMutation(obj);
        v4 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
        v5 = *(void **)(a1 + 40);
        if (!v5 || objc_msgSend(v5, "isEqual:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i)))
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "objectForKey:", v4);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "view");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "objectForKey:", v4);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "CGRectValue");
          v10 = v9;
          v12 = v11;
          v14 = v13;
          v16 = v15;
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "layoutSettingsForIdentifier:", v4);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 976), "animationBehaviorModeForIdentifier:", v4);
          v29[2](v29, CFSTR("frame"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (void *)MEMORY[0x1E0CEABB0];
          v21 = MEMORY[0x1E0C809B0];
          v36[0] = MEMORY[0x1E0C809B0];
          v36[1] = 3221225472;
          v36[2] = __78__SBDodgingResolverViewController__updateLayoutWithItemIdentifier_completion___block_invoke_2;
          v36[3] = &unk_1E8EBB530;
          v37 = v7;
          v40 = v10;
          v41 = v12;
          v42 = v14;
          v43 = v16;
          v22 = v6;
          v23 = *(_QWORD *)(a1 + 32);
          v38 = v22;
          v39 = v23;
          v32[0] = v21;
          v32[1] = 3221225472;
          v32[2] = __78__SBDodgingResolverViewController__updateLayoutWithItemIdentifier_completion___block_invoke_3;
          v32[3] = &unk_1E8E9EBD0;
          v33 = v22;
          v34 = v23;
          v35 = v19;
          v24 = v19;
          v25 = v22;
          v26 = v7;
          objc_msgSend(v20, "sb_animateWithSettings:mode:animations:completion:", v17, v18, v36, v32);

        }
      }
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    }
    while (v31);
  }

}

void __78__SBDodgingResolverViewController__updateLayoutWithItemIdentifier_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  v2 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "contentViewBounds");
  objc_msgSend(v2, "setContainerSize:", v3, v4);
  v5 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContainerCoordinateSpace:", v6);

  v7 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 992), "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setOtherDodgingIdentifiers:", v8);

  objc_msgSend(*(id *)(a1 + 40), "setSize:", *(double *)(a1 + 72), *(double *)(a1 + 80));
  v9 = *(void **)(a1 + 40);
  UIRectGetCenter();
  objc_msgSend(v9, "setCenter:");
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v10, "dodgingResolver:dodgingItemDidChange:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

uint64_t __78__SBDodgingResolverViewController__updateLayoutWithItemIdentifier_completion___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  uint64_t result;

  if ((a3 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v6, "dodgingResolver:dodgingItemDidSettle:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a3);
  return result;
}

- (void)_setAllItemsNeedUpdate
{
  NSMutableSet *itemsNeedingUpdate;
  void *v4;
  void *v5;
  _QWORD v6[5];

  itemsNeedingUpdate = self->_itemsNeedingUpdate;
  -[SBDodgingModel identifiers](self->_model, "identifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__SBDodgingResolverViewController__setAllItemsNeedUpdate__block_invoke;
  v6[3] = &unk_1E8EB6290;
  v6[4] = self;
  objc_msgSend(v4, "bs_map:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObjectsFromArray:](itemsNeedingUpdate, "addObjectsFromArray:", v5);

}

uint64_t __57__SBDodgingResolverViewController__setAllItemsNeedUpdate__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 992), "objectForKey:", a2);
}

- (void)_updateItemsIfNeeded
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = (void *)-[NSMutableSet copy](self->_itemsNeedingUpdate, "copy");
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[SBDodgingResolverViewController _updateItemIfNeeded:](self, "_updateItemIfNeeded:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_setItemNeedsUpdate:(id)a3
{
  -[NSMutableSet addObject:](self->_itemsNeedingUpdate, "addObject:", a3);
}

- (void)_updateItemIfNeeded:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  SBPreferenceChangeDodgingModifierEvent *v9;
  void *v10;
  SBPreferenceChangeDodgingModifierEvent *v11;
  SBPreferenceChangeDodgingModifierEvent *v12;
  void *v13;
  SBPreferenceChangeDodgingModifierEvent *v14;
  id v15;

  v15 = a3;
  if (-[NSMutableSet containsObject:](self->_itemsNeedingUpdate, "containsObject:"))
  {
    -[NSMutableSet removeObject:](self->_itemsNeedingUpdate, "removeObject:", v15);
    objc_msgSend(v15, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dodgingResolver:preferenceForDodgingItem:", self, v15);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v5, "isUpdatingInteractively");
    if (-[NSMutableSet containsObject:](self->_itemsNeedingNonAnimatedUpdate, "containsObject:", v15))
    {
      -[NSMutableSet removeObject:](self->_itemsNeedingNonAnimatedUpdate, "removeObject:", v15);
      v7 = 0;
    }
    else
    {
      v7 = 2;
    }
    if (v6)
      v8 = 1;
    else
      v8 = v7;
    v9 = [SBPreferenceChangeDodgingModifierEvent alloc];
    objc_msgSend(v15, "uniqueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[SBPreferenceChangeDodgingModifierEvent initWithIdentifier:phase:style:](v9, "initWithIdentifier:phase:style:", v10, 0, v8);

    -[SBDodgingResolverViewController _dispatchOrAppendEvent:](self, "_dispatchOrAppendEvent:", v11);
    objc_msgSend(v15, "setPreference:", v5);
    v12 = [SBPreferenceChangeDodgingModifierEvent alloc];
    objc_msgSend(v15, "uniqueIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[SBPreferenceChangeDodgingModifierEvent initWithIdentifier:phase:style:](v12, "initWithIdentifier:phase:style:", v13, 1, v8);

    -[SBDodgingResolverViewController _dispatchOrAppendEvent:](self, "_dispatchOrAppendEvent:", v14);
  }

}

- (void)_handleEventResponse:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  double v8;
  dispatch_time_t v9;
  void *v10;
  _QWORD block[4];
  id v12;
  SBDodgingResolverViewController *v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDodgingResolverViewController.m"), 351, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("response"));

  }
  if (objc_msgSend(v5, "isValid"))
  {
    objc_msgSend(v5, "delay");
    if ((BSFloatIsZero() & 1) != 0)
    {
      -[SBDodgingResolverViewController _performEventResponse:](self, "_performEventResponse:", v5);
    }
    else
    {
      objc_msgSend(v5, "delay");
      v9 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __56__SBDodgingResolverViewController__handleEventResponse___block_invoke;
      block[3] = &unk_1E8E9E820;
      v12 = v5;
      v13 = self;
      dispatch_after(v9, MEMORY[0x1E0C80D38], block);

    }
  }
  else
  {
    SBLogAppSwitcher();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v5, "description");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v7;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_INFO, "[DodgingVC] Skipping the following action because it's no longer valid: %@", buf, 0xCu);

    }
  }

}

void __56__SBDodgingResolverViewController__handleEventResponse___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isValid"))
  {
    objc_msgSend(*(id *)(a1 + 40), "_performEventResponse:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    SBLogAppSwitcher();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "description");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = 138412290;
      v5 = v3;
      _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_INFO, "[DodgingVC] Skipping the following action because it's no longer valid: %@", (uint8_t *)&v4, 0xCu);

    }
  }
}

- (void)_performEventResponse:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBDodgingResolverViewController.m"), 373, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("response"));

  }
  v6 = objc_msgSend(v5, "type");
  if (v6 == 2)
  {
    -[SBDodgingResolverViewController _performScheduleEventResponse:](self, "_performScheduleEventResponse:", v5);
  }
  else if (v6 == 1)
  {
    -[SBDodgingResolverViewController _performInvalidationResponse:](self, "_performInvalidationResponse:", v5);
  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__SBDodgingResolverViewController__performEventResponse___block_invoke;
  v8[3] = &unk_1E8EBB558;
  v8[4] = self;
  objc_msgSend(v5, "enumerateChildResponsesUsingBlock:", v8);

}

uint64_t __57__SBDodgingResolverViewController__performEventResponse___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleEventResponse:", a2);
}

- (void)_performInvalidationResponse:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  int v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  SBDodgingResolverViewController *v14;

  v4 = a3;
  v5 = objc_msgSend(v4, "options");
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "completionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "disableCoalescing");

  if (v7)
    v9 = 1;
  else
    v9 = v8;
  if (v6)
    v10 = 1;
  else
    v10 = v9;
  if (SBInvalidationDodgingOptionsContainsOption(v5, 4))
  {
    if (v6)
    {
      -[NSMutableDictionary objectForKey:](self->_itemsForIdentifiers, "objectForKey:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBDodgingResolverViewController _setItemNeedsUpdate:](self, "_setItemNeedsUpdate:", v11);

      if (!v10)
        goto LABEL_11;
      goto LABEL_10;
    }
    -[SBDodgingResolverViewController _setAllItemsNeedUpdate](self, "_setAllItemsNeedUpdate");
    if (v10)
LABEL_10:
      -[SBDodgingResolverViewController _updateItemsIfNeeded](self, "_updateItemsIfNeeded");
  }
LABEL_11:
  if (SBInvalidationDodgingOptionsContainsOption(v5, 1))
  {
    -[SBDodgingResolverViewController _setNeedsModelUpdate](self, "_setNeedsModelUpdate");
    if ((v10 & 1) != 0)
    {
      -[SBDodgingResolverViewController _updateModelIfNeeded](self, "_updateModelIfNeeded");
      if (!SBInvalidationDodgingOptionsContainsOption(v5, 2))
        goto LABEL_20;
      goto LABEL_17;
    }
    if (!SBInvalidationDodgingOptionsContainsOption(v5, 2))
      goto LABEL_20;
    goto LABEL_19;
  }
  if (SBInvalidationDodgingOptionsContainsOption(v5, 2))
  {
    if (v10)
    {
LABEL_17:
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __64__SBDodgingResolverViewController__performInvalidationResponse___block_invoke;
      v12[3] = &unk_1E8EA46C0;
      v13 = v7;
      v14 = self;
      -[SBDodgingResolverViewController _updateLayoutWithItemIdentifier:completion:](self, "_updateLayoutWithItemIdentifier:completion:", v6, v12);

      goto LABEL_20;
    }
LABEL_19:
    -[SBDodgingResolverViewController _setNeedsLayout](self, "_setNeedsLayout");
  }
LABEL_20:

}

void __64__SBDodgingResolverViewController__performInvalidationResponse___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  SBAnimationCompletionDodgingModifierEvent *v4;

  if (*(_QWORD *)(a1 + 32))
  {
    v4 = -[SBAnimationCompletionDodgingModifierEvent initWithIdentifier:finished:retargeted:]([SBAnimationCompletionDodgingModifierEvent alloc], "initWithIdentifier:finished:retargeted:", *(_QWORD *)(a1 + 32), a2, a3);
    objc_msgSend(*(id *)(a1 + 40), "_dispatchOrAppendEvent:", v4);

  }
}

- (void)_performScheduleEventResponse:(id)a3
{
  id v4;
  SBCustomEventDodgingModifierEvent *v5;
  void *v6;
  SBCustomEventDodgingModifierEvent *v7;

  v4 = a3;
  v5 = [SBCustomEventDodgingModifierEvent alloc];
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[SBCustomEventDodgingModifierEvent initWithName:](v5, "initWithName:", v6);
  -[SBDodgingResolverViewController _dispatchOrAppendEvent:](self, "_dispatchOrAppendEvent:", v7);

}

- (void)loadView
{
  id v3;
  id v4;

  v3 = objc_alloc(MEMORY[0x1E0DA9F28]);
  v4 = (id)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[SBDodgingResolverViewController setView:](self, "setView:", v4);

}

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SBDodgingResolverViewController;
  -[SBDodgingResolverViewController viewDidLoad](&v2, sel_viewDidLoad);
}

- (SBRootDodgingLayerModifier)rootModifier
{
  return self->_rootModifier;
}

- (void)setRootModifier:(id)a3
{
  objc_storeStrong((id *)&self->_rootModifier, a3);
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
}

- (NSMutableDictionary)itemsForIdentifiers
{
  return self->_itemsForIdentifiers;
}

- (void)setItemsForIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_itemsForIdentifiers, a3);
}

- (int64_t)contentOrientation
{
  return self->_contentOrientation;
}

- (void)setContentOrientation:(int64_t)a3
{
  self->_contentOrientation = a3;
}

- (NSMutableArray)eventQueue
{
  return self->_eventQueue;
}

- (void)setEventQueue:(id)a3
{
  objc_storeStrong((id *)&self->_eventQueue, a3);
}

- (BOOL)isDispatchingEvent
{
  return self->_dispatchingEvent;
}

- (void)setDispatchingEvent:(BOOL)a3
{
  self->_dispatchingEvent = a3;
}

- (NSMutableSet)itemsNeedingUpdate
{
  return self->_itemsNeedingUpdate;
}

- (void)setItemsNeedingUpdate:(id)a3
{
  objc_storeStrong((id *)&self->_itemsNeedingUpdate, a3);
}

- (NSMutableSet)itemsNeedingNonAnimatedUpdate
{
  return self->_itemsNeedingNonAnimatedUpdate;
}

- (void)setItemsNeedingNonAnimatedUpdate:(id)a3
{
  objc_storeStrong((id *)&self->_itemsNeedingNonAnimatedUpdate, a3);
}

- (BOOL)needsModelUpdate
{
  return self->_needsModelUpdate;
}

- (void)setNeedsModelUpdate:(BOOL)a3
{
  self->_needsModelUpdate = a3;
}

- (BOOL)needsLayout
{
  return self->_needsLayout;
}

- (void)setNeedsLayout:(BOOL)a3
{
  self->_needsLayout = a3;
}

- (UILabel)debugOverlay
{
  return self->_debugOverlay;
}

- (void)setDebugOverlay:(id)a3
{
  objc_storeStrong((id *)&self->_debugOverlay, a3);
}

- (unint64_t)lastUpdateTimeNS
{
  return self->_lastUpdateTimeNS;
}

- (void)setLastUpdateTimeNS:(unint64_t)a3
{
  self->_lastUpdateTimeNS = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugOverlay, 0);
  objc_storeStrong((id *)&self->_itemsNeedingNonAnimatedUpdate, 0);
  objc_storeStrong((id *)&self->_itemsNeedingUpdate, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
  objc_storeStrong((id *)&self->_itemsForIdentifiers, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_rootModifier, 0);
}

@end
