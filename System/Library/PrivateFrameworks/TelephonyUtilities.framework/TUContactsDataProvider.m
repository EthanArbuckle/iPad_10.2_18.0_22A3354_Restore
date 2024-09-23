@implementation TUContactsDataProvider

- (TUContactsDataProvider)init
{
  void *v3;
  TUContactsDataProvider *v4;

  objc_msgSend(MEMORY[0x1E0C97298], "tu_contactStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[TUContactsDataProvider initWithContactsDataSource:](self, "initWithContactsDataSource:", v3);

  return v4;
}

- (TUContactsDataProvider)initWithContactsDataSource:(id)a3
{
  id v5;
  TUContactsDataProvider *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id localeSupportsPrefixHintForFetchRequest;
  TUContactsDataProviderAppleCareHandles *v14;
  TUContactsDataProviderAppleCareHandles *appleCareHandles;
  uint64_t v16;
  NSUserDefaults *userDefaults;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, void *);
  void *v22;
  id v23;
  id location;
  objc_super v25;

  v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)TUContactsDataProvider;
  v6 = -[TUContactsDataProvider init](&v25, sel_init);
  if (v6)
  {
    TUDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[TUContactsDataProvider initWithContactsDataSource:].cold.1((uint64_t)v5, v7);

    objc_storeStrong((id *)&v6->_contactsDataSource, a3);
    objc_msgSend((id)objc_opt_class(), "familyNameFirstLocaleCountryCodes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "countryCode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lowercaseString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_useFamilyNameFirst = objc_msgSend(v8, "containsObject:", v11);

    objc_initWeak(&location, v6);
    v19 = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __53__TUContactsDataProvider_initWithContactsDataSource___block_invoke;
    v22 = &unk_1E38A28B0;
    objc_copyWeak(&v23, &location);
    v12 = _Block_copy(&v19);
    localeSupportsPrefixHintForFetchRequest = v6->_localeSupportsPrefixHintForFetchRequest;
    v6->_localeSupportsPrefixHintForFetchRequest = v12;

    v14 = objc_alloc_init(TUContactsDataProviderAppleCareHandles);
    appleCareHandles = v6->_appleCareHandles;
    v6->_appleCareHandles = v14;

    objc_msgSend(MEMORY[0x1E0C99EA0], "tu_defaults", v19, v20, v21, v22);
    v16 = objc_claimAutoreleasedReturnValue();
    userDefaults = v6->_userDefaults;
    v6->_userDefaults = (NSUserDefaults *)v16;

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return v6;
}

uint64_t __53__TUContactsDataProvider_initWithContactsDataSource___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  uint64_t v11;

  if (objc_msgSend(a2, "useNetworkCountryCode"))
  {
    TUNetworkCountryCode();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      v5 = v3;
    }
    else
    {
      TUHomeCountryCode();
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    v6 = v5;

    if (!v6)
      goto LABEL_8;
  }
  else
  {
    TUHomeCountryCode();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
LABEL_8:
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "countryCode");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lowercaseString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend((id)objc_opt_class(), "unsupportedLocalesForPrefixHint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "containsObject:", v6) ^ 1;

  return v11;
}

- (id)processBatchFetchRequests:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  TUBatchFetchRequestProcessingResult *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  TUBatchFetchRequestProcessingResult *v29;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v35;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v35 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v11);
        objc_msgSend(v12, "handles");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "count");

        if (v14 != 1)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Fetch request does not contain exactly one handle %@"), v12);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          NSLog(CFSTR("** TUAssertion failure: %@"), v15);

          if (_TUAssertShouldCrashApplication())
          {
            objc_msgSend(v12, "handles");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "count");

            if (v17 != 1)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TUContactsDataProvider.m"), 99, CFSTR("Fetch request does not contain exactly one handle %@"), v12);

            }
          }
        }
        objc_msgSend(v12, "removePsuedHandles");
        objc_msgSend(v12, "handles");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "firstObject");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v19)
        {
          TUDefaultLog();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v39 = v12;
            _os_log_error_impl(&dword_19A50D000, v21, OS_LOG_TYPE_ERROR, "Fetch request did not contain any handles or only contained one pseudonym handle: %@ ", buf, 0xCu);
          }
          goto LABEL_17;
        }
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v19);
        objc_msgSend(v6, "addObject:", v19);
        if (-[TUContactsDataProvider shouldIgnoreHandle:withFetchRequest:](self, "shouldIgnoreHandle:withFetchRequest:", v19, v12))
        {
          TUDefaultLog();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v39 = v19;
            _os_log_impl(&dword_19A50D000, v20, OS_LOG_TYPE_DEFAULT, "Not looking up contact for %@ because it is in our apple care handles", buf, 0xCu);
          }

        }
        else
        {
          v22 = objc_msgSend(v19, "type");
          if ((unint64_t)(v22 - 2) >= 2)
          {
            if (v22 == 1)
            {
              -[TUContactsDataProvider executeFetchRequest:](self, "executeFetchRequest:", v12);
              v21 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "setObject:forKeyedSubscript:", v21, v19);
LABEL_17:

            }
          }
          else
          {
            objc_msgSend(v33, "addObject:", v19);
          }
        }

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v9);
  }

  v24 = [TUBatchFetchRequestProcessingResult alloc];
  v25 = (void *)objc_msgSend(v5, "copy");
  v26 = (void *)objc_msgSend(v33, "copy");
  v27 = (void *)objc_msgSend(v6, "copy");
  v28 = (void *)objc_msgSend(v32, "copy");
  v29 = -[TUBatchFetchRequestProcessingResult initWithHandleToFetchRequest:handlesToBatchFetch:allHandlesFromFetchRequests:fetchRequestResults:](v24, "initWithHandleToFetchRequest:handlesToBatchFetch:allHandlesFromFetchRequests:fetchRequestResults:", v25, v26, v27, v28);

  return v29;
}

- (id)executeBatchFetchRequests:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  id v27;
  id obj;
  TUContactsDataProvider *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[TUContactsDataProvider processBatchFetchRequests:](self, "processBatchFetchRequests:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fetchRequestResults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v6, "mutableCopy");

    v7 = (void *)objc_opt_class();
    v27 = v4;
    objc_msgSend(v4, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "auxiliaryKeysToFetch");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "keysByCombiningDefaultKeysWithKeysToFetch:", v9);
    v10 = objc_claimAutoreleasedReturnValue();

    v29 = self;
    -[TUContactsDataProvider contactsDataSource](self, "contactsDataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handlesToBatchFetch");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)v10;
    objc_msgSend(v11, "tu_contactsForHandles:keyDescriptors:error:", v12, v10, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v14 = v5;
    objc_msgSend(v5, "allHandlesFromFetchRequests");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v32 != v17)
            objc_enumerationMutation(obj);
          v19 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
          objc_msgSend(v13, "objectForKeyedSubscript:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v20)
          {
            objc_msgSend(MEMORY[0x1E0C99D20], "array");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v14, "handleToFetchRequest");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectForKeyedSubscript:", v19);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[TUContactsDataProvider resultForSingleHandleFetchRequest:fetchedContacts:](v29, "resultForSingleHandleFetchRequest:fetchedContacts:", v22, v20);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setObject:forKeyedSubscript:", v23, v19);

        }
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v16);
    }

    v24 = (void *)objc_msgSend(v30, "copy");
    v4 = v27;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v24;
}

- (id)executeFetchRequest:(id)a3
{
  id v4;
  NSObject *v5;
  TUContactsDataProviderResult *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  const __CFString *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  TUContactsDataProviderResult *v62;
  TUContactsDataProviderResult *v63;
  uint64_t v64;
  void *v65;
  id v66;
  id v67;
  void *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  void *v82;
  void *v83;
  _BYTE v84[128];
  uint8_t v85[128];
  uint8_t buf[4];
  id v87;
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v87 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "Executing fetch request: %@", buf, 0xCu);
  }

  v6 = objc_alloc_init(TUContactsDataProviderResult);
  objc_msgSend(v4, "removePsuedHandles");
  if (objc_msgSend(v4, "isConversation"))
  {
    objc_msgSend(v4, "handles");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v8 >= 2)
    {
      v62 = v6;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v63 = (TUContactsDataProviderResult *)objc_claimAutoreleasedReturnValue();
      v78 = 0u;
      v79 = 0u;
      v80 = 0u;
      v81 = 0u;
      objc_msgSend(v4, "handles");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v78, v85, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v79;
        v65 = v10;
        v66 = v4;
        v64 = *(_QWORD *)v79;
        do
        {
          v14 = 0;
          v70 = v12;
          do
          {
            if (*(_QWORD *)v79 != v13)
              objc_enumerationMutation(v10);
            v72 = v14;
            v15 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * v14);
            objc_msgSend(v15, "value");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "destinationIdIsPseudonym");

            if ((v17 & 1) == 0)
            {
              -[TUContactsDataProvider ISOCountryCodeForHandle:fetchRequest:](self, "ISOCountryCodeForHandle:fetchRequest:", v15, v4);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend((id)objc_opt_class(), "defaultContactKeyDescriptors");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              -[TUContactsDataProvider contactsForHandle:countryCode:keysToFetch:prefixHint:](self, "contactsForHandle:countryCode:keysToFetch:prefixHint:", v15, v18, v19, 0);
              v20 = (void *)objc_claimAutoreleasedReturnValue();

              v21 = v20;
              if (objc_msgSend(v20, "count"))
              {
                v76 = 0u;
                v77 = 0u;
                v74 = 0u;
                v75 = 0u;
                v22 = v20;
                v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v74, v84, 16);
                if (v23)
                {
                  v24 = v23;
                  v68 = v21;
                  v69 = v18;
                  v25 = *(_QWORD *)v75;
                  do
                  {
                    for (i = 0; i != v24; ++i)
                    {
                      if (*(_QWORD *)v75 != v25)
                        objc_enumerationMutation(v22);
                      v27 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * i);
                      v83 = v27;
                      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v83, 1);
                      v28 = (void *)objc_claimAutoreleasedReturnValue();
                      -[TUContactsDataProvider compositeNameForContacts:](self, "compositeNameForContacts:", v28);
                      v29 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v29)
                      {
                        objc_msgSend(v27, "givenName");
                        v30 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v9, "addObject:", v30);

                      }
                    }
                    v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v74, v84, 16);
                  }
                  while (v24);
                  v10 = v65;
                  v4 = v66;
                  v13 = v64;
                  v21 = v68;
                  v18 = v69;
                }
              }
              else
              {
                -[TUContactsDataProvider formattedNameForHandle:countryCode:](self, "formattedNameForHandle:countryCode:", v15, v18);
                v22 = (id)objc_claimAutoreleasedReturnValue();
                -[TUContactsDataProviderResult addObject:](v63, "addObject:", v22);
              }

              v12 = v70;
            }
            v14 = v72 + 1;
          }
          while (v72 + 1 != v12);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v78, v85, 16);
        }
        while (v12);
      }

      objc_msgSend(v9, "sortUsingComparator:", &__block_literal_global_22);
      v6 = v63;
      -[TUContactsDataProviderResult sortUsingComparator:](v63, "sortUsingComparator:", &__block_literal_global_48_1);
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v9);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "addObjectsFromArray:", v63);
      TUBundle();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("UNKNOWN"), &stru_1E38A53C8, CFSTR("TelephonyUtilities"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v31, "count") == 1)
      {
        objc_msgSend(v31, "objectAtIndexedSubscript:", 0);
        v34 = objc_claimAutoreleasedReturnValue();
        goto LABEL_41;
      }
      if (objc_msgSend(v31, "count") == 2)
      {
        v40 = (void *)MEMORY[0x1E0CB3940];
        TUBundle();
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "localizedStringForKey:value:table:", CFSTR("%@_AND_%@"), &stru_1E38A53C8, CFSTR("TelephonyUtilities"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "objectAtIndexedSubscript:", 0);
        v43 = v4;
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "objectAtIndexedSubscript:", 1);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "stringWithFormat:", v42, v44, v45);
        v34 = objc_claimAutoreleasedReturnValue();

        v4 = v43;
      }
      else
      {
        if (objc_msgSend(v31, "count") == 3)
        {
          v46 = (void *)MEMORY[0x1E0CB3940];
          TUBundle();
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = v47;
          v48 = CFSTR("%@_%@_AND_%@");
        }
        else
        {
          if (objc_msgSend(v31, "count") != 4)
          {
            if ((unint64_t)objc_msgSend(v31, "count") < 5)
            {
              v39 = v62;
              goto LABEL_42;
            }
            objc_msgSend((id)objc_opt_class(), "numberFormatter");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v31, "count") - 3);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "stringFromNumber:", v55);
            v71 = objc_claimAutoreleasedReturnValue();

            v56 = (void *)MEMORY[0x1E0CB3940];
            TUBundle();
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v73, "localizedStringForKey:value:table:", CFSTR("%@_%@_%@_AND_%@_OTHERS"), &stru_1E38A53C8, CFSTR("TelephonyUtilities"));
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "objectAtIndexedSubscript:", 0);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "objectAtIndexedSubscript:", 1);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "objectAtIndexedSubscript:", 2);
            v60 = v4;
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "stringWithFormat:", v57, v58, v59, v61, v71);
            v34 = objc_claimAutoreleasedReturnValue();

            v4 = v60;
            v6 = v63;
            v33 = (void *)v71;
LABEL_41:
            v39 = v62;

            v33 = (void *)v34;
LABEL_42:
            objc_msgSend(v39, "setLocalizedName:", v33);

            goto LABEL_43;
          }
          v46 = (void *)MEMORY[0x1E0CB3940];
          TUBundle();
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = v47;
          v48 = CFSTR("%@_%@_%@_AND_ONE_OTHER");
        }
        objc_msgSend(v47, "localizedStringForKey:value:table:", v48, &stru_1E38A53C8, CFSTR("TelephonyUtilities"));
        v67 = v4;
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "objectAtIndexedSubscript:", 0);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "objectAtIndexedSubscript:", 1);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "objectAtIndexedSubscript:", 2);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "stringWithFormat:", v49, v50, v51, v52);
        v34 = objc_claimAutoreleasedReturnValue();

        v4 = v67;
      }
      v33 = v41;
      v6 = v63;
      goto LABEL_41;
    }
  }
  objc_msgSend(v4, "contactIdentifier");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v35)
    goto LABEL_31;
  objc_msgSend(v4, "contactIdentifier");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "auxiliaryKeysToFetch");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUContactsDataProvider contactWithIdentifier:keysToFetch:](self, "contactWithIdentifier:keysToFetch:", v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v38
    || (v82 = v38,
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v82, 1),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v38,
        !v9))
  {
LABEL_31:
    -[TUContactsDataProvider unifiedContactsForFetchRequest:](self, "unifiedContactsForFetchRequest:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[TUContactsDataProvider resultForSingleHandleFetchRequest:fetchedContacts:](self, "resultForSingleHandleFetchRequest:fetchedContacts:", v4, v9);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_43:

  return v39;
}

uint64_t __46__TUContactsDataProvider_executeFetchRequest___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localizedStandardCompare:");
}

uint64_t __46__TUContactsDataProvider_executeFetchRequest___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localizedStandardCompare:");
}

- (id)resultForSingleHandleFetchRequest:(id)a3 fetchedContacts:(id)a4
{
  id v6;
  id v7;
  TUContactsDataProviderResult *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  const char *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  uint8_t v35[24];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(TUContactsDataProviderResult);
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUContactsDataProviderResult setLegacyAddressBookIdentifier:](v8, "setLegacyAddressBookIdentifier:", -[TUContactsDataProvider personIDForContact:](self, "personIDForContact:", v9));

  }
  if (objc_msgSend(v7, "count"))
  {
    -[TUContactsDataProvider compositeNameForContacts:](self, "compositeNameForContacts:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUContactsDataProviderResult setLocalizedName:](v8, "setLocalizedName:", v10);

    objc_msgSend(v6, "handles");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if (v12 == 1)
    {
      objc_msgSend(v6, "handles");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      -[TUContactsDataProvider ISOCountryCodeForHandle:fetchRequest:](self, "ISOCountryCodeForHandle:fetchRequest:", v14, v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUContactsDataProvider contactLabelForContacts:matchingHandle:countryCode:](self, "contactLabelForContacts:matchingHandle:countryCode:", v7, v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUContactsDataProviderResult setContactLabel:](v8, "setContactLabel:", v16);

    }
    if (objc_msgSend(v7, "count") == 1)
    {
      objc_msgSend(v7, "firstObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "organizationName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUContactsDataProviderResult setCompanyName:](v8, "setCompanyName:", v18);

    }
  }
  -[TUContactsDataProviderResult localizedName](v8, "localizedName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    TUDefaultLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "handles");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v35 = 138412290;
      *(_QWORD *)&v35[4] = v21;
      _os_log_impl(&dword_19A50D000, v20, OS_LOG_TYPE_DEFAULT, "Finding the appropriate localized name to use for handles: %@", v35, 0xCu);

    }
    -[TUContactsDataProvider compositeNameForFetchRequest:](self, "compositeNameForFetchRequest:", v6);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      -[TUContactsDataProviderResult setLocalizedName:](v8, "setLocalizedName:", v22);
      TUDefaultLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        -[TUContactsDataProviderResult localizedName](v8, "localizedName");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v35 = 138412290;
        *(_QWORD *)&v35[4] = v24;
        v25 = "     - using formatted destination ID '%@'";
LABEL_22:
        _os_log_impl(&dword_19A50D000, v23, OS_LOG_TYPE_DEFAULT, v25, v35, 0xCu);

      }
    }
    else if (objc_msgSend(v6, "isEmergency"))
    {
      TUBundle();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("EMERGENCY_SERVICES"), &stru_1E38A53C8, CFSTR("TelephonyUtilities"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUContactsDataProviderResult setLocalizedName:](v8, "setLocalizedName:", v27);

      TUDefaultLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        -[TUContactsDataProviderResult localizedName](v8, "localizedName");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v35 = 138412290;
        *(_QWORD *)&v35[4] = v24;
        v25 = "     - call is to emergency services, we'll use the emergency services string: '%@'";
        goto LABEL_22;
      }
    }
    else
    {
      v28 = objc_msgSend(v6, "isBlocked");
      TUBundle();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v29;
      if (v28)
      {
        objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("BLOCKED"), &stru_1E38A53C8, CFSTR("TelephonyUtilities"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[TUContactsDataProviderResult setLocalizedName:](v8, "setLocalizedName:", v31);

        TUDefaultLog();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          -[TUContactsDataProviderResult localizedName](v8, "localizedName");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v35 = 138412290;
          *(_QWORD *)&v35[4] = v24;
          v25 = "     - call is blocked, we'll use the blocked string: '%@'";
          goto LABEL_22;
        }
      }
      else
      {
        objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("UNKNOWN"), &stru_1E38A53C8, CFSTR("TelephonyUtilities"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[TUContactsDataProviderResult setLocalizedName:](v8, "setLocalizedName:", v32);

        TUDefaultLog();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          -[TUContactsDataProviderResult localizedName](v8, "localizedName");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v35 = 138412290;
          *(_QWORD *)&v35[4] = v24;
          v25 = "     - falling back to the unknown string: '%@'";
          goto LABEL_22;
        }
      }
    }

  }
  -[TUContactsDataProviderResult setContacts:](v8, "setContacts:", v7, *(_OWORD *)v35);
  TUDefaultLog();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v35 = 138412290;
    *(_QWORD *)&v35[4] = v8;
    _os_log_impl(&dword_19A50D000, v33, OS_LOG_TYPE_DEFAULT, "Determined dataProviderResult: %@", v35, 0xCu);
  }

  return v8;
}

- (id)contactLabelForContacts:(id)a3 matchingHandle:(id)a4 countryCode:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  int v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  -[TUContactsDataProvider labeledHandlesForContacts:](self, "labeledHandlesForContacts:", a3);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v14, "handle", (_QWORD)v18);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isCanonicallyEqualToHandle:isoCountryCode:", v8, v9);

        if (v16)
        {
          objc_msgSend(v14, "label");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v11 = (void *)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_11:

  return v11;
}

- (id)labeledHandlesForContactWithIdentifier:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C9AA60];
  -[TUContactsDataProvider contactWithIdentifier:keysToFetch:](self, "contactWithIdentifier:keysToFetch:", a3, MEMORY[0x1E0C9AA60]);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
  {
    v9[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUContactsDataProvider labeledHandlesForContacts:](self, "labeledHandlesForContacts:", v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)labeledHandlesForContacts:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  TUHandle *v13;
  void *v14;
  void *v15;
  TUHandle *v16;
  TULabeledHandle *v17;
  void *v18;
  void *v19;
  void *v20;
  TULabeledHandle *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  TUHandle *v28;
  void *v29;
  TUHandle *v30;
  TULabeledHandle *v31;
  void *v32;
  void *v33;
  void *v34;
  TULabeledHandle *v35;
  void *v36;
  id obj;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  obj = v3;
  v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
  if (v40)
  {
    v39 = *(_QWORD *)v52;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v52 != v39)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v5);
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        v50 = 0u;
        v41 = v6;
        v42 = v5;
        objc_msgSend(v6, "phoneNumbers");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v48;
          do
          {
            v11 = 0;
            do
            {
              if (*(_QWORD *)v48 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v11);
              v13 = [TUHandle alloc];
              objc_msgSend(v12, "value");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "unformattedInternationalStringValue");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = -[TUHandle initWithType:value:](v13, "initWithType:value:", 2, v15);

              v17 = [TULabeledHandle alloc];
              v18 = (void *)MEMORY[0x1E0C97338];
              objc_msgSend(v12, "label");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "localizedStringForLabel:", v19);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = -[TULabeledHandle initWithHandle:label:isSuggested:](v17, "initWithHandle:label:isSuggested:", v16, v20, objc_msgSend(v12, "tuIsSuggested"));

              objc_msgSend(v4, "addObject:", v21);
              ++v11;
            }
            while (v9 != v11);
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
          }
          while (v9);
        }

        v45 = 0u;
        v46 = 0u;
        v43 = 0u;
        v44 = 0u;
        objc_msgSend(v41, "emailAddresses");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v44;
          do
          {
            v26 = 0;
            do
            {
              if (*(_QWORD *)v44 != v25)
                objc_enumerationMutation(v22);
              v27 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v26);
              v28 = [TUHandle alloc];
              objc_msgSend(v27, "value");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = -[TUHandle initWithType:value:](v28, "initWithType:value:", 3, v29);

              v31 = [TULabeledHandle alloc];
              v32 = (void *)MEMORY[0x1E0C97338];
              objc_msgSend(v27, "label");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "localizedStringForLabel:", v33);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = -[TULabeledHandle initWithHandle:label:isSuggested:](v31, "initWithHandle:label:isSuggested:", v30, v34, objc_msgSend(v27, "tuIsSuggested"));

              objc_msgSend(v4, "addObject:", v35);
              ++v26;
            }
            while (v24 != v26);
            v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
          }
          while (v24);
        }

        v5 = v42 + 1;
      }
      while (v42 + 1 != v40);
      v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
    }
    while (v40);
  }

  v36 = (void *)objc_msgSend(v4, "copy");
  return v36;
}

- (id)contactWithIdentifier:(id)a3 keysToFetch:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[TUContactsDataProvider contactsDataSource](self, "contactsDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "keysByCombiningDefaultKeysWithKeysToFetch:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0;
  objc_msgSend(v8, "unifiedContactWithIdentifier:keysToFetch:error:", v6, v9, &v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v15;

  if (v10)
  {
    TUDefaultLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v17 = v10;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_19A50D000, v12, OS_LOG_TYPE_DEFAULT, "Found contact: %@ for contactIdentifier %@: ", buf, 0x16u);
    }
    goto LABEL_8;
  }
  objc_msgSend(v11, "domain");
  v12 = objc_claimAutoreleasedReturnValue();
  if (!-[NSObject isEqualToString:](v12, "isEqualToString:", *MEMORY[0x1E0C968C8]))
  {
LABEL_8:

    goto LABEL_9;
  }
  v13 = objc_msgSend(v11, "code");

  if (v13 != 200)
  {
    TUDefaultLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[TUContactsDataProvider contactWithIdentifier:keysToFetch:].cold.1();
    goto LABEL_8;
  }
LABEL_9:

  return v10;
}

- (id)unifiedContactsForFetchRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  __int128 v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_class();
  objc_msgSend(v4, "auxiliaryKeysToFetch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keysByCombiningDefaultKeysWithKeysToFetch:", v6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v4, "handles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v24;
    *(_QWORD *)&v9 = 138412546;
    v20 = v9;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v7);
        v13 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        if (-[TUContactsDataProvider shouldIgnoreHandle:withFetchRequest:](self, "shouldIgnoreHandle:withFetchRequest:", v13, v4, v20))
        {
          TUDefaultLog();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v28 = v13;
            _os_log_impl(&dword_19A50D000, v14, OS_LOG_TYPE_DEFAULT, "Not looking up contact for %@ because it is in our apple care handles", buf, 0xCu);
          }
        }
        else
        {
          -[TUContactsDataProvider ISOCountryCodeForHandle:fetchRequest:](self, "ISOCountryCodeForHandle:fetchRequest:", v13, v4);
          v14 = objc_claimAutoreleasedReturnValue();
          -[TUContactsDataProvider prefixHintForFetchRequest:](self, "prefixHintForFetchRequest:", v4);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[TUContactsDataProvider contactsForHandle:countryCode:keysToFetch:prefixHint:](self, "contactsForHandle:countryCode:keysToFetch:prefixHint:", v13, v14, v22, v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            objc_msgSend(v21, "addObjectsFromArray:", v16);
          }
          else
          {
            TUDefaultLog();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v20;
              v28 = v13;
              v29 = 2112;
              v30 = 0;
              _os_log_error_impl(&dword_19A50D000, v17, OS_LOG_TYPE_ERROR, "Error while fetching contacts for handle %@: %@", buf, 0x16u);
            }

          }
        }

      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v10);
  }

  v18 = (void *)objc_msgSend(v21, "copy");
  return v18;
}

- (id)contactsForHandle:(id)a3 countryCode:(id)a4 keysToFetch:(id)a5 prefixHint:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  NSObject *v27;
  id v29;
  void *v30;
  void *v31;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_msgSend(v10, "type");
  switch(v14)
  {
    case 1:
      v21 = objc_alloc(MEMORY[0x1E0C973E8]);
      objc_msgSend(v10, "value");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v21, "initWithUrlString:username:userIdentifier:service:", 0, v22, 0, 0);

      -[TUContactsDataProvider contactsDataSource](self, "contactsDataSource");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingSocialProfile:", v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "defaultContactKeyDescriptors");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 0;
      objc_msgSend(v17, "unifiedContactsMatchingPredicate:keysToFetch:error:", v18, v23, &v29);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v29;

      goto LABEL_8;
    case 2:
      v25 = (void *)MEMORY[0x1E0C97398];
      objc_msgSend(v10, "value");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "phoneNumberWithDigits:countryCode:", v26, v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      -[TUContactsDataProvider contactsDataSource](self, "contactsDataSource");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingPhoneNumber:prefixHint:", v15, v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 0;
      objc_msgSend(v17, "unifiedContactsMatchingPredicate:keysToFetch:error:", v18, v12, &v30);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v30;
      goto LABEL_7;
    case 3:
      -[TUContactsDataProvider contactsDataSource](self, "contactsDataSource");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x1E0C97200];
      objc_msgSend(v10, "value");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "predicateForContactsMatchingEmailAddress:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 0;
      objc_msgSend(v15, "unifiedContactsMatchingPredicate:keysToFetch:error:", v18, v12, &v31);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v31;
LABEL_7:
      v24 = v20;
LABEL_8:

      if (v19)
        goto LABEL_14;
      goto LABEL_11;
  }
  v24 = 0;
LABEL_11:
  TUDefaultLog();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    -[TUContactsDataProvider contactsForHandle:countryCode:keysToFetch:prefixHint:].cold.1();

  v19 = (void *)MEMORY[0x1E0C9AA60];
LABEL_14:

  return v19;
}

- (id)nameForContact:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (-[TUContactsDataProvider shouldUseGivenName](self, "shouldUseGivenName"))
    objc_msgSend(v4, "givenName");
  else
    objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)localizedCompositeNameForContact:(id)a3 secondContact:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  _BOOL4 v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "givenName");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_12;
  v9 = (void *)v8;
  objc_msgSend(v6, "familyName");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_11;
  v11 = (void *)v10;
  objc_msgSend(v7, "givenName");
  v12 = objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
LABEL_10:

LABEL_11:
LABEL_12:
    -[TUContactsDataProvider nameForContact:](self, "nameForContact:", v6);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUContactsDataProvider nameForContact:](self, "nameForContact:", v7);
    v28 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v28;
    if (!v23 || !v28)
    {
      if (v23)
        v31 = v23;
      else
        v31 = (void *)v28;
      v30 = v31;
      goto LABEL_21;
    }
    v29 = (void *)MEMORY[0x1E0CB3940];
    TUBundle();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("%@_OR_%@"), &stru_1E38A53C8, CFSTR("TelephonyUtilities"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringWithFormat:", v26, v23, v24);
    v27 = objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  v13 = (void *)v12;
  objc_msgSend(v7, "familyName");
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14)
  {

    goto LABEL_10;
  }
  v15 = (void *)v14;
  objc_msgSend(v7, "familyName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "familyName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "localizedCaseInsensitiveCompare:", v17);

  if (v18)
    goto LABEL_12;
  objc_msgSend(v7, "givenName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "givenName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v19, "localizedCaseInsensitiveCompare:", v20);

  if (!v21)
  {
    -[TUContactsDataProvider nameForContact:](self, "nameForContact:", v6);
    v30 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  if (!-[TUContactsDataProvider shouldUseGivenName](self, "shouldUseGivenName"))
  {
    v33 = -[TUContactsDataProvider shouldUseFamilyNameFirst](self, "shouldUseFamilyNameFirst");
    v34 = (void *)MEMORY[0x1E0CB3940];
    if (v33)
    {
      v35 = objc_alloc(MEMORY[0x1E0CB3940]);
      TUBundle();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("%@_%@_OR_%@_%@"), &stru_1E38A53C8, CFSTR("TelephonyUtilities"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "familyName");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "givenName");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "familyName");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "givenName");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (id)objc_msgSend(v35, "initWithFormat:", v24, v25, v26, v36, v37);

    }
    else
    {
      TUBundle();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("%@_OR_%@_%@"), &stru_1E38A53C8, CFSTR("TelephonyUtilities"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "givenName");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "givenName");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "familyName");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "stringWithFormat:", v24, v25, v26, v36);
      v30 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_16;
  }
  v22 = objc_alloc(MEMORY[0x1E0CB3940]);
  TUBundle();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("%@_OR_%@"), &stru_1E38A53C8, CFSTR("TelephonyUtilities"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "givenName");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "givenName");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v22, "initWithFormat:", v24, v25, v26);
LABEL_15:
  v30 = (id)v27;
LABEL_16:

LABEL_21:
LABEL_22:

  return v30;
}

- (id)compositeNameForContacts:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") == 1)
  {
    -[TUContactsDataProvider nameForContact:](self, "nameForContact:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v4, "count") == 2)
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUContactsDataProvider localizedCompositeNameForContact:secondContact:](self, "localizedCompositeNameForContact:secondContact:", v5, v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if ((unint64_t)objc_msgSend(v4, "count") >= 3)
    {
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v8 = v4;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v24;
        while (2)
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v24 != v11)
              objc_enumerationMutation(v8);
            -[TUContactsDataProvider nameForContact:](self, "nameForContact:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v12));
            v13 = objc_claimAutoreleasedReturnValue();
            if (v13)
            {
              v14 = (void *)v13;

              v15 = (void *)MEMORY[0x1E0CB3940];
              TUBundle();
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("%@_OR_%@_OTHERS"), &stru_1E38A53C8, CFSTR("TelephonyUtilities"));
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend((id)objc_opt_class(), "numberFormatter");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "count") - 1);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "stringFromNumber:", v19);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "stringWithFormat:", v17, v14, v20, (_QWORD)v23);
              v6 = (void *)objc_claimAutoreleasedReturnValue();

              goto LABEL_17;
            }
            ++v12;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          if (v10)
            continue;
          break;
        }
      }

    }
    v6 = 0;
  }
LABEL_17:
  TUDefaultLog();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v28 = v6;
    v29 = 2112;
    v30 = v4;
    _os_log_impl(&dword_19A50D000, v21, OS_LOG_TYPE_DEFAULT, "Determined compositeName: %@ for contacts: %@", buf, 0x16u);
  }

  return v6;
}

- (id)compositeNameForFetchRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v4 = a3;
  objc_msgSend(v4, "handles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") == 1)
  {
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUContactsDataProvider ISOCountryCodeForHandle:fetchRequest:](self, "ISOCountryCodeForHandle:fetchRequest:", v6, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUContactsDataProvider formattedNameForHandle:countryCode:](self, "formattedNameForHandle:countryCode:", v8, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v5, "count") == 2)
  {
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUContactsDataProvider ISOCountryCodeForHandle:fetchRequest:](self, "ISOCountryCodeForHandle:fetchRequest:", v6, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handles");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[TUContactsDataProvider ISOCountryCodeForHandle:fetchRequest:](self, "ISOCountryCodeForHandle:fetchRequest:", v8, v4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x1E0CB3940];
    TUBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("%@_AND_%@"), &stru_1E38A53C8, CFSTR("TelephonyUtilities"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUContactsDataProvider formattedNameForHandle:countryCode:](self, "formattedNameForHandle:countryCode:", v6, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUContactsDataProvider formattedNameForHandle:countryCode:](self, "formattedNameForHandle:countryCode:", v8, v20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", v12, v13, v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if ((unint64_t)objc_msgSend(v5, "count") < 3)
    {
      v9 = 0;
      goto LABEL_8;
    }
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUContactsDataProvider ISOCountryCodeForHandle:fetchRequest:](self, "ISOCountryCodeForHandle:fetchRequest:", v6, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)MEMORY[0x1E0CB3940];
    TUBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("%@_AND_%@_OTHERS"), &stru_1E38A53C8, CFSTR("TelephonyUtilities"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUContactsDataProvider formattedNameForHandle:countryCode:](self, "formattedNameForHandle:countryCode:", v6, v7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "numberFormatter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "count") - 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringFromNumber:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringWithFormat:", v21, v19, v17);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_8:

  return v9;
}

- (id)formattedNameForHandle:(id)a3 countryCode:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  _BOOL4 v11;
  id v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "length"))
  {
    objc_msgSend(v5, "normalizedValue");
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v8;
  }
  v9 = objc_msgSend(v5, "type");
  TUDefaultLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9 == 2)
  {
    if (v11)
    {
      v15 = 138412546;
      v16 = v7;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_19A50D000, v10, OS_LOG_TYPE_DEFAULT, "     - we'll format the destinationID '%@' with the country code '%@'", (uint8_t *)&v15, 0x16u);
    }

    TUFormattedPhoneNumber(v7, v6);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v11)
    {
      v15 = 138412290;
      v16 = v7;
      _os_log_impl(&dword_19A50D000, v10, OS_LOG_TYPE_DEFAULT, "     - handle can't/shouldn't be formatted as a phone number, so using the unmodified destination ID '%@'", (uint8_t *)&v15, 0xCu);
    }

    v12 = v7;
  }
  v13 = v12;

  return v13;
}

- (BOOL)shouldIgnoreHandle:(id)a3 withFetchRequest:(id)a4
{
  id v6;
  id v7;
  char v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "isIncoming") && (objc_msgSend(v7, "isVerified") & 1) == 0)
  {
    -[TUContactsDataProvider appleCareHandles](self, "appleCareHandles");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "contains:", v6);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)getDeviceSetupDate
{
  void *v3;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  __int128 buf;
  Class (*v16)(uint64_t);
  void *v17;
  uint64_t *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[TUContactsDataProvider deviceSetupDate](self, "deviceSetupDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TUContactsDataProvider deviceSetupDate](self, "deviceSetupDate");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = 0;
  v12 = &v11;
  v13 = 0x2050000000;
  v5 = (void *)getBYSetupUserDispositionClass_softClass;
  v14 = getBYSetupUserDispositionClass_softClass;
  if (!getBYSetupUserDispositionClass_softClass)
  {
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v16 = __getBYSetupUserDispositionClass_block_invoke;
    v17 = &unk_1E38A1710;
    v18 = &v11;
    __getBYSetupUserDispositionClass_block_invoke((uint64_t)&buf);
    v5 = (void *)v12[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v11, 8);
  objc_msgSend(v6, "current", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  TUDefaultLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_19A50D000, v9, OS_LOG_TYPE_DEFAULT, "BYSetupUserDisposition: %@", (uint8_t *)&buf, 0xCu);
  }

  if (v8)
  {
    v10 = v8;
LABEL_10:
    -[TUContactsDataProvider setDeviceSetupDate:](self, "setDeviceSetupDate:", v10);
    goto LABEL_11;
  }
  v10 = (id)CFPreferencesCopyValue(CFSTR("SetupLastExit"), CFSTR("com.apple.purplebuddy"), CFSTR("mobile"), (CFStringRef)*MEMORY[0x1E0C9B230]);
  if (v10)
    goto LABEL_10;
LABEL_11:

  return v10;
}

- (BOOL)isHandleEligibleForScreenSharingRequests:(id)a3
{
  id v4;
  void *v5;
  int v6;
  TUContactsDataProviderFetchRequest *v7;
  BOOL v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (_TUIsInternalInstall()
    && (-[TUContactsDataProvider userDefaults](self, "userDefaults"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "BOOLForKey:", CFSTR("ignoreContactCreationDateKey")),
        v5,
        v6))
  {
    TUDefaultLog();
    v7 = (TUContactsDataProviderFetchRequest *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19A50D000, &v7->super, OS_LOG_TYPE_DEFAULT, "Handle is eligible for screen sharing because ignoreContactCreationDateKey is YES", buf, 2u);
    }
    v8 = 1;
  }
  else
  {
    v7 = -[TUContactsDataProviderFetchRequest initWithHandle:]([TUContactsDataProviderFetchRequest alloc], "initWithHandle:", v4);
    -[TUContactsDataProviderFetchRequest setAuxiliaryKeysToFetch:](v7, "setAuxiliaryKeysToFetch:", &unk_1E38E97E0);
    -[TUContactsDataProvider executeFetchRequest:](self, "executeFetchRequest:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    TUDefaultLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "contacts");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v46 = v11;
      _os_log_impl(&dword_19A50D000, v10, OS_LOG_TYPE_DEFAULT, "Found contacts %@", buf, 0xCu);

    }
    objc_msgSend(v9, "contacts");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_alloc_init(MEMORY[0x1E0C99D78]);
      objc_msgSend(v15, "setDay:", -1);
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "dateByAddingComponents:toDate:options:", v15, v14, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUContactsDataProvider getDeviceSetupDate](self, "getDeviceSetupDate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      TUDefaultLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v46 = v18;
        _os_log_impl(&dword_19A50D000, v19, OS_LOG_TYPE_DEFAULT, "Got device setup date %@", buf, 0xCu);
      }

      if (v18 && objc_msgSend(v18, "compare:", v17) == 1)
      {
        v8 = 1;
      }
      else
      {
        v39 = v4;
        v40 = v16;
        v20 = (void *)MEMORY[0x1E0C99DE8];
        objc_msgSend(v9, "contacts", v18, v15, v14);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "arrayWithCapacity:", objc_msgSend(v21, "count"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        v38 = v9;
        objc_msgSend(v9, "contacts");
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = -[NSObject countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v42;
          while (2)
          {
            for (i = 0; i != v25; ++i)
            {
              if (*(_QWORD *)v42 != v26)
                objc_enumerationMutation(v23);
              v28 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
              objc_msgSend(v28, "creationDate");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "addObject:", v29);

              objc_msgSend(v28, "creationDate");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = objc_msgSend(v30, "compare:", v17);

              if (v31 == -1)
              {
                TUDefaultLog();
                v32 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(v28, "creationDate");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v46 = v28;
                  v47 = 2112;
                  v48 = v33;
                  _os_log_impl(&dword_19A50D000, v32, OS_LOG_TYPE_DEFAULT, "Found contact %@ with creation date %@", buf, 0x16u);

                }
                v8 = 1;
                goto LABEL_29;
              }
            }
            v25 = -[NSObject countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
            if (v25)
              continue;
            break;
          }
        }

        TUDefaultLog();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v46 = v22;
          _os_log_impl(&dword_19A50D000, v23, OS_LOG_TYPE_DEFAULT, "No contact had a creation date > 24 hours ago. Creation dates: %@", buf, 0xCu);
        }
        v8 = 0;
LABEL_29:
        v9 = v38;
        v4 = v39;
        v15 = v36;
        v14 = v37;
        v18 = v35;

        v16 = v40;
      }

    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (int)personIDForContact:(id)a3
{
  id v4;
  void *v5;
  const void *v6;
  ABRecordID RecordID;
  NSObject *v8;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TUContactsDataProvider contactsDataSource](self, "contactsDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (const void *)objc_msgSend(v5, "personFromContact:", v4);

  if (v6)
  {
    RecordID = ABRecordGetRecordID(v6);
  }
  else
  {
    TUDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v4;
      _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "[WARN] Could not look up legacy ABPerson for contact: %@", (uint8_t *)&v10, 0xCu);
    }

    RecordID = -1;
  }

  return RecordID;
}

+ (id)keysByCombiningDefaultKeysWithKeysToFetch:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend((id)objc_opt_class(), "defaultContactKeyDescriptors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWithArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "defaultContactKeyDescriptors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

+ (id)numberFormatter
{
  if (numberFormatter_onceToken_0 != -1)
    dispatch_once(&numberFormatter_onceToken_0, &__block_literal_global_99);
  return (id)numberFormatter_numberFormatter_0;
}

uint64_t __41__TUContactsDataProvider_numberFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  v1 = (void *)numberFormatter_numberFormatter_0;
  numberFormatter_numberFormatter_0 = (uint64_t)v0;

  return objc_msgSend((id)numberFormatter_numberFormatter_0, "setNumberStyle:", 1);
}

+ (id)defaultContactKeyDescriptors
{
  if (defaultContactKeyDescriptors_onceToken != -1)
    dispatch_once(&defaultContactKeyDescriptors_onceToken, &__block_literal_global_101);
  return (id)defaultContactKeyDescriptors_defaultContactKeyDescriptors;
}

void __54__TUContactsDataProvider_defaultContactKeyDescriptors__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];

  v5[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v0;
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = *MEMORY[0x1E0C967C0];
  v5[1] = v1;
  v5[2] = v2;
  v5[3] = *MEMORY[0x1E0C966A8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 4);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)defaultContactKeyDescriptors_defaultContactKeyDescriptors;
  defaultContactKeyDescriptors_defaultContactKeyDescriptors = v3;

}

- (id)prefixHintForFetchRequest:(id)a3
{
  id v4;
  unsigned int (**v5)(_QWORD, _QWORD);
  void *v6;

  v4 = a3;
  -[TUContactsDataProvider localeSupportsPrefixHintForFetchRequest](self, "localeSupportsPrefixHintForFetchRequest");
  v5 = (unsigned int (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (((unsigned int (**)(_QWORD, id))v5)[2](v5, v4))
  {
    objc_msgSend(v4, "phoneNumberPrefixHint");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)unsupportedLocalesForPrefixHint
{
  if (unsupportedLocalesForPrefixHint_onceToken != -1)
    dispatch_once(&unsupportedLocalesForPrefixHint_onceToken, &__block_literal_global_102);
  return (id)unsupportedLocalesForPrefixHint_unsupportedLocalesForPrefixHint;
}

void __57__TUContactsDataProvider_unsupportedLocalesForPrefixHint__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E38E97F8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)unsupportedLocalesForPrefixHint_unsupportedLocalesForPrefixHint;
  unsupportedLocalesForPrefixHint_unsupportedLocalesForPrefixHint = v0;

}

+ (id)familyNameFirstLocaleCountryCodes
{
  if (familyNameFirstLocaleCountryCodes_onceToken != -1)
    dispatch_once(&familyNameFirstLocaleCountryCodes_onceToken, &__block_literal_global_117);
  return (id)familyNameFirstLocaleCountryCodes_familyNameFirstLocaleCountryCodes;
}

void __59__TUContactsDataProvider_familyNameFirstLocaleCountryCodes__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E38E9810);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)familyNameFirstLocaleCountryCodes_familyNameFirstLocaleCountryCodes;
  familyNameFirstLocaleCountryCodes_familyNameFirstLocaleCountryCodes = v0;

}

- (id)ISOCountryCodeForHandle:(id)a3 fetchRequest:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a4;
  objc_msgSend(a3, "isoCountryCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "length"))
  {
    objc_msgSend(v5, "isoCountryCode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "length"))
    {
      v6 = v7;
    }
    else
    {
      if (objc_msgSend(v5, "useNetworkCountryCode"))
      {
        TUNetworkCountryCode();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (v8)
        {
          v10 = v8;
        }
        else
        {
          TUHomeCountryCode();
          v10 = (id)objc_claimAutoreleasedReturnValue();
        }
        v6 = v10;

      }
      else
      {
        TUHomeCountryCode();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v7;
      }

    }
  }

  return v6;
}

- (BOOL)shouldUseGivenName
{
  return self->_useGivenName;
}

- (void)setUseGivenName:(BOOL)a3
{
  self->_useGivenName = a3;
}

- (BOOL)shouldUseFamilyNameFirst
{
  return self->_useFamilyNameFirst;
}

- (void)setUseFamilyNameFirst:(BOOL)a3
{
  self->_useFamilyNameFirst = a3;
}

- (id)localeSupportsPrefixHintForFetchRequest
{
  return self->_localeSupportsPrefixHintForFetchRequest;
}

- (void)setLocaleSupportsPrefixHintForFetchRequest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (TUContactsDataSource)contactsDataSource
{
  return self->_contactsDataSource;
}

- (TUContactsDataProviderAppleCareHandles)appleCareHandles
{
  return self->_appleCareHandles;
}

- (void)setAppleCareHandles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDate)deviceSetupDate
{
  return self->_deviceSetupDate;
}

- (void)setDeviceSetupDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_userDefaults, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_deviceSetupDate, 0);
  objc_storeStrong((id *)&self->_appleCareHandles, 0);
  objc_storeStrong((id *)&self->_contactsDataSource, 0);
  objc_storeStrong(&self->_localeSupportsPrefixHintForFetchRequest, 0);
}

- (void)initWithContactsDataSource:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_debug_impl(&dword_19A50D000, a2, OS_LOG_TYPE_DEBUG, "TUContactsDataProvider: source is a '%{public}@'", (uint8_t *)&v5, 0xCu);

}

- (void)contactWithIdentifier:keysToFetch:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_19A50D000, v0, v1, "Error while fetching contact with identifier %@: %@");
}

- (void)contactsForHandle:countryCode:keysToFetch:prefixHint:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_19A50D000, v0, v1, "Error while fetching contacts for handle %@: %@");
}

@end
