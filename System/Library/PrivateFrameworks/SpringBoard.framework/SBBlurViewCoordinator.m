@implementation SBBlurViewCoordinator

- (SBBlurViewCoordinator)initWithElementViewControllers:(id)a3
{
  id v5;
  SBBlurViewCoordinator *v6;
  SBBlurViewCoordinator *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *mapStateToBlocks;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBBlurViewCoordinator;
  v6 = -[SBBlurViewCoordinator init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_elementVCs, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    mapStateToBlocks = v7->_mapStateToBlocks;
    v7->_mapStateToBlocks = v8;

    v7->_state = 0;
  }

  return v7;
}

- (SBBlurViewCoordinator)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBBlurViewCoordinator.m"), 35, CFSTR("use initWithElementViewControllers:"));

  return 0;
}

- (id)description
{
  void *v3;
  unint64_t v4;
  const __CFString *v5;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SBBlurViewCoordinator state](self, "state") - 1;
  if (v4 > 2)
    v5 = CFSTR("idle");
  else
    v5 = off_1E8EC02E0[v4];
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", v5, CFSTR("state"));
  objc_msgSend(v3, "appendArraySection:withName:skipIfEmpty:", self->_elementVCs, CFSTR("coordinatingVCs"), 1);
  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isBlurred
{
  return self->_state - 1 < 2;
}

- (void)setBlurred:(BOOL)a3 withAnimationFactory:(id)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v9;
  unint64_t state;
  void *v11;
  NSObject *v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  double v20;
  double v21;
  id *v22;
  NSObject *v23;
  _QWORD *v24;
  NSArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  double v32;
  double v33;
  void *v34;
  SBBlurViewCoordinator *v35;
  SBBlurViewCoordinator *v36;
  SEL v37;
  SEL v38;
  id v39;
  _QWORD block[5];
  _QWORD v41[2];
  _QWORD v42[4];
  NSObject *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[5];
  _QWORD v49[2];
  _QWORD v50[4];
  NSObject *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v6 = a3;
  v58 = *MEMORY[0x1E0C80C00];
  v39 = a4;
  v9 = a5;
  if (!-[SBBlurViewCoordinator isBlurred](self, "isBlurred") && v6)
  {
    state = self->_state;
    if (state && state != 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBBlurViewCoordinator.m"), 56, CFSTR("Unexpected state transition for the blur coordinator to blur."));

    }
    v37 = a2;
    -[SBBlurViewCoordinator _setState:](self, "_setState:", 1);
    v12 = dispatch_group_create();
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v35 = self;
    v13 = self->_elementVCs;
    v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
    v15 = MEMORY[0x1E0C809B0];
    if (v14)
    {
      v16 = v14;
      v17 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v53 != v17)
            objc_enumerationMutation(v13);
          v19 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
          dispatch_group_enter(v12);
          objc_msgSend(v39, "duration");
          v21 = v20;
          v50[0] = v15;
          v50[1] = 3221225472;
          v50[2] = __68__SBBlurViewCoordinator_setBlurred_withAnimationFactory_completion___block_invoke_2;
          v50[3] = &unk_1E8E9DED8;
          v51 = v12;
          objc_msgSend(v19, "setLiveContentBlurEnabled:duration:blurDelay:iconViewScale:began:completion:", 1, &__block_literal_global_385, v50, v21, 0.0, 1.0);

        }
        v16 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
      }
      while (v16);
    }

    v48[0] = v15;
    v48[1] = 3221225472;
    v48[2] = __68__SBBlurViewCoordinator_setBlurred_withAnimationFactory_completion___block_invoke_3;
    v48[3] = &unk_1E8EA1310;
    v48[4] = v35;
    v49[1] = v37;
    v22 = (id *)v49;
    v49[0] = v9;
    v23 = MEMORY[0x1E0C80D38];
    v24 = v48;
LABEL_26:
    dispatch_group_notify(v12, v23, v24);

    goto LABEL_27;
  }
  if (-[SBBlurViewCoordinator isBlurred](self, "isBlurred") && !v6)
  {
    if (self->_state - 3 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBBlurViewCoordinator.m"), 81, CFSTR("Unexpected state transition for the blur coordinator to unblur."));

    }
    v38 = a2;
    -[SBBlurViewCoordinator _setState:](self, "_setState:", 3);
    v12 = dispatch_group_create();
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v36 = self;
    v25 = self->_elementVCs;
    v26 = -[NSArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v45;
      v29 = MEMORY[0x1E0C809B0];
      do
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v45 != v28)
            objc_enumerationMutation(v25);
          v31 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
          dispatch_group_enter(v12);
          objc_msgSend(v39, "duration");
          v33 = v32;
          v42[0] = v29;
          v42[1] = 3221225472;
          v42[2] = __68__SBBlurViewCoordinator_setBlurred_withAnimationFactory_completion___block_invoke_5;
          v42[3] = &unk_1E8E9DED8;
          v43 = v12;
          objc_msgSend(v31, "setLiveContentBlurEnabled:duration:blurDelay:iconViewScale:began:completion:", 0, &__block_literal_global_16_1, v42, v33, 0.0, 1.0);

        }
        v27 = -[NSArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
      }
      while (v27);
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__SBBlurViewCoordinator_setBlurred_withAnimationFactory_completion___block_invoke_6;
    block[3] = &unk_1E8EA1310;
    block[4] = v36;
    v41[1] = v38;
    v22 = (id *)v41;
    v41[0] = v9;
    v23 = MEMORY[0x1E0C80D38];
    v24 = block;
    goto LABEL_26;
  }
LABEL_27:

}

void __68__SBBlurViewCoordinator_setBlurred_withAnimationFactory_completion___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __68__SBBlurViewCoordinator_setBlurred_withAnimationFactory_completion___block_invoke_3(uint64_t a1)
{
  _QWORD *v2;
  uint64_t result;
  void *v4;
  void *v5;
  unint64_t v6;
  const __CFString *v7;

  if (objc_msgSend(*(id *)(a1 + 32), "isBlurred"))
  {
    v2 = *(_QWORD **)(a1 + 32);
    if (v2[2] != 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) - 1;
      if (v6 > 2)
        v7 = CFSTR("idle");
      else
        v7 = off_1E8EC02E0[v6];
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), v7);

      v2 = *(_QWORD **)(a1 + 32);
    }
    objc_msgSend(v2, "_setState:", 2);
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __68__SBBlurViewCoordinator_setBlurred_withAnimationFactory_completion___block_invoke_5(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __68__SBBlurViewCoordinator_setBlurred_withAnimationFactory_completion___block_invoke_6(uint64_t a1)
{
  _QWORD *v2;
  uint64_t result;
  void *v4;
  void *v5;
  unint64_t v6;
  const __CFString *v7;

  if (objc_msgSend(*(id *)(a1 + 32), "isBlurred"))
  {
    v2 = *(_QWORD **)(a1 + 32);
    if (v2[2] != 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) - 1;
      if (v6 > 2)
        v7 = CFSTR("idle");
      else
        v7 = off_1E8EC02E0[v6];
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), v7);

      v2 = *(_QWORD **)(a1 + 32);
    }
    objc_msgSend(v2, "_setState:", 0);
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)addNotifyBlock:(id)a3 forState:(unint64_t)a4
{
  void (**v6)(void);
  NSMutableDictionary *mapStateToBlocks;
  void *v8;
  id v9;
  NSMutableDictionary *v10;
  void *v11;
  void *v12;
  void (**v13)(void);

  v6 = (void (**)(void))a3;
  if (self->_state == a4)
  {
    v13 = v6;
    v6[2]();
LABEL_7:
    v6 = v13;
    goto LABEL_8;
  }
  if (v6)
  {
    v13 = v6;
    mapStateToBlocks = self->_mapStateToBlocks;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](mapStateToBlocks, "objectForKey:", v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v10 = self->_mapStateToBlocks;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v9, v11);

    }
    v12 = (void *)MEMORY[0x1D17E5550](v13);
    objc_msgSend(v9, "addObject:", v12);

    goto LABEL_7;
  }
LABEL_8:

}

- (void)removeNotifyBlock:(id)a3 forState:(unint64_t)a4
{
  NSMutableDictionary *mapStateToBlocks;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  mapStateToBlocks = self->_mapStateToBlocks;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  objc_msgSend(v6, "numberWithUnsignedInteger:", a4);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](mapStateToBlocks, "objectForKey:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1D17E5550](v7);

  objc_msgSend(v8, "removeObject:", v9);
}

- (void)_setState:(unint64_t)a3
{
  NSObject *v4;
  objc_class *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  const __CFString *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  SBBlurViewCoordinator *v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_state != a3)
  {
    self->_state = a3;
    SBLogAppResize();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v6;
      v8 = self->_state - 1;
      if (v8 > 2)
        v9 = CFSTR("idle");
      else
        v9 = off_1E8EC02E0[v8];
      v10 = 138412802;
      v11 = v6;
      v12 = 2048;
      v13 = self;
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_INFO, "<%@:%p>: blur view coordinator state changed to: %@", (uint8_t *)&v10, 0x20u);

    }
    -[SBBlurViewCoordinator _fireBlocksForState:](self, "_fireBlocksForState:", self->_state);
  }
}

- (void)_fireBlocksForState:(unint64_t)a3
{
  NSMutableDictionary *mapStateToBlocks;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSMutableDictionary *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  mapStateToBlocks = self->_mapStateToBlocks;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](mapStateToBlocks, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = (void *)objc_msgSend(v7, "copy", 0);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12++) + 16))();
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  v13 = self->_mapStateToBlocks;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](v13, "removeObjectForKey:", v14);

}

- (NSArray)viewControllers
{
  return self->_elementVCs;
}

- (unint64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapStateToBlocks, 0);
  objc_storeStrong((id *)&self->_elementVCs, 0);
}

@end
