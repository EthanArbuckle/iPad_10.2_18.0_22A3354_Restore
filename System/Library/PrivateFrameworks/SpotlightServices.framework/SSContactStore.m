@implementation SSContactStore

+ (id)contactStore
{
  if (contactStore_sContactStoreOnce != -1)
    dispatch_once(&contactStore_sContactStoreOnce, &__block_literal_global_3);
  return (id)contactStore_sContactStore;
}

void __30__SSContactStore_contactStore__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C97298]);
  v1 = (void *)contactStore_sContactStore;
  contactStore_sContactStore = (uint64_t)v0;

}

+ (id)contactForContactIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v15;
  _QWORD v16[10];

  v16[9] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (contactForContactIdentifier__onceToken != -1)
    dispatch_once(&contactForContactIdentifier__onceToken, &__block_literal_global_1);
  objc_msgSend((id)contactForContactIdentifier__contactForIdentifierCache, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = *MEMORY[0x1E0C966C0];
    v16[0] = *MEMORY[0x1E0C966D0];
    v16[1] = v6;
    v7 = *MEMORY[0x1E0C967C0];
    v16[2] = *MEMORY[0x1E0C966A8];
    v16[3] = v7;
    v8 = *MEMORY[0x1E0C96670];
    v16[4] = *MEMORY[0x1E0C967F0];
    v16[5] = v8;
    v9 = *MEMORY[0x1E0C967B8];
    v16[6] = *MEMORY[0x1E0C96868];
    v16[7] = v9;
    objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[8] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "contactStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    objc_msgSend(v12, "unifiedContactWithIdentifier:keysToFetch:error:", v4, v11, &v15);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v15;

    if (v5)
      objc_msgSend((id)contactForContactIdentifier__contactForIdentifierCache, "setObject:forKey:", v5, v4);

  }
  return v5;
}

void __46__SSContactStore_contactForContactIdentifier___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)contactForContactIdentifier__contactForIdentifierCache;
  contactForContactIdentifier__contactForIdentifierCache = v0;

}

+ (id)contactWithEmail:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingEmailAddress:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "contactStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unifiedContactsMatchingPredicate:keysToFetch:error:", v3, MEMORY[0x1E0C9AA60], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
