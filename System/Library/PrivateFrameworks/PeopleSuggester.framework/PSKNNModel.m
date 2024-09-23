@implementation PSKNNModel

uint64_t __116___PSKNNModel_PhoneAutocompleteSuggestions__rankedLabelsFromInteractionsForPhoneCallsWithInteractions_andDistances___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a2;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("score"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("score"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

uint64_t __80___PSKNNModel_PhoneAutocompleteSuggestions__suggestionExists_withValue_inArray___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "evaluateWithObject:", a2);
}

uint64_t __94___PSKNNModel_rankedMessagesAutocompleteSuggestionsWithPredictionContext_bundleId_candidates___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v9 = v8 == 0;
  else
    v9 = 1;
  if (v9)
  {
    if (v8)
      v10 = -1;
    else
      v10 = 0;
    if (v7)
      v11 = 1;
    else
      v11 = v10;
  }
  else
  {
    v11 = objc_msgSend(v7, "compare:", v8);
  }

  return v11;
}

_PSSuggestion *__62___PSKNNModel_suggestionsByUpdatingGroupNamesFromSuggestions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void (*v5)(id);
  void *v6;
  void *v7;
  void *v8;
  _PSSuggestion *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  int v20;
  NSObject *v21;
  _PSSuggestion *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  void *v35;
  _BYTE buf[24];
  void *v37;
  uint64_t *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "conversationIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v5 = (void (*)(id))getIMSPIGetDisplayNameAndParticipantsForChatWithGUIDSymbolLoc_ptr;
  v35 = getIMSPIGetDisplayNameAndParticipantsForChatWithGUIDSymbolLoc_ptr;
  if (!getIMSPIGetDisplayNameAndParticipantsForChatWithGUIDSymbolLoc_ptr)
  {
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getIMSPIGetDisplayNameAndParticipantsForChatWithGUIDSymbolLoc_block_invoke;
    v37 = &unk_1E43FEA00;
    v38 = &v32;
    __getIMSPIGetDisplayNameAndParticipantsForChatWithGUIDSymbolLoc_block_invoke((uint64_t)buf);
    v5 = (void (*)(id))v33[3];
  }
  _Block_object_dispose(&v32, 8);
  if (!v5)
  {
    -[_PSBlockedHandlesCache beginSyncingWithTU].cold.1();
    __break(1u);
  }
  v5(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v6, "count"))
    goto LABEL_20;
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v8))
  {

    v9 = 0;
    goto LABEL_21;
  }
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);
    v10 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "groupName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = objc_msgSend(v10, "isEqual:", v11);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v13);

  }
  if (!v8)

  v14 = *(void **)(a1 + 40);
  objc_msgSend(v6, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "recipientsForChat:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = *(void **)(a1 + 40);
  objc_msgSend(v3, "recipients");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v17, "suggestedRecipientHandles:differFromFetchedRecipientHandles:", v18, v16);

  v20 = v12 ^ 1;
  if (((v12 ^ 1 | v19) & 1) == 0)
  {

LABEL_20:
    v9 = (_PSSuggestion *)v3;
    goto LABEL_21;
  }
  +[_PSLogging knnChannel](_PSLogging, "knnChannel");
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138478339;
    *(_QWORD *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v20;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v19;
    _os_log_impl(&dword_1A07F4000, v21, OS_LOG_TYPE_DEFAULT, "Updating suggestion since groupName(%{private}@) changed: %{BOOL}d or participants changed: %{BOOL}d", buf, 0x18u);
  }

  v22 = [_PSSuggestion alloc];
  objc_msgSend(v3, "bundleID");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "conversationIdentifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "derivedIntentIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "image");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reason");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reasonType");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "score");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[_PSSuggestion initWithBundleID:conversationIdentifier:groupName:recipients:derivedIntentIdentifier:image:reason:reasonType:score:](v22, "initWithBundleID:conversationIdentifier:groupName:recipients:derivedIntentIdentifier:image:reason:reasonType:score:", v31, v30, v8, v16, v23, v24, v25, v26, v27);

  objc_msgSend(v3, "messagesGroupIdentifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSSuggestion setMessagesGroupIdentifier:](v9, "setMessagesGroupIdentifier:", v28);

LABEL_21:
  return v9;
}

void __33___PSKNNModel_contactKeysToFetch__block_invoke()
{
  id *v0;
  void *v1;
  id v2;
  id *v3;
  void *v4;
  id v5;
  id *v6;
  void *v7;
  id v8;
  id *v9;
  void *v10;
  id v11;
  id *v12;
  void *v13;
  id *v14;
  void *v15;
  id *v16;
  void *v17;
  id *v18;
  void *v19;
  id *v20;
  void *v21;
  id *v22;
  void *v23;
  id *v24;
  void *v25;
  id v26;
  id *v27;
  void *v28;
  id v29;
  id *v30;
  void *v31;
  id v32;
  id *v33;
  void *v34;
  id v35;
  id *v36;
  void *v37;
  id v38;
  id *v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD v56[15];
  id v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v52 = 0;
  v53 = &v52;
  v54 = 0x2020000000;
  v0 = (id *)getCNContactNamePrefixKeySymbolLoc_ptr_2;
  v55 = getCNContactNamePrefixKeySymbolLoc_ptr_2;
  if (!getCNContactNamePrefixKeySymbolLoc_ptr_2)
  {
    v1 = (void *)ContactsLibrary_5();
    v0 = (id *)dlsym(v1, "CNContactNamePrefixKey");
    v53[3] = (uint64_t)v0;
    getCNContactNamePrefixKeySymbolLoc_ptr_2 = (uint64_t)v0;
  }
  _Block_object_dispose(&v52, 8);
  if (!v0)
    goto LABEL_50;
  v2 = *v0;
  v56[0] = v2;
  v52 = 0;
  v53 = &v52;
  v54 = 0x2020000000;
  v3 = (id *)getCNContactGivenNameKeySymbolLoc_ptr_3;
  v55 = getCNContactGivenNameKeySymbolLoc_ptr_3;
  if (!getCNContactGivenNameKeySymbolLoc_ptr_3)
  {
    v4 = (void *)ContactsLibrary_5();
    v3 = (id *)dlsym(v4, "CNContactGivenNameKey");
    v53[3] = (uint64_t)v3;
    getCNContactGivenNameKeySymbolLoc_ptr_3 = (uint64_t)v3;
  }
  _Block_object_dispose(&v52, 8);
  if (!v3)
    goto LABEL_50;
  v5 = *v3;
  v56[1] = v5;
  v52 = 0;
  v53 = &v52;
  v54 = 0x2020000000;
  v6 = (id *)getCNContactMiddleNameKeySymbolLoc_ptr_3;
  v55 = getCNContactMiddleNameKeySymbolLoc_ptr_3;
  if (!getCNContactMiddleNameKeySymbolLoc_ptr_3)
  {
    v7 = (void *)ContactsLibrary_5();
    v6 = (id *)dlsym(v7, "CNContactMiddleNameKey");
    v53[3] = (uint64_t)v6;
    getCNContactMiddleNameKeySymbolLoc_ptr_3 = (uint64_t)v6;
  }
  _Block_object_dispose(&v52, 8);
  if (!v6)
    goto LABEL_50;
  v8 = *v6;
  v56[2] = v8;
  v52 = 0;
  v53 = &v52;
  v54 = 0x2020000000;
  v9 = (id *)getCNContactFamilyNameKeySymbolLoc_ptr_3;
  v55 = getCNContactFamilyNameKeySymbolLoc_ptr_3;
  if (!getCNContactFamilyNameKeySymbolLoc_ptr_3)
  {
    v10 = (void *)ContactsLibrary_5();
    v9 = (id *)dlsym(v10, "CNContactFamilyNameKey");
    v53[3] = (uint64_t)v9;
    getCNContactFamilyNameKeySymbolLoc_ptr_3 = (uint64_t)v9;
  }
  _Block_object_dispose(&v52, 8);
  if (!v9)
    goto LABEL_50;
  v11 = *v9;
  v56[3] = v11;
  v52 = 0;
  v53 = &v52;
  v54 = 0x2020000000;
  v12 = (id *)getCNContactPreviousFamilyNameKeySymbolLoc_ptr_2;
  v55 = getCNContactPreviousFamilyNameKeySymbolLoc_ptr_2;
  if (!getCNContactPreviousFamilyNameKeySymbolLoc_ptr_2)
  {
    v13 = (void *)ContactsLibrary_5();
    v12 = (id *)dlsym(v13, "CNContactPreviousFamilyNameKey");
    v53[3] = (uint64_t)v12;
    getCNContactPreviousFamilyNameKeySymbolLoc_ptr_2 = (uint64_t)v12;
  }
  _Block_object_dispose(&v52, 8);
  if (!v12)
    goto LABEL_50;
  v51 = *v12;
  v52 = 0;
  v56[4] = v51;
  v53 = &v52;
  v54 = 0x2020000000;
  v14 = (id *)getCNContactNameSuffixKeySymbolLoc_ptr_2;
  v55 = getCNContactNameSuffixKeySymbolLoc_ptr_2;
  if (!getCNContactNameSuffixKeySymbolLoc_ptr_2)
  {
    v15 = (void *)ContactsLibrary_5();
    v14 = (id *)dlsym(v15, "CNContactNameSuffixKey");
    v53[3] = (uint64_t)v14;
    getCNContactNameSuffixKeySymbolLoc_ptr_2 = (uint64_t)v14;
  }
  _Block_object_dispose(&v52, 8);
  if (!v14)
    goto LABEL_50;
  v50 = *v14;
  v56[5] = v50;
  v52 = 0;
  v53 = &v52;
  v54 = 0x2020000000;
  v16 = (id *)getCNContactNicknameKeySymbolLoc_ptr_3;
  v55 = getCNContactNicknameKeySymbolLoc_ptr_3;
  if (!getCNContactNicknameKeySymbolLoc_ptr_3)
  {
    v17 = (void *)ContactsLibrary_5();
    v16 = (id *)dlsym(v17, "CNContactNicknameKey");
    v53[3] = (uint64_t)v16;
    getCNContactNicknameKeySymbolLoc_ptr_3 = (uint64_t)v16;
  }
  _Block_object_dispose(&v52, 8);
  if (!v16)
    goto LABEL_50;
  v49 = *v16;
  v56[6] = v49;
  v52 = 0;
  v53 = &v52;
  v54 = 0x2020000000;
  v18 = (id *)getCNContactOrganizationNameKeySymbolLoc_ptr;
  v55 = getCNContactOrganizationNameKeySymbolLoc_ptr;
  if (!getCNContactOrganizationNameKeySymbolLoc_ptr)
  {
    v19 = (void *)ContactsLibrary_5();
    v18 = (id *)dlsym(v19, "CNContactOrganizationNameKey");
    v53[3] = (uint64_t)v18;
    getCNContactOrganizationNameKeySymbolLoc_ptr = (uint64_t)v18;
  }
  _Block_object_dispose(&v52, 8);
  if (!v18)
    goto LABEL_50;
  v48 = *v18;
  v56[7] = v48;
  v52 = 0;
  v53 = &v52;
  v54 = 0x2020000000;
  v20 = (id *)getCNContactImageDataKeySymbolLoc_ptr_0;
  v55 = getCNContactImageDataKeySymbolLoc_ptr_0;
  if (!getCNContactImageDataKeySymbolLoc_ptr_0)
  {
    v21 = (void *)ContactsLibrary_5();
    v20 = (id *)dlsym(v21, "CNContactImageDataKey");
    v53[3] = (uint64_t)v20;
    getCNContactImageDataKeySymbolLoc_ptr_0 = (uint64_t)v20;
  }
  _Block_object_dispose(&v52, 8);
  if (!v20)
    goto LABEL_50;
  v47 = *v20;
  v56[8] = v47;
  v52 = 0;
  v53 = &v52;
  v54 = 0x2020000000;
  v22 = (id *)getCNContactImageDataAvailableKeySymbolLoc_ptr_0;
  v55 = getCNContactImageDataAvailableKeySymbolLoc_ptr_0;
  if (!getCNContactImageDataAvailableKeySymbolLoc_ptr_0)
  {
    v23 = (void *)ContactsLibrary_5();
    v22 = (id *)dlsym(v23, "CNContactImageDataAvailableKey");
    v53[3] = (uint64_t)v22;
    getCNContactImageDataAvailableKeySymbolLoc_ptr_0 = (uint64_t)v22;
  }
  _Block_object_dispose(&v52, 8);
  if (!v22)
    goto LABEL_50;
  v46 = *v22;
  v56[9] = v46;
  v52 = 0;
  v53 = &v52;
  v54 = 0x2020000000;
  v24 = (id *)getCNContactThumbnailImageDataKeySymbolLoc_ptr_0;
  v55 = getCNContactThumbnailImageDataKeySymbolLoc_ptr_0;
  if (!getCNContactThumbnailImageDataKeySymbolLoc_ptr_0)
  {
    v25 = (void *)ContactsLibrary_5();
    v24 = (id *)dlsym(v25, "CNContactThumbnailImageDataKey");
    v53[3] = (uint64_t)v24;
    getCNContactThumbnailImageDataKeySymbolLoc_ptr_0 = (uint64_t)v24;
  }
  _Block_object_dispose(&v52, 8);
  if (!v24)
    goto LABEL_50;
  v26 = *v24;
  v56[10] = v26;
  v52 = 0;
  v53 = &v52;
  v54 = 0x2020000000;
  v27 = (id *)getCNContactTypeKeySymbolLoc_ptr_2;
  v55 = getCNContactTypeKeySymbolLoc_ptr_2;
  if (!getCNContactTypeKeySymbolLoc_ptr_2)
  {
    v28 = (void *)ContactsLibrary_5();
    v27 = (id *)dlsym(v28, "CNContactTypeKey");
    v53[3] = (uint64_t)v27;
    getCNContactTypeKeySymbolLoc_ptr_2 = (uint64_t)v27;
  }
  _Block_object_dispose(&v52, 8);
  if (!v27)
    goto LABEL_50;
  v29 = *v27;
  v56[11] = v29;
  v52 = 0;
  v53 = &v52;
  v54 = 0x2020000000;
  v30 = (id *)getCNContactPhoneNumbersKeySymbolLoc_ptr_4;
  v55 = getCNContactPhoneNumbersKeySymbolLoc_ptr_4;
  if (!getCNContactPhoneNumbersKeySymbolLoc_ptr_4)
  {
    v31 = (void *)ContactsLibrary_5();
    v30 = (id *)dlsym(v31, "CNContactPhoneNumbersKey");
    v53[3] = (uint64_t)v30;
    getCNContactPhoneNumbersKeySymbolLoc_ptr_4 = (uint64_t)v30;
  }
  _Block_object_dispose(&v52, 8);
  if (!v30)
    goto LABEL_50;
  v32 = *v30;
  v56[12] = v32;
  v52 = 0;
  v53 = &v52;
  v54 = 0x2020000000;
  v33 = (id *)getCNContactEmailAddressesKeySymbolLoc_ptr_4;
  v55 = getCNContactEmailAddressesKeySymbolLoc_ptr_4;
  if (!getCNContactEmailAddressesKeySymbolLoc_ptr_4)
  {
    v34 = (void *)ContactsLibrary_5();
    v33 = (id *)dlsym(v34, "CNContactEmailAddressesKey");
    v53[3] = (uint64_t)v33;
    getCNContactEmailAddressesKeySymbolLoc_ptr_4 = (uint64_t)v33;
  }
  _Block_object_dispose(&v52, 8);
  if (!v33)
    goto LABEL_50;
  v35 = *v33;
  v56[13] = v35;
  v52 = 0;
  v53 = &v52;
  v54 = 0x2020000000;
  v36 = (id *)getCNContactPostalAddressesKeySymbolLoc_ptr_0;
  v55 = getCNContactPostalAddressesKeySymbolLoc_ptr_0;
  if (!getCNContactPostalAddressesKeySymbolLoc_ptr_0)
  {
    v37 = (void *)ContactsLibrary_5();
    v36 = (id *)dlsym(v37, "CNContactPostalAddressesKey");
    v53[3] = (uint64_t)v36;
    getCNContactPostalAddressesKeySymbolLoc_ptr_0 = (uint64_t)v36;
  }
  _Block_object_dispose(&v52, 8);
  if (!v36)
    goto LABEL_50;
  v45 = v2;
  v38 = *v36;
  v56[14] = v38;
  v52 = 0;
  v53 = &v52;
  v54 = 0x2020000000;
  v39 = (id *)getCNContactInstantMessageAddressesKeySymbolLoc_ptr_0;
  v55 = getCNContactInstantMessageAddressesKeySymbolLoc_ptr_0;
  if (!getCNContactInstantMessageAddressesKeySymbolLoc_ptr_0)
  {
    v40 = (void *)ContactsLibrary_5();
    v39 = (id *)dlsym(v40, "CNContactInstantMessageAddressesKey");
    v53[3] = (uint64_t)v39;
    getCNContactInstantMessageAddressesKeySymbolLoc_ptr_0 = (uint64_t)v39;
  }
  _Block_object_dispose(&v52, 8);
  if (!v39)
  {
LABEL_50:
    -[_PSBlockedHandlesCache beginSyncingWithTU].cold.1();
    __break(1u);
  }
  v57 = *v39;
  v41 = (void *)MEMORY[0x1E0C99D20];
  v42 = v57;
  objc_msgSend(v41, "arrayWithObjects:count:", v56, 16);
  v43 = objc_claimAutoreleasedReturnValue();
  v44 = (void *)contactKeysToFetch_contactKeysToFetch;
  contactKeysToFetch_contactKeysToFetch = v43;

}

uint64_t __58___PSKNNModel_indexesOfObjectsWithKey_withValues_inArray___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "evaluateWithObject:", a2);
}

void __99___PSKNNModel_rankedCoRecipientSuggestionsWithPredictionContext_modelConfiguration_maxSuggestions___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  if (objc_msgSend(v9, "containsString:", CFSTR("@")))
  {
    v3 = (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v9);

    if (v5)
    {
      v4 = 0;
      v3 = (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    }
    else
    {
      v3 = (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
      v4 = 2;
    }
  }
  ++*v3;
  +[_PSContactCache sharedInstance](_PSContactCache, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getContactForHandle:handleType:", v9, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D15890], "normalizedStringFromContactString:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);

  }
}

uint64_t __99___PSKNNModel_rankedCoRecipientSuggestionsWithPredictionContext_modelConfiguration_maxSuggestions___block_invoke_229(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "countForObject:", a2));
}

uint64_t __54___PSKNNModel_suggestionProxiesWithPredictionContext___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __44___PSKNNModel_featureVectorFromInteraction___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "personInPhoto");
}

uint64_t __89___PSKNNModel_rankedLabelsFromInteractionsMaintainRecipientsArray_andDistances_freqOnly___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "personInPhoto");
}

uint64_t __89___PSKNNModel_rankedLabelsFromInteractionsMaintainRecipientsArray_andDistances_freqOnly___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("score"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("score"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  v11 = v10;

  if (v8 >= v11)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("score"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleValue");
    v15 = v14;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("score"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "doubleValue");
    v18 = v17;

    if (v15 <= v18)
      v12 = 0;
    else
      v12 = -1;
  }
  else
  {
    v12 = 1;
  }

  return v12;
}

uint64_t __119___PSKNNModel_rankedLabelsFromInteractionsSingleRecipientArray_andDistances_freqOnly_contactsOnly_scoreLikeShareSheet___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("score"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("score"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  v11 = v10;

  if (v8 >= v11)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("score"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleValue");
    v15 = v14;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("score"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "doubleValue");
    v18 = v17;

    if (v15 <= v18)
      v12 = 0;
    else
      v12 = -1;
  }
  else
  {
    v12 = 1;
  }

  return v12;
}

uint64_t __88___PSKNNModel_rankedLabelsFromInteractionsSiriNLWithInteractions_andDistances_freqOnly___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("score"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("score"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  v11 = v10;

  if (v8 >= v11)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("score"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleValue");
    v15 = v14;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("score"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "doubleValue");
    v18 = v17;

    if (v15 <= v18)
      v12 = 0;
    else
      v12 = -1;
  }
  else
  {
    v12 = 1;
  }

  return v12;
}

uint64_t __43___PSKNNModel_indexToInsertNeighbor_array___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "distance");
  v7 = v6;
  objc_msgSend(v5, "distance");
  if (v7 >= v8)
  {
    objc_msgSend(v4, "distance");
    v11 = v10;
    objc_msgSend(v5, "distance");
    v9 = v11 > v12;
  }
  else
  {
    v9 = -1;
  }

  return v9;
}

void __60___PSKNNModel_rankedMapsShareEtaSuggestions_maxSuggestions___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (objc_msgSend(v2, "state") == 1)
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __60___PSKNNModel_rankedMapsShareEtaSuggestions_maxSuggestions___block_invoke_cold_1(v2, v3);

  }
}

void __60___PSKNNModel_rankedMapsShareEtaSuggestions_maxSuggestions___block_invoke_319(uint64_t a1, void *a2)
{
  void *v3;
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
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  v27 = a2;
  objc_msgSend(v27, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v3, "startLocationId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v3, "startLocationId");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D15A70], "navigationStartLocationIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v7);

    }
    objc_msgSend(v3, "endLocationId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v3, "endLocationId");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D15A70], "navigationEndLocationIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, v10);

    }
    objc_msgSend(v3, "contactId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v3, "contactId");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D15A70], "contactId");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v13);

    }
    v14 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v27, "timestamp");
    objc_msgSend(v14, "dateWithTimeIntervalSinceReferenceDate:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v27, "timestamp");
    objc_msgSend(v16, "dateWithTimeIntervalSinceReferenceDate:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_alloc(MEMORY[0x1E0D15AF0]);
    objc_msgSend(v3, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bundleId");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "groupId");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v18, "initWithIdentifier:bundleIdentifier:itemIdentifier:groupIdentifier:deviceIdentifier:userIdentifier:", v19, v20, 0, v21, 0, 0);

    v23 = (void *)MEMORY[0x1E0D159F8];
    objc_msgSend(MEMORY[0x1E0D15A18], "eventStreamWithName:", CFSTR("/mapsShareEta/feedback"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handle");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "eventWithStream:source:startDate:endDate:identifierStringValue:metadata:", v24, v22, v15, v17, v25, v4);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "addObject:", v26);
  }

}

uint64_t __64___PSKNNModel_mapsShareEtaDefaultKnnSuggestions_maxSuggestions___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "countForObject:", a2));
}

uint64_t __84___PSKNNModel_extractNearestNeighborsForMapsQueryResult_andNeighbors_frequencyOnly___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "doubleValue");
  v7 = v6;
  objc_msgSend(v5, "doubleValue");
  if (v7 >= v8)
  {
    objc_msgSend(v4, "doubleValue");
    v11 = v10;
    objc_msgSend(v5, "doubleValue");
    if (v11 <= v12)
      v9 = 0;
    else
      v9 = -1;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

void __60___PSKNNModel_rankedMapsShareEtaSuggestions_maxSuggestions___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_1A07F4000, a2, v4, "Finalizing local events failed: %@", v5);

}

@end
