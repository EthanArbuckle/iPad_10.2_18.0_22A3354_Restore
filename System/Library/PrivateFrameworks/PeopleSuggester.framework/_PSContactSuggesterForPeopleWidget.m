@implementation _PSContactSuggesterForPeopleWidget

- (_PSContactSuggesterForPeopleWidget)init
{
  _PSContactSuggesterForPeopleWidget *v2;
  id v3;
  id v4;
  uint64_t v5;
  _PASLock *candidateContacts;
  NSMutableSet *v7;
  NSMutableSet *priorityFamilyMembers;
  NSMutableSet *v9;
  NSMutableSet *nonpriorityFamilyMembers;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_PSContactSuggesterForPeopleWidget;
  v2 = -[_PSContactSuggesterForPeopleWidget init](&v12, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0D815F0]);
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v5 = objc_msgSend(v3, "initWithGuardedData:", v4);
    candidateContacts = v2->_candidateContacts;
    v2->_candidateContacts = (_PASLock *)v5;

    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    priorityFamilyMembers = v2->_priorityFamilyMembers;
    v2->_priorityFamilyMembers = v7;

    v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    nonpriorityFamilyMembers = v2->_nonpriorityFamilyMembers;
    v2->_nonpriorityFamilyMembers = v9;

  }
  return v2;
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

- (id)contactKeysToFetch
{
  id *v2;
  void *v3;
  id v4;
  id *v5;
  void *v6;
  id v7;
  id *v8;
  void *v9;
  id v10;
  id *v11;
  void *v12;
  id v13;
  id *v14;
  void *v15;
  id v16;
  id *v17;
  void *v18;
  id v19;
  id *v20;
  void *v21;
  id v22;
  id *v23;
  void *v24;
  id v25;
  id *v26;
  void *v27;
  id v28;
  id *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD v41[10];
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  getCNContactIdentifierKey_3();
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v36;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v2 = (id *)getCNContactPhoneNumbersKeySymbolLoc_ptr_5;
  v40 = getCNContactPhoneNumbersKeySymbolLoc_ptr_5;
  if (!getCNContactPhoneNumbersKeySymbolLoc_ptr_5)
  {
    v3 = (void *)ContactsLibrary_6();
    v2 = (id *)dlsym(v3, "CNContactPhoneNumbersKey");
    v38[3] = (uint64_t)v2;
    getCNContactPhoneNumbersKeySymbolLoc_ptr_5 = (uint64_t)v2;
  }
  _Block_object_dispose(&v37, 8);
  if (!v2)
    goto LABEL_32;
  v4 = *v2;
  v41[1] = v4;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v5 = (id *)getCNContactEmailAddressesKeySymbolLoc_ptr_5;
  v40 = getCNContactEmailAddressesKeySymbolLoc_ptr_5;
  if (!getCNContactEmailAddressesKeySymbolLoc_ptr_5)
  {
    v6 = (void *)ContactsLibrary_6();
    v5 = (id *)dlsym(v6, "CNContactEmailAddressesKey");
    v38[3] = (uint64_t)v5;
    getCNContactEmailAddressesKeySymbolLoc_ptr_5 = (uint64_t)v5;
  }
  _Block_object_dispose(&v37, 8);
  if (!v5)
    goto LABEL_32;
  v7 = *v5;
  v41[2] = v7;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v8 = (id *)getCNContactGivenNameKeySymbolLoc_ptr_4;
  v40 = getCNContactGivenNameKeySymbolLoc_ptr_4;
  if (!getCNContactGivenNameKeySymbolLoc_ptr_4)
  {
    v9 = (void *)ContactsLibrary_6();
    v8 = (id *)dlsym(v9, "CNContactGivenNameKey");
    v38[3] = (uint64_t)v8;
    getCNContactGivenNameKeySymbolLoc_ptr_4 = (uint64_t)v8;
  }
  _Block_object_dispose(&v37, 8);
  if (!v8)
    goto LABEL_32;
  v10 = *v8;
  v41[3] = v10;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v11 = (id *)getCNContactFamilyNameKeySymbolLoc_ptr_4;
  v40 = getCNContactFamilyNameKeySymbolLoc_ptr_4;
  if (!getCNContactFamilyNameKeySymbolLoc_ptr_4)
  {
    v12 = (void *)ContactsLibrary_6();
    v11 = (id *)dlsym(v12, "CNContactFamilyNameKey");
    v38[3] = (uint64_t)v11;
    getCNContactFamilyNameKeySymbolLoc_ptr_4 = (uint64_t)v11;
  }
  _Block_object_dispose(&v37, 8);
  if (!v11)
    goto LABEL_32;
  v13 = *v11;
  v41[4] = v13;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v14 = (id *)getCNContactMiddleNameKeySymbolLoc_ptr_4;
  v40 = getCNContactMiddleNameKeySymbolLoc_ptr_4;
  if (!getCNContactMiddleNameKeySymbolLoc_ptr_4)
  {
    v15 = (void *)ContactsLibrary_6();
    v14 = (id *)dlsym(v15, "CNContactMiddleNameKey");
    v38[3] = (uint64_t)v14;
    getCNContactMiddleNameKeySymbolLoc_ptr_4 = (uint64_t)v14;
  }
  _Block_object_dispose(&v37, 8);
  if (!v14)
    goto LABEL_32;
  v16 = *v14;
  v41[5] = v16;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v17 = (id *)getCNContactNameSuffixKeySymbolLoc_ptr_3;
  v40 = getCNContactNameSuffixKeySymbolLoc_ptr_3;
  if (!getCNContactNameSuffixKeySymbolLoc_ptr_3)
  {
    v18 = (void *)ContactsLibrary_6();
    v17 = (id *)dlsym(v18, "CNContactNameSuffixKey");
    v38[3] = (uint64_t)v17;
    getCNContactNameSuffixKeySymbolLoc_ptr_3 = (uint64_t)v17;
  }
  _Block_object_dispose(&v37, 8);
  if (!v17)
    goto LABEL_32;
  v19 = *v17;
  v41[6] = v19;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v20 = (id *)getCNContactNamePrefixKeySymbolLoc_ptr_3;
  v40 = getCNContactNamePrefixKeySymbolLoc_ptr_3;
  if (!getCNContactNamePrefixKeySymbolLoc_ptr_3)
  {
    v21 = (void *)ContactsLibrary_6();
    v20 = (id *)dlsym(v21, "CNContactNamePrefixKey");
    v38[3] = (uint64_t)v20;
    getCNContactNamePrefixKeySymbolLoc_ptr_3 = (uint64_t)v20;
  }
  _Block_object_dispose(&v37, 8);
  if (!v20)
    goto LABEL_32;
  v22 = *v20;
  v41[7] = v22;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v23 = (id *)getCNContactOrganizationNameKeySymbolLoc_ptr_0;
  v40 = getCNContactOrganizationNameKeySymbolLoc_ptr_0;
  if (!getCNContactOrganizationNameKeySymbolLoc_ptr_0)
  {
    v24 = (void *)ContactsLibrary_6();
    v23 = (id *)dlsym(v24, "CNContactOrganizationNameKey");
    v38[3] = (uint64_t)v23;
    getCNContactOrganizationNameKeySymbolLoc_ptr_0 = (uint64_t)v23;
  }
  _Block_object_dispose(&v37, 8);
  if (!v23)
    goto LABEL_32;
  v25 = *v23;
  v41[8] = v25;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v26 = (id *)getCNContactNicknameKeySymbolLoc_ptr_4;
  v40 = getCNContactNicknameKeySymbolLoc_ptr_4;
  if (!getCNContactNicknameKeySymbolLoc_ptr_4)
  {
    v27 = (void *)ContactsLibrary_6();
    v26 = (id *)dlsym(v27, "CNContactNicknameKey");
    v38[3] = (uint64_t)v26;
    getCNContactNicknameKeySymbolLoc_ptr_4 = (uint64_t)v26;
  }
  _Block_object_dispose(&v37, 8);
  if (!v26)
    goto LABEL_32;
  v35 = v4;
  v28 = *v26;
  v41[9] = v28;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v29 = (id *)getCNContactTypeKeySymbolLoc_ptr_3;
  v40 = getCNContactTypeKeySymbolLoc_ptr_3;
  if (!getCNContactTypeKeySymbolLoc_ptr_3)
  {
    v30 = (void *)ContactsLibrary_6();
    v29 = (id *)dlsym(v30, "CNContactTypeKey");
    v38[3] = (uint64_t)v29;
    getCNContactTypeKeySymbolLoc_ptr_3 = (uint64_t)v29;
  }
  _Block_object_dispose(&v37, 8);
  if (!v29)
  {
LABEL_32:
    -[_PSBlockedHandlesCache beginSyncingWithTU].cold.1();
    __break(1u);
  }
  v42 = *v29;
  v31 = (void *)MEMORY[0x1E0C99D20];
  v32 = v42;
  objc_msgSend(v31, "arrayWithObjects:count:", v41, 11);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

- (void)processFamilyMember:(id)a3 toFillContactArray:(id)a4
{
  id v5;
  void *v6;
  _PSContact *v7;
  void *v8;
  _PSContact *v9;
  id v10;

  v10 = a3;
  v5 = a4;
  if ((objc_msgSend(v10, "isMe") & 1) == 0)
  {
    objc_msgSend(v10, "contact");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [_PSContact alloc];
      objc_msgSend(v10, "contact");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[_PSContact initWithCNContact:isChild:](v7, "initWithCNContact:isChild:", v8, objc_msgSend(v10, "isChildAccount"));

      objc_msgSend(v5, "addObject:", v9);
    }
  }

}

- (id)familyMemberContactHandles
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  id v6;
  NSObject *v7;
  dispatch_time_t v8;
  NSObject *v9;
  id v10;
  void *v11;
  dispatch_semaphore_t v12;
  dispatch_time_t v13;
  NSObject *v14;
  id v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *, void *);
  void *v29;
  _PSContactSuggesterForPeopleWidget *v30;
  NSObject *v31;
  uint64_t *v32;
  _QWORD v33[5];
  NSObject *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  uint8_t *v40;
  id v41;
  uint8_t buf[8];
  uint8_t *v43;
  uint64_t v44;
  uint64_t v45;

  *(_QWORD *)buf = 0;
  v43 = buf;
  v44 = 0x2050000000;
  v3 = (void *)getFAFetchFamilyCircleRequestClass_softClass_0;
  v45 = getFAFetchFamilyCircleRequestClass_softClass_0;
  v4 = MEMORY[0x1E0C809B0];
  if (!getFAFetchFamilyCircleRequestClass_softClass_0)
  {
    v36 = MEMORY[0x1E0C809B0];
    v37 = 3221225472;
    v38 = (uint64_t)__getFAFetchFamilyCircleRequestClass_block_invoke_0;
    v39 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E43FEA00;
    v40 = buf;
    __getFAFetchFamilyCircleRequestClass_block_invoke_0((uint64_t)&v36);
    v3 = (void *)*((_QWORD *)v43 + 3);
  }
  v5 = objc_retainAutorelease(v3);
  _Block_object_dispose(buf, 8);
  v6 = objc_alloc_init(v5);
  v36 = 0;
  v37 = (uint64_t)&v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__14;
  v40 = (uint8_t *)__Block_byref_object_dispose__14;
  v41 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v33[0] = v4;
  v33[1] = 3221225472;
  v33[2] = __64___PSContactSuggesterForPeopleWidget_familyMemberContactHandles__block_invoke;
  v33[3] = &unk_1E43FF998;
  v33[4] = self;
  v35 = &v36;
  v7 = dispatch_semaphore_create(0);
  v34 = v7;
  objc_msgSend(v6, "startRequestWithCompletionHandler:", v33);
  v8 = dispatch_time(0, 60000000000);
  if (dispatch_semaphore_wait(v7, v8))
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A07F4000, v9, OS_LOG_TYPE_INFO, "Timeout in FAFetchFamilyCircleRequest", buf, 2u);
    }

    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v11 = *(void **)(v37 + 40);
    *(_QWORD *)(v37 + 40) = v10;

  }
  if (!objc_msgSend(*(id *)(v37 + 40), "count"))
  {
    objc_msgSend(v6, "setCachePolicy:", 1);
    v12 = dispatch_semaphore_create(0);

    v26 = v4;
    v27 = 3221225472;
    v28 = __64___PSContactSuggesterForPeopleWidget_familyMemberContactHandles__block_invoke_24;
    v29 = &unk_1E43FF998;
    v30 = self;
    v32 = &v36;
    v7 = v12;
    v31 = v7;
    objc_msgSend(v6, "startRequestWithCompletionHandler:", &v26);
    v13 = dispatch_time(0, 60000000000);
    if (dispatch_semaphore_wait(v7, v13))
    {
      +[_PSLogging generalChannel](_PSLogging, "generalChannel", v26, v27, v28, v29, v30);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A07F4000, v14, OS_LOG_TYPE_INFO, "Timeout in FAFetchFamilyCircleRequest with cachePolicy=YES", buf, 2u);
      }

      v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v16 = *(void **)(v37 + 40);
      *(_QWORD *)(v37 + 40) = v15;

    }
  }
  +[_PSLogging generalChannel](_PSLogging, "generalChannel", v26, v27, v28, v29, v30);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    -[_PSContactSuggesterForPeopleWidget familyMemberContactHandles].cold.1((uint64_t)&v37, v17, v18, v19, v20, v21, v22, v23);

  v24 = (void *)objc_msgSend(*(id *)(v37 + 40), "copy");
  _Block_object_dispose(&v36, 8);

  return v24;
}

- (id)iCloudFamilyMembers
{
  id v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  _PASLock *candidateContacts;
  NSObject *v20;
  void *v21;
  void *v22;
  __int128 v24;
  _QWORD v25[5];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[_PSContactSuggesterForPeopleWidget familyMemberContactHandles](self, "familyMemberContactHandles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v27;
    *(_QWORD *)&v6 = 138412290;
    v24 = v6;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v10, "cnContact", v24);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          if (objc_msgSend(v10, "isChild"))
            -[_PSContactSuggesterForPeopleWidget priorityFamilyMembers](self, "priorityFamilyMembers");
          else
            -[_PSContactSuggesterForPeopleWidget nonpriorityFamilyMembers](self, "nonpriorityFamilyMembers");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "cnContact");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v15);

          objc_msgSend(v10, "cnContact");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v17);

          +[_PSLogging generalChannel](_PSLogging, "generalChannel");
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v24;
            v31 = v10;
            _os_log_debug_impl(&dword_1A07F4000, v18, OS_LOG_TYPE_DEBUG, "i-Cloud family member contact fetched: %@", buf, 0xCu);
          }

          candidateContacts = self->_candidateContacts;
          v25[0] = MEMORY[0x1E0C809B0];
          v25[1] = 3221225472;
          v25[2] = __57___PSContactSuggesterForPeopleWidget_iCloudFamilyMembers__block_invoke;
          v25[3] = &unk_1E43FEE10;
          v25[4] = v10;
          -[_PASLock runWithLockAcquired:](candidateContacts, "runWithLockAcquired:", v25);
        }
      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    }
    while (v7);
  }
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "count"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v31 = v21;
    _os_log_impl(&dword_1A07F4000, v20, OS_LOG_TYPE_DEFAULT, "ICloudFamilyMembers count: %@", buf, 0xCu);

  }
  v22 = (void *)objc_msgSend(v3, "copy");

  return v22;
}

- (id)familyRecommendedContacts
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  _PASLock *candidateContacts;
  NSObject *v20;
  void *v21;
  void *v22;
  _PSFamilyRecommender *v24;
  _QWORD v25[4];
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  uint8_t v33[4];
  uint64_t v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v24 = objc_alloc_init(_PSFamilyRecommender);
  -[_PSFamilyRecommender familyRecommendationSuggestionsForShareSheetWithPredictionContext:](v24, "familyRecommendationSuggestionsForShareSheetWithPredictionContext:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v28 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v10, "recipients");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "count");

        if (v12)
        {
          objc_msgSend(v10, "recipients");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "firstObject");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v14, "contact");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            objc_msgSend(v14, "contact");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "identifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v17);

            +[_PSLogging generalChannel](_PSLogging, "generalChannel");
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
              -[_PSContactSuggesterForPeopleWidget familyRecommendedContacts].cold.1(v33, v14, &v34, v18);

            candidateContacts = self->_candidateContacts;
            v25[0] = MEMORY[0x1E0C809B0];
            v25[1] = 3221225472;
            v25[2] = __63___PSContactSuggesterForPeopleWidget_familyRecommendedContacts__block_invoke;
            v25[3] = &unk_1E43FEE10;
            v26 = v14;
            -[_PASLock runWithLockAcquired:](candidateContacts, "runWithLockAcquired:", v25);

          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v7);
  }

  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v32 = v21;
    _os_log_impl(&dword_1A07F4000, v20, OS_LOG_TYPE_DEFAULT, "familyRecommendedContacts count: %@", buf, 0xCu);

  }
  v22 = (void *)objc_msgSend(v4, "copy");

  return v22;
}

- (id)interactionBasedRecommendedContacts
{
  void *v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  _PSContactResolver *v20;
  void *v21;
  _PSContactResolver *v22;
  uint64_t v23;
  __objc2_class **v24;
  void *v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  _PSContactSuggesterForPeopleWidget *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  char v38;
  void *v39;
  void *v40;
  char v41;
  NSObject *v42;
  void *v43;
  _PASLock *candidateContacts;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v49;
  void *v50;
  void *v51;
  _PSContactSuggester *v52;
  void *v53;
  void *v54;
  id obj;
  char v56;
  uint64_t v57;
  _QWORD v58[4];
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  id v68;
  _BYTE v69[128];
  _BYTE v70[128];
  void *v71;
  uint8_t buf[4];
  void *v73;
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v52 = objc_alloc_init(_PSContactSuggester);
  -[_PSContactSuggester contactSuggestionsWithMaxSuggestions:excludeContactsByIdentifiers:interactionHistoryCap:](v52, "contactSuggestionsWithMaxSuggestions:excludeContactsByIdentifiers:interactionHistoryCap:", 50, MEMORY[0x1E0C9AA60], 1000);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "sortedArrayUsingComparator:", &__block_literal_global_31);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v73 = v3;
    _os_log_impl(&dword_1A07F4000, v4, OS_LOG_TYPE_DEFAULT, "Interaction based suggestions before contact resolution %{private}@", buf, 0xCu);
  }

  v5 = objc_alloc_init((Class)getCNContactStoreClass_0());
  getCNContactIdentifierKey_3();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v71, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = 0;
  objc_msgSend(v5, "_crossPlatformUnifiedMeContactWithKeysToFetch:error:", v7, &v68);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v68;

  v49 = v9;
  if (v9)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[_PSContactSuggesterForPeopleWidget interactionBasedRecommendedContacts].cold.2();

  }
  else
  {
    v53 = v8;
    if (v8)
    {
      v19 = 1;
      goto LABEL_12;
    }
  }
  +[_PSLogging generalChannel](_PSLogging, "generalChannel", v49);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[_PSContactSuggesterForPeopleWidget interactionBasedRecommendedContacts].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

  v19 = 0;
  v53 = 0;
LABEL_12:
  v20 = [_PSContactResolver alloc];
  -[_PSContactSuggesterForPeopleWidget contactKeysToFetch](self, "contactKeysToFetch");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v5;
  v22 = -[_PSContactResolver initWithContactStore:keysToFetch:](v20, "initWithContactStore:keysToFetch:", v5, v21);

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  obj = v3;
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
  v24 = off_1E43FD000;
  v25 = v53;
  if (v23)
  {
    v26 = v23;
    v57 = *(_QWORD *)v65;
    v56 = v19 ^ 1;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v65 != v57)
          objc_enumerationMutation(obj);
        v28 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
        objc_msgSend(v28, "contactIdentifier", v49);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[_PSContactResolver contactWithIdentifier:](v22, "contactWithIdentifier:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v30)
        {
          v62 = 0u;
          v63 = 0u;
          v60 = 0u;
          v61 = 0u;
          objc_msgSend(v28, "handleAndAppFrequencies");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
          if (v32)
          {
            v33 = v32;
            v34 = self;
            v35 = *(_QWORD *)v61;
LABEL_20:
            v36 = 0;
            while (1)
            {
              if (*(_QWORD *)v61 != v35)
                objc_enumerationMutation(v31);
              objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * v36), "handle");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              -[_PSContactResolver resolveContactIfPossibleFromContactIdentifierString:pickFirstOfMultiple:](v22, "resolveContactIfPossibleFromContactIdentifierString:pickFirstOfMultiple:", v37, 1);
              v30 = (void *)objc_claimAutoreleasedReturnValue();

              if (v30)
                break;
              if (v33 == ++v36)
              {
                v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
                if (v33)
                  goto LABEL_20;
                v30 = 0;
                break;
              }
            }
            self = v34;
            v24 = off_1E43FD000;
            v25 = v53;
          }
          else
          {
            v30 = 0;
          }

        }
        if (v30)
          v38 = v56;
        else
          v38 = 1;
        if ((v38 & 1) != 0
          || (objc_msgSend(v25, "identifier"),
              v39 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v30, "identifier"),
              v40 = (void *)objc_claimAutoreleasedReturnValue(),
              v41 = objc_msgSend(v39, "isEqualToString:", v40),
              v40,
              v39,
              (v41 & 1) == 0))
        {
          if (v30)
          {
            -[__objc2_class generalChannel](v24[8], "generalChannel");
            v42 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v73 = v30;
              _os_log_debug_impl(&dword_1A07F4000, v42, OS_LOG_TYPE_DEBUG, "Interaction model suggested contact fetched: %@", buf, 0xCu);
            }

            objc_msgSend(v30, "identifier");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "addObject:", v43);

            candidateContacts = self->_candidateContacts;
            v58[0] = MEMORY[0x1E0C809B0];
            v58[1] = 3221225472;
            v58[2] = __73___PSContactSuggesterForPeopleWidget_interactionBasedRecommendedContacts__block_invoke_31;
            v58[3] = &unk_1E43FEE10;
            v59 = v30;
            -[_PASLock runWithLockAcquired:](candidateContacts, "runWithLockAcquired:", v58);

          }
        }

      }
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
    }
    while (v26);
  }

  -[__objc2_class generalChannel](v24[8], "generalChannel");
  v45 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v54, "count"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v73 = v46;
    _os_log_impl(&dword_1A07F4000, v45, OS_LOG_TYPE_DEFAULT, "interactionBasedRecommendedContacts count: %@", buf, 0xCu);

  }
  v47 = (void *)objc_msgSend(v54, "copy");

  return v47;
}

- (id)favoritedContacts
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  _PASLock *candidateContacts;
  id v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  __int128 v25;
  _QWORD v26[4];
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D15888], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "favoriteContactEntries");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v29;
    *(_QWORD *)&v8 = 138412290;
    v25 = v8;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v29 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v12, "contactProperty", v25);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v12, "contactProperty");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "contact");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          +[_PSLogging generalChannel](_PSLogging, "generalChannel");
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v25;
            v33 = v15;
            _os_log_debug_impl(&dword_1A07F4000, v16, OS_LOG_TYPE_DEBUG, "favoritedContact fetched: %@", buf, 0xCu);
          }

          objc_msgSend(v15, "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v17);

          candidateContacts = self->_candidateContacts;
          v26[0] = MEMORY[0x1E0C809B0];
          v26[1] = 3221225472;
          v26[2] = __55___PSContactSuggesterForPeopleWidget_favoritedContacts__block_invoke;
          v26[3] = &unk_1E43FEE10;
          v27 = v15;
          v19 = v15;
          -[_PASLock runWithLockAcquired:](candidateContacts, "runWithLockAcquired:", v26);

        }
      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v9);
  }

  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    -[_PSContactSuggesterForPeopleWidget favoritedContacts].cold.1();

  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v33 = v22;
    _os_log_impl(&dword_1A07F4000, v21, OS_LOG_TYPE_INFO, "favoritedContacts count: %@", buf, 0xCu);

  }
  v23 = (void *)objc_msgSend(v5, "copy");

  return v23;
}

- (id)contactSuggestionsWithMaxSuggestions:(int64_t)a3 excludeContactsWithIdentifiers:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  char v23;
  _PASLock *candidateContacts;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _PSContactSuggestion *v32;
  double v33;
  void *v34;
  _PSContactSuggestion *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  uint64_t v39;
  void *v40;
  char v41;
  _PASLock *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  _PSContactSuggestion *v50;
  double v51;
  void *v52;
  _PSContactSuggestion *v53;
  unint64_t v54;
  int v55;
  _PASLock *v56;
  id v57;
  void *v58;
  void *v59;
  char v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  _PSContactSuggestion *v68;
  double v69;
  void *v70;
  _PSContactSuggestion *v71;
  unint64_t v72;
  NSObject *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t k;
  void *v77;
  void *v78;
  NSObject *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t m;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  char v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t n;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  char v99;
  unint64_t v100;
  void *v101;
  void *v102;
  void *v103;
  int v104;
  void *v105;
  void *v106;
  void *v107;
  int v108;
  int64_t v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  id v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t ii;
  void *v118;
  NSObject *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  id v125;
  void *v126;
  id v127;
  void *v128;
  id v129;
  id obj;
  id v131;
  id v132;
  id v133;
  id v134;
  id v135;
  id v136;
  id v137;
  id v139;
  void *v140;
  void *v141;
  _PSContactSuggesterForPeopleWidget *v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  _QWORD v159[4];
  id v160;
  _BYTE *v161;
  int v162;
  _QWORD v163[6];
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  _QWORD v168[6];
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  id v173;
  _BYTE v174[128];
  _BYTE v175[128];
  _BYTE v176[128];
  _BYTE v177[128];
  uint8_t v178[128];
  _BYTE buf[24];
  uint64_t (*v180)(uint64_t, uint64_t);
  void (*v181)(uint64_t);
  id v182;
  _BYTE v183[128];
  _QWORD v184[4];

  v184[1] = *MEMORY[0x1E0C80C00];
  v139 = a4;
  v142 = self;
  -[_PSContactSuggesterForPeopleWidget iCloudFamilyMembers](self, "iCloudFamilyMembers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSContactSuggesterForPeopleWidget interactionBasedRecommendedContacts](self, "interactionBasedRecommendedContacts");
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSContactSuggesterForPeopleWidget favoritedContacts](self, "favoritedContacts");
  v136 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v125 = objc_alloc_init((Class)getCNContactStoreClass_0());
  getCNContactIdentifierKey_3();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v184[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v184, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v173 = 0;
  objc_msgSend(v125, "_crossPlatformUnifiedMeContactWithKeysToFetch:error:", v8, &v173);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  v127 = v173;

  if (v127)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[_PSContactSuggesterForPeopleWidget interactionBasedRecommendedContacts].cold.2();

    goto LABEL_5;
  }
  if (!v141)
  {
LABEL_5:
    +[_PSLogging generalChannel](_PSLogging, "generalChannel", v125);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[_PSContactSuggesterForPeopleWidget interactionBasedRecommendedContacts].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);

    v141 = 0;
  }
  v140 = (void *)objc_opt_new();
  v171 = 0u;
  v172 = 0u;
  v169 = 0u;
  v170 = 0u;
  obj = v5;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v169, v183, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v170;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v170 != v19)
          objc_enumerationMutation(obj);
        v21 = *(_QWORD *)(*((_QWORD *)&v169 + 1) + 8 * i);
        objc_msgSend(v141, "identifier", v125);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "isEqualToString:", v21);

        if ((v23 & 1) == 0)
        {
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x3032000000;
          v180 = __Block_byref_object_copy__14;
          v181 = __Block_byref_object_dispose__14;
          v182 = 0;
          candidateContacts = v142->_candidateContacts;
          v168[0] = MEMORY[0x1E0C809B0];
          v168[1] = 3221225472;
          v168[2] = __106___PSContactSuggesterForPeopleWidget_contactSuggestionsWithMaxSuggestions_excludeContactsWithIdentifiers___block_invoke;
          v168[3] = &unk_1E44013D0;
          v168[5] = buf;
          v168[4] = v21;
          -[_PASLock runWithLockAcquired:](candidateContacts, "runWithLockAcquired:", v168);
          v25 = (void *)MEMORY[0x1E0C99E60];
          -[_PSContactSuggesterForPeopleWidget allEmailAndPhoneNumberHandlesForContact:](v142, "allEmailAndPhoneNumberHandlesForContact:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setWithArray:", v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v27, "intersectsSet:", v140))
          {
            objc_msgSend(v27, "allObjects");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v140, "addObjectsFromArray:", v28);
          }
          else
          {
            objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "identifier");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "objectForKey:", v29);
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            if (v30)
            {
              objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "identifier");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "objectForKey:", v31);
              v32 = (_PSContactSuggestion *)objc_claimAutoreleasedReturnValue();

              -[_PSContactSuggestion peopleWidgetScore](v32, "peopleWidgetScore");
              -[_PSContactSuggestion setPeopleWidgetScore:](v32, "setPeopleWidgetScore:", v33 + 4.0);
              objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "identifier");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "setObject:forKeyedSubscript:", v32, v34);
            }
            else
            {
              v35 = [_PSContactSuggestion alloc];
              v32 = -[_PSContactSuggestion initWithContact:andScore:](v35, "initWithContact:andScore:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40), 4.0);
              objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "identifier");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "setValue:forKey:", v32, v34);
            }

            objc_msgSend(v27, "allObjects");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v140, "addObjectsFromArray:", v28);
          }

          _Block_object_dispose(buf, 8);
        }
      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v169, v183, 16);
    }
    while (v18);
  }

  v166 = 0u;
  v167 = 0u;
  v164 = 0u;
  v165 = 0u;
  v129 = v136;
  v36 = objc_msgSend(v129, "countByEnumeratingWithState:objects:count:", &v164, v178, 16);
  if (v36)
  {
    v37 = *(_QWORD *)v165;
    do
    {
      for (j = 0; j != v36; ++j)
      {
        if (*(_QWORD *)v165 != v37)
          objc_enumerationMutation(v129);
        v39 = *(_QWORD *)(*((_QWORD *)&v164 + 1) + 8 * j);
        objc_msgSend(v141, "identifier", v125);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v40, "isEqualToString:", v39);

        if ((v41 & 1) == 0)
        {
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x3032000000;
          v180 = __Block_byref_object_copy__14;
          v181 = __Block_byref_object_dispose__14;
          v182 = 0;
          v42 = v142->_candidateContacts;
          v163[0] = MEMORY[0x1E0C809B0];
          v163[1] = 3221225472;
          v163[2] = __106___PSContactSuggesterForPeopleWidget_contactSuggestionsWithMaxSuggestions_excludeContactsWithIdentifiers___block_invoke_2;
          v163[3] = &unk_1E44013D0;
          v163[4] = v39;
          v163[5] = buf;
          -[_PASLock runWithLockAcquired:](v42, "runWithLockAcquired:", v163);
          v43 = (void *)MEMORY[0x1E0C99E60];
          -[_PSContactSuggesterForPeopleWidget allEmailAndPhoneNumberHandlesForContact:](v142, "allEmailAndPhoneNumberHandlesForContact:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "setWithArray:", v44);
          v45 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v45, "intersectsSet:", v140))
          {
            objc_msgSend(v45, "allObjects");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v140, "addObjectsFromArray:", v46);
          }
          else
          {
            objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "identifier");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "objectForKey:", v47);
            v48 = (void *)objc_claimAutoreleasedReturnValue();

            if (v48)
            {
              objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "identifier");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "objectForKey:", v49);
              v50 = (_PSContactSuggestion *)objc_claimAutoreleasedReturnValue();

              -[_PSContactSuggestion peopleWidgetScore](v50, "peopleWidgetScore");
              -[_PSContactSuggestion setPeopleWidgetScore:](v50, "setPeopleWidgetScore:", v51 + 3.0);
              objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "identifier");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "setObject:forKeyedSubscript:", v50, v52);
            }
            else
            {
              v53 = [_PSContactSuggestion alloc];
              v50 = -[_PSContactSuggestion initWithContact:andScore:](v53, "initWithContact:andScore:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40), 3.0);
              objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "identifier");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "setValue:forKey:", v50, v52);
            }

            objc_msgSend(v45, "allObjects");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v140, "addObjectsFromArray:", v46);
          }

          _Block_object_dispose(buf, 8);
        }
      }
      v36 = objc_msgSend(v129, "countByEnumeratingWithState:objects:count:", &v164, v178, 16);
    }
    while (v36);
  }

  if (objc_msgSend(v128, "count"))
  {
    v54 = 0;
    v55 = 10;
    do
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v180 = __Block_byref_object_copy__14;
      v181 = __Block_byref_object_dispose__14;
      v182 = 0;
      v56 = v142->_candidateContacts;
      v159[0] = MEMORY[0x1E0C809B0];
      v159[1] = 3221225472;
      v159[2] = __106___PSContactSuggesterForPeopleWidget_contactSuggestionsWithMaxSuggestions_excludeContactsWithIdentifiers___block_invoke_3;
      v159[3] = &unk_1E44013F8;
      v161 = buf;
      v57 = v128;
      v160 = v57;
      v162 = v54;
      -[_PASLock runWithLockAcquired:](v56, "runWithLockAcquired:", v159);
      objc_msgSend(v141, "identifier");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "identifier");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend(v58, "isEqualToString:", v59);

      if ((v60 & 1) == 0)
      {
        v61 = (void *)MEMORY[0x1E0C99E60];
        -[_PSContactSuggesterForPeopleWidget allEmailAndPhoneNumberHandlesForContact:](v142, "allEmailAndPhoneNumberHandlesForContact:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "setWithArray:", v62);
        v63 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v63, "intersectsSet:", v140))
        {
          objc_msgSend(v63, "allObjects");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v140, "addObjectsFromArray:", v64);
        }
        else
        {
          objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "identifier");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "objectForKey:", v65);
          v66 = (void *)objc_claimAutoreleasedReturnValue();

          if (v66)
          {
            objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "identifier");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "objectForKey:", v67);
            v68 = (_PSContactSuggestion *)objc_claimAutoreleasedReturnValue();

            -[_PSContactSuggestion peopleWidgetScore](v68, "peopleWidgetScore");
            -[_PSContactSuggestion setPeopleWidgetScore:](v68, "setPeopleWidgetScore:", v69 + (float)((float)((float)v55 / 10.0) + (float)((float)v55 / 10.0)));
            objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "identifier");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "setObject:forKeyedSubscript:", v68, v70);
          }
          else
          {
            v71 = [_PSContactSuggestion alloc];
            v68 = -[_PSContactSuggestion initWithContact:andScore:](v71, "initWithContact:andScore:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40), (float)((float)((float)v55 / 10.0) + (float)((float)v55 / 10.0)));
            objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "identifier");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "setValue:forKey:", v68, v70);
          }

          objc_msgSend(v63, "allObjects");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v140, "addObjectsFromArray:", v64);
        }

      }
      _Block_object_dispose(buf, 8);

      v72 = objc_msgSend(v57, "count");
      if (v54 > 8)
        break;
      ++v54;
      --v55;
    }
    while (v72 > v54);
  }
  +[_PSLogging generalChannel](_PSLogging, "generalChannel", v125);
  v73 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A07F4000, v73, OS_LOG_TYPE_INFO, "Suggestion scoring done", buf, 2u);
  }

  v135 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v157 = 0u;
  v158 = 0u;
  v155 = 0u;
  v156 = 0u;
  v137 = v6;
  v74 = objc_msgSend(v137, "countByEnumeratingWithState:objects:count:", &v155, v177, 16);
  if (v74)
  {
    v75 = *(_QWORD *)v156;
    do
    {
      for (k = 0; k != v74; ++k)
      {
        if (*(_QWORD *)v156 != v75)
          objc_enumerationMutation(v137);
        objc_msgSend(v137, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v155 + 1) + 8 * k));
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v135, "addObject:", v77);

      }
      v74 = objc_msgSend(v137, "countByEnumeratingWithState:objects:count:", &v155, v177, 16);
    }
    while (v74);
  }

  objc_msgSend(v135, "sortedArrayUsingComparator:", &__block_literal_global_36);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v79 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A07F4000, v79, OS_LOG_TYPE_INFO, "Suggestion ranking based on score done", buf, 2u);
  }

  v133 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v134 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v153 = 0u;
  v154 = 0u;
  v151 = 0u;
  v152 = 0u;
  v131 = v78;
  v80 = objc_msgSend(v131, "countByEnumeratingWithState:objects:count:", &v151, v176, 16);
  if (v80)
  {
    v81 = *(_QWORD *)v152;
    do
    {
      for (m = 0; m != v80; ++m)
      {
        if (*(_QWORD *)v152 != v81)
          objc_enumerationMutation(v131);
        v83 = *(void **)(*((_QWORD *)&v151 + 1) + 8 * m);
        -[_PSContactSuggesterForPeopleWidget priorityFamilyMembers](v142, "priorityFamilyMembers");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "contact");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "identifier");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v84, "containsObject:", v86))
        {

          goto LABEL_75;
        }
        if (!v139 || !objc_msgSend(v139, "count"))
        {

LABEL_74:
          objc_msgSend(v133, "addObject:", v83);
          objc_msgSend(v83, "contact");
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v84, "identifier");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v134, "addObject:", v85);
          --a3;
LABEL_75:

          continue;
        }
        objc_msgSend(v83, "contact");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "identifier");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        v89 = objc_msgSend(v139, "containsObject:", v88);

        if ((v89 & 1) == 0)
          goto LABEL_74;
      }
      v80 = objc_msgSend(v131, "countByEnumeratingWithState:objects:count:", &v151, v176, 16);
    }
    while (v80);
  }

  v149 = 0u;
  v150 = 0u;
  v147 = 0u;
  v148 = 0u;
  v132 = v131;
  v90 = objc_msgSend(v132, "countByEnumeratingWithState:objects:count:", &v147, v175, 16);
  if (!v90)
    goto LABEL_94;
  v91 = *(_QWORD *)v148;
  do
  {
    for (n = 0; n != v90; ++n)
    {
      if (*(_QWORD *)v148 != v91)
        objc_enumerationMutation(v132);
      v93 = *(void **)(*((_QWORD *)&v147 + 1) + 8 * n);
      -[_PSContactSuggesterForPeopleWidget nonpriorityFamilyMembers](v142, "nonpriorityFamilyMembers");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "contact");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v95, "identifier");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v94, "containsObject:", v96))
      {

        goto LABEL_91;
      }
      if (!v139 || !objc_msgSend(v139, "count"))
      {

LABEL_90:
        objc_msgSend(v133, "addObject:", v93);
        objc_msgSend(v93, "contact");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "identifier");
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v134, "addObject:", v95);
        --a3;
LABEL_91:

        continue;
      }
      objc_msgSend(v93, "contact");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "identifier");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      v99 = objc_msgSend(v139, "containsObject:", v98);

      if ((v99 & 1) == 0)
        goto LABEL_90;
    }
    v90 = objc_msgSend(v132, "countByEnumeratingWithState:objects:count:", &v147, v175, 16);
  }
  while (v90);
LABEL_94:

  if (a3 >= 1)
  {
    v100 = 0;
    do
    {
      if (objc_msgSend(v132, "count") <= v100)
        break;
      if (v139)
      {
        objc_msgSend(v132, "objectAtIndexedSubscript:", v100);
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v101, "contact");
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "identifier");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        v104 = objc_msgSend(v139, "containsObject:", v103);

        if (v104)
          goto LABEL_100;
      }
      objc_msgSend(v132, "objectAtIndexedSubscript:", v100);
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v105, "contact");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "identifier");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      v108 = objc_msgSend(v134, "containsObject:", v107);

      if (v108)
      {
LABEL_100:
        v109 = a3 + 1;
      }
      else
      {
        objc_msgSend(v132, "objectAtIndexedSubscript:", v100);
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v133, "addObject:", v110);

        objc_msgSend(v132, "objectAtIndexedSubscript:", v100);
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v111, "contact");
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v112, "identifier");
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v134, "addObject:", v113);

        v109 = a3;
      }
      ++v100;
      a3 = v109;
    }
    while (v109 > (uint64_t)v100);
  }
  v145 = 0u;
  v146 = 0u;
  v143 = 0u;
  v144 = 0u;
  v114 = v133;
  v115 = objc_msgSend(v114, "countByEnumeratingWithState:objects:count:", &v143, v174, 16);
  if (v115)
  {
    v116 = *(_QWORD *)v144;
    do
    {
      for (ii = 0; ii != v115; ++ii)
      {
        if (*(_QWORD *)v144 != v116)
          objc_enumerationMutation(v114);
        v118 = *(void **)(*((_QWORD *)&v143 + 1) + 8 * ii);
        +[_PSLogging generalChannel](_PSLogging, "generalChannel");
        v119 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v118, "contact");
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v120, "givenName");
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          v122 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v118, "peopleWidgetScore");
          objc_msgSend(v122, "numberWithDouble:");
          v123 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138478083;
          *(_QWORD *)&buf[4] = v121;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v123;
          _os_log_impl(&dword_1A07F4000, v119, OS_LOG_TYPE_DEFAULT, "Suggestions: %{private}@, score: %@", buf, 0x16u);

        }
      }
      v115 = objc_msgSend(v114, "countByEnumeratingWithState:objects:count:", &v143, v174, 16);
    }
    while (v115);
  }

  return v114;
}

- (_CDInteractionStore)interactionStore
{
  return self->_interactionStore;
}

- (void)setInteractionStore:(id)a3
{
  objc_storeStrong((id *)&self->_interactionStore, a3);
}

- (_PASLock)candidateContacts
{
  return self->_candidateContacts;
}

- (void)setCandidateContacts:(id)a3
{
  objc_storeStrong((id *)&self->_candidateContacts, a3);
}

- (NSMutableSet)priorityFamilyMembers
{
  return self->_priorityFamilyMembers;
}

- (void)setPriorityFamilyMembers:(id)a3
{
  objc_storeStrong((id *)&self->_priorityFamilyMembers, a3);
}

- (NSMutableSet)nonpriorityFamilyMembers
{
  return self->_nonpriorityFamilyMembers;
}

- (void)setNonpriorityFamilyMembers:(id)a3
{
  objc_storeStrong((id *)&self->_nonpriorityFamilyMembers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonpriorityFamilyMembers, 0);
  objc_storeStrong((id *)&self->_priorityFamilyMembers, 0);
  objc_storeStrong((id *)&self->_candidateContacts, 0);
  objc_storeStrong((id *)&self->_interactionStore, 0);
}

- (void)familyMemberContactHandles
{
  OUTLINED_FUNCTION_3(&dword_1A07F4000, a2, a3, "familyMembers %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)familyRecommendedContacts
{
  void *v7;

  objc_msgSend(a2, "contact");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl(&dword_1A07F4000, a4, OS_LOG_TYPE_DEBUG, "Family-recommender suggested contact fetched: %@", a1, 0xCu);

}

- (void)interactionBasedRecommendedContacts
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1A07F4000, v0, v1, "Error fetching me contact from store in _PSContactSuggesterForPeopleWidget: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)favoritedContacts
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1A07F4000, v0, v1, "favoritedContacts: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
