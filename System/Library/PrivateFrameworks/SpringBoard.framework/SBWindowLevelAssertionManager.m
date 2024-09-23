@implementation SBWindowLevelAssertionManager

- (SBWindowLevelAssertionManager)init
{
  SBWindowLevelAssertionManager *v2;
  uint64_t v3;
  NSMapTable *windowLevelAssertionsPerScene;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBWindowLevelAssertionManager;
  v2 = -[SBWindowLevelAssertionManager init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    windowLevelAssertionsPerScene = v2->_windowLevelAssertionsPerScene;
    v2->_windowLevelAssertionsPerScene = (NSMapTable *)v3;

  }
  return v2;
}

- (id)acquireWindowLevelAssertionWithPriority:(int64_t)a3 windowLevel:(double)a4 windowScene:(id)a5 reason:(id)a6
{
  id v10;
  id v11;
  SBWindowLevelAssertion *v12;
  uint64_t v13;
  SBWindowLevelAssertion *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[6];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id from;
  id location[2];

  v10 = a5;
  v11 = a6;
  objc_initWeak(location, self);
  objc_initWeak(&from, v10);
  v12 = [SBWindowLevelAssertion alloc];
  v13 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __104__SBWindowLevelAssertionManager_acquireWindowLevelAssertionWithPriority_windowLevel_windowScene_reason___block_invoke;
  v24[3] = &unk_1E8EB4F28;
  objc_copyWeak(&v25, location);
  objc_copyWeak(&v26, &from);
  v14 = -[SBWindowLevelAssertion initWithPriority:windowLevel:reason:invalidationHandler:](v12, "initWithPriority:windowLevel:reason:invalidationHandler:", a3, v11, v24, a4);
  -[SBWindowLevelAssertionManager windowLevelAssertionsPerScene](self, "windowLevelAssertionsPerScene");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBWindowLevelAssertionManager windowLevelAssertionsPerScene](self, "windowLevelAssertionsPerScene");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", v16, v10);

  }
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v23 = objc_msgSend(v16, "count");
  v19[0] = v13;
  v19[1] = 3221225472;
  v19[2] = __104__SBWindowLevelAssertionManager_acquireWindowLevelAssertionWithPriority_windowLevel_windowScene_reason___block_invoke_2;
  v19[3] = &unk_1E8EB4F50;
  v19[4] = &v20;
  v19[5] = a3;
  objc_msgSend(v16, "enumerateObjectsUsingBlock:", v19);
  objc_msgSend(v16, "insertObject:atIndex:", v14, v21[3]);
  -[SBWindowLevelAssertionManager _notifyDelegateAssertionsDidUpdateForWindowScene:](self, "_notifyDelegateAssertionsDidUpdateForWindowScene:", v10);
  _Block_object_dispose(&v20, 8);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&from);
  objc_destroyWeak(location);

  return v14;
}

void __104__SBWindowLevelAssertionManager_acquireWindowLevelAssertionWithPriority_windowLevel_windowScene_reason___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = v4;
  if (WeakRetained && v4)
  {
    objc_msgSend(WeakRetained, "windowLevelAssertionsPerScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "containsObject:", v9))
    {
      objc_msgSend(v7, "removeObject:", v9);
      if (!objc_msgSend(v7, "count"))
      {
        objc_msgSend(WeakRetained, "windowLevelAssertionsPerScene");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "removeObjectForKey:", v5);

      }
      objc_msgSend(WeakRetained, "_notifyDelegateAssertionsDidUpdateForWindowScene:", v5);
    }

  }
}

uint64_t __104__SBWindowLevelAssertionManager_acquireWindowLevelAssertionWithPriority_windowLevel_windowScene_reason___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  uint64_t result;

  v7 = *(_QWORD *)(a1 + 40);
  result = objc_msgSend(a2, "priority");
  if (v7 < result)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

- (id)highestPriorityWindowLevelAssertionForWindowScene:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[SBWindowLevelAssertionManager windowLevelAssertionsPerScene](self, "windowLevelAssertionsPerScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)debugDescription
{
  return (NSString *)-[SBWindowLevelAssertionManager descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (void)_notifyDelegateAssertionsDidUpdateForWindowScene:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBWindowLevelAssertionManager delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "windowLevelAssertionManager:didUpdateAssertionsForWindowScene:", self, v4);

}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBWindowLevelAssertionManager descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  SBWindowLevelAssertionManager *v12;

  v4 = (void *)MEMORY[0x1E0D01748];
  v5 = a3;
  objc_msgSend(v4, "builderWithObject:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__SBWindowLevelAssertionManager_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E8E9E820;
  v7 = v6;
  v11 = v7;
  v12 = self;
  objc_msgSend(v7, "appendBodySectionWithName:multilinePrefix:block:", 0, v5, v10);

  v8 = v7;
  return v8;
}

void __71__SBWindowLevelAssertionManager_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "windowLevelAssertionsPerScene");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v1, "appendObject:withName:", v3, CFSTR("windowLevelAssertionsPerScene"));

}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBWindowLevelAssertionManager succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (SBWindowLevelAssertionManagerDelegate)delegate
{
  return (SBWindowLevelAssertionManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMapTable)windowLevelAssertionsPerScene
{
  return self->_windowLevelAssertionsPerScene;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windowLevelAssertionsPerScene, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
