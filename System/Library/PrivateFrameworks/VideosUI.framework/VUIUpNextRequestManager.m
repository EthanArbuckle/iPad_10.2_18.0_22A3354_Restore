@implementation VUIUpNextRequestManager

+ (id)sharedInstance
{
  if (sharedInstance___onceToken_5 != -1)
    dispatch_once(&sharedInstance___onceToken_5, &__block_literal_global_42);
  return (id)sharedInstance___instance_3;
}

void __41__VUIUpNextRequestManager_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[VUIUpNextRequestManager _init]([VUIUpNextRequestManager alloc], "_init");
  v1 = (void *)sharedInstance___instance_3;
  sharedInstance___instance_3 = (uint64_t)v0;

}

- (id)_init
{
  VUIUpNextRequestManager *v2;
  uint64_t v3;
  NSMutableDictionary *ongoingCanonicalIDOperationDictionary;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VUIUpNextRequestManager;
  v2 = -[VUIUpNextRequestManager init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    ongoingCanonicalIDOperationDictionary = v2->_ongoingCanonicalIDOperationDictionary;
    v2->_ongoingCanonicalIDOperationDictionary = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (VUIUpNextRequestManager)init
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("Unimplemented"), CFSTR("-[VUIUpNextRequestManager init] not supported, use +sharedInstance instead"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (void)sendRequestForCanonicalID:(id)a3 action:(unint64_t)a4 confirmationShouldWaitCompletion:(BOOL)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id from;
  id location;

  v7 = a3;
  -[NSMutableDictionary objectForKey:](self->_ongoingCanonicalIDOperationDictionary, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && (objc_msgSend(v8, "isCancelled") & 1) == 0)
  {
    if (objc_msgSend(v9, "action") != a4)
    {
      objc_msgSend(v9, "cancel");
      -[NSMutableDictionary removeObjectForKey:](self->_ongoingCanonicalIDOperationDictionary, "removeObjectForKey:", v7);
    }
  }
  else
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC8888]), "initWithAction:canonicalID:caller:", a4, v7, 0);
    if (v10)
    {
      objc_initWeak(&location, v10);
      objc_initWeak(&from, self);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __93__VUIUpNextRequestManager_sendRequestForCanonicalID_action_confirmationShouldWaitCompletion___block_invoke;
      v13[3] = &unk_1E9F9C168;
      objc_copyWeak(&v15, &location);
      objc_copyWeak(&v16, &from);
      v11 = v7;
      v14 = v11;
      objc_msgSend(v10, "setCompletionBlock:", v13);
      -[NSMutableDictionary setValue:forKey:](self->_ongoingCanonicalIDOperationDictionary, "setValue:forKey:", v10, v11);
      objc_msgSend(MEMORY[0x1E0CB3828], "wlkDefaultQueue");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addOperation:", v10);

      objc_destroyWeak(&v16);
      objc_destroyWeak(&v15);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);

    }
  }

}

void __93__VUIUpNextRequestManager_sendRequestForCanonicalID_action_confirmationShouldWaitCompletion___block_invoke(id *a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;
  id v12;
  id v13;

  WeakRetained = objc_loadWeakRetained(a1 + 5);
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(WeakRetained, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vui_setObjectIfNotNil:forKey:", v4, CFSTR("Error"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(WeakRetained, "action"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vui_setObjectIfNotNil:forKey:", v5, CFSTR("Action"));

  v6 = objc_loadWeakRetained(a1 + 6);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93__VUIUpNextRequestManager_sendRequestForCanonicalID_action_confirmationShouldWaitCompletion___block_invoke_2;
  block[3] = &unk_1E9F9C2F0;
  block[4] = v6;
  v10 = a1[4];
  v11 = WeakRetained;
  v7 = WeakRetained;
  objc_copyWeak(&v13, a1 + 6);
  v12 = v3;
  v8 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v13);
}

void __93__VUIUpNextRequestManager_sendRequestForCanonicalID_action_confirmationShouldWaitCompletion___block_invoke_2(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  dispatch_time_t v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;

  objc_msgSend(a1[4], "ongoingCanonicalIDOperationDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", a1[5]);

  if (objc_msgSend(a1[6], "action") == 1
    && (+[VUIFeaturesConfiguration sharedInstance](VUIFeaturesConfiguration, "sharedInstance"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "upNextConfig"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "upNextRefreshCallDelayAfterRemoveFromUpNext"),
        v4,
        v3,
        v5 >= 1))
  {
    v6 = dispatch_time(0, 1000000 * v5);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __93__VUIUpNextRequestManager_sendRequestForCanonicalID_action_confirmationShouldWaitCompletion___block_invoke_3;
    block[3] = &unk_1E9F99000;
    objc_copyWeak(&v10, a1 + 8);
    v8 = a1[5];
    v9 = a1[7];
    dispatch_after(v6, MEMORY[0x1E0C80D38], block);

    objc_destroyWeak(&v10);
  }
  else
  {
    objc_msgSend(a1[4], "_postUpNextRequestFinishedNotificationForCanonicalId:userInfo:", a1[5], a1[7]);
  }
}

void __93__VUIUpNextRequestManager_sendRequestForCanonicalID_action_confirmationShouldWaitCompletion___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_postUpNextRequestFinishedNotificationForCanonicalId:userInfo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_displayConfirmationForAction:(unint64_t)a3
{
  __CFString **v4;
  __CFString *v5;
  id v6;

  +[VUIApplicationRouter topPresentedViewController](VUIApplicationRouter, "topPresentedViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (a3)
    {
      if (a3 != 1)
      {
        v5 = 0;
        goto LABEL_8;
      }
      v4 = VUIConfirmationDialogTypeUpNextRemoved;
    }
    else
    {
      v4 = VUIConfirmationDialogTypeUpNextAdded;
    }
    v5 = *v4;
LABEL_8:
    objc_msgSend(v6, "presentConfirmationDialogWithType:", v5);

  }
}

- (void)_postUpNextRequestFinishedNotificationForCanonicalId:(id)a3 userInfo:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v5 = (void *)MEMORY[0x1E0CB37D0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("VUIUpNextRequestDidFinishNotification"), v7, v6);

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "vui_postNotificationName:object:userInfo:", CFSTR("com.apple.VideosUI.UpNextRequestDidFinishNotification"), v7, v6);

}

- (NSMutableDictionary)ongoingCanonicalIDOperationDictionary
{
  return self->_ongoingCanonicalIDOperationDictionary;
}

- (void)setOngoingCanonicalIDOperationDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_ongoingCanonicalIDOperationDictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ongoingCanonicalIDOperationDictionary, 0);
}

- (void)sendRequestForCanonicalID:(os_log_t)log action:confirmationShouldWaitCompletion:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D96EE000, log, OS_LOG_TYPE_ERROR, "VUIUpNextRequestManager -- caught exception while getting request operation", v1, 2u);
}

@end
