@implementation SBAssistantGestureConfiguration

- (SBAssistantGestureConfiguration)initWithSiriPresentationViewController:(id)a3
{
  id v5;
  SBAssistantGestureConfiguration *v6;
  SBAssistantGestureConfiguration *v7;
  uint64_t v8;
  NSHashTable *observers;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBAssistantGestureConfiguration;
  v6 = -[SBAssistantGestureConfiguration init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_siriPresentationViewController, a3);
    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
    v8 = objc_claimAutoreleasedReturnValue();
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v8;

  }
  return v7;
}

- (void)addObserver:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  id v7;

  v4 = a3;
  if (v4)
  {
    v7 = v4;
    v5 = -[NSHashTable containsObject:](self->_observers, "containsObject:", v4);
    v4 = v7;
    if (!v5)
    {
      -[SBAssistantGestureConfiguration observers](self, "observers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v7);

      v4 = v7;
    }
  }

}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[SBAssistantGestureConfiguration observers](self, "observers");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", v4);

  }
}

- (void)_makeObserversPerformBlock:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[SBAssistantGestureConfiguration observers](self, "observers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (BOOL)shouldDismissForSwipesOutsideContent
{
  void *v2;
  char v3;

  -[SBAssistantGestureConfiguration siriPresentationViewController](self, "siriPresentationViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldDismissForSwipesOutsideContent");

  return v3;
}

- (BOOL)shouldDismissForTapsOutsideContent
{
  void *v2;
  char v3;

  -[SBAssistantGestureConfiguration siriPresentationViewController](self, "siriPresentationViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldDismissForTapsOutsideContent");

  return v3;
}

- (BOOL)shouldShareHomeGesture
{
  void *v2;
  char v3;

  -[SBAssistantGestureConfiguration siriPresentationViewController](self, "siriPresentationViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shareHomeGesture");

  return v3;
}

- (BOOL)shouldPassTouchesThroughToSpringBoard
{
  void *v2;
  char v3;

  -[SBAssistantGestureConfiguration siriPresentationViewController](self, "siriPresentationViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldPassTouchesThroughToSpringBoard");

  return v3;
}

- (void)shouldDismissForGestureAtLocation:(CGPoint)a3 completion:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[SBAssistantGestureConfiguration siriPresentationViewController](self, "siriPresentationViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __80__SBAssistantGestureConfiguration_shouldDismissForGestureAtLocation_completion___block_invoke;
  v10[3] = &unk_1E8E9F1C0;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "hasContentAtPoint:completion:", v10, x, y);

}

void __80__SBAssistantGestureConfiguration_shouldDismissForGestureAtLocation_completion___block_invoke(uint64_t a1, char a2)
{
  char v2;
  _QWORD v3[4];
  id v4;
  char v5;

  v2 = a2 ^ 1;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __80__SBAssistantGestureConfiguration_shouldDismissForGestureAtLocation_completion___block_invoke_2;
  v3[3] = &unk_1E8EA0D88;
  v4 = *(id *)(a1 + 32);
  v5 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);

}

uint64_t __80__SBAssistantGestureConfiguration_shouldDismissForGestureAtLocation_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)notifyPanBeganAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  char v7;
  id v8;

  y = a3.y;
  x = a3.x;
  -[SBAssistantGestureConfiguration siriPresentationViewController](self, "siriPresentationViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[SBAssistantGestureConfiguration siriPresentationViewController](self, "siriPresentationViewController");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "notePanBeganAtPoint:", x, y);

  }
}

- (void)notifyTapAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  char v7;
  id v8;

  y = a3.y;
  x = a3.x;
  -[SBAssistantGestureConfiguration siriPresentationViewController](self, "siriPresentationViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[SBAssistantGestureConfiguration siriPresentationViewController](self, "siriPresentationViewController");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "noteTapAtPoint:", x, y);

  }
}

- (void)assistantGestureConfiguration:(id)a3 didUpdateHomeGestureSharing:(BOOL)a4
{
  NSObject *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  BOOL v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  SBLogSiri();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromBOOL();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v12 = v7;
    v13 = 2114;
    v14 = v8;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", buf, 0x16u);

  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __93__SBAssistantGestureConfiguration_assistantGestureConfiguration_didUpdateHomeGestureSharing___block_invoke;
  v9[3] = &unk_1E8EA7670;
  v9[4] = self;
  v10 = a4;
  -[SBAssistantGestureConfiguration _makeObserversPerformBlock:](self, "_makeObserversPerformBlock:", v9);
}

uint64_t __93__SBAssistantGestureConfiguration_assistantGestureConfiguration_didUpdateHomeGestureSharing___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "assistantGestureConfiguration:didUpdateHomeGestureSharing:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)assistantGestureConfiguration:(id)a3 didUpdateShouldDismissForTapsOutsideContent:(BOOL)a4
{
  NSObject *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  BOOL v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  SBLogSiri();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromBOOL();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v12 = v7;
    v13 = 2114;
    v14 = v8;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", buf, 0x16u);

  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __109__SBAssistantGestureConfiguration_assistantGestureConfiguration_didUpdateShouldDismissForTapsOutsideContent___block_invoke;
  v9[3] = &unk_1E8EA7670;
  v9[4] = self;
  v10 = a4;
  -[SBAssistantGestureConfiguration _makeObserversPerformBlock:](self, "_makeObserversPerformBlock:", v9);
}

uint64_t __109__SBAssistantGestureConfiguration_assistantGestureConfiguration_didUpdateShouldDismissForTapsOutsideContent___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "assistantGestureConfiguration:didUpdateShouldDismissForTapsOutsideContent:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)assistantGestureConfiguration:(id)a3 didUpdateShouldDismissForSwipesOutsideContent:(BOOL)a4
{
  NSObject *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  BOOL v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  SBLogSiri();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromBOOL();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v12 = v7;
    v13 = 2114;
    v14 = v8;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", buf, 0x16u);

  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __111__SBAssistantGestureConfiguration_assistantGestureConfiguration_didUpdateShouldDismissForSwipesOutsideContent___block_invoke;
  v9[3] = &unk_1E8EA7670;
  v9[4] = self;
  v10 = a4;
  -[SBAssistantGestureConfiguration _makeObserversPerformBlock:](self, "_makeObserversPerformBlock:", v9);
}

uint64_t __111__SBAssistantGestureConfiguration_assistantGestureConfiguration_didUpdateShouldDismissForSwipesOutsideContent___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "assistantGestureConfiguration:didUpdateShouldDismissForSwipesOutsideContent:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)assistantGestureConfiguration:(id)a3 didUpdateShouldPassTouchesThroughToSpringBoard:(BOOL)a4
{
  NSObject *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  BOOL v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  SBLogSiri();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromBOOL();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v12 = v7;
    v13 = 2114;
    v14 = v8;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", buf, 0x16u);

  }
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __112__SBAssistantGestureConfiguration_assistantGestureConfiguration_didUpdateShouldPassTouchesThroughToSpringBoard___block_invoke;
  v9[3] = &unk_1E8EA7670;
  v9[4] = self;
  v10 = a4;
  -[SBAssistantGestureConfiguration _makeObserversPerformBlock:](self, "_makeObserversPerformBlock:", v9);
}

uint64_t __112__SBAssistantGestureConfiguration_assistantGestureConfiguration_didUpdateShouldPassTouchesThroughToSpringBoard___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "assistantGestureConfiguration:didUpdateShouldPassTouchesThroughToSpringBoard:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)assistantGestureConfiguration:(id)a3 didUpdateShouldShowHomeAffordance:(BOOL)a4
{
  _BOOL8 v4;
  NSObject *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  BOOL v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v4 = a4;
  v15 = *MEMORY[0x1E0C80C00];
  SBLogSiri();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromBOOL();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v12 = v7;
    v13 = 2114;
    v14 = v8;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", buf, 0x16u);

  }
  -[SBAssistantGestureConfiguration setSiriWantsToShowHomeAffordance:](self, "setSiriWantsToShowHomeAffordance:", v4);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __99__SBAssistantGestureConfiguration_assistantGestureConfiguration_didUpdateShouldShowHomeAffordance___block_invoke;
  v9[3] = &unk_1E8EA7670;
  v9[4] = self;
  v10 = v4;
  -[SBAssistantGestureConfiguration _makeObserversPerformBlock:](self, "_makeObserversPerformBlock:", v9);
}

uint64_t __99__SBAssistantGestureConfiguration_assistantGestureConfiguration_didUpdateShouldShowHomeAffordance___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "assistantGestureConfiguration:didUpdateShouldShowHomeAffordance:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)assistantGestureConfiguration:(id)a3 didUpdateHomeAffordanceSuppression:(int64_t)a4
{
  NSObject *v6;
  void *v7;
  void *v8;
  _QWORD v9[6];
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  SBLogSiri();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithSiriHomeAffordanceSuppression:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v11 = v7;
    v12 = 2114;
    v13 = v8;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@", buf, 0x16u);

  }
  if ((unint64_t)a4 <= 2)
    -[SBAssistantGestureConfiguration setSiriWantsToShowHomeAffordance:](self, "setSiriWantsToShowHomeAffordance:", (a4 & 1) == 0);
  -[SBAssistantGestureConfiguration setSiriWantsHomeAffordanceSuppression:](self, "setSiriWantsHomeAffordanceSuppression:", a4);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __100__SBAssistantGestureConfiguration_assistantGestureConfiguration_didUpdateHomeAffordanceSuppression___block_invoke;
  v9[3] = &unk_1E8EA7698;
  v9[4] = self;
  v9[5] = a4;
  -[SBAssistantGestureConfiguration _makeObserversPerformBlock:](self, "_makeObserversPerformBlock:", v9);
}

uint64_t __100__SBAssistantGestureConfiguration_assistantGestureConfiguration_didUpdateHomeAffordanceSuppression___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "assistantGestureConfiguration:didUpdateHomeAffordanceSuppression:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (SiriPresentationSpringBoardMainScreenViewController)siriPresentationViewController
{
  return self->_siriPresentationViewController;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (BOOL)siriWantsToShowHomeAffordance
{
  return self->_siriWantsToShowHomeAffordance;
}

- (void)setSiriWantsToShowHomeAffordance:(BOOL)a3
{
  self->_siriWantsToShowHomeAffordance = a3;
}

- (int64_t)siriWantsHomeAffordanceSuppression
{
  return self->_siriWantsHomeAffordanceSuppression;
}

- (void)setSiriWantsHomeAffordanceSuppression:(int64_t)a3
{
  self->_siriWantsHomeAffordanceSuppression = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriPresentationViewController, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
