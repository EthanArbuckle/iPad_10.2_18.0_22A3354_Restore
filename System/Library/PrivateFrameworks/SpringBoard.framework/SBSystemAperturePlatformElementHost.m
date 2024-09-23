@implementation SBSystemAperturePlatformElementHost

- (SBSystemAperturePlatformElementHost)initWithElement:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  SBSystemAperturePlatformElementHost *v8;
  SBSystemAperturePlatformElementHost *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SBSystemAperturePlatformElementHost;
  v8 = -[SBSystemAperturePlatformElementHost init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_element, v6);
    objc_storeWeak((id *)&v9->_delegate, v7);
  }

  return v9;
}

- (void)elementRequestsDiscreteAnimationOfType:(int64_t)a3
{
  id v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_loadWeakRetained((id *)&self->_element);
  objc_msgSend(WeakRetained, "element:requestsDiscreteAnimationOfType:", v5, a3);

}

- (id)elementRequestsPersistentAnimationOfType:(int64_t)a3
{
  id WeakRetained;
  id v6;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_loadWeakRetained((id *)&self->_element);
  objc_msgSend(WeakRetained, "element:requestsPersistentAnimationOfType:", v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)requestUrgentAndImportantPriorityWithReason:(id)a3
{
  id v4;
  SBSystemAperturePlatformElementHost *v5;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id location;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  WeakRetained = objc_loadWeakRetained((id *)&v5->_urgentAndImportantAssertion);
  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = WeakRetained;
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

  if (!v10)
  {
    -[SBSystemAperturePlatformElementHost _urgencyAssertionWithReason:creatingIfNecessary:](v5, "_urgencyAssertionWithReason:creatingIfNecessary:", v4, 1);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v5);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __83__SBSystemAperturePlatformElementHost_requestUrgentAndImportantPriorityWithReason___block_invoke;
    v13[3] = &unk_1E8EA1940;
    objc_copyWeak(&v14, &location);
    v13[4] = v5;
    objc_msgSend(v10, "addInvalidationBlock:", v13);
    objc_storeWeak((id *)&v5->_urgentAndImportantAssertion, v10);
    v11 = objc_loadWeakRetained((id *)&v5->_delegate);
    objc_msgSend(v11, "invalidateElementUrgencyPreferences");

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  objc_sync_exit(v5);

  return v10;
}

void __83__SBSystemAperturePlatformElementHost_requestUrgentAndImportantPriorityWithReason___block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v4;
  id v5;
  id v6;
  id v7;

  v7 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained(WeakRetained + 4);

    if (v5 == v7)
    {
      objc_storeWeak(v4 + 4, 0);
      v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
      objc_msgSend(v6, "invalidateElementUrgencyPreferences");

    }
  }

}

- (id)_urgencyAssertionWithReason:(id)a3 creatingIfNecessary:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id WeakRetained;
  SBSystemAperturePlatformElementHost *v8;
  id v9;
  BOOL v10;
  NSObject *v11;
  void *v12;
  id v13;
  NSMapTable *reasonsToUrgencyAssertions;
  uint64_t v15;
  NSMapTable *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v4 = a4;
  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_element);
  v8 = self;
  objc_sync_enter(v8);
  -[NSMapTable objectForKey:](v8->_reasonsToUrgencyAssertions, "objectForKey:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9)
    v10 = 1;
  else
    v10 = !v4;
  if (!v10)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0DB07E0]);
    SBLogSystemApertureController();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      MEMORY[0x1D17E3810](WeakRetained);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v25 = v9;
      v26 = 2114;
      v27 = v6;
      v28 = 2114;
      v29 = v12;
      _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "Created urgency assertion (%{public}@) with reason '%{public}@' for element: %{public}@", buf, 0x20u);

    }
    objc_initWeak((id *)buf, v8);
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __87__SBSystemAperturePlatformElementHost__urgencyAssertionWithReason_creatingIfNecessary___block_invoke;
    v21 = &unk_1E8EA1940;
    objc_copyWeak(&v23, (id *)buf);
    v13 = v6;
    v22 = v13;
    objc_msgSend(v9, "addInvalidationBlock:", &v18);
    reasonsToUrgencyAssertions = v8->_reasonsToUrgencyAssertions;
    if (!reasonsToUrgencyAssertions)
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable", v18, v19, v20, v21);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = v8->_reasonsToUrgencyAssertions;
      v8->_reasonsToUrgencyAssertions = (NSMapTable *)v15;

      reasonsToUrgencyAssertions = v8->_reasonsToUrgencyAssertions;
    }
    -[NSMapTable setObject:forKey:](reasonsToUrgencyAssertions, "setObject:forKey:", v9, v13, v18, v19, v20, v21);

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }
  objc_sync_exit(v8);

  return v9;
}

void __87__SBSystemAperturePlatformElementHost__urgencyAssertionWithReason_creatingIfNecessary___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[1], "removeObjectForKey:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (SAInvalidatable)urgentAndImportantAssertion
{
  return (SAInvalidatable *)objc_loadWeakRetained((id *)&self->_urgentAndImportantAssertion);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_urgentAndImportantAssertion);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_element);
  objc_storeStrong((id *)&self->_reasonsToUrgencyAssertions, 0);
}

@end
