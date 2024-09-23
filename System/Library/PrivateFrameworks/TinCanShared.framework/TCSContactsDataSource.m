@implementation TCSContactsDataSource

- (TCSContactsDataSource)initWithContactStore:(id)a3 contacts:(id)a4
{
  id v7;
  id v8;
  TCSContactsDataSource *v9;
  TCSContactsDataSource *v10;
  const char *v11;
  NSObject *v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint8_t v18[16];
  _QWORD handler[4];
  id v20;
  id location;
  objc_super v22;

  v7 = a3;
  v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)TCSContactsDataSource;
  v9 = -[TCSContactsDataSource init](&v22, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contactStore, a3);
    objc_storeStrong((id *)&v10->_contacts, a4);
    -[TCSContacts addObserver:](v10->_contacts, "addObserver:", v10);
    objc_initWeak(&location, v10);
    v11 = (const char *)objc_msgSend((id)*MEMORY[0x24BE5C358], "UTF8String");
    v12 = MEMORY[0x24BDAC9B8];
    v13 = MEMORY[0x24BDAC9B8];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __55__TCSContactsDataSource_initWithContactStore_contacts___block_invoke;
    handler[3] = &unk_24CFC2550;
    objc_copyWeak(&v20, &location);
    notify_register_dispatch(v11, &v10->_namePrefChangeToken, v12, handler);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v10, sel__handleContactStoreDidChange_, *MEMORY[0x24BDBA3D0], 0);
    if (+[TCSBehavior isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot](TCSBehavior, "isMobileKeyBagDisabledOrDeviceUnlockedSinceBoot"))
    {
      -[TCSContactsDataSource _updateSortedContactsAndNotifyIfChanged:](v10, "_updateSortedContactsAndNotifyIfChanged:", 0);
    }
    else
    {
      _TCSInitializeLogging();
      v15 = TCSLogDefault;
      if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_21342E000, v15, OS_LOG_TYPE_DEFAULT, "TCSContactsDataSource will need to wait for first device unlock before it can generate Walkie-Talkie contacts for display.", v18, 2u);
      }
      +[TCSBehavior sharedBehavior](TCSBehavior, "sharedBehavior");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObserver:selector:name:object:", v10, sel__handleDeviceFirstUnlock, CFSTR("TCSFirstUnlockNotification"), v16);

    }
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v10;
}

void __55__TCSContactsDataSource_initWithContactStore_contacts___block_invoke(uint64_t a1, int a2)
{
  _DWORD *WeakRetained;
  _DWORD *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[14] == a2)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "_handlePersonNamePreferencesChangeNotification");
    WeakRetained = v4;
  }

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[TCSContacts removeObserver:](self->_contacts, "removeObserver:", self);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  notify_cancel(self->_namePrefChangeToken);
  v4.receiver = self;
  v4.super_class = (Class)TCSContactsDataSource;
  -[TCSContactsDataSource dealloc](&v4, sel_dealloc);
}

- (unint64_t)sectionCount
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  unint64_t v6;

  v3 = -[NSArray count](self->_sortedContacts, "count");
  v4 = -[NSArray count](self->_sortedInviters, "count");
  v5 = 1;
  if (v3)
    v5 = 2;
  if (v4)
    v6 = v5;
  else
    v6 = v3 != 0;
  if (-[NSArray count](self->_sortedInvitees, "count"))
    return v6 + 1;
  else
    return v6;
}

+ (id)descriptorForRequiredKeys
{
  if (descriptorForRequiredKeys_cn_once_token_1 != -1)
    dispatch_once(&descriptorForRequiredKeys_cn_once_token_1, &__block_literal_global_0);
  return (id)descriptorForRequiredKeys_cn_once_object_1;
}

void __50__TCSContactsDataSource_descriptorForRequiredKeys__block_invoke()
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
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TCSContactsDataSource descriptorForRequiredKeys]_block_invoke");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "descriptorWithKeyDescriptors:description:", v4, v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)descriptorForRequiredKeys_cn_once_object_1;
  descriptorForRequiredKeys_cn_once_object_1 = v6;

}

- (int64_t)inviteContact:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  int64_t v14;
  void *v16;
  void *v17;
  void *v18;
  CNContactStore *contactStore;
  void *v20;
  id v21;
  NSArray *v22;
  NSArray *sortedInvitees;
  NSDictionary *v24;
  NSDictionary *inviteeContactMap;
  NSMutableSet *allowedContactIdentifiers;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  TCSContacts *contacts;
  void *v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[TCSContactsDataSource sortedInvitees](self, "sortedInvitees");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  if (!objc_msgSend(v6, "containsObject:", v4))
  {
    -[TCSContactsDataSource sortedInviters](self, "sortedInviters");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "containsObject:", v4);

    if (v9)
    {
      _TCSInitializeLogging();
      v10 = (void *)TCSLogDefault;
      if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_ERROR))
        -[TCSContactsDataSource inviteContact:].cold.2(v10);
      goto LABEL_10;
    }
    -[TCSContactsDataSource sortedContacts](self, "sortedContacts");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "containsObject:", v4);

    if (v12)
    {
      _TCSInitializeLogging();
      v13 = (void *)TCSLogDefault;
      if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_ERROR))
        -[TCSContactsDataSource inviteContact:].cold.3(v13);
      goto LABEL_10;
    }
    +[TCSContactsDataSource descriptorForRequiredKeys](TCSContactsDataSource, "descriptorForRequiredKeys");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v16;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v4, "areKeysAvailable:", v17) & 1) != 0)
    {
      v18 = v4;
    }
    else
    {
      contactStore = self->_contactStore;
      objc_msgSend(v4, "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 0;
      -[CNContactStore unifiedContactWithIdentifier:keysToFetch:error:](contactStore, "unifiedContactWithIdentifier:keysToFetch:error:", v20, v17, &v33);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v33;

      if (v21)
      {
        _TCSInitializeLogging();
        if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_ERROR))
          -[TCSContactsDataSource inviteContact:].cold.4();

        v14 = 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_21;
      }
    }
    objc_msgSend(v6, "addObject:", v18);
    -[TCSContactsDataSource _sortedContactsArrayFromArray:](self, "_sortedContactsArrayFromArray:", v6);
    v22 = (NSArray *)objc_claimAutoreleasedReturnValue();
    sortedInvitees = self->_sortedInvitees;
    self->_sortedInvitees = v22;

    -[TCSContactsDataSource _contactMapFromArray:](self, "_contactMapFromArray:", self->_sortedInvitees);
    v24 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    inviteeContactMap = self->_inviteeContactMap;
    self->_inviteeContactMap = v24;

    allowedContactIdentifiers = self->_allowedContactIdentifiers;
    objc_msgSend(v18, "identifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet addObject:](allowedContactIdentifiers, "addObject:", v27);

    _TCSInitializeLogging();
    v28 = (void *)TCSLogDefault;
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      v29 = v28;
      +[TCSContacts _safeContactDetailStringForLogging:](TCSContacts, "_safeContactDetailStringForLogging:", v18);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v35 = v30;
      _os_log_impl(&dword_21342E000, v29, OS_LOG_TYPE_DEFAULT, "TCSContactsDataSource added an invited contact %@", buf, 0xCu);

    }
    -[TCSContacts removeObserver:](self->_contacts, "removeObserver:", self);
    contacts = self->_contacts;
    +[TCSContacts canonicalDestinationsForContact:](TCSContacts, "canonicalDestinationsForContact:", v18);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[TCSContacts addDestinations:](contacts, "addDestinations:", v32);

    -[TCSContacts addObserver:](self->_contacts, "addObserver:", self);
    v14 = -[NSArray indexOfObject:](self->_sortedInvitees, "indexOfObject:", v18);
LABEL_21:

    v4 = v18;
    goto LABEL_11;
  }
  _TCSInitializeLogging();
  v7 = (void *)TCSLogDefault;
  if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_ERROR))
    -[TCSContactsDataSource inviteContact:].cold.1(v7);
LABEL_10:
  v14 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_11:

  return v14;
}

- (void)removeContact:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;

  v4 = a3;
  v5 = -[TCSContactsDataSource _sectionForContact:](self, "_sectionForContact:", v4);
  if (v5 == -1)
  {
    _TCSInitializeLogging();
    v6 = (void *)TCSLogDefault;
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_ERROR))
      -[TCSContactsDataSource removeContact:].cold.1(v6);
  }
  else
  {
    -[TCSContactsDataSource removeContact:inSection:](self, "removeContact:inSection:", v4, v5);
  }

}

- (void)removeContact:(id)a3 inSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  NSArray *v9;
  NSArray *sortedContacts;
  NSDictionary *v11;
  NSDictionary *inviteeContactMap;
  void *v13;
  NSArray *v14;
  NSArray *sortedInvitees;
  NSDictionary *v16;
  NSArray *v17;
  NSArray *sortedInviters;
  NSDictionary *v19;
  NSMutableSet *allowedContactIdentifiers;
  void *v21;
  NSMutableSet *inviterContactIdentifiers;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  TCSContacts *contacts;
  void *v28;
  int v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[TCSContactsDataSource _contactsForSection:](self, "_contactsForSection:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  if ((objc_msgSend(v8, "containsObject:", v6) & 1) != 0)
  {
    objc_msgSend(v8, "removeObject:", v6);
    if (a4 == 2)
    {
      v14 = (NSArray *)objc_msgSend(v8, "copy");
      sortedInvitees = self->_sortedInvitees;
      self->_sortedInvitees = v14;

      -[TCSContactsDataSource _contactMapFromArray:](self, "_contactMapFromArray:", self->_sortedInvitees);
      v16 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      inviteeContactMap = self->_inviteeContactMap;
      self->_inviteeContactMap = v16;
    }
    else if (a4 == 1)
    {
      v17 = (NSArray *)objc_msgSend(v8, "copy");
      sortedInviters = self->_sortedInviters;
      self->_sortedInviters = v17;

      -[TCSContactsDataSource _contactMapFromArray:](self, "_contactMapFromArray:", self->_sortedInviters);
      v19 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      inviteeContactMap = self->_inviterContactMap;
      self->_inviterContactMap = v19;
    }
    else
    {
      if (a4)
      {
LABEL_11:
        allowedContactIdentifiers = self->_allowedContactIdentifiers;
        objc_msgSend(v6, "identifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableSet removeObject:](allowedContactIdentifiers, "removeObject:", v21);

        inviterContactIdentifiers = self->_inviterContactIdentifiers;
        objc_msgSend(v6, "identifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableSet removeObject:](inviterContactIdentifiers, "removeObject:", v23);

        _TCSInitializeLogging();
        v24 = (void *)TCSLogDefault;
        if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
        {
          v25 = v24;
          +[TCSContacts _safeContactDetailStringForLogging:](TCSContacts, "_safeContactDetailStringForLogging:", v6);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = 138412290;
          v30 = v26;
          _os_log_impl(&dword_21342E000, v25, OS_LOG_TYPE_DEFAULT, "TCSContactsDataSource removed contact %@", (uint8_t *)&v29, 0xCu);

        }
        -[TCSContacts removeObserver:](self->_contacts, "removeObserver:", self);
        contacts = self->_contacts;
        +[TCSContacts canonicalDestinationsForContact:](TCSContacts, "canonicalDestinationsForContact:", v6);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[TCSContacts removeDestinations:](contacts, "removeDestinations:", v28);

        -[TCSContacts addObserver:](self->_contacts, "addObserver:", self);
        -[TCSContactsDataSource _updateSortedContactsAndNotifyIfChanged:](self, "_updateSortedContactsAndNotifyIfChanged:", 0);
        goto LABEL_14;
      }
      v9 = (NSArray *)objc_msgSend(v8, "copy");
      sortedContacts = self->_sortedContacts;
      self->_sortedContacts = v9;

      -[TCSContactsDataSource _contactMapFromArray:](self, "_contactMapFromArray:", self->_sortedContacts);
      v11 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      inviteeContactMap = self->_allowedContactMap;
      self->_allowedContactMap = v11;
    }

    goto LABEL_11;
  }
  _TCSInitializeLogging();
  v13 = (void *)TCSLogDefault;
  if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_ERROR))
    -[TCSContactsDataSource removeContact:].cold.1(v13);
LABEL_14:

}

- (BOOL)isContactAllowed:(id)a3
{
  NSMutableSet *allowedContactIdentifiers;
  void *v4;

  allowedContactIdentifiers = self->_allowedContactIdentifiers;
  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(allowedContactIdentifiers) = -[NSMutableSet containsObject:](allowedContactIdentifiers, "containsObject:", v4);

  return (char)allowedContactIdentifiers;
}

- (BOOL)isContactAnInviter:(id)a3
{
  NSMutableSet *inviterContactIdentifiers;
  void *v4;

  inviterContactIdentifiers = self->_inviterContactIdentifiers;
  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(inviterContactIdentifiers) = -[NSMutableSet containsObject:](inviterContactIdentifiers, "containsObject:", v4);

  return (char)inviterContactIdentifiers;
}

- (id)contactWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NSDictionary objectForKeyedSubscript:](self->_allowedContactMap, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_inviterContactMap, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      -[NSDictionary objectForKeyedSubscript:](self->_inviteeContactMap, "objectForKeyedSubscript:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v5)
      {
        _TCSInitializeLogging();
        v6 = (void *)TCSLogDefault;
        if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_ERROR))
          -[TCSContactsDataSource contactWithIdentifier:].cold.1(v6, v4);
        v5 = 0;
      }
    }
  }

  return v5;
}

- (void)logSortedContacts
{
  TCSContactsDataSource *v2;
  NSUInteger v3;
  NSUInteger v4;
  NSObject *v5;
  NSObject *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  NSArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  NSArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  void *v35;
  TCSContactsDataSource *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint8_t v50[128];
  uint8_t buf[4];
  void *v52;
  _BYTE v53[128];
  uint64_t v54;

  v2 = self;
  v54 = *MEMORY[0x24BDAC8D0];
  v3 = -[NSArray count](self->_sortedContacts, "count");
  v4 = -[NSArray count](v2->_sortedInviters, "count") + v3;
  if (v4 + -[NSArray count](v2->_sortedInvitees, "count"))
  {
    v36 = v2;
    if (-[NSArray count](v2->_sortedContacts, "count"))
    {
      _TCSInitializeLogging();
      v6 = TCSLogDefault;
      if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21342E000, v6, OS_LOG_TYPE_DEFAULT, "TCSContactsDataSource has allowed contacts:", buf, 2u);
      }
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v7 = v2->_sortedContacts;
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v46;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v46 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
            _TCSInitializeLogging();
            v13 = (void *)TCSLogDefault;
            if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
            {
              v14 = v13;
              +[TCSContacts _safeContactDetailStringForLogging:](TCSContacts, "_safeContactDetailStringForLogging:", v12);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v52 = v15;
              _os_log_impl(&dword_21342E000, v14, OS_LOG_TYPE_DEFAULT, "    %@", buf, 0xCu);

            }
          }
          v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
        }
        while (v9);
      }

      v2 = v36;
    }
    if (-[NSArray count](v2->_sortedInviters, "count"))
    {
      _TCSInitializeLogging();
      v16 = TCSLogDefault;
      if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21342E000, v16, OS_LOG_TYPE_DEFAULT, "TCSContactsDataSource has contacts with unresolved incoming invites:", buf, 2u);
      }
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v17 = v2->_sortedInviters;
      v18 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v42;
        do
        {
          for (j = 0; j != v19; ++j)
          {
            if (*(_QWORD *)v42 != v20)
              objc_enumerationMutation(v17);
            v22 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * j);
            _TCSInitializeLogging();
            v23 = (void *)TCSLogDefault;
            if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
            {
              v24 = v23;
              +[TCSContacts _safeContactDetailStringForLogging:](TCSContacts, "_safeContactDetailStringForLogging:", v22);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v52 = v25;
              _os_log_impl(&dword_21342E000, v24, OS_LOG_TYPE_DEFAULT, "    %@", buf, 0xCu);

            }
          }
          v19 = -[NSArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
        }
        while (v19);
      }

      v2 = v36;
    }
    if (-[NSArray count](v2->_sortedInvitees, "count"))
    {
      _TCSInitializeLogging();
      v26 = TCSLogDefault;
      if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21342E000, v26, OS_LOG_TYPE_DEFAULT, "TCSContactsDataSource has contacts with unresolved outgoing invites:", buf, 2u);
      }
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v27 = v2->_sortedInvitees;
      v28 = -[NSArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v38;
        do
        {
          for (k = 0; k != v29; ++k)
          {
            if (*(_QWORD *)v38 != v30)
              objc_enumerationMutation(v27);
            v32 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * k);
            _TCSInitializeLogging();
            v33 = (void *)TCSLogDefault;
            if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
            {
              v34 = v33;
              +[TCSContacts _safeContactDetailStringForLogging:](TCSContacts, "_safeContactDetailStringForLogging:", v32);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v52 = v35;
              _os_log_impl(&dword_21342E000, v34, OS_LOG_TYPE_DEFAULT, "    %@", buf, 0xCu);

            }
          }
          v29 = -[NSArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
        }
        while (v29);
      }

    }
  }
  else
  {
    _TCSInitializeLogging();
    v5 = TCSLogDefault;
    if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21342E000, v5, OS_LOG_TYPE_DEFAULT, "TCSContactsDataSource has no contacts to display.", buf, 2u);
    }
  }
}

- (void)destinationsDidChange:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __47__TCSContactsDataSource_destinationsDidChange___block_invoke;
  v3[3] = &unk_24CFC2498;
  v3[4] = self;
  TCSGuaranteeMainThread(v3);
}

uint64_t __47__TCSContactsDataSource_destinationsDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSortedContactsAndNotifyIfChanged:", 1);
}

- (void)recencyDidChange:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __42__TCSContactsDataSource_recencyDidChange___block_invoke;
  v3[3] = &unk_24CFC2498;
  v3[4] = self;
  TCSGuaranteeMainThread(v3);
}

uint64_t __42__TCSContactsDataSource_recencyDidChange___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateSortedContactsAndNotifyIfChanged:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_notifyDelegateRecencyChanged");
}

- (void)contactBecameAccepted:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  TCSContactsDataSource *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __47__TCSContactsDataSource_contactBecameAccepted___block_invoke;
  v6[3] = &unk_24CFC25E8;
  v7 = v4;
  v8 = self;
  v5 = v4;
  TCSGuaranteeMainThread(v6);

}

uint64_t __47__TCSContactsDataSource_contactBecameAccepted___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  _TCSInitializeLogging();
  v2 = (void *)TCSLogDefault;
  if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = v2;
    +[TCSContacts _safeContactDetailStringForLogging:](TCSContacts, "_safeContactDetailStringForLogging:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_21342E000, v4, OS_LOG_TYPE_DEFAULT, "Contact was promoted to the allowlist: %@", (uint8_t *)&v7, 0xCu);

  }
  return objc_msgSend(*(id *)(a1 + 40), "_updateSortedContactsAndNotifyIfChanged:", 1);
}

- (id)_contactMapFromArray:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "identifier", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, v11);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  v12 = (void *)objc_msgSend(v4, "copy");
  return v12;
}

- (void)_updateSortedContactsAndNotifyIfChanged:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *sortedContacts;
  NSDictionary *v10;
  NSDictionary *allowedContactMap;
  int v12;
  NSArray *sortedInviters;
  NSDictionary *v14;
  NSDictionary *inviterContactMap;
  NSArray *sortedInvitees;
  NSDictionary *v17;
  NSDictionary *inviteeContactMap;
  NSMutableSet *v19;
  NSMutableSet *allowedContactIdentifiers;
  NSArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  NSMutableSet *v26;
  void *v27;
  NSArray *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  NSMutableSet *v33;
  void *v34;
  NSMutableSet *v35;
  NSMutableSet *inviterContactIdentifiers;
  NSArray *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t k;
  NSMutableSet *v42;
  void *v43;
  void *v44;
  _BOOL4 v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v3 = a3;
  v62 = *MEMORY[0x24BDAC8D0];
  -[TCSContactsDataSource _unsortedContactsArray](self, "_unsortedContactsArray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TCSContactsDataSource _sortedContactsArrayFromArray:forSection:](self, "_sortedContactsArrayFromArray:forSection:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TCSContactsDataSource _sortedContactsArrayFromArray:forSection:](self, "_sortedContactsArrayFromArray:forSection:", v5, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TCSContactsDataSource _sortedContactsArrayFromArray:forSection:](self, "_sortedContactsArrayFromArray:forSection:", v5, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  sortedContacts = self->_sortedContacts;
  if (sortedContacts
    && !-[TCSContactsDataSource _contactArray:differsFromArray:](self, "_contactArray:differsFromArray:", sortedContacts, v6))
  {
    v12 = 0;
  }
  else
  {
    objc_storeStrong((id *)&self->_sortedContacts, v6);
    -[TCSContactsDataSource _contactMapFromArray:](self, "_contactMapFromArray:", v6);
    v10 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    allowedContactMap = self->_allowedContactMap;
    self->_allowedContactMap = v10;

    v12 = 1;
  }
  sortedInviters = self->_sortedInviters;
  if (!sortedInviters
    || -[TCSContactsDataSource _contactArray:differsFromArray:](self, "_contactArray:differsFromArray:", sortedInviters, v7))
  {
    objc_storeStrong((id *)&self->_sortedInviters, v7);
    -[TCSContactsDataSource _contactMapFromArray:](self, "_contactMapFromArray:", v7);
    v14 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    inviterContactMap = self->_inviterContactMap;
    self->_inviterContactMap = v14;

    v12 = 1;
  }
  sortedInvitees = self->_sortedInvitees;
  if (sortedInvitees
    && !-[TCSContactsDataSource _contactArray:differsFromArray:](self, "_contactArray:differsFromArray:", sortedInvitees, v8))
  {
    if (!v12)
      goto LABEL_35;
  }
  else
  {
    objc_storeStrong((id *)&self->_sortedInvitees, v8);
    -[TCSContactsDataSource _contactMapFromArray:](self, "_contactMapFromArray:", v8);
    v17 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    inviteeContactMap = self->_inviteeContactMap;
    self->_inviteeContactMap = v17;

  }
  v44 = v7;
  v45 = v3;
  v46 = v6;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v19 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  allowedContactIdentifiers = self->_allowedContactIdentifiers;
  self->_allowedContactIdentifiers = v19;

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v21 = self->_sortedContacts;
  v22 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v56 != v24)
          objc_enumerationMutation(v21);
        v26 = self->_allowedContactIdentifiers;
        objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * i), "identifier");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableSet addObject:](v26, "addObject:", v27);

      }
      v23 = -[NSArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
    }
    while (v23);
  }

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v28 = self->_sortedInvitees;
  v29 = -[NSArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v52;
    do
    {
      for (j = 0; j != v30; ++j)
      {
        if (*(_QWORD *)v52 != v31)
          objc_enumerationMutation(v28);
        v33 = self->_allowedContactIdentifiers;
        objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * j), "identifier");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableSet addObject:](v33, "addObject:", v34);

      }
      v30 = -[NSArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
    }
    while (v30);
  }

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v35 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  inviterContactIdentifiers = self->_inviterContactIdentifiers;
  self->_inviterContactIdentifiers = v35;

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v37 = self->_sortedInviters;
  v38 = -[NSArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v48;
    do
    {
      for (k = 0; k != v39; ++k)
      {
        if (*(_QWORD *)v48 != v40)
          objc_enumerationMutation(v37);
        v42 = self->_inviterContactIdentifiers;
        objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * k), "identifier");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableSet addObject:](v42, "addObject:", v43);

      }
      v39 = -[NSArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
    }
    while (v39);
  }

  -[TCSContactsDataSource logSortedContacts](self, "logSortedContacts");
  v6 = v46;
  v7 = v44;
  if (v45)
    -[TCSContactsDataSource _notifyDelegateContactsChanged](self, "_notifyDelegateContactsChanged");
LABEL_35:

}

- (void)_notifyDelegateContactsChanged
{
  TCSContactsDataSourceDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v6, "contactsDidChange:", self);

  }
}

- (void)_notifyDelegateRecencyChanged
{
  TCSContactsDataSourceDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v6, "recencyDidChange:", self);

  }
}

- (id)_unsortedContactsArray
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id obj;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  -[TCSContacts destinations](self->_contacts, "destinations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v8);
        -[TCSContactsDataSource contactStore](self, "contactStore");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[TCSContactsDataSource descriptorForRequiredKeys](TCSContactsDataSource, "descriptorForRequiredKeys");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v11;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v23, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[TCSContacts _unifiedContactWithIdentifier:orDestination:usingContactStore:keysToFetch:](TCSContacts, "_unifiedContactWithIdentifier:orDestination:usingContactStore:keysToFetch:", 0, v9, v10, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v13, "identifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setValue:forKey:", v13, v14);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v6);
  }

  objc_msgSend(v18, "allValues");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_sortedContactsArrayFromArray:(id)a3 forSection:(int64_t)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  BOOL (*v13)(uint64_t, uint64_t);
  void *v14;
  TCSContactsDataSource *v15;
  int64_t v16;

  v5 = (void *)MEMORY[0x24BDD1758];
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __66__TCSContactsDataSource__sortedContactsArrayFromArray_forSection___block_invoke;
  v14 = &unk_24CFC2610;
  v15 = self;
  v16 = a4;
  v6 = a3;
  objc_msgSend(v5, "predicateWithBlock:", &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filteredArrayUsingPredicate:", v7, v11, v12, v13, v14, v15, v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[TCSContactsDataSource _sortedContactsArrayFromArray:](self, "_sortedContactsArrayFromArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

BOOL __66__TCSContactsDataSource__sortedContactsArrayFromArray_forSection___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  _BOOL4 v5;
  _BOOL4 v6;

  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "stateForContact:", a2);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = v3 == 4;
  v6 = v3 == 3;
  if (v4)
    v6 = 0;
  if (v4 != 1)
    v5 = v6;
  if (v4 == 2)
    return (unint64_t)(v3 - 1) < 2;
  else
    return v5;
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

- (id)_contactsForSection:(int64_t)a3
{
  void *v3;

  if (a3 == 2)
  {
    -[TCSContactsDataSource sortedInvitees](self, "sortedInvitees");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3 == 1)
  {
    -[TCSContactsDataSource sortedInviters](self, "sortedInviters");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3)
  {
    v3 = 0;
  }
  else
  {
    -[TCSContactsDataSource sortedContacts](self, "sortedContacts");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int64_t)_sectionForContact:(id)a3
{
  id v4;
  NSDictionary *allowedContactMap;
  void *v6;
  void *v7;
  int64_t v8;
  NSDictionary *inviterContactMap;
  void *v10;
  void *v11;
  NSDictionary *inviteeContactMap;
  void *v13;
  void *v14;

  v4 = a3;
  allowedContactMap = self->_allowedContactMap;
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](allowedContactMap, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = 0;
  }
  else
  {
    inviterContactMap = self->_inviterContactMap;
    objc_msgSend(v4, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](inviterContactMap, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v8 = 1;
    }
    else
    {
      inviteeContactMap = self->_inviteeContactMap;
      objc_msgSend(v4, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary objectForKeyedSubscript:](inviteeContactMap, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
        v8 = 2;
      else
        v8 = -1;
    }
  }

  return v8;
}

- (BOOL)_contactArray:(id)a3 differsFromArray:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int isKindOfClass;
  int v12;
  int v13;
  BOOL v14;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "count");
  if (v7 != objc_msgSend(v6, "count"))
  {
LABEL_12:
    v14 = 1;
    goto LABEL_13;
  }
  if (objc_msgSend(v5, "count"))
  {
    v8 = 0;
    while (1)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      objc_opt_class();
      v12 = objc_opt_isKindOfClass();
      v13 = v12;
      if (((isKindOfClass & 1) == 0
         || (v12 & 1) == 0
         || !+[TCSContacts _isUnknownContact:equalToUnknownContact:](TCSContacts, "_isUnknownContact:equalToUnknownContact:", v9, v10))&& (((isKindOfClass | v13) & 1) != 0 || (objc_msgSend(v9, "isEqual:", v10) & 1) == 0))
      {
        break;
      }

      if (++v8 >= (unint64_t)objc_msgSend(v5, "count"))
        goto LABEL_10;
    }

    goto LABEL_12;
  }
LABEL_10:
  v14 = 0;
LABEL_13:

  return v14;
}

- (void)_handleContactStoreDidChange:(id)a3
{
  -[TCSContactsDataSource _updateSortedContactsAndNotifyIfChanged:](self, "_updateSortedContactsAndNotifyIfChanged:", 1);
}

- (void)_handlePersonNamePreferencesChangeNotification
{
  -[TCSContactsDataSource _updateSortedContactsAndNotifyIfChanged:](self, "_updateSortedContactsAndNotifyIfChanged:", 1);
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
    _os_log_impl(&dword_21342E000, v3, OS_LOG_TYPE_DEFAULT, "TCSContactsDataSource was notified of first device unlock.", v4, 2u);
  }
  -[TCSContactsDataSource _updateSortedContactsAndNotifyIfChanged:](self, "_updateSortedContactsAndNotifyIfChanged:", 1);
}

- (TCSContactsDataSourceDelegate)delegate
{
  return (TCSContactsDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (TCSContacts)contacts
{
  return self->_contacts;
}

- (NSArray)sortedContacts
{
  return self->_sortedContacts;
}

- (void)setSortedContacts:(id)a3
{
  objc_storeStrong((id *)&self->_sortedContacts, a3);
}

- (NSArray)sortedInviters
{
  return self->_sortedInviters;
}

- (void)setSortedInviters:(id)a3
{
  objc_storeStrong((id *)&self->_sortedInviters, a3);
}

- (NSArray)sortedInvitees
{
  return self->_sortedInvitees;
}

- (void)setSortedInvitees:(id)a3
{
  objc_storeStrong((id *)&self->_sortedInvitees, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortedInvitees, 0);
  objc_storeStrong((id *)&self->_sortedInviters, 0);
  objc_storeStrong((id *)&self->_sortedContacts, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_inviteeContactMap, 0);
  objc_storeStrong((id *)&self->_inviterContactMap, 0);
  objc_storeStrong((id *)&self->_allowedContactMap, 0);
  objc_storeStrong((id *)&self->_inviterContactIdentifiers, 0);
  objc_storeStrong((id *)&self->_allowedContactIdentifiers, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
}

- (void)inviteContact:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "_safeContactDetailStringForLogging:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_21342E000, v4, v5, "Attempt to add an invited contact that was already marked as such: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_0();
}

- (void)inviteContact:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "_safeContactDetailStringForLogging:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_21342E000, v4, v5, "Attempt to add an invited contact that has a pending remote invite awaiting user response: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_0();
}

- (void)inviteContact:(void *)a1 .cold.3(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "_safeContactDetailStringForLogging:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_21342E000, v4, v5, "Attempt to add an invited contact that is already allowed: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_0();
}

- (void)inviteContact:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_21342E000, v0, v1, "Error remaking contact: %@", v2);
}

- (void)removeContact:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_3(), "_safeContactDetailStringForLogging:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_21342E000, v4, v5, "Attempt to remove a contact not contained within the contacts data source: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_0();
}

- (void)contactWithIdentifier:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  TCSLogSafeDescription(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_21342E000, v3, v5, "Map lookup for contact identifier %@ did not find any contact.", v6);

}

@end
