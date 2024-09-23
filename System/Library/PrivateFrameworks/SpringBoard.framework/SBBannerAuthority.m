@implementation SBBannerAuthority

- (SBBannerAuthority)init
{
  SBBannerAuthority *v2;
  SBBannerAuthority *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBBannerAuthority;
  v2 = -[SBBannerAuthority init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[SBBannerAuthority _configureSinksIfNecessary](v2, "_configureSinksIfNecessary");
  return v3;
}

- (void)registerAuthority:(id)a3 forRequesterIdentifier:(id)a4
{
  id v6;
  NSMutableDictionary *requesterIDsToAuthorities;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (v10 && v6)
  {
    requesterIDsToAuthorities = self->_requesterIDsToAuthorities;
    if (!requesterIDsToAuthorities)
    {
      v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v9 = self->_requesterIDsToAuthorities;
      self->_requesterIDsToAuthorities = v8;

      requesterIDsToAuthorities = self->_requesterIDsToAuthorities;
    }
    -[NSMutableDictionary setObject:forKey:](requesterIDsToAuthorities, "setObject:forKey:", v10, v6);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v10, "setDelegate:", self);
  }

}

- (int64_t)shouldPostPresentable:(id)a3 userInfo:(id)a4 reason:(id *)a5
{
  id v8;
  id v9;
  int64_t v10;

  v8 = a3;
  v9 = a4;
  if (-[SBBannerAuthority _isScreenSharingActive](self, "_isScreenSharingActive")
    && -[SBBannerAuthority _shouldDropPresentablesDuringScreenSharing](self, "_shouldDropPresentablesDuringScreenSharing")&& -[SBBannerAuthority _shouldDropPresentableDuringScreenSharing:userInfo:](self, "_shouldDropPresentableDuringScreenSharing:userInfo:", v8, v9))
  {
    if (a5)
      *a5 = CFSTR("Posting not permitted during screen sharing");
    v10 = -1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (int64_t)shouldPresentPresentable:(id)a3 withPresentedPresentables:(id)a4 responsiblePresentable:(id *)a5
{
  id v8;
  id v9;
  int64_t v10;
  void *v11;
  NSMutableDictionary *requesterIDsToAuthorities;
  void *v13;
  void *v14;
  void *v15;
  NSMutableDictionary *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  _QWORD v34[3];

  v34[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v8, "presentableType") == 1)
  {
    v10 = 1;
    v11 = v9;
  }
  else
  {
    requesterIDsToAuthorities = self->_requesterIDsToAuthorities;
    objc_msgSend(v8, "requesterIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](requesterIDsToAuthorities, "objectForKey:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_241);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "filteredArrayUsingPredicate:", v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = self->_requesterIDsToAuthorities;
    objc_msgSend(v11, "lastObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "requesterIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](v16, "objectForKey:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v33 = 0;
      v20 = objc_msgSend(v14, "shouldPresentPresentable:withPresentedPresentables:responsiblePresentable:", v8, v11, &v33);
      v30 = v33;
    }
    else
    {
      v30 = 0;
      v20 = 0;
    }
    v31 = v14;
    v21 = a5;
    if (v19)
    {
      v32 = 0;
      v22 = objc_msgSend(v19, "shouldPresentPresentable:withPresentedPresentables:responsiblePresentable:", v8, v11, &v32);
      v23 = v32;
    }
    else
    {
      v23 = 0;
      v22 = 0;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v20, v20);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v24;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v22);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v34[1] = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SBBannerAuthority _mediatedDecisionFromDecisions:defaultDecision:](self, "_mediatedDecisionFromDecisions:defaultDecision:", v26, 1);

    if (v21)
    {
      v27 = v23;
      if (v10 == v22 || (v27 = v30, v10 == v29))
        *v21 = objc_retainAutorelease(v27);
    }

  }
  return v10;
}

BOOL __95__SBBannerAuthority_shouldPresentPresentable_withPresentedPresentables_responsiblePresentable___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = (objc_opt_respondsToSelector() & 1) == 0 || objc_msgSend(v2, "presentableType") != 1;

  return v3;
}

- (int64_t)shouldOverlapPresentable:(id)a3 withPresentable:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *requesterIDsToAuthorities;
  void *v9;
  void *v10;
  NSMutableDictionary *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int64_t v19;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  requesterIDsToAuthorities = self->_requesterIDsToAuthorities;
  objc_msgSend(v6, "requesterIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](requesterIDsToAuthorities, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = self->_requesterIDsToAuthorities;
  objc_msgSend(v7, "requesterIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](v11, "objectForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v14 = 0;
    if (v13)
      goto LABEL_3;
LABEL_5:
    v15 = 0;
    goto LABEL_6;
  }
  v14 = objc_msgSend(v10, "shouldOverlapPresentable:withPresentable:", v6, v7);
  if (!v13)
    goto LABEL_5;
LABEL_3:
  v15 = objc_msgSend(v13, "shouldOverlapPresentable:withPresentable:", v6, v7);
LABEL_6:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v16;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[SBBannerAuthority _mediatedDecisionFromDecisions:defaultDecision:](self, "_mediatedDecisionFromDecisions:defaultDecision:", v18, 1);

  return v19;
}

- (int64_t)shouldNewTierBeAddedToTopForPresentable:(id)a3 withPresentable:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *requesterIDsToAuthorities;
  void *v9;
  void *v10;
  NSMutableDictionary *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int64_t v19;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  requesterIDsToAuthorities = self->_requesterIDsToAuthorities;
  objc_msgSend(v6, "requesterIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](requesterIDsToAuthorities, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = self->_requesterIDsToAuthorities;
  objc_msgSend(v7, "requesterIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](v11, "objectForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v14 = objc_msgSend(v10, "shouldNewTierBeAddedToTopForPresentable:withPresentable:", v6, v7);
  else
    v14 = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v15 = objc_msgSend(v13, "shouldNewTierBeAddedToTopForPresentable:withPresentable:", v6, v7);
  else
    v15 = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v16;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[SBBannerAuthority _mediatedDecisionFromDecisions:defaultDecision:](self, "_mediatedDecisionFromDecisions:defaultDecision:", v18, 1);

  return v19;
}

- (int64_t)shouldMorphToPresentable:(id)a3 withPresentedPresentables:(id)a4 responsiblePresentable:(id *)a5
{
  id v8;
  id v9;
  NSMutableDictionary *requesterIDsToAuthorities;
  void *v11;
  void *v12;
  NSMutableDictionary *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  int64_t v24;
  void *v25;
  id v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  _QWORD v33[3];

  v33[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  requesterIDsToAuthorities = self->_requesterIDsToAuthorities;
  objc_msgSend(v8, "requesterIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](requesterIDsToAuthorities, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = self->_requesterIDsToAuthorities;
  objc_msgSend(v9, "lastObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "requesterIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](v13, "objectForKey:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v32 = 0;
    v17 = objc_msgSend(v12, "shouldMorphToPresentable:withPresentedPresentables:responsiblePresentable:", v8, v9, &v32);
    v27 = v32;
  }
  else
  {
    v27 = 0;
    v17 = 0;
  }
  v29 = v12;
  v30 = v8;
  v18 = a5;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v31 = 0;
    v19 = objc_msgSend(v16, "shouldMorphToPresentable:withPresentedPresentables:responsiblePresentable:", v8, v9, &v31);
    v20 = v31;
  }
  else
  {
    v20 = 0;
    v19 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v17, v27);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v21;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v19);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v33[1] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[SBBannerAuthority _mediatedDecisionFromDecisions:defaultDecision:](self, "_mediatedDecisionFromDecisions:defaultDecision:", v23, -1);

  if (v18)
  {
    v25 = v20;
    if (v24 == v19 || (v25 = v28, v24 == v17))
      *v18 = objc_retainAutorelease(v25);
  }

  return v24;
}

- (void)bannerAuthority:(id)a3 mayChangeDecisionForResponsiblePresentable:(id)a4
{
  NSMutableDictionary *requesterIDsToAuthorities;
  id v7;
  void *v8;
  int v9;
  id WeakRetained;
  id v11;

  v11 = a4;
  requesterIDsToAuthorities = self->_requesterIDsToAuthorities;
  v7 = a3;
  -[NSMutableDictionary allValues](requesterIDsToAuthorities, "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v7);

  if (v9)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "bannerAuthority:mayChangeDecisionForResponsiblePresentable:", self, v11);

  }
}

- (int64_t)_mediatedDecisionFromDecisions:(id)a3 defaultDecision:(int64_t)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = a3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (!v6)
  {
LABEL_15:

LABEL_16:
    v8 = a4;
    goto LABEL_17;
  }
  v7 = v6;
  v8 = 0;
  v9 = *(_QWORD *)v14;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v14 != v9)
        objc_enumerationMutation(v5);
      v11 = objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "integerValue", (_QWORD)v13);
      if (v11)
      {
        if (v8 && v8 != v11)
          goto LABEL_15;
      }
      else
      {
        v11 = v8;
      }
      v8 = v11;
    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  }
  while (v7);

  if (!v8)
    goto LABEL_16;
LABEL_17:

  return v8;
}

- (void)_configureSinksIfNecessary
{
  SBBannerAuthority *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *sinks;
  uint64_t Serial;
  OS_dispatch_queue *biomeQueue;
  NSObject *v7;
  _QWORD block[5];

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_sinks && !v2->_isConfiguringSinks)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    sinks = v2->_sinks;
    v2->_sinks = v3;

    Serial = BSDispatchQueueCreateSerial();
    biomeQueue = v2->_biomeQueue;
    v2->_biomeQueue = (OS_dispatch_queue *)Serial;

    v2->_isConfiguringSinks = 1;
    v7 = v2->_biomeQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__SBBannerAuthority__configureSinksIfNecessary__block_invoke;
    block[3] = &unk_1E8E9DED8;
    block[4] = v2;
    dispatch_async(v7, block);
  }
  objc_sync_exit(v2);

}

void __47__SBBannerAuthority__configureSinksIfNecessary__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  uint8_t buf[16];

  SBLogBanners();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "Configuring screen sharing sink", buf, 2u);
  }

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D025E0]), "initWithIdentifier:targetQueue:", CFSTR("com.apple.springboard.bannerauthority.screensharing"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(MEMORY[0x1E0D027B8], "screenSharingStream");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "publisher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subscribeOn:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__SBBannerAuthority__configureSinksIfNecessary__block_invoke_26;
  v8[3] = &unk_1E8EB5B48;
  v8[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v6, "sinkWithCompletion:receiveInput:", &__block_literal_global_25_3, v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKeyedSubscript:", v7, CFSTR("com.apple.springboard.bannerauthority.screensharing"));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = 0;

}

void __47__SBBannerAuthority__configureSinksIfNecessary__block_invoke_23(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  SBLogBanners();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __47__SBBannerAuthority__configureSinksIfNecessary__block_invoke_23_cold_1(v2, v3);

}

uint64_t __47__SBBannerAuthority__configureSinksIfNecessary__block_invoke_26(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  const __CFString *v6;
  int v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isStart");

  SBLogBanners();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("not active");
    if ((_DWORD)v4)
      v6 = CFSTR("active");
    v8 = 138543362;
    v9 = v6;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Screen sharing is %{public}@", (uint8_t *)&v8, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_setScreenSharingActive:", v4);
}

- (BOOL)_shouldDropPresentablesDuringScreenSharing
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("SBAllowNotificationsDuringScreenSharing")) ^ 1;

  return v3;
}

- (BOOL)_shouldDropPresentableDuringScreenSharing:(id)a3 userInfo:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  BOOL v30;
  int v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a4, "objectForKey:", *MEMORY[0x1E0DACA28]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();
  v8 = v6;
  if (v7)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
  }
  else
  {
    v9 = 0;
  }
  v10 = v9;

  v11 = objc_msgSend(v10, "BOOLValue");
  if (v11)
  {
    SBLogBanners();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v32 = 138543362;
      v33 = v5;
      _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "Based on user info key, shouldn't drop presentable while screen sharing: %{public}@", (uint8_t *)&v32, 0xCu);
    }
  }
  else
  {
    objc_msgSend(v5, "requesterIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((BSEqualStrings() & 1) != 0)
    {
      objc_msgSend(v5, "requestIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "hasPrefix:", CFSTR("com.apple.conversationController"));

      if (v15)
      {
        SBLogBanners();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          -[SBBannerAuthority _shouldDropPresentableDuringScreenSharing:userInfo:].cold.1((uint64_t)v5, v12, v16, v17, v18, v19, v20, v21);
        goto LABEL_17;
      }
    }
    else
    {

    }
    objc_msgSend(v5, "requesterIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = BSEqualStrings();

    if (!v23)
    {
      v30 = 1;
      goto LABEL_18;
    }
    SBLogBanners();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[SBBannerAuthority _shouldDropPresentableDuringScreenSharing:userInfo:].cold.2((uint64_t)v5, v12, v24, v25, v26, v27, v28, v29);
  }
LABEL_17:

  v30 = 0;
LABEL_18:

  return v30;
}

- (BNConsideringDelegate)delegate
{
  return (BNConsideringDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)_isScreenSharingActive
{
  return self->_screenSharingActive;
}

- (void)_setScreenSharingActive:(BOOL)a3
{
  self->_screenSharingActive = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_biomeQueue, 0);
  objc_storeStrong((id *)&self->_sinks, 0);
  objc_storeStrong((id *)&self->_requesterIDsToAuthorities, 0);
}

void __47__SBBannerAuthority__configureSinksIfNecessary__block_invoke_23_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_1D0540000, a2, OS_LOG_TYPE_ERROR, "Screen sharing sink completion was unexpectely invoked (error: %{public}@)", (uint8_t *)&v4, 0xCu);

}

- (void)_shouldDropPresentableDuringScreenSharing:(uint64_t)a3 userInfo:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D0540000, a2, a3, "Exempting Expanse presentable: %{public}@", a5, a6, a7, a8, 2u);
}

- (void)_shouldDropPresentableDuringScreenSharing:(uint64_t)a3 userInfo:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D0540000, a2, a3, "Exempting Bluetooth Smart Routing presentable: %{public}@", a5, a6, a7, a8, 2u);
}

@end
