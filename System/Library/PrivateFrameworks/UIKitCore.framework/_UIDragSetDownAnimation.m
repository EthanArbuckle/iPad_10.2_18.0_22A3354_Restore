@implementation _UIDragSetDownAnimation

+ (BOOL)canAnimateItems:(id)a3 forSource:(BOOL)a4 policyDriven:(BOOL)a5
{
  void *v5;
  BOOL v6;

  windowSceneForItems(a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5 != 0;

  return v6;
}

- (_UIDragSetDownAnimation)initWithVisibleDroppedItems:(id)a3 items:(id)a4 forSource:(BOOL)a5 policyDriven:(BOOL)a6 completion:(id)a7
{
  _BOOL4 v8;
  _BOOL4 v9;
  id v12;
  id v13;
  id v14;
  _UIDragSetDownAnimation *v15;
  void *v16;
  id completion;
  void *v18;
  void *v19;
  UIView *v20;
  _UIDragSetDownAnimationWindow *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  void *v34;
  _UIDragSetDownItemAnimation *v35;
  void *v36;
  void *v37;
  void *v38;
  BOOL v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  UIViewPropertyAnimator *remainingItemsPropertyAnimator;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t k;
  NSArray *itemAnimations;
  NSArray *v58;
  NSObject *v60;
  int v61;
  unint64_t v62;
  NSObject *v63;
  void *v64;
  uint64_t v65;
  id *p_containerView;
  void *v67;
  void *v68;
  id v69;
  id v70;
  void *v71;
  unint64_t v72;
  unint64_t v73;
  id v74;
  _UIDragSetDownAnimationWindow *v75;
  void *v76;
  NSArray *v77;
  _BOOL4 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  uint8_t buf[16];
  objc_super v92;
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  uint64_t v96;

  v8 = a6;
  v9 = a5;
  v96 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a7;
  v92.receiver = self;
  v92.super_class = (Class)_UIDragSetDownAnimation;
  v15 = -[_UIDragSetDownAnimation init](&v92, sel_init);
  if (!v15)
    goto LABEL_55;
  v16 = _Block_copy(v14);
  completion = v15->_completion;
  v15->_completion = v16;

  windowForItems(v13, v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  windowSceneForItems(v13, v9, v8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = v13;
  v69 = v14;
  v78 = v9;
  if (os_variant_has_internal_diagnostics())
  {
    if (v19)
      goto LABEL_4;
    __UIFaultDebugAssertLog();
    v60 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_185066000, v60, OS_LOG_TYPE_FAULT, "Should have found a scene for the set down animation", buf, 2u);
    }

  }
  else
  {
    if (v19)
      goto LABEL_4;
    v62 = initWithVisibleDroppedItems_items_forSource_policyDriven_completion____s_category;
    if (!initWithVisibleDroppedItems_items_forSource_policyDriven_completion____s_category)
    {
      v62 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v62, (unint64_t *)&initWithVisibleDroppedItems_items_forSource_policyDriven_completion____s_category);
    }
    v63 = *(NSObject **)(v62 + 8);
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_185066000, v63, OS_LOG_TYPE_ERROR, "Should have found a scene for the set down animation", buf, 2u);
    }
  }
  +[UIScreen mainScreen](UIScreen, "mainScreen");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UISceneLifecycleMultiplexer mostActiveWindowSceneOnScreen:](_UISceneLifecycleMultiplexer, "mostActiveWindowSceneOnScreen:", v64);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "keyWindow");
  v65 = objc_claimAutoreleasedReturnValue();

  v18 = (void *)v65;
LABEL_4:
  if (objc_msgSend(v18, "_isHostedInAnotherProcess")
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v20 = [UIView alloc];
    objc_msgSend(v18, "bounds");
    v21 = -[UIView initWithFrame:](v20, "initWithFrame:");
    -[UIView setAutoresizingMask:](v21, "setAutoresizingMask:", 18);
    -[UIView setUserInteractionEnabled:](v21, "setUserInteractionEnabled:", 0);
    -[UIView layer](v21, "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setAllowsHitTesting:", 0);

    -[UIWindow setHidden:](v21, "setHidden:", 1);
    objc_msgSend(v18, "addSubview:", v21);
  }
  else
  {
    v21 = -[UIWindow initWithWindowScene:]([_UIDragSetDownAnimationWindow alloc], "initWithWindowScene:", v19);
    -[UIWindow setBecomeKeyOnOrderFront:](v21, "setBecomeKeyOnOrderFront:", 0);
    -[UIView layer](v21, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setAllowsHitTesting:", 0);

    -[UIView setUserInteractionEnabled:](v21, "setUserInteractionEnabled:", 0);
    -[UIView setBackgroundColor:](v21, "setBackgroundColor:", 0);
    -[UIWindow setWindowLevel:](v21, "setWindowLevel:", 1120.0);
    v24 = (void *)objc_opt_new();
    objc_msgSend(v24, "setSizesWindowToScene:", 1);
    -[UIWindow setRootViewController:](v21, "setRootViewController:", v24);
    -[UIWindow setHidden:](v21, "setHidden:", 1);

  }
  p_containerView = (id *)&v15->_containerView;
  objc_storeStrong((id *)&v15->_containerView, v21);
  v73 = objc_msgSend(v13, "count");
  if (_UIInternalPreferencesRevisionOnce != -1)
    dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_4_20);
  v25 = _UIInternalPreferencesRevisionVar;
  v67 = v19;
  v68 = v18;
  v75 = v21;
  if (_UIInternalPreferencesRevisionVar < 1
    || (v61 = _UIInternalPreference_DNDSetDownItemLimit,
        _UIInternalPreferencesRevisionVar == _UIInternalPreference_DNDSetDownItemLimit))
  {
    v72 = 5;
  }
  else
  {
    v72 = 5;
    while (v25 >= v61)
    {
      _UIInternalPreferenceSync(v25, &_UIInternalPreference_DNDSetDownItemLimit, (uint64_t)CFSTR("DNDSetDownItemLimit"), (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateInteger);
      v61 = _UIInternalPreference_DNDSetDownItemLimit;
      if (v25 == _UIInternalPreference_DNDSetDownItemLimit)
        goto LABEL_12;
    }
    v72 = qword_1EDDA7F70;
  }
LABEL_12:
  v77 = (NSArray *)objc_opt_new();
  v71 = (void *)objc_msgSend(v13, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  v70 = v12;
  objc_msgSend(v12, "reverseObjectEnumerator");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v87, v95, 16);
  if (v27)
  {
    v28 = v27;
    v29 = 0;
    v30 = *(_QWORD *)v88;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v88 != v30)
          objc_enumerationMutation(v26);
        v32 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * i);
        objc_msgSend(v32, "imageComponent");
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (v33)
        {
          objc_msgSend(v13, "objectAtIndexedSubscript:", objc_msgSend(v32, "itemIndex"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = -[_UIDragSetDownItemAnimation initWithDragItem:droppedItem:dropContainerView:defaultAnimation:sourceAnimation:delegate:]([_UIDragSetDownItemAnimation alloc], "initWithDragItem:droppedItem:dropContainerView:defaultAnimation:sourceAnimation:delegate:", v34, v32, v75, v73 > v72, v78, v15);
          -[NSArray addObject:](v77, "addObject:", v35);
          objc_msgSend(v76, "addIndex:", objc_msgSend(v32, "itemIndex"));
          if (v78)
            objc_msgSend(v34, "_sourceVisualTarget");
          else
            objc_msgSend(v34, "_destinationVisualTarget");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "_setDownAnimation:customSpringAnimationBehaviorForSetDownOfDragItem:", v15, v34);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UIDragSetDownItemAnimation setCustomSpringAnimationBehavior:](v35, "setCustomSpringAnimationBehavior:", v37);
          if (!v29)
          {
            -[_UIDragSetDownItemAnimation targetContainerWindow](v35, "targetContainerWindow");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v29)
            {
              objc_msgSend(v36, "_windowForSetDownOfDragItem:", v34);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
            }
          }

          v13 = v74;
        }
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v87, v95, 16);
    }
    while (v28);
  }
  else
  {
    v29 = 0;
  }

  v38 = v71;
  objc_msgSend(v71, "removeObjectsAtIndexes:", v76);
  v39 = v78;
  if (!v29)
  {
    v85 = 0u;
    v86 = 0u;
    v83 = 0u;
    v84 = 0u;
    v40 = v71;
    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v83, v94, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v84;
      while (2)
      {
        for (j = 0; j != v42; ++j)
        {
          if (*(_QWORD *)v84 != v43)
            objc_enumerationMutation(v40);
          v45 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * j);
          if (v39)
            objc_msgSend(v45, "_sourceVisualTarget");
          else
            objc_msgSend(v45, "_destinationVisualTarget");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "_windowForSetDownOfDragItem:", v45);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if (v29)
          {

            v39 = v78;
            goto LABEL_43;
          }
          v39 = v78;
        }
        v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v83, v94, 16);
        if (v42)
          continue;
        break;
      }
    }

    objc_msgSend(*p_containerView, "setHidden:", 0);
    objc_msgSend(*p_containerView, "_window");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_43:
    v38 = v71;
  }
  objc_storeStrong((id *)&v15->_coordinateContainerWindow, v29);
  -[NSArray makeObjectsPerformSelector:](v77, "makeObjectsPerformSelector:", sel_prepareToBeginAnimation);
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v47;
  if (v39)
    objc_msgSend(v47, "_sourceVisualTarget");
  else
    objc_msgSend(v47, "_destinationVisualTarget");
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "defaultSetDownPropertyAnimator");
  v50 = objc_claimAutoreleasedReturnValue();
  remainingItemsPropertyAnimator = v15->_remainingItemsPropertyAnimator;
  v15->_remainingItemsPropertyAnimator = (UIViewPropertyAnimator *)v50;

  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  v52 = v38;
  v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v79, v93, 16);
  if (v53)
  {
    v54 = v53;
    v55 = *(_QWORD *)v80;
    do
    {
      for (k = 0; k != v54; ++k)
      {
        if (*(_QWORD *)v80 != v55)
          objc_enumerationMutation(v52);
        objc_msgSend(v49, "_setDownAnimation:willAnimateSetDownOfDragItem:withAnimator:preview:", v15, *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * k), v15->_remainingItemsPropertyAnimator, 0);
      }
      v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v79, v93, 16);
    }
    while (v54);
  }

  itemAnimations = v15->_itemAnimations;
  v15->_itemAnimations = v77;
  v58 = v77;

  v14 = v69;
  v12 = v70;
LABEL_55:

  return v15;
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)updateVisibleDroppedItems:(id)a3
{
  id v4;
  NSArray *itemAnimations;
  id v6;
  _QWORD v7[4];
  id v8;
  _UIDragSetDownAnimation *v9;

  v4 = a3;
  itemAnimations = self->_itemAnimations;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53___UIDragSetDownAnimation_updateVisibleDroppedItems___block_invoke;
  v7[3] = &unk_1E16C4830;
  v8 = v4;
  v9 = self;
  v6 = v4;
  -[NSArray enumerateObjectsWithOptions:usingBlock:](itemAnimations, "enumerateObjectsWithOptions:usingBlock:", 2, v7);

}

- (void)updateTargetedDragPreview:(id)a3 forDragItem:(id)a4
{
  id v6;
  id v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = self->_itemAnimations;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v13, "item", (_QWORD)v15);
        v14 = (id)objc_claimAutoreleasedReturnValue();

        if (v14 == v7)
        {
          objc_msgSend(v13, "updateTargetedDropPreview:", v6);
          goto LABEL_11;
        }
      }
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_11:

}

- (void)dirtyTargetedDragPreviewForDragItem:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_itemAnimations;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v10, "item", (_QWORD)v12);
        v11 = (id)objc_claimAutoreleasedReturnValue();

        if (v11 == v4)
        {
          objc_msgSend(v10, "dirtyTargetedDropPreview");
          goto LABEL_11;
        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

}

- (void)begin
{
  void *v3;
  void *v4;
  CADisplayLink *v5;
  CADisplayLink *displayLink;
  CADisplayLink *v7;
  void *v8;
  UIViewPropertyAnimator *remainingItemsPropertyAnimator;
  NSObject *v10;
  unint64_t v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  id location[2];

  if (!self->_hasBegun)
  {
    self->_hasBegun = 1;
    if (-[NSArray count](self->_itemAnimations, "count"))
    {
      -[UIView setHidden:](self->_containerView, "setHidden:", 0);
      -[UIView _window](self->_containerView, "_window");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "screen");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_variant_has_internal_diagnostics())
      {
        if (!v4)
        {
          __UIFaultDebugAssertLog();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
          {
            LOWORD(location[0]) = 0;
            _os_log_fault_impl(&dword_185066000, v10, OS_LOG_TYPE_FAULT, "Drop animation has no associated screen", (uint8_t *)location, 2u);
          }

        }
      }
      else if (!v4)
      {
        v11 = begin___s_category;
        if (!begin___s_category)
        {
          v11 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v11, (unint64_t *)&begin___s_category);
        }
        v12 = *(NSObject **)(v11 + 8);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          LOWORD(location[0]) = 0;
          _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_ERROR, "Drop animation has no associated screen", (uint8_t *)location, 2u);
        }
      }
      objc_msgSend(v4, "displayLinkWithTarget:selector:", self, sel_updateInFlightAnimationTick_);
      v5 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
      displayLink = self->_displayLink;
      self->_displayLink = v5;

      v7 = self->_displayLink;
      objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CADisplayLink addToRunLoop:forMode:](v7, "addToRunLoop:forMode:", v8, *MEMORY[0x1E0C99860]);

      -[NSArray makeObjectsPerformSelector:](self->_itemAnimations, "makeObjectsPerformSelector:", sel_beginAnimation);
    }
    else
    {
      objc_initWeak(location, self);
      remainingItemsPropertyAnimator = self->_remainingItemsPropertyAnimator;
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __32___UIDragSetDownAnimation_begin__block_invoke;
      v13[3] = &unk_1E16B42F8;
      objc_copyWeak(&v14, location);
      -[UIViewPropertyAnimator addCompletion:](remainingItemsPropertyAnimator, "addCompletion:", v13);
      objc_destroyWeak(&v14);
      objc_destroyWeak(location);
    }
    -[UIViewPropertyAnimator addAnimations:](self->_remainingItemsPropertyAnimator, "addAnimations:", &__block_literal_global_173);
    -[UIViewPropertyAnimator startAnimation](self->_remainingItemsPropertyAnimator, "startAnimation");
  }
}

- (void)updateInFlightAnimationTick:(id)a3
{
  if (-[NSArray count](self->_itemAnimations, "count", a3))
    -[NSArray makeObjectsPerformSelector:](self->_itemAnimations, "makeObjectsPerformSelector:", sel_updateAnimationTargeting);
  else
    -[_UIDragSetDownAnimation _allItemAnimationsCompleted](self, "_allItemAnimationsCompleted");
}

- (void)previewContainerAnimationDidCompleteForDragItem:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_itemAnimations;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v10, "item", (_QWORD)v12);
        v11 = (id)objc_claimAutoreleasedReturnValue();

        if (v11 == v4)
        {
          objc_msgSend(v10, "previewContainerAnimationDidComplete");
          goto LABEL_11;
        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

}

- (void)itemAnimationReachedTarget:(id)a3
{
  NSArray *displayLink;
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
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  displayLink = self->_itemAnimations;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](displayLink, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v10 != v7)
        objc_enumerationMutation(displayLink);
      if (!objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8), "reachedTarget", (_QWORD)v9))
        break;
      if (v6 == ++v8)
      {
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](displayLink, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    -[CADisplayLink invalidate](self->_displayLink, "invalidate");
    displayLink = (NSArray *)self->_displayLink;
    self->_displayLink = 0;
  }

}

- (void)itemAnimationCompleted:(id)a3
{
  NSArray *v4;
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
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_itemAnimations;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8), "done", (_QWORD)v9))
        {

          return;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v6)
        continue;
      break;
    }
  }

  -[_UIDragSetDownAnimation _allItemAnimationsCompleted](self, "_allItemAnimationsCompleted");
}

- (void)_allItemAnimationsCompleted
{
  void (**completion)(void);
  NSArray *itemAnimations;
  UIView *containerView;
  CADisplayLink *displayLink;
  id v6;
  _UIDragSetDownAnimation *v7;

  v7 = self;
  completion = (void (**)(void))v7->_completion;
  if (completion)
    completion[2]();
  v7->_hasBegun = 0;
  -[UIView removeFromSuperview](v7->_containerView, "removeFromSuperview");
  -[UIView setHidden:](v7->_containerView, "setHidden:", 1);
  itemAnimations = v7->_itemAnimations;
  v7->_itemAnimations = 0;

  containerView = v7->_containerView;
  v7->_containerView = 0;

  -[CADisplayLink invalidate](v7->_displayLink, "invalidate");
  displayLink = v7->_displayLink;
  v7->_displayLink = 0;

  v6 = v7->_completion;
  v7->_completion = 0;

}

+ (id)defaultSetDownPropertyAnimator
{
  UISpringTimingParameters *v2;
  UIViewPropertyAnimator *v3;

  v2 = -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]([UISpringTimingParameters alloc], "initWithMass:stiffness:damping:initialVelocity:", 2.0, 300.0, 400.0, 0.0, 0.0);
  v3 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]([UIViewPropertyAnimator alloc], "initWithDuration:timingParameters:", v2, 0.91);

  return v3;
}

+ (id)defaultSingleItemAnimationForPlatterView:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD aBlock[4];
  id v8;

  v3 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __68___UIDragSetDownAnimation_defaultSingleItemAnimationForPlatterView___block_invoke;
  aBlock[3] = &unk_1E16B1B28;
  v8 = v3;
  v4 = v3;
  v5 = _Block_copy(aBlock);

  return v5;
}

+ (id)defaultMultiItemAnimationForPlatterView:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD aBlock[4];
  id v8;

  v3 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __67___UIDragSetDownAnimation_defaultMultiItemAnimationForPlatterView___block_invoke;
  aBlock[3] = &unk_1E16B1B28;
  v8 = v3;
  v4 = v3;
  v5 = _Block_copy(aBlock);

  return v5;
}

+ (id)defaultDropAnimationForPlatterView:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD aBlock[4];
  id v8;

  v3 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __62___UIDragSetDownAnimation_defaultDropAnimationForPlatterView___block_invoke;
  aBlock[3] = &unk_1E16B1B28;
  v8 = v3;
  v4 = v3;
  v5 = _Block_copy(aBlock);

  return v5;
}

- (UIWindow)coordinateContainerWindow
{
  return self->_coordinateContainerWindow;
}

- (void)setCoordinateContainerWindow:(id)a3
{
  objc_storeStrong((id *)&self->_coordinateContainerWindow, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coordinateContainerWindow, 0);
  objc_storeStrong((id *)&self->_remainingItemsPropertyAnimator, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_itemAnimations, 0);
}

@end
