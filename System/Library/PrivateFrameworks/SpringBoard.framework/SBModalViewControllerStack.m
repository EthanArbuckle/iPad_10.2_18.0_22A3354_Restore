@implementation SBModalViewControllerStack

- (UIViewController)topViewController
{
  return (UIViewController *)-[NSMutableArray lastObject](self->_viewControllerStack, "lastObject");
}

- (SBModalViewControllerStack)initWithPresentingViewController:(id)a3
{
  id v6;
  SBModalViewControllerStack *v7;
  SBModalViewControllerStack *v8;
  NSMutableArray *v9;
  NSMutableArray *pendingTransitions;
  NSMutableArray *v11;
  NSMutableArray *viewControllerStack;
  void *v14;
  objc_super v15;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBModalViewControllerStack.m"), 76, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("viewController"));

  }
  v15.receiver = self;
  v15.super_class = (Class)SBModalViewControllerStack;
  v7 = -[SBModalViewControllerStack init](&v15, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_presentingViewController, a3);
    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    pendingTransitions = v8->_pendingTransitions;
    v8->_pendingTransitions = v9;

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    viewControllerStack = v8->_viewControllerStack;
    v8->_viewControllerStack = v11;

  }
  return v8;
}

- (NSArray)viewControllers
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_viewControllerStack, "copy");
}

- (void)addViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _DWORD v14[2];
  __int16 v15;
  id v16;
  uint64_t v17;

  v6 = a4;
  v17 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  BSDispatchQueueAssertMain();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBModalViewControllerStack.m"), 102, CFSTR("View controller to add to the stack must be non-nil."));

  }
  SBLogAlertItemStack();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v14[0] = 67109378;
    v14[1] = v6;
    v15 = 2112;
    v16 = v9;
    _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_INFO, "Adding view controller to pending transition list for presentation (animated? %d): %@", (uint8_t *)v14, 0x12u);
  }

  +[_SBModalViewControllerStackTransition transitionForViewController:operation:animated:completion:]((uint64_t)_SBModalViewControllerStackTransition, v9, 0, v6, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBModalViewControllerStack _queuePendingTransition:](self, "_queuePendingTransition:", v12);
  -[SBModalViewControllerStack _performPendingTransitionIfNecessary](self, "_performPendingTransitionIfNecessary");

}

- (void)removeViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _DWORD v14[2];
  __int16 v15;
  id v16;
  uint64_t v17;

  v6 = a4;
  v17 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  BSDispatchQueueAssertMain();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBModalViewControllerStack.m"), 112, CFSTR("View controller to remove from the stack must be non-nil."));

  }
  SBLogAlertItemStack();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v14[0] = 67109378;
    v14[1] = v6;
    v15 = 2112;
    v16 = v9;
    _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_INFO, "Adding view controller to pending transition list for dismissal (animated? %d): %@", (uint8_t *)v14, 0x12u);
  }

  +[_SBModalViewControllerStackTransition transitionForViewController:operation:animated:completion:]((uint64_t)_SBModalViewControllerStackTransition, v9, 1uLL, v6, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBModalViewControllerStack _queuePendingTransition:](self, "_queuePendingTransition:", v12);
  -[SBModalViewControllerStack _performPendingTransitionIfNecessary](self, "_performPendingTransitionIfNecessary");

}

- (void)removeViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  -[SBModalViewControllerStack topViewController](self, "topViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[SBModalViewControllerStack removeViewController:animated:completion:](self, "removeViewController:animated:completion:", v7, v4, v6);

}

- (void)_addPendingTransition:(id)a3
{
  if (a3)
    -[NSMutableArray addObject:](self->_pendingTransitions, "addObject:");
}

- (void)_removePendingTransition:(id)a3 forSuccess:(BOOL)a4
{
  _BOOL8 v4;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  _QWORD *v10;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v8 = v6[4];
    v10 = v7;
    if (v8)
    {
      (*(void (**)(uint64_t, _BOOL8))(v8 + 16))(v8, v4);
      v9 = (void *)v10[4];
      v10[4] = 0;

    }
    -[NSMutableArray removeObject:](self->_pendingTransitions, "removeObject:", v10);
    v7 = v10;
  }

}

- (id)_popNextPendingTransition
{
  void *v3;

  -[NSMutableArray firstObject](self->_pendingTransitions, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    -[NSMutableArray removeObjectAtIndex:](self->_pendingTransitions, "removeObjectAtIndex:", 0);
  return v3;
}

- (void)_setCurrentTransition:(id)a3
{
  _SBModalViewControllerStackTransition *v5;
  _SBModalViewControllerStackTransition **p_currentTransition;
  _SBModalViewControllerStackTransition *currentTransition;
  NSObject *v8;
  int v9;
  _SBModalViewControllerStackTransition *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = (_SBModalViewControllerStackTransition *)a3;
  currentTransition = self->_currentTransition;
  p_currentTransition = &self->_currentTransition;
  if (currentTransition != v5)
  {
    objc_storeStrong((id *)p_currentTransition, a3);
    SBLogAlertItemStack();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = 138412290;
      v10 = v5;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_INFO, "Set new current transition: %@", (uint8_t *)&v9, 0xCu);
    }

  }
}

- (void)_queuePendingTransition:(id)a3
{
  id v5;
  _QWORD *v6;
  id v7;
  uint64_t v8;
  _SBModalViewControllerStackTransition *currentTransition;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  _QWORD *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (!v5)
  {
    v7 = 0;
LABEL_4:
    -[NSMutableArray removeObject:](self->_viewControllerStack, "removeObject:", v7);
    -[NSMutableArray addObject:](self->_viewControllerStack, "addObject:", v7);
    goto LABEL_8;
  }
  v7 = *((id *)v5 + 1);
  v8 = v6[2];
  if (v8 != 1)
  {
    if (v8)
      goto LABEL_8;
    goto LABEL_4;
  }
  if ((-[NSMutableArray containsObject:](self->_viewControllerStack, "containsObject:", v7) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBModalViewControllerStack.m"), 168, CFSTR("View controller (%@) can't be removed from the modal stack when it doesn't already exist."), v7);

  }
  -[NSMutableArray removeObject:](self->_viewControllerStack, "removeObject:", v7);
LABEL_8:
  currentTransition = self->_currentTransition;
  SBLogAlertItemStack();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (!currentTransition)
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_INFO, "No current transition is on-going, but pending it for immediate execution.", buf, 2u);
    }

    if (-[NSMutableArray count](self->_pendingTransitions, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBModalViewControllerStack.m"), 201, CFSTR("We cannot have a pending transition if we have no current transition."));

    }
    goto LABEL_37;
  }
  if (v11)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_INFO, "We have a current transition on-going; attempting to pend the next operation.",
      buf,
      2u);
  }

  if (!v6 || v6[2] != 1)
  {
LABEL_37:
    -[SBModalViewControllerStack _addPendingTransition:](self, "_addPendingTransition:", v6);
    goto LABEL_38;
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v12 = (void *)-[NSMutableArray copy](self->_pendingTransitions, "copy");
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (!v13)
  {

    goto LABEL_37;
  }
  v14 = v13;
  v15 = *(_QWORD *)v25;
  v16 = 1;
  do
  {
    v17 = 0;
    do
    {
      if (*(_QWORD *)v25 != v15)
        objc_enumerationMutation(v12);
      v18 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v17);
      if (v18)
        v19 = *(_QWORD *)(v18 + 8);
      else
        v19 = 0;
      if (v19 == v6[1] && (!v18 || !*(_QWORD *)(v18 + 16)))
      {
        SBLogAlertItemStack();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v29 = v18;
          v30 = 2112;
          v31 = v6;
          _os_log_impl(&dword_1D0540000, v20, OS_LOG_TYPE_INFO, "Found a previously queued activation for this view controller (%@), and this is a dismissal (%@), so removing both from the pending queue.", buf, 0x16u);
        }

        -[SBModalViewControllerStack _removePendingTransition:forSuccess:](self, "_removePendingTransition:forSuccess:", v18, 1);
        -[_SBModalViewControllerStackTransition invokeCompletionIfNecessaryWithResult:]((uint64_t)v6);
        v16 = 0;
      }
      ++v17;
    }
    while (v14 != v17);
    v21 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    v14 = v21;
  }
  while (v21);

  if ((v16 & 1) != 0)
    goto LABEL_37;
LABEL_38:

}

- (void)_performPendingTransitionIfNecessary
{
  id v2;
  void *v4;
  id v5;
  SBModalViewControllerStack *v6;
  uint64_t v7;
  id *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  id *v12;
  id v13;
  id *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD v26[4];
  id *v27;
  id v28;
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (self->_currentTransition)
  {
    SBLogAlertItemStack();
    v2 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, (os_log_t)v2, OS_LOG_TYPE_INFO, "Unable to consume next transition event yet due to on-going current transition.", buf, 2u);
    }
    goto LABEL_20;
  }
  -[SBModalViewControllerStack _popNextPendingTransition](self, "_popNextPendingTransition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v4;
  if (v4)
  {
    v5 = v4;
    -[SBModalViewControllerStack _setCurrentTransition:](self, "_setCurrentTransition:", v5);
    v6 = self;
    v7 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __66__SBModalViewControllerStack__performPendingTransitionIfNecessary__block_invoke;
    v26[3] = &unk_1E8E9E820;
    v8 = v6;
    v27 = v8;
    v2 = v5;
    v28 = v2;
    v9 = (void *)MEMORY[0x1D17E5550](v26);
    v10 = *((_QWORD *)v2 + 2);
    if (v10 == 1)
    {
      SBLogAlertItemStack();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v2;
        _os_log_impl(&dword_1D0540000, v16, OS_LOG_TYPE_INFO, "Beginning processing remove view controller: %@", buf, 0xCu);
      }

      if (objc_msgSend(v8[3], "count"))
      {
        objc_msgSend(v8[3], "lastObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        +[_SBModalViewControllerStackTransition transitionForViewController:operation:animated:completion:]((uint64_t)_SBModalViewControllerStackTransition, v17, 0, *((_BYTE *)v2 + 24), 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "_queuePendingTransition:", v18);
      }
      v20[0] = v7;
      v20[1] = 3221225472;
      v20[2] = __66__SBModalViewControllerStack__performPendingTransitionIfNecessary__block_invoke_32;
      v20[3] = &unk_1E8EA02D8;
      v12 = &v21;
      v19 = v2;
      v21 = v19;
      v14 = &v22;
      v22 = v9;
      objc_msgSend(v8, "_removeViewController:completion:", v19, v20);
    }
    else
    {
      if (v10)
      {
LABEL_19:

        goto LABEL_20;
      }
      SBLogAlertItemStack();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v2;
        _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_INFO, "Beginning processing add view controller: %@", buf, 0xCu);
      }

      v23[0] = v7;
      v23[1] = 3221225472;
      v23[2] = __66__SBModalViewControllerStack__performPendingTransitionIfNecessary__block_invoke_31;
      v23[3] = &unk_1E8EA02D8;
      v12 = &v24;
      v13 = v2;
      v24 = v13;
      v14 = &v25;
      v25 = v9;
      objc_msgSend(v8, "_addViewController:completion:", v13, v23);
    }

    goto LABEL_19;
  }
  SBLogAlertItemStack();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_INFO, "Nothing to process.", buf, 2u);
  }

LABEL_20:
}

void __66__SBModalViewControllerStack__performPendingTransitionIfNecessary__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  BSDispatchQueueAssertMain();
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = v2;
  -[_SBModalViewControllerStackTransition invokeCompletionIfNecessaryWithResult:](v3);
  objc_msgSend(v4, "_setCurrentTransition:", 0);
  objc_msgSend(v4, "_performPendingTransitionIfNecessary");

}

uint64_t __66__SBModalViewControllerStack__performPendingTransitionIfNecessary__block_invoke_31(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  SBLogAlertItemStack();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_INFO, "Finished processing add view controller: %@", (uint8_t *)&v5, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __66__SBModalViewControllerStack__performPendingTransitionIfNecessary__block_invoke_32(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  SBLogAlertItemStack();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_INFO, "Finished processing remove view controller: %@", (uint8_t *)&v5, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_addViewController:(id)a3 completion:(id)a4
{
  _QWORD *v7;
  id v8;
  SBModalViewControllerStack *v9;
  void *v10;
  id v11;
  uint64_t v12;
  SBModalViewControllerStack *v13;
  id v14;
  _QWORD *v15;
  void (**v16)(_QWORD);
  void (**v17)(_QWORD);
  id v18;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  NSObject *v22;
  void *v23;
  SBModalViewControllerStack *v24;
  _QWORD v25[4];
  void (**v26)(_QWORD);
  _QWORD v27[4];
  SBModalViewControllerStack *v28;
  id v29;
  id v30;
  id v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v7)
  {
    if (v7[2])
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBModalViewControllerStack.m"), 256, CFSTR("We can only add operations here."));

    }
    v9 = self;
    v10 = (void *)v7[1];
  }
  else
  {
    v24 = self;
    v10 = 0;
  }
  v11 = v10;
  v12 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __60__SBModalViewControllerStack__addViewController_completion___block_invoke;
  v27[3] = &unk_1E8E9E248;
  v13 = self;
  v28 = v13;
  v14 = v11;
  v29 = v14;
  v15 = v7;
  v30 = v15;
  v16 = (void (**)(_QWORD))v8;
  v31 = v16;
  v17 = (void (**)(_QWORD))MEMORY[0x1D17E5550](v27);
  -[UIViewController presentedViewController](v13->_presentingViewController, "presentedViewController");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    SBLogAlertItemStack();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);
    if (v18 == v14)
    {
      if (v20)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0540000, v19, OS_LOG_TYPE_INFO, "Current view-controller is already presented, so we have nothing to do.", buf, 2u);
      }

      if (v16)
        v16[2](v16);
    }
    else
    {
      if (v20)
      {
        *(_DWORD *)buf = 138412546;
        v33 = v18;
        v34 = 2112;
        v35 = v14;
        _os_log_impl(&dword_1D0540000, v19, OS_LOG_TYPE_INFO, "Need to dismiss current presented view controller (%@) in order to present ourself (%@)", buf, 0x16u);
      }

      +[_SBModalViewControllerStackTransition transitionForViewController:operation:animated:completion:]((uint64_t)_SBModalViewControllerStackTransition, v18, 1uLL, 0, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v12;
      v25[1] = 3221225472;
      v25[2] = __60__SBModalViewControllerStack__addViewController_completion___block_invoke_36;
      v25[3] = &unk_1E8E9E8D0;
      v26 = v17;
      -[SBModalViewControllerStack _removeViewController:completion:](v13, "_removeViewController:completion:", v21, v25);

    }
  }
  else
  {
    SBLogAlertItemStack();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v22, OS_LOG_TYPE_INFO, "No current presented view controller, presenting straight away.", buf, 2u);
    }

    v17[2](v17);
  }

}

void __60__SBModalViewControllerStack__addViewController_completion___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL8 v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssertMain();
  v2 = *(id *)(a1 + 32);
  SBLogAlertItemStack();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = *(_QWORD *)(a1 + 40);
    v5 = v2[2];
    *(_DWORD *)buf = 138412546;
    v15 = v4;
    v16 = 2112;
    v17 = v5;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_INFO, "Really begin presenting view controller: %@ (presentingVC = %@)", buf, 0x16u);
  }

  objc_msgSend(v2, "_noteWillPresentViewController:", *(_QWORD *)(a1 + 40));
  v6 = (void *)v2[2];
  v8 = *(_QWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  if (v7)
    v9 = *(unsigned __int8 *)(v7 + 24) != 0;
  else
    v9 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__SBModalViewControllerStack__addViewController_completion___block_invoke_35;
  v10[3] = &unk_1E8E9F7B8;
  v11 = *(id *)(a1 + 32);
  v12 = *(id *)(a1 + 40);
  v13 = *(id *)(a1 + 56);
  objc_msgSend(v6, "presentViewController:animated:completion:", v8, v9, v10);

}

void __60__SBModalViewControllerStack__addViewController_completion___block_invoke_35(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssertMain();
  v2 = *(id *)(a1 + 32);
  SBLogAlertItemStack();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_INFO, "Really finished presenting view controller: %@", (uint8_t *)&v6, 0xCu);
  }

  objc_msgSend(v2, "_noteDidPresentViewController:", *(_QWORD *)(a1 + 40));
  v5 = *(_QWORD *)(a1 + 48);
  if (v5)
    (*(void (**)(void))(v5 + 16))();

}

uint64_t __60__SBModalViewControllerStack__addViewController_completion___block_invoke_36(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_removeViewController:(id)a3 completion:(id)a4
{
  _QWORD *v7;
  void (**v8)(_QWORD);
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  _BOOL8 v14;
  UIViewController *presentingViewController;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  SBModalViewControllerStack *v20;
  void (**v21)(_QWORD);
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(_QWORD))a4;
  if (v7)
  {
    if (v7[2] != 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBModalViewControllerStack.m"), 303, CFSTR("We can only remove operations here."));

    }
    v9 = (void *)v7[1];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBModalViewControllerStack.m"), 303, CFSTR("We can only remove operations here."));

    v9 = 0;
  }
  v10 = v9;
  -[UIViewController presentedViewController](self->_presentingViewController, "presentedViewController");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  SBLogAlertItemStack();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
  if (v11 == v10)
  {
    if (v13)
    {
      *(_DWORD *)buf = 138412290;
      v23 = v10;
      _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_INFO, "Really begin dismissing topmost view controller: %@", buf, 0xCu);
    }

    if (v7)
    {
      -[SBModalViewControllerStack _noteWillDismissViewController:animated:](self, "_noteWillDismissViewController:animated:", v10, *((unsigned __int8 *)v7 + 24));
      v14 = *((_BYTE *)v7 + 24) != 0;
    }
    else
    {
      -[SBModalViewControllerStack _noteWillDismissViewController:animated:](self, "_noteWillDismissViewController:animated:", v10, 0);
      v14 = 0;
    }
    presentingViewController = self->_presentingViewController;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __63__SBModalViewControllerStack__removeViewController_completion___block_invoke;
    v18[3] = &unk_1E8E9F7B8;
    v19 = v10;
    v20 = self;
    v21 = v8;
    -[UIViewController dismissViewControllerAnimated:completion:](presentingViewController, "dismissViewControllerAnimated:completion:", v14, v18);

  }
  else
  {
    if (v13)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_INFO, "There is no presented view-controller to dismiss.", buf, 2u);
    }

    if (v8)
      v8[2](v8);
  }

}

uint64_t __63__SBModalViewControllerStack__removeViewController_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t result;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssertMain();
  SBLogAlertItemStack();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_INFO, "Really finished dismissing topmost view controller: %@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "_noteDidDismissViewController:", *(_QWORD *)(a1 + 32));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_noteWillPresentViewController:(id)a3
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  BSDispatchQueueAssertMain();
  SBLogAlertItemStack();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "Calling out to delegate for willPresent: %@", (uint8_t *)&v7, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "modalViewControllerStack:willPresentViewController:", self, v4);

}

- (void)_noteDidPresentViewController:(id)a3
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  BSDispatchQueueAssertMain();
  SBLogAlertItemStack();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "Calling out to delegate for didPresent: %@", (uint8_t *)&v7, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "modalViewControllerStack:didPresentViewController:", self, v4);

}

- (void)_noteWillDismissViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  id WeakRetained;
  int v9;
  id v10;
  uint64_t v11;

  v4 = a4;
  v11 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  BSDispatchQueueAssertMain();
  SBLogAlertItemStack();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_INFO, "Calling out to delegate for willDismiss: %@", (uint8_t *)&v9, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "modalViewControllerStack:willDismissViewController:animated:", self, v6, v4);

}

- (void)_noteDidDismissViewController:(id)a3
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  BSDispatchQueueAssertMain();
  SBLogAlertItemStack();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "Calling out to delegate for didDismiss: %@", (uint8_t *)&v7, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "modalViewControllerStack:didDismissViewController:", self, v4);

}

- (SBModalViewControllerStackDelegate)delegate
{
  return (SBModalViewControllerStackDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingTransitions, 0);
  objc_storeStrong((id *)&self->_currentTransition, 0);
  objc_storeStrong((id *)&self->_viewControllerStack, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
