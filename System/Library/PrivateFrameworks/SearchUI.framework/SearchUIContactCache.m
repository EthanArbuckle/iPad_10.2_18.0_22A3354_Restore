@implementation SearchUIContactCache

+ (SearchUIContactCache)sharedCache
{
  if (sharedCache_onceToken != -1)
    dispatch_once(&sharedCache_onceToken, &__block_literal_global_11);
  return (SearchUIContactCache *)(id)sharedCache_sharedCache;
}

void __35__SearchUIContactCache_sharedCache__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedCache_sharedCache;
  sharedCache_sharedCache = v0;

}

- (SearchUIContactCache)init
{
  SearchUIContactCache *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v9[4];
  SearchUIContactCache *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SearchUIContactCache;
  v2 = -[TLKAsyncCache init](&v11, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    objc_msgSend(v3, "setIncludeSuggestedContacts:", 1);
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97298]), "initWithConfiguration:", v3);
    -[SearchUIContactCache setContactStore:](v2, "setContactStore:", v4);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x1E0C96870];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __28__SearchUIContactCache_init__block_invoke;
    v9[3] = &unk_1EA1F6AD8;
    v10 = v2;
    v7 = (id)objc_msgSend(v5, "addObserverForName:object:queue:usingBlock:", v6, 0, 0, v9);

  }
  return v2;
}

uint64_t __28__SearchUIContactCache_init__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "clear");
}

- (void)fetchContactForPerson:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void (**v35)(_QWORD, void *);
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[4];
  id v45;
  _BYTE v46[128];
  _BYTE v47[128];
  _QWORD v48[3];

  v48[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "contactIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v6, "contactIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __64__SearchUIContactCache_fetchContactForPerson_completionHandler___block_invoke;
    v44[3] = &unk_1EA1F6B00;
    v45 = v7;
    -[SearchUIContactCache fetchContactsForIdentifiers:completionHandler:](self, "fetchContactsForIdentifiers:completionHandler:", v10, v44);

    v11 = v45;
  }
  else
  {
    v35 = (void (**)(_QWORD, void *))v7;
    v12 = (void *)objc_opt_new();
    objc_msgSend(v6, "displayName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "length");

    if (v14)
    {
      +[SearchUIUtilities localizedStringForKey:](SearchUIUtilities, "localizedStringForKey:", CFSTR("MAYBE_CONTACT_STRING"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setNamePrefix:", v15);

      v16 = (void *)objc_opt_new();
      objc_msgSend(v6, "displayName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "personNameComponentsFromString:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "overrideComponentsInContact:", v12);
    }
    v34 = v12;
    v19 = (void *)objc_opt_new();
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    objc_msgSend(v6, "phoneNumbers");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v41;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v41 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v24), v34);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C97338], "labeledValueWithLabel:value:", 0, v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v26);

          ++v24;
        }
        while (v22 != v24);
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
      }
      while (v22);
    }

    v11 = v34;
    objc_msgSend(v34, "setPhoneNumbers:", v19);
    v27 = (void *)objc_opt_new();
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    objc_msgSend(v6, "emailAddresses");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v37;
      do
      {
        v32 = 0;
        do
        {
          if (*(_QWORD *)v37 != v31)
            objc_enumerationMutation(v28);
          objc_msgSend(MEMORY[0x1E0C97338], "labeledValueWithLabel:value:", 0, *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v32), v34);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "addObject:", v33);

          ++v32;
        }
        while (v30 != v32);
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
      }
      while (v30);
    }

    objc_msgSend(v11, "setEmailAddresses:", v27);
    v7 = v35;
    v35[2](v35, v11);

  }
}

void __64__SearchUIContactCache_fetchContactForPerson_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "firstObject");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

- (void)fetchContactForIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v12[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __68__SearchUIContactCache_fetchContactForIdentifier_completionHandler___block_invoke;
  v10[3] = &unk_1EA1F6B00;
  v9 = v7;
  v11 = v9;
  -[SearchUIContactCache fetchContactsForIdentifiers:completionHandler:](self, "fetchContactsForIdentifiers:completionHandler:", v8, v10);
  if (v6)

}

void __68__SearchUIContactCache_fetchContactForIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "firstObject");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

- (void)fetchContactsForIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if (objc_msgSend(v6, "count"))
  {
    -[TLKAsyncCache getObjectsForKeys:completionHandler:](self, "getObjectsForKeys:completionHandler:", v6, v7);
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "placeholderContact");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v9);

  }
}

- (void)computeObjectsForKeys:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;

  v7 = a4;
  -[SearchUIContactCache contactsForIdentifiers:](self, "contactsForIdentifiers:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a4 + 2))(v7, v8);

}

- (id)contactsForIdentifiers:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (contactsForIdentifiers__onceToken != -1)
    dispatch_once(&contactsForIdentifiers__onceToken, &__block_literal_global_18);
  objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsWithIdentifiers:", v4, v4);
  v5 = objc_claimAutoreleasedReturnValue();
  -[SearchUIContactCache contactStore](self, "contactStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)v5;
  objc_msgSend(v6, "unifiedContactsMatchingPredicate:keysToFetch:error:", v5, contactsForIdentifiers__requiredKeys, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_opt_new();
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v7;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v43 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        objc_msgSend(v13, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, v14);

        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        objc_msgSend(v13, "linkedContacts");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v39;
          do
          {
            for (j = 0; j != v17; ++j)
            {
              if (*(_QWORD *)v39 != v18)
                objc_enumerationMutation(v15);
              objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * j), "identifier");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, v20);

            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
          }
          while (v17);
        }

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    }
    while (v10);
  }

  v21 = (void *)objc_opt_new();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v22 = v31;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v35;
    do
    {
      for (k = 0; k != v24; ++k)
      {
        if (*(_QWORD *)v35 != v25)
          objc_enumerationMutation(v22);
        objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * k));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
        {
          objc_msgSend(v21, "addObject:", v27);
        }
        else
        {
          objc_msgSend((id)objc_opt_class(), "placeholderContact");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v28);

        }
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
    }
    while (v24);
  }

  v29 = (void *)objc_msgSend(v21, "copy");
  return v29;
}

void __47__SearchUIContactCache_contactsForIdentifiers___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C974C0], "descriptorForRequiredKeys");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = *MEMORY[0x1E0C966F8];
  v6[0] = v0;
  v6[1] = v1;
  objc_msgSend(MEMORY[0x1E0C97468], "descriptorForRequiredKeysWithThreeDTouchEnabled:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2] = v2;
  objc_msgSend(MEMORY[0x1E0C97448], "descriptorForRequiredKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[3] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 4);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)contactsForIdentifiers__requiredKeys;
  contactsForIdentifiers__requiredKeys = v4;

}

- (id)contactForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TLKAsyncCache getCachedObjectIfAvailableForKey:](self, "getCachedObjectIfAvailableForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    if (v4)
    {
      v12[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SearchUIContactCache contactsForIdentifiers:](self, "contactsForIdentifiers:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_6;
    }
    objc_msgSend((id)objc_opt_class(), "placeholderContact");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
LABEL_6:

  return v8;
}

- (id)contactForContactViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SearchUIContactCache contactStore](self, "contactStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C974D8], "descriptorForRequiredKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unifiedContactWithIdentifier:keysToFetch:error:", v4, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)placeholderContact
{
  if (placeholderContact_onceToken != -1)
    dispatch_once(&placeholderContact_onceToken, &__block_literal_global_25);
  return (id)placeholderContact_placeholderContact;
}

void __42__SearchUIContactCache_placeholderContact__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)placeholderContact_placeholderContact;
  placeholderContact_placeholderContact = v0;

}

- (id)itemsToBatchPreFetchForRowModel:(id)a3
{
  return (id)objc_msgSend(a3, "contactIdentifiers");
}

- (CNContactStore)contactStore
{
  return (CNContactStore *)objc_getProperty(self, a2, 24, 1);
}

- (void)setContactStore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);
}

@end
