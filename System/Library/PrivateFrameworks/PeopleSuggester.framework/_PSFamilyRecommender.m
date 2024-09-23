@implementation _PSFamilyRecommender

- (_PSFamilyRecommender)init
{
  _PSFamilyRecommender *v2;
  _PSFamilyRecommender *v3;
  NSObject *v4;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_PSFamilyRecommender;
  v2 = -[_PSFamilyRecommender init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_UTILITY, -15);
    v5 = objc_claimAutoreleasedReturnValue();

    v6 = dispatch_queue_create("com.apple.PeopleSuggester.familyrecommender-task-queue", v5);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v6;

  }
  return v3;
}

- (_CDInteractionStore)interactionStore
{
  os_unfair_lock_s *p_lock;
  _CDInteractionStore *interactionStore;
  void *v5;
  void *v6;
  _CDInteractionStore *v7;
  _CDInteractionStore *v8;
  _CDInteractionStore *v9;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  interactionStore = self->_interactionStore;
  if (!interactionStore)
  {
    v5 = (void *)MEMORY[0x1E0D158E0];
    objc_msgSend(MEMORY[0x1E0D158E0], "defaultDatabaseDirectory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "storeWithDirectory:readOnly:", v6, 1);
    v7 = (_CDInteractionStore *)objc_claimAutoreleasedReturnValue();
    v8 = self->_interactionStore;
    self->_interactionStore = v7;

    interactionStore = self->_interactionStore;
  }
  v9 = interactionStore;
  os_unfair_lock_unlock(p_lock);
  return v9;
}

- (CNContactStore)contactStore
{
  os_unfair_lock_s *p_lock;
  CNContactStore *contactStore;
  void *v5;
  objc_class *v6;
  CNContactStore *v7;
  CNContactStore *v8;
  CNContactStore *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  contactStore = self->_contactStore;
  if (!contactStore)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2050000000;
    v5 = (void *)getCNContactStoreClass_softClass_1;
    v15 = getCNContactStoreClass_softClass_1;
    if (!getCNContactStoreClass_softClass_1)
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __getCNContactStoreClass_block_invoke_1;
      v11[3] = &unk_1E43FEA00;
      v11[4] = &v12;
      __getCNContactStoreClass_block_invoke_1((uint64_t)v11);
      v5 = (void *)v13[3];
    }
    v6 = objc_retainAutorelease(v5);
    _Block_object_dispose(&v12, 8);
    v7 = (CNContactStore *)objc_alloc_init(v6);
    v8 = self->_contactStore;
    self->_contactStore = v7;

    contactStore = self->_contactStore;
  }
  v9 = contactStore;
  os_unfair_lock_unlock(p_lock);
  return v9;
}

- (HKMedicalIDStore)medicalIDStore
{
  os_unfair_lock_s *p_lock;
  HKMedicalIDStore *medicalIDStore;
  void *v5;
  objc_class *v6;
  id v7;
  void *v8;
  objc_class *v9;
  id v10;
  HKMedicalIDStore *v11;
  HKMedicalIDStore *v12;
  HKMedicalIDStore *v13;
  uint64_t v15;
  uint64_t v16;
  Class (*v17)(uint64_t);
  void *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  medicalIDStore = self->_medicalIDStore;
  if (!medicalIDStore)
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x2050000000;
    v5 = (void *)getHKMedicalIDStoreClass_softClass;
    v23 = getHKMedicalIDStoreClass_softClass;
    if (!getHKMedicalIDStoreClass_softClass)
    {
      v15 = MEMORY[0x1E0C809B0];
      v16 = 3221225472;
      v17 = __getHKMedicalIDStoreClass_block_invoke;
      v18 = &unk_1E43FEA00;
      v19 = &v20;
      __getHKMedicalIDStoreClass_block_invoke((uint64_t)&v15);
      v5 = (void *)v21[3];
    }
    v6 = objc_retainAutorelease(v5);
    _Block_object_dispose(&v20, 8);
    v7 = [v6 alloc];
    v20 = 0;
    v21 = &v20;
    v22 = 0x2050000000;
    v8 = (void *)getHKHealthStoreClass_softClass;
    v23 = getHKHealthStoreClass_softClass;
    if (!getHKHealthStoreClass_softClass)
    {
      v15 = MEMORY[0x1E0C809B0];
      v16 = 3221225472;
      v17 = __getHKHealthStoreClass_block_invoke;
      v18 = &unk_1E43FEA00;
      v19 = &v20;
      __getHKHealthStoreClass_block_invoke((uint64_t)&v15);
      v8 = (void *)v21[3];
    }
    v9 = objc_retainAutorelease(v8);
    _Block_object_dispose(&v20, 8);
    v10 = objc_alloc_init(v9);
    v11 = (HKMedicalIDStore *)objc_msgSend(v7, "initWithHealthStore:", v10);
    v12 = self->_medicalIDStore;
    self->_medicalIDStore = v11;

    medicalIDStore = self->_medicalIDStore;
  }
  v13 = medicalIDStore;
  os_unfair_lock_unlock(p_lock);
  return v13;
}

- (_PSContactResolver)contactResolver
{
  os_unfair_lock_s *p_lock;
  _PSContactResolver *contactResolver;
  _PSContactResolver *v5;
  _PSContactResolver *v6;
  _PSContactResolver *v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  contactResolver = self->_contactResolver;
  if (!contactResolver)
  {
    v5 = objc_alloc_init(_PSContactResolver);
    v6 = self->_contactResolver;
    self->_contactResolver = v5;

    contactResolver = self->_contactResolver;
  }
  v7 = contactResolver;
  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (id)contactKeysToFetch
{
  void *v2;
  id v3;
  id *v4;
  void *v5;
  id *v6;
  void *v7;
  id *v8;
  void *v9;
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
  id v21;
  id *v22;
  void *v23;
  id v24;
  id *v25;
  void *v26;
  id v27;
  id *v28;
  void *v29;
  id v30;
  id *v31;
  void *v32;
  id v33;
  id *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  id v40;
  id v41;
  id v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD v53[11];
  id v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v49 = 0;
  v50 = &v49;
  v51 = 0x2050000000;
  v2 = (void *)getCNContactFormatterClass_softClass_0;
  v52 = getCNContactFormatterClass_softClass_0;
  if (!getCNContactFormatterClass_softClass_0)
  {
    v44 = MEMORY[0x1E0C809B0];
    v45 = 3221225472;
    v46 = (uint64_t)__getCNContactFormatterClass_block_invoke_0;
    v47 = &unk_1E43FEA00;
    v48 = &v49;
    __getCNContactFormatterClass_block_invoke_0((uint64_t)&v44);
    v2 = (void *)v50[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v49, 8);
  objc_msgSend(v3, "descriptorForRequiredKeysForStyle:", 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0;
  v45 = (uint64_t)&v44;
  v46 = 0x2020000000;
  v4 = (id *)getCNContactIdentifierKeySymbolLoc_ptr_1;
  v47 = (void *)getCNContactIdentifierKeySymbolLoc_ptr_1;
  if (!getCNContactIdentifierKeySymbolLoc_ptr_1)
  {
    v5 = (void *)ContactsLibrary_0();
    v4 = (id *)dlsym(v5, "CNContactIdentifierKey");
    *(_QWORD *)(v45 + 24) = v4;
    getCNContactIdentifierKeySymbolLoc_ptr_1 = (uint64_t)v4;
  }
  _Block_object_dispose(&v44, 8);
  if (!v4)
    goto LABEL_40;
  v42 = *v4;
  v53[0] = v42;
  v44 = 0;
  v45 = (uint64_t)&v44;
  v46 = 0x2020000000;
  v6 = (id *)getCNContactNamePrefixKeySymbolLoc_ptr;
  v47 = (void *)getCNContactNamePrefixKeySymbolLoc_ptr;
  if (!getCNContactNamePrefixKeySymbolLoc_ptr)
  {
    v7 = (void *)ContactsLibrary_0();
    v6 = (id *)dlsym(v7, "CNContactNamePrefixKey");
    *(_QWORD *)(v45 + 24) = v6;
    getCNContactNamePrefixKeySymbolLoc_ptr = (uint64_t)v6;
  }
  _Block_object_dispose(&v44, 8);
  if (!v6)
    goto LABEL_40;
  v41 = *v6;
  v53[1] = v41;
  v44 = 0;
  v45 = (uint64_t)&v44;
  v46 = 0x2020000000;
  v8 = (id *)getCNContactGivenNameKeySymbolLoc_ptr_0;
  v47 = (void *)getCNContactGivenNameKeySymbolLoc_ptr_0;
  if (!getCNContactGivenNameKeySymbolLoc_ptr_0)
  {
    v9 = (void *)ContactsLibrary_0();
    v8 = (id *)dlsym(v9, "CNContactGivenNameKey");
    *(_QWORD *)(v45 + 24) = v8;
    getCNContactGivenNameKeySymbolLoc_ptr_0 = (uint64_t)v8;
  }
  _Block_object_dispose(&v44, 8);
  if (!v8)
    goto LABEL_40;
  v40 = *v8;
  v53[2] = v40;
  v44 = 0;
  v45 = (uint64_t)&v44;
  v46 = 0x2020000000;
  v10 = (id *)getCNContactMiddleNameKeySymbolLoc_ptr_0;
  v47 = (void *)getCNContactMiddleNameKeySymbolLoc_ptr_0;
  if (!getCNContactMiddleNameKeySymbolLoc_ptr_0)
  {
    v11 = (void *)ContactsLibrary_0();
    v10 = (id *)dlsym(v11, "CNContactMiddleNameKey");
    *(_QWORD *)(v45 + 24) = v10;
    getCNContactMiddleNameKeySymbolLoc_ptr_0 = (uint64_t)v10;
  }
  _Block_object_dispose(&v44, 8);
  if (!v10)
    goto LABEL_40;
  v12 = *v10;
  v53[3] = v12;
  v44 = 0;
  v45 = (uint64_t)&v44;
  v46 = 0x2020000000;
  v13 = (id *)getCNContactFamilyNameKeySymbolLoc_ptr_0;
  v47 = (void *)getCNContactFamilyNameKeySymbolLoc_ptr_0;
  if (!getCNContactFamilyNameKeySymbolLoc_ptr_0)
  {
    v14 = (void *)ContactsLibrary_0();
    v13 = (id *)dlsym(v14, "CNContactFamilyNameKey");
    *(_QWORD *)(v45 + 24) = v13;
    getCNContactFamilyNameKeySymbolLoc_ptr_0 = (uint64_t)v13;
  }
  _Block_object_dispose(&v44, 8);
  if (!v13)
    goto LABEL_40;
  v15 = *v13;
  v53[4] = v15;
  v44 = 0;
  v45 = (uint64_t)&v44;
  v46 = 0x2020000000;
  v16 = (id *)getCNContactPreviousFamilyNameKeySymbolLoc_ptr;
  v47 = (void *)getCNContactPreviousFamilyNameKeySymbolLoc_ptr;
  if (!getCNContactPreviousFamilyNameKeySymbolLoc_ptr)
  {
    v17 = (void *)ContactsLibrary_0();
    v16 = (id *)dlsym(v17, "CNContactPreviousFamilyNameKey");
    *(_QWORD *)(v45 + 24) = v16;
    getCNContactPreviousFamilyNameKeySymbolLoc_ptr = (uint64_t)v16;
  }
  _Block_object_dispose(&v44, 8);
  if (!v16)
    goto LABEL_40;
  v18 = *v16;
  v53[5] = v18;
  v44 = 0;
  v45 = (uint64_t)&v44;
  v46 = 0x2020000000;
  v19 = (id *)getCNContactNameSuffixKeySymbolLoc_ptr;
  v47 = (void *)getCNContactNameSuffixKeySymbolLoc_ptr;
  if (!getCNContactNameSuffixKeySymbolLoc_ptr)
  {
    v20 = (void *)ContactsLibrary_0();
    v19 = (id *)dlsym(v20, "CNContactNameSuffixKey");
    *(_QWORD *)(v45 + 24) = v19;
    getCNContactNameSuffixKeySymbolLoc_ptr = (uint64_t)v19;
  }
  _Block_object_dispose(&v44, 8);
  if (!v19)
    goto LABEL_40;
  v21 = *v19;
  v53[6] = v21;
  v44 = 0;
  v45 = (uint64_t)&v44;
  v46 = 0x2020000000;
  v22 = (id *)getCNContactNicknameKeySymbolLoc_ptr_0;
  v47 = (void *)getCNContactNicknameKeySymbolLoc_ptr_0;
  if (!getCNContactNicknameKeySymbolLoc_ptr_0)
  {
    v23 = (void *)ContactsLibrary_0();
    v22 = (id *)dlsym(v23, "CNContactNicknameKey");
    *(_QWORD *)(v45 + 24) = v22;
    getCNContactNicknameKeySymbolLoc_ptr_0 = (uint64_t)v22;
  }
  _Block_object_dispose(&v44, 8);
  if (!v22)
    goto LABEL_40;
  v24 = *v22;
  v53[7] = v24;
  v44 = 0;
  v45 = (uint64_t)&v44;
  v46 = 0x2020000000;
  v25 = (id *)getCNContactTypeKeySymbolLoc_ptr;
  v47 = (void *)getCNContactTypeKeySymbolLoc_ptr;
  if (!getCNContactTypeKeySymbolLoc_ptr)
  {
    v26 = (void *)ContactsLibrary_0();
    v25 = (id *)dlsym(v26, "CNContactTypeKey");
    *(_QWORD *)(v45 + 24) = v25;
    getCNContactTypeKeySymbolLoc_ptr = (uint64_t)v25;
  }
  _Block_object_dispose(&v44, 8);
  if (!v25)
    goto LABEL_40;
  v27 = *v25;
  v53[8] = v27;
  v44 = 0;
  v45 = (uint64_t)&v44;
  v46 = 0x2020000000;
  v28 = (id *)getCNContactRelationsKeySymbolLoc_ptr_0;
  v47 = (void *)getCNContactRelationsKeySymbolLoc_ptr_0;
  if (!getCNContactRelationsKeySymbolLoc_ptr_0)
  {
    v29 = (void *)ContactsLibrary_0();
    v28 = (id *)dlsym(v29, "CNContactRelationsKey");
    *(_QWORD *)(v45 + 24) = v28;
    getCNContactRelationsKeySymbolLoc_ptr_0 = (uint64_t)v28;
  }
  _Block_object_dispose(&v44, 8);
  if (!v28)
    goto LABEL_40;
  v30 = *v28;
  v53[9] = v30;
  v44 = 0;
  v45 = (uint64_t)&v44;
  v46 = 0x2020000000;
  v31 = (id *)getCNContactPhoneNumbersKeySymbolLoc_ptr_0;
  v47 = (void *)getCNContactPhoneNumbersKeySymbolLoc_ptr_0;
  if (!getCNContactPhoneNumbersKeySymbolLoc_ptr_0)
  {
    v32 = (void *)ContactsLibrary_0();
    v31 = (id *)dlsym(v32, "CNContactPhoneNumbersKey");
    *(_QWORD *)(v45 + 24) = v31;
    getCNContactPhoneNumbersKeySymbolLoc_ptr_0 = (uint64_t)v31;
  }
  _Block_object_dispose(&v44, 8);
  if (!v31)
    goto LABEL_40;
  v33 = *v31;
  v53[10] = v33;
  v44 = 0;
  v45 = (uint64_t)&v44;
  v46 = 0x2020000000;
  v34 = (id *)getCNContactEmailAddressesKeySymbolLoc_ptr_0;
  v47 = (void *)getCNContactEmailAddressesKeySymbolLoc_ptr_0;
  if (!getCNContactEmailAddressesKeySymbolLoc_ptr_0)
  {
    v35 = (void *)ContactsLibrary_0();
    v34 = (id *)dlsym(v35, "CNContactEmailAddressesKey");
    *(_QWORD *)(v45 + 24) = v34;
    getCNContactEmailAddressesKeySymbolLoc_ptr_0 = (uint64_t)v34;
  }
  _Block_object_dispose(&v44, 8);
  if (!v34)
  {
LABEL_40:
    -[_PSBlockedHandlesCache beginSyncingWithTU].cold.1();
    __break(1u);
  }
  v54 = *v34;
  v55 = v43;
  v36 = (void *)MEMORY[0x1E0C99D20];
  v37 = v54;
  objc_msgSend(v36, "arrayWithObjects:count:", v53, 13);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  return v38;
}

- (id)nonFamilyRelations
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
  void *v22;
  id v23;
  void *v24;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[6];
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v2 = (id *)getCNLabelContactRelationManagerSymbolLoc_ptr;
  v29 = getCNLabelContactRelationManagerSymbolLoc_ptr;
  if (!getCNLabelContactRelationManagerSymbolLoc_ptr)
  {
    v3 = (void *)ContactsLibrary_0();
    v2 = (id *)dlsym(v3, "CNLabelContactRelationManager");
    v27[3] = (uint64_t)v2;
    getCNLabelContactRelationManagerSymbolLoc_ptr = (uint64_t)v2;
  }
  _Block_object_dispose(&v26, 8);
  if (!v2)
    goto LABEL_23;
  v4 = *v2;
  v30[0] = v4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v5 = (id *)getCNLabelContactRelationAssistantSymbolLoc_ptr;
  v29 = getCNLabelContactRelationAssistantSymbolLoc_ptr;
  if (!getCNLabelContactRelationAssistantSymbolLoc_ptr)
  {
    v6 = (void *)ContactsLibrary_0();
    v5 = (id *)dlsym(v6, "CNLabelContactRelationAssistant");
    v27[3] = (uint64_t)v5;
    getCNLabelContactRelationAssistantSymbolLoc_ptr = (uint64_t)v5;
  }
  _Block_object_dispose(&v26, 8);
  if (!v5)
    goto LABEL_23;
  v7 = *v5;
  v30[1] = v7;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v8 = (id *)getCNLabelContactRelationColleagueSymbolLoc_ptr;
  v29 = getCNLabelContactRelationColleagueSymbolLoc_ptr;
  if (!getCNLabelContactRelationColleagueSymbolLoc_ptr)
  {
    v9 = (void *)ContactsLibrary_0();
    v8 = (id *)dlsym(v9, "CNLabelContactRelationColleague");
    v27[3] = (uint64_t)v8;
    getCNLabelContactRelationColleagueSymbolLoc_ptr = (uint64_t)v8;
  }
  _Block_object_dispose(&v26, 8);
  if (!v8)
    goto LABEL_23;
  v10 = *v8;
  v30[2] = v10;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v11 = (id *)getCNLabelContactRelationTeacherSymbolLoc_ptr;
  v29 = getCNLabelContactRelationTeacherSymbolLoc_ptr;
  if (!getCNLabelContactRelationTeacherSymbolLoc_ptr)
  {
    v12 = (void *)ContactsLibrary_0();
    v11 = (id *)dlsym(v12, "CNLabelContactRelationTeacher");
    v27[3] = (uint64_t)v11;
    getCNLabelContactRelationTeacherSymbolLoc_ptr = (uint64_t)v11;
  }
  _Block_object_dispose(&v26, 8);
  if (!v11)
    goto LABEL_23;
  v13 = *v11;
  v30[3] = v13;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v14 = (id *)getCNLabelContactRelationFriendSymbolLoc_ptr;
  v29 = getCNLabelContactRelationFriendSymbolLoc_ptr;
  if (!getCNLabelContactRelationFriendSymbolLoc_ptr)
  {
    v15 = (void *)ContactsLibrary_0();
    v14 = (id *)dlsym(v15, "CNLabelContactRelationFriend");
    v27[3] = (uint64_t)v14;
    getCNLabelContactRelationFriendSymbolLoc_ptr = (uint64_t)v14;
  }
  _Block_object_dispose(&v26, 8);
  if (!v14)
    goto LABEL_23;
  v16 = *v14;
  v30[4] = v16;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v17 = (id *)getCNLabelContactRelationMaleFriendSymbolLoc_ptr;
  v29 = getCNLabelContactRelationMaleFriendSymbolLoc_ptr;
  if (!getCNLabelContactRelationMaleFriendSymbolLoc_ptr)
  {
    v18 = (void *)ContactsLibrary_0();
    v17 = (id *)dlsym(v18, "CNLabelContactRelationMaleFriend");
    v27[3] = (uint64_t)v17;
    getCNLabelContactRelationMaleFriendSymbolLoc_ptr = (uint64_t)v17;
  }
  _Block_object_dispose(&v26, 8);
  if (!v17)
    goto LABEL_23;
  v19 = *v17;
  v30[5] = v19;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v20 = (id *)getCNLabelContactRelationFemaleFriendSymbolLoc_ptr;
  v29 = getCNLabelContactRelationFemaleFriendSymbolLoc_ptr;
  if (!getCNLabelContactRelationFemaleFriendSymbolLoc_ptr)
  {
    v21 = (void *)ContactsLibrary_0();
    v20 = (id *)dlsym(v21, "CNLabelContactRelationFemaleFriend");
    v27[3] = (uint64_t)v20;
    getCNLabelContactRelationFemaleFriendSymbolLoc_ptr = (uint64_t)v20;
  }
  _Block_object_dispose(&v26, 8);
  if (!v20)
  {
LABEL_23:
    -[_PSBlockedHandlesCache beginSyncingWithTU].cold.1();
    __break(1u);
  }
  v31 = *v20;
  v22 = (void *)MEMORY[0x1E0C99D20];
  v23 = v31;
  objc_msgSend(v22, "arrayWithObjects:count:", v30, 7, v26);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (BOOL)regexMatchForRegex:(id)a3 string:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;

  if (!a4)
    return 0;
  v5 = a4;
  v6 = a3;
  v7 = objc_msgSend(v6, "numberOfMatchesInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length"));

  return v7 != 0;
}

- (id)fetchAllContactIdsFromContactStore:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  objc_class *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  __int128 buf;
  Class (*v27)(uint64_t);
  void *v28;
  uint64_t *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__3;
  v20 = __Block_byref_object_dispose__3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v23 = &v22;
  v24 = 0x2050000000;
  v5 = (void *)getCNContactFetchRequestClass_softClass;
  v25 = getCNContactFetchRequestClass_softClass;
  v6 = MEMORY[0x1E0C809B0];
  if (!getCNContactFetchRequestClass_softClass)
  {
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v27 = __getCNContactFetchRequestClass_block_invoke;
    v28 = &unk_1E43FEA00;
    v29 = &v22;
    __getCNContactFetchRequestClass_block_invoke((uint64_t)&buf);
    v5 = (void *)v23[3];
  }
  v7 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v22, 8);
  v8 = [v7 alloc];
  -[_PSFamilyRecommender contactKeysToFetch](self, "contactKeysToFetch");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithKeysToFetch:", v9);

  objc_msgSend(v10, "setContactBatchCount:", 25);
  v15[0] = v6;
  v15[1] = 3221225472;
  v15[2] = __59___PSFamilyRecommender_fetchAllContactIdsFromContactStore___block_invoke;
  v15[3] = &unk_1E43FF950;
  v15[4] = &v16;
  objc_msgSend(v4, "enumerateContactsWithFetchRequest:error:usingBlock:", v10, 0, v15);
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = objc_msgSend((id)v17[5], "count");
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = v12;
    _os_log_impl(&dword_1A07F4000, v11, OS_LOG_TYPE_INFO, "_PSFamilyRecommender: Fetched %tu contact ids from contact store", (uint8_t *)&buf, 0xCu);
  }

  objc_msgSend((id)v17[5], "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v16, 8);
  return v13;
}

- (id)relationshipRegularExpressionForRelationship
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v17;
  id obj;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  id v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  -[_PSFamilyRecommender personRelationshipVocabularyByLocaleDictionary](self, "personRelationshipVocabularyByLocaleDictionary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v2;
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
  if (v20)
  {
    v19 = *(_QWORD *)v28;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v28 != v19)
          objc_enumerationMutation(obj);
        v21 = v4;
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v4), "allValues");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
        if (v6)
        {
          v7 = v6;
          v8 = *(_QWORD *)v24;
          do
          {
            v9 = 0;
            do
            {
              if (*(_QWORD *)v24 != v8)
                objc_enumerationMutation(v5);
              v10 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v9), "_pas_componentsJoinedByString:", CFSTR("|"));
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "stringWithFormat:", CFSTR("^(%@)$"), v11);
              v12 = (void *)objc_claimAutoreleasedReturnValue();

              v22 = 0;
              objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", v12, 1, &v22);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = v22;
              if (v14)
              {
                +[_PSLogging familyRecommenderChannel](_PSLogging, "familyRecommenderChannel");
                v15 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v32 = v14;
                  _os_log_error_impl(&dword_1A07F4000, v15, OS_LOG_TYPE_ERROR, "Error making regex from relationship plist %@", buf, 0xCu);
                }

              }
              if (v13)
                objc_msgSend(v3, "addObject:", v13);

              ++v9;
            }
            while (v7 != v9);
            v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
          }
          while (v7);
        }

        v4 = v21 + 1;
      }
      while (v21 + 1 != v20);
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
    }
    while (v20);
  }

  return v3;
}

- (id)personRelationshipVocabularyByLocaleDictionary
{
  return +[_PSConfig vocab](_PSConfig, "vocab");
}

- (unint64_t)indexToInsertDate:(id)a3 array:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_msgSend(v5, "indexOfObject:inSortedRange:options:usingComparator:", v6, 0, objc_msgSend(v5, "count"), 1024, &__block_literal_global_7);

  return v7;
}

- (id)handleAndBundleIdDictionaryForFamilyRecipientContact:(id)a3 lookBackDays:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
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
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  void *v38;
  void *v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _QWORD v46[2];
  _QWORD v47[3];

  v47[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[_PSFamilyRecommender contactResolver](self, "contactResolver");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allEmailAndPhoneNumberHandlesForContact:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v6, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithObject:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[_PSConstants mobileMessagesBundleId](_PSConstants, "mobileMessagesBundleId");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (a4 == 56)
  {
    v47[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v46[0] = v12;
    +[_PSConstants mobileMailBundleId](_PSConstants, "mobileMailBundleId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v46[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[_PSFamilyRecommender interactionStore](self, "interactionStore");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSInteractionStoreUtils interactionsMatchingAnyHandlesOrContactIds:identifiers:account:directions:mechanisms:bundleIds:store:fetchLimit:messageInteractionCache:](_PSInteractionStoreUtils, "interactionsMatchingAnyHandlesOrContactIds:identifiers:account:directions:mechanisms:bundleIds:store:fetchLimit:messageInteractionCache:", v8, v11, 0, &unk_1E442C7F0, &unk_1E442C808, v14, v16, 1, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "firstObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "startDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", (double)(-86400 * a4));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "timeIntervalSinceDate:", v21);
  v23 = v22;

  if (v23 > 0.0)
  {
    v38 = v14;
    v39 = v11;
    v40 = v6;
    objc_msgSend(v17, "firstObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "recipients");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v26 = v25;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v42 != v29)
            objc_enumerationMutation(v26);
          v31 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          objc_msgSend(v31, "identifier");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v8, "containsObject:", v32);

          if (v33)
          {
            objc_msgSend(v31, "identifier");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setObject:forKeyedSubscript:", v34, CFSTR("handle"));

            objc_msgSend(v17, "firstObject");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "bundleId");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setObject:forKeyedSubscript:", v36, CFSTR("bundleId"));

          }
        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      }
      while (v28);
    }

    v11 = v39;
    v6 = v40;
    v14 = v38;
  }

  return v18;
}

- (id)currentFamily
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  id v6;
  NSObject *v7;
  dispatch_time_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v13[5];
  NSObject *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v22 = 0;
  v23 = &v22;
  v24 = 0x2050000000;
  v3 = (void *)getFAFetchFamilyCircleRequestClass_softClass;
  v25 = getFAFetchFamilyCircleRequestClass_softClass;
  v4 = MEMORY[0x1E0C809B0];
  if (!getFAFetchFamilyCircleRequestClass_softClass)
  {
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = (uint64_t)__getFAFetchFamilyCircleRequestClass_block_invoke;
    v19 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E43FEA00;
    v20 = (void (*)(uint64_t))&v22;
    __getFAFetchFamilyCircleRequestClass_block_invoke((uint64_t)&v16);
    v3 = (void *)v23[3];
  }
  v5 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v22, 8);
  v6 = objc_alloc_init(v5);
  v16 = 0;
  v17 = (uint64_t)&v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__3;
  v20 = __Block_byref_object_dispose__3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v13[0] = v4;
  v13[1] = 3221225472;
  v13[2] = __37___PSFamilyRecommender_currentFamily__block_invoke;
  v13[3] = &unk_1E43FF998;
  v13[4] = self;
  v15 = &v16;
  v7 = dispatch_semaphore_create(0);
  v14 = v7;
  objc_msgSend(v6, "startRequestWithCompletionHandler:", v13);
  v8 = dispatch_time(0, 60000000000);
  if (dispatch_semaphore_wait(v7, v8))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v9;

  }
  v11 = (void *)objc_msgSend(*(id *)(v17 + 40), "copy");

  _Block_object_dispose(&v16, 8);
  return v11;
}

- (id)currentFamilyExcludingMe:(id)a3
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
  void *v14;
  int v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_PSFamilyRecommender currentFamily](self, "currentFamily");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v11);
        objc_msgSend(v4, "identifier", (_QWORD)v17);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "isEqualToString:", v14);

        if (v15)
          objc_msgSend(v6, "removeObject:", v12);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  return v6;
}

- (id)familyRecommendations
{
  return -[_PSFamilyRecommender familyRecipientsForShareSheetWithPredictionContext:](self, "familyRecipientsForShareSheetWithPredictionContext:", 0);
}

- (id)familyRecipientsForShareSheetWithPredictionContext:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void (**v21)(_QWORD, _QWORD, _QWORD);
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  uint64_t v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  NSObject *v40;
  NSObject *v41;
  NSObject *v42;
  uint64_t v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  NSObject *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  NSObject *v63;
  NSObject *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  NSObject *v69;
  NSObject *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  void *v74;
  NSObject *v75;
  void *v76;
  NSObject *v77;
  NSObject *v78;
  uint64_t v79;
  void *v80;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  id v89;
  id v90;
  id v91;
  void *v92;
  void *v93;
  id v94;
  id v95;
  _QWORD v96[5];
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  _QWORD v102[4];
  id v103;
  id v104;
  id v105;
  id v106;
  void *v107;
  void *v108;
  uint8_t buf[4];
  uint64_t v110;
  uint64_t v111;

  v111 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[_PSLogging familyRecommenderChannel](_PSLogging, "familyRecommenderChannel");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "seedContactIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v110 = (uint64_t)v6;
    _os_log_impl(&dword_1A07F4000, v5, OS_LOG_TYPE_INFO, "Prediction context, seed contact identifiers %@", buf, 0xCu);

  }
  v93 = v4;

  -[_PSFamilyRecommender contactStore](self, "contactStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSFamilyRecommender contactKeysToFetch](self, "contactKeysToFetch");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = 0;
  objc_msgSend(v7, "_ios_meContactWithKeysToFetch:error:", v8, &v106);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v106;

  if (v10)
  {
    +[_PSLogging familyRecommenderChannel](_PSLogging, "familyRecommenderChannel");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[_PSFamilyRecommender familyRecipientsForShareSheetWithPredictionContext:].cold.2();

  }
  v82 = v10;
  -[_PSFamilyRecommender currentFamilyExcludingMe:](self, "currentFamilyExcludingMe:", v9);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "valueForKey:", CFSTR("identifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v102[0] = MEMORY[0x1E0C809B0];
  v102[1] = 3221225472;
  v102[2] = __75___PSFamilyRecommender_familyRecipientsForShareSheetWithPredictionContext___block_invoke;
  v102[3] = &unk_1E43FF9C0;
  v16 = v9;
  v103 = v16;
  v17 = v12;
  v104 = v17;
  v18 = v13;
  v105 = v18;
  v19 = (void *)MEMORY[0x1A1AFCBF8](v102);
  v96[0] = v15;
  v96[1] = 3221225472;
  v96[2] = __75___PSFamilyRecommender_familyRecipientsForShareSheetWithPredictionContext___block_invoke_2;
  v96[3] = &unk_1E43FF9E8;
  v96[4] = self;
  v94 = v16;
  v97 = v94;
  v91 = v17;
  v98 = v91;
  v89 = v19;
  v101 = v89;
  v20 = v14;
  v99 = v20;
  v90 = v18;
  v100 = v90;
  v21 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A1AFCBF8](v96);
  +[_PSLogging familyRecommenderChannel](_PSLogging, "familyRecommenderChannel");
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A07F4000, v22, OS_LOG_TYPE_INFO, "Calculating heuristics", buf, 2u);
  }

  -[_PSFamilyRecommender contactIdsFromContactRelationsUsingMe:](self, "contactIdsFromContactRelationsUsingMe:", v94);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v23, "copy");

  -[_PSFamilyRecommender contactIdsFromEmergencyContacts](self, "contactIdsFromEmergencyContacts");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v25, "copy");

  v27 = (void *)objc_opt_new();
  v88 = v24;
  objc_msgSend(v24, "allObjects");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addObjectsFromArray:", v28);

  v87 = v26;
  objc_msgSend(v26, "allObjects");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addObjectsFromArray:", v29);

  v86 = v27;
  objc_msgSend(v27, "allObjects");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, void *))v21)[2](v21, v30, &__block_literal_global_322);

  +[_PSLogging familyRecommenderChannel](_PSLogging, "familyRecommenderChannel");
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138477827;
    v110 = (uint64_t)v20;
    _os_log_impl(&dword_1A07F4000, v31, OS_LOG_TYPE_INFO, "Suggestions after heuristics %{private}@", buf, 0xCu);
  }

  +[_PSLogging familyRecommenderChannel](_PSLogging, "familyRecommenderChannel");
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    v33 = objc_msgSend(v20, "count");
    *(_DWORD *)buf = 134217984;
    v110 = v33;
    _os_log_impl(&dword_1A07F4000, v32, OS_LOG_TYPE_INFO, "Suggestions after heuristics %tu", buf, 0xCu);
  }

  +[_PSLogging familyRecommenderChannel](_PSLogging, "familyRecommenderChannel");
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A07F4000, v34, OS_LOG_TYPE_INFO, "Getting results from photos knowledge graph", buf, 2u);
  }

  +[_PSLogging familyRecommenderChannel](_PSLogging, "familyRecommenderChannel");
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v35))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A07F4000, v35, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSFamilyFetchPhotoRelationshipSuggestions", " enableTelemetry=YES ", buf, 2u);
  }

  +[_PSFamilyPhotoSuggestions photosRelationshipKnowledgeSuggestions](_PSFamilyPhotoSuggestions, "photosRelationshipKnowledgeSuggestions");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "allObjects");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, void *))v21)[2](v21, v36, &__block_literal_global_325);

  +[_PSLogging familyRecommenderChannel](_PSLogging, "familyRecommenderChannel");
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v37))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A07F4000, v37, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSFamilyFetchPhotoRelationshipSuggestions", (const char *)&unk_1A0908603, buf, 2u);
  }

  +[_PSLogging familyRecommenderChannel](_PSLogging, "familyRecommenderChannel");
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v38))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A07F4000, v38, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSFamilyFetchPhotoContactSuggestions", " enableTelemetry=YES ", buf, 2u);
  }

  +[_PSFamilyPhotoSuggestions photosContactsKnowledgeSuggestions](_PSFamilyPhotoSuggestions, "photosContactsKnowledgeSuggestions");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "allObjects");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, void *))v21)[2](v21, v39, &__block_literal_global_327);

  +[_PSLogging familyRecommenderChannel](_PSLogging, "familyRecommenderChannel");
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v40))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A07F4000, v40, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSFamilyFetchPhotoContactSuggestions", (const char *)&unk_1A0908603, buf, 2u);
  }

  +[_PSLogging familyRecommenderChannel](_PSLogging, "familyRecommenderChannel");
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138477827;
    v110 = (uint64_t)v20;
    _os_log_impl(&dword_1A07F4000, v41, OS_LOG_TYPE_INFO, "Suggestions after photos knowledge graph %{private}@", buf, 0xCu);
  }

  +[_PSLogging familyRecommenderChannel](_PSLogging, "familyRecommenderChannel");
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
  {
    v43 = objc_msgSend(v20, "count");
    *(_DWORD *)buf = 134217984;
    v110 = v43;
    _os_log_impl(&dword_1A07F4000, v42, OS_LOG_TYPE_INFO, "Suggestions after photos knowledge graph %tu", buf, 0xCu);
  }

  +[_PSLogging familyRecommenderChannel](_PSLogging, "familyRecommenderChannel");
  v44 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A07F4000, v44, OS_LOG_TYPE_INFO, "Getting suggestions from on device models", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D15A50], "knowledgeStore");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (void *)MEMORY[0x1E0D15A08];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15AF8], "familyPredictionStream");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = v48;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v108, 1);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = v50;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v107, 1);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "eventQueryWithPredicate:eventStreams:offset:limit:sortDescriptors:", v47, v49, 0, 1, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "_PSFamilyRecommender.m");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "stringByAppendingFormat:", CFSTR(":%d"), 465);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setClientName:", v54);

  objc_msgSend(v52, "setTracker:", &__block_literal_global_340);
  objc_msgSend(v52, "setExecuteConcurrently:", 1);

  v95 = 0;
  v83 = v45;
  objc_msgSend(v45, "executeQuery:error:", v52, &v95);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v95;
  if (v56)
  {
    +[_PSLogging familyRecommenderChannel](_PSLogging, "familyRecommenderChannel");
    v57 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      -[_PSFamilyRecommender familyRecipientsForShareSheetWithPredictionContext:].cold.1();

  }
  objc_msgSend(v55, "firstObject");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "metadata");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D15A20], "suggestions");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "objectForKeyedSubscript:", v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v61, "keysSortedByValueUsingComparator:", &__block_literal_global_345);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *))v21)[2](v21, v62, &__block_literal_global_347);

  }
  +[_PSLogging familyRecommenderChannel](_PSLogging, "familyRecommenderChannel");
  v63 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138477827;
    v110 = (uint64_t)v20;
    _os_log_impl(&dword_1A07F4000, v63, OS_LOG_TYPE_INFO, "Suggestions after on device models %{private}@", buf, 0xCu);
  }

  +[_PSLogging familyRecommenderChannel](_PSLogging, "familyRecommenderChannel");
  v64 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
  {
    v65 = objc_msgSend(v20, "count");
    *(_DWORD *)buf = 134217984;
    v110 = v65;
    _os_log_impl(&dword_1A07F4000, v64, OS_LOG_TYPE_INFO, "Suggestions after on device models %tu", buf, 0xCu);
  }

  -[_PSFamilyRecommender contactIdsFromContactNamesUsingMe:](self, "contactIdsFromContactNamesUsingMe:", v94);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = (void *)objc_msgSend(v66, "copy");

  objc_msgSend(v67, "allObjects");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, void *))v21)[2](v21, v68, &__block_literal_global_349);

  +[_PSLogging familyRecommenderChannel](_PSLogging, "familyRecommenderChannel");
  v69 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138477827;
    v110 = (uint64_t)v20;
    _os_log_impl(&dword_1A07F4000, v69, OS_LOG_TYPE_INFO, "Suggestions after contact name regex match %{private}@", buf, 0xCu);
  }

  +[_PSLogging familyRecommenderChannel](_PSLogging, "familyRecommenderChannel");
  v70 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
  {
    v71 = objc_msgSend(v20, "count");
    *(_DWORD *)buf = 134217984;
    v110 = v71;
    _os_log_impl(&dword_1A07F4000, v70, OS_LOG_TYPE_INFO, "Suggestions after contact name regex match %tu", buf, 0xCu);
  }

  objc_msgSend(v93, "seedContactIdentifiers");
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  if (v72)
  {
    -[_PSFamilyRecommender rerankFamilyRecipients:usingPredictionContext:](self, "rerankFamilyRecipients:usingPredictionContext:", v20, v93);
    v73 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v73 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v20);
  }
  v74 = (void *)v73;
  +[_PSLogging familyRecommenderChannel](_PSLogging, "familyRecommenderChannel");
  v75 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138477827;
    v110 = (uint64_t)v74;
    _os_log_impl(&dword_1A07F4000, v75, OS_LOG_TYPE_INFO, "Suggestions after family reranking %{private}@", buf, 0xCu);
  }

  v76 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E40]), "initWithArray:", v74);
  +[_PSLogging familyRecommenderChannel](_PSLogging, "familyRecommenderChannel");
  v77 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138477827;
    v110 = (uint64_t)v76;
    _os_log_impl(&dword_1A07F4000, v77, OS_LOG_TYPE_INFO, "Final results %{private}@", buf, 0xCu);
  }

  +[_PSLogging familyRecommenderChannel](_PSLogging, "familyRecommenderChannel");
  v78 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
  {
    v79 = objc_msgSend(v76, "count");
    *(_DWORD *)buf = 134217984;
    v110 = v79;
    _os_log_impl(&dword_1A07F4000, v78, OS_LOG_TYPE_INFO, "Final results %tu", buf, 0xCu);
  }

  objc_msgSend(v76, "array");
  v80 = (void *)objc_claimAutoreleasedReturnValue();

  return v80;
}

- (id)suggestionsForPhotosRelationshipsWithPredictionContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSFamilyRecommender contactStore](self, "contactStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSFamilyRecommender contactKeysToFetch](self, "contactKeysToFetch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_ios_meContactWithKeysToFetch:error:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[_PSFamilyRecommender currentFamilyExcludingMe:](self, "currentFamilyExcludingMe:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForKey:", CFSTR("identifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSFamilyPhotoSuggestions photosRelationshipKnowledgeSuggestions](_PSFamilyPhotoSuggestions, "photosRelationshipKnowledgeSuggestions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        -[_PSFamilyRecommender recipientFromFamilyContactId:familySuggestions:me:currentFamilyIds:](self, "recipientFromFamilyContactId:familySuggestions:me:currentFamilyIds:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v14), 0, v7, v9);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v15)
        {
          objc_msgSend(v15, "setPhotosInference:", 1);
          objc_msgSend(v16, "setFamilyHeuristic:", 0);
          objc_msgSend(v4, "addObject:", v16);
        }

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }
  -[_PSFamilyRecommender suggestionsFromRecipients:](self, "suggestionsFromRecipients:", v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)suggestionsForPhotosContactInferencesWithPredictionContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSFamilyRecommender contactStore](self, "contactStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSFamilyRecommender contactKeysToFetch](self, "contactKeysToFetch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_ios_meContactWithKeysToFetch:error:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[_PSFamilyRecommender currentFamilyExcludingMe:](self, "currentFamilyExcludingMe:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForKey:", CFSTR("identifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSFamilyPhotoSuggestions photosContactsKnowledgeSuggestions](_PSFamilyPhotoSuggestions, "photosContactsKnowledgeSuggestions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        -[_PSFamilyRecommender recipientFromFamilyContactId:familySuggestions:me:currentFamilyIds:](self, "recipientFromFamilyContactId:familySuggestions:me:currentFamilyIds:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v14), 0, v7, v9);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v15)
        {
          objc_msgSend(v15, "setPhotosInference:", 1);
          objc_msgSend(v16, "setFamilyHeuristic:", 0);
          objc_msgSend(v4, "addObject:", v16);
        }

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }
  -[_PSFamilyRecommender suggestionsFromRecipients:](self, "suggestionsFromRecipients:", v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)rerankFamilyRecipients:(id)a3 usingPredictionContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  _PSRecipient *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  id v31;
  uint64_t v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  char *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t k;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  char v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  void *v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t m;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  char v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t n;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v93;
  id v94;
  id obj;
  char *obja;
  void *v97;
  id v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  uint64_t v104;
  id v105;
  id v106;
  char *v107;
  id v108;
  void *v109;
  _PSFamilyRecommender *v110;
  uint64_t v111;
  id v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  id v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  _BYTE v149[128];
  _BYTE v150[128];
  _BYTE v151[128];
  _BYTE v152[128];
  _BYTE v153[128];
  _BYTE v154[128];
  uint8_t v155[128];
  uint8_t buf[4];
  id v157;
  _BYTE v158[128];
  uint64_t v159;

  v159 = *MEMORY[0x1E0C80C00];
  v94 = a3;
  v6 = a4;
  -[_PSFamilyRecommender contactStore](self, "contactStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = self;
  -[_PSFamilyRecommender contactKeysToFetch](self, "contactKeysToFetch");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_ios_meContactWithKeysToFetch:error:", v8, 0);
  v97 = (void *)objc_claimAutoreleasedReturnValue();

  v109 = (void *)objc_opt_new();
  v145 = 0u;
  v146 = 0u;
  v147 = 0u;
  v148 = 0u;
  v93 = v6;
  objc_msgSend(v6, "seedContactIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v145, v158, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v146;
    v114 = *(_QWORD *)v146;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        v15 = v12;
        if (*(_QWORD *)v146 != v13)
          objc_enumerationMutation(v9);
        v16 = *(_QWORD *)(*((_QWORD *)&v145 + 1) + 8 * i);
        -[_PSFamilyRecommender contactStore](v110, "contactStore");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[_PSFamilyRecommender contactKeysToFetch](v110, "contactKeysToFetch");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v144 = v12;
        objc_msgSend(v17, "unifiedContactWithIdentifier:keysToFetch:error:", v16, v18, &v144);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v144;

        if (v12)
        {
          +[_PSLogging familyRecommenderChannel](_PSLogging, "familyRecommenderChannel");
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v157 = v12;
            _os_log_error_impl(&dword_1A07F4000, v20, OS_LOG_TYPE_ERROR, "Error querying contacts %@ while resolving seeded contact Ids", buf, 0xCu);
          }
        }
        else
        {
          v21 = [_PSRecipient alloc];
          objc_msgSend(v19, "identifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = -[_PSRecipient initWithIdentifier:handle:contact:](v21, "initWithIdentifier:handle:contact:", v22, 0, v19);

          -[NSObject setFamilyHeuristic:](v20, "setFamilyHeuristic:", 0);
          -[NSObject setPhotosInference:](v20, "setPhotosInference:", 0);
          if (v20)
          {
            objc_msgSend(v97, "identifier");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "identifier");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v23, "isEqualToString:", v24);

            if ((v25 & 1) == 0)
              objc_msgSend(v109, "addObject:", v20);
            v12 = 0;
            v13 = v114;
          }
        }

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v145, v158, 16);
    }
    while (v11);
  }
  else
  {
    v12 = 0;
  }

  v26 = v109;
  if (objc_msgSend(v109, "count"))
  {
    v27 = objc_msgSend(v109, "count");
    objc_msgSend(v93, "seedContactIdentifiers");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "count");

    if (v27 != v29)
    {
      +[_PSLogging familyRecommenderChannel](_PSLogging, "familyRecommenderChannel");
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A07F4000, v30, OS_LOG_TYPE_DEFAULT, "Dropped a few contact ids from seedContactIdentifiers since a recipient could not be generated", buf, 2u);
      }

    }
    v105 = v12;
    v98 = (id)objc_opt_new();
    v115 = (void *)objc_opt_new();
    v140 = 0u;
    v141 = 0u;
    v142 = 0u;
    v143 = 0u;
    v31 = v94;
    v106 = (id)objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v140, v155, 16);
    if (v106)
    {
      v99 = *(_QWORD *)v141;
      v102 = v31;
      do
      {
        v32 = 0;
        do
        {
          if (*(_QWORD *)v141 != v99)
            objc_enumerationMutation(v31);
          v111 = v32;
          v33 = *(void **)(*((_QWORD *)&v140 + 1) + 8 * v32);
          v136 = 0u;
          v137 = 0u;
          v138 = 0u;
          v139 = 0u;
          v34 = v109;
          v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v136, v154, 16);
          if (v35)
          {
            v36 = v35;
            v37 = *(_QWORD *)v137;
            do
            {
              for (j = 0; j != v36; ++j)
              {
                if (*(_QWORD *)v137 != v37)
                  objc_enumerationMutation(v34);
                v39 = *(void **)(*((_QWORD *)&v136 + 1) + 8 * j);
                objc_msgSend(v33, "contact");
                v40 = objc_claimAutoreleasedReturnValue();
                if (v40)
                {
                  v41 = (void *)v40;
                  objc_msgSend(v39, "contact");
                  v42 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v42)
                  {
                    objc_msgSend(v33, "contact");
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v43, "identifier");
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v39, "contact");
                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v45, "identifier");
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    v47 = objc_msgSend(v44, "isEqualToString:", v46);

                    if (v47)
                      objc_msgSend(v115, "addObject:", v33);
                  }
                }
              }
              v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v136, v154, 16);
            }
            while (v36);
          }

          v32 = v111 + 1;
          v31 = v102;
        }
        while ((id)(v111 + 1) != v106);
        v106 = (id)objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v140, v155, 16);
      }
      while (v106);
    }

    if (objc_msgSend(v115, "count"))
    {
      objc_msgSend(v98, "addObjectsFromArray:", v115);
      v134 = 0u;
      v135 = 0u;
      v132 = 0u;
      v133 = 0u;
      obj = v31;
      v12 = v105;
      v103 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v132, v153, 16);
      if (v103)
      {
        v100 = *(_QWORD *)v133;
        do
        {
          v48 = 0;
          do
          {
            if (*(_QWORD *)v133 != v100)
              objc_enumerationMutation(obj);
            v107 = v48;
            v49 = *(void **)(*((_QWORD *)&v132 + 1) + 8 * (_QWORD)v48);
            v128 = 0u;
            v129 = 0u;
            v130 = 0u;
            v131 = 0u;
            v112 = v109;
            v50 = objc_msgSend(v112, "countByEnumeratingWithState:objects:count:", &v128, v152, 16);
            if (v50)
            {
              v51 = v50;
              v52 = *(_QWORD *)v129;
              while (2)
              {
                for (k = 0; k != v51; ++k)
                {
                  if (*(_QWORD *)v129 != v52)
                    objc_enumerationMutation(v112);
                  v54 = *(void **)(*((_QWORD *)&v128 + 1) + 8 * k);
                  objc_msgSend(v49, "contact");
                  v55 = objc_claimAutoreleasedReturnValue();
                  if (v55)
                  {
                    v56 = (void *)v55;
                    objc_msgSend(v49, "contact");
                    v57 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v57, "identifier");
                    v58 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v54, "contact");
                    v59 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v59, "identifier");
                    v60 = (void *)objc_claimAutoreleasedReturnValue();
                    v61 = objc_msgSend(v58, "isEqualToString:", v60);

                    if ((v61 & 1) != 0)
                    {

                      goto LABEL_57;
                    }
                  }
                }
                v51 = objc_msgSend(v112, "countByEnumeratingWithState:objects:count:", &v128, v152, 16);
                if (v51)
                  continue;
                break;
              }
            }

            objc_msgSend(v98, "addObject:", v49);
LABEL_57:
            v12 = v105;
            v48 = v107 + 1;
          }
          while (v107 + 1 != (char *)v103);
          v103 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v132, v153, 16);
        }
        while (v103);
      }

      v62 = objc_msgSend(v115, "count");
      v63 = objc_msgSend(v115, "count");
      if (v63 >= objc_msgSend(v109, "count"))
        goto LABEL_88;
      v126 = 0u;
      v127 = 0u;
      v124 = 0u;
      v125 = 0u;
      v108 = v109;
      v104 = objc_msgSend(v108, "countByEnumeratingWithState:objects:count:", &v124, v151, 16);
      if (v104)
      {
        obja = (char *)(v62 + 1);
        v101 = *(_QWORD *)v125;
        do
        {
          v64 = 0;
          do
          {
            if (*(_QWORD *)v125 != v101)
              objc_enumerationMutation(v108);
            v113 = v64;
            v65 = *(void **)(*((_QWORD *)&v124 + 1) + 8 * v64);
            v120 = 0u;
            v121 = 0u;
            v122 = 0u;
            v123 = 0u;
            v66 = v115;
            v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v120, v150, 16);
            if (v67)
            {
              v68 = v67;
              v69 = *(_QWORD *)v121;
              while (2)
              {
                for (m = 0; m != v68; ++m)
                {
                  if (*(_QWORD *)v121 != v69)
                    objc_enumerationMutation(v66);
                  objc_msgSend(*(id *)(*((_QWORD *)&v120 + 1) + 8 * m), "contact");
                  v71 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v71, "identifier");
                  v72 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v65, "contact");
                  v73 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v73, "identifier");
                  v74 = (void *)objc_claimAutoreleasedReturnValue();
                  v75 = objc_msgSend(v72, "isEqualToString:", v74);

                  if ((v75 & 1) != 0)
                  {

                    v12 = v105;
                    goto LABEL_75;
                  }
                }
                v68 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v120, v150, 16);
                v12 = v105;
                if (v68)
                  continue;
                break;
              }
            }

            -[_PSFamilyRecommender contactResolver](v110, "contactResolver");
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "contact");
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v76, "allEmailAndPhoneNumberHandlesForContact:", v77);
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v78, "firstObject");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "setHandle:", v79);

            +[_PSConstants mobileMessagesBundleId](_PSConstants, "mobileMessagesBundleId");
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "setMostRecentTransportBundleId:", v80);

            objc_msgSend(v98, "insertObject:atIndex:", v65, obja++);
LABEL_75:
            v64 = v113 + 1;
          }
          while (v113 + 1 != v104);
          v104 = objc_msgSend(v108, "countByEnumeratingWithState:objects:count:", &v124, v151, 16);
        }
        while (v104);
      }
    }
    else
    {
      objc_msgSend(v98, "addObjectsFromArray:", v31);
      v118 = 0u;
      v119 = 0u;
      v116 = 0u;
      v117 = 0u;
      v108 = v115;
      v82 = objc_msgSend(v108, "countByEnumeratingWithState:objects:count:", &v116, v149, 16);
      if (v82)
      {
        v83 = v82;
        v84 = *(_QWORD *)v117;
        v85 = 2;
        do
        {
          for (n = 0; n != v83; ++n)
          {
            if (*(_QWORD *)v117 != v84)
              objc_enumerationMutation(v108);
            v87 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * n);
            -[_PSFamilyRecommender contactResolver](v110, "contactResolver");
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v87, "contact");
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v88, "allEmailAndPhoneNumberHandlesForContact:", v89);
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v90, "firstObject");
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v87, "setHandle:", v91);

            objc_msgSend(v98, "insertObject:atIndex:", v87, v85 + n);
          }
          v83 = objc_msgSend(v108, "countByEnumeratingWithState:objects:count:", &v116, v149, 16);
          v85 += n;
        }
        while (v83);
      }
      v12 = v105;
    }

LABEL_88:
    v81 = v94;
    v26 = v109;
    goto LABEL_89;
  }
  v81 = v94;
  v98 = v94;
LABEL_89:

  return v98;
}

- (id)suggestionsFromRecipients:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  void *v11;
  char v12;
  void *v13;
  _PSSuggestion *v14;
  _PSSuggestion *v15;
  uint64_t v16;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  _PSSuggestion *v22;
  void *v23;
  void *v24;
  _PSSuggestion *v25;
  _PSSuggestion *v26;
  uint64_t v27;
  BOOL v28;
  int v29;
  __CFString *v30;
  __CFString *v31;
  _PSSuggestion *v32;
  void *v33;
  uint64_t v35;
  uint64_t v36;
  _PSFamilyRecommender *v37;
  id v38;
  id obj;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  void *v44;
  void *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v38 = (id)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v41;
    v36 = *(_QWORD *)v41;
    v37 = self;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v41 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_msgSend(v9, "mostRecentTransportBundleId");
        v10 = objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = (void *)v10;
          v12 = objc_msgSend(v9, "photosInference");

          if ((v12 & 1) == 0)
          {
            v22 = [_PSSuggestion alloc];
            objc_msgSend(v9, "mostRecentTransportBundleId");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = v9;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v35) = 1;
            v14 = -[_PSSuggestion initWithBundleID:conversationIdentifier:groupName:recipients:derivedIntentIdentifier:image:reason:reasonType:score:familySuggestion:](v22, "initWithBundleID:conversationIdentifier:groupName:recipients:derivedIntentIdentifier:image:reason:reasonType:score:familySuggestion:", v23, 0, 0, v24, 0, 0, CFSTR("iCloudFamily - Model"), 0, 0, v35);

            objc_msgSend(v38, "addObject:", v14);
            goto LABEL_31;
          }
        }
        if ((objc_msgSend(v9, "familyHeuristic") & 1) != 0 || objc_msgSend(v9, "photosInference"))
        {
          objc_msgSend(v9, "contact");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[_PSFamilyRecommender handleAndBundleIdDictionaryForFamilyRecipientContact:lookBackDays:](self, "handleAndBundleIdDictionaryForFamilyRecipientContact:lookBackDays:", v13, 168);
          v14 = (_PSSuggestion *)objc_claimAutoreleasedReturnValue();

          -[_PSSuggestion objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", CFSTR("handle"));
          v15 = (_PSSuggestion *)objc_claimAutoreleasedReturnValue();
          -[_PSSuggestion objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", CFSTR("bundleId"));
          v16 = objc_claimAutoreleasedReturnValue();
          v17 = (void *)v16;
          if (v15)
            v18 = v16 == 0;
          else
            v18 = 1;
          if (!v18)
          {
            v25 = v15;
            goto LABEL_22;
          }
          -[_PSFamilyRecommender contactResolver](self, "contactResolver");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "contact");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "allEmailAndPhoneNumberHandlesForContact:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "firstObject");
          v25 = (_PSSuggestion *)objc_claimAutoreleasedReturnValue();

          if (!-[_PSSuggestion length](v25, "length"))
          {
            v26 = v25;
            v25 = v15;
            goto LABEL_29;
          }
          if (-[_PSSuggestion containsString:](v25, "containsString:", CFSTR("@")))
            +[_PSConstants mobileMailBundleId](_PSConstants, "mobileMailBundleId");
          else
            +[_PSConstants mobileMessagesBundleId](_PSConstants, "mobileMessagesBundleId");
          v27 = objc_claimAutoreleasedReturnValue();
          v7 = v36;
          self = v37;

          v17 = (void *)v27;
LABEL_22:
          if (v25)
            v28 = v17 == 0;
          else
            v28 = 1;
          if (!v28)
          {
            objc_msgSend(v9, "setHandle:", v25);
            v29 = objc_msgSend(v9, "familyHeuristic");
            v30 = CFSTR("iCloudFamily - PhotosInference");
            if (v29)
              v30 = CFSTR("iCloudFamily - Heuristic");
            v31 = v30;
            v32 = [_PSSuggestion alloc];
            v44 = v9;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v44, 1);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v35) = 1;
            v26 = -[_PSSuggestion initWithBundleID:conversationIdentifier:groupName:recipients:derivedIntentIdentifier:image:reason:reasonType:score:familySuggestion:](v32, "initWithBundleID:conversationIdentifier:groupName:recipients:derivedIntentIdentifier:image:reason:reasonType:score:familySuggestion:", v17, 0, 0, v33, 0, 0, v31, 0, 0, v35);

            objc_msgSend(v38, "addObject:", v26);
LABEL_29:

            v7 = v36;
            self = v37;
          }

LABEL_31:
          continue;
        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    }
    while (v6);
  }

  return v38;
}

- (id)familyRecommendationSuggestionsForShareSheetWithPredictionContext:(id)a3
{
  void *v4;
  void *v5;

  -[_PSFamilyRecommender familyRecipientsForShareSheetWithPredictionContext:](self, "familyRecipientsForShareSheetWithPredictionContext:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSFamilyRecommender suggestionsFromRecipients:](self, "suggestionsFromRecipients:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)recipientFromFamilyContactId:(id)a3 familySuggestions:(id)a4 me:(id)a5 currentFamilyIds:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  char v20;
  _PSRecipient *v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  _PSRecipient *v25;
  void *v26;
  _PSRecipient *v27;
  NSObject *v28;
  void *v29;
  double v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  _PSRecipient *v34;
  void *v35;
  _PSRecipient *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  _PSRecipient *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  _PSRecipient *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  char v52;
  id v54;
  void *v55;
  id v56;
  void *v57;
  int v58;
  void *v59;
  id v60;
  id v61;
  uint8_t buf[4];
  _PSRecipient *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_opt_new();
  -[_PSFamilyRecommender contactStore](self, "contactStore");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSFamilyRecommender contactKeysToFetch](self, "contactKeysToFetch");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = 0;
  objc_msgSend(v15, "unifiedContactWithIdentifier:keysToFetch:error:", v10, v16, &v61);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v61;

  if (!v17)
  {
    v60 = v18;
    +[_PSLogging familyRecommenderChannel](_PSLogging, "familyRecommenderChannel");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[_PSFamilyRecommender recipientFromFamilyContactId:familySuggestions:me:currentFamilyIds:].cold.1();
    v21 = 0;
    goto LABEL_35;
  }
  objc_msgSend(v17, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v13, "containsObject:", v19);

  if ((v20 & 1) == 0)
  {
    -[_PSFamilyRecommender handleAndBundleIdDictionaryForFamilyRecipientContact:lookBackDays:](self, "handleAndBundleIdDictionaryForFamilyRecipientContact:lookBackDays:", v17, 56);
    v23 = objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKeyedSubscript:](v23, "objectForKeyedSubscript:", CFSTR("handle"));
    v24 = objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKeyedSubscript:](v23, "objectForKeyedSubscript:", CFSTR("bundleId"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = (void *)v24;
    v60 = v18;
    if (v24)
    {
      if ((objc_msgSend(v14, "containsObject:", v24) & 1) == 0)
      {
        v25 = [_PSRecipient alloc];
        objc_msgSend(v17, "identifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = -[_PSRecipient initWithIdentifier:handle:contact:](v25, "initWithIdentifier:handle:contact:", v26, v59, v17);

        -[_PSRecipient setMostRecentTransportBundleId:](v27, "setMostRecentTransportBundleId:", v57);
        +[_PSLogging familyRecommenderChannel](_PSLogging, "familyRecommenderChannel");
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v63 = v27;
          _os_log_impl(&dword_1A07F4000, v28, OS_LOG_TYPE_INFO, "Recipient from model: %@", buf, 0xCu);
        }

        objc_msgSend(v14, "addObject:", v59);
LABEL_28:
        -[_PSRecipient handle](v27, "handle");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v49, "length"))
        {
          v54 = v12;
          v56 = v11;
          objc_msgSend(v12, "identifier");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "identifier");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = objc_msgSend(v50, "isEqualToString:", v51);

          if ((v52 & 1) != 0)
          {
            v21 = 0;
            v22 = v23;
            v37 = v57;
          }
          else
          {
            v27 = v27;
            v22 = v23;
            v37 = v57;
            v21 = v27;
          }
          v12 = v54;
          v11 = v56;
        }
        else
        {

          v21 = 0;
          v22 = v23;
          v37 = v57;
        }
        goto LABEL_34;
      }
    }
    else
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", v10);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "doubleValue");
      v31 = v30;

      if (v31 > 1.0)
      {
        -[_PSFamilyRecommender handleAndBundleIdDictionaryForFamilyRecipientContact:lookBackDays:](self, "handleAndBundleIdDictionaryForFamilyRecipientContact:lookBackDays:", v17, 168);
        v22 = objc_claimAutoreleasedReturnValue();

        -[NSObject objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", CFSTR("handle"));
        v32 = objc_claimAutoreleasedReturnValue();
        -[NSObject objectForKeyedSubscript:](v22, "objectForKeyedSubscript:", CFSTR("bundleId"));
        v33 = objc_claimAutoreleasedReturnValue();

        v59 = (void *)v32;
        v55 = (void *)v33;
        if (v32)
        {
          if ((objc_msgSend(v14, "containsObject:", v32) & 1) != 0)
          {
            v27 = 0;
          }
          else
          {
            v41 = [_PSRecipient alloc];
            objc_msgSend(v17, "identifier");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = -[_PSRecipient initWithIdentifier:handle:contact:](v41, "initWithIdentifier:handle:contact:", v42, v32, v17);
            v44 = v32;
            v27 = (_PSRecipient *)v43;

            -[_PSRecipient setMostRecentTransportBundleId:](v27, "setMostRecentTransportBundleId:", v55);
            objc_msgSend(v14, "addObject:", v44);
          }
        }
        else
        {
          -[_PSFamilyRecommender contactResolver](self, "contactResolver");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "allEmailAndPhoneNumberHandlesForContact:", v17);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "firstObject");
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          if (!objc_msgSend(v40, "length") || (objc_msgSend(v14, "containsObject:", v40) & 1) != 0)
          {

            v59 = 0;
            v27 = 0;
            v21 = 0;
            v37 = v55;
            goto LABEL_34;
          }
          v58 = objc_msgSend(v40, "containsString:", CFSTR("@"));
          v45 = [_PSRecipient alloc];
          objc_msgSend(v17, "identifier");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = -[_PSRecipient initWithIdentifier:handle:contact:](v45, "initWithIdentifier:handle:contact:", v46, 0, v17);

          if (v58)
            +[_PSConstants mobileMailBundleId](_PSConstants, "mobileMailBundleId");
          else
            +[_PSConstants mobileMessagesBundleId](_PSConstants, "mobileMessagesBundleId");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          -[_PSRecipient setMostRecentTransportBundleId:](v27, "setMostRecentTransportBundleId:", v47);

        }
        +[_PSLogging familyRecommenderChannel](_PSLogging, "familyRecommenderChannel");
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v63 = v27;
          _os_log_impl(&dword_1A07F4000, v48, OS_LOG_TYPE_INFO, "Recipient from heuristic: %@", buf, 0xCu);
        }

        v23 = v22;
        v57 = v55;
        goto LABEL_28;
      }
    }
    v34 = [_PSRecipient alloc];
    objc_msgSend(v17, "identifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = -[_PSRecipient initWithIdentifier:handle:contact:](v34, "initWithIdentifier:handle:contact:", v35, 0, v17);

    v27 = v36;
    v22 = v23;
    v37 = v57;
    v21 = v27;
LABEL_34:

LABEL_35:
    v18 = v60;
    goto LABEL_36;
  }
  v21 = 0;
LABEL_36:

  return v21;
}

- (id)contactIdsFromContactRelationsUsingMe:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  char v14;
  id CNContactClass_1;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  _PSFamilyRecommender *v29;
  void *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  id v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_PSFamilyRecommender contactStore](self, "contactStore");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = self;
  -[_PSFamilyRecommender nonFamilyRelations](self, "nonFamilyRelations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v4;
  objc_msgSend(v4, "contactRelations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v33 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v12, "label");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v5, "containsObject:", v13);

        if ((v14 & 1) == 0)
        {
          CNContactClass_1 = getCNContactClass_1();
          objc_msgSend(v12, "value");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "name");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(CNContactClass_1, "predicateForContactsMatchingName:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          -[_PSFamilyRecommender contactKeysToFetch](v29, "contactKeysToFetch");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = v9;
          objc_msgSend(v30, "unifiedContactsMatchingPredicate:keysToFetch:error:", v18, v19, &v31);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v31;

          if (v21)
          {
            +[_PSLogging familyRecommenderChannel](_PSLogging, "familyRecommenderChannel");
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v37 = v21;
              _os_log_error_impl(&dword_1A07F4000, v22, OS_LOG_TYPE_ERROR, "Error querying contacts %@", buf, 0xCu);
            }

          }
          if (objc_msgSend(v20, "count"))
          {
            objc_msgSend(v20, "firstObject");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "identifier");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "addObject:", v24);

          }
          v9 = v21;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }
  v25 = (void *)objc_msgSend(v28, "copy");

  return v25;
}

- (id)contactIdsFromContactNamesUsingMe:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  BOOL v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  char v31;
  id CNContactClass_1;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  NSObject *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  void *v50;
  id obj;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  id v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  void *v66;
  _PSFamilyRecommender *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  id v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  uint8_t v85[128];
  uint8_t buf[4];
  id v87;
  _BYTE v88[128];
  _BYTE v89[128];
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_PSFamilyRecommender contactStore](self, "contactStore");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSFamilyRecommender fetchAllContactIdsFromContactStore:](self, "fetchAllContactIdsFromContactStore:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSFamilyRecommender nonFamilyRelations](self, "nonFamilyRelations");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSFamilyRecommender relationshipRegularExpressionForRelationship](self, "relationshipRegularExpressionForRelationship");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  obj = v5;
  v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v90, 16);
  v7 = 0;
  if (v55)
  {
    v53 = *(_QWORD *)v82;
    v67 = self;
    do
    {
      v8 = 0;
      do
      {
        v62 = v7;
        if (*(_QWORD *)v82 != v53)
          objc_enumerationMutation(obj);
        v56 = v8;
        v9 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * v8);
        v77 = 0u;
        v78 = 0u;
        v79 = 0u;
        v80 = 0u;
        v64 = v54;
        v10 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v77, v89, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v78;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v78 != v12)
                objc_enumerationMutation(v64);
              v14 = *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * i);
              objc_msgSend(v9, "givenName");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              if (!-[_PSFamilyRecommender regexMatchForRegex:string:](self, "regexMatchForRegex:string:", v14, v15))
              {
                objc_msgSend(v9, "familyName");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                if (!-[_PSFamilyRecommender regexMatchForRegex:string:](self, "regexMatchForRegex:string:", v14, v16))
                {
                  objc_msgSend(v9, "nickname");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  v23 = -[_PSFamilyRecommender regexMatchForRegex:string:](v67, "regexMatchForRegex:string:", v14, v22);

                  self = v67;
                  if (!v23)
                    continue;
                  goto LABEL_15;
                }

              }
LABEL_15:
              objc_msgSend(v9, "identifier");
              v17 = objc_claimAutoreleasedReturnValue();
              if (v17)
              {
                v18 = (void *)v17;
                objc_msgSend(v9, "identifier");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = objc_msgSend(v6, "containsObject:", v19);

                if ((v20 & 1) == 0)
                {
                  objc_msgSend(v9, "identifier");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v6, "addObject:", v21);

                }
              }
            }
            v11 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v77, v89, 16);
          }
          while (v11);
        }

        objc_msgSend(v9, "contactRelations");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = 0u;
        v74 = 0u;
        v75 = 0u;
        v76 = 0u;
        v60 = v24;
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v73, v88, 16);
        if (v25)
        {
          v26 = v25;
          v27 = *(_QWORD *)v74;
          v7 = v62;
          v58 = *(_QWORD *)v74;
          do
          {
            v28 = 0;
            v59 = v26;
            do
            {
              if (*(_QWORD *)v74 != v27)
                objc_enumerationMutation(v60);
              v29 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * (_QWORD)v28);
              objc_msgSend(v29, "label");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = objc_msgSend(v66, "containsObject:", v30);

              if ((v31 & 1) == 0)
              {
                v65 = v28;
                CNContactClass_1 = getCNContactClass_1();
                objc_msgSend(v29, "value");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "name");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(CNContactClass_1, "predicateForContactsMatchingName:", v34);
                v35 = objc_claimAutoreleasedReturnValue();

                -[_PSFamilyRecommender contactKeysToFetch](v67, "contactKeysToFetch");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                v72 = v7;
                v63 = (void *)v35;
                objc_msgSend(v57, "unifiedContactsMatchingPredicate:keysToFetch:error:", v35, v36, &v72);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                v38 = v72;

                if (v38)
                {
                  +[_PSLogging familyRecommenderChannel](_PSLogging, "familyRecommenderChannel");
                  v39 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    v87 = v38;
                    _os_log_error_impl(&dword_1A07F4000, v39, OS_LOG_TYPE_ERROR, "Error querying contacts %@", buf, 0xCu);
                  }

                }
                v61 = v38;
                v70 = 0u;
                v71 = 0u;
                v68 = 0u;
                v69 = 0u;
                v40 = v37;
                v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v68, v85, 16);
                if (v41)
                {
                  v42 = v41;
                  v43 = *(_QWORD *)v69;
                  do
                  {
                    for (j = 0; j != v42; ++j)
                    {
                      if (*(_QWORD *)v69 != v43)
                        objc_enumerationMutation(v40);
                      v45 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * j);
                      objc_msgSend(v4, "identifier");
                      v46 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v45, "identifier");
                      v47 = (void *)objc_claimAutoreleasedReturnValue();
                      v48 = objc_msgSend(v46, "isEqualToString:", v47);

                      if (v48)
                      {
                        objc_msgSend(v9, "identifier");
                        v49 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v6, "addObject:", v49);

                      }
                    }
                    v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v68, v85, 16);
                  }
                  while (v42);
                }

                v7 = v61;
                v27 = v58;
                v26 = v59;
                v28 = v65;
              }
              v28 = (char *)v28 + 1;
            }
            while (v28 != (id)v26);
            v26 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v73, v88, 16);
          }
          while (v26);
        }
        else
        {
          v7 = v62;
        }

        v8 = v56 + 1;
        self = v67;
      }
      while (v56 + 1 != v55);
      v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v90, 16);
    }
    while (v55);
  }

  v50 = (void *)objc_msgSend(v6, "copy");
  return v50;
}

- (id)contactIdsFromEmergencyContacts
{
  dispatch_semaphore_t v2;
  dispatch_time_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  dispatch_semaphore_t dsema;
  void *v35;
  id obj;
  void *v38;
  void *v39;
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[4];
  dispatch_semaphore_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint8_t buf[4];
  id v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  -[_PSFamilyRecommender medicalIDStore](self, "medicalIDStore");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSFamilyRecommender nonFamilyRelations](self, "nonFamilyRelations");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0;
  v50 = &v49;
  v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__3;
  v53 = __Block_byref_object_dispose__3;
  v54 = 0;
  v2 = dispatch_semaphore_create(0);
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __55___PSFamilyRecommender_contactIdsFromEmergencyContacts__block_invoke;
  v46[3] = &unk_1E43FFAB0;
  v48 = &v49;
  dsema = v2;
  v47 = dsema;
  objc_msgSend(v35, "fetchMedicalIDEmergencyContactsWithCompletion:", v46);
  v3 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(dsema, v3))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v4 = objc_claimAutoreleasedReturnValue();

    v38 = (void *)v4;
  }
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = (id)v50[5];
  v5 = 0;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v57, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v43 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        objc_msgSend(v9, "relationship");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v39, "containsObject:", v10);

        if ((v11 & 1) == 0)
        {
          objc_msgSend(v9, "nameContactIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12
            && (objc_msgSend(v9, "nameContactIdentifier"),
                v13 = (void *)objc_claimAutoreleasedReturnValue(),
                v14 = objc_msgSend(v38, "containsObject:", v13),
                v13,
                v12,
                (v14 & 1) == 0))
          {
            -[_PSFamilyRecommender contactStore](self, "contactStore");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "nameContactIdentifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[_PSFamilyRecommender contactKeysToFetch](self, "contactKeysToFetch");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = v5;
            objc_msgSend(v16, "unifiedContactWithIdentifier:keysToFetch:error:", v17, v18, &v41);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = v41;

            if (v15)
            {
              +[_PSLogging familyRecommenderChannel](_PSLogging, "familyRecommenderChannel");
              v20 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v56 = v15;
                _os_log_error_impl(&dword_1A07F4000, v20, OS_LOG_TYPE_ERROR, "Error querying contacts %@", buf, 0xCu);
              }

            }
            if (v19)
            {
              objc_msgSend(v9, "nameContactIdentifier");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "addObject:", v21);

              objc_msgSend(v19, "identifier");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "addObject:", v22);

            }
          }
          else
          {
            v15 = v5;
          }
          objc_msgSend(v9, "phoneNumberContactIdentifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23
            && (objc_msgSend(v9, "phoneNumberContactIdentifier"),
                v24 = (void *)objc_claimAutoreleasedReturnValue(),
                v25 = objc_msgSend(v38, "containsObject:", v24),
                v24,
                v23,
                (v25 & 1) == 0))
          {
            -[_PSFamilyRecommender contactStore](self, "contactStore");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "phoneNumberContactIdentifier");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            -[_PSFamilyRecommender contactKeysToFetch](self, "contactKeysToFetch");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = v15;
            objc_msgSend(v26, "unifiedContactWithIdentifier:keysToFetch:error:", v27, v28, &v40);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v5 = v40;

            if (v5)
            {
              +[_PSLogging familyRecommenderChannel](_PSLogging, "familyRecommenderChannel");
              v30 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v56 = v5;
                _os_log_error_impl(&dword_1A07F4000, v30, OS_LOG_TYPE_ERROR, "Error querying contacts %@", buf, 0xCu);
              }

            }
            if (v29)
            {
              objc_msgSend(v9, "phoneNumberContactIdentifier");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "addObject:", v31);

            }
          }
          else
          {
            v5 = v15;
          }
        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v57, 16);
    }
    while (v6);
  }

  v32 = (void *)objc_msgSend(v38, "copy");
  _Block_object_dispose(&v49, 8);

  return v32;
}

- (void)logFeedbackForFamilyRecommenderCallHasRecommendations:(BOOL)a3
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_PSFeedbackUtils feedbackPayloadWithIndex:reasonType:reason:sourceBundleId:transportBundleId:numberOfVisibleSuggestions:sessionId:delay:testEvent:iCloudFamilyInvocation:engagementType:trialID:](_PSFeedbackUtils, "feedbackPayloadWithIndex:reasonType:reason:sourceBundleId:transportBundleId:numberOfVisibleSuggestions:sessionId:delay:testEvent:iCloudFamilyInvocation:engagementType:trialID:", CFSTR("default"), &unk_1E442AA30, &unk_1E442AA30, &unk_1E442AA48, 3, CFSTR("default"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
  {
    v5 = v4;
    AnalyticsSendEventLazy();

  }
}

- (void)setInteractionStore:(id)a3
{
  objc_storeStrong((id *)&self->_interactionStore, a3);
}

- (void)setContactStore:(id)a3
{
  objc_storeStrong((id *)&self->_contactStore, a3);
}

- (void)setMedicalIDStore:(id)a3
{
  objc_storeStrong((id *)&self->_medicalIDStore, a3);
}

- (void)setContactResolver:(id)a3
{
  objc_storeStrong((id *)&self->_contactResolver, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_contactResolver, 0);
  objc_storeStrong((id *)&self->_medicalIDStore, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_interactionStore, 0);
}

- (void)familyRecipientsForShareSheetWithPredictionContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1A07F4000, v0, v1, "Error querying knowledge store for predictions: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)familyRecipientsForShareSheetWithPredictionContext:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1A07F4000, v0, v1, "Error querying for me contact card: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)recipientFromFamilyContactId:familySuggestions:me:currentFamilyIds:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1A07F4000, v0, v1, "Error querying contacts %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
