@implementation SBActivityBannerObserver

- (SBActivityBannerObserver)init
{
  SBActivityBannerObserver *v2;
  uint64_t v3;
  NSMutableSet *prominentAlertPresentingActivities;
  uint64_t v5;
  NSMutableDictionary *itemByActivityIdentifier;
  uint64_t v7;
  NSMutableDictionary *bannerPresentableByActivityIdentifier;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBActivityBannerObserver;
  v2 = -[SBActivityBannerObserver init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    prominentAlertPresentingActivities = v2->_prominentAlertPresentingActivities;
    v2->_prominentAlertPresentingActivities = (NSMutableSet *)v3;

    v5 = objc_opt_new();
    itemByActivityIdentifier = v2->_itemByActivityIdentifier;
    v2->_itemByActivityIdentifier = (NSMutableDictionary *)v5;

    v7 = objc_opt_new();
    bannerPresentableByActivityIdentifier = v2->_bannerPresentableByActivityIdentifier;
    v2->_bannerPresentableByActivityIdentifier = (NSMutableDictionary *)v7;

    v2->_activityEnvironment = 0;
  }
  return v2;
}

- (void)dealloc
{
  NSMutableSet *prominentAlertPresentingActivities;
  NSMutableDictionary *itemByActivityIdentifier;
  NSMutableDictionary *bannerPresentableByActivityIdentifier;
  objc_super v6;

  prominentAlertPresentingActivities = self->_prominentAlertPresentingActivities;
  self->_prominentAlertPresentingActivities = 0;

  itemByActivityIdentifier = self->_itemByActivityIdentifier;
  self->_itemByActivityIdentifier = 0;

  bannerPresentableByActivityIdentifier = self->_bannerPresentableByActivityIdentifier;
  self->_bannerPresentableByActivityIdentifier = 0;

  v6.receiver = self;
  v6.super_class = (Class)SBActivityBannerObserver;
  -[SBActivityBannerObserver dealloc](&v6, sel_dealloc);
}

- (void)activityDidStart:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](self->_itemByActivityIdentifier, "setObject:forKey:", v4, v5);

}

- (void)activityDidEnd:(id)a3
{
  id v4;

  objc_msgSend(a3, "identifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBActivityBannerObserver _dismissBannerWithActivityIdentifier:](self, "_dismissBannerWithActivityIdentifier:", v4);
  -[NSMutableDictionary removeObjectForKey:](self->_itemByActivityIdentifier, "removeObjectForKey:", v4);

}

- (void)activityDidDismiss:(id)a3
{
  id v4;

  objc_msgSend(a3, "identifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBActivityBannerObserver _dismissBannerWithActivityIdentifier:](self, "_dismissBannerWithActivityIdentifier:", v4);
  -[NSMutableDictionary removeObjectForKey:](self->_itemByActivityIdentifier, "removeObjectForKey:", v4);

}

- (BOOL)shouldHandleActivityItem:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  char v9;

  if (!a3)
    return 0;
  objc_msgSend(a3, "descriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentationOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "destinations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "bs_containsObjectPassingTest:", &__block_literal_global_325);

  +[SBLiveActivityDomain rootSettings](SBLiveActivityDomain, "rootSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "disableActivityAlertsAsBanners");

  v9 = v6 & ~v8;
  return v9;
}

BOOL __53__SBActivityBannerObserver_shouldHandleActivityItem___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "destination") == 1;
}

- (void)presentAlert:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (SBUIIsSystemApertureEnabled())
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("SBUIIsSystemApertureEnabled() == false"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBActivityBannerObserver presentAlert:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D0C090E0);
  }
  if (objc_msgSend(v5, "canPresentInEnvironment:alertType:", self->_activityEnvironment, 1))
  {
    -[SBActivityBannerObserver _handleActivityAlert:present:](self, "_handleActivityAlert:present:", v5, 1);
  }
  else
  {
    SBLogActivity();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "item");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v11 = v8;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] Not presenting activity alert because activity environment is ambient or lock screen is visible", buf, 0xCu);

    }
  }

}

- (void)dismissAlert:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if (SBUIIsSystemApertureEnabled())
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("SBUIIsSystemApertureEnabled() == false"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBActivityBannerObserver dismissAlert:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
  else
  {
    -[SBActivityBannerObserver _handleActivityAlert:present:](self, "_handleActivityAlert:present:", v6, 0);

  }
}

- (void)activityProminenceChanged:(BOOL)a3 item:(id)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a3;
  objc_msgSend(a4, "identifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SBActivityBannerObserver _handleProminentActivityAlert:prominent:](self, "_handleProminentActivityAlert:prominent:", v6, v4);

}

- (void)activityEnvironmentChanged:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_activityEnvironment != a3)
  {
    self->_activityEnvironment = a3;
    if (a3 == 1)
    {
      v12 = 0u;
      v13 = 0u;
      v10 = 0u;
      v11 = 0u;
      -[NSMutableDictionary allValues](self->_itemByActivityIdentifier, "allValues", 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v11;
        do
        {
          v8 = 0;
          do
          {
            if (*(_QWORD *)v11 != v7)
              objc_enumerationMutation(v4);
            objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "identifier");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            -[SBActivityBannerObserver _dismissBannerWithActivityIdentifier:](self, "_dismissBannerWithActivityIdentifier:", v9);

            ++v8;
          }
          while (v6 != v8);
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        }
        while (v6);
      }

    }
  }
}

- (BOOL)_isActivityOngoing:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  BSDispatchQueueAssertMain();
  -[NSMutableDictionary objectForKey:](self->_itemByActivityIdentifier, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5 != 0;
}

- (void)_handleProminentActivityAlert:(id)a3 prominent:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  int v13;
  NSObject *v14;
  _BOOL4 v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  id v24;
  __int16 v25;
  _BOOL4 v26;
  uint64_t v27;

  v4 = a4;
  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  BSDispatchQueueAssertMain();
  if (-[SBActivityBannerObserver _isActivityOngoing:](self, "_isActivityOngoing:", v6))
  {
    -[NSMutableDictionary objectForKey:](self->_itemByActivityIdentifier, "objectForKey:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      -[NSObject descriptor](v7, "descriptor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "presentationOptions");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "shouldSuppressAlertContentOnLockScreen") ^ 1;

    }
    else
    {
      v11 = 0;
    }
    +[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isPresented");

    SBLogActivity();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if ((v11 & 1) != 0 || !v13)
    {
      if (v15)
      {
        v23 = 138543618;
        v24 = v6;
        v25 = 1024;
        v26 = v4;
        _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] handling activity prominence: %d", (uint8_t *)&v23, 0x12u);
      }

      if (v4)
      {
        if (self->_activityEnvironment == 1)
        {
          SBLogActivity();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            -[SBActivityBannerObserver _handleProminentActivityAlert:prominent:].cold.1((uint64_t)v6, v16, v17, v18, v19, v20, v21, v22);

        }
        else
        {
          -[SBActivityBannerObserver _postBannerWithActivityIdentifier:payloadIdentifier:prominent:completion:](self, "_postBannerWithActivityIdentifier:payloadIdentifier:prominent:completion:", v6, 0, 1, 0);
        }
      }
      else
      {
        -[NSMutableSet removeObject:](self->_prominentAlertPresentingActivities, "removeObject:", v6);
        -[SBActivityBannerObserver _dismissBannerWithActivityIdentifier:](self, "_dismissBannerWithActivityIdentifier:", v6);
      }
    }
    else
    {
      if (v15)
      {
        v23 = 138543362;
        v24 = v6;
        _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] Not handling activity prominence update because activity has a lockscreen UI visible", (uint8_t *)&v23, 0xCu);
      }

    }
  }
  else
  {
    SBLogActivity();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 138543362;
      v24 = v6;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] activity has ended, not handling prominence update", (uint8_t *)&v23, 0xCu);
    }
  }

}

- (void)_handleActivityAlert:(id)a3 present:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v4 = a4;
  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  BSDispatchQueueAssertMain();
  objc_msgSend(v6, "item");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "payloadIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (-[SBActivityBannerObserver _isActivityOngoing:](self, "_isActivityOngoing:", v8))
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __57__SBActivityBannerObserver__handleActivityAlert_present___block_invoke;
      v11[3] = &unk_1E8EA78D8;
      v12 = v6;
      -[SBActivityBannerObserver _postBannerWithActivityIdentifier:payloadIdentifier:prominent:completion:](self, "_postBannerWithActivityIdentifier:payloadIdentifier:prominent:completion:", v8, v9, 0, v11);

    }
    else
    {
      SBLogActivity();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v14 = v8;
        _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] activity has ended, not handling alert update", buf, 0xCu);
      }

    }
  }
  else
  {
    -[SBActivityBannerObserver _dismissBannerWithActivityIdentifier:](self, "_dismissBannerWithActivityIdentifier:", v8);
  }

}

uint64_t __57__SBActivityBannerObserver__handleActivityAlert_present___block_invoke(uint64_t result, uint64_t a2)
{
  if (!a2)
    return objc_msgSend(*(id *)(result + 32), "alertWithScreenOn:playSound:", 1, 1);
  return result;
}

- (void)_sendAnalyticsEventWithPayloadBuilder:(id)a3
{
  AnalyticsSendEventLazy();
}

- (void)_postBannerWithActivityIdentifier:(id)a3 payloadIdentifier:(id)a4 prominent:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  SBActivityBannerViewController *v24;
  _QWORD v25[4];
  id v26;
  SBActivityBannerObserver *v27;
  SBActivityBannerViewController *v28;
  id v29;
  id v30;
  uint8_t buf[4];
  id v32;
  uint64_t v33;

  v7 = a5;
  v33 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  BSDispatchQueueAssertMain();
  -[NSMutableDictionary objectForKey:](self->_itemByActivityIdentifier, "objectForKey:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "descriptor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    if (v7)
      -[NSMutableSet addObject:](self->_prominentAlertPresentingActivities, "addObject:", v10);
    -[NSMutableDictionary objectForKey:](self->_bannerPresentableByActivityIdentifier, "objectForKey:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      SBLogActivity();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v32 = v10;
        _os_log_impl(&dword_1D0540000, v16, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] Already showing a banner", buf, 0xCu);
      }
    }
    else
    {
      -[SBActivityBannerObserver _dismissBannerWithActivityIdentifier:](self, "_dismissBannerWithActivityIdentifier:", v10);
      v24 = -[SBActivityViewController initWithActivityItem:sceneType:payloadID:]([SBActivityBannerViewController alloc], "initWithActivityItem:sceneType:payloadID:", v13, 1, v11);
      -[SBActivityBannerViewController setBannerDelegate:](v24, "setBannerDelegate:", self);
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __101__SBActivityBannerObserver__postBannerWithActivityIdentifier_payloadIdentifier_prominent_completion___block_invoke;
      v25[3] = &unk_1E8EBBC48;
      v26 = v10;
      v30 = v12;
      v27 = self;
      v28 = v24;
      v29 = v14;
      v16 = v24;
      -[NSObject ensureContent:queue:completion:](v16, "ensureContent:queue:completion:", MEMORY[0x1E0C80D38], v25, 1.79769313e308);

    }
    goto LABEL_12;
  }
  SBLogActivity();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    -[SBActivityBannerObserver _postBannerWithActivityIdentifier:payloadIdentifier:prominent:completion:].cold.1((uint64_t)v10, v17, v18, v19, v20, v21, v22, v23);

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SBActivityBannerObserverErrorDomain"), 1, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, NSObject *))v12 + 2))(v12, v16);
LABEL_12:

  }
}

void __101__SBActivityBannerObserver__postBannerWithActivityIdentifier_payloadIdentifier_prominent_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t *v6;
  void *v7;
  uint64_t v8;
  char v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  BSDispatchQueueAssertMain();
  if (v3)
  {
    SBLogActivity();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __101__SBActivityBannerObserver__postBannerWithActivityIdentifier_payloadIdentifier_prominent_completion___block_invoke_cold_2(a1);

    v5 = *(_QWORD *)(a1 + 64);
    if (v5)
      (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
  else
  {
    v6 = (uint64_t *)(a1 + 32);
    if ((objc_msgSend(*(id *)(a1 + 40), "_isActivityOngoing:", *(_QWORD *)(a1 + 32)) & 1) != 0)
    {
      objc_msgSend((id)SBApp, "bannerManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 48);
      v21 = 0;
      v9 = objc_msgSend(v7, "postPresentable:withOptions:userInfo:error:", v8, 1, 0, &v21);
      v10 = v21;

      SBLogActivity();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if ((v9 & 1) != 0)
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v13 = *v6;
          *(_DWORD *)buf = 138543362;
          v23 = v13;
          _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] posted activity banner successfully", buf, 0xCu);
        }

        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __101__SBActivityBannerObserver__postBannerWithActivityIdentifier_payloadIdentifier_prominent_completion___block_invoke_21;
        v18[3] = &unk_1E8EAB6B0;
        v14 = *(void **)(a1 + 40);
        v19 = *(id *)(a1 + 32);
        v20 = *(id *)(a1 + 56);
        objc_msgSend(v14, "_sendAnalyticsEventWithPayloadBuilder:", v18);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "setObject:forKey:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));

      }
      else
      {
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          __101__SBActivityBannerObserver__postBannerWithActivityIdentifier_payloadIdentifier_prominent_completion___block_invoke_cold_1((_QWORD *)(a1 + 32));

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "removeObject:", *(_QWORD *)(a1 + 32));
      }
    }
    else
    {
      SBLogActivity();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = *v6;
        *(_DWORD *)buf = 138543362;
        v23 = v16;
        _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] activity has ended, not posting a banner", buf, 0xCu);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "removeObject:", *(_QWORD *)(a1 + 32));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "removeObjectForKey:", *(_QWORD *)(a1 + 32));
      objc_msgSend(*(id *)(a1 + 48), "invalidate");
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SBActivityBannerObserverErrorDomain"), 2, 0);
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    v17 = *(_QWORD *)(a1 + 64);
    if (v17)
      (*(void (**)(uint64_t, id))(v17 + 16))(v17, v10);

  }
}

id __101__SBActivityBannerObserver__postBannerWithActivityIdentifier_payloadIdentifier_prominent_completion___block_invoke_21(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v6[3];
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  v7[0] = v2;
  v6[0] = CFSTR("activityId");
  v6[1] = CFSTR("bundleId");
  objc_msgSend(v1, "platterTargetBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2] = CFSTR("eventType");
  v7[1] = v3;
  v7[2] = CFSTR("alert-banner");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_dismissBannerWithActivityIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  BSDispatchQueueAssertMain();
  -[NSMutableDictionary objectForKey:](self->_bannerPresentableByActivityIdentifier, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (-[NSMutableSet containsObject:](self->_prominentAlertPresentingActivities, "containsObject:", v4))
    {
      SBLogActivity();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v14 = v4;
        _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] Showing alert prominently, not dismissing it", buf, 0xCu);
      }
    }
    else
    {
      objc_msgSend((id)SBApp, "bannerManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D010A0], "uniqueIdentificationForPresentable:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 0;
      v9 = (id)objc_msgSend(v7, "revokePresentablesWithIdentification:reason:options:userInfo:error:", v8, CFSTR("_SBActivityBannerRevocationReasonDismissed"), 0, 0, &v12);
      v6 = v12;

      SBLogActivity();
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v6)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          -[SBActivityBannerObserver _dismissBannerWithActivityIdentifier:].cold.1((uint64_t)v4);
      }
      else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v14 = v4;
        _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] dismissed the alert successfully", buf, 0xCu);
      }

    }
  }

}

- (void)activityBannerDidDisappear:(id)a3 activityIdentifier:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  BSDispatchQueueAssertMain();
  SBLogActivity();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "[ActivityID: %{public}@] Activity banner dismissed", (uint8_t *)&v7, 0xCu);
  }

  -[NSMutableDictionary removeObjectForKey:](self->_bannerPresentableByActivityIdentifier, "removeObjectForKey:", v5);
  -[NSMutableSet removeObject:](self->_prominentAlertPresentingActivities, "removeObject:", v5);

}

- (NSMutableSet)prominentAlertPresentingActivities
{
  return self->_prominentAlertPresentingActivities;
}

- (void)setProminentAlertPresentingActivities:(id)a3
{
  objc_storeStrong((id *)&self->_prominentAlertPresentingActivities, a3);
}

- (NSMutableDictionary)itemByActivityIdentifier
{
  return self->_itemByActivityIdentifier;
}

- (void)setItemByActivityIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_itemByActivityIdentifier, a3);
}

- (NSMutableDictionary)bannerPresentableByActivityIdentifier
{
  return self->_bannerPresentableByActivityIdentifier;
}

- (void)setBannerPresentableByActivityIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_bannerPresentableByActivityIdentifier, a3);
}

- (int64_t)activityEnvironment
{
  return self->_activityEnvironment;
}

- (void)setActivityEnvironment:(int64_t)a3
{
  self->_activityEnvironment = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bannerPresentableByActivityIdentifier, 0);
  objc_storeStrong((id *)&self->_itemByActivityIdentifier, 0);
  objc_storeStrong((id *)&self->_prominentAlertPresentingActivities, 0);
}

- (void)presentAlert:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)dismissAlert:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_handleProminentActivityAlert:(uint64_t)a3 prominent:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1D0540000, a2, a3, "[ActivityID: %{public}@] Environment is ambient, banner alert can't become prominent", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)_postBannerWithActivityIdentifier:(uint64_t)a3 payloadIdentifier:(uint64_t)a4 prominent:(uint64_t)a5 completion:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1D0540000, a2, a3, "[ActivityID: %{public}@] No descriptor found", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

void __101__SBActivityBannerObserver__postBannerWithActivityIdentifier_payloadIdentifier_prominent_completion___block_invoke_cold_1(_QWORD *a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_2_13();
  OUTLINED_FUNCTION_2_8(&dword_1D0540000, v1, v2, "[ActivityID: %{public}@] throws an error while posting activity banner: %{public}@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2_0();
}

void __101__SBActivityBannerObserver__postBannerWithActivityIdentifier_payloadIdentifier_prominent_completion___block_invoke_cold_2(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 32);
  OUTLINED_FUNCTION_2_13();
  OUTLINED_FUNCTION_2_8(&dword_1D0540000, v1, v2, "[ActivityID: %{public}@] throws an error while ensuring activity content: %{public}@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2_0();
}

- (void)_dismissBannerWithActivityIdentifier:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2_13();
  OUTLINED_FUNCTION_2_8(&dword_1D0540000, v1, v2, "[ActivityID: %{public}@] throws an error while dismissing activity alert: %{public}@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2_0();
}

@end
