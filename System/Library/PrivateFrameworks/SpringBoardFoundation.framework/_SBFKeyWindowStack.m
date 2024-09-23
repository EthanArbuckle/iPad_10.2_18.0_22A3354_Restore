@implementation _SBFKeyWindowStack

- (BOOL)_isWindowEligibleForKeyness:(id)a3
{
  id v3;
  void *v4;
  int v5;

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "canBecomeKeyWindow"))
    v5 = objc_msgSend(v4, "_isEffectivelyHiddenForKeyWindowStack") ^ 1;
  else
    LOBYTE(v5) = 0;

  return v5;
}

- (id)_evaluateForNewKeyWindowWithReason:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  SBFWindow *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  SBFWindow *v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[NSMutableOrderedSet reverseObjectEnumerator](self->_windowStack, "reverseObjectEnumerator", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v8)
        objc_enumerationMutation(v5);
      objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v9), "object");
      v10 = (SBFWindow *)objc_claimAutoreleasedReturnValue();
      if (-[_SBFKeyWindowStack _isWindowEligibleForKeyness:](self, "_isWindowEligibleForKeyness:", v10))
        break;

      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v10 = 0;
  }

  if (self->_expectedKeyWindow != v10)
  {
    SBLogKeyWindow();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0D01748], "descriptionForObject:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v12;
      v25 = 2114;
      v26 = v4;
      _os_log_impl(&dword_18AB69000, v11, OS_LOG_TYPE_DEFAULT, "Evaluate: making new window key: %{public}@, for reason: %{public}@ ", buf, 0x16u);

    }
    -[SBFWindow _resignKeyFromKeyWindowStack](self->_expectedKeyWindow, "_resignKeyFromKeyWindowStack");
    self->_expectedKeyWindow = v10;
LABEL_18:
    -[SBFWindow _makeKeyFromKeyWindowStack](v10, "_makeKeyFromKeyWindowStack");
    goto LABEL_19;
  }
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "keyWindow");
  v14 = (SBFWindow *)objc_claimAutoreleasedReturnValue();

  SBLogKeyWindow();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (v14 != v10)
  {
    if (v16)
    {
      objc_msgSend(MEMORY[0x1E0D01748], "descriptionForObject:", v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v17;
      v25 = 2114;
      v26 = v4;
      _os_log_impl(&dword_18AB69000, v15, OS_LOG_TYPE_DEFAULT, "Evaluate: making new window key: %{public}@ from nonSBF window, for reason: %{public}@ ", buf, 0x16u);

    }
    goto LABEL_18;
  }
  if (v16)
  {
    *(_DWORD *)buf = 138543362;
    v24 = v4;
    _os_log_impl(&dword_18AB69000, v15, OS_LOG_TYPE_DEFAULT, "Evaluate: no change - reason: %{public}@ ", buf, 0xCu);
  }

LABEL_19:
  return v10;
}

- (BOOL)pushKeyWindow:(id)a3
{
  SBFWindow *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  BOOL v10;
  void *v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = (SBFWindow *)a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SBFKeyWindowStack.m"), 103, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("window"));

  }
  BSDispatchQueueAssertMain();
  +[_SBWindowReference referenceForObject:](_SBWindowReference, "referenceForObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogKeyWindow();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0D01748], "descriptionForObject:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v14 = v8;
    _os_log_impl(&dword_18AB69000, v7, OS_LOG_TYPE_DEFAULT, "Push: %{public}@", buf, 0xCu);

  }
  -[NSMutableOrderedSet removeObject:](self->_windowStack, "removeObject:", v6);
  -[NSMutableOrderedSet addObject:](self->_windowStack, "addObject:", v6);
  v9 = -[_SBFKeyWindowStack _evaluateForNewKeyWindowWithReason:](self, "_evaluateForNewKeyWindowWithReason:", CFSTR("push"));
  v10 = self->_expectedKeyWindow == v5;

  return v10;
}

- (void)noteWindowUnhidden:(id)a3
{
  NSMutableOrderedSet *windowStack;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  v12 = a3;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SBFKeyWindowStack.m"), 162, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("window"));

  }
  BSDispatchQueueAssertMain();
  windowStack = self->_windowStack;
  +[_SBWindowReference referenceForObject:](_SBWindowReference, "referenceForObject:", v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(windowStack) = -[NSMutableOrderedSet containsObject:](windowStack, "containsObject:", v6);

  if ((_DWORD)windowStack)
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0D01748], "descriptionForObject:", v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("Window unhidden: %@"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[_SBFKeyWindowStack _evaluateForNewKeyWindowWithReason:](self, "_evaluateForNewKeyWindowWithReason:", v9);

  }
}

- (void)_keyWindowDidChangeNotification:(id)a3
{
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    SBLogKeyWindow();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0D01748], "descriptionForObject:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_18AB69000, v4, OS_LOG_TYPE_DEFAULT, "A window that wasn't a SB owned window became key: %{public}@", (uint8_t *)&v6, 0xCu);

    }
  }

}

+ (_SBFKeyWindowStack)sharedInstance
{
  if (sharedInstance_onceToken_8 != -1)
    dispatch_once(&sharedInstance_onceToken_8, &__block_literal_global_36);
  return (_SBFKeyWindowStack *)(id)sharedInstance___instance_0;
}

- (_SBFKeyWindowStack)init
{
  _SBFKeyWindowStack *v2;
  NSMutableOrderedSet *v3;
  NSMutableOrderedSet *windowStack;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_SBFKeyWindowStack;
  v2 = -[_SBFKeyWindowStack init](&v7, sel_init);
  if (v2)
  {
    v3 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    windowStack = v2->_windowStack;
    v2->_windowStack = v3;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__keyWindowDidChangeNotification_, *MEMORY[0x1E0CEBDF8], 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)_SBFKeyWindowStack;
  -[_SBFKeyWindowStack dealloc](&v4, sel_dealloc);
}

- (id)expectedKeyWindow
{
  BSDispatchQueueAssertMain();
  return self->_expectedKeyWindow;
}

- (void)popKeyWindow:(id)a3
{
  -[_SBFKeyWindowStack popKeyWindow:reason:](self, "popKeyWindow:reason:", a3, CFSTR("caller requested"));
}

- (void)popKeyWindow:(id)a3 reason:(id)a4
{
  SBFWindow *v7;
  id v8;
  void *v9;
  void *v10;
  SBFWindow *expectedKeyWindow;
  NSObject *v12;
  const __CFString *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  const __CFString *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = (SBFWindow *)a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SBFKeyWindowStack.m"), 125, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("window"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SBFKeyWindowStack.m"), 126, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

LABEL_3:
  BSDispatchQueueAssertMain();
  +[_SBWindowReference referenceForObject:](_SBWindowReference, "referenceForObject:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableOrderedSet containsObject:](self->_windowStack, "containsObject:", v10))
  {
    expectedKeyWindow = self->_expectedKeyWindow;
    SBLogKeyWindow();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      if (expectedKeyWindow == v7)
        v13 = CFSTR("YES");
      else
        v13 = CFSTR("NO");
      objc_msgSend(MEMORY[0x1E0D01748], "descriptionForObject:", v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v19 = v13;
      v20 = 2114;
      v21 = v9;
      v22 = 2112;
      v23 = v14;
      _os_log_impl(&dword_18AB69000, v12, OS_LOG_TYPE_DEFAULT, "Pop (wasKey=%{public}@, reason=%{public}@): %@", buf, 0x20u);

    }
    -[NSMutableOrderedSet removeObject:](self->_windowStack, "removeObject:", v10);
    if (expectedKeyWindow == v7)
    {
      -[SBFWindow _resignKeyFromKeyWindowStack](self->_expectedKeyWindow, "_resignKeyFromKeyWindowStack");
      self->_expectedKeyWindow = 0;
      v15 = -[_SBFKeyWindowStack _evaluateForNewKeyWindowWithReason:](self, "_evaluateForNewKeyWindowWithReason:", CFSTR("popped window was key"));
    }
  }

}

- (void)noteWindowDeallocated:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SBFKeyWindowStack.m"), 146, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("window"));

  }
  BSDispatchQueueAssertMain();
  -[_SBFKeyWindowStack popKeyWindow:reason:](self, "popKeyWindow:reason:", v6, CFSTR("window deallocated"));

}

- (void)noteWindowHidden:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SBFKeyWindowStack.m"), 153, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("window"));

  }
  BSDispatchQueueAssertMain();
  if (objc_msgSend(v10, "isKeyWindow"))
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0D01748], "descriptionForObject:", v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("Window hidden: %@"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[_SBFKeyWindowStack _evaluateForNewKeyWindowWithReason:](self, "_evaluateForNewKeyWindowWithReason:", v7);

  }
}

- (NSString)description
{
  return (NSString *)-[_SBFKeyWindowStack descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[_SBFKeyWindowStack succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_SBFKeyWindowStack descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  _SBFKeyWindowStack *v11;

  v4 = a3;
  -[_SBFKeyWindowStack succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60___SBFKeyWindowStack_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E200E2A0;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_windowStack, 0);
}

@end
