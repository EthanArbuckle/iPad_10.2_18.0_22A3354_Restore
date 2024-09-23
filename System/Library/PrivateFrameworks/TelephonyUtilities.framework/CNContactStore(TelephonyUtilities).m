@implementation CNContactStore(TelephonyUtilities)

+ (id)tu_contactStore
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(MEMORY[0x1E0C972A0]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tu_assumedIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAssumedIdentity:", v4);

  objc_msgSend(v2, "setIncludeLocalContacts:", 1);
  v5 = (void *)objc_msgSend([a1 alloc], "initWithConfiguration:", v2);

  return v5;
}

+ (uint64_t)tu_authorizationStatus
{
  return objc_msgSend(MEMORY[0x1E0C97298], "authorizationStatusForEntityType:", 0);
}

+ (BOOL)tu_isAuthorized
{
  return objc_msgSend(a1, "tu_authorizationStatus") == 3;
}

- (id)tu_contactsByContactHandleForContactHandles:()TelephonyUtilities keyDescriptors:error:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  int v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "count"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97210]), "initWithKeysToFetch:", v9);
    objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingHandleStrings:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPredicate:", v11);

    TUDefaultLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138412546;
      v19 = (uint64_t)v10;
      v20 = 2112;
      v21 = a1;
      _os_log_impl(&dword_19A50D000, v12, OS_LOG_TYPE_DEFAULT, "Executing contact fetch request %@ using contact store %@", (uint8_t *)&v18, 0x16u);
    }

    objc_msgSend(a1, "executeFetchRequest:error:", v10, a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "value");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    TUDefaultLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = objc_msgSend(v14, "count");
      v18 = 134217984;
      v19 = v16;
      _os_log_impl(&dword_19A50D000, v15, OS_LOG_TYPE_DEFAULT, "Contact fetch request returned %lu results", (uint8_t *)&v18, 0xCu);
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

@end
