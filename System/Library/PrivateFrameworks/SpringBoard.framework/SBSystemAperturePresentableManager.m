@implementation SBSystemAperturePresentableManager

- (SBSystemAperturePresentableManager)initWithElementRegistrar:(id)a3
{
  id v4;
  SBSystemAperturePresentableManager *v5;
  SBSystemAperturePresentableManager *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBSystemAperturePresentableManager;
  v5 = -[SBSystemAperturePresentableManager init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_elementRegistrar, v4);

  return v6;
}

- (BOOL)willInterceptPresentable:(id)a3 userInfo:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  int v18;
  uint64_t v19;
  id v20;
  void *v21;
  BOOL v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  void *v29;
  _QWORD v31[5];
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  SBSystemAperturePresentableManager *v38;
  id v39;
  _QWORD v40[4];
  id v41;
  uint8_t buf[4];
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(v6, "providesTemplateContent")
    && objc_msgSend(v6, "presentableBehavior") == 1)
  {
    SBLogSystemApertureNotice();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      BNEffectivePresentableDescription();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v9;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "Intercepting template notice presentable: %{public}@", buf, 0xCu);

    }
    v10 = v6;
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __72__SBSystemAperturePresentableManager_willInterceptPresentable_userInfo___block_invoke;
    v40[3] = &unk_1E8EA34E8;
    v41 = v10;
    -[SBSystemAperturePresentableManager _elementForPresentableCreatingIfNecessary:elementGenerator:](self, "_elementForPresentableCreatingIfNecessary:elementGenerator:", v10, v40);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSystemAperturePresentableManager _registerElement:](self, "_registerElement:", v11);

    v12 = v41;
    goto LABEL_29;
  }
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0DACA38]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_class();
  v15 = v13;
  if (v14)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;
  }
  else
  {
    v16 = 0;
  }
  v17 = v16;

  v18 = objc_msgSend(v17, "BOOLValue");
  if (v18)
  {
    v19 = objc_opt_class();
    v20 = v6;
    if (v19)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v21 = v20;
      else
        v21 = 0;
    }
    else
    {
      v21 = 0;
    }
    v12 = v21;

    v22 = v12 != 0;
    if (!v12)
      goto LABEL_30;
    SBLogSystemApertureHosting();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      BNEffectivePresentableDescription();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v43 = v24;
      _os_log_impl(&dword_1D0540000, v23, OS_LOG_TYPE_DEFAULT, "Intercepting hosted presentable: %{public}@", buf, 0xCu);

    }
    objc_initWeak((id *)buf, self);
    v25 = MEMORY[0x1E0C809B0];
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __72__SBSystemAperturePresentableManager_willInterceptPresentable_userInfo___block_invoke_6;
    v35[3] = &unk_1E8EA3560;
    v36 = v20;
    v12 = v12;
    v37 = v12;
    v38 = self;
    objc_copyWeak(&v39, (id *)buf);
    -[SBSystemAperturePresentableManager _elementForPresentableCreatingIfNecessary:elementGenerator:](self, "_elementForPresentableCreatingIfNecessary:elementGenerator:", v12, v35);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v26, "isActivated")
      || (objc_msgSend(v26, "scene"),
          v27 = (void *)objc_claimAutoreleasedReturnValue(),
          v28 = v27 == 0,
          v27,
          v28))
    {
      v33[0] = v25;
      v33[1] = 3221225472;
      v33[2] = __72__SBSystemAperturePresentableManager_willInterceptPresentable_userInfo___block_invoke_2_11;
      v33[3] = &unk_1E8EA3588;
      objc_copyWeak(&v34, (id *)buf);
      objc_msgSend(v26, "setSceneInvalidationHandler:", v33);
      objc_msgSend(v26, "setPresentable:", v12);
      if ((objc_msgSend(v26, "isActivated") & 1) != 0)
      {
        objc_msgSend(v12, "scene");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v31[0] = v25;
        v31[1] = 3221225472;
        v31[2] = __72__SBSystemAperturePresentableManager_willInterceptPresentable_userInfo___block_invoke_4;
        v31[3] = &unk_1E8EA35B0;
        v31[4] = self;
        v32 = v26;
        objc_msgSend(v32, "updateWithConnectedScene:configuration:elementAssertionAcquisitionHandler:", v29, 0, v31);

      }
      else
      {
        objc_msgSend(v26, "activate");
      }
      objc_destroyWeak(&v34);
    }

    objc_destroyWeak(&v39);
    objc_destroyWeak((id *)buf);
LABEL_29:
    v22 = 1;
LABEL_30:

    goto LABEL_31;
  }
  v22 = 0;
LABEL_31:

  return v22;
}

SBNoticePresentableElement *__72__SBSystemAperturePresentableManager_willInterceptPresentable_userInfo___block_invoke(uint64_t a1)
{
  return -[SBNoticePresentableElement initWithTemplatePresentable:]([SBNoticePresentableElement alloc], "initWithTemplatePresentable:", *(_QWORD *)(a1 + 32));
}

SBSystemApertureSceneElement *__72__SBSystemAperturePresentableManager_willInterceptPresentable_userInfo___block_invoke_6(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  SBSystemApertureSceneElement *v5;
  void *v6;
  SBSystemApertureSceneElement *v7;
  id WeakRetained;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __72__SBSystemAperturePresentableManager_willInterceptPresentable_userInfo___block_invoke_2;
  v13[3] = &unk_1E8EA3510;
  v14 = *(id *)(a1 + 32);
  +[SBSystemApertureSceneElement activePlaceholderElementPassingTest:](SBSystemApertureSceneElement, "activePlaceholderElementPassingTest:", v13);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    SBLogSystemApertureHosting();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v16 = v3;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "Found existing placeholder for intercepted presentable: %{public}@", buf, 0xCu);
    }

    v5 = v3;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "scene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = [SBSystemApertureSceneElement alloc];
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 32));
    v10[0] = v2;
    v10[1] = 3221225472;
    v10[2] = __72__SBSystemAperturePresentableManager_willInterceptPresentable_userInfo___block_invoke_9;
    v10[3] = &unk_1E8EA3538;
    objc_copyWeak(&v12, (id *)(a1 + 56));
    v11 = *(id *)(a1 + 32);
    v5 = -[SBSystemApertureSceneElement initWithScene:statusBarBackgroundActivitiesSuppresser:readyForPresentationHandler:](v7, "initWithScene:statusBarBackgroundActivitiesSuppresser:readyForPresentationHandler:", v6, WeakRetained, v10);

    objc_destroyWeak(&v12);
  }

  return v5;
}

uint64_t __72__SBSystemAperturePresentableManager_willInterceptPresentable_userInfo___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "requesterIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", v5))
  {
    objc_msgSend(*(id *)(a1 + 32), "requestIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "elementIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __72__SBSystemAperturePresentableManager_willInterceptPresentable_userInfo___block_invoke_9(uint64_t a1, void *a2, int a3)
{
  id WeakRetained;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    if (a3)
    {
      objc_msgSend(WeakRetained, "_existingElementForPresentableWithIdentification:", *(_QWORD *)(a1 + 32));
      v7 = objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = (void *)v7;
        objc_msgSend(v6, "_existingPresentableWithIdentification:", *(_QWORD *)(a1 + 32));
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
          objc_msgSend(v6, "_registerElement:", v10);
      }
    }
  }

}

void __72__SBSystemAperturePresentableManager_willInterceptPresentable_userInfo___block_invoke_2_11(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  v4 = v3;
  BSDispatchMain();

  objc_destroyWeak(&v5);
}

void __72__SBSystemAperturePresentableManager_willInterceptPresentable_userInfo___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (objc_msgSend(*(id *)(a1 + 32), "isActivated")
    && (objc_msgSend(*(id *)(a1 + 32), "isDeactivating") & 1) == 0)
  {
    objc_msgSend(WeakRetained, "_invalidateElement:withReason:", *(_QWORD *)(a1 + 32), CFSTR("Presentable client scene unexpectedly invalidated."));
  }

}

void __72__SBSystemAperturePresentableManager_willInterceptPresentable_userInfo___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v4 = a2;
  v3 = *(id *)(a1 + 32);
  objc_sync_enter(v3);
  objc_msgSend(*(id *)(a1 + 32), "_sync_registerAssertion:forElement:", v4, *(_QWORD *)(a1 + 40));
  objc_sync_exit(v3);

  objc_msgSend(*(id *)(a1 + 32), "elementLayoutSpecifier:layoutModeDidChange:reason:", *(_QWORD *)(a1 + 40), 0, 0);
}

- (id)revocationRequestedForPresentablesWithIdentification:(id)a3 reason:(id)a4
{
  id v6;
  NSObject *v7;
  SBSystemAperturePresentableManager *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  v6 = a4;
  SBLogSystemApertureNotice();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v26 = v19;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "Asked to revoke presentable with identification: %{public}@", buf, 0xCu);
  }

  v8 = self;
  objc_sync_enter(v8);
  -[SBSystemAperturePresentableManager _existingPresentablesWithIdentification:](v8, "_existingPresentablesWithIdentification:", v19);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        -[SBSystemAperturePresentableManager _existingElementForPresentableWithIdentification:](v8, "_existingElementForPresentableWithIdentification:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("revocation requested for presentable (%@)"), v6);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBSystemAperturePresentableManager _invalidateElement:withReason:](v8, "_invalidateElement:withReason:", v15, v16);

          if (!v10)
            v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v10, "addObject:", v14);
        }
        else
        {
          SBLogSystemApertureNotice();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            BNEffectivePresentableDescription();
            objc_claimAutoreleasedReturnValue();
            -[SBSystemAperturePresentableManager revocationRequestedForPresentablesWithIdentification:reason:].cold.1();
          }

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }

  objc_sync_exit(v8);
  return v10;
}

- (void)elementLayoutSpecifier:(id)a3 layoutModeDidChange:(int64_t)a4 reason:(int64_t)a5
{
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  -[SBSystemAperturePresentableManager _presentableElementForElementLayoutSpecifier:](self, "_presentableElementForElementLayoutSpecifier:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = objc_msgSend(v9, "layoutMode");
    if (a4 <= 0 && v8 >= 1)
      -[SBSystemAperturePresentableManager _noteElementDidAppear:](self, "_noteElementDidAppear:", v7);
  }

}

- (id)_existingPresentablesWithIdentification:(id)a3
{
  id v4;
  SBSystemAperturePresentableManager *v5;
  id v6;
  NSMapTable *v7;
  uint64_t v8;
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
  v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = v5->_presentablesToElements;
    v8 = -[NSMapTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v7);
          v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
          if (BNIsPresentableIdentifiedByIdentification())
            objc_msgSend(v6, "addObject:", v11, (_QWORD)v13);
        }
        v8 = -[NSMapTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

    objc_sync_exit(v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_existingPresentableWithIdentification:(id)a3
{
  void *v3;
  void *v4;

  if (a3)
  {
    -[SBSystemAperturePresentableManager _existingPresentablesWithIdentification:](self, "_existingPresentablesWithIdentification:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)_existingElementForPresentableWithIdentification:(id)a3
{
  id v4;
  SBSystemAperturePresentableManager *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    -[SBSystemAperturePresentableManager _existingPresentableWithIdentification:](v5, "_existingPresentableWithIdentification:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[NSMapTable objectForKey:](v5->_presentablesToElements, "objectForKey:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

    objc_sync_exit(v5);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_elementForPresentableCreatingIfNecessary:(id)a3 elementGenerator:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  SBSystemAperturePresentableManager *v8;
  void *v9;
  NSMapTable *presentablesToElements;
  uint64_t v11;
  NSMapTable *v12;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  if (v6)
  {
    v8 = self;
    objc_sync_enter(v8);
    -[SBSystemAperturePresentableManager _existingElementForPresentableWithIdentification:](v8, "_existingElementForPresentableWithIdentification:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      v7[2](v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      presentablesToElements = v8->_presentablesToElements;
      if (!presentablesToElements)
      {
        objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = v8->_presentablesToElements;
        v8->_presentablesToElements = (NSMapTable *)v11;

        presentablesToElements = v8->_presentablesToElements;
      }
      -[NSMapTable setObject:forKey:](presentablesToElements, "setObject:forKey:", v9, v6);
    }
    objc_sync_exit(v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_removeElementForPresentableWithIdentification:(id)a3
{
  id v4;
  SBSystemAperturePresentableManager *v5;
  void *v6;
  id v7;

  v4 = a3;
  if (v4)
  {
    v7 = v4;
    v5 = self;
    objc_sync_enter(v5);
    -[SBSystemAperturePresentableManager _existingPresentableWithIdentification:](v5, "_existingPresentableWithIdentification:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      -[NSMapTable removeObjectForKey:](v5->_presentablesToElements, "removeObjectForKey:", v6);

    objc_sync_exit(v5);
    v4 = v7;
  }

}

- (id)_existingAssertionForElement:(id)a3
{
  id v4;
  SBSystemAperturePresentableManager *v5;
  void *v6;

  v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    -[NSMapTable objectForKey:](v5->_elementsToAssertions, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_registerElement:(id)a3
{
  id v4;
  SBSystemAperturePresentableManager *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id WeakRetained;
  NSObject *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    -[SBSystemAperturePresentableManager _existingAssertionForElement:](v5, "_existingAssertionForElement:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      SBLogSystemApertureNotice();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        MEMORY[0x1D17E3810](v4);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138543362;
        v12 = v8;
        _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "Registering element: %{public}@", (uint8_t *)&v11, 0xCu);

      }
      WeakRetained = objc_loadWeakRetained((id *)&v5->_elementRegistrar);
      objc_msgSend(WeakRetained, "registerElement:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        -[SBSystemAperturePresentableManager _sync_registerAssertion:forElement:](v5, "_sync_registerAssertion:forElement:", v6, v4);
      }
      else
      {
        SBLogSystemApertureNotice();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          MEMORY[0x1D17E3810](v4);
          objc_claimAutoreleasedReturnValue();
          -[SBSystemAperturePresentableManager _registerElement:].cold.1();
        }

        v6 = 0;
      }
    }

    objc_sync_exit(v5);
  }

}

- (void)_sync_registerAssertion:(id)a3 forElement:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSMapTable *elementsToAssertions;
  NSMapTable *v10;
  NSMapTable *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  SBLogSystemApertureNotice();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v17 = v6;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "Registering assertion %{public}@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  objc_initWeak(&location, v7);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __73__SBSystemAperturePresentableManager__sync_registerAssertion_forElement___block_invoke;
  v12[3] = &unk_1E8EA35D8;
  objc_copyWeak(&v13, (id *)buf);
  objc_copyWeak(&v14, &location);
  objc_msgSend(v6, "addInvalidationBlock:", v12);
  elementsToAssertions = self->_elementsToAssertions;
  if (!elementsToAssertions)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v10 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v11 = self->_elementsToAssertions;
    self->_elementsToAssertions = v10;

    elementsToAssertions = self->_elementsToAssertions;
  }
  -[NSMapTable setObject:forKey:](elementsToAssertions, "setObject:forKey:", v6, v7);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "addElementLayoutSpecifierObserver:", self);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);

}

void __73__SBSystemAperturePresentableManager__sync_registerAssertion_forElement___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  WeakRetained = objc_loadWeakRetained(v4);
  v6 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_noteElementDidInvalidate:reason:", v6, v5);

}

- (void)_removeAssertionForElement:(id)a3
{
  id v5;
  SBSystemAperturePresentableManager *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;

  v5 = a3;
  if (v5)
  {
    v6 = self;
    objc_sync_enter(v6);
    -[SBSystemAperturePresentableManager _existingAssertionForElement:](v6, "_existingAssertionForElement:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      if (objc_msgSend(v7, "isValid"))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        MEMORY[0x1D17E3810](v5);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("SBSystemAperturePresentableManager.m"), 269, CFSTR("Removing a valid assertion: element: %@; assertion: %@"),
          v11,
          v8);

      }
      -[NSMapTable removeObjectForKey:](v6->_elementsToAssertions, "removeObjectForKey:", v5);
    }
    else
    {
      SBLogSystemApertureNotice();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        MEMORY[0x1D17E3810](v5);
        objc_claimAutoreleasedReturnValue();
        -[SBSystemAperturePresentableManager _removeAssertionForElement:].cold.1();
      }

    }
    objc_sync_exit(v6);

  }
}

- (void)_removePresentableForElement:(id)a3
{
  id v4;
  SBSystemAperturePresentableManager *v5;
  NSMapTable *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  BOOL v12;
  id v13;
  NSObject *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = v5->_presentablesToElements;
    v7 = -[NSMapTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v16;
LABEL_4:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v9);
        -[NSMapTable objectForKey:](v5->_presentablesToElements, "objectForKey:", v10, (_QWORD)v15);
        v11 = (id)objc_claimAutoreleasedReturnValue();
        v12 = v11 == v4;

        if (v12)
          break;
        if (v7 == ++v9)
        {
          v7 = -[NSMapTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
          if (v7)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      v13 = v10;

      if (!v13)
        goto LABEL_13;
      -[NSMapTable removeObjectForKey:](v5->_presentablesToElements, "removeObjectForKey:", v13);
    }
    else
    {
LABEL_10:

LABEL_13:
      SBLogSystemApertureNotice();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        MEMORY[0x1D17E3810](v4);
        objc_claimAutoreleasedReturnValue();
        -[SBSystemAperturePresentableManager _removePresentableForElement:].cold.1();
      }

      v13 = 0;
    }

    objc_sync_exit(v5);
  }

}

- (void)_invalidateElement:(id)a3 withReason:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  SBSystemAperturePresentableManager *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  SBLogSystemApertureNotice();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    MEMORY[0x1D17E3810](v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v10;
    v26 = 2114;
    v27 = v8;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "Asked to invalidate element with reason: element: %{public}@; reason: %{public}@",
      buf,
      0x16u);

  }
  if (v7)
  {
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemAperturePresentableManager.m"), 300, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

    }
    v11 = self;
    objc_sync_enter(v11);
    -[SBSystemAperturePresentableManager _existingAssertionForElement:](v11, "_existingAssertionForElement:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_class();
    v14 = v7;
    if (v13)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v15 = v14;
      else
        v15 = 0;
    }
    else
    {
      v15 = 0;
    }
    v16 = v15;

    if (objc_msgSend(v16, "isActivated") && (objc_msgSend(v16, "isDeactivating") & 1) == 0)
    {
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __68__SBSystemAperturePresentableManager__invalidateElement_withReason___block_invoke;
      v21[3] = &unk_1E8EA3600;
      v21[4] = v11;
      v22 = v14;
      v23 = v8;
      objc_msgSend(v16, "deactivateWhenRemovedWithHandler:", v21);

    }
    else if (!v16)
    {
      -[SBSystemAperturePresentableManager _removePresentableForElement:](v11, "_removePresentableForElement:", v14);
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v14, "removeElementLayoutSpecifierObserver:", v11);
    if (objc_msgSend(v12, "isValid"))
    {
      objc_msgSend(v12, "invalidateWithReason:", v8);
      -[SBSystemAperturePresentableManager _removeAssertionForElement:](v11, "_removeAssertionForElement:", v14);
    }
    else
    {
      SBLogSystemApertureNotice();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        MEMORY[0x1D17E3810](v14);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v25 = v18;
        _os_log_impl(&dword_1D0540000, v17, OS_LOG_TYPE_DEFAULT, "There was no assertion for element: %{public}@", buf, 0xCu);

      }
      objc_msgSend(v14, "presentable");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "presentableWillNotAppearAsBanner:withReason:", v19, CFSTR("revoked before ever becoming visible"));

    }
    objc_sync_exit(v11);

  }
}

uint64_t __68__SBSystemAperturePresentableManager__invalidateElement_withReason___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_noteElementDidDisappear:reason:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (id)_presentableElementForElementLayoutSpecifier:(id)a3
{
  id v4;
  NSMapTable *v5;
  id v6;
  uint64_t v7;
  void *i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_elementsToAssertions;
  v6 = (id)-[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if (*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i) == v4)
        {
          v6 = v4;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_noteElementDidAppear:(id)a3
{
  id v4;
  SBSystemAperturePresentableManager *v5;
  void *v6;
  NSHashTable *elementsThatDidAppear;
  uint64_t v8;
  NSHashTable *v9;
  id v10;

  v4 = a3;
  if (v4)
  {
    v10 = v4;
    v5 = self;
    objc_sync_enter(v5);
    if (!-[NSHashTable containsObject:](v5->_elementsThatDidAppear, "containsObject:", v10))
    {
      objc_msgSend(v10, "presentable");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "presentableWillAppearAsBanner:", v6);
      objc_msgSend(v6, "presentableDidAppearAsBanner:", v6);

    }
    elementsThatDidAppear = v5->_elementsThatDidAppear;
    if (!elementsThatDidAppear)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = v5->_elementsThatDidAppear;
      v5->_elementsThatDidAppear = (NSHashTable *)v8;

      elementsThatDidAppear = v5->_elementsThatDidAppear;
    }
    -[NSHashTable addObject:](elementsThatDidAppear, "addObject:", v10);
    objc_sync_exit(v5);

    v4 = v10;
  }

}

- (void)_noteElementDidInvalidate:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  SBSystemAperturePresentableManager *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = self;
    objc_sync_enter(v8);
    objc_msgSend(v6, "presentable");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSHashTable containsObject:](v8->_elementsThatDidAppear, "containsObject:", v6))
    {
      objc_msgSend(v9, "presentableWillDisappearAsBanner:withReason:", v9, v7);
      v10 = objc_opt_class();
      v11 = v6;
      if (v10)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v12 = v11;
        else
          v12 = 0;
      }
      else
      {
        v12 = 0;
      }
      v13 = v12;

      if (objc_msgSend(v13, "isActivated") && (objc_msgSend(v13, "isDeactivating") & 1) == 0)
      {
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __71__SBSystemAperturePresentableManager__noteElementDidInvalidate_reason___block_invoke;
        v14[3] = &unk_1E8EA3600;
        v14[4] = v8;
        v15 = v11;
        v16 = v7;
        objc_msgSend(v13, "deactivateWhenRemovedWithHandler:", v14);

      }
      else if ((objc_msgSend(v13, "isActivated") & 1) == 0)
      {
        -[SBSystemAperturePresentableManager _noteElementDidDisappear:reason:](v8, "_noteElementDidDisappear:reason:", v11, v7);
      }

    }
    else
    {
      objc_msgSend(v9, "presentableWillNotAppearAsBanner:withReason:", v9, CFSTR("revoked before ever becoming visible"));
    }

    objc_sync_exit(v8);
  }

}

uint64_t __71__SBSystemAperturePresentableManager__noteElementDidInvalidate_reason___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_noteElementDidDisappear:reason:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_noteElementDidDisappear:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "presentable");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[SBSystemAperturePresentableManager _removePresentableForElement:](self, "_removePresentableForElement:", v7);
  objc_msgSend(v8, "presentableDidDisappearAsBanner:withReason:", v8, v6);

  -[NSHashTable removeObject:](self->_elementsThatDidAppear, "removeObject:", v7);
}

- (SBSystemApertureController)elementRegistrar
{
  return (SBSystemApertureController *)objc_loadWeakRetained((id *)&self->_elementRegistrar);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_elementRegistrar);
  objc_storeStrong((id *)&self->_elementsThatDidAppear, 0);
  objc_storeStrong((id *)&self->_elementsToAssertions, 0);
  objc_storeStrong((id *)&self->_presentablesToElements, 0);
}

- (void)revocationRequestedForPresentablesWithIdentification:reason:.cold.1()
{
  void *v0;
  _DWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2_5();
  *v1 = 138543362;
  *v3 = v2;
  OUTLINED_FUNCTION_2_4(&dword_1D0540000, v5, (uint64_t)v3, "Failed to find element for presentable: %{public}@", v4);

  OUTLINED_FUNCTION_24();
}

- (void)_registerElement:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_2_5();
  *(_DWORD *)v1 = 138543362;
  *(_QWORD *)(v1 + 4) = v2;
  OUTLINED_FUNCTION_2_4(&dword_1D0540000, v3, (uint64_t)v3, "Failed to obtain assertion when registering element: %{public}@", v4);

  OUTLINED_FUNCTION_24();
}

- (void)_removeAssertionForElement:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_2_5();
  *(_DWORD *)v1 = 138543362;
  *(_QWORD *)(v1 + 4) = v2;
  _os_log_debug_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEBUG, "No assertion to remove for element: %{public}@", v4, 0xCu);

  OUTLINED_FUNCTION_24();
}

- (void)_removePresentableForElement:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_2_5();
  *(_DWORD *)v1 = 138543362;
  *(_QWORD *)(v1 + 4) = v2;
  OUTLINED_FUNCTION_2_4(&dword_1D0540000, v3, (uint64_t)v3, "Failed to find presentable for element: %{public}@", v4);

  OUTLINED_FUNCTION_24();
}

@end
