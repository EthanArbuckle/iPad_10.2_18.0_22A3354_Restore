@implementation SSVFamilyContentDeletionEvent

- (SSVFamilyContentDeletionEvent)initWithNotificationUserInfo:(id)a3
{
  id v4;
  SSVFamilyContentDeletionEvent *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  const __CFString *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  SSVFamilyAccountPair *v25;
  uint64_t v26;
  NSArray *deletedAccounts;
  void *v29;
  SSVFamilyContentDeletionEvent *v30;
  id v31;
  id v32;
  id v33;
  SSVFamilyAccountPair *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  objc_super v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)SSVFamilyContentDeletionEvent;
  v5 = -[SSVFamilyContentDeletionEvent init](&v39, sel_init);
  if (v5)
  {
    v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v4, "objectForKey:", CFSTR("pairs"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v30 = v5;
      v31 = v4;
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v29 = v6;
      v7 = v6;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      if (v8)
      {
        v9 = v8;
        v10 = 0x1E0C99000uLL;
        v11 = *(_QWORD *)v36;
        v12 = CFSTR("did");
        v32 = v7;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v36 != v11)
              objc_enumerationMutation(v7);
            v14 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v13);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v14, "objectForKey:", v12);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "objectForKey:", CFSTR("fid"));
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "objectForKey:", CFSTR("pid"));
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v34 = [SSVFamilyAccountPair alloc];
                    v18 = v12;
                    v19 = objc_msgSend(v15, "unsignedLongLongValue");
                    v20 = v10;
                    v21 = objc_msgSend(v17, "unsignedLongLongValue");
                    v22 = objc_msgSend(v16, "unsignedLongLongValue");
                    v23 = v19;
                    v12 = v18;
                    v24 = v21;
                    v10 = v20;
                    v25 = -[SSVFamilyAccountPair initWithDownloaderAccountIdentifier:purchaserAccountIdentifier:familyIdentifier:](v34, "initWithDownloaderAccountIdentifier:purchaserAccountIdentifier:familyIdentifier:", v23, v24, v22);
                    objc_msgSend(v33, "addObject:", v25);

                    v7 = v32;
                  }
                }
              }

            }
            ++v13;
          }
          while (v9 != v13);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
        }
        while (v9);
      }

      v5 = v30;
      v4 = v31;
      v6 = v29;
    }
    v26 = objc_msgSend(v33, "copy", v29, v30, v31);
    deletedAccounts = v5->_deletedAccounts;
    v5->_deletedAccounts = (NSArray *)v26;

  }
  return v5;
}

- (SSVFamilyContentDeletionEvent)initWithXPCEventStreamEvent:(id)a3
{
  id v4;
  SSVFamilyContentDeletionEvent *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSArray *deletedAccounts;
  _QWORD applier[4];
  id v17;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SSVFamilyContentDeletionEvent;
  v5 = -[SSVFamilyContentDeletionEvent init](&v18, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (v4)
    {
      v7 = MEMORY[0x1A85863E4](v4);
      v8 = MEMORY[0x1E0C812F8];
      if (v7 == MEMORY[0x1E0C812F8])
      {
        xpc_dictionary_get_value(v4, "UserInfo");
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = (void *)v9;
        if (v9 && MEMORY[0x1A85863E4](v9) == v8)
        {
          xpc_dictionary_get_value(v10, "pairs");
          v11 = objc_claimAutoreleasedReturnValue();
          v12 = (void *)v11;
          if (v11 && MEMORY[0x1A85863E4](v11) == MEMORY[0x1E0C812C8])
          {
            applier[0] = MEMORY[0x1E0C809B0];
            applier[1] = 3221225472;
            applier[2] = __61__SSVFamilyContentDeletionEvent_initWithXPCEventStreamEvent___block_invoke;
            applier[3] = &unk_1E47B8B38;
            v17 = v6;
            xpc_array_apply(v12, applier);

          }
        }

      }
    }
    v13 = objc_msgSend(v6, "copy");
    deletedAccounts = v5->_deletedAccounts;
    v5->_deletedAccounts = (NSArray *)v13;

  }
  return v5;
}

uint64_t __61__SSVFamilyContentDeletionEvent_initWithXPCEventStreamEvent___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  SSVFamilyAccountPair *v11;
  int64_t value;
  int64_t v13;
  SSVFamilyAccountPair *v14;

  v4 = a3;
  v5 = v4;
  if (v4 && MEMORY[0x1A85863E4](v4) == MEMORY[0x1E0C812F8])
  {
    xpc_dictionary_get_value(v5, "did");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_get_value(v5, "fid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_get_value(v5, "pid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v9 = MEMORY[0x1A85863E4](v6);
      v10 = MEMORY[0x1E0C81328];
      if (v9 == MEMORY[0x1E0C81328] && v7 && MEMORY[0x1A85863E4](v7) == v10 && v8 && MEMORY[0x1A85863E4](v8) == v10)
      {
        v11 = [SSVFamilyAccountPair alloc];
        value = xpc_int64_get_value(v6);
        v13 = xpc_int64_get_value(v8);
        v14 = -[SSVFamilyAccountPair initWithDownloaderAccountIdentifier:purchaserAccountIdentifier:familyIdentifier:](v11, "initWithDownloaderAccountIdentifier:purchaserAccountIdentifier:familyIdentifier:", value, v13, xpc_int64_get_value(v7));
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v14);

      }
    }

  }
  return 1;
}

+ (id)notificationPayloadWithAccountPairs:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v8);
        v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v9, "downloaderAccountIdentifier"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKey:", v11, CFSTR("did"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v9, "familyIdentifier"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKey:", v12, CFSTR("fid"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v9, "purchaserAccountIdentifier"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKey:", v13, CFSTR("pid"));

        objc_msgSend(v4, "addObject:", v10);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

  if (objc_msgSend(v4, "count"))
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v4, CFSTR("pairs"), 0);
  else
    v14 = 0;

  return v14;
}

+ (void)postDistributedNotificationWithAccountPairs:(id)a3
{
  void *v3;
  const __CFDictionary *v4;
  __CFNotificationCenter *DistributedCenter;
  id v6;

  objc_msgSend(a1, "notificationPayloadWithAccountPairs:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v6 = v3;
    v4 = v3;
    DistributedCenter = CFNotificationCenterGetDistributedCenter();
    CFNotificationCenterPostNotification(DistributedCenter, CFSTR("com.apple.StoreServices.SSVFamilyContentDeletionNotification"), 0, v4, 0);
    CFRelease(v4);
    v3 = v6;
  }

}

- (NSArray)deletedAccounts
{
  return self->_deletedAccounts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletedAccounts, 0);
}

@end
