@implementation SBHardwareButtonCoordinator

- (int)initWithHardwareButtons:(void *)a3 windowScene:
{
  id v5;
  id v6;
  id *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  int *v35;
  id v37;
  id v38;
  id v39;
  _QWORD handler[4];
  int *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  objc_super v46;
  const __CFString *v47;
  const __CFString *v48;
  _QWORD v49[2];
  _QWORD v50[2];
  const __CFString *v51;
  const __CFString *v52;
  _QWORD v53[2];
  _QWORD v54[2];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v46.receiver = a1;
    v46.super_class = (Class)SBHardwareButtonCoordinator;
    v7 = (id *)objc_msgSendSuper2(&v46, sel_init);
    a1 = (int *)v7;
    if (v7)
    {
      v38 = v6;
      objc_storeStrong(v7 + 2, a3);
      v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      v39 = v5;
      v9 = v5;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v43;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v43 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
            objc_msgSend(v14, "hardwareButtonIdentifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setObject:forKey:", v14, v15);

            objc_msgSend(v14, "setHardwareButtonCoordinator:", a1);
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
        }
        while (v11);
      }

      v16 = (void *)*((_QWORD *)a1 + 3);
      *((_QWORD *)a1 + 3) = v8;
      v37 = v8;

      v17 = (void *)MEMORY[0x1E0C99E60];
      v52 = CFSTR("Lock");
      v53[0] = CFSTR("Ringer");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v52, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setWithArray:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v53[1] = CFSTR("Lock");
      v54[0] = v19;
      v20 = (void *)MEMORY[0x1E0C99E60];
      v51 = CFSTR("Ringer");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setWithArray:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v54[1] = v22;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, v53, 2);
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = (void *)*((_QWORD *)a1 + 6);
      *((_QWORD *)a1 + 6) = v23;

      v48 = CFSTR("Lock");
      v49[0] = CFSTR("Ringer");
      v25 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setWithArray:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v49[1] = CFSTR("Lock");
      v50[0] = v27;
      v28 = (void *)MEMORY[0x1E0C99E60];
      v47 = CFSTR("Ringer");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setWithArray:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v50[1] = v30;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 2);
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = (void *)*((_QWORD *)a1 + 8);
      *((_QWORD *)a1 + 8) = v31;

      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("Capture"), 0);
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = (void *)*((_QWORD *)a1 + 7);
      *((_QWORD *)a1 + 7) = v33;

      a1[2] = -1;
      v35 = a1 + 2;
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __67__SBHardwareButtonCoordinator_initWithHardwareButtons_windowScene___block_invoke;
      handler[3] = &unk_1E8E9EBA8;
      a1 = a1;
      v41 = a1;
      notify_register_dispatch("com.apple.sysdiagnose.sysdiagnoseStarted", v35, MEMORY[0x1E0C80D38], handler);

      v6 = v38;
      v5 = v39;
    }
  }

  return a1;
}

void __67__SBHardwareButtonCoordinator_initWithHardwareButtons_windowScene___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint8_t buf[8];
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  SBLogButtonsLock();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "sysdiagnose began - canceling buttons", buf, 2u);
  }

  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "allValues", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "cancelHardwareButtonPress");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
    }
    while (v5);
  }

}

- (void)dealloc
{
  int sysdiagnoseDidBeginNotificationToken;
  objc_super v4;

  sysdiagnoseDidBeginNotificationToken = self->_sysdiagnoseDidBeginNotificationToken;
  if (sysdiagnoseDidBeginNotificationToken != -1)
  {
    notify_cancel(sysdiagnoseDidBeginNotificationToken);
    self->_sysdiagnoseDidBeginNotificationToken = -1;
  }
  v4.receiver = self;
  v4.super_class = (Class)SBHardwareButtonCoordinator;
  -[SBHardwareButtonCoordinator dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suppressedButtonIdentifierToSuppressorButtonIdentifiers, 0);
  objc_storeStrong((id *)&self->_otherButtonsAlwaysSuppressButtonIdentifiers, 0);
  objc_storeStrong((id *)&self->_buttonIdentifierToSuppressedButtonIdentifiers, 0);
  objc_storeStrong((id *)&self->_activeButtonIdentifiers, 0);
  objc_storeStrong((id *)&self->_canceledButtonIdentifiers, 0);
  objc_storeStrong((id *)&self->_buttonIdentifierToButtonInstance, 0);
  objc_storeStrong((id *)&self->_windowScene, 0);
}

- (unint64_t)_shouldSuppressButtonIdentifier:(unint64_t)a1
{
  id v3;
  void *v4;

  v3 = a2;
  if (a1)
  {
    if (objc_msgSend(*(id *)(a1 + 56), "containsObject:", v3))
    {
      v4 = (void *)objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
      objc_msgSend(v4, "removeObject:", v3);
      a1 = objc_msgSend(v4, "count") != 0;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 64), "objectForKey:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      a1 = objc_msgSend(*(id *)(a1 + 40), "intersectsSet:", v4);
    }

  }
  return a1;
}

- (BOOL)buttonShouldStart:(id)a3
{
  id v4;
  int v5;
  int v6;
  NSObject *v7;
  void *v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[SBHardwareButtonCoordinator _shouldSuppressButtonIdentifier:]((unint64_t)self, v4);
  v6 = -[NSCountedSet containsObject:](self->_canceledButtonIdentifiers, "containsObject:", v4);
  SBLogButtonsInteraction();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self->_activeButtonIdentifiers);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self->_canceledButtonIdentifiers);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138544642;
    v12 = v4;
    v13 = 1024;
    v14 = v5;
    v15 = 1024;
    v16 = v6;
    v17 = 1024;
    v18 = (v5 | v6) ^ 1;
    v19 = 2114;
    v20 = v9;
    v21 = 2114;
    v22 = v10;
    _os_log_debug_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEBUG, "%{public}@ shouldSuppress:(%{BOOL}u) isCanceled:(%{BOOL}u) shouldStart:(%{BOOL}u) active:%{public}@ canceled:%{public}@", (uint8_t *)&v11, 0x32u);

  }
  return (v5 | v6) ^ 1;
}

- (id)assertButtonIsActive:(id)a3
{
  return -[SBHardwareButtonCoordinator assertButtonIsActive:dropletHintIdentifier:](self, "assertButtonIsActive:dropletHintIdentifier:", a3, 0);
}

- (id)assertButtonIsActive:(id)a3 dropletHintIdentifier:(int64_t)a4
{
  id v6;
  NSCountedSet *v7;
  NSCountedSet *activeButtonIdentifiers;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  _QWORD v22[5];
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!self->_activeButtonIdentifiers)
  {
    v7 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E0CB3550]);
    activeButtonIdentifiers = self->_activeButtonIdentifiers;
    self->_activeButtonIdentifiers = v7;

  }
  SBLogButtonsInteraction();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v31 = v6;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ active", buf, 0xCu);
  }

  -[NSCountedSet addObject:](self->_activeButtonIdentifiers, "addObject:", v6);
  if (a4)
  {
    -[SBWindowScene hardwareButtonBezelEffectsCoordinator](self->_windowScene, "hardwareButtonBezelEffectsCoordinator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "activateHintDropletForButton:", a4);
    a4 = objc_claimAutoreleasedReturnValue();

  }
  if (-[NSCountedSet countForObject:](self->_activeButtonIdentifiers, "countForObject:", v6) == 1)
  {
    -[NSDictionary objectForKey:](self->_buttonIdentifierToSuppressedButtonIdentifiers, "objectForKey:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v26;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v26 != v14)
            objc_enumerationMutation(v11);
          -[NSDictionary objectForKey:](self->_buttonIdentifierToButtonInstance, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v15));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "cancelHardwareButtonPress");

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v13);
    }

  }
  v17 = objc_alloc(MEMORY[0x1E0D01868]);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __92__SBHardwareButtonCoordinator_ButtonsColluding__assertButtonIsActive_dropletHintIdentifier___block_invoke;
  v22[3] = &unk_1E8EB3628;
  v22[4] = self;
  v23 = v6;
  v24 = (id)a4;
  v18 = (id)a4;
  v19 = v6;
  v20 = (void *)objc_msgSend(v17, "initWithIdentifier:forReason:invalidationBlock:", v19, CFSTR("button active"), v22);

  return v20;
}

void __92__SBHardwareButtonCoordinator_ButtonsColluding__assertButtonIsActive_dropletHintIdentifier___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "invalidate");
  SBLogButtonsInteraction();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = 138543362;
    v5 = v3;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ inactive", (uint8_t *)&v4, 0xCu);
  }

}

- (id)cancelHardwareButtons:(id)a3 fromButton:(id)a4
{
  id v7;
  id v8;
  NSCountedSet *v9;
  NSCountedSet *canceledButtonIdentifiers;
  NSObject *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v25;
  _QWORD v26[4];
  id v27;
  SBHardwareButtonCoordinator *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  id v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!self->_canceledButtonIdentifiers)
  {
    v9 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E0CB3550]);
    canceledButtonIdentifiers = self->_canceledButtonIdentifiers;
    self->_canceledButtonIdentifiers = v9;

  }
  SBLogButtonsInteraction();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v36 = v8;
    v37 = 2114;
    v38 = v12;
    _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ started canceling %{public}@", buf, 0x16u);

  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v13 = v7;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v31 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        if (objc_msgSend(v18, "isEqual:", v8))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("button cannot cancel itself (%@)"), v8);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            -[SBHardwareButtonCoordinator(ButtonsColluding) cancelHardwareButtons:fromButton:].cold.1(a2, (uint64_t)self, (uint64_t)v25);
          objc_msgSend(objc_retainAutorelease(v25), "UTF8String");
          _bs_set_crash_log_message();
          __break(0);
          JUMPOUT(0x1D0AE4494);
        }
        -[NSCountedSet addObject:](self->_canceledButtonIdentifiers, "addObject:", v18);
        -[NSDictionary objectForKey:](self->_buttonIdentifierToButtonInstance, "objectForKey:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "cancelHardwareButtonPress");

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v15);
  }

  v20 = objc_alloc(MEMORY[0x1E0D01868]);
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __82__SBHardwareButtonCoordinator_ButtonsColluding__cancelHardwareButtons_fromButton___block_invoke;
  v26[3] = &unk_1E8EB3628;
  v27 = v13;
  v28 = self;
  v29 = v8;
  v21 = v8;
  v22 = v13;
  v23 = (void *)objc_msgSend(v20, "initWithIdentifier:forReason:invalidationBlock:", CFSTR("cancel some buttons"), v21, v26);

  return v23;
}

void __82__SBHardwareButtonCoordinator_ButtonsColluding__cancelHardwareButtons_fromButton___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  void *v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "removeObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v6++), (_QWORD)v10);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v18, 16);
    }
    while (v4);
  }

  SBLogButtonsInteraction();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", *(_QWORD *)(a1 + 32));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v15 = v8;
    v16 = 2114;
    v17 = v9;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ stopped canceling %{public}@", buf, 0x16u);

  }
}

@end
