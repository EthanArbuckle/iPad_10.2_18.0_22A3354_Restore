@implementation TCSSuggestionsDataSource

- (TCSSuggestionsDataSource)initWithSuggestions:(id)a3
{
  id v5;
  TCSSuggestionsDataSource *v6;
  TCSSuggestionsDataSource *v7;
  void *v8;
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v10;
  void *v11;
  uint8_t v13[16];
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TCSSuggestionsDataSource;
  v6 = -[TCSSuggestionsDataSource init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_suggestions, a3);
    -[TCSSuggestions addObserver:](v7->_suggestions, "addObserver:", v7);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel__handleContactStoreDidChange_, *MEMORY[0x24BDBA3D0], 0);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v7, (CFNotificationCallback)_TCSSuggestionsDataSourcePersonNamePreferencesChangeHandler, (CFStringRef)*MEMORY[0x24BE5C358], 0, (CFNotificationSuspensionBehavior)0);
    if (!+[TCSBehavior isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot](TCSBehavior, "isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot"))
    {
      _TCSInitializeLogging();
      v10 = TCSLogDefault;
      if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_21342E000, v10, OS_LOG_TYPE_DEFAULT, "TCSSuggestionsDataSource will need to wait for first device unlock before it can generate Walkie-Talkie suggested contacts for display.", v13, 2u);
      }
      +[TCSBehavior sharedBehavior](TCSBehavior, "sharedBehavior");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel__handleDeviceFirstUnlock, CFSTR("TCSFirstUnlockNotification"), v11);

    }
  }

  return v7;
}

- (void)dealloc
{
  void *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v5;

  -[TCSSuggestions removeObserver:](self->_suggestions, "removeObserver:", self);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v5.receiver = self;
  v5.super_class = (Class)TCSSuggestionsDataSource;
  -[TCSSuggestionsDataSource dealloc](&v5, sel_dealloc);
}

- (BOOL)hasSuggestions
{
  void *v2;
  BOOL v3;

  -[TCSSuggestionsDataSource suggestedContacts](self, "suggestedContacts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (NSArray)suggestedContacts
{
  TCSSuggestionsDataSource *v2;
  NSArray *suggestedContacts;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  TCSSuggestionsDataSource *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  NSArray *v30;
  uint64_t v31;
  NSObject *v32;
  _BOOL4 v33;
  NSArray *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v44;
  void *v45;
  TCSSuggestionsDataSource *v46;
  void *v47;
  id obj;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD v54[5];
  _QWORD v55[5];
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t buf[4];
  void *v61;
  _BYTE v62[128];
  void *v63;
  void *v64;
  _BYTE v65[128];
  uint64_t v66;

  v2 = self;
  v66 = *MEMORY[0x24BDAC8D0];
  suggestedContacts = self->_suggestedContacts;
  if (!suggestedContacts)
  {
    -[TCSSuggestions suggestedDestinations](v2->_suggestions, "suggestedDestinations");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    obj = v5;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v57;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v57 != v8)
            objc_enumerationMutation(obj);
          v10 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i);
          v11 = v2;
          -[TCSSuggestions contactStore](v2->_suggestions, "contactStore");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          +[TCSSuggestionsDataSource descriptorForRequiredKeys](TCSSuggestionsDataSource, "descriptorForRequiredKeys");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = v13;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v64, 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          +[TCSContacts _unifiedContactWithIdentifier:orDestination:usingContactStore:keysToFetch:](TCSContacts, "_unifiedContactWithIdentifier:orDestination:usingContactStore:keysToFetch:", 0, v10, v12, v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            objc_msgSend(v15, "identifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "setValue:forKey:", v15, v16);

          }
          v2 = v11;
        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v65, 16);
      }
      while (v7);
    }

    v17 = (void *)MEMORY[0x24BDBCEF0];
    objc_msgSend(v49, "allValues");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setWithArray:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = MEMORY[0x24BDAC760];
    v55[0] = MEMORY[0x24BDAC760];
    v55[1] = 3221225472;
    v55[2] = __45__TCSSuggestionsDataSource_suggestedContacts__block_invoke;
    v55[3] = &unk_24CFC29F8;
    v55[4] = v2;
    objc_msgSend(v19, "objectsPassingTest:", v55);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "minusSet:");
    v54[0] = v20;
    v21 = v19;
    v54[1] = 3221225472;
    v54[2] = __45__TCSSuggestionsDataSource_suggestedContacts__block_invoke_2;
    v54[3] = &unk_24CFC29F8;
    v54[4] = v2;
    objc_msgSend(v19, "objectsPassingTest:", v54);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "minusSet:", v22);
    -[TCSSuggestions contactStore](v2->_suggestions, "contactStore");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[TCSSuggestionsDataSource descriptorForRequiredKeys](TCSSuggestionsDataSource, "descriptorForRequiredKeys");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = v24;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v63, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[TCSContacts _unifiedMeContactFromContactStore:keysToFetch:](TCSContacts, "_unifiedMeContactFromContactStore:keysToFetch:", v23, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v19, "containsObject:", v26))
    {
      _TCSInitializeLogging();
      v27 = TCSLogDefault;
      if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21342E000, v27, OS_LOG_TYPE_DEFAULT, "TCSSuggestionsDataSource is omitting the Me card from suggested contacts.", buf, 2u);
      }
      objc_msgSend(v19, "removeObject:", v26);
    }
    objc_msgSend(v19, "allObjects");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[TCSSuggestionsDataSource _sortedContactsArrayFromArray:](v2, "_sortedContactsArrayFromArray:", v28);
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = v2->_suggestedContacts;
    v2->_suggestedContacts = (NSArray *)v29;

    v31 = -[NSArray count](v2->_suggestedContacts, "count");
    _TCSInitializeLogging();
    v32 = TCSLogDefault;
    v33 = os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT);
    if (v31)
    {
      v44 = v26;
      v45 = v22;
      if (v33)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21342E000, v32, OS_LOG_TYPE_DEFAULT, "TCSSuggestionsDataSource has suggested contacts:", buf, 2u);
      }
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v46 = v2;
      v34 = v2->_suggestedContacts;
      v35 = -[NSArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
      if (v35)
      {
        v36 = v35;
        v37 = *(_QWORD *)v51;
        do
        {
          for (j = 0; j != v36; ++j)
          {
            if (*(_QWORD *)v51 != v37)
              objc_enumerationMutation(v34);
            v39 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * j);
            _TCSInitializeLogging();
            v40 = (void *)TCSLogDefault;
            if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
            {
              v41 = v40;
              +[TCSContacts _safeContactDetailStringForLogging:](TCSContacts, "_safeContactDetailStringForLogging:", v39);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v61 = v42;
              _os_log_impl(&dword_21342E000, v41, OS_LOG_TYPE_DEFAULT, "    %@", buf, 0xCu);

            }
          }
          v36 = -[NSArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
        }
        while (v36);
      }

      v21 = v19;
      v2 = v46;
      v26 = v44;
      v22 = v45;
    }
    else if (v33)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21342E000, v32, OS_LOG_TYPE_DEFAULT, "TCSSuggestionsDataSource has no suggested contacts to display.", buf, 2u);
    }

    suggestedContacts = v2->_suggestedContacts;
  }
  return suggestedContacts;
}

uint64_t __45__TCSSuggestionsDataSource_suggestedContacts__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v3 = a2;
  objc_msgSend(v2, "contacts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isContactAccepted:", v3);

  return v5;
}

BOOL __45__TCSSuggestionsDataSource_suggestedContacts__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v3 = a2;
  objc_msgSend(v2, "contacts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "stateForContact:", v3);

  return v5 == 4;
}

+ (id)descriptorForRequiredKeys
{
  if (descriptorForRequiredKeys_cn_once_token_5 != -1)
    dispatch_once(&descriptorForRequiredKeys_cn_once_token_5, &__block_literal_global_3);
  return (id)descriptorForRequiredKeys_cn_once_object_5;
}

void __53__TCSSuggestionsDataSource_descriptorForRequiredKeys__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];

  v8[4] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBACA0];
  objc_msgSend(MEMORY[0x24BDBACC0], "descriptorForRequiredKeysForStyle:", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v1;
  objc_msgSend(MEMORY[0x24BDBACA0], "descriptorForAllComparatorKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x24BDBA348];
  v8[1] = v2;
  v8[2] = v3;
  v8[3] = *MEMORY[0x24BDBA288];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TCSSuggestionsDataSource descriptorForRequiredKeys]_block_invoke");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "descriptorWithKeyDescriptors:description:", v4, v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)descriptorForRequiredKeys_cn_once_object_5;
  descriptorForRequiredKeys_cn_once_object_5 = v6;

}

- (void)suggestionsDidChange:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __49__TCSSuggestionsDataSource_suggestionsDidChange___block_invoke;
  v3[3] = &unk_24CFC2498;
  v3[4] = self;
  TCSGuaranteeMainThread(v3);
}

uint64_t __49__TCSSuggestionsDataSource_suggestionsDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)_invalidate
{
  NSArray *suggestedContacts;

  suggestedContacts = self->_suggestedContacts;
  self->_suggestedContacts = 0;

  -[TCSSuggestionsDataSource _notifyDelegateSuggestionsChanged](self, "_notifyDelegateSuggestionsChanged");
}

- (void)_notifyDelegateSuggestionsChanged
{
  TCSSuggestionsDataSourceDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v6, "suggestedContactsDidChange:", self);

  }
}

- (id)_sortedContactsArrayFromArray:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDBAD10];
  v4 = a3;
  objc_msgSend(v3, "sharedDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "sortOrder");

  objc_msgSend(MEMORY[0x24BDBACA0], "comparatorForNameSortOrder:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingComparator:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_handlePersonNamePreferencesChangeNotification
{
  NSArray *v3;
  NSArray *suggestedContacts;

  -[TCSSuggestionsDataSource _sortedContactsArrayFromArray:](self, "_sortedContactsArrayFromArray:", self->_suggestedContacts);
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  suggestedContacts = self->_suggestedContacts;
  self->_suggestedContacts = v3;

  -[TCSSuggestionsDataSource _notifyDelegateSuggestionsChanged](self, "_notifyDelegateSuggestionsChanged");
}

- (void)_handleDeviceFirstUnlock
{
  NSObject *v3;
  uint8_t v4[16];

  _TCSInitializeLogging();
  v3 = TCSLogDefault;
  if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21342E000, v3, OS_LOG_TYPE_DEFAULT, "TCSSuggestionsDataSource was notified of first device unlock.", v4, 2u);
  }
  -[TCSSuggestionsDataSource _invalidate](self, "_invalidate");
}

- (TCSSuggestionsDataSourceDelegate)delegate
{
  return (TCSSuggestionsDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (TCSSuggestions)suggestions
{
  return self->_suggestions;
}

- (void)setSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_suggestions, a3);
}

- (void)setSuggestedContacts:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedContacts, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedContacts, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
