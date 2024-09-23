@implementation SBHViewControllerTransition

- (BOOL)isTransitioning
{
  void *v2;
  BOOL v3;

  -[SBHViewControllerTransition transitionContext](self, "transitionContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (int64_t)targetEndpoint
{
  _BOOL4 v3;
  void *v4;
  unsigned int v5;

  v3 = -[SBHViewControllerTransition transitionEndpoint](self, "transitionEndpoint") == 1;
  -[SBHViewControllerTransition transitionContext](self, "transitionContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isCancelled");

  return v3 ^ v5;
}

- (void)transitionToEndpoint:(int64_t)a3 withAnimation:(BOOL)a4
{
  if (a3 == 1)
    -[SBHViewControllerTransition progressToEndStateWithAnimation:](self, "progressToEndStateWithAnimation:", a4);
  else
    -[SBHViewControllerTransition returnToBeginningStateWithAnimation:](self, "returnToBeginningStateWithAnimation:", a4);
}

- (void)progressToEndStateWithAnimation:(BOOL)a3
{
  _BOOL8 v3;
  SBViewControllerTransitionContext *v6;
  int64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void (**v15)(_QWORD);
  void (**v16)(_QWORD);
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  SBViewControllerTransitionContext *v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t);
  void *v29;
  NSObject *v30;
  SBHViewControllerTransition *v31;
  uint8_t buf[4];
  SBHViewControllerTransition *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v3 = a3;
  v36 = *MEMORY[0x1E0C80C00];
  -[SBHViewControllerTransition transitionContext](self, "transitionContext");
  v6 = (SBViewControllerTransitionContext *)objc_claimAutoreleasedReturnValue();
  -[SBViewControllerTransitionContext setWantsAnimation:](v6, "setWantsAnimation:", v3);
  v7 = -[SBHViewControllerTransition transitionEndpoint](self, "transitionEndpoint");
  if (-[SBHViewControllerTransition targetEndpoint](self, "targetEndpoint") == 1)
  {
    SBLogIcon();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (!v6 || v3)
    {
      if (v9)
      {
        NSStringFromSelector(a2);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v33 = self;
        v34 = 2114;
        v35 = v20;
        _os_log_impl(&dword_1CFEF3000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Ignoring %{public}@ because we are already transitioning to the end state", buf, 0x16u);

      }
    }
    else
    {
      if (v9)
      {
        NSStringFromSelector(a2);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v33 = self;
        v34 = 2114;
        v35 = v10;
        _os_log_impl(&dword_1CFEF3000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}@ is immediately ending a transition to the end state in progress", buf, 0x16u);

      }
      objc_opt_self();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBViewControllerTransitionContext animator](v6, "animator");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      SBFSafeCast();
      v8 = objc_claimAutoreleasedReturnValue();

      -[NSObject animator](v8, "animator");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "finalizeAnimationAtEndpoint:withContext:", 1, self);

      -[SBHViewControllerTransition _handleDidProgressToEndState](self, "_handleDidProgressToEndState");
    }
  }
  else
  {
    -[SBHViewControllerTransition delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = MEMORY[0x1E0C809B0];
    v27 = 3221225472;
    v28 = __63__SBHViewControllerTransition_progressToEndStateWithAnimation___block_invoke;
    v29 = &unk_1E8D84EF0;
    v8 = v14;
    v30 = v8;
    v31 = self;
    v15 = (void (**)(_QWORD))_Block_copy(&v26);
    v16 = v15;
    if (v6)
    {
      v15[2](v15);
      SBLogIcon();
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
      if (v7 == 1)
      {
        if (v18)
        {
          NSStringFromSelector(a2);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v33 = self;
          v34 = 2114;
          v35 = v19;
          _os_log_impl(&dword_1CFEF3000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}@ is restarting a cancelled transition to the end state", buf, 0x16u);

        }
        -[SBViewControllerTransitionContext restartTransition](v6, "restartTransition", v26, v27, v28, v29);
      }
      else
      {
        if (v18)
        {
          NSStringFromSelector(a2);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v33 = self;
          v34 = 2114;
          v35 = v25;
          _os_log_impl(&dword_1CFEF3000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}@ is cancelling a transition to the beginning state", buf, 0x16u);

        }
        -[SBViewControllerTransitionContext cancelTransition](v6, "cancelTransition", v26, v27, v28, v29);
      }
    }
    else
    {
      SBLogIcon();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v33 = self;
        v34 = 2114;
        v35 = v22;
        _os_log_impl(&dword_1CFEF3000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}@ is starting a new transition to the end state", buf, 0x16u);

      }
      -[SBHViewControllerTransition setTransitionEndpoint:](self, "setTransitionEndpoint:", 1, v26, v27, v28, v29);
      v6 = objc_alloc_init(SBViewControllerTransitionContext);
      -[SBViewControllerTransitionContext setAnimationContext:](v6, "setAnimationContext:", self);
      -[SBViewControllerTransitionContext setDelegate:](v6, "setDelegate:", self);
      -[SBHViewControllerTransition setTransitionContext:](self, "setTransitionContext:", v6);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[NSObject prepareTransition:](v8, "prepareTransition:", self);
      -[SBHViewControllerTransition transitionContext](self, "transitionContext");
      v23 = (SBViewControllerTransitionContext *)objc_claimAutoreleasedReturnValue();

      if (v23 == v6)
      {
        v24 = -[SBHViewControllerTransition _newTransitionAnimator](self, "_newTransitionAnimator");
        -[SBViewControllerTransitionContext setAnimator:](v6, "setAnimator:", v24);
        -[SBViewControllerTransitionContext setWantsAnimation:](v6, "setWantsAnimation:", v3);
        v16[2](v16);
        -[SBViewControllerTransitionContext startTransition](v6, "startTransition");

      }
    }

  }
}

uint64_t __63__SBHViewControllerTransition_progressToEndStateWithAnimation___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "transitionWillProgressToEndState:", *(_QWORD *)(a1 + 40));
  return result;
}

- (void)returnToBeginningStateWithAnimation:(BOOL)a3
{
  _BOOL8 v3;
  SBViewControllerTransitionContext *v6;
  int64_t v7;
  void (**v8)(void *);
  uint64_t v9;
  _BOOL4 v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  id v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  _QWORD aBlock[5];
  uint8_t buf[4];
  SBHViewControllerTransition *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v3 = a3;
  v32 = *MEMORY[0x1E0C80C00];
  -[SBHViewControllerTransition transitionContext](self, "transitionContext");
  v6 = (SBViewControllerTransitionContext *)objc_claimAutoreleasedReturnValue();
  -[SBViewControllerTransitionContext setWantsAnimation:](v6, "setWantsAnimation:", v3);
  v7 = -[SBHViewControllerTransition transitionEndpoint](self, "transitionEndpoint");
  if (-[SBHViewControllerTransition targetEndpoint](self, "targetEndpoint"))
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __67__SBHViewControllerTransition_returnToBeginningStateWithAnimation___block_invoke;
    aBlock[3] = &unk_1E8D84C50;
    aBlock[4] = self;
    v8 = (void (**)(void *))_Block_copy(aBlock);
    v9 = (uint64_t)v8;
    if (v6)
    {
      v8[2](v8);
      if (v7)
      {
        v10 = -[SBViewControllerTransitionContext isTransitioning](v6, "isTransitioning");
        SBLogIcon();
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
        if (v10)
        {
          if (v12)
          {
            NSStringFromSelector(a2);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v29 = self;
            v30 = 2114;
            v31 = v13;
            _os_log_impl(&dword_1CFEF3000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}@ is cancelling a transition to the end state", buf, 0x16u);

          }
          -[SBViewControllerTransitionContext cancelTransition](v6, "cancelTransition");
        }
        else
        {
          if (v12)
          {
            NSStringFromSelector(a2);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v29 = self;
            v30 = 2114;
            v31 = v26;
            _os_log_impl(&dword_1CFEF3000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}@ is cancelling a transition to the end state before it started", buf, 0x16u);

          }
          -[SBHViewControllerTransition _handleDidReturnToBeginningState](self, "_handleDidReturnToBeginningState");
        }
      }
      else
      {
        SBLogIcon();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          NSStringFromSelector(a2);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v29 = self;
          v30 = 2114;
          v31 = v25;
          _os_log_impl(&dword_1CFEF3000, v24, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}@ is restarting a cancelled transition to the beginning state", buf, 0x16u);

        }
        -[SBViewControllerTransitionContext restartTransition](v6, "restartTransition");
      }
    }
    else
    {
      SBLogIcon();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v29 = self;
        v30 = 2114;
        v31 = v21;
        _os_log_impl(&dword_1CFEF3000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}@ is starting a new transition to the beginning state", buf, 0x16u);

      }
      -[SBHViewControllerTransition setTransitionEndpoint:](self, "setTransitionEndpoint:", 0);
      v6 = objc_alloc_init(SBViewControllerTransitionContext);
      -[SBViewControllerTransitionContext setAnimationContext:](v6, "setAnimationContext:", self);
      -[SBViewControllerTransitionContext setDelegate:](v6, "setDelegate:", self);
      -[SBHViewControllerTransition setTransitionContext:](self, "setTransitionContext:", v6);
      v22 = -[SBHViewControllerTransition _newTransitionAnimator](self, "_newTransitionAnimator");
      -[SBViewControllerTransitionContext setAnimator:](v6, "setAnimator:", v22);
      -[SBViewControllerTransitionContext setWantsAnimation:](v6, "setWantsAnimation:", v3);
      (*(void (**)(uint64_t))(v9 + 16))(v9);
      -[SBViewControllerTransitionContext startTransition](v6, "startTransition");

    }
LABEL_24:

    goto LABEL_25;
  }
  SBLogIcon();
  v9 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT);
  if (!v6 || v3)
  {
    if (v14)
    {
      NSStringFromSelector(a2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = self;
      v30 = 2114;
      v31 = v23;
      _os_log_impl(&dword_1CFEF3000, (os_log_t)v9, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Ignoring %{public}@ because we are already transitioning to the beginning state", buf, 0x16u);

    }
    goto LABEL_24;
  }
  if (v14)
  {
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v29 = self;
    v30 = 2114;
    v31 = v15;
    _os_log_impl(&dword_1CFEF3000, (os_log_t)v9, OS_LOG_TYPE_DEFAULT, "[%{public}@]: %{public}@ is immediately ending a transition to the beginning state in progress", buf, 0x16u);

  }
  objc_opt_self();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBViewControllerTransitionContext animator](v6, "animator");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  SBFSafeCast();
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBViewControllerTransitionContext setWantsAnimation:](v6, "setWantsAnimation:", 0);
  objc_msgSend(v18, "animator");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "finalizeAnimationAtEndpoint:withContext:", 0, self);

  -[SBHViewControllerTransition _handleDidReturnToBeginningState](self, "_handleDidReturnToBeginningState");
LABEL_25:

}

void __67__SBHViewControllerTransition_returnToBeginningStateWithAnimation___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "transitionWillReturnToBeginningState:", *(_QWORD *)(a1 + 32));

}

- (BOOL)wantsAnimation
{
  void *v2;
  void *v3;
  char v4;

  -[SBHViewControllerTransition transitionContext](self, "transitionContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "isAnimated");
  else
    v4 = 1;

  return v4;
}

- (void)transitionDidFinish:(id)a3
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  SBHViewControllerTransition *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[SBHViewControllerTransition transitionContext](self, "transitionContext");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v5)
  {
    if (-[SBHViewControllerTransition targetEndpoint](self, "targetEndpoint") == 1)
      -[SBHViewControllerTransition _handleDidProgressToEndState](self, "_handleDidProgressToEndState");
    else
      -[SBHViewControllerTransition _handleDidReturnToBeginningState](self, "_handleDidReturnToBeginningState");
  }
  else
  {
    SBLogIcon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHViewControllerTransition transitionContext](self, "transitionContext");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138544130;
      v11 = self;
      v12 = 2114;
      v13 = v8;
      v14 = 2114;
      v15 = v5;
      v16 = 2114;
      v17 = v9;
      _os_log_impl(&dword_1CFEF3000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@]: ignoring %{public}@ for unexpected transition: %{public}@ -- expected transition: %{public}@", (uint8_t *)&v10, 0x2Au);

    }
  }

}

- (void)_handleDidProgressToEndState
{
  id v3;

  -[SBHViewControllerTransition setTransitionContext:](self, "setTransitionContext:", 0);
  -[SBHViewControllerTransition setTransitionEndpoint:](self, "setTransitionEndpoint:", 1);
  -[SBHViewControllerTransition delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "transitionDidProgressToEndState:", self);

}

- (void)_handleDidReturnToBeginningState
{
  id v3;

  -[SBHViewControllerTransition setTransitionContext:](self, "setTransitionContext:", 0);
  -[SBHViewControllerTransition setTransitionEndpoint:](self, "setTransitionEndpoint:", 0);
  -[SBHViewControllerTransition delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "transitionDidReturnToBeginningState:", self);

}

- (id)_newTransitionAnimator
{
  void *v3;
  uint64_t v4;
  void *v5;
  SBHViewControllerTransitionAnimatorAdapter *v6;

  -[SBHViewControllerTransition delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(v3, "animatorForTransition:", self), (v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = (void *)v4;
    v6 = -[SBHViewControllerTransitionAnimatorAdapter initWithAnimator:]([SBHViewControllerTransitionAnimatorAdapter alloc], "initWithAnimator:", v4);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSString)description
{
  return (NSString *)-[SBHViewControllerTransition descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBHViewControllerTransition succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[SBHViewControllerTransition descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
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
  SBHViewControllerTransition *v11;

  v4 = a3;
  -[SBHViewControllerTransition succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __69__SBHViewControllerTransition_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E8D84EF0;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

id __69__SBHViewControllerTransition_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isTransitioning"), CFSTR("isTransitioning"));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "wantsAnimation"), CFSTR("wantsAnimation"));
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "targetEndpoint"), CFSTR("targetEndpoint"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "transitionEndpoint"), CFSTR("transitionEndpoint"));
}

- (SBHViewControllerTransitionDelegate)delegate
{
  return (SBHViewControllerTransitionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong(&self->_userInfo, a3);
}

- (SBViewControllerTransitionContext)transitionContext
{
  return self->_transitionContext;
}

- (void)setTransitionContext:(id)a3
{
  objc_storeStrong((id *)&self->_transitionContext, a3);
}

- (int64_t)transitionEndpoint
{
  return self->_transitionEndpoint;
}

- (void)setTransitionEndpoint:(int64_t)a3
{
  self->_transitionEndpoint = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionContext, 0);
  objc_storeStrong(&self->_userInfo, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
