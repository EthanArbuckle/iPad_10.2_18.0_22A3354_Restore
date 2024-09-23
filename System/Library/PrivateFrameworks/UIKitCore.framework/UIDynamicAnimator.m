@implementation UIDynamicAnimator

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    _UISetupPhysicsKit();
}

+ (void)_registerAnimator:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a3;
  v4 = (void *)__dynamicAnimatorsTable;
  v7 = v3;
  if (!__dynamicAnimatorsTable)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)__dynamicAnimatorsTable;
    __dynamicAnimatorsTable = v5;

    v3 = v7;
    v4 = (void *)__dynamicAnimatorsTable;
  }
  objc_msgSend(v4, "addObject:", v3);

}

+ (void)_unregisterAnimator:(id)a3
{
  void *v3;

  objc_msgSend((id)__dynamicAnimatorsTable, "removeObject:", a3);
  if (!objc_msgSend((id)__dynamicAnimatorsTable, "count"))
  {
    v3 = (void *)__dynamicAnimatorsTable;
    __dynamicAnimatorsTable = 0;

  }
}

- (void)_registerFieldCategoryForFieldBehavior:(id)a3
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!-[UIDynamicAnimator _containsBehavior:](self, "_containsBehavior:"))
  {
    v4 = -[NSMutableIndexSet lastIndex](self->_availableFieldCategories, "lastIndex");
    if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("Invalid Association"), CFSTR("UIDynamicAnimator supports a maximum of 32 distinct fields"));
    }
    else
    {
      v5 = v4;
      -[NSMutableIndexSet removeIndex:](self->_availableFieldCategories, "removeIndex:", v4);
      v6 = (1 << v5);
      objc_msgSend(v8, "_field");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setCategoryBitMask:", v6);

    }
  }

}

- (void)_unregisterFieldCategoryForFieldBehavior:(id)a3
{
  void *v4;
  unsigned int v5;
  id v6;

  v6 = a3;
  if (-[UIDynamicAnimator _containsBehavior:](self, "_containsBehavior:"))
  {
    objc_msgSend(v6, "_field");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "categoryBitMask");

    -[NSMutableIndexSet addIndex:](self->_availableFieldCategories, "addIndex:", (unint64_t)log2((double)v5));
  }

}

- (UIDynamicAnimator)initWithReferenceView:(UIView *)view
{
  UIView *v4;
  UIDynamicAnimator *v5;
  UIDynamicAnimator *v6;
  UIDynamicAnimator *v7;
  UIView *v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  id WeakRetained;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  id v18;
  id v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGSize v24;
  NSMutableSet *v25;
  NSMutableSet *registeredBehaviors;
  NSMutableArray *v27;
  NSMutableArray *topLevelBehaviors;
  NSMutableArray *v29;
  NSMutableArray *postSolverActions;
  uint64_t v31;
  NSMutableIndexSet *availableFieldCategories;
  void *v33;
  double v34;
  NSMutableDictionary *v35;
  NSMutableDictionary *bodies;
  char v37;
  objc_super v39;
  _QWORD block[4];
  UIDynamicAnimator *v41;

  v4 = view;
  v39.receiver = self;
  v39.super_class = (Class)UIDynamicAnimator;
  v5 = -[UIDynamicAnimator init](&v39, sel_init);
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    v8 = v4;
    v7->_elapsedTime = 0.0;
    v7->_ticks = 0;
    objc_storeWeak((id *)&v7->_referenceSystem, v8);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7->_referenceSystemType = 1;
      -[UIView bounds](v8, "bounds");
      v7->_referenceSystemBounds.origin.x = v9;
      v7->_referenceSystemBounds.origin.y = v10;
      v7->_referenceSystemBounds.size.width = v11;
      v7->_referenceSystemBounds.size.height = v12;
      if (v8)
        *((_QWORD *)&v8->_viewFlags + 1) |= 0x2000000000uLL;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7->_referenceSystemType = 2;
        WeakRetained = objc_loadWeakRetained((id *)&v7->_referenceSystem);
        objc_msgSend(WeakRetained, "_setDynamicAnimator:", v7);

        -[UIView _dynamicReferenceBounds](v8, "_dynamicReferenceBounds");
        v7->_referenceSystemBounds.origin.x = v14;
        v7->_referenceSystemBounds.origin.y = v15;
        v7->_referenceSystemBounds.size.width = v16;
        v7->_referenceSystemBounds.size.height = v17;
      }
      else
      {
        v7->_referenceSystemType = 0;
        v18 = objc_loadWeakRetained((id *)&v7->_referenceSystem);

        if (v18)
        {
          v19 = objc_loadWeakRetained((id *)&v7->_referenceSystem);
          objc_msgSend(v19, "bounds");
          v7->_referenceSystemBounds.origin.x = v20;
          v7->_referenceSystemBounds.origin.y = v21;
          v7->_referenceSystemBounds.size.width = v22;
          v7->_referenceSystemBounds.size.height = v23;

        }
        else
        {
          v24 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
          v7->_referenceSystemBounds.origin = (CGPoint)*MEMORY[0x1E0C9D628];
          v7->_referenceSystemBounds.size = v24;
        }
        objc_storeWeak((id *)&v7->_referenceSystem, 0);
      }
    }
    v25 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    registeredBehaviors = v7->_registeredBehaviors;
    v7->_registeredBehaviors = v25;

    v27 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    topLevelBehaviors = v7->_topLevelBehaviors;
    v7->_topLevelBehaviors = v27;

    v29 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    postSolverActions = v7->_postSolverActions;
    v7->_postSolverActions = v29;

    v31 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3788]), "initWithIndexesInRange:", 0, 32);
    availableFieldCategories = v7->_availableFieldCategories;
    v7->_availableFieldCategories = (NSMutableIndexSet *)v31;

    +[UIScreen mainScreen](UIScreen, "mainScreen");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "scale");
    v7->_accuracy = v34;

    v7->_registeredCollisionGroups = 0;
    v7->_speed = 1.0;
    v7->_debugInterval = 1;
    v35 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    bodies = v7->_bodies;
    v7->_bodies = v35;

    v7->_integralization = objc_msgSend((id)UIApp, "_isSpringBoard");
    v7->_uiUpdateSequenceItem = 0;
    if (objc_msgSend(MEMORY[0x1E0D7D330], "instancesRespondToSelector:", sel_settlingLinearVelocityThreshold))v37 = 4;
    else
      v37 = 0;
    *(_BYTE *)&v7->_stateFlags = *(_BYTE *)&v7->_stateFlags & 0xFB | v37;
    if (pthread_main_np() == 1)
    {
      +[UIDynamicAnimator _registerAnimator:](UIDynamicAnimator, "_registerAnimator:", v7);
    }
    else
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = ___commonInitWithReferenceSystem_block_invoke;
      block[3] = &unk_1E16B1B28;
      v41 = v7;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
  }

  return v6;
}

- (UIDynamicAnimator)init
{
  return -[UIDynamicAnimator initWithReferenceView:](self, "initWithReferenceView:", 0);
}

- (void)_activateUIUpdateSequenceItem
{
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  if (_UIUpdateCycleEnabled())
  {
    if (!self->_uiUpdateSequenceItem)
    {
      *(_QWORD *)&self->_lastUpdateTime = _currentModelMediaTime;
      *(_QWORD *)&self->_updateRequest.minRate = 0;
      *(unint64_t *)((char *)&self->_updateRequest.phase + 4) = 0;
      *(_QWORD *)&self->_updateRequest.maxRate = 0;
      HIDWORD(self->_updateRequest.load) = 0;
      self->_updateRequest.flags = 5;
      -[UIDynamicAnimator _configureUpdateRequestFrameRateForSettling:](self, "_configureUpdateRequestFrameRateForSettling:", 0);
      _UIUpdateRequestRegistryAddRecord((uint64_t)&mainRegistry, (int *)&self->_updateRequest, 0x100035u);
      -[UIDynamicAnimator ticker](self, "ticker");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __50__UIDynamicAnimator__activateUIUpdateSequenceItem__block_invoke;
      v5[3] = &unk_1E16B40A8;
      v6 = v3;
      v4 = v3;
      self->_uiUpdateSequenceItem = (_UIUpdateSequenceItemInternal *)_UIUpdateSequenceInsertItem(_UIUpdateSequenceCADisplayLinksItemInternal, 1, (uint64_t)"DynamicAnimator", 0, 0, v5);

    }
  }
}

void __50__UIDynamicAnimator__activateUIUpdateSequenceItem__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_uiUpdateSequenceTick:");
  objc_msgSend(*(id *)(a1 + 32), "animator");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_updateRequestedFrameRateIfNeeded");

}

- (void)_deactivateUIUpdateSequenceItem
{
  _UIUpdateSequenceItemInternal *uiUpdateSequenceItem;
  int v4;

  if (_UIUpdateCycleEnabled())
  {
    uiUpdateSequenceItem = self->_uiUpdateSequenceItem;
    if (uiUpdateSequenceItem)
    {
      v4 = *((_DWORD *)uiUpdateSequenceItem + 6);
      if ((v4 & 1) != 0)
        *((_DWORD *)uiUpdateSequenceItem + 6) = v4 | 2;
      else
        _removeItem(uiUpdateSequenceItem);
      self->_uiUpdateSequenceItem = 0;
      _UIUpdateRequestRegistryRemoveRecord((uint64_t)&mainRegistry, &self->_updateRequest.flags, 0x100035u);
    }
  }
}

- (void)_updateRequestedFrameRateIfNeeded
{
  _BOOL8 v3;

  v3 = -[UIDynamicAnimator isSettling](self, "isSettling");
  if (self->_updateRequestIsConfiguredForSettling != v3)
  {
    -[UIDynamicAnimator _configureUpdateRequestFrameRateForSettling:](self, "_configureUpdateRequestFrameRateForSettling:", v3);
    _UIUpdateRequestRegistryMutableRequestChanged((uint64_t)&mainRegistry, &self->_updateRequest);
  }
}

- (void)_configureUpdateRequestFrameRateForSettling:(BOOL)a3
{
  unsigned int v3;
  unsigned int v4;

  if (a3)
    v3 = 30;
  else
    v3 = 80;
  if (a3)
    v4 = 60;
  else
    v4 = 120;
  self->_updateRequest.minRate = v3;
  self->_updateRequest.preferredRate = v4;
  self->_updateRequest.maxRate = v4;
  self->_updateRequestIsConfiguredForSettling = a3;
}

- (void)dealloc
{
  id WeakRetained;
  unint64_t referenceSystemType;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  id v13;
  _QWORD *v14;
  objc_super v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_storeWeak((id *)&self->_delegate, 0);
  -[UIDynamicAnimator removeAllBehaviors](self, "removeAllBehaviors");
  +[UIDynamicAnimator _unregisterAnimator:](UIDynamicAnimator, "_unregisterAnimator:", self);
  if (_UIUpdateCycleEnabled())
  {
    -[UIDynamicAnimator _deactivateUIUpdateSequenceItem](self, "_deactivateUIUpdateSequenceItem");
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_displaylink);
    objc_msgSend(WeakRetained, "invalidate");

  }
  referenceSystemType = self->_referenceSystemType;
  if (referenceSystemType != 1)
  {
    if (referenceSystemType == 2)
    {
      v5 = objc_loadWeakRetained((id *)&self->_referenceSystem);
      objc_msgSend(v5, "_setDynamicAnimator:", 0);

    }
    goto LABEL_22;
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = (id)__dynamicAnimatorsTable;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (!v7)
  {

LABEL_19:
    v14 = objc_loadWeakRetained((id *)&self->_referenceSystem);
    if (v14)
      v14[14] &= ~0x2000000000uLL;

    goto LABEL_22;
  }
  v8 = v7;
  v9 = 0;
  v10 = *(_QWORD *)v17;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v17 != v10)
        objc_enumerationMutation(v6);
      objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "referenceView");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      v13 = objc_loadWeakRetained((id *)&self->_referenceSystem);

      if (v12 == v13)
        ++v9;
    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  }
  while (v8);

  if (!v9)
    goto LABEL_19;
LABEL_22:
  v15.receiver = self;
  v15.super_class = (Class)UIDynamicAnimator;
  -[UIDynamicAnimator dealloc](&v15, sel_dealloc);
}

+ (void)_referenceViewSizeChanged:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (__dynamicAnimatorsTable)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = (id)__dynamicAnimatorsTable;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
          objc_msgSend(v9, "referenceView", (_QWORD)v11);
          v10 = (id)objc_claimAutoreleasedReturnValue();

          if (v10 == v3)
            objc_msgSend(v9, "_tickle");
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }

  }
}

+ (void)_clearReferenceViewFromAnimators:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (__dynamicAnimatorsTable)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = (id)__dynamicAnimatorsTable;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
          objc_msgSend(v9, "referenceView", (_QWORD)v11);
          v10 = (id)objc_claimAutoreleasedReturnValue();

          if (v10 == v3)
            objc_msgSend(v9, "_clearReferenceView");
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }

  }
}

+ (id)_allDynamicAnimators
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (id)__dynamicAnimatorsTable;
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
        objc_msgSend(v2, "addObject:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7++), (_QWORD)v9);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  return v2;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v13.receiver = self;
  v13.super_class = (Class)UIDynamicAnimator;
  -[UIDynamicAnimator description](&v13, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[UIDynamicAnimator isRunning](self, "isRunning"))
    objc_msgSend(v5, "appendString:", CFSTR(" Stopped"));
  -[UIDynamicAnimator elapsedTime](self, "elapsedTime");
  objc_msgSend(v5, "appendFormat:", CFSTR(" (%fs)"), v6);
  -[UIDynamicAnimator _referenceSystem](self, "_referenceSystem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDynamicAnimator _referenceSystem](self, "_referenceSystem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCGRect(self->_referenceSystemBounds);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR(" in <%@: %p> %@"), v9, v10, v11);

  return v5;
}

- (id)recursiveDescription
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD aBlock[4];
  id v10;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDynamicAnimator description](self, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  objc_msgSend(v3, "appendString:", CFSTR("\n"));
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __41__UIDynamicAnimator_recursiveDescription__block_invoke;
  aBlock[3] = &unk_1E16C4938;
  v5 = v3;
  v10 = v5;
  v6 = _Block_copy(aBlock);
  -[UIDynamicAnimator _traverseBehaviorHierarchy:](self, "_traverseBehaviorHierarchy:", v6);
  v7 = v5;

  return v7;
}

void __41__UIDynamicAnimator_recursiveDescription__block_invoke(uint64_t a1, void *a2, int a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  if (a3 >= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    do
    {
      objc_msgSend(v5, "appendString:", CFSTR(" | "));
      --a3;
    }
    while (a3);
    objc_msgSend(*(id *)(a1 + 32), "appendString:", v5);

  }
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v8, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:", v7);

  objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
}

- (double)_ptmRatio
{
  float v2;

  PKGet_PTM_RATIO();
  return v2;
}

- (void)addBehavior:(UIDynamicBehavior *)behavior
{
  UIDynamicBehavior *v4;
  char v5;
  UIDynamicBehavior *v6;

  v4 = behavior;
  if (v4)
  {
    v6 = v4;
    v5 = -[NSMutableArray containsObject:](self->_topLevelBehaviors, "containsObject:", v4);
    v4 = v6;
    if ((v5 & 1) == 0)
    {
      -[UIDynamicAnimator _checkBehavior:](self, "_checkBehavior:", v6);
      -[NSMutableArray addObject:](self->_topLevelBehaviors, "addObject:", v6);
      -[UIDynamicAnimator _registerBehavior:](self, "_registerBehavior:", v6);
      v4 = v6;
    }
  }

}

- (void)removeBehavior:(UIDynamicBehavior *)behavior
{
  UIDynamicBehavior *v4;
  int v5;
  UIDynamicBehavior *v6;

  v4 = behavior;
  if (v4)
  {
    v6 = v4;
    v5 = -[NSMutableArray containsObject:](self->_topLevelBehaviors, "containsObject:", v4);
    v4 = v6;
    if (v5)
    {
      -[NSMutableArray removeObject:](self->_topLevelBehaviors, "removeObject:", v6);
      -[UIDynamicAnimator _unregisterBehavior:](self, "_unregisterBehavior:", v6);
      v4 = v6;
    }
  }

}

- (void)_checkBehavior:(id)a3
{
  id v4;

  v4 = a3;
  if (-[NSMutableSet containsObject:](self->_registeredBehaviors, "containsObject:"))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Adding the same behavior twice to the same animator is not supported %@"), v4);

}

- (BOOL)_containsBehavior:(id)a3
{
  return -[NSMutableSet containsObject:](self->_registeredBehaviors, "containsObject:", a3);
}

- (void)_registerBehavior:(id)a3
{
  id v4;
  NSMutableSet *behaviorsToAdd;
  void *v6;
  void *v7;
  NSMutableSet *v8;
  NSMutableSet *v9;
  _QWORD aBlock[5];
  uint64_t v11;
  int *v12;
  uint64_t v13;
  int v14;

  v4 = a3;
  if (self->_isInWorldStepMethod)
  {
    if (-[NSMutableSet containsObject:](self->_behaviorsToRemove, "containsObject:", v4))
      -[NSMutableSet removeObject:](self->_behaviorsToRemove, "removeObject:", v4);
    if ((-[NSMutableSet containsObject:](self->_registeredBehaviors, "containsObject:", v4) & 1) == 0)
    {
      behaviorsToAdd = self->_behaviorsToAdd;
      if (behaviorsToAdd)
      {
        -[NSMutableSet addObject:](behaviorsToAdd, "addObject:", v4);
      }
      else
      {
        v8 = (NSMutableSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:", v4, 0);
        v9 = self->_behaviorsToAdd;
        self->_behaviorsToAdd = v8;

      }
    }
  }
  else
  {
    if (!self->_world)
      -[UIDynamicAnimator _setupWorld](self, "_setupWorld");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[UIDynamicAnimator _registerFieldCategoryForFieldBehavior:](self, "_registerFieldCategoryForFieldBehavior:", v4);
    objc_msgSend(v4, "_setContext:", self);
    objc_msgSend(v4, "willMoveToAnimator:", self);
    objc_msgSend(v4, "_associate");
    -[NSMutableSet addObject:](self->_registeredBehaviors, "addObject:", v4);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[UIDynamicAnimator _shouldReevaluateLocalBehaviors](self, "_shouldReevaluateLocalBehaviors");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = 0;
      v12 = (int *)&v11;
      v13 = 0x2020000000;
      v14 = 0;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __39__UIDynamicAnimator__registerBehavior___block_invoke;
      aBlock[3] = &unk_1E16C4960;
      aBlock[4] = &v11;
      v6 = _Block_copy(aBlock);
      -[UIDynamicAnimator _traverseBehaviorHierarchy:](self, "_traverseBehaviorHierarchy:", v6);
      if (v12[6] >= 2)
        NSLog(CFSTR("Multiple gravity behavior per animator is undefined and may assert in the future"));

      _Block_object_dispose(&v11, 8);
    }
    if (self->_registeredCollisionGroups >= 1)
    {
      -[PKExtendedPhysicsWorld contactDelegate](self->_world, "contactDelegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
        -[PKExtendedPhysicsWorld setContactDelegate:](self->_world, "setContactDelegate:", self);
    }
    -[UIDynamicAnimator _tickle](self, "_tickle");
  }

}

void __39__UIDynamicAnimator__registerBehavior___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  char isKindOfClass;

  v3 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
}

- (void)_unregisterBehavior:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSMutableSet *behaviorsToRemove;
  NSMutableSet *v8;
  NSMutableSet *v9;
  void *v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v10 = v4;
    if (!self->_isInWorldStepMethod)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[UIDynamicAnimator _unregisterFieldCategoryForFieldBehavior:](self, "_unregisterFieldCategoryForFieldBehavior:", v10);
      objc_msgSend(v10, "_dissociate");
      objc_msgSend(v10, "_setContext:", 0);
      objc_msgSend(v10, "willMoveToAnimator:", 0);
      -[NSMutableSet removeObject:](self->_registeredBehaviors, "removeObject:", v10);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[UIDynamicAnimator _shouldReevaluateLocalBehaviors](self, "_shouldReevaluateLocalBehaviors");
      if (!self->_registeredCollisionGroups)
        -[PKExtendedPhysicsWorld setContactDelegate:](self->_world, "setContactDelegate:", 0);
      -[UIDynamicAnimator _tickle](self, "_tickle");
      goto LABEL_16;
    }
    if (-[NSMutableSet containsObject:](self->_behaviorsToAdd, "containsObject:", v4))
      -[NSMutableSet removeObject:](self->_behaviorsToAdd, "removeObject:", v10);
    v6 = -[NSMutableSet containsObject:](self->_registeredBehaviors, "containsObject:", v10);
    v5 = v10;
    if (v6)
    {
      behaviorsToRemove = self->_behaviorsToRemove;
      if (behaviorsToRemove)
      {
        -[NSMutableSet addObject:](behaviorsToRemove, "addObject:", v10);
      }
      else
      {
        v8 = (NSMutableSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithObjects:", v10, 0);
        v9 = self->_behaviorsToRemove;
        self->_behaviorsToRemove = v8;

      }
LABEL_16:
      v5 = v10;
    }
  }

}

- (void)didBeginContact:(id)a3
{
  id v4;
  NSMutableArray *beginContacts;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  beginContacts = self->_beginContacts;
  v8 = v4;
  if (!beginContacts)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_beginContacts;
    self->_beginContacts = v6;

    v4 = v8;
    beginContacts = self->_beginContacts;
  }
  -[NSMutableArray addObject:](beginContacts, "addObject:", v4);

}

- (void)didEndContact:(id)a3
{
  id v4;
  NSMutableArray *endContacts;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  endContacts = self->_endContacts;
  v8 = v4;
  if (!endContacts)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_endContacts;
    self->_endContacts = v6;

    v4 = v8;
    endContacts = self->_endContacts;
  }
  -[NSMutableArray addObject:](endContacts, "addObject:", v4);

}

- (void)_reportBeginContacts
{
  void *v3;
  NSMutableArray *beginContacts;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __41__UIDynamicAnimator__reportBeginContacts__block_invoke;
  aBlock[3] = &unk_1E16C4938;
  aBlock[4] = self;
  v3 = _Block_copy(aBlock);
  -[UIDynamicAnimator _traverseBehaviorHierarchy:](self, "_traverseBehaviorHierarchy:", v3);
  beginContacts = self->_beginContacts;
  self->_beginContacts = 0;

}

void __41__UIDynamicAnimator__reportBeginContacts__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = *(id *)(*(_QWORD *)(a1 + 32) + 136);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8);
          v10 = v3;
          objc_msgSend(v10, "collisionDelegate", (_QWORD)v12);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
            objc_msgSend(v10, "_didBeginContact:", v9);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }

  }
}

- (void)_reportEndContacts
{
  void *v3;
  NSMutableArray *endContacts;
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __39__UIDynamicAnimator__reportEndContacts__block_invoke;
  aBlock[3] = &unk_1E16C4938;
  aBlock[4] = self;
  v3 = _Block_copy(aBlock);
  -[UIDynamicAnimator _traverseBehaviorHierarchy:](self, "_traverseBehaviorHierarchy:", v3);
  endContacts = self->_endContacts;
  self->_endContacts = 0;

}

void __39__UIDynamicAnimator__reportEndContacts__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = *(id *)(*(_QWORD *)(a1 + 32) + 144);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8);
          v10 = v3;
          objc_msgSend(v10, "collisionDelegate", (_QWORD)v12);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
            objc_msgSend(v10, "_didEndContact:", v9);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }

  }
}

- (void)_shouldReevaluateLocalBehaviors
{
  self->_needsLocalBehaviorReevaluation = 1;
  -[UIDynamicAnimator _tickle](self, "_tickle");
}

- (void)_evaluateLocalBehaviors
{
  -[UIDynamicAnimator _traverseBehaviorHierarchy:](self, "_traverseBehaviorHierarchy:", &__block_literal_global_175);
}

uint64_t __44__UIDynamicAnimator__evaluateLocalBehaviors__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_reevaluate:", 0);
}

- (void)_reevaluateImplicitBounds
{
  -[UIDynamicAnimator _traverseBehaviorHierarchy:](self, "_traverseBehaviorHierarchy:", &__block_literal_global_45);
  -[UIDynamicAnimator _tickle](self, "_tickle");
}

uint64_t __46__UIDynamicAnimator__reevaluateImplicitBounds__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_reevaluate:", 1);
}

- (void)_registerImplicitBounds
{
  ++self->_registeredImplicitBounds;
}

- (void)_unregisterImplicitBounds
{
  --self->_registeredImplicitBounds;
}

- (void)_traverseBehaviorHierarchy:(id)a3
{
  id v4;
  id v5;
  void (**v6)(void *, _QWORD, uint64_t);
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _QWORD aBlock[4];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2050000000;
  v21 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__UIDynamicAnimator__traverseBehaviorHierarchy___block_invoke;
  aBlock[3] = &unk_1E16C49A8;
  v5 = v4;
  v16 = v5;
  v17 = &v18;
  v6 = (void (**)(void *, _QWORD, uint64_t))_Block_copy(aBlock);
  v19[3] = (uint64_t)v6;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[UIDynamicAnimator behaviors](self, "behaviors", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v22, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v7);
        v6[2](v6, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), 1);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v11, v22, 16);
    }
    while (v8);
  }

  _Block_object_dispose(&v18, 8);
}

void __48__UIDynamicAnimator__traverseBehaviorHierarchy___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(v3, "childBehaviors", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) + 16))();
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)removeAllBehaviors
{
  NSMutableSet *behaviorsToRemove;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSMutableSet *v11;
  NSMutableSet *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (self->_isInWorldStepMethod)
  {
    behaviorsToRemove = self->_behaviorsToRemove;
    if (behaviorsToRemove)
    {
      -[NSMutableSet unionSet:](behaviorsToRemove, "unionSet:", self->_registeredBehaviors);
    }
    else
    {
      v11 = (NSMutableSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithSet:", self->_registeredBehaviors);
      v12 = self->_behaviorsToRemove;
      self->_behaviorsToRemove = v11;

    }
  }
  else
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithSet:", self->_registeredBehaviors);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          objc_msgSend(v10, "_dissociate", (_QWORD)v13);
          objc_msgSend(v10, "_setContext:", 0);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            -[UIDynamicAnimator _unregisterFieldCategoryForFieldBehavior:](self, "_unregisterFieldCategoryForFieldBehavior:", v10);
          objc_msgSend(v10, "willMoveToAnimator:", 0);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

    -[NSMutableArray removeAllObjects](self->_topLevelBehaviors, "removeAllObjects");
    -[NSMutableSet removeAllObjects](self->_registeredBehaviors, "removeAllObjects");

  }
}

- (NSTimeInterval)elapsedTime
{
  return self->_elapsedTime;
}

- (NSArray)behaviors
{
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", self->_topLevelBehaviors);
}

- (int)_registerCollisionGroup
{
  int v2;

  v2 = self->_registeredCollisionGroups + 1;
  self->_registeredCollisionGroups = v2;
  return v2;
}

- (void)_unregisterCollisionGroup
{
  --self->_registeredCollisionGroups;
}

- (void)_setAnimatorIntegralization:(unint64_t)a3
{
  self->_integralization = a3;
}

- (unint64_t)_animatorIntegralization
{
  return self->_integralization;
}

- (void)_defaultMapper:(id)a3 position:(CGPoint)a4 angle:(double)a5 itemType:(unint64_t)a6
{
  double y;
  double x;
  id v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  unint64_t integralization;
  uint64_t v17;
  _BYTE *v18;
  CGAffineTransform *v19;
  double v20;
  double accuracy;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  _BYTE v28[48];
  _BYTE v29[48];

  y = a4.y;
  x = a4.x;
  v11 = a3;
  if (a6 == 1 && self->_referenceSystemType == 1)
  {
    -[UIDynamicAnimator referenceView](self, "referenceView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "superview");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "convertPoint:toView:", v13, x, y);
    x = v14;
    y = v15;

  }
  integralization = self->_integralization;
  v17 = 1;
  if (!a6)
    v17 = 2;
  if (!integralization)
    integralization = v17;
  switch(integralization)
  {
    case 4uLL:
      accuracy = self->_accuracy;
      if (accuracy == 1.0)
      {
        x = round(x);
      }
      else
      {
        v22 = floor(x);
        x = v22 + round((x - v22) * accuracy) / accuracy;
      }
      goto LABEL_23;
    case 3uLL:
      v23 = self->_accuracy;
      if (v23 != 1.0)
      {
LABEL_19:
        v25 = floor(y);
        y = v25 + round((y - v25) * v23) / v23;
        goto LABEL_23;
      }
      break;
    case 2uLL:
      objc_msgSend(v11, "setCenter:", x, y);
      v18 = v29;
      v19 = (CGAffineTransform *)v29;
      v20 = a5;
      goto LABEL_27;
    default:
      v23 = self->_accuracy;
      if (v23 != 1.0)
      {
        v24 = floor(x);
        x = v24 + round((x - v24) * v23) / v23;
        goto LABEL_19;
      }
      x = round(x);
      break;
  }
  y = round(y);
LABEL_23:
  objc_msgSend(v11, "center");
  if (v27 != x || v26 != y)
    objc_msgSend(v11, "setCenter:", x, y);
  v20 = round(a5 * 5000.0) / 5000.0;
  v18 = v28;
  v19 = (CGAffineTransform *)v28;
LABEL_27:
  CGAffineTransformMakeRotation(v19, v20);
  objc_msgSend(v11, "setTransform:", v18);

}

- (void)_unregisterBodyForItem:(id)a3 action:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  const __CFString *v8;
  NSMutableDictionary *bodies;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (self->_referenceSystemType != 2)
      goto LABEL_8;
    v8 = CFSTR("Can't use view as item (%@) in an animator with layout reference %@");
  }
  else
  {
    if (self->_referenceSystemType != 1)
      goto LABEL_8;
    v8 = CFSTR("Can't use layout attributes as item (%@) in an animator with view reference %@");
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], v8, v6, self);
LABEL_8:
  bodies = self->_bodies;
  -[UIDynamicAnimator _keyForItem:](self, "_keyForItem:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](bodies, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "representedObject");
    v12 = (id)objc_claimAutoreleasedReturnValue();

    if (v12 != v6)
      NSLog(CFSTR("%@: body %@ without representedObject for item %@"), self, v11, v6);
    if (objc_msgSend(v11, "dissociate"))
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __51__UIDynamicAnimator__unregisterBodyForItem_action___block_invoke;
      v13[3] = &unk_1E16B47A8;
      v13[4] = self;
      v14 = v11;
      v15 = v6;
      -[UIDynamicAnimator _runBlockPostSolverIfNeeded:](self, "_runBlockPostSolverIfNeeded:", v13);

    }
    else if (v7)
    {
      v7[2](v7, v11);
    }
  }

}

uint64_t __51__UIDynamicAnimator__unregisterBodyForItem_action___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "_world");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeBody:", *(_QWORD *)(a1 + 40));

  v3 = *(_QWORD **)(a1 + 32);
  v4 = (void *)v3[10];
  objc_msgSend(v3, "_keyForItem:", *(_QWORD *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectForKey:", v5);

  return objc_msgSend(*(id *)(a1 + 32), "_tickle");
}

- (NSArray)itemsInRect:(CGRect)rect
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;

  height = rect.size.height;
  width = rect.size.width;
  y = rect.origin.y;
  x = rect.origin.x;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIDynamicAnimator _world](self, "_world");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __33__UIDynamicAnimator_itemsInRect___block_invoke;
  v12[3] = &unk_1E16C49D0;
  v10 = v8;
  v13 = v10;
  objc_msgSend(v9, "enumerateBodiesInRect:usingBlock:", v12, x, y, width, height);

  return (NSArray *)v10;
}

void __33__UIDynamicAnimator_itemsInRect___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "representedObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    v3 = v4;
  }

}

- (UICollectionViewLayoutAttributes)layoutAttributesForSupplementaryViewOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
  void *v5;
  void *v6;
  void *v7;

  if (self->_referenceSystemType == 2)
  {
    +[_UICollectionViewItemKey collectionItemKeyForSupplementaryViewOfKind:andIndexPath:]((uint64_t)_UICollectionViewItemKey, kind, indexPath);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_bodies, "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "representedObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return (UICollectionViewLayoutAttributes *)v7;
}

- (UICollectionViewLayoutAttributes)layoutAttributesForDecorationViewOfKind:(NSString *)decorationViewKind atIndexPath:(NSIndexPath *)indexPath
{
  void *v5;
  void *v6;
  void *v7;

  if (self->_referenceSystemType == 2)
  {
    +[_UICollectionViewItemKey collectionItemKeyForDecorationViewOfKind:andIndexPath:]((uint64_t)_UICollectionViewItemKey, decorationViewKind, indexPath);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_bodies, "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "representedObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return (UICollectionViewLayoutAttributes *)v7;
}

- (UICollectionViewLayoutAttributes)layoutAttributesForCellAtIndexPath:(NSIndexPath *)indexPath
{
  void *v4;
  void *v5;
  void *v6;

  if (self->_referenceSystemType == 2)
  {
    +[_UICollectionViewItemKey collectionItemKeyForCellWithIndexPath:]((uint64_t)_UICollectionViewItemKey, indexPath);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_bodies, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "representedObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (UICollectionViewLayoutAttributes *)v6;
}

- (void)updateItemUsingCurrentState:(id)item
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  char v16;
  long double v17;
  long double v18;
  double v19;
  double v20;
  double v21;
  unint64_t integralization;
  uint64_t v23;
  double accuracy;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
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
  _BOOL4 v56;
  __int128 __x;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;

  v4 = item;
  -[UIDynamicAnimator _bodyForItem:](self, "_bodyForItem:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_50;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    v16 = objc_opt_isKindOfClass() ^ 1;
    goto LABEL_8;
  }
  if (self->_referenceSystemType != 1)
  {
    v16 = 0;
LABEL_8:
    objc_msgSend(v4, "center");
    v13 = v19;
    v15 = v20;
    if (!v4)
      goto LABEL_5;
LABEL_9:
    objc_msgSend(v4, "transform");
    v18 = *((double *)&v60 + 1);
    objc_msgSend(v4, "transform");
    v17 = *(double *)&__x;
    goto LABEL_10;
  }
  -[UIDynamicAnimator referenceView](self, "referenceView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "center");
  v8 = v7;
  v10 = v9;
  objc_msgSend(v4, "superview");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convertPoint:fromView:", v11, v8, v10);
  v13 = v12;
  v15 = v14;

  v16 = 0;
  if (v4)
    goto LABEL_9;
LABEL_5:
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  __x = 0u;
  v58 = 0u;
  v17 = 0.0;
  v18 = 0.0;
LABEL_10:
  v21 = atan2(v18, v17);
  integralization = self->_integralization;
  v23 = 1;
  if ((v16 & 1) != 0)
    v23 = 2;
  if (!integralization)
    integralization = v23;
  switch(integralization)
  {
    case 4uLL:
      accuracy = self->_accuracy;
      objc_msgSend(v5, "position");
      if (accuracy == 1.0)
      {
        v28 = round(v25);
      }
      else
      {
        v26 = floor(v25);
        objc_msgSend(v5, "position");
        v28 = v26 + round(self->_accuracy * (v27 - v26)) / self->_accuracy;
      }
      objc_msgSend(v5, "position", __x, v58, v59, v60, v61, v62);
      v35 = v41;
      v42 = self->_accuracy;
      if (v42 == 1.0)
      {
        v44 = round(v13);
      }
      else
      {
        v43 = floor(v13);
        v44 = v43 + round((v13 - v43) * v42) / v42;
      }
      v46 = v15;
      break;
    case 3uLL:
      objc_msgSend(v5, "position");
      v28 = v29;
      v30 = self->_accuracy;
      objc_msgSend(v5, "position");
      if (v30 == 1.0)
      {
        v35 = round(v31);
        v34 = self->_accuracy;
      }
      else
      {
        v32 = floor(v31);
        objc_msgSend(v5, "position");
        v34 = self->_accuracy;
        v35 = v32 + round(v34 * (v33 - v32)) / v34;
      }
      if (v34 == 1.0)
      {
        v46 = round(v15);
      }
      else
      {
        v45 = floor(v15);
        v46 = v45 + round((v15 - v45) * v34) / v34;
      }
      v44 = v13;
      break;
    case 2uLL:
      objc_msgSend(v5, "setPosition:", v13, v15);
      objc_msgSend(v5, "setRotation:", v21);
LABEL_49:
      objc_msgSend(v5, "setResting:", 0, (_QWORD)__x);
      -[UIDynamicAnimator _tickle](self, "_tickle");
      goto LABEL_50;
    default:
      v36 = self->_accuracy;
      objc_msgSend(v5, "position");
      if (v36 == 1.0)
      {
        v28 = round(v37);
        v40 = self->_accuracy;
      }
      else
      {
        v38 = floor(v37);
        objc_msgSend(v5, "position");
        v40 = self->_accuracy;
        v28 = v38 + round(v40 * (v39 - v38)) / v40;
      }
      objc_msgSend(v5, "position", __x, v58, v59, v60, v61, v62);
      if (v40 == 1.0)
      {
        v35 = round(v47);
        v50 = self->_accuracy;
      }
      else
      {
        v48 = floor(v47);
        objc_msgSend(v5, "position");
        v50 = self->_accuracy;
        v35 = v48 + round(v50 * (v49 - v48)) / v50;
      }
      if (v50 == 1.0)
      {
        v44 = round(v13);
        v46 = round(v15);
      }
      else
      {
        v51 = floor(v13);
        v44 = v51 + round((v13 - v51) * v50) / v50;
        v52 = floor(v15);
        v46 = v52 + round((v15 - v52) * v50) / v50;
      }
      break;
  }
  objc_msgSend(v5, "rotation", (_QWORD)__x);
  v54 = round(v53 * 5000.0) / 5000.0;
  v55 = round(v21 * 5000.0) / 5000.0;
  v56 = v35 != v46 || v28 != v44;
  if (v54 == v55)
  {
    objc_msgSend(v5, "setRotation:", v21);
    if (!v56)
      goto LABEL_49;
    goto LABEL_48;
  }
  if (v56)
  {
LABEL_48:
    objc_msgSend(v5, "setPosition:", v13, v15);
    goto LABEL_49;
  }
LABEL_50:

}

- (id)_newBodyForItem:(id)a3 inItemGroup:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  uint64_t v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  uint64_t v47;
  id v48;
  void *v49;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v54;
  double v55;
  double v56;
  id v58;
  _OWORD v59[3];
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  uint64_t v65;
  CGRect v66;
  CGRect v67;

  v65 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (_dynamicItemTypeForItem(v6) == 1)
  {
    v8 = v6;
    v9 = v8;
    v58 = v6;
    if (self->_referenceSystemType == 1)
    {
      -[UIDynamicAnimator referenceView](self, "referenceView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isDescendantOfView:", v10);

      if ((v11 & 1) == 0)
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("View item (%@) should be a descendant of reference view in %@"), v9, self);
      -[UIDynamicAnimator referenceView](self, "referenceView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "center");
      v14 = v13;
      v16 = v15;
      objc_msgSend(v9, "superview");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "convertPoint:fromView:", v17, v14, v16);
      v19 = v18;
      v21 = v20;

    }
    else
    {
      objc_msgSend(v8, "center");
      v19 = v24;
      v21 = v25;
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "superview");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraints");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v29 = v28;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v61;
      do
      {
        for (i = 0; i != v31; ++i)
        {
          if (*(_QWORD *)v61 != v32)
            objc_enumerationMutation(v29);
          v34 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (v34)
            {
              v35 = (id)objc_msgSend((id)objc_msgSend(v34, "firstItem"), "_referenceView");
              if (v35 != v9)
              {
                v36 = v35;
                v37 = (void *)objc_msgSend((id)objc_msgSend(v34, "secondItem"), "_referenceView");
LABEL_17:
                v38 = v37;

                if (v38 != v9)
                  continue;
LABEL_21:
                objc_msgSend(v26, "addObject:", v34);
                continue;
              }
            }
            else
            {
              v36 = 0;
              v37 = 0;
              if (v9)
                goto LABEL_17;
            }

            goto LABEL_21;
          }
        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
      }
      while (v31);
    }

    if (objc_msgSend(v26, "count"))
    {
      objc_msgSend(v9, "superview");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "removeConstraints:", v26);

      objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
      objc_msgSend(v9, "_setHostsLayoutEngine:", 1);
    }

    v6 = v58;
  }
  else
  {
    objc_msgSend(v6, "center");
    v19 = v22;
    v21 = v23;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v40 = objc_msgSend(v6, "collisionBoundsType");
    if (v7)
    {
LABEL_29:
      objc_msgSend(v7, "center");
      v42 = v19 - v41;
      v44 = v21 - v43;
      goto LABEL_32;
    }
  }
  else
  {
    v40 = 0;
    if (v7)
      goto LABEL_29;
  }
  v42 = *MEMORY[0x1E0C9D538];
  v44 = *(double *)(MEMORY[0x1E0C9D538] + 8);
LABEL_32:
  if (v40 == 2)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("UIDynamicItem (%@) MUST implement -[UIDynamicItem boundingPath] when specifying a collision bounds of UIDynamicItemCollisionBoundsPath"), v6);
    objc_msgSend(v6, "collisionBoundingPath");
    v48 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    +[PKExtendedPhysicsBody bodyWithPolygonFromPath:](PKExtendedPhysicsBody, "bodyWithPolygonFromPath:", objc_msgSend(v48, "CGPath"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v49)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("UIDynamicItem (%@) provided an invalid bounding path"), v6);
  }
  else
  {
    if (v40 == 1)
    {
      objc_msgSend(v6, "bounds");
      x = v66.origin.x;
      y = v66.origin.y;
      width = v66.size.width;
      height = v66.size.height;
      v54 = CGRectGetWidth(v66);
      v67.origin.x = x;
      v67.origin.y = y;
      v67.size.width = width;
      v67.size.height = height;
      v55 = CGRectGetHeight(v67);
      objc_msgSend(v6, "bounds");
      if (v54 == v55)
        +[PKExtendedPhysicsBody bodyWithCircleOfRadius:](PKExtendedPhysicsBody, "bodyWithCircleOfRadius:", v56 * 0.5);
      else
        +[PKExtendedPhysicsBody bodyWithEllipseInRect:](PKExtendedPhysicsBody, "bodyWithEllipseInRect:");
      v47 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v40)
      {
        v49 = 0;
        goto LABEL_46;
      }
      objc_msgSend(v6, "bounds");
      +[PKExtendedPhysicsBody bodyWithRectangleOfSize:center:](PKExtendedPhysicsBody, "bodyWithRectangleOfSize:center:", v45, v46, v42, v44);
      v47 = objc_claimAutoreleasedReturnValue();
    }
    v49 = (void *)v47;
  }
LABEL_46:
  objc_msgSend(v49, "setRepresentedObject:", v6);
  if (v6)
    objc_msgSend(v6, "transform");
  else
    memset(v59, 0, sizeof(v59));
  _setupBodyWithCenterAndTransform(v49, (long double *)v59, v19, v21);

  return v49;
}

- (id)_registerBodyForItem:(id)a3
{
  id v5;
  void *v6;
  unint64_t referenceSystemType;
  const __CFString *v8;
  NSMutableDictionary *bodies;
  void *v10;
  void *v11;
  id v12;
  id v13;
  double v14;
  double v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  id v22;
  id v23;
  double v24;
  double v25;
  double v26;
  double v27;
  id v28;
  NSMutableDictionary *v29;
  void *v30;
  void *v32;
  CGFloat v33;
  CGFloat v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  id v38[2];
  id location;
  _OWORD v40[3];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;
  CGSize v47;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)_dynamicItemTypeForItem(v5);
  referenceSystemType = self->_referenceSystemType;
  if (v6 == (void *)2)
  {
    if (referenceSystemType != 1)
      goto LABEL_7;
    v8 = CFSTR("Can't use layout attributes as item (%@) in an animator with view reference %@");
  }
  else
  {
    if (referenceSystemType != 2)
      goto LABEL_7;
    v8 = CFSTR("Can't use view as item (%@) in an animator with layout reference %@");
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], v8, v5, self);
LABEL_7:
  bodies = self->_bodies;
  -[UIDynamicAnimator _keyForItem:](self, "_keyForItem:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](bodies, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "representedObject");
    v12 = (id)objc_claimAutoreleasedReturnValue();

    if (v12 != v5)
      NSLog(CFSTR("%@: body %@ without representedObject for item %@"), self, v11, v5);
    objc_msgSend(v11, "associate");
    v13 = v11;
  }
  else
  {
    objc_msgSend(v5, "bounds");
    if (v14 == 0.0 || (objc_msgSend(v5, "bounds"), v15 == 0.0))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bounds");
      v47.width = v33;
      v47.height = v34;
      NSStringFromCGSize(v47);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDynamicAnimator.m"), 959, CFSTR("Invalid size %@ for item %@ in Dynamics"), v35, v5);

    }
    if (v6 == (void *)3)
    {
      v16 = v5;
      v17 = (void *)objc_opt_new();
      objc_msgSend(v16, "items");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      if (v19)
      {
        v20 = *(_QWORD *)v42;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v42 != v20)
              objc_enumerationMutation(v18);
            v22 = -[UIDynamicAnimator _newBodyForItem:inItemGroup:](self, "_newBodyForItem:inItemGroup:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i), v16);
            objc_msgSend(v17, "addObject:", v22);

          }
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
        }
        while (v19);
      }
      +[PKExtendedPhysicsBody bodyWithBodies:](PKExtendedPhysicsBody, "bodyWithBodies:", v17);
      v23 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setRepresentedObject:", v16);
      objc_msgSend(v16, "center");
      v25 = v24;
      v27 = v26;
      if (v16)
        objc_msgSend(v16, "transform");
      else
        memset(v40, 0, sizeof(v40));
      _setupBodyWithCenterAndTransform(v23, (long double *)v40, v25, v27);

    }
    else
    {
      v23 = -[UIDynamicAnimator _newBodyForItem:inItemGroup:](self, "_newBodyForItem:inItemGroup:", v5, 0);
    }
    objc_msgSend(v23, "associate");
    objc_initWeak(&location, self);
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __42__UIDynamicAnimator__registerBodyForItem___block_invoke;
    v36[3] = &unk_1E16C49F8;
    objc_copyWeak(v38, &location);
    v28 = v5;
    v37 = v28;
    v38[1] = v6;
    objc_msgSend(v23, "setPostStepBlock:", v36);
    -[PKExtendedPhysicsWorld addBody:](self->_world, "addBody:", v23);
    v29 = self->_bodies;
    -[UIDynamicAnimator _keyForItem:](self, "_keyForItem:", v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v29, "setObject:forKey:", v23, v30);

    -[UIDynamicAnimator _tickle](self, "_tickle");
    v13 = v23;

    objc_destroyWeak(v38);
    objc_destroyWeak(&location);
  }

  return v13;
}

void __42__UIDynamicAnimator__registerBodyForItem___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "position");
  v7 = v6;
  v9 = v8;
  objc_msgSend(v4, "rotation");
  v11 = v10;

  objc_msgSend(WeakRetained, "_defaultMapper:position:angle:itemType:", v5, *(_QWORD *)(a1 + 48), v7, v9, v11);
}

- (id)_keyForItem:(id)a3
{
  if (self->_referenceSystemType == 2)
    +[_UICollectionViewItemKey collectionItemKeyForLayoutAttributes:]((uint64_t)_UICollectionViewItemKey, (uint64_t)a3);
  else
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_bodyForItem:(id)a3
{
  NSMutableDictionary *bodies;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  bodies = self->_bodies;
  v5 = a3;
  -[UIDynamicAnimator _keyForItem:](self, "_keyForItem:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](bodies, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "representedObject");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v5)
    v9 = v7;
  else
    v9 = 0;

  return v9;
}

- (id)_world
{
  return self->_world;
}

- (void)_setSpeed:(double)a3
{
  self->_speed = a3;
  -[PKExtendedPhysicsWorld setSpeed:](self->_world, "setSpeed:");
}

- (double)_speed
{
  return self->_speed;
}

- (void)_setupWorld
{
  PKExtendedPhysicsWorld *v3;
  PKExtendedPhysicsWorld *world;

  v3 = objc_alloc_init(PKExtendedPhysicsWorld);
  world = self->_world;
  self->_world = v3;

  -[PKExtendedPhysicsWorld setSpeed:](self->_world, "setSpeed:", self->_speed);
}

- (BOOL)_isWorldActive
{
  void *uiUpdateSequenceItem;

  if (_UIUpdateCycleEnabled())
  {
    uiUpdateSequenceItem = self->_uiUpdateSequenceItem;
  }
  else
  {
    uiUpdateSequenceItem = objc_loadWeakRetained((id *)&self->_displaylink);

  }
  return uiUpdateSequenceItem != 0;
}

- (void)_setRunning:(BOOL)a3
{
  _BOOL4 v3;

  v3 = a3;
  if (-[UIDynamicAnimator isRunning](self, "isRunning") != a3)
  {
    if (v3)
      -[UIDynamicAnimator _start](self, "_start");
    else
      -[UIDynamicAnimator _stop](self, "_stop");
  }
}

- (void)_stop
{
  id WeakRetained;
  id v4;

  if (-[UIDynamicAnimator _isWorldActive](self, "_isWorldActive"))
  {
    self->_lastUpdateTime = 0.0;
    if (_UIUpdateCycleEnabled())
    {
      -[UIDynamicAnimator _deactivateUIUpdateSequenceItem](self, "_deactivateUIUpdateSequenceItem");
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_displaylink);
      objc_msgSend(WeakRetained, "invalidate");

      objc_storeWeak((id *)&self->_displaylink, 0);
    }
    self->_stopping = 1;
    -[UIDynamicsDebug captureDebugInformation](self->_dynamicsDebug, "captureDebugInformation");
    -[UIDynamicsDebug setNeedsDisplay](self->_dynamicsDebug, "setNeedsDisplay");
    if ((*(_BYTE *)&self->_stateFlags & 1) != 0)
    {
      v4 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v4, "dynamicAnimatorDidPause:", self);

    }
    self->_stopping = 0;
  }
}

- (void)_clearReferenceView
{
  if (self->_referenceSystemType == 1)
  {
    objc_storeWeak((id *)&self->_referenceSystem, 0);
    -[UIDynamicAnimator _stop](self, "_stop");
  }
}

- (void)_tickle
{
  _QWORD block[5];

  if (self->_stopping && __tickleTryCount <= 3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __28__UIDynamicAnimator__tickle__block_invoke;
    block[3] = &unk_1E16B1B28;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    ++__tickleTryCount;
  }
  else if (!-[UIDynamicAnimator _isWorldActive](self, "_isWorldActive"))
  {
    if (-[NSMutableDictionary count](self->_bodies, "count"))
      -[UIDynamicAnimator _start](self, "_start");
  }
}

uint64_t __28__UIDynamicAnimator__tickle__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_tickle");
  __tickleTryCount = 0;
  return result;
}

- (void)_start
{
  id WeakRetained;
  UIDynamicAnimatorTicker *v4;
  UIDynamicAnimatorTicker *ticker;
  void *v6;
  unint64_t referenceSystemType;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  id v21;

  __tickleTryCount = 0;
  if (self->_referenceSystemType == 1)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_referenceSystem);

    if (!WeakRetained)
      return;
  }
  if (-[UIDynamicAnimator _isWorldActive](self, "_isWorldActive") || self->_disableDisplayLink)
    return;
  v4 = objc_alloc_init(UIDynamicAnimatorTicker);
  ticker = self->_ticker;
  self->_ticker = v4;

  -[UIDynamicAnimator ticker](self, "ticker");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAnimator:", self);

  if (!_UIUpdateCycleEnabled())
  {
    self->_lastUpdateTime = CACurrentMediaTime();
    referenceSystemType = self->_referenceSystemType;
    if (referenceSystemType == 1)
    {
      v8 = objc_loadWeakRetained((id *)&self->_referenceSystem);
      objc_msgSend(v8, "_screen");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIDynamicAnimator ticker](self, "ticker");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "displayLinkWithTarget:selector:", v10, sel__displayLinkTick_);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (referenceSystemType != 2)
        goto LABEL_12;
      v8 = objc_loadWeakRetained((id *)&self->_referenceSystem);
      objc_msgSend(v8, "collectionView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_screen");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIDynamicAnimator ticker](self, "ticker");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "displayLinkWithTarget:selector:", v11, sel__displayLinkTick_);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (v12)
    {
LABEL_13:
      objc_msgSend(v12, "maximumRefreshRate");
      if (v15 != 0.0)
        objc_msgSend(v12, "setPreferredFramesPerSecond:", llround(1.0 / v15));
      objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addToRunLoop:forMode:", v16, *MEMORY[0x1E0C99860]);

      objc_storeWeak((id *)&self->_displaylink, v12);
      goto LABEL_16;
    }
LABEL_12:
    v13 = (void *)MEMORY[0x1E0CD2730];
    -[UIDynamicAnimator ticker](self, "ticker");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "displayLinkWithTarget:selector:", v14, sel__displayLinkTick_);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_13;
  }
  -[UIDynamicAnimator _activateUIUpdateSequenceItem](self, "_activateUIUpdateSequenceItem");
LABEL_16:
  if (self->_referenceSystemType == 1)
  {
    -[UIDynamicAnimator referenceView](self, "referenceView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "window");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "screen");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "scale");
    self->_accuracy = v20;

  }
  if (self->_accuracy == 0.0)
    self->_accuracy = 1.0;
  if ((*(_BYTE *)&self->_stateFlags & 2) != 0)
  {
    v21 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v21, "dynamicAnimatorWillResume:", self);

  }
}

- (BOOL)isDebugEnabled
{
  return self->_debugEnabled;
}

- (void)setDebugEnabled:(BOOL)a3
{
  UIDynamicsDebug *v4;
  UIDynamicsDebug *dynamicsDebug;
  UIDynamicsDebug *v6;

  if (self->_debugEnabled != a3)
  {
    self->_debugEnabled = a3;
    if (a3)
    {
      if (!self->_world)
        -[UIDynamicAnimator _setupWorld](self, "_setupWorld");
      v4 = -[UIDynamicsDebug initWithAnimator:]([UIDynamicsDebug alloc], "initWithAnimator:", self);
      dynamicsDebug = self->_dynamicsDebug;
      self->_dynamicsDebug = v4;

      -[UIDynamicsDebug setEnabled:](self->_dynamicsDebug, "setEnabled:", 1);
    }
    else
    {
      -[UIDynamicsDebug setEnabled:](self->_dynamicsDebug, "setEnabled:");
      v6 = self->_dynamicsDebug;
      self->_dynamicsDebug = 0;

    }
  }
}

- (void)setDebugFrameInterval:(unint64_t)a3
{
  self->_debugInterval = a3;
}

- (unint64_t)debugFrameInterval
{
  return self->_debugInterval;
}

- (void)_setDebugInterval:(int)a3
{
  -[UIDynamicAnimator setDebugFrameInterval:](self, "setDebugFrameInterval:", a3);
}

- (int)_debugInterval
{
  return -[UIDynamicAnimator debugFrameInterval](self, "debugFrameInterval");
}

- (void)_preSolverStep
{
  id WeakRetained;
  unint64_t referenceSystemType;
  id v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  BOOL v10;
  id v11;
  void *v12;
  void *v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  id v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  BOOL v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  id v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  BOOL v33;
  NSMutableSet *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;

  v44 = *MEMORY[0x1E0C80C00];
  if (self->_needsLocalBehaviorReevaluation)
  {
    -[UIDynamicAnimator _evaluateLocalBehaviors](self, "_evaluateLocalBehaviors");
    self->_needsLocalBehaviorReevaluation = 0;
  }
  if (self->_registeredImplicitBounds < 1)
    goto LABEL_16;
  WeakRetained = objc_loadWeakRetained((id *)&self->_referenceSystem);

  if (!WeakRetained)
    goto LABEL_16;
  referenceSystemType = self->_referenceSystemType;
  switch(referenceSystemType)
  {
    case 0uLL:
      v18 = objc_loadWeakRetained((id *)&self->_referenceSystem);
      objc_msgSend(v18, "bounds");
      v46.origin.x = v19;
      v46.origin.y = v20;
      v46.size.width = v21;
      v46.size.height = v22;
      v23 = CGRectEqualToRect(self->_referenceSystemBounds, v46);

      if (v23)
        break;
      v11 = objc_loadWeakRetained((id *)&self->_referenceSystem);
      objc_msgSend(v11, "bounds");
LABEL_14:
      self->_referenceSystemBounds.origin.x = v24;
      self->_referenceSystemBounds.origin.y = v25;
      self->_referenceSystemBounds.size.width = v26;
      self->_referenceSystemBounds.size.height = v27;
      goto LABEL_15;
    case 2uLL:
      v28 = objc_loadWeakRetained((id *)&self->_referenceSystem);
      objc_msgSend(v28, "_dynamicReferenceBounds");
      v47.origin.x = v29;
      v47.origin.y = v30;
      v47.size.width = v31;
      v47.size.height = v32;
      v33 = CGRectEqualToRect(self->_referenceSystemBounds, v47);

      if (v33)
        break;
      v11 = objc_loadWeakRetained((id *)&self->_referenceSystem);
      objc_msgSend(v11, "_dynamicReferenceBounds");
      goto LABEL_14;
    case 1uLL:
      v5 = objc_loadWeakRetained((id *)&self->_referenceSystem);
      objc_msgSend(v5, "bounds");
      v45.origin.x = v6;
      v45.origin.y = v7;
      v45.size.width = v8;
      v45.size.height = v9;
      v10 = CGRectEqualToRect(self->_referenceSystemBounds, v45);

      if (!v10)
      {
        v11 = objc_loadWeakRetained((id *)&self->_referenceSystem);
        objc_msgSend(v11, "layer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "presentationLayer");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "bounds");
        self->_referenceSystemBounds.origin.x = v14;
        self->_referenceSystemBounds.origin.y = v15;
        self->_referenceSystemBounds.size.width = v16;
        self->_referenceSystemBounds.size.height = v17;

LABEL_15:
        -[UIDynamicAnimator _reevaluateImplicitBounds](self, "_reevaluateImplicitBounds");
      }
      break;
  }
LABEL_16:
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v34 = self->_registeredBehaviors;
  v35 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v36; ++i)
      {
        if (*(_QWORD *)v40 != v37)
          objc_enumerationMutation(v34);
        objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "_step", (_QWORD)v39);
      }
      v36 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    }
    while (v36);
  }

  -[UIDynamicsDebug captureDebugInformation](self->_dynamicsDebug, "captureDebugInformation");
}

- (void)_runBlockPostSolverIfNeeded:(id)a3
{
  NSMutableArray *postSolverActions;
  id v4;

  if (self->_isInWorldStepMethod)
  {
    postSolverActions = self->_postSolverActions;
    v4 = _Block_copy(a3);
    -[NSMutableArray addObject:](postSolverActions, "addObject:", v4);

  }
  else
  {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (void)_postSolverStep
{
  NSMutableSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void (**v10)(void);
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  char v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  uint64_t v22;
  NSMutableSet *behaviorsToRemove;
  NSMutableSet *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t m;
  NSMutableSet *v29;
  NSMutableSet *behaviorsToAdd;
  NSMutableSet *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t n;
  NSMutableSet *v36;
  uint64_t debugInterval;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
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
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  self->_isInWorldStepMethod = 1;
  -[UIDynamicAnimator _reportBeginContacts](self, "_reportBeginContacts");
  -[UIDynamicAnimator _reportEndContacts](self, "_reportEndContacts");
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v3 = self->_registeredBehaviors;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v55 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
        objc_msgSend(v8, "action");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          objc_msgSend(v8, "action");
          v10 = (void (**)(void))objc_claimAutoreleasedReturnValue();
          v10[2]();

        }
      }
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
    }
    while (v5);
  }

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v11 = self->_topLevelBehaviors;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v50, v61, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v51;
    while (2)
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v51 != v14)
          objc_enumerationMutation(v11);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * j), "allowsAnimatorToStop"))
        {
          v16 = 0;
          goto LABEL_20;
        }
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v50, v61, 16);
      if (v13)
        continue;
      break;
    }
  }
  v16 = 1;
LABEL_20:

  self->_isInWorldStepMethod = 0;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v17 = self->_postSolverActions;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v46, v60, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v47;
    do
    {
      for (k = 0; k != v19; ++k)
      {
        if (*(_QWORD *)v47 != v20)
          objc_enumerationMutation(v17);
        v22 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * k);
        if (v22)
          (*(void (**)(void))(v22 + 16))();
      }
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v46, v60, 16);
    }
    while (v19);
  }

  -[NSMutableArray removeAllObjects](self->_postSolverActions, "removeAllObjects");
  behaviorsToRemove = self->_behaviorsToRemove;
  if (behaviorsToRemove && -[NSMutableSet count](behaviorsToRemove, "count"))
  {
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v24 = self->_behaviorsToRemove;
    v25 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v42, v59, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v43;
      do
      {
        for (m = 0; m != v26; ++m)
        {
          if (*(_QWORD *)v43 != v27)
            objc_enumerationMutation(v24);
          -[UIDynamicAnimator _unregisterBehavior:](self, "_unregisterBehavior:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * m));
        }
        v26 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v42, v59, 16);
      }
      while (v26);
    }

    v29 = self->_behaviorsToRemove;
    self->_behaviorsToRemove = 0;

  }
  behaviorsToAdd = self->_behaviorsToAdd;
  if (behaviorsToAdd && -[NSMutableSet count](behaviorsToAdd, "count"))
  {
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v31 = self->_behaviorsToAdd;
    v32 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v38, v58, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v39;
      do
      {
        for (n = 0; n != v33; ++n)
        {
          if (*(_QWORD *)v39 != v34)
            objc_enumerationMutation(v31);
          -[UIDynamicAnimator _registerBehavior:](self, "_registerBehavior:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * n), (_QWORD)v38);
        }
        v33 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v38, v58, 16);
      }
      while (v33);
    }

    v36 = self->_behaviorsToAdd;
    self->_behaviorsToAdd = 0;

  }
  if ((v16 & 1) != 0 || !-[NSMutableSet count](self->_registeredBehaviors, "count"))
    -[UIDynamicAnimator _stop](self, "_stop", (_QWORD)v38);
  debugInterval = self->_debugInterval;
  if (!(_DWORD)debugInterval || !(self->_ticks % debugInterval))
    -[UIDynamicsDebug setNeedsDisplay](self->_dynamicsDebug, "setNeedsDisplay", (_QWORD)v38);
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (id)_delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  id WeakRetained;
  void *v5;
  char v6;
  char v7;
  id obj;

  obj = delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (!obj || WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = 2;
    else
      v6 = 0;
    *(_BYTE *)&self->_stateFlags = *(_BYTE *)&self->_stateFlags & 0xFD | v6;
    v7 = objc_opt_respondsToSelector();
    v5 = obj;
    *(_BYTE *)&self->_stateFlags = *(_BYTE *)&self->_stateFlags & 0xFE | v7 & 1;
  }

}

- (void)_setAction:(id)a3
{
  void *v4;
  id action;

  v4 = (void *)objc_msgSend(a3, "copy");
  action = self->_action;
  self->_action = v4;

}

- (void)_setAlwaysDisableDisplayLink:(BOOL)a3
{
  -[UIDynamicAnimator _stop](self, "_stop");
  self->_disableDisplayLink = a3;
}

- (BOOL)_alwaysDisableDisplayLink
{
  return self->_disableDisplayLink;
}

- (BOOL)_animatorStep:(double)a3
{
  char v5;
  void (**action)(id, UIDynamicAnimator *);
  id WeakRetained;

  ++self->_ticks;
  self->_lastInterval = a3;
  self->_elapsedTime = self->_elapsedTime + a3;
  -[UIDynamicAnimator _preSolverStep](self, "_preSolverStep");
  self->_isInWorldStepMethod = 1;
  v5 = -[PKExtendedPhysicsWorld stepWithTime:velocityIterations:positionIterations:](self->_world, "stepWithTime:velocityIterations:positionIterations:", 8, 3, a3);
  self->_isInWorldStepMethod = 0;
  -[UIDynamicAnimator _postSolverStep](self, "_postSolverStep");
  action = (void (**)(id, UIDynamicAnimator *))self->_action;
  if (action)
    action[2](action, self);
  if (self->_referenceSystemType == 2)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_referenceSystem);
    -[UIDynamicAnimator _invalidateCollectionViewLayout:](self, "_invalidateCollectionViewLayout:", WeakRetained);

  }
  return v5;
}

- (void)_invalidateCollectionViewLayout:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(v3, "_invalidationContextForRefreshingVisibleElementAttributes");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidateLayoutWithContext:", v4);

}

- (double)_animatorInterval
{
  return self->_lastInterval;
}

- (void)_performAnimationTickForTimestamp:(double)a3
{
  double v5;
  BOOL v6;

  v5 = a3 - self->_lastUpdateTime;
  if (v5 > 0.5)
    v5 = 0.0166666667;
  self->_realElapsedTime = self->_realElapsedTime + v5;
  v6 = -[UIDynamicAnimator _animatorStep:](self, "_animatorStep:");
  self->_lastUpdateTime = a3;
  if (!v6)
    -[UIDynamicAnimator _stop](self, "_stop");
}

- (int64_t)_ticks
{
  return self->_ticks;
}

- (double)_realElapsedTime
{
  return self->_realElapsedTime;
}

- (BOOL)isSettling
{
  if (!self->_world)
    -[UIDynamicAnimator _setupWorld](self, "_setupWorld");
  if ((*(_BYTE *)&self->_stateFlags & 4) != 0)
    return -[PKExtendedPhysicsWorld isSettling](self->_world, "isSettling");
  else
    return 0;
}

- (void)setSettlingLinearVelocityThreshold:(double)a3
{
  if (!self->_world)
    -[UIDynamicAnimator _setupWorld](self, "_setupWorld");
  if ((*(_BYTE *)&self->_stateFlags & 4) != 0)
    -[PKExtendedPhysicsWorld setSettlingLinearVelocityThreshold:](self->_world, "setSettlingLinearVelocityThreshold:", a3);
}

- (double)settlingLinearVelocityThreshold
{
  double result;

  if (!self->_world)
    -[UIDynamicAnimator _setupWorld](self, "_setupWorld");
  if ((*(_BYTE *)&self->_stateFlags & 4) == 0)
    return 0.0;
  -[PKExtendedPhysicsWorld settlingLinearVelocityThreshold](self->_world, "settlingLinearVelocityThreshold");
  return result;
}

- (void)setSettlingAngularVelocityThreshold:(double)a3
{
  if (!self->_world)
    -[UIDynamicAnimator _setupWorld](self, "_setupWorld");
  if ((*(_BYTE *)&self->_stateFlags & 4) != 0)
    -[PKExtendedPhysicsWorld setSettlingAngularVelocityThreshold:](self->_world, "setSettlingAngularVelocityThreshold:", a3);
}

- (double)settlingAngularVelocityThreshold
{
  double result;

  if (!self->_world)
    -[UIDynamicAnimator _setupWorld](self, "_setupWorld");
  if ((*(_BYTE *)&self->_stateFlags & 4) == 0)
    return 0.0;
  -[PKExtendedPhysicsWorld settlingAngularVelocityThreshold](self->_world, "settlingAngularVelocityThreshold");
  return result;
}

- (void)setSettlingDuration:(double)a3
{
  if (!self->_world)
    -[UIDynamicAnimator _setupWorld](self, "_setupWorld");
  if ((*(_BYTE *)&self->_stateFlags & 4) != 0)
    -[PKExtendedPhysicsWorld setSettlingDuration:](self->_world, "setSettlingDuration:", a3);
}

- (double)settlingDuration
{
  double result;

  if (!self->_world)
    -[UIDynamicAnimator _setupWorld](self, "_setupWorld");
  if ((*(_BYTE *)&self->_stateFlags & 4) == 0)
    return 0.0;
  -[PKExtendedPhysicsWorld settlingDuration](self->_world, "settlingDuration");
  return result;
}

- (UIView)referenceView
{
  id WeakRetained;

  if (self->_referenceSystemType == 1)
    WeakRetained = objc_loadWeakRetained((id *)&self->_referenceSystem);
  else
    WeakRetained = 0;
  return (UIView *)WeakRetained;
}

- (void)_setReferenceSystem:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  id v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  id v12;
  id v13;
  id v14;
  CGSize v15;
  id obj;

  v4 = a3;
  if (v4)
  {
    obj = v4;
    WeakRetained = objc_loadWeakRetained((id *)&self->_referenceSystem);

    v4 = obj;
    if (WeakRetained != obj)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = objc_storeWeak((id *)&self->_referenceSystem, obj);
        self->_referenceSystemType = 1;
        v7 = v6;
        objc_msgSend(obj, "bounds");
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          self->_referenceSystemType = 0;
          v15 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
          self->_referenceSystemBounds.origin = (CGPoint)*MEMORY[0x1E0C9D628];
          self->_referenceSystemBounds.size = v15;
          goto LABEL_9;
        }
        v12 = objc_loadWeakRetained((id *)&self->_referenceSystem);
        objc_msgSend(v12, "_setDynamicAnimator:", 0);

        v13 = objc_storeWeak((id *)&self->_referenceSystem, obj);
        self->_referenceSystemType = 2;
        v14 = v13;
        objc_msgSend(obj, "_dynamicReferenceBounds");
      }
      self->_referenceSystemBounds.origin.x = v8;
      self->_referenceSystemBounds.origin.y = v9;
      self->_referenceSystemBounds.size.width = v10;
      self->_referenceSystemBounds.size.height = v11;

LABEL_9:
      v4 = obj;
    }
  }

}

- (CGRect)_referenceSystemBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_referenceSystemBounds.origin.x;
  y = self->_referenceSystemBounds.origin.y;
  width = self->_referenceSystemBounds.size.width;
  height = self->_referenceSystemBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (unint64_t)_referenceSystemType
{
  return self->_referenceSystemType;
}

- (id)_referenceSystem
{
  return objc_loadWeakRetained((id *)&self->_referenceSystem);
}

- (UIDynamicAnimatorTicker)ticker
{
  return self->_ticker;
}

- (void)setTicker:(id)a3
{
  objc_storeStrong((id *)&self->_ticker, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ticker, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_action, 0);
  objc_destroyWeak((id *)&self->_referenceSystem);
  objc_storeStrong((id *)&self->_endContacts, 0);
  objc_storeStrong((id *)&self->_beginContacts, 0);
  objc_storeStrong((id *)&self->_postSolverActions, 0);
  objc_storeStrong((id *)&self->_availableFieldCategories, 0);
  objc_storeStrong((id *)&self->_behaviorsToAdd, 0);
  objc_storeStrong((id *)&self->_behaviorsToRemove, 0);
  objc_storeStrong((id *)&self->_registeredBehaviors, 0);
  objc_storeStrong((id *)&self->_topLevelBehaviors, 0);
  objc_storeStrong((id *)&self->_bodies, 0);
  objc_storeStrong((id *)&self->_dynamicsDebug, 0);
  objc_destroyWeak((id *)&self->_displaylink);
  objc_storeStrong((id *)&self->_world, 0);
}

@end
