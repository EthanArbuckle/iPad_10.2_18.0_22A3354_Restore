@implementation TITextCheckerExemptionsImpl

- (NSUUID)userDictionaryUUID
{
  return self->_userDictionaryUUID;
}

- (void)setUserDictionaryUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setUserDictionaryTokens:(id)a3
{
  objc_storeStrong((id *)&self->_userDictionaryTokens, a3);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)TITextCheckerExemptionsImpl;
  -[TITextCheckerExemptionsImpl dealloc](&v2, sel_dealloc);
}

- (BOOL)stringIsExemptFromChecker:(id)a3
{
  void *v4;
  TITextCheckerExemptionsImpl *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;

  objc_msgSend(a3, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = self;
  objc_sync_enter(v5);
  -[TITextCheckerExemptionsImpl addressBookTokens](v5, "addressBookTokens");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TITextCheckerExemptionsImpl userDictionaryTokens](v5, "userDictionaryTokens");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  if ((objc_msgSend(v6, "containsObject:", v4) & 1) != 0 || (objc_msgSend(v7, "containsObject:", v4) & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    +[TITransientLexiconManager sharedInstance](TITransientLexiconManager, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "searchForWordCaseInsensitive:", v4);

  }
  return v8;
}

- (void)addObserverAssertion
{
  unint64_t observerAssertionCount;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id contactObserver;
  void *v12;
  id userDictionaryObserver;
  _QWORD v14[5];
  _QWORD v15[10];
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0)
  {
    observerAssertionCount = self->_observerAssertionCount;
    self->_observerAssertionCount = observerAssertionCount + 1;
    TIPersonalizationContactOSLogFacility();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
    if (observerAssertionCount)
    {
      if (v5)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s TITextCheckerExemptions:addObserverAssertion - skipping observer"), "-[TITextCheckerExemptionsImpl addObserverAssertion]");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v17 = v6;
        _os_log_impl(&dword_1DA6F2000, v4, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

      }
    }
    else
    {
      if (v5)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s TITextCheckerExemptions:addObserverAssertion - adding observer"), "-[TITextCheckerExemptionsImpl addObserverAssertion]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v17 = v7;
        _os_log_impl(&dword_1DA6F2000, v4, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

      }
      +[TITransientLexiconManager sharedInstance](TITransientLexiconManager, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = MEMORY[0x1E0C809B0];
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __51__TITextCheckerExemptionsImpl_addObserverAssertion__block_invoke_29;
      v15[3] = &unk_1EA100A38;
      v15[4] = self;
      objc_msgSend(v8, "addContactObserver:", v15);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      contactObserver = self->_contactObserver;
      self->_contactObserver = v10;

      +[TIUserDictionaryServer sharedInstance](TIUserDictionaryServer, "sharedInstance");
      v4 = objc_claimAutoreleasedReturnValue();
      v14[0] = v9;
      v14[1] = 3221225472;
      v14[2] = __51__TITextCheckerExemptionsImpl_addObserverAssertion__block_invoke_36;
      v14[3] = &unk_1EA103228;
      v14[4] = self;
      -[NSObject addObserver:](v4, "addObserver:", v14);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      userDictionaryObserver = self->_userDictionaryObserver;
      self->_userDictionaryObserver = v12;

    }
  }
  else
  {
    v15[5] = MEMORY[0x1E0C809B0];
    v15[6] = 3221225472;
    v15[7] = __51__TITextCheckerExemptionsImpl_addObserverAssertion__block_invoke;
    v15[8] = &unk_1EA106A98;
    v15[9] = self;
    TIDispatchAsync();
  }
}

- (void)removeObserverAssertion
{
  unint64_t v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  id contactObserver;
  void *v10;
  id userDictionaryObserver;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0)
  {
    v3 = self->_observerAssertionCount - 1;
    self->_observerAssertionCount = v3;
    TIPersonalizationContactOSLogFacility();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v5)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s TITextCheckerExemptions:removeObserverAssertion - skipping observer"), "-[TITextCheckerExemptionsImpl removeObserverAssertion]");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v13 = v6;
        _os_log_impl(&dword_1DA6F2000, v4, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

      }
    }
    else
    {
      if (v5)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s TITextCheckerExemptions:removeObserverAssertion - removing observer"), "-[TITextCheckerExemptionsImpl removeObserverAssertion]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v13 = v7;
        _os_log_impl(&dword_1DA6F2000, v4, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

      }
      +[TITransientLexiconManager sharedInstance](TITransientLexiconManager, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeContactObserver:", self->_contactObserver);

      contactObserver = self->_contactObserver;
      self->_contactObserver = 0;

      +[TIUserDictionaryServer sharedInstance](TIUserDictionaryServer, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeObserver:", self->_userDictionaryObserver);

      userDictionaryObserver = self->_userDictionaryObserver;
      self->_userDictionaryObserver = 0;

    }
  }
  else
  {
    TIDispatchAsync();
  }
}

- (NSSet)addressBookTokens
{
  return self->_addressBookTokens;
}

- (void)setAddressBookTokens:(id)a3
{
  objc_storeStrong((id *)&self->_addressBookTokens, a3);
}

- (NSSet)userDictionaryTokens
{
  return self->_userDictionaryTokens;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDictionaryUUID, 0);
  objc_storeStrong((id *)&self->_userDictionaryTokens, 0);
  objc_storeStrong((id *)&self->_addressBookTokens, 0);
  objc_storeStrong(&self->_userDictionaryObserver, 0);
  objc_storeStrong(&self->_contactObserver, 0);
}

uint64_t __54__TITextCheckerExemptionsImpl_removeObserverAssertion__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeObserverAssertion");
}

uint64_t __51__TITextCheckerExemptionsImpl_addObserverAssertion__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObserverAssertion");
}

void __51__TITextCheckerExemptionsImpl_addObserverAssertion__block_invoke_29(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  id obj;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint8_t v43[128];
  uint8_t buf[4];
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  TIPersonalizationContactOSLogFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s TITextCheckerExemptions:addObserverAssertion - processing %ld contacts"), "-[TITextCheckerExemptionsImpl addObserverAssertion]_block_invoke", objc_msgSend(v2, "count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v45 = v4;
    _os_log_impl(&dword_1DA6F2000, v3, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  objc_msgSend(v2, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  if (v6)
  {
    v7 = v6;
    v28 = *(_QWORD *)v38;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v38 != v28)
          objc_enumerationMutation(obj);
        v9 = v2;
        objc_msgSend(v2, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v8));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "flatten");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v34;
          do
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v34 != v14)
                objc_enumerationMutation(v11);
              objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * v15), "lowercaseString");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "addObject:", v16);

              ++v15;
            }
            while (v13 != v15);
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
          }
          while (v13);
        }

        ++v8;
        v2 = v9;
      }
      while (v8 != v7);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    }
    while (v7);
  }

  +[TIProactiveQuickTypeManager sharedInstance](TIProactiveQuickTypeManager, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "searchForMeCardEmailAddresses");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v19 = v18;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v30;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v30 != v22)
            objc_enumerationMutation(v19);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v23), "lowercaseString");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v24);

          ++v23;
        }
        while (v21 != v23);
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
      }
      while (v21);
    }

  }
  v25 = *(id *)(a1 + 32);
  objc_sync_enter(v25);
  objc_msgSend(*(id *)(a1 + 32), "setAddressBookTokens:", v5);
  objc_sync_exit(v25);

}

void __51__TITextCheckerExemptionsImpl_addObserverAssertion__block_invoke_36(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[TIUserDictionaryServer sharedInstance](TIUserDictionaryServer, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userDictionaryUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *(id *)(a1 + 32);
  objc_sync_enter(v6);
  objc_msgSend(*(id *)(a1 + 32), "userDictionaryUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v6);

  if ((objc_msgSend(v7, "isEqual:", v5) & 1) == 0)
  {
    v24 = v7;
    v25 = a1;
    v26 = v5;
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v3, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v3;
    v9 = v3;
    v10 = v8;
    v11 = (void *)objc_opt_new();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    obj = v9;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v34;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v34 != v14)
            objc_enumerationMutation(obj);
          v16 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v15);
          v29 = 0u;
          v30 = 0u;
          v31 = 0u;
          v32 = 0u;
          objc_msgSend(v11, "allTokensForString:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
          if (v18)
          {
            v19 = v18;
            v20 = *(_QWORD *)v30;
            do
            {
              v21 = 0;
              do
              {
                if (*(_QWORD *)v30 != v20)
                  objc_enumerationMutation(v17);
                objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v21), "lowercaseString");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v10, "addObject:", v22);

                ++v21;
              }
              while (v19 != v21);
              v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
            }
            while (v19);
          }

          ++v15;
        }
        while (v15 != v13);
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v13);
    }

    v23 = *(id *)(v25 + 32);
    objc_sync_enter(v23);
    objc_msgSend(*(id *)(v25 + 32), "setUserDictionaryTokens:", v10);
    v5 = v26;
    objc_msgSend(*(id *)(v25 + 32), "setUserDictionaryUUID:", v26);
    objc_sync_exit(v23);

    v3 = v27;
    v7 = v24;
  }

}

+ (id)sharedTextCheckerExemptionsImpl
{
  if (+[TITextCheckerExemptionsImpl sharedTextCheckerExemptionsImpl]::onceToken != -1)
    dispatch_once(&+[TITextCheckerExemptionsImpl sharedTextCheckerExemptionsImpl]::onceToken, &__block_literal_global_5495);
  return (id)+[TITextCheckerExemptionsImpl sharedTextCheckerExemptionsImpl]::singleton;
}

void __62__TITextCheckerExemptionsImpl_sharedTextCheckerExemptionsImpl__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)+[TITextCheckerExemptionsImpl sharedTextCheckerExemptionsImpl]::singleton;
  +[TITextCheckerExemptionsImpl sharedTextCheckerExemptionsImpl]::singleton = v0;

}

@end
