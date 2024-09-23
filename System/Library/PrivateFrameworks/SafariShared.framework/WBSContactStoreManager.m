@implementation WBSContactStoreManager

+ (WBSContactStoreManager)sharedContactStoreManager
{
  if (sharedContactStoreManager_onceToken != -1)
    dispatch_once(&sharedContactStoreManager_onceToken, &__block_literal_global_26);
  return (WBSContactStoreManager *)(id)sharedContactStoreManager_contactStore;
}

void __51__WBSContactStoreManager_sharedContactStoreManager__block_invoke()
{
  WBSContactStoreManager *v0;
  void *v1;

  v0 = objc_alloc_init(WBSContactStoreManager);
  v1 = (void *)sharedContactStoreManager_contactStore;
  sharedContactStoreManager_contactStore = (uint64_t)v0;

}

- (WBSContactStoreManager)init
{
  WBSContactStoreManager *v2;
  CNContactStore *v3;
  CNContactStore *contactStore;
  WBSContactStoreManager *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WBSContactStoreManager;
  v2 = -[WBSContactStoreManager init](&v7, sel_init);
  if (v2)
  {
    v3 = (CNContactStore *)objc_alloc_init(MEMORY[0x1E0C97298]);
    contactStore = v2->_contactStore;
    v2->_contactStore = v3;

    v5 = v2;
  }

  return v2;
}

- (id)contactForHandle:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a3;
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C97200], "safari_imageViewDescriptors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v9);

    v10 = objc_msgSend(v6, "containsString:", CFSTR("@"));
    v11 = (void *)MEMORY[0x1E0C97200];
    if ((v10 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingEmailAddress:", v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "predicateForContactsMatchingPhoneNumber:", v14);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[CNContactStore unifiedContactsMatchingPredicate:keysToFetch:error:](self->_contactStore, "unifiedContactsMatchingPredicate:keysToFetch:error:", v12, v8, a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "safari_firstObjectPassingTest:", &__block_literal_global_7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

BOOL __49__WBSContactStoreManager_contactForHandle_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "safari_fullName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (id)temporaryContactForIdentity:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *temporaryContacts;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSMutableDictionary *v24;
  void *v25;
  void *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_temporaryContacts)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    temporaryContacts = self->_temporaryContacts;
    self->_temporaryContacts = v5;

  }
  objc_msgSend(v4, "userRecordID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7
    || (v8 = self->_temporaryContacts,
        objc_msgSend(v4, "userRecordID"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        -[NSMutableDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v9),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        !v10))
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C97360]);
    objc_msgSend(v4, "nameComponents");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "overrideComponentsInContact:", v11);

    objc_msgSend(v4, "lookupInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "emailAddress");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0C97338], "labeledValueWithLabel:value:", *MEMORY[0x1E0C96FF8], v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setEmailAddresses:", v16);

    }
    objc_msgSend(v13, "phoneNumber");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = (void *)MEMORY[0x1E0C97338];
      v19 = *MEMORY[0x1E0C97058];
      objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "labeledValueWithLabel:value:", v19, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v21;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setPhoneNumbers:", v22);

    }
    v10 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(v4, "userRecordID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      v24 = self->_temporaryContacts;
      objc_msgSend(v4, "userRecordID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v24, "setObject:forKeyedSubscript:", v10, v25);

    }
  }

  return v10;
}

- (id)unifiedContactWithIdentifier:(id)a3 keysToFetch:(id)a4 error:(id *)a5
{
  return -[CNContactStore unifiedContactWithIdentifier:keysToFetch:error:](self->_contactStore, "unifiedContactWithIdentifier:keysToFetch:error:", a3, a4, a5);
}

- (id)_ios_meContactWithKeysToFetch:(id)a3 error:(id *)a4
{
  return (id)-[CNContactStore _ios_meContactWithKeysToFetch:error:](self->_contactStore, "_ios_meContactWithKeysToFetch:error:", a3, a4);
}

- (BOOL)enumerateContactsWithFetchRequest:(id)a3 error:(id *)a4 usingBlock:(id)a5
{
  return -[CNContactStore enumerateContactsWithFetchRequest:error:usingBlock:](self->_contactStore, "enumerateContactsWithFetchRequest:error:usingBlock:", a3, a4, a5);
}

- (id)unifiedContactsMatchingPredicate:(id)a3 keysToFetch:(id)a4 error:(id *)a5
{
  return -[CNContactStore unifiedContactsMatchingPredicate:keysToFetch:error:](self->_contactStore, "unifiedContactsMatchingPredicate:keysToFetch:error:", a3, a4, a5);
}

- (void)requestAccessForEntityType:(int64_t)a3 completionHandler:(id)a4
{
  -[CNContactStore requestAccessForEntityType:completionHandler:](self->_contactStore, "requestAccessForEntityType:completionHandler:", a3, a4);
}

- (id)defaultContainerIdentifier
{
  return -[CNContactStore defaultContainerIdentifier](self->_contactStore, "defaultContainerIdentifier");
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_temporaryContacts, 0);
}

@end
