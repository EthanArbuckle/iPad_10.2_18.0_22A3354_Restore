@implementation _UIFocusAnimationCoordinatorManager

- (_UIFocusAnimationCoordinatorManager)init
{
  _UIFocusAnimationCoordinatorManager *v2;
  uint64_t v3;
  NSHashTable *unfocusingItems;
  uint64_t v5;
  NSMutableArray *inheritedAnimationCoordinatorActiveAnimationStack;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIFocusAnimationCoordinatorManager;
  v2 = -[_UIFocusAnimationCoordinatorManager init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
    v3 = objc_claimAutoreleasedReturnValue();
    unfocusingItems = v2->_unfocusingItems;
    v2->_unfocusingItems = (NSHashTable *)v3;

    v5 = objc_opt_new();
    inheritedAnimationCoordinatorActiveAnimationStack = v2->_inheritedAnimationCoordinatorActiveAnimationStack;
    v2->_inheritedAnimationCoordinatorActiveAnimationStack = (NSMutableArray *)v5;

  }
  return v2;
}

+ (id)activeCoordinatorMap
{
  if (qword_1ECD7D920 != -1)
    dispatch_once(&qword_1ECD7D920, &__block_literal_global_196);
  return (id)_MergedGlobals_1032;
}

+ (id)animationCoordinatorForContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "activeCoordinatorMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "activeFocusAnimationCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)willUpdateFocusInContext:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;

  v5 = a3;
  +[_UIFocusAnimationCoordinatorManager animationCoordinatorForContext:](_UIFocusAnimationCoordinatorManager, "animationCoordinatorForContext:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusAnimationCoordinatorManager.m"), 61, CFSTR("Unbalanced will/did update focus calls to focus animation manager."));

  }
  -[_UIFocusAnimationCoordinatorManager _performDelayedFocusingAnimationIfNecessary](self, "_performDelayedFocusingAnimationIfNecessary");
  -[_UIFocusAnimationCoordinatorManager activeFocusAnimationCoordinator](self, "activeFocusAnimationCoordinator");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (id)v7;
    -[_UIFocusAnimationCoordinatorManager inheritedAnimationCoordinatorActiveAnimationStack](self, "inheritedAnimationCoordinatorActiveAnimationStack");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v8, "activeFocusAnimation"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v10);

  }
  else
  {
    v8 = -[UIFocusAnimationCoordinator _initWithFocusUpdateContext:]([UIFocusAnimationCoordinator alloc], "_initWithFocusUpdateContext:", v5);
    -[_UIFocusAnimationCoordinatorManager setActiveFocusAnimationCoordinator:](self, "setActiveFocusAnimationCoordinator:", v8);
  }
  objc_msgSend((id)objc_opt_class(), "activeCoordinatorMap");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", self, v5);

  return v8;
}

- (void)didUpdateFocusInContext:(id)a3 fromItem:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v25;
  dispatch_time_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t);
  void *v37;
  id v38;
  id v39;
  id v40;
  id location;

  v7 = a3;
  v8 = a4;
  +[_UIFocusAnimationCoordinatorManager animationCoordinatorForContext:](_UIFocusAnimationCoordinatorManager, "animationCoordinatorForContext:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIFocusAnimationCoordinatorManager.m"), 81, CFSTR("Unbalanced will/did update focus calls to focus animation manager."));

  }
  -[_UIFocusAnimationCoordinatorManager unfocusingItems](self, "unfocusingItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "nextFocusedItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = CACurrentMediaTime();
  -[_UIFocusAnimationCoordinatorManager lastFocusUpdateTime](self, "lastFocusUpdateTime");
  v14 = v13;
  -[_UIFocusAnimationCoordinatorManager setLastFocusUpdateTime:](self, "setLastFocusUpdateTime:", v12);
  objc_msgSend(v9, "_focusingAnimationDuration");
  v16 = v15;
  objc_msgSend(v9, "_configurationForFocusAnimation:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "focusingDelay");
  v19 = v18;

  objc_msgSend(v9, "_configurationForFocusAnimation:", 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "minimumFocusDuration");
  v22 = v21;

  if (v11)
    objc_msgSend(v10, "removeObject:", v11);
  objc_msgSend(v9, "_prepareForFocusAnimation:", 0);
  v23 = fabs(v16);
  if (fabs(v19) < 2.22044605e-16 || v23 < 2.22044605e-16)
  {
    objc_msgSend(v9, "_animateFocusAnimation:", 0, 2.22044605e-16, v23);
    if (!v8)
      goto LABEL_15;
  }
  else
  {
    -[_UIFocusAnimationCoordinatorManager setLastFocusingItemAnimationCoordinator:](self, "setLastFocusingItemAnimationCoordinator:", v9, 2.22044605e-16, v23);
    -[_UIFocusAnimationCoordinatorManager _scheduleDelayedFocusingAnimationWithDelay:](self, "_scheduleDelayedFocusingAnimationWithDelay:", v19);
    if (!v8)
      goto LABEL_15;
  }
  v25 = v12 - v14;
  if (v25 < v22)
  {
    objc_initWeak(&location, v8);
    objc_msgSend(v10, "addObject:", v8);
    v26 = dispatch_time(0, (uint64_t)((v22 - v25) * 1000000000.0));
    v34 = MEMORY[0x1E0C809B0];
    v35 = 3221225472;
    v36 = __72___UIFocusAnimationCoordinatorManager_didUpdateFocusInContext_fromItem___block_invoke;
    v37 = &unk_1E16C5F68;
    v38 = v9;
    objc_copyWeak(&v40, &location);
    v39 = v10;
    dispatch_after(v26, MEMORY[0x1E0C80D38], &v34);

    objc_destroyWeak(&v40);
    objc_destroyWeak(&location);
    goto LABEL_16;
  }
LABEL_15:
  objc_msgSend(v9, "_prepareForFocusAnimation:", 1);
  objc_msgSend(v9, "_animateFocusAnimation:", 1);
LABEL_16:
  -[_UIFocusAnimationCoordinatorManager inheritedAnimationCoordinatorActiveAnimationStack](self, "inheritedAnimationCoordinatorActiveAnimationStack", v34, v35, v36, v37);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "count");

  if (v28)
  {
    -[_UIFocusAnimationCoordinatorManager inheritedAnimationCoordinatorActiveAnimationStack](self, "inheritedAnimationCoordinatorActiveAnimationStack");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "lastObject");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "_prepareForFocusAnimation:", objc_msgSend(v30, "integerValue"));
    -[_UIFocusAnimationCoordinatorManager inheritedAnimationCoordinatorActiveAnimationStack](self, "inheritedAnimationCoordinatorActiveAnimationStack");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "removeLastObject");

  }
  else
  {
    -[_UIFocusAnimationCoordinatorManager setActiveFocusAnimationCoordinator:](self, "setActiveFocusAnimationCoordinator:", 0);
  }
  objc_msgSend((id)objc_opt_class(), "activeCoordinatorMap");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "removeObjectForKey:", v7);

}

- (void)_scheduleDelayedFocusingAnimationWithDelay:(double)a3
{
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3978], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__performDelayedFocusingAnimationIfNecessary, 0);
  v6[0] = *MEMORY[0x1E0C99860];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIFocusAnimationCoordinatorManager performSelector:withObject:afterDelay:inModes:](self, "performSelector:withObject:afterDelay:inModes:", sel__performDelayedFocusingAnimationIfNecessary, 0, v5, a3);

}

- (void)_performDelayedFocusingAnimationIfNecessary
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3978], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, a2, 0);
  -[_UIFocusAnimationCoordinatorManager lastFocusingItemAnimationCoordinator](self, "lastFocusingItemAnimationCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "_animateFocusAnimation:", 0);
    -[_UIFocusAnimationCoordinatorManager setLastFocusingItemAnimationCoordinator:](self, "setLastFocusingItemAnimationCoordinator:", 0);
    v3 = v4;
  }

}

- (UIFocusAnimationCoordinator)activeFocusAnimationCoordinator
{
  return self->_activeFocusAnimationCoordinator;
}

- (void)setActiveFocusAnimationCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_activeFocusAnimationCoordinator, a3);
}

- (NSHashTable)unfocusingItems
{
  return self->_unfocusingItems;
}

- (double)lastFocusUpdateTime
{
  return self->_lastFocusUpdateTime;
}

- (void)setLastFocusUpdateTime:(double)a3
{
  self->_lastFocusUpdateTime = a3;
}

- (UIFocusAnimationCoordinator)lastFocusingItemAnimationCoordinator
{
  return self->_lastFocusingItemAnimationCoordinator;
}

- (void)setLastFocusingItemAnimationCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_lastFocusingItemAnimationCoordinator, a3);
}

- (NSMutableArray)inheritedAnimationCoordinatorActiveAnimationStack
{
  return self->_inheritedAnimationCoordinatorActiveAnimationStack;
}

- (void)setInheritedAnimationCoordinatorActiveAnimationStack:(id)a3
{
  objc_storeStrong((id *)&self->_inheritedAnimationCoordinatorActiveAnimationStack, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inheritedAnimationCoordinatorActiveAnimationStack, 0);
  objc_storeStrong((id *)&self->_lastFocusingItemAnimationCoordinator, 0);
  objc_storeStrong((id *)&self->_unfocusingItems, 0);
  objc_storeStrong((id *)&self->_activeFocusAnimationCoordinator, 0);
}

@end
