@implementation CNContactStore(PhotoLibraryAdditions)

- (uint64_t)allContactIDsMatchingEmailAddress:()PhotoLibraryAdditions
{
  return objc_msgSend(a1, "allContactIDsMatchingEmailAddress:orPhoneNumber:", a3, 0);
}

- (id)allContactIDsMatchingEmailAddress:()PhotoLibraryAdditions orPhoneNumber:
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v22;
  id v23;
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v9 = objc_msgSend(v6, "length");
  v10 = (uint64_t *)MEMORY[0x1E0C966E8];
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingEmailAddress:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *v10;
    v25[0] = *MEMORY[0x1E0C966A8];
    v25[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_allContactIDsMatchingPredicate:keysToFetch:", v11, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "unionSet:", v14);

  }
  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingPhoneNumber:", v15);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = *v10;
      v24[0] = *MEMORY[0x1E0C967C0];
      v24[1] = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_allContactIDsMatchingPredicate:keysToFetch:", v16, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "unionSet:", v19);

    }
    else
    {
      PLBackendGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v22 = 138477827;
        v23 = v7;
        _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "Unsupported phone number:%{private}@", (uint8_t *)&v22, 0xCu);
      }
    }

  }
  objc_msgSend(v8, "allObjects");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)_allContactIDsMatchingPredicate:()PhotoLibraryAdditions keysToFetch:
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  id v18;
  char v19;
  id v20;
  NSObject *v21;
  id v22;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id v32;
  uint8_t buf[4];
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v32 = 0;
  objc_msgSend(a1, "unifiedContactsMatchingPredicate:keysToFetch:error:", v6, v7, &v32);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v32;
  if (v9)
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v11 = v9;
    v12 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
    if (v12)
    {
      v13 = v12;
      v24 = a1;
      v14 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v29 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v16);

        }
        v13 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v28, v35, 16);
      }
      while (v13);
      a1 = v24;
    }
  }
  else
  {
    PLBackendGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v10;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "Error fetching contacts:%@", buf, 0xCu);
    }
  }

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97210]), "initWithKeysToFetch:", v7);
  objc_msgSend(v17, "setPredicate:", v6);
  objc_msgSend(v17, "setUnifyResults:", 0);
  v27 = v10;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __85__CNContactStore_PhotoLibraryAdditions___allContactIDsMatchingPredicate_keysToFetch___block_invoke;
  v25[3] = &unk_1E365F638;
  v18 = v8;
  v26 = v18;
  v19 = objc_msgSend(a1, "enumerateContactsWithFetchRequest:error:usingBlock:", v17, &v27, v25);
  v20 = v27;

  if ((v19 & 1) == 0)
  {
    PLBackendGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v20;
      _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_ERROR, "Error enumerating contacts:%@", buf, 0xCu);
    }

  }
  v22 = v18;

  return v22;
}

- (id)contactsMatchingEmailAddress:()PhotoLibraryAdditions keysToFetch:
{
  id v6;
  objc_class *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;

  v6 = a3;
  v7 = (objc_class *)MEMORY[0x1E0C97210];
  v8 = a4;
  v9 = (void *)objc_msgSend([v7 alloc], "initWithKeysToFetch:", v8);

  objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingEmailAddress:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v10);

  objc_msgSend(v9, "setUnifyResults:", 0);
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __82__CNContactStore_PhotoLibraryAdditions__contactsMatchingEmailAddress_keysToFetch___block_invoke;
  v17[3] = &unk_1E365F660;
  v18 = v6;
  v12 = v11;
  v19 = v12;
  v13 = v6;
  objc_msgSend(a1, "enumerateContactsWithFetchRequest:error:usingBlock:", v9, 0, v17);
  v14 = v19;
  v15 = v12;

  return v15;
}

- (id)contactsMatchingPhoneNumber:()PhotoLibraryAdditions keysToFetch:
{
  id v6;
  objc_class *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;

  v6 = a3;
  v7 = (objc_class *)MEMORY[0x1E0C97210];
  v8 = a4;
  v9 = (void *)objc_msgSend([v7 alloc], "initWithKeysToFetch:", v8);

  objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingPhoneNumber:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v10);

  objc_msgSend(v9, "setUnifyResults:", 0);
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __81__CNContactStore_PhotoLibraryAdditions__contactsMatchingPhoneNumber_keysToFetch___block_invoke;
  v17[3] = &unk_1E365F660;
  v18 = v6;
  v12 = v11;
  v19 = v12;
  v13 = v6;
  objc_msgSend(a1, "enumerateContactsWithFetchRequest:error:usingBlock:", v9, 0, v17);
  v14 = v19;
  v15 = v12;

  return v15;
}

@end
