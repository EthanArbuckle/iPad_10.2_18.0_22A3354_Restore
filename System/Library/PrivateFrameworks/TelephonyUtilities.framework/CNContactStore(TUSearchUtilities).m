@implementation CNContactStore(TUSearchUtilities)

- (id)contactForIdentifier:()TUSearchUtilities
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;

  v4 = contactForIdentifier__onceToken;
  v5 = a3;
  if (v4 != -1)
    dispatch_once(&contactForIdentifier__onceToken, &__block_literal_global_31);
  objc_msgSend(MEMORY[0x1E0C97200], "keysToFetchForFaceTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "contactForIdentifier:keysToFetch:usingCache:", v5, v6, contactForIdentifier__identifierToContactCache);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)contactForIdentifier:()TUSearchUtilities keysToFetch:usingCache:
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "objectForKey:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(a1, "contactForIdentifier:keysToFetch:", v8, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      objc_msgSend(v10, "setObject:forKey:", v11, v8);
  }

  return v11;
}

- (id)contactForIdentifier:()TUSearchUtilities keysToFetch:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v12 = 0;
    objc_msgSend(a1, "unifiedContactWithIdentifier:keysToFetch:error:", v6, v7, &v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v12;
    if (v9)
    {
      TUDefaultLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v14 = v6;
        v15 = 2112;
        v16 = v9;
        _os_log_impl(&dword_19A50D000, v10, OS_LOG_TYPE_DEFAULT, "Error trying to fetch backing contact for identifier %@: %@", buf, 0x16u);
      }

    }
  }
  else
  {
    v8 = 0;
    v9 = 0;
  }

  return v8;
}

- (id)contactForDestinationId:()TUSearchUtilities
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (contactForDestinationId__onceToken != -1)
    dispatch_once(&contactForDestinationId__onceToken, &__block_literal_global_34);
  objc_msgSend((id)contactForDestinationId__destinationIDToContactCache, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C97200], "keysToFetchForFaceTime");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "contactForDestinationId:keysToFetch:", v4, v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      objc_msgSend((id)contactForDestinationId__destinationIDToContactCache, "setObject:forKey:", v5, v4);
  }
  objc_msgSend(MEMORY[0x1E0C97200], "keysToFetchForFaceTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "contactForDestinationId:keysToFetch:", v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)contactForDestinationId:()TUSearchUtilities keysToFetch:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v36;
  id v37;
  uint8_t buf[4];
  NSObject *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[TUHandle normalizedHandleWithDestinationID:](TUHandle, "normalizedHandleWithDestinationID:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    if (objc_msgSend(v6, "_appearsToBePhoneNumber"))
    {
      objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", v9);
      v10 = objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingPhoneNumber:", v10);
        v11 = objc_claimAutoreleasedReturnValue();
        TUDefaultLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v39 = v11;
          _os_log_impl(&dword_19A50D000, v12, OS_LOG_TYPE_DEFAULT, "Looking up contacts matching predicate %@", buf, 0xCu);
        }

        objc_msgSend(v7, "arrayByAddingObject:", *MEMORY[0x1E0C967C0]);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = 0;
        objc_msgSend(a1, "unifiedContactsMatchingPredicate:keysToFetch:error:", v11, v13, &v37);
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = v37;

        if (v14 && -[NSObject count](v14, "count"))
        {
          TUDefaultLog();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v39 = v14;
            _os_log_impl(&dword_19A50D000, v16, OS_LOG_TYPE_DEFAULT, "Found matching contacts %@, using first object", buf, 0xCu);
          }

          -[NSObject firstObject](v14, "firstObject");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          TUDefaultLog();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            -[CNContactStore(TUSearchUtilities) contactForDestinationId:keysToFetch:].cold.3();

          v17 = 0;
        }

        goto LABEL_32;
      }
      TUDefaultLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[CNContactStore(TUSearchUtilities) contactForDestinationId:keysToFetch:].cold.2((uint64_t)v9, v11, v29, v30, v31, v32, v33, v34);
      v15 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingEmailAddress:", v9);
      v10 = objc_claimAutoreleasedReturnValue();
      TUDefaultLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v39 = v10;
        _os_log_impl(&dword_19A50D000, v24, OS_LOG_TYPE_DEFAULT, "Looking up contacts matching predicate %@", buf, 0xCu);
      }

      objc_msgSend(v7, "arrayByAddingObject:", *MEMORY[0x1E0C966A8]);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 0;
      objc_msgSend(a1, "unifiedContactsMatchingPredicate:keysToFetch:error:", v10, v25, &v36);
      v11 = objc_claimAutoreleasedReturnValue();
      v15 = v36;

      if (v11 && -[NSObject count](v11, "count"))
      {
        TUDefaultLog();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v39 = v11;
          _os_log_impl(&dword_19A50D000, v26, OS_LOG_TYPE_DEFAULT, "Found matching contacts %@, using first object", buf, 0xCu);
        }

        -[NSObject firstObject](v11, "firstObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_32;
      }
      TUDefaultLog();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        -[CNContactStore(TUSearchUtilities) contactForDestinationId:keysToFetch:].cold.3();

    }
    v17 = 0;
LABEL_32:

    goto LABEL_33;
  }
  TUDefaultLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    -[CNContactStore(TUSearchUtilities) contactForDestinationId:keysToFetch:].cold.1((uint64_t)v6, v10, v18, v19, v20, v21, v22, v23);
  v15 = 0;
  v17 = 0;
LABEL_33:

  return v17;
}

- (void)contactForDestinationId:()TUSearchUtilities keysToFetch:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_19A50D000, a2, a3, "Could not normalize destination ID %@ to perform contacts lookup", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)contactForDestinationId:()TUSearchUtilities keysToFetch:.cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_19A50D000, a2, a3, "Could not create a CNPhoneNumber using the normalized destination identifier '%@'.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)contactForDestinationId:()TUSearchUtilities keysToFetch:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_19A50D000, v0, v1, "No contacts found matching predicate %@ error: %@");
  OUTLINED_FUNCTION_1();
}

@end
