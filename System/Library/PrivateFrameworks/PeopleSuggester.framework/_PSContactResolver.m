@implementation _PSContactResolver

- (_PSContactResolver)initWithContactStore:(id)a3 keysToFetch:(id)a4
{
  id v7;
  id v8;
  _PSContactResolver *v9;
  _PSContactResolver *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_PSContactResolver;
  v9 = -[_PSContactResolver init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contactStore, a3);
    objc_storeStrong((id *)&v10->_keysToFetch, a4);
  }

  return v10;
}

- (id)contactWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[_PSContactResolver contactStore](self, "contactStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSContactResolver keysToFetch](self, "keysToFetch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unifiedContactWithIdentifier:keysToFetch:error:", v4, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)resolveContactFromINPerson:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_msgSend(v4, "contactIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5
    || (objc_msgSend(v4, "contactIdentifier"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        -[_PSContactResolver contactWithIdentifier:](self, "contactWithIdentifier:", v6),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        !v7))
  {
    objc_msgSend(v4, "personHandle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v4, "personHandle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "value");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_PSContactResolver resolveContactIfPossibleFromContactIdentifierString:](self, "resolveContactIfPossibleFromContactIdentifierString:", v11);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (id)allEmailAndPhoneNumberHandlesForContact:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "phoneNumbers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", CFSTR("value"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v12, "unformattedInternationalStringValue", (_QWORD)v18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v12, "unformattedInternationalStringValue");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v14);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  objc_msgSend(v3, "emailAddresses");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "valueForKey:", CFSTR("value"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addObjectsFromArray:", v16);
  return v6;
}

- (id)resolveContactIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  id CNContactClass_2;
  void *v9;
  void *v10;
  id CNPhoneNumberClass;
  void *v12;
  void *v13;
  id *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  id v36[2];

  v36[1] = *(id *)MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    if (getuid())
    {
      objc_msgSend(v4, "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        objc_msgSend(v4, "identifier");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "containsString:", CFSTR("@"));

        CNContactClass_2 = getCNContactClass_2();
        if (v7)
        {
          objc_msgSend(v4, "identifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(CNContactClass_2, "predicateForContactsMatchingEmailAddress:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          CNPhoneNumberClass = getCNPhoneNumberClass();
          objc_msgSend(v4, "identifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(CNPhoneNumberClass, "phoneNumberWithStringValue:", v9);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(CNContactClass_2, "predicateForContactsMatchingPhoneNumber:", v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

        }
        if (v10)
        {
          -[_PSContactResolver contactStore](self, "contactStore");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = 0;
          v33 = &v32;
          v34 = 0x2020000000;
          v14 = (id *)getCNContactIdentifierKeySymbolLoc_ptr_3;
          v35 = getCNContactIdentifierKeySymbolLoc_ptr_3;
          if (!getCNContactIdentifierKeySymbolLoc_ptr_3)
          {
            v15 = (void *)ContactsLibrary_2();
            v14 = (id *)dlsym(v15, "CNContactIdentifierKey");
            v33[3] = (uint64_t)v14;
            getCNContactIdentifierKeySymbolLoc_ptr_3 = (uint64_t)v14;
          }
          _Block_object_dispose(&v32, 8);
          if (!v14)
          {
            -[_PSBlockedHandlesCache beginSyncingWithTU].cold.1();
            __break(1u);
          }
          v36[0] = *v14;
          v16 = (void *)MEMORY[0x1E0C99D20];
          v17 = v36[0];
          objc_msgSend(v16, "arrayWithObjects:count:", v36, 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = 0;
          objc_msgSend(v13, "unifiedContactsMatchingPredicate:keysToFetch:error:", v10, v18, &v31);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v31;

          if (v20)
          {
            +[_PSLogging heuristicsChannel](_PSLogging, "heuristicsChannel");
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              _PSResolveContactWithPredicate_cold_1((uint64_t)v20, v21, v22, v23, v24, v25, v26, v27);

          }
          else if (objc_msgSend(v19, "count") == 1)
          {
            objc_msgSend(v19, "firstObject");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "identifier");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = v19;
LABEL_20:

            goto LABEL_16;
          }
          v28 = 0;
          v30 = v19;
          goto LABEL_20;
        }
      }
    }
  }
  v28 = 0;
LABEL_16:

  return v28;
}

- (id)resolveContact:(id)a3
{
  void *v4;
  void *v5;

  if (a3)
  {
    objc_msgSend(a3, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSContactResolver resolveContactIfPossibleFromContactIdentifierString:](self, "resolveContactIfPossibleFromContactIdentifierString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)resolveContactIfPossibleFromContactIdentifierString:(id)a3
{
  return -[_PSContactResolver resolveContactIfPossibleFromContactIdentifierString:pickFirstOfMultiple:](self, "resolveContactIfPossibleFromContactIdentifierString:pickFirstOfMultiple:", a3, 0);
}

- (id)resolveContactIfPossibleFromContactIdentifierString:(id)a3 pickFirstOfMultiple:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  int v8;
  id CNContactClass_2;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "containsString:", CFSTR("@"));
    CNContactClass_2 = getCNContactClass_2();
    v10 = CNContactClass_2;
    if (v8)
    {
      objc_msgSend(CNContactClass_2, "predicateForContactsMatchingEmailAddress:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
LABEL_4:
        -[_PSContactResolver contactStore](self, "contactStore");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[_PSContactResolver keysToFetch](self, "keysToFetch");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        _PSResolveContactWithPredicate(v11, v12, v13, v4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
        goto LABEL_9;
      }
    }
    else
    {
      objc_msgSend(getCNPhoneNumberClass(), "phoneNumberWithStringValue:", v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "predicateForContactsMatchingPhoneNumber:", v15);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
        goto LABEL_4;
    }
    v14 = 0;
    goto LABEL_8;
  }
  v14 = 0;
LABEL_9:

  return v14;
}

+ (id)normalizedHandlesDictionaryFromHandles:(id)a3
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

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
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
        if (objc_msgSend(v10, "containsString:", CFSTR("@"), (_QWORD)v14))
        {
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, v10);
        }
        else
        {
          objc_msgSend(getCNPhoneNumberClass(), "phoneNumberWithStringValue:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "unformattedInternationalStringValue");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "length"))
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v10);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)handlesForContactFavorites
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D15888], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "favoriteContactEntries");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v9, "contactProperty", (_QWORD)v22);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "key");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v26 = 0;
        v27 = &v26;
        v28 = 0x2020000000;
        v12 = (_QWORD *)getCNContactPhoneNumbersKeySymbolLoc_ptr_1;
        v29 = getCNContactPhoneNumbersKeySymbolLoc_ptr_1;
        if (!getCNContactPhoneNumbersKeySymbolLoc_ptr_1)
        {
          v13 = (void *)ContactsLibrary_2();
          v12 = dlsym(v13, "CNContactPhoneNumbersKey");
          v27[3] = (uint64_t)v12;
          getCNContactPhoneNumbersKeySymbolLoc_ptr_1 = (uint64_t)v12;
        }
        _Block_object_dispose(&v26, 8);
        if (!v12)
        {
LABEL_23:
          -[_PSBlockedHandlesCache beginSyncingWithTU].cold.1();
          __break(1u);
        }
        if (objc_msgSend(v11, "isEqualToString:", *v12))
        {
          objc_msgSend(v9, "contactProperty");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "value");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v15, "unformattedInternationalStringValue");
          v16 = objc_claimAutoreleasedReturnValue();
LABEL_16:
          v19 = (void *)v16;

          goto LABEL_18;
        }
        v26 = 0;
        v27 = &v26;
        v28 = 0x2020000000;
        v17 = (_QWORD *)getCNContactEmailAddressesKeySymbolLoc_ptr_1;
        v29 = getCNContactEmailAddressesKeySymbolLoc_ptr_1;
        if (!getCNContactEmailAddressesKeySymbolLoc_ptr_1)
        {
          v18 = (void *)ContactsLibrary_2();
          v17 = dlsym(v18, "CNContactEmailAddressesKey");
          v27[3] = (uint64_t)v17;
          getCNContactEmailAddressesKeySymbolLoc_ptr_1 = (uint64_t)v17;
        }
        _Block_object_dispose(&v26, 8);
        if (!v17)
          goto LABEL_23;
        if (objc_msgSend(v11, "isEqualToString:", *v17))
        {
          objc_msgSend(v9, "contactProperty");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "value");
          v16 = objc_claimAutoreleasedReturnValue();
          goto LABEL_16;
        }
        v19 = 0;
LABEL_18:
        if (objc_msgSend(v19, "length"))
          objc_msgSend(v4, "addObject:", v19);

      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v6);
  }

  v20 = (void *)objc_msgSend(v4, "copy");
  return v20;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (NSArray)keysToFetch
{
  return self->_keysToFetch;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keysToFetch, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
}

@end
