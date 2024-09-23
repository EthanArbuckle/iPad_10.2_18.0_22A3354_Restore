@implementation SBSystemActionPreviewAssertion

- (id)initWithIdentifier:(void *)a3 forReason:(void *)a4 expansionInvalidationBlock:(void *)a5 urgencyInvalidationBlock:(void *)a6 finalInvalidationBlock:
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  objc_super v33;

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = v15;
  if (!a1)
    goto LABEL_9;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("identifier != ((void *)0)"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBSystemActionPreviewAssertion initWithIdentifier:forReason:expansionInvalidationBlock:urgencyInvalidationBlock:finalInvalidationBlock:].cold.1();
LABEL_24:
    objc_msgSend(objc_retainAutorelease(v29), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D0666410);
  }
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("reason != ((void *)0)"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBSystemActionPreviewAssertion initWithIdentifier:forReason:expansionInvalidationBlock:urgencyInvalidationBlock:finalInvalidationBlock:].cold.2();
    objc_msgSend(objc_retainAutorelease(v30), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D0666474);
  }
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("expansionInvalidationBlock != ((void *)0)"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBSystemActionPreviewAssertion initWithIdentifier:forReason:expansionInvalidationBlock:urgencyInvalidationBlock:finalInvalidationBlock:].cold.3();
    objc_msgSend(objc_retainAutorelease(v31), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D06664D8);
  }
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("urgencyInvalidationBlock != ((void *)0)"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBSystemActionPreviewAssertion initWithIdentifier:forReason:expansionInvalidationBlock:urgencyInvalidationBlock:finalInvalidationBlock:].cold.4();
    objc_msgSend(objc_retainAutorelease(v32), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D066653CLL);
  }
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("finalInvalidationBlock != ((void *)0)"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBSystemActionPreviewAssertion initWithIdentifier:forReason:expansionInvalidationBlock:urgencyInvalidationBlock:finalInvalidationBlock:].cold.5();
    goto LABEL_24;
  }
  v33.receiver = a1;
  v33.super_class = (Class)SBSystemActionPreviewAssertion;
  a1 = objc_msgSendSuper2(&v33, sel_init);
  if (a1)
  {
    v17 = objc_msgSend(v11, "copy");
    v18 = (void *)*((_QWORD *)a1 + 10);
    *((_QWORD *)a1 + 10) = v17;

    v19 = objc_msgSend(v12, "copy");
    v20 = (void *)*((_QWORD *)a1 + 11);
    *((_QWORD *)a1 + 11) = v19;

    v21 = objc_msgSend(v14, "copy");
    v22 = (void *)*((_QWORD *)a1 + 1);
    *((_QWORD *)a1 + 1) = v21;

    v23 = objc_msgSend(v16, "copy");
    v24 = (void *)*((_QWORD *)a1 + 2);
    *((_QWORD *)a1 + 2) = v23;

    *((_DWORD *)a1 + 18) = 65793;
    +[SBSystemActionDomain rootSettings](SBSystemActionDomain, "rootSettings");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "previewSettings");
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)*((_QWORD *)a1 + 3);
    *((_QWORD *)a1 + 3) = v26;

    objc_msgSend(a1, "addExpansionInvalidationBlock:", v13);
  }
LABEL_9:

  return a1;
}

- (void)dealloc
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)addExpansionInvalidationBlock:(id)a3
{
  NSMutableOrderedSet *expansionInvalidationBlocks;
  NSMutableOrderedSet *v5;
  NSMutableOrderedSet *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (!-[SBSystemActionPreviewAssertion isValid](self, "isValid"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Can't add an expansion invalidation block to an already-invalidated assertion"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBSystemActionPreviewAssertion addExpansionInvalidationBlock:].cold.2();
LABEL_11:
    objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D0666758);
  }
  if (!self->_expanding)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Can't add an expansion invalidation block to a non-expanding assertion"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBSystemActionPreviewAssertion addExpansionInvalidationBlock:].cold.1();
    goto LABEL_11;
  }
  expansionInvalidationBlocks = self->_expansionInvalidationBlocks;
  if (!expansionInvalidationBlocks)
  {
    v5 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    v6 = self->_expansionInvalidationBlocks;
    self->_expansionInvalidationBlocks = v5;

    expansionInvalidationBlocks = self->_expansionInvalidationBlocks;
  }
  v7 = (void *)objc_msgSend(v10, "copy");
  v8 = (void *)MEMORY[0x1D17E5550]();
  -[NSMutableOrderedSet addObject:](expansionInvalidationBlocks, "addObject:", v8);

}

- (void)addInvalidationBlock:(id)a3
{
  NSMutableOrderedSet *invalidationBlocks;
  NSMutableOrderedSet *v5;
  NSMutableOrderedSet *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (-[SBSystemActionPreviewAssertion isValid](self, "isValid"))
  {
    invalidationBlocks = self->_invalidationBlocks;
    if (!invalidationBlocks)
    {
      v5 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
      v6 = self->_invalidationBlocks;
      self->_invalidationBlocks = v5;

      invalidationBlocks = self->_invalidationBlocks;
    }
    v7 = (void *)objc_msgSend(v10, "copy");
    v8 = (void *)MEMORY[0x1D17E5550]();
    -[NSMutableOrderedSet addObject:](invalidationBlocks, "addObject:", v8);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Can't add an invalidation block to an already-invalidated assertion"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBSystemActionPreviewAssertion addInvalidationBlock:].cold.1();
    objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void)invalidateAfterDefaultTimeoutForActionCancelled
{
  -[SBSystemActionPreviewAssertion _invalidateAfterContextualTimeoutWithResult:]((uint64_t)self, 1);
}

- (void)_invalidateAfterContextualTimeoutWithResult:(uint64_t)a1
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[6];
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  double v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (a1 && objc_msgSend((id)a1, "isValid") && !*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 24), "minimumPreviewInterval");
    v5 = v4;
    if (a2 == 1)
    {
      v6 = v4;
    }
    else
    {
      v6 = 0.0;
      if (!a2)
      {
        if (*(double *)(a1 + 48) <= 0.0)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            -[SBSystemActionPreviewAssertion _invalidateAfterContextualTimeoutWithResult:].cold.1();
          objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x1D0666B18);
        }
        BSContinuousMachTimeNow();
        v8 = v5 - (v7 - *(double *)(a1 + 48));
        if (v8 >= 0.0)
          v6 = v8;
        else
          v6 = 0.0;
      }
    }
    if (BSFloatGreaterThanFloat())
    {
      SBLogSystemActionPreviewing();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v17 = a1;
        v18 = 2048;
        v19 = v6;
        _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ creating %fs invalidation timer", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Preview-minimum-interval-timer:%@"), *(_QWORD *)(a1 + 80));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0D01720]), "initWithIdentifier:", v10);
      v12 = *(void **)(a1 + 40);
      *(_QWORD *)(a1 + 40) = v11;

      if (a2 == 1)
      {
        -[SBSystemActionPreviewAssertion _invalidateExpansionWithResult:](a1);
        -[SBSystemActionPreviewAssertion _invalidateUrgency](a1);
      }
      v13 = *(void **)(a1 + 40);
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __78__SBSystemActionPreviewAssertion__invalidateAfterContextualTimeoutWithResult___block_invoke;
      v15[3] = &unk_1E8E9DD00;
      v15[4] = a1;
      v15[5] = a2;
      objc_msgSend(v13, "scheduleWithFireInterval:leewayInterval:queue:handler:", MEMORY[0x1E0C80D38], v15, v6, 0.05);

    }
    else
    {
      objc_msgSend((id)a1, "invalidateWithResult:", a2);
    }
  }
}

- (id)acquireAssertionForInvalidatingAfterDefaultTimeoutForActionPerformed
{
  double v3;
  void *v4;
  id v5;
  NSString *reason;
  void *v7;
  _QWORD v9[5];

  if (!-[SBSystemActionPreviewAssertion isValid](self, "isValid") || self->_performedTime != 0.0)
    return 0;
  BSContinuousMachTimeNow();
  self->_performedTime = v3;
  self->_prominent = 1;
  -[SBSystemActionPreviewAssertion _invalidateExpansionWithResult:]((uint64_t)self);
  -[SBSystemActionPreviewAssertion _invalidateUrgencyAfterDefaultTimeoutForActionPerformed]((uint64_t)self);
  -[NSString stringByAppendingString:](self->_identifier, "stringByAppendingString:", CFSTR("-invalidateAsPerformed"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0D01868]);
  reason = self->_reason;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __102__SBSystemActionPreviewAssertion_acquireAssertionForInvalidatingAfterDefaultTimeoutForActionPerformed__block_invoke;
  v9[3] = &unk_1E8E9DCD8;
  v9[4] = self;
  v7 = (void *)objc_msgSend(v5, "initWithIdentifier:forReason:invalidationBlock:", v4, reason, v9);

  return v7;
}

- (void)_invalidateExpansionWithResult:(uint64_t)a1
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a1 && *(_BYTE *)(a1 + 74))
  {
    *(_BYTE *)(a1 + 74) = 0;
    v8 = 0u;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    v2 = *(id *)(a1 + 56);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v9;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(v2);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6) + 16))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6));
          ++v6;
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v4);
    }

    v7 = *(void **)(a1 + 56);
    *(_QWORD *)(a1 + 56) = 0;

  }
}

- (void)_invalidateUrgencyAfterDefaultTimeoutForActionPerformed
{
  double v2;
  double v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a1 && objc_msgSend((id)a1, "isValid") && !*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 24), "additionalUrgencyInterval");
    v3 = v2;
    SBLogSystemActionPreviewing();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v13 = a1;
      v14 = 2048;
      v15 = v3;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ creating %fs urgency invalidation timer", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Urgency-interval-timer:%@"), *(_QWORD *)(a1 + 80));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0D01720]), "initWithIdentifier:", v5);
    v7 = *(void **)(a1 + 32);
    *(_QWORD *)(a1 + 32) = v6;

    objc_initWeak((id *)buf, (id)a1);
    v8 = *(void **)(a1 + 32);
    v9 = MEMORY[0x1E0C80D38];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __89__SBSystemActionPreviewAssertion__invalidateUrgencyAfterDefaultTimeoutForActionPerformed__block_invoke;
    v10[3] = &unk_1E8E9DD28;
    objc_copyWeak(&v11, (id *)buf);
    objc_msgSend(v8, "scheduleWithFireInterval:leewayInterval:queue:handler:", MEMORY[0x1E0C80D38], v10, v3, 0.05);

    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)buf);

  }
}

void __102__SBSystemActionPreviewAssertion_acquireAssertionForInvalidatingAfterDefaultTimeoutForActionPerformed__block_invoke(uint64_t a1)
{
  -[SBSystemActionPreviewAssertion _invalidateAfterContextualTimeoutWithResult:](*(_QWORD *)(a1 + 32), 0);
}

- (void)_invalidateUrgency
{
  void *v2;

  if (a1)
  {
    if (*(_BYTE *)(a1 + 73))
    {
      *(_BYTE *)(a1 + 73) = 0;
      (*(void (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
      v2 = *(void **)(a1 + 8);
      *(_QWORD *)(a1 + 8) = 0;

    }
  }
}

uint64_t __78__SBSystemActionPreviewAssertion__invalidateAfterContextualTimeoutWithResult___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidateWithResult:", *(_QWORD *)(a1 + 40));
}

- (void)invalidateWithResult:(unint64_t)a3
{
  BSContinuousMachTimer *urgencyInvalidationTimer;
  BSContinuousMachTimer *invalidationTimer;
  NSMutableOrderedSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSMutableOrderedSet *invalidationBlocks;
  id finalInvalidationBlock;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (-[SBSystemActionPreviewAssertion isValid](self, "isValid"))
  {
    self->_valid = 0;
    -[BSContinuousMachTimer invalidate](self->_urgencyInvalidationTimer, "invalidate");
    urgencyInvalidationTimer = self->_urgencyInvalidationTimer;
    self->_urgencyInvalidationTimer = 0;

    -[BSContinuousMachTimer invalidate](self->_invalidationTimer, "invalidate");
    invalidationTimer = self->_invalidationTimer;
    self->_invalidationTimer = 0;

    self->_prominent = 0;
    -[SBSystemActionPreviewAssertion _invalidateExpansionWithResult:]((uint64_t)self);
    -[SBSystemActionPreviewAssertion _invalidateUrgency]((uint64_t)self);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = self->_invalidationBlocks;
    v7 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10) + 16))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10));
          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

    invalidationBlocks = self->_invalidationBlocks;
    self->_invalidationBlocks = 0;

    (*((void (**)(id))self->_finalInvalidationBlock + 2))(self->_finalInvalidationBlock);
    finalInvalidationBlock = self->_finalInvalidationBlock;
    self->_finalInvalidationBlock = 0;

  }
}

void __89__SBSystemActionPreviewAssertion__invalidateUrgencyAfterDefaultTimeoutForActionPerformed__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[SBSystemActionPreviewAssertion _invalidateUrgency]((uint64_t)WeakRetained);

}

- (id)descriptionWithMultilinePrefix:(uint64_t)a1
{
  void *v1;
  void *v2;

  if (a1)
  {
    -[SBSystemActionPreviewAssertion succinctDescriptionBuilder](a1);
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "build");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)succinctDescriptionBuilder
{
  void *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", a1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (id)objc_msgSend(v2, "appendObject:withName:", *(_QWORD *)(a1 + 80), CFSTR("identifier"));
    v4 = (id)objc_msgSend(v2, "appendObject:withName:", *(_QWORD *)(a1 + 88), CFSTR("reason"));
    v5 = (id)objc_msgSend(v2, "appendBool:withName:", *(unsigned __int8 *)(a1 + 72), CFSTR("valid"));
    v6 = (id)objc_msgSend(v2, "appendBool:withName:", *(unsigned __int8 *)(a1 + 73), CFSTR("urgent"));
    v7 = (id)objc_msgSend(v2, "appendBool:withName:", *(unsigned __int8 *)(a1 + 74), CFSTR("expanding"));
    v8 = (id)objc_msgSend(v2, "appendBool:withName:", *(unsigned __int8 *)(a1 + 75), CFSTR("prominent"));
    v9 = (id)objc_msgSend(v2, "appendBool:withName:ifEqualTo:", objc_msgSend(*(id *)(a1 + 32), "isScheduled"), CFSTR("pendingUrgencyInvalidation"), 1);
    v10 = (id)objc_msgSend(v2, "appendBool:withName:ifEqualTo:", objc_msgSend(*(id *)(a1 + 40), "isScheduled"), CFSTR("pendingInvalidation"), 1);
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)descriptionBuilderWithMultilinePrefix:(void *)a1
{
  if (a1)
  {
    -[SBSystemActionPreviewAssertion succinctDescriptionBuilder]((uint64_t)a1);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (BOOL)isValid
{
  return self->_valid;
}

- (BOOL)isUrgent
{
  return self->_urgent;
}

- (BOOL)isExpanding
{
  return self->_expanding;
}

- (BOOL)isProminent
{
  return self->_prominent;
}

- (uint64_t)identifier
{
  if (result)
    return *(_QWORD *)(result + 80);
  return result;
}

- (uint64_t)reason
{
  if (result)
    return *(_QWORD *)(result + 88);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_invalidationBlocks, 0);
  objc_storeStrong((id *)&self->_expansionInvalidationBlocks, 0);
  objc_storeStrong((id *)&self->_invalidationTimer, 0);
  objc_storeStrong((id *)&self->_urgencyInvalidationTimer, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong(&self->_finalInvalidationBlock, 0);
  objc_storeStrong(&self->_urgencyInvalidationBlock, 0);
}

- (void)initWithIdentifier:forReason:expansionInvalidationBlock:urgencyInvalidationBlock:finalInvalidationBlock:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithIdentifier:forReason:expansionInvalidationBlock:urgencyInvalidationBlock:finalInvalidationBlock:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithIdentifier:forReason:expansionInvalidationBlock:urgencyInvalidationBlock:finalInvalidationBlock:.cold.3()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithIdentifier:forReason:expansionInvalidationBlock:urgencyInvalidationBlock:finalInvalidationBlock:.cold.4()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithIdentifier:forReason:expansionInvalidationBlock:urgencyInvalidationBlock:finalInvalidationBlock:.cold.5()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)addExpansionInvalidationBlock:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)addExpansionInvalidationBlock:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)addInvalidationBlock:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_invalidateAfterContextualTimeoutWithResult:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
