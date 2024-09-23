@implementation _PSFamilyMLPredictionTask

- (void)execute:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  uint64_t (**v7)(_QWORD);
  _PSFamilyMLModel *v8;
  void *v9;
  void *v10;
  uint64_t (**v11)(_QWORD);
  _PSFamilyMLModel *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *, _BYTE *);
  void *v21;
  _PSFamilyMLModel *v22;
  id v23;
  id v24;
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __37___PSFamilyMLPredictionTask_execute___block_invoke;
  v31[3] = &unk_1E4400420;
  v6 = v4;
  v32 = v6;
  v7 = (uint64_t (**)(_QWORD))MEMORY[0x1A1AFCBF8](v31);
  if (((unsigned int (*)(void))v7[2])())
  {
    v8 = -[_PSFamilyMLModel initWithActivity:]([_PSFamilyMLModel alloc], "initWithActivity:", v6);
    v9 = (void *)objc_opt_new();
    v10 = (void *)objc_opt_new();
    v27 = 0;
    v28 = &v27;
    v29 = 0x2020000000;
    v30 = 0;
    v18 = v5;
    v19 = 3221225472;
    v20 = __37___PSFamilyMLPredictionTask_execute___block_invoke_4;
    v21 = &unk_1E4400448;
    v11 = v7;
    v25 = v11;
    v26 = &v27;
    v12 = v8;
    v22 = v12;
    v13 = v9;
    v23 = v13;
    v14 = v10;
    v24 = v14;
    -[_PSFamilyMLPredictionTask enumerateContactsInContactStoreUsingBlock:](self, "enumerateContactsInContactStoreUsingBlock:", &v18);
    if (!*((_BYTE *)v28 + 24))
    {
      -[_PSFamilyMLPredictionTask knowledgeEventUsingPredictions:familyRelations:](self, "knowledgeEventUsingPredictions:familyRelations:", v14, v13, v18, v19, v20, v21, v22, v23);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v7[2](v11) & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0D15A50], "knowledgeStore");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v33[0] = v15;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "saveObjects:tracker:responseQueue:withCompletion:", v17, &__block_literal_global_16, 0, &__block_literal_global_16_1);

      }
    }

    _Block_object_dispose(&v27, 8);
  }

}

- (id)contactKeysToFetch
{
  void *v2;
  id v3;
  id *v4;
  void *v5;
  id v6;
  id *v7;
  void *v8;
  id v9;
  id *v10;
  void *v11;
  id v12;
  id *v13;
  void *v14;
  id v15;
  id *v16;
  void *v17;
  id v18;
  id *v19;
  void *v20;
  id *v21;
  void *v22;
  id v23;
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
  void *v43;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD v59[12];
  id v60;
  void *v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v55 = 0;
  v56 = &v55;
  v57 = 0x2050000000;
  v2 = (void *)getCNContactFormatterClass_softClass_1;
  v58 = getCNContactFormatterClass_softClass_1;
  if (!getCNContactFormatterClass_softClass_1)
  {
    v50 = MEMORY[0x1E0C809B0];
    v51 = 3221225472;
    v52 = (uint64_t)__getCNContactFormatterClass_block_invoke_1;
    v53 = &unk_1E43FEA00;
    v54 = &v55;
    __getCNContactFormatterClass_block_invoke_1((uint64_t)&v50);
    v2 = (void *)v56[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v55, 8);
  objc_msgSend(v3, "descriptorForRequiredKeysForStyle:", 0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0;
  v51 = (uint64_t)&v50;
  v52 = 0x2020000000;
  v4 = (id *)getCNContactIdentifierKeySymbolLoc_ptr_4;
  v53 = (void *)getCNContactIdentifierKeySymbolLoc_ptr_4;
  if (!getCNContactIdentifierKeySymbolLoc_ptr_4)
  {
    v5 = (void *)ContactsLibrary_3();
    v4 = (id *)dlsym(v5, "CNContactIdentifierKey");
    *(_QWORD *)(v51 + 24) = v4;
    getCNContactIdentifierKeySymbolLoc_ptr_4 = (uint64_t)v4;
  }
  _Block_object_dispose(&v50, 8);
  if (!v4)
    goto LABEL_43;
  v6 = *v4;
  v59[0] = v6;
  v50 = 0;
  v51 = (uint64_t)&v50;
  v52 = 0x2020000000;
  v7 = (id *)getCNContactBirthdayKeySymbolLoc_ptr;
  v53 = (void *)getCNContactBirthdayKeySymbolLoc_ptr;
  if (!getCNContactBirthdayKeySymbolLoc_ptr)
  {
    v8 = (void *)ContactsLibrary_3();
    v7 = (id *)dlsym(v8, "CNContactBirthdayKey");
    *(_QWORD *)(v51 + 24) = v7;
    getCNContactBirthdayKeySymbolLoc_ptr = (uint64_t)v7;
  }
  _Block_object_dispose(&v50, 8);
  if (!v7)
    goto LABEL_43;
  v9 = *v7;
  v59[1] = v9;
  v50 = 0;
  v51 = (uint64_t)&v50;
  v52 = 0x2020000000;
  v10 = (id *)getCNContactNamePrefixKeySymbolLoc_ptr_0;
  v53 = (void *)getCNContactNamePrefixKeySymbolLoc_ptr_0;
  if (!getCNContactNamePrefixKeySymbolLoc_ptr_0)
  {
    v11 = (void *)ContactsLibrary_3();
    v10 = (id *)dlsym(v11, "CNContactNamePrefixKey");
    *(_QWORD *)(v51 + 24) = v10;
    getCNContactNamePrefixKeySymbolLoc_ptr_0 = (uint64_t)v10;
  }
  _Block_object_dispose(&v50, 8);
  if (!v10)
    goto LABEL_43;
  v12 = *v10;
  v59[2] = v12;
  v50 = 0;
  v51 = (uint64_t)&v50;
  v52 = 0x2020000000;
  v13 = (id *)getCNContactGivenNameKeySymbolLoc_ptr_1;
  v53 = (void *)getCNContactGivenNameKeySymbolLoc_ptr_1;
  if (!getCNContactGivenNameKeySymbolLoc_ptr_1)
  {
    v14 = (void *)ContactsLibrary_3();
    v13 = (id *)dlsym(v14, "CNContactGivenNameKey");
    *(_QWORD *)(v51 + 24) = v13;
    getCNContactGivenNameKeySymbolLoc_ptr_1 = (uint64_t)v13;
  }
  _Block_object_dispose(&v50, 8);
  if (!v13)
    goto LABEL_43;
  v15 = *v13;
  v59[3] = v15;
  v50 = 0;
  v51 = (uint64_t)&v50;
  v52 = 0x2020000000;
  v16 = (id *)getCNContactMiddleNameKeySymbolLoc_ptr_1;
  v53 = (void *)getCNContactMiddleNameKeySymbolLoc_ptr_1;
  if (!getCNContactMiddleNameKeySymbolLoc_ptr_1)
  {
    v17 = (void *)ContactsLibrary_3();
    v16 = (id *)dlsym(v17, "CNContactMiddleNameKey");
    *(_QWORD *)(v51 + 24) = v16;
    getCNContactMiddleNameKeySymbolLoc_ptr_1 = (uint64_t)v16;
  }
  _Block_object_dispose(&v50, 8);
  if (!v16)
    goto LABEL_43;
  v18 = *v16;
  v59[4] = v18;
  v50 = 0;
  v51 = (uint64_t)&v50;
  v52 = 0x2020000000;
  v19 = (id *)getCNContactFamilyNameKeySymbolLoc_ptr_1;
  v53 = (void *)getCNContactFamilyNameKeySymbolLoc_ptr_1;
  if (!getCNContactFamilyNameKeySymbolLoc_ptr_1)
  {
    v20 = (void *)ContactsLibrary_3();
    v19 = (id *)dlsym(v20, "CNContactFamilyNameKey");
    *(_QWORD *)(v51 + 24) = v19;
    getCNContactFamilyNameKeySymbolLoc_ptr_1 = (uint64_t)v19;
  }
  _Block_object_dispose(&v50, 8);
  if (!v19)
    goto LABEL_43;
  v48 = *v19;
  v59[5] = v48;
  v50 = 0;
  v51 = (uint64_t)&v50;
  v52 = 0x2020000000;
  v21 = (id *)getCNContactPreviousFamilyNameKeySymbolLoc_ptr_0;
  v53 = (void *)getCNContactPreviousFamilyNameKeySymbolLoc_ptr_0;
  if (!getCNContactPreviousFamilyNameKeySymbolLoc_ptr_0)
  {
    v22 = (void *)ContactsLibrary_3();
    v21 = (id *)dlsym(v22, "CNContactPreviousFamilyNameKey");
    *(_QWORD *)(v51 + 24) = v21;
    getCNContactPreviousFamilyNameKeySymbolLoc_ptr_0 = (uint64_t)v21;
  }
  _Block_object_dispose(&v50, 8);
  if (!v21)
    goto LABEL_43;
  v23 = *v21;
  v59[6] = v23;
  v50 = 0;
  v51 = (uint64_t)&v50;
  v52 = 0x2020000000;
  v24 = (id *)getCNContactNameSuffixKeySymbolLoc_ptr_0;
  v53 = (void *)getCNContactNameSuffixKeySymbolLoc_ptr_0;
  if (!getCNContactNameSuffixKeySymbolLoc_ptr_0)
  {
    v25 = (void *)ContactsLibrary_3();
    v24 = (id *)dlsym(v25, "CNContactNameSuffixKey");
    *(_QWORD *)(v51 + 24) = v24;
    getCNContactNameSuffixKeySymbolLoc_ptr_0 = (uint64_t)v24;
  }
  _Block_object_dispose(&v50, 8);
  if (!v24)
    goto LABEL_43;
  v26 = *v24;
  v59[7] = v26;
  v50 = 0;
  v51 = (uint64_t)&v50;
  v52 = 0x2020000000;
  v27 = (id *)getCNContactNicknameKeySymbolLoc_ptr_1;
  v53 = (void *)getCNContactNicknameKeySymbolLoc_ptr_1;
  if (!getCNContactNicknameKeySymbolLoc_ptr_1)
  {
    v28 = (void *)ContactsLibrary_3();
    v27 = (id *)dlsym(v28, "CNContactNicknameKey");
    *(_QWORD *)(v51 + 24) = v27;
    getCNContactNicknameKeySymbolLoc_ptr_1 = (uint64_t)v27;
  }
  _Block_object_dispose(&v50, 8);
  if (!v27)
    goto LABEL_43;
  v29 = *v27;
  v59[8] = v29;
  v50 = 0;
  v51 = (uint64_t)&v50;
  v52 = 0x2020000000;
  v30 = (id *)getCNContactTypeKeySymbolLoc_ptr_0;
  v53 = (void *)getCNContactTypeKeySymbolLoc_ptr_0;
  if (!getCNContactTypeKeySymbolLoc_ptr_0)
  {
    v31 = (void *)ContactsLibrary_3();
    v30 = (id *)dlsym(v31, "CNContactTypeKey");
    *(_QWORD *)(v51 + 24) = v30;
    getCNContactTypeKeySymbolLoc_ptr_0 = (uint64_t)v30;
  }
  _Block_object_dispose(&v50, 8);
  if (!v30)
    goto LABEL_43;
  v46 = v9;
  v47 = v12;
  v45 = v6;
  v32 = *v30;
  v59[9] = v32;
  v50 = 0;
  v51 = (uint64_t)&v50;
  v52 = 0x2020000000;
  v33 = (id *)getCNContactRelationsKeySymbolLoc_ptr_1;
  v53 = (void *)getCNContactRelationsKeySymbolLoc_ptr_1;
  if (!getCNContactRelationsKeySymbolLoc_ptr_1)
  {
    v34 = (void *)ContactsLibrary_3();
    v33 = (id *)dlsym(v34, "CNContactRelationsKey");
    *(_QWORD *)(v51 + 24) = v33;
    getCNContactRelationsKeySymbolLoc_ptr_1 = (uint64_t)v33;
  }
  _Block_object_dispose(&v50, 8);
  if (!v33)
    goto LABEL_43;
  v35 = *v33;
  v59[10] = v35;
  v50 = 0;
  v51 = (uint64_t)&v50;
  v52 = 0x2020000000;
  v36 = (id *)getCNContactPhoneNumbersKeySymbolLoc_ptr_2;
  v53 = (void *)getCNContactPhoneNumbersKeySymbolLoc_ptr_2;
  if (!getCNContactPhoneNumbersKeySymbolLoc_ptr_2)
  {
    v37 = (void *)ContactsLibrary_3();
    v36 = (id *)dlsym(v37, "CNContactPhoneNumbersKey");
    *(_QWORD *)(v51 + 24) = v36;
    getCNContactPhoneNumbersKeySymbolLoc_ptr_2 = (uint64_t)v36;
  }
  _Block_object_dispose(&v50, 8);
  if (!v36)
    goto LABEL_43;
  v38 = *v36;
  v59[11] = v38;
  v50 = 0;
  v51 = (uint64_t)&v50;
  v52 = 0x2020000000;
  v39 = (id *)getCNContactEmailAddressesKeySymbolLoc_ptr_2;
  v53 = (void *)getCNContactEmailAddressesKeySymbolLoc_ptr_2;
  if (!getCNContactEmailAddressesKeySymbolLoc_ptr_2)
  {
    v40 = (void *)ContactsLibrary_3();
    v39 = (id *)dlsym(v40, "CNContactEmailAddressesKey");
    *(_QWORD *)(v51 + 24) = v39;
    getCNContactEmailAddressesKeySymbolLoc_ptr_2 = (uint64_t)v39;
  }
  _Block_object_dispose(&v50, 8);
  if (!v39)
  {
LABEL_43:
    -[_PSBlockedHandlesCache beginSyncingWithTU].cold.1();
    __break(1u);
  }
  v60 = *v39;
  v61 = v49;
  v41 = (void *)MEMORY[0x1E0C99D20];
  v42 = v60;
  objc_msgSend(v41, "arrayWithObjects:count:", v59, 14);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  return v43;
}

- (void)enumerateContactsInContactStoreUsingBlock:(id)a3
{
  id v4;
  void *v5;
  objc_class *v6;
  id v7;
  void *v8;
  objc_class *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  Class (*v15)(uint64_t);
  void *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v4 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2050000000;
  v5 = (void *)getCNContactStoreClass_softClass_3;
  v21 = getCNContactStoreClass_softClass_3;
  if (!getCNContactStoreClass_softClass_3)
  {
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __getCNContactStoreClass_block_invoke_3;
    v16 = &unk_1E43FEA00;
    v17 = &v18;
    __getCNContactStoreClass_block_invoke_3((uint64_t)&v13);
    v5 = (void *)v19[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v18, 8);
  v7 = objc_alloc_init(v6);
  v18 = 0;
  v19 = &v18;
  v20 = 0x2050000000;
  v8 = (void *)getCNContactFetchRequestClass_softClass_1;
  v21 = getCNContactFetchRequestClass_softClass_1;
  if (!getCNContactFetchRequestClass_softClass_1)
  {
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __getCNContactFetchRequestClass_block_invoke_1;
    v16 = &unk_1E43FEA00;
    v17 = &v18;
    __getCNContactFetchRequestClass_block_invoke_1((uint64_t)&v13);
    v8 = (void *)v19[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v18, 8);
  v10 = [v9 alloc];
  -[_PSFamilyMLPredictionTask contactKeysToFetch](self, "contactKeysToFetch");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithKeysToFetch:", v11);

  objc_msgSend(v12, "setContactBatchCount:", 25);
  objc_msgSend(v7, "enumerateContactsWithFetchRequest:error:usingBlock:", v12, 0, v4);

}

- (id)knowledgeEventUsingPredictions:(id)a3 familyRelations:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  void *v36;
  void *v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_new();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v33 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_1E442CFE8, *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i));
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v39, 16);
    }
    while (v11);
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v14 = v5;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v29;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v29 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * j);
        objc_msgSend(v8, "objectForKeyedSubscript:", v19, (_QWORD)v28);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v20)
        {
          objc_msgSend(v14, "objectForKeyedSubscript:", v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v21, v19);

        }
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
    }
    while (v16);
  }

  v22 = (void *)MEMORY[0x1E0D159F8];
  objc_msgSend(MEMORY[0x1E0D15AF8], "familyPredictionStream");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15A20], "suggestions");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v24;
  v37 = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "eventWithStream:source:startDate:endDate:identifierStringValue:metadata:", v23, 0, v7, v7, CFSTR("familyPrediction"), v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (_DKKnowledgeQuerying)knowledgeStore
{
  return self->_knowledgeStore;
}

- (void)setKnowledgeStore:(id)a3
{
  objc_storeStrong((id *)&self->_knowledgeStore, a3);
}

- (NSString)directory
{
  return self->_directory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directory, 0);
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
}

@end
