@implementation PKLaunchAuthorizationPromptController

- (PKLaunchAuthorizationPromptController)initWithContext:(int64_t)a3 dataProvider:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  PKLaunchAuthorizationPromptController *v11;
  PKLaunchAuthorizationPromptController *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PKLaunchAuthorizationPromptController;
  v11 = -[PKLaunchAuthorizationPromptController init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_context = a3;
    objc_storeStrong((id *)&v11->_dataProvider, a4);
    objc_storeWeak((id *)&v12->_delegate, v10);
    v12->_shouldShowLaunchPrompts = 1;
  }

  return v12;
}

void __79__PKLaunchAuthorizationPromptController_presentLaunchPromptsForPassesIfNeeded___block_invoke_2(id *a1, char a2, void *a3)
{
  NSObject *v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;
  id v11;
  id v12[2];
  char v13;

  v6 = a1[4];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__PKLaunchAuthorizationPromptController_presentLaunchPromptsForPassesIfNeeded___block_invoke_3;
  block[3] = &unk_1E3E74620;
  objc_copyWeak(v12, a1 + 8);
  v11 = a1[7];
  v8 = a1[5];
  v13 = a2;
  v9 = a1[6];
  v12[1] = a3;
  v10 = a1[4];
  dispatch_async(v6, block);

  objc_destroyWeak(v12);
}

- (void)resetLaunchPromptsForNextSession
{
  self->_shouldShowLaunchPrompts = 0;
  self->_evaluatingPresentment = 0;
  self->_locationAuthorizationRequested = 0;
}

- (void)enableLaunchPromptsForSession
{
  if (self->_shouldShowLaunchPrompts != 2)
    self->_shouldShowLaunchPrompts = 1;
}

void __79__PKLaunchAuthorizationPromptController_presentLaunchPromptsForPassesIfNeeded___block_invoke_17(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  NSObject *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v9 = WeakRetained;
  if (WeakRetained && (objc_msgSend(WeakRetained, "_canPresentPrompt") & 1) != 0)
  {
    dispatch_get_global_queue(0, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __79__PKLaunchAuthorizationPromptController_presentLaunchPromptsForPassesIfNeeded___block_invoke_2_18;
    v11[3] = &unk_1E3E65E08;
    v11[4] = v9;
    v12 = *(id *)(a1 + 32);
    v14 = v7;
    v13 = v6;
    dispatch_async(v10, v11);

  }
  else
  {
    (*((void (**)(id, id, _QWORD))v7 + 2))(v7, v6, 0);
  }

}

- (void)presentLaunchPromptsForPassesIfNeeded:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  PKLaunchAuthorizationPromptController *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint8_t buf[16];
  _QWORD v22[4];
  NSObject *v23;
  id v24;
  id v25;
  id location;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C80D38];
  v6 = MEMORY[0x1E0C80D38];
  if (self->_shouldShowLaunchPrompts == 1 && !self->_evaluatingPresentment)
  {
    self->_evaluatingPresentment = 1;
    objc_initWeak(&location, self);
    v7 = objc_alloc_init(MEMORY[0x1E0D66B90]);
    v8 = MEMORY[0x1E0C809B0];
    if (self->_userNotificationAuthorizationViewController)
    {
      PKLogFacilityTypeGetObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, "PKLaunchAuthorizationPromptController: Skipping notification auth presentation due to other launch activity", buf, 2u);
      }
    }
    else
    {
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __79__PKLaunchAuthorizationPromptController_presentLaunchPromptsForPassesIfNeeded___block_invoke;
      v22[3] = &unk_1E3E64410;
      v23 = v4;
      v10 = v5;
      v24 = v5;
      objc_copyWeak(&v25, &location);
      objc_msgSend(v7, "addOperation:", v22);
      objc_destroyWeak(&v25);

      v9 = v23;
    }

    if (!self->_locationAuthorizationRequested)
    {
      self->_locationAuthorizationRequested = 1;
      v18[0] = v8;
      v18[1] = 3221225472;
      v18[2] = __79__PKLaunchAuthorizationPromptController_presentLaunchPromptsForPassesIfNeeded___block_invoke_17;
      v18[3] = &unk_1E3E677A0;
      v11 = v5;
      v19 = v5;
      objc_copyWeak(&v20, &location);
      objc_msgSend(v7, "addOperation:", v18);
      objc_destroyWeak(&v20);

    }
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v8;
    v15[1] = 3221225472;
    v15[2] = __79__PKLaunchAuthorizationPromptController_presentLaunchPromptsForPassesIfNeeded___block_invoke_4;
    v15[3] = &unk_1E3E74670;
    v13 = v5;
    v16 = v5;
    v17 = self;
    v14 = (id)objc_msgSend(v7, "evaluateWithInput:completion:", v12, v15);

    objc_destroyWeak(&location);
  }

}

void __79__PKLaunchAuthorizationPromptController_presentLaunchPromptsForPassesIfNeeded___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0D67768], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __79__PKLaunchAuthorizationPromptController_presentLaunchPromptsForPassesIfNeeded___block_invoke_2;
  v15[3] = &unk_1E3E74648;
  v11 = *(_QWORD *)(a1 + 32);
  v16 = *(id *)(a1 + 40);
  objc_copyWeak(&v20, (id *)(a1 + 48));
  v12 = v9;
  v19 = v12;
  v13 = v8;
  v17 = v13;
  v14 = v10;
  v18 = v14;
  objc_msgSend(v14, "shouldOfferAuthorizationPromptWithPasses:completion:", v11, v15);

  objc_destroyWeak(&v20);
}

void __79__PKLaunchAuthorizationPromptController_presentLaunchPromptsForPassesIfNeeded___block_invoke_3(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  PKUserNotificationAuthorizationExplanationViewController *v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  uint8_t buf[16];

  v2 = (id *)(a1 + 64);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v4 = WeakRetained;
  if (!WeakRetained || !*(_BYTE *)(a1 + 80))
  {
LABEL_8:
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    goto LABEL_9;
  }
  if ((objc_msgSend(WeakRetained, "_canPresentPrompt") & 1) == 0)
  {
    PKLogFacilityTypeGetObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19D178000, v7, OS_LOG_TYPE_DEFAULT, "PKLaunchAuthorizationPromptController: Skipping notification TCC warming screen as we are unable to present in the current state", buf, 2u);
    }

    goto LABEL_8;
  }
  v5 = -[PKUserNotificationAuthorizationExplanationViewController initWithController:contentType:context:dataProvider:]([PKUserNotificationAuthorizationExplanationViewController alloc], "initWithController:contentType:context:dataProvider:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72), *((_QWORD *)v4 + 1), *((_QWORD *)v4 + 2));
  objc_storeStrong((id *)v4 + 6, v5);
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __79__PKLaunchAuthorizationPromptController_presentLaunchPromptsForPassesIfNeeded___block_invoke_9;
  v13[3] = &unk_1E3E745D0;
  v14 = *(id *)(a1 + 48);
  objc_copyWeak(&v17, v2);
  v16 = *(id *)(a1 + 56);
  v15 = *(id *)(a1 + 32);
  -[PKUserNotificationAuthorizationExplanationViewController setNextStepHandler:](v5, "setNextStepHandler:", v13);
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __79__PKLaunchAuthorizationPromptController_presentLaunchPromptsForPassesIfNeeded___block_invoke_3_12;
  v8[3] = &unk_1E3E745F8;
  v9 = *(id *)(a1 + 48);
  objc_copyWeak(&v12, v2);
  v11 = *(id *)(a1 + 56);
  v10 = *(id *)(a1 + 32);
  -[PKUserNotificationAuthorizationExplanationViewController preflightWithCompletion:](v5, "preflightWithCompletion:", v8);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v17);

LABEL_9:
}

void __79__PKLaunchAuthorizationPromptController_presentLaunchPromptsForPassesIfNeeded___block_invoke_9(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;
  id v5;
  id v6;

  v2 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__PKLaunchAuthorizationPromptController_presentLaunchPromptsForPassesIfNeeded___block_invoke_2_10;
  block[3] = &unk_1E3E61478;
  objc_copyWeak(&v6, (id *)(a1 + 56));
  v5 = *(id *)(a1 + 48);
  v4 = *(id *)(a1 + 40);
  dispatch_async(v2, block);

  objc_destroyWeak(&v6);
}

void __79__PKLaunchAuthorizationPromptController_presentLaunchPromptsForPassesIfNeeded___block_invoke_2_10(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  _QWORD *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = (void *)WeakRetained[6];
    WeakRetained[6] = 0;
    v4 = WeakRetained;

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    WeakRetained = v4;
  }

}

void __79__PKLaunchAuthorizationPromptController_presentLaunchPromptsForPassesIfNeeded___block_invoke_3_12(uint64_t a1)
{
  id WeakRetained;
  id v3;
  PKNavigationController *v4;
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained && (objc_msgSend(WeakRetained, "_canPresentPrompt") & 1) != 0)
  {
    v4 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", *((_QWORD *)v3 + 6));
    -[PKNavigationController setNavigationBarHidden:](v4, "setNavigationBarHidden:", 1);
    if (-[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](v4, "pkui_userInterfaceIdiomSupportsLargeLayouts"))
    {
      -[PKNavigationController setModalPresentationStyle:](v4, "setModalPresentationStyle:", 1);
    }
    v5 = objc_loadWeakRetained((id *)v3 + 3);
    objc_msgSend(v5, "presentLaunchPromptViewController:", v4);

  }
  else
  {
    PKLogFacilityTypeGetObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_19D178000, v6, OS_LOG_TYPE_DEFAULT, "PKLaunchAuthorizationPromptController: Skipping notification TCC warming screen just before presenting as we are no longer able to present in the current state", v7, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __79__PKLaunchAuthorizationPromptController_presentLaunchPromptsForPassesIfNeeded___block_invoke_2_18(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  id v11;

  v2 = objc_alloc(MEMORY[0x1E0C9E3C8]);
  PKPassKitCoreBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundlePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithEffectiveBundlePath:delegate:onQueue:", v4, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  v6 = *(NSObject **)(a1 + 40);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__PKLaunchAuthorizationPromptController_presentLaunchPromptsForPassesIfNeeded___block_invoke_3_20;
  block[3] = &unk_1E3E61450;
  v9 = v5;
  v11 = *(id *)(a1 + 56);
  v10 = *(id *)(a1 + 48);
  v7 = v5;
  dispatch_async(v6, block);

}

uint64_t __79__PKLaunchAuthorizationPromptController_presentLaunchPromptsForPassesIfNeeded___block_invoke_3_20(uint64_t a1)
{
  if (!objc_msgSend(*(id *)(a1 + 32), "authorizationStatus"))
    objc_msgSend(*(id *)(a1 + 32), "requestWhenInUseAuthorization");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __79__PKLaunchAuthorizationPromptController_presentLaunchPromptsForPassesIfNeeded___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 40), "resetLaunchPromptsForNextSession");
}

- (void)disableLaunchPromptsForSession
{
  self->_shouldShowLaunchPrompts = 2;
  self->_evaluatingPresentment = 0;
}

- (BOOL)isPresentingNotificationAuthorizationPrompt
{
  PKUserNotificationAuthorizationExplanationViewController *userNotificationAuthorizationViewController;

  userNotificationAuthorizationViewController = self->_userNotificationAuthorizationViewController;
  if (userNotificationAuthorizationViewController)
    LOBYTE(userNotificationAuthorizationViewController) = -[PKUserNotificationAuthorizationExplanationViewController isPresentingNotificationAuthorizationPrompt](userNotificationAuthorizationViewController, "isPresentingNotificationAuthorizationPrompt");
  return (char)userNotificationAuthorizationViewController;
}

- (BOOL)_canPresentPrompt
{
  PKLaunchAuthorizationPromptDelegate **p_delegate;
  id WeakRetained;
  id v5;
  BOOL v6;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_delegate);
    if (objc_msgSend(v5, "canPresentLaunchPrompts"))
      v6 = self->_shouldShowLaunchPrompts == 1;
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __79__PKLaunchAuthorizationPromptController_locationManagerDidChangeAuthorization___block_invoke;
  v6[3] = &unk_1E3E61388;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __79__PKLaunchAuthorizationPromptController_locationManagerDidChangeAuthorization___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 40), "authorizationStatus");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) = (_DWORD)result != 0;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userNotificationAuthorizationViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dataProvider, 0);
}

@end
