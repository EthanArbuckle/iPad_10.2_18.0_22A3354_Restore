@implementation VUIUpNextButtonProperties

- (void)updateButtonContentView
{
  id v3;

  -[VUIUpNextButtonProperties delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (-[VUIUpNextButtonProperties isWatchListed](self, "isWatchListed"))
    objc_msgSend(v3, "upNextStateChangedToAdded");
  else
    objc_msgSend(v3, "upNextStateChangedToRemoved");

}

- (void)setupNotificationObserver
{
  void *v3;
  void *v4;
  id v5;

  -[VUIUpNextButtonProperties canonicalID](self, "canonicalID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = v3;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__updatingState_, CFSTR("VUIUpNextRequestDidFinishNotification"), 0);

    v3 = v5;
  }

}

- (void)setIsWatchListed:(BOOL)a3
{
  self->_isWatchListed = a3;
}

- (void)setDismissOnSelect:(BOOL)a3
{
  self->_dismissOnSelect = a3;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setCurrentImageView:(id)a3
{
  objc_storeStrong((id *)&self->_currentImageView, a3);
}

- (void)setCanonicalID:(id)a3
{
  objc_storeStrong((id *)&self->_canonicalID, a3);
}

- (VUIUpNextStateView)removedStateView
{
  return self->_removedStateView;
}

- (void)removeNotificationObserver
{
  void *v3;
  void *v4;
  id v5;

  -[VUIUpNextButtonProperties canonicalID](self, "canonicalID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = v3;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("VUIUpNextRequestDidFinishNotification"), 0);

    v3 = v5;
  }

}

- (BOOL)isWatchListed
{
  return self->_isWatchListed;
}

- (VUIUpNextButtonProperties)init
{
  VUIUpNextButtonProperties *v2;
  uint64_t v3;
  VUIUpNextStateView *addedStateView;
  uint64_t v5;
  VUIUpNextStateView *removedStateView;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VUIUpNextButtonProperties;
  v2 = -[VUIUpNextButtonProperties init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    addedStateView = v2->_addedStateView;
    v2->_addedStateView = (VUIUpNextStateView *)v3;

    v5 = objc_opt_new();
    removedStateView = v2->_removedStateView;
    v2->_removedStateView = (VUIUpNextStateView *)v5;

  }
  return v2;
}

- (VUIUpNextButtonProtocol)delegate
{
  return (VUIUpNextButtonProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (UIView)currentImageView
{
  return self->_currentImageView;
}

- (NSString)canonicalID
{
  return self->_canonicalID;
}

- (VUIUpNextStateView)addedStateView
{
  return self->_addedStateView;
}

- (void)_toggleUpNextState
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__VUIUpNextButtonProperties__toggleUpNextState__block_invoke;
  block[3] = &unk_1E9F98DF0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __47__VUIUpNextButtonProperties__toggleUpNextState__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "dismissOnSelect");
  if ((result & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "setIsWatchListed:", objc_msgSend(*(id *)(a1 + 32), "isWatchListed") ^ 1);
    return objc_msgSend(*(id *)(a1 + 32), "updateButtonContentView");
  }
  return result;
}

- (void)callAPIAndToggleUpNextState
{
  _BOOL4 v3;
  const __CFString *v4;
  NSString *canonicalID;
  void *v6;
  _BOOL8 confirmationShouldWaitCompletion;
  NSString *v8;
  void *v9;
  void *v10;
  VUIActionUpdateUpNext *v11;
  _QWORD v12[4];
  VUIActionUpdateUpNext *v13;
  id v14;
  id location;
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  v3 = -[VUIUpNextButtonProperties isWatchListed](self, "isWatchListed");
  v4 = CFSTR("removed");
  if (v3)
    v4 = CFSTR("added");
  canonicalID = self->_canonicalID;
  v16[0] = CFSTR("itemID");
  v16[1] = CFSTR("state");
  v17[0] = canonicalID;
  v17[1] = v4;
  v16[2] = CFSTR("confirmationShouldWaitCompletion");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  confirmationShouldWaitCompletion = self->_confirmationShouldWaitCompletion;
  v8 = canonicalID;
  objc_msgSend(v6, "numberWithBool:", confirmationShouldWaitCompletion);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[VUIActionUpdateUpNext initWithContextData:]([VUIActionUpdateUpNext alloc], "initWithContextData:", v10);
  if (-[VUIActionUpdateUpNext isAccountRequired](v11, "isAccountRequired")
    && !+[VUIAuthenticationManager userHasActiveAccount](VUIAuthenticationManager, "userHasActiveAccount")
    && +[VUIAuthenticationManager allowsAccountModification](VUIAuthenticationManager, "allowsAccountModification"))
  {
    objc_initWeak(&location, self);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __56__VUIUpNextButtonProperties_callAPIAndToggleUpNextState__block_invoke;
    v12[3] = &unk_1E9F9F040;
    objc_copyWeak(&v14, &location);
    v13 = v11;
    +[VUIAuthenticationManager requestAuthenticationAlwaysPrompt:withCompletionHandler:](VUIAuthenticationManager, "requestAuthenticationAlwaysPrompt:withCompletionHandler:", 1, v12);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    -[VUIUpNextButtonProperties _toggleUpNextState](self, "_toggleUpNextState");
    -[VUIActionUpdateUpNext performWithTargetResponder:completionHandler:](v11, "performWithTargetResponder:completionHandler:", 0, 0);
  }

}

void __56__VUIUpNextButtonProperties_callAPIAndToggleUpNextState__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (a2)
  {
    objc_msgSend(WeakRetained, "_toggleUpNextState");
    objc_msgSend(*(id *)(a1 + 32), "performWithTargetResponder:completionHandler:", 0, 0);
  }
  else
  {
    VUIDefaultLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = 138412290;
      v10 = v5;
      _os_log_impl(&dword_1D96EE000, v8, OS_LOG_TYPE_INFO, "VUIUpNextButtonProperties:: Authentication request failed with error: %@", (uint8_t *)&v9, 0xCu);
    }

  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("VUIUpNextRequestDidFinishNotification"), 0);

  v4.receiver = self;
  v4.super_class = (Class)VUIUpNextButtonProperties;
  -[VUIUpNextButtonProperties dealloc](&v4, sel_dealloc);
}

- (void)_updatingState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  id v13;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", CFSTR("Error"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", CFSTR("Action"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[VUIUpNextButtonProperties canonicalID](self, "canonicalID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqualToString:", v8);

    if (v9)
    {
      v10 = objc_msgSend(v6, "unsignedIntegerValue");
      if (v5)
        v11 = v6 == 0;
      else
        v11 = 1;
      if (!v11)
      {
        if (v10 == 1)
        {
          if (-[VUIUpNextButtonProperties isWatchListed](self, "isWatchListed"))
            goto LABEL_21;
        }
        else if (v10 || !-[VUIUpNextButtonProperties isWatchListed](self, "isWatchListed"))
        {
          goto LABEL_21;
        }
        v12 = -[VUIUpNextButtonProperties isWatchListed](self, "isWatchListed") ^ 1;
LABEL_20:
        -[VUIUpNextButtonProperties setIsWatchListed:](self, "setIsWatchListed:", v12);
        -[VUIUpNextButtonProperties updateButtonContentView](self, "updateButtonContentView");
        goto LABEL_21;
      }
      if (v10 == 1)
      {
        if (!-[VUIUpNextButtonProperties isWatchListed](self, "isWatchListed"))
          goto LABEL_21;
        v12 = 0;
        goto LABEL_20;
      }
      if (!v10 && !-[VUIUpNextButtonProperties isWatchListed](self, "isWatchListed"))
      {
        v12 = 1;
        goto LABEL_20;
      }
    }
  }
LABEL_21:

}

- (BOOL)dismissOnSelect
{
  return self->_dismissOnSelect;
}

- (BOOL)confirmationShouldWaitCompletion
{
  return self->_confirmationShouldWaitCompletion;
}

- (void)setConfirmationShouldWaitCompletion:(BOOL)a3
{
  self->_confirmationShouldWaitCompletion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_canonicalID, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentImageView, 0);
  objc_storeStrong((id *)&self->_removedStateView, 0);
  objc_storeStrong((id *)&self->_addedStateView, 0);
}

@end
