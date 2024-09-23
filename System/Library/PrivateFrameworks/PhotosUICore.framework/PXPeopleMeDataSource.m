@implementation PXPeopleMeDataSource

- (PXPeopleMeDataSource)initWithPhotoLibrary:(id)a3
{
  id v5;
  PXPeopleMeDataSource *v6;
  PXPeopleMeDataSource *v7;
  NSObject *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *fetchQueue;
  NSObject *v12;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *meContactIsolationQueue;
  void *v16;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PXPeopleMeDataSource;
  v6 = -[PXPeopleMeDataSource init](&v18, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_USER_INITIATED, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.photos.people.meDataSource.fetch", v9);
    fetchQueue = v7->_fetchQueue;
    v7->_fetchQueue = (OS_dispatch_queue *)v10;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v12, QOS_CLASS_USER_INITIATED, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create("com.apple.photos.people.meDataSource.meContactIsolation", v13);
    meContactIsolationQueue = v7->_meContactIsolationQueue;
    v7->_meContactIsolationQueue = (OS_dispatch_queue *)v14;

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "registerDefaults:", &unk_1E53F0E30);

  }
  return v7;
}

- (void)requestSuggestedMePersonWithCompletion:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  _QWORD block[4];
  id v10;
  id v11;
  id location;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleMeDataSource.m"), 56, CFSTR("completion must not be nil!"));

  }
  objc_initWeak(&location, self);
  -[PXPeopleMeDataSource fetchQueue](self, "fetchQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__PXPeopleMeDataSource_requestSuggestedMePersonWithCompletion___block_invoke;
  block[3] = &unk_1E5146480;
  v10 = v5;
  v7 = v5;
  objc_copyWeak(&v11, &location);
  dispatch_async(v6, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)confirmSuggestedMePerson
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[PXPeopleMeDataSource fetchQueue](self, "fetchQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__PXPeopleMeDataSource_confirmSuggestedMePerson__block_invoke;
  v4[3] = &unk_1E5148D30;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)rejectSuggestedMePerson
{
  NSObject *v2;

  -[PXPeopleMeDataSource fetchQueue](self, "fetchQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v2, &__block_literal_global_173295);

}

- (void)_fetchQueue_requestMeContactWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  PXPeopleMeDataSource *v10;
  void (**v11)(id, _QWORD);
  uint64_t *v12;
  _QWORD block[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = (void (**)(id, _QWORD))a3;
  -[PXPeopleMeDataSource _assertIsOnFetchQueue](self, "_assertIsOnFetchQueue");
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__173289;
  v18 = __Block_byref_object_dispose__173290;
  v19 = 0;
  -[PXPeopleMeDataSource meContactIsolationQueue](self, "meContactIsolationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__PXPeopleMeDataSource__fetchQueue_requestMeContactWithCompletion___block_invoke;
  block[3] = &unk_1E5148AA8;
  block[4] = self;
  block[5] = &v14;
  dispatch_sync(v5, block);

  if (v15[5] || -[PXPeopleMeDataSource hasRequestedMeContact](self, "hasRequestedMeContact"))
  {
    if (v4)
      v4[2](v4, v15[5]);
  }
  else
  {
    -[PXPeopleMeDataSource setRequestedMeContact:](self, "setRequestedMeContact:", 1);
    +[PXPeopleUtilities sharedContactStore](PXPeopleUtilities, "sharedContactStore");
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __67__PXPeopleMeDataSource__fetchQueue_requestMeContactWithCompletion___block_invoke_2;
    v8[3] = &unk_1E5140508;
    v12 = &v14;
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v10 = self;
    v11 = v4;
    objc_msgSend(v7, "requestAccessForEntityType:completionHandler:", 0, v8);

  }
  _Block_object_dispose(&v14, 8);

}

- (id)_fetchQueue_suggestedPersonForMe
{
  void *v4;
  char v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  char v25;
  id v26;
  uint8_t buf[4];
  id v28;
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  -[PXPeopleMeDataSource _assertIsOnFetchQueue](self, "_assertIsOnFetchQueue");
  if (-[PXPeopleMeDataSource hasRequestedSuggestedPerson](self, "hasRequestedSuggestedPerson"))
  {
    -[PXPeopleMeDataSource suggestedPerson](self, "suggestedPerson");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  +[PXPeopleUISettings sharedInstance](PXPeopleUISettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shouldAlwaysShowMe");

  if (PFOSVariantHasInternalUI())
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "integerForKey:", CFSTR("PhotosPeopleSuggestedMeIndex"));

    if (((v7 < 0) & v5) != 0)
      v7 = 0;
    if ((v7 & 0x8000000000000000) == 0)
    {
      v8 = (void *)MEMORY[0x1E0CD1570];
      -[PXPeopleMeDataSource photoLibrary](self, "photoLibrary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "fetchOptionsWithPhotoLibrary:orObject:", v9, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "setPersonContext:", 1);
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("manualOrder"), 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = v11;
      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v29[1] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setSortDescriptors:", v13);

      objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsWithOptions:", v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndex:", v7);
      v15 = objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v16 = (void *)v15;
        PLUIGetLog();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v16, "localIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v28 = v18;
          _os_log_impl(&dword_1A6789000, v17, OS_LOG_TYPE_DEFAULT, "Using Debug suggested me person specified by PhotosPeopelSuggestedMeIndex: %{public}@", buf, 0xCu);

        }
LABEL_16:
        objc_msgSend(v16, "personUri");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v24, "length"))
          v25 = v5;
        else
          v25 = 1;
        if ((v25 & 1) == 0)
        {

          v16 = 0;
        }
        -[PXPeopleMeDataSource setSuggestedPerson:](self, "setSuggestedPerson:", v16);
        -[PXPeopleMeDataSource setRequestedSuggestedPerson:](self, "setRequestedSuggestedPerson:", 1);

        return v16;
      }

    }
  }
  -[PXPeopleMeDataSource photoLibrary](self, "photoLibrary");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  objc_msgSend(v19, "suggestedMePersonIdentifierWithError:", &v26);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v26;

  PLUIGetLog();
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (!v20)
  {
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v21;
      _os_log_impl(&dword_1A6789000, v23, OS_LOG_TYPE_ERROR, "Failed to get suggested me person identifier: %@", buf, 0xCu);
    }

    v16 = 0;
    return v16;
  }
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v28 = v20;
    _os_log_impl(&dword_1A6789000, v23, OS_LOG_TYPE_DEFAULT, "Fetching suggested me person with identifier: %{public}@", buf, 0xCu);
  }

  +[PXPeopleUtilities personWithLocalIdentifier:](PXPeopleUtilities, "personWithLocalIdentifier:", v20);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    goto LABEL_16;
  return v16;
}

- (void)_fetchQueue_persistSuggestedPersonAsMe
{
  _QWORD v3[4];
  id v4;
  id location;

  -[PXPeopleMeDataSource _assertIsOnFetchQueue](self, "_assertIsOnFetchQueue");
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __62__PXPeopleMeDataSource__fetchQueue_persistSuggestedPersonAsMe__block_invoke;
  v3[3] = &unk_1E5131900;
  objc_copyWeak(&v4, &location);
  -[PXPeopleMeDataSource _fetchQueue_requestMeContactWithCompletion:](self, "_fetchQueue_requestMeContactWithCompletion:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (id)_fetchPersonWithUri:(id)a3
{
  return +[PXPeopleUtilities personWithPersonUri:](PXPeopleUtilities, "personWithPersonUri:", a3);
}

- (void)_assertIsOnFetchQueue
{
  const char *label;
  NSObject *v5;
  const char *v6;
  id v7;

  label = dispatch_queue_get_label(0);
  -[PXPeopleMeDataSource fetchQueue](self, "fetchQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = dispatch_queue_get_label(v5);

  if (label != v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleMeDataSource.m"), 225, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL) == dispatch_queue_get_label(self.fetchQueue)"));

  }
}

- (PXPeopleMeDataSource)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleMeDataSource.m"), 231, CFSTR("%s is not available as initializer"), "-[PXPeopleMeDataSource init]");

  abort();
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (OS_dispatch_queue)fetchQueue
{
  return self->_fetchQueue;
}

- (PHPerson)suggestedPerson
{
  return self->_suggestedPerson;
}

- (void)setSuggestedPerson:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedPerson, a3);
}

- (CNContact)meContact
{
  return self->_meContact;
}

- (void)setMeContact:(id)a3
{
  objc_storeStrong((id *)&self->_meContact, a3);
}

- (OS_dispatch_queue)meContactIsolationQueue
{
  return self->_meContactIsolationQueue;
}

- (BOOL)hasRequestedSuggestedPerson
{
  return self->_requestedSuggestedPerson;
}

- (void)setRequestedSuggestedPerson:(BOOL)a3
{
  self->_requestedSuggestedPerson = a3;
}

- (BOOL)hasRequestedMeContact
{
  return self->_requestedMeContact;
}

- (void)setRequestedMeContact:(BOOL)a3
{
  self->_requestedMeContact = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meContactIsolationQueue, 0);
  objc_storeStrong((id *)&self->_meContact, 0);
  objc_storeStrong((id *)&self->_suggestedPerson, 0);
  objc_storeStrong((id *)&self->_fetchQueue, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

void __62__PXPeopleMeDataSource__fetchQueue_persistSuggestedPersonAsMe__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  char v15;
  id v16;
  NSObject *v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "suggestedPerson");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "localIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXPeopleUtilities personWithLocalIdentifier:](PXPeopleUtilities, "personWithLocalIdentifier:", v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v3 && v7)
    {
      objc_msgSend(v3, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD16C0], "fullNameFromContact:", v3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD16C0], "displayNameFromContact:", v3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "photoLibrary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __62__PXPeopleMeDataSource__fetchQueue_persistSuggestedPersonAsMe__block_invoke_2;
      v20[3] = &unk_1E51318D8;
      v7 = v7;
      v21 = v7;
      v22 = v3;
      v12 = v8;
      v23 = v12;
      v13 = v9;
      v24 = v13;
      v14 = v10;
      v25 = v14;
      v19 = 0;
      v15 = objc_msgSend(v11, "performChangesAndWait:error:", v20, &v19);
      v16 = v19;
      if ((v15 & 1) == 0)
      {
        PLUIGetLog();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v7, "localIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v27 = v18;
          v28 = 2112;
          v29 = v16;
          _os_log_impl(&dword_1A6789000, v17, OS_LOG_TYPE_DEFAULT, "Failed to change name for person: %{public}@ (%@)", buf, 0x16u);

        }
      }

    }
  }
  else
  {
    v7 = 0;
  }

}

void __62__PXPeopleMeDataSource__fetchQueue_persistSuggestedPersonAsMe__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CD16D8], "changeRequestForPerson:", *(_QWORD *)(a1 + 32));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[PXPeopleUtilities sharedContactStore](PXPeopleUtilities, "sharedContactStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D71680], "matchingDictionaryForContact:contactStore:", *(_QWORD *)(a1 + 40), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setContactMatchingDictionary:", v3);
  objc_msgSend(v6, "setPersonUri:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (!v5)
  {
    objc_msgSend(v6, "setName:", *(_QWORD *)(a1 + 56));
    objc_msgSend(v6, "setDisplayName:", *(_QWORD *)(a1 + 64));
  }

}

void __67__PXPeopleMeDataSource__fetchQueue_requestMeContactWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "meContact");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __67__PXPeopleMeDataSource__fetchQueue_requestMeContactWithCompletion___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[6];
  id v19;
  void *v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    PLUIGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v5;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "Error gaining access to Contacts for Me person fetching: %@", buf, 0xCu);
    }

  }
  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(a1 + 32);
    v20 = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v5;
    objc_msgSend(v8, "_crossPlatformUnifiedMeContactWithKeysToFetch:error:", v9, &v19);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v19;

    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v10;

    if (v11)
    {
      PLUIGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v11;
        _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_ERROR, "Error gaining access to the Me contact: %@", buf, 0xCu);
      }

    }
  }
  else
  {
    v11 = v5;
  }
  objc_msgSend(*(id *)(a1 + 40), "meContactIsolationQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __67__PXPeopleMeDataSource__fetchQueue_requestMeContactWithCompletion___block_invoke_149;
  v18[3] = &unk_1E5148AA8;
  v16 = *(_QWORD *)(a1 + 56);
  v18[4] = *(_QWORD *)(a1 + 40);
  v18[5] = v16;
  dispatch_sync(v15, v18);

  v17 = *(_QWORD *)(a1 + 48);
  if (v17)
    (*(void (**)(uint64_t, _QWORD))(v17 + 16))(v17, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));

}

uint64_t __67__PXPeopleMeDataSource__fetchQueue_requestMeContactWithCompletion___block_invoke_149(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setMeContact:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

uint64_t __47__PXPeopleMeDataSource_rejectSuggestedMePerson__block_invoke()
{
  void *v0;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setBool:forKey:", 1, CFSTR("PXPeopleMePrompted"));

  return objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.people.me.rejected"), MEMORY[0x1E0C9AA70]);
}

uint64_t __48__PXPeopleMeDataSource_confirmSuggestedMePerson__block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBool:forKey:", 1, CFSTR("PXPeopleMePrompted"));

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_fetchQueue_persistSuggestedPersonAsMe");

  return objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.people.me.confirmed"), MEMORY[0x1E0C9AA70]);
}

void __63__PXPeopleMeDataSource_requestSuggestedMePersonWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  char v5;
  id WeakRetained;
  _QWORD v7[4];
  id v8;
  id v9;
  char v10;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("PXPeopleMePrompted"));

  +[PXPeopleUISettings sharedInstance](PXPeopleUISettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shouldAlwaysShowMe");

  if (!v3 || (v5 & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __63__PXPeopleMeDataSource_requestSuggestedMePersonWithCompletion___block_invoke_2;
    v7[3] = &unk_1E5131890;
    objc_copyWeak(&v9, (id *)(a1 + 40));
    v10 = v5;
    v8 = *(id *)(a1 + 32);
    objc_msgSend(WeakRetained, "_fetchQueue_requestMeContactWithCompletion:", v7);

    objc_destroyWeak(&v9);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

void __63__PXPeopleMeDataSource_requestSuggestedMePersonWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v8 = a2;
  if (!v8)
    goto LABEL_5;
  objc_msgSend(v8, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_fetchPersonWithUri:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5 || *(_BYTE *)(a1 + 48))
  {
    v6 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v6, "_fetchQueue_suggestedPersonForMe");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
LABEL_5:
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

+ (id)new
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPeopleMeDataSource.m"), 235, CFSTR("%s is not available as initializer"), "+[PXPeopleMeDataSource new]");

  abort();
}

@end
