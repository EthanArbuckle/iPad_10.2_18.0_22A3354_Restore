@implementation SBSBackgroundActivityCoordinator

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  SBLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18EB52000, v3, OS_LOG_TYPE_INFO, "SBSBackgroundActivityCoordinator: Automatically canceling coordinator registration due to dealloc of coordinator.", buf, 2u);
  }

  -[SBSBackgroundActivityCoordinator setRegisteredBackgroundActivityIdentifiers:reply:](self, "setRegisteredBackgroundActivityIdentifiers:reply:", 0, &__block_literal_global_52);
  v4.receiver = self;
  v4.super_class = (Class)SBSBackgroundActivityCoordinator;
  -[SBSBackgroundActivityCoordinator dealloc](&v4, sel_dealloc);
}

void __43__SBSBackgroundActivityCoordinator_dealloc__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  SBLogCommon();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_18EB52000, v0, OS_LOG_TYPE_INFO, "Sucessfully unregistered from all overrides", v1, 2u);
  }

}

- (void)setRegisteredBackgroundActivityIdentifiers:(id)a3 reply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSSet *v9;
  NSSet *backgroundActivityIdentifiers;
  NSUInteger v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _QWORD block[4];
  id v16;
  uint8_t buf[4];
  SBSBackgroundActivityCoordinator *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  SBLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v18 = self;
    _os_log_impl(&dword_18EB52000, v8, OS_LOG_TYPE_INFO, "SBSBackgroundActivityCoordinator: updating registration for coordinator %@", buf, 0xCu);
  }

  v9 = (NSSet *)objc_msgSend(v7, "copy");
  backgroundActivityIdentifiers = self->_backgroundActivityIdentifiers;
  self->_backgroundActivityIdentifiers = v9;

  v11 = -[NSSet count](self->_backgroundActivityIdentifiers, "count");
  +[SBSBackgroundActivityAssertionManager sharedInstance](SBSBackgroundActivityAssertionManager, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11)
  {
    objc_msgSend(v12, "updateRegistrationForCoordinator:reply:", self, v6);
LABEL_7:

    goto LABEL_8;
  }
  objc_msgSend(v12, "unregisterCoordinator");

  if (v6)
  {
    dispatch_get_global_queue(25, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __85__SBSBackgroundActivityCoordinator_setRegisteredBackgroundActivityIdentifiers_reply___block_invoke;
    block[3] = &unk_1E288D310;
    v16 = v6;
    dispatch_async(v14, block);

    v13 = v16;
    goto LABEL_7;
  }
LABEL_8:

}

uint64_t __85__SBSBackgroundActivityCoordinator_setRegisteredBackgroundActivityIdentifiers_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_handleStatusBarTapWithContext:(id)a3 withCompletionBlock:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  soft_STBackgroundActivityIdentifiersDescription((uint64_t)self->_backgroundActivityIdentifiers);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v12 = 138412290;
    v13 = v8;
    _os_log_impl(&dword_18EB52000, v9, OS_LOG_TYPE_INFO, "SBSBackgroundActivityCoordinator: sending status bar tap to delegate for background activities (%@)", (uint8_t *)&v12, 0xCu);
  }

  -[SBSBackgroundActivityCoordinator delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "statusBarCoordinator:receivedTapWithContext:completionBlock:", self, v6, v7);
  }
  else if (v7)
  {
    v7[2](v7);
  }

}

- (void)_registrationInvalidated:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id WeakRetained;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  soft_STBackgroundActivityIdentifiersDescription((uint64_t)self->_backgroundActivityIdentifiers);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8 = 138412546;
    v9 = v5;
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_18EB52000, v6, OS_LOG_TYPE_INFO, "SBSBackgroundActivityCoordinator: Registration cancelled for style background activities (%@). Error: %@", (uint8_t *)&v8, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "statusBarCoordinator:invalidatedRegistrationWithError:", self, v4);

}

- (void)setRegisteredStyleOverrides:(unint64_t)a3 reply:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  soft_STUIBackgroundActivityIdentifiersForStyleOverrides(a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[SBSBackgroundActivityCoordinator setRegisteredBackgroundActivityIdentifiers:reply:](self, "setRegisteredBackgroundActivityIdentifiers:reply:", v7, v6);

}

- (unint64_t)styleOverrides
{
  return soft_STUIStyleOverridesForBackgroundActivityIdentifiers((uint64_t)-[SBSBackgroundActivityCoordinator backgroundActivityIdentifiers](self, "backgroundActivityIdentifiers"));
}

- (SBSBackgroundActivityCoordinatorDelegate)delegate
{
  return (SBSBackgroundActivityCoordinatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSSet)backgroundActivityIdentifiers
{
  return self->_backgroundActivityIdentifiers;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_backgroundActivityIdentifiers, 0);
}

@end
