@implementation PPLocalContactStore

- (id)cachedSignificantContactHandles
{
  return -[PPContactStorage cachedSignificantContactHandles](self->_contactStorage, "cachedSignificantContactHandles");
}

+ (id)defaultStore
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  id v5;
  uint8_t v7[16];

  pthread_mutex_lock(&defaultStore_lock);
  if (!defaultStore_instance)
  {
    v2 = objc_opt_new();
    v3 = (void *)defaultStore_instance;
    defaultStore_instance = v2;

    if (!defaultStore_instance)
    {
      pp_contacts_log_handle();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_1C392E000, v4, OS_LOG_TYPE_INFO, "PPLocalContactStore defaultStore did not initialize, will try again later. Device may be Class C locked.", v7, 2u);
      }

    }
  }
  v5 = (id)defaultStore_instance;
  pthread_mutex_unlock(&defaultStore_lock);
  return v5;
}

- (PPLocalContactStore)initWithStorage:(id)a3 namedEntityStoreOverride:(id)a4
{
  id v7;
  id v8;
  PPLocalContactStore *v9;
  PPLocalContactStore *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PPLocalContactStore;
  v9 = -[PPLocalContactStore init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contactStorage, a3);
    objc_storeStrong((id *)&v10->_namedEntityStore, a4);
  }

  return v10;
}

- (PPLocalContactStore)init
{
  void *v3;
  PPContactStorage *v4;
  PPNamedEntityStorage *v5;
  void *v6;
  PPLocalNamedEntityStore *v7;
  void *v8;
  PPLocalNamedEntityStore *v9;
  PPLocalContactStore *v10;

  +[PPSQLDatabase sharedInstance](PPSQLDatabase, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = -[PPContactStorage initWithDatabase:foundInAppsHarvestStoreGetter:]([PPContactStorage alloc], "initWithDatabase:foundInAppsHarvestStoreGetter:", v3, &__block_literal_global_3293);
    v5 = -[PPNamedEntityStorage initWithDatabase:]([PPNamedEntityStorage alloc], "initWithDatabase:", v3);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D815E8]), "initWithResult:", self);
    v7 = [PPLocalNamedEntityStore alloc];
    +[PPTrialWrapper sharedInstance](PPTrialWrapper, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PPLocalNamedEntityStore initWithStorage:topicStoreForNamedEntityMapping:lazyContactStoreForMapsFeedback:trialWrapper:](v7, "initWithStorage:topicStoreForNamedEntityMapping:lazyContactStoreForMapsFeedback:trialWrapper:", v5, 0, v6, v8);

    if (v4)
    {
      self = -[PPLocalContactStore initWithStorage:namedEntityStoreOverride:](self, "initWithStorage:namedEntityStoreOverride:", v4, v9);
      v10 = self;
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)meCard
{
  return -[PPContactStorage meCard](self->_contactStorage, "meCard");
}

- (id)rankedContactsWithQuery:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  const __CFString *v17;
  int v18;
  const __CFString *v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend(v6, "hasNoConstraints"))
  {
    +[PPContactScorer mostRelevantContactsWithStore:](PPContactScorer, "mostRelevantContactsWithStore:", self);
    a4 = (id *)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v6, "onlyQueryMostRelevantContacts"))
  {
    objc_msgSend(v6, "matchingName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length");

    if (v8)
    {
      objc_msgSend(v6, "matchingName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[PPContactScorer mostRelevantContactsWithName:store:](PPContactScorer, "mostRelevantContactsWithName:store:", v9, self);
      a4 = (id *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (a4)
      {
        v11 = (void *)MEMORY[0x1E0CB35C8];
        v12 = *MEMORY[0x1E0D70D10];
        v20 = *MEMORY[0x1E0D70D18];
        v21[0] = CFSTR("PPLocalContactStore rankedContactsWithQuery passed PPContactQuery with onlyQueryMostRelevantContacts and an unsupported matching property");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 8, v13);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

      }
      pp_default_log_handle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        v18 = 138412290;
        v19 = CFSTR("PPLocalContactStore rankedContactsWithQuery passed PPContactQuery with onlyQueryMostRelevantContacts and an unsupported matching property");
        _os_log_fault_impl(&dword_1C392E000, v14, OS_LOG_TYPE_FAULT, "%@", (uint8_t *)&v18, 0xCu);
      }

      a4 = 0;
    }
  }
  else
  {
    -[PPLocalContactStore contactsWithQuery:error:](self, "contactsWithQuery:error:", v6, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      +[PPContactScorer scoredContactsWithContacts:](PPContactScorer, "scoredContactsWithContacts:", v10);
      a4 = (id *)objc_claimAutoreleasedReturnValue();
    }
    else if (a4)
    {
      pp_contacts_log_handle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v17 = (const __CFString *)*a4;
        v18 = 138412290;
        v19 = v17;
        _os_log_error_impl(&dword_1C392E000, v15, OS_LOG_TYPE_ERROR, "rankedContactsWithQuery: %@", (uint8_t *)&v18, 0xCu);
      }

      a4 = 0;
    }

  }
  return a4;
}

- (double)similarityForNamedEntity:(id)a3 nameRecord:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  __CFString *v20;
  __CFString *v21;
  double v22;
  double v23;

  v5 = a4;
  objc_msgSend(a3, "item");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedLowercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0C99888];
  objc_msgSend(v8, "stringByApplyingTransform:reverse:", *MEMORY[0x1E0C99888], 0);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = (__CFString *)v10;
  else
    v12 = &stru_1E7E221D0;
  v13 = v12;

  v14 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v5, "firstName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)objc_msgSend(v14, "initWithFormat:", CFSTR("%@ %@"), v15, v16);
  objc_msgSend(v17, "stringByApplyingTransform:reverse:", v9, 0);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (v18)
    v20 = (__CFString *)v18;
  else
    v20 = &stru_1E7E221D0;
  v21 = v20;

  objc_msgSend(MEMORY[0x1E0D70D00], "jaroSimilarityForString:other:", v13, v21);
  v23 = v22;

  return v23;
}

- (id)_incompleteContactFromContactsRecord:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (objc_class *)MEMORY[0x1E0D70B00];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "sourceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "middleName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nickname");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedFullName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(v5, "initWithIdentifier:source:namePrefix:givenName:middleName:familyName:nameSuffix:nickname:localizedFullName:organizationName:jobTitle:birthday:nonGregorianBirthday:phoneNumbers:emailAddresses:socialProfiles:postalAddresses:", v6, 1, 0, v7, v8, v9, 0, v10, v11, 0, 0, 0, 0, 0, 0,
                  0,
                  0);

  return v12;
}

- (id)_scoredContactFromContactsRecord:(id)a3 score:(double)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = (objc_class *)MEMORY[0x1E0D70C28];
  v7 = a3;
  v8 = [v6 alloc];
  -[PPLocalContactStore _incompleteContactFromContactsRecord:](self, "_incompleteContactFromContactsRecord:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(v8, "initWithContact:scoredPhoneNumbers:scoredEmailAddresses:scoredSocialProfiles:scoredPostalAddresses:score:flags:", v9, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], 0, a4);
  return v10;
}

- (id)resolveContactsForNamedEntities:(id)a3
{
  id v4;
  void *v5;
  PPContactStorage *contactStorage;
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  PPLocalContactStore *v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  contactStorage = self->_contactStorage;
  v17 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __55__PPLocalContactStore_resolveContactsForNamedEntities___block_invoke;
  v13[3] = &unk_1E7E16308;
  v7 = v4;
  v14 = v7;
  v8 = v5;
  v15 = v8;
  v16 = self;
  LOBYTE(contactStorage) = -[PPContactStorage iterAllNameRecordsFromAllSourcesWithError:block:](contactStorage, "iterAllNameRecordsFromAllSourcesWithError:block:", &v17, v13);
  v9 = v17;
  if ((contactStorage & 1) != 0)
  {
    v10 = v8;
  }
  else
  {
    pp_contacts_log_handle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v9;
      _os_log_error_impl(&dword_1C392E000, v11, OS_LOG_TYPE_ERROR, "PPLocalContactStore: error iterating name records: %@", buf, 0xCu);
    }

    v10 = (id)MEMORY[0x1E0C9AA60];
  }

  return v10;
}

- (id)upcomingRelevantContactsForQuery:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v24[4];
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v6, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFromDate:", v8);

  objc_msgSend(v6, "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setToDate:", v9);

  v10 = (void *)MEMORY[0x1C3BD6630](objc_msgSend(v7, "setMatchCategory:", 1));
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", &unk_1E7E59270, 0);
  objc_autoreleasePoolPop(v10);
  objc_msgSend(v7, "setMatchingCategories:", v11);

  objc_msgSend(v6, "sourceBundleIds");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMatchingSourceBundleIds:", v12);

  objc_msgSend(v7, "setLimit:", 50);
  -[PPLocalNamedEntityStore rankedNamedEntitiesWithQuery:error:](self->_namedEntityStore, "rankedNamedEntitiesWithQuery:error:", v7, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    if (objc_msgSend(v13, "count"))
    {
      -[PPLocalContactStore resolveContactsForNamedEntities:](self, "resolveContactsForNamedEntities:", v14);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_opt_new();
      -[NSObject sortedArrayUsingComparator:](v15, "sortedArrayUsingComparator:", &__block_literal_global_68);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __62__PPLocalContactStore_upcomingRelevantContactsForQuery_error___block_invoke_2;
      v24[3] = &unk_1E7E16350;
      v25 = v16;
      v18 = v16;
      objc_msgSend(v17, "_pas_filteredArrayWithTest:", v24);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      pp_contacts_log_handle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v21 = -[NSObject count](v15, "count");
        v22 = objc_msgSend(v19, "count");
        *(_DWORD *)buf = 134218240;
        v27 = v21;
        v28 = 2048;
        v29 = v22;
        _os_log_impl(&dword_1C392E000, v20, OS_LOG_TYPE_INFO, "PPLocalContactStore: resolved a total of %tu matches into %tu contacts.", buf, 0x16u);
      }

    }
    else
    {
      pp_contacts_log_handle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C392E000, v15, OS_LOG_TYPE_DEFAULT, "PPLocalContactStore: no named entities retrieved, returning no contacts.", buf, 2u);
      }
      v19 = (void *)MEMORY[0x1E0C9AA60];
    }
  }
  else
  {
    pp_contacts_log_handle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C392E000, v15, OS_LOG_TYPE_ERROR, "PPLocalContactStore: unable to fetch named entities.", buf, 2u);
    }
    v19 = 0;
  }

  return v19;
}

- (id)contactsWithQuery:(id)a3 error:(id *)a4
{
  return -[PPContactStorage contactsWithQuery:explanationSet:timeoutSeconds:error:](self->_contactStorage, "contactsWithQuery:explanationSet:timeoutSeconds:error:", a3, 0, 0, a4);
}

- (id)contactsWithQuery:(id)a3 explanationSet:(id)a4 timeoutSeconds:(id)a5 error:(id *)a6
{
  return -[PPContactStorage contactsWithQuery:explanationSet:timeoutSeconds:error:](self->_contactStorage, "contactsWithQuery:explanationSet:timeoutSeconds:error:", a3, a4, a5, a6);
}

- (id)scoredContactsWithContacts:(id)a3
{
  return +[PPContactScorer scoredContactsWithContacts:](PPContactScorer, "scoredContactsWithContacts:", a3);
}

- (id)contactHandlesForTopics:(id)a3 error:(id *)a4
{
  return -[PPContactStorage contactHandlesForTopics:](self->_contactStorage, "contactHandlesForTopics:", a3, a4);
}

- (id)contactHandlesForSource:(id)a3 error:(id *)a4
{
  return -[PPContactStorage contactHandlesForSource:](self->_contactStorage, "contactHandlesForSource:", a3, a4);
}

- (void)feedbackDisambiguationResultWithChoicesIdentifiers:(id)a3 chosenContactIdentifier:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  pp_contacts_log_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134218242;
    v9 = objc_msgSend(v5, "count");
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1C392E000, v7, OS_LOG_TYPE_DEFAULT, "PPLocalContactStore: feedbackDisambiguationResultWithChoicesIdentifiers choice count: %tu chose: %@", (uint8_t *)&v8, 0x16u);
  }

}

- (BOOL)iterContactNameRecordsForClient:(id)a3 error:(id *)a4 block:(id)a5
{
  id v8;
  id v9;
  PPContactStorage *contactStorage;
  void *v11;
  id v12;
  NSObject *v13;
  PPContactStorage *v14;
  id v15;
  BOOL v16;
  id v17;
  NSObject *v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  contactStorage = self->_contactStorage;
  v23 = 0;
  -[PPContactStorage contactsChangeHistoryForClient:error:](contactStorage, "contactsChangeHistoryForClient:error:", v8, &v23);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v23;
  if (!v11)
  {
    pp_contacts_log_handle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v12;
      _os_log_impl(&dword_1C392E000, v13, OS_LOG_TYPE_DEFAULT, "PPLocalContactStore: failed to load CN change history during full name load: %@", buf, 0xCu);
    }

    if (a4)
      *a4 = objc_retainAutorelease(v12);
  }
  v14 = self->_contactStorage;
  v22 = 0;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __67__PPLocalContactStore_iterContactNameRecordsForClient_error_block___block_invoke;
  v20[3] = &unk_1E7E16378;
  v15 = v9;
  v21 = v15;
  v16 = -[PPContactStorage iterAllNameRecordsFromAllSourcesWithError:block:](v14, "iterAllNameRecordsFromAllSourcesWithError:block:", &v22, v20);
  v17 = v22;
  if (v16)
  {
    if (v11)
      -[PPContactStorage clearChangeHistoryForClient:historyResult:](self->_contactStorage, "clearChangeHistoryForClient:historyResult:", v8, v11);
  }
  else
  {
    pp_contacts_log_handle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v17;
      _os_log_error_impl(&dword_1C392E000, v18, OS_LOG_TYPE_ERROR, "PPLocalContactStore: failed to load internal name records: %@", buf, 0xCu);
    }

    if (a4)
      *a4 = objc_retainAutorelease(v17);
  }

  return v16;
}

- (id)contactNameRecordChangesForClient:(id)a3 error:(id *)a4
{
  id v6;
  PPContactStorage *contactStorage;
  void *v8;
  id v9;
  PPContactStorage *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  id v20;
  char v21;
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  contactStorage = self->_contactStorage;
  v22 = 0;
  -[PPContactStorage contactsChangeHistoryForClient:error:](contactStorage, "contactsChangeHistoryForClient:error:", v6, &v22);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v22;
  if (v8)
  {
    v21 = 0;
    v10 = self->_contactStorage;
    v20 = 0;
    -[PPContactStorage contactNameRecordsWithHistoryResult:truncated:error:](v10, "contactNameRecordsWithHistoryResult:truncated:error:", v8, &v21, &v20);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v20;
    v13 = v12;
    if (v21)
    {
      pp_contacts_log_handle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C392E000, v14, OS_LOG_TYPE_DEFAULT, "Contacts change history truncated", buf, 2u);
      }

      -[PPContactStorage clearChangeHistoryForClient:historyResult:](self->_contactStorage, "clearChangeHistoryForClient:historyResult:", v6, v8);
      objc_msgSend(MEMORY[0x1E0D70B10], "contactNameRecordChangeResultWithChanges:changesTruncated:", 0, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else if (v11)
    {
      +[PPContactScorer scoreContactNameRecords:](PPContactScorer, "scoreContactNameRecords:", v11);
      -[PPContactStorage clearChangeHistoryForClient:historyResult:](self->_contactStorage, "clearChangeHistoryForClient:historyResult:", v6, v8);
      objc_msgSend(v11, "_pas_mappedArrayWithTransform:", &__block_literal_global_72);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D70B10], "contactNameRecordChangeResultWithChanges:changesTruncated:", v17, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (a4)
        *a4 = objc_retainAutorelease(v12);
      pp_contacts_log_handle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v13;
        _os_log_error_impl(&dword_1C392E000, v18, OS_LOG_TYPE_ERROR, "contactNameRecordChangeResultWithChanges failed with error: %@", buf, 0xCu);
      }

      v15 = 0;
    }

  }
  else
  {
    pp_contacts_log_handle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v9;
      _os_log_impl(&dword_1C392E000, v16, OS_LOG_TYPE_DEFAULT, "failed to load CN change history during changes call: %@", buf, 0xCu);
    }

    v15 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v9);
  }

  return v15;
}

- (void)registerFeedback:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(id, uint64_t, _QWORD);
  NSObject *v7;
  void *v8;
  uint64_t v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void (**)(id, uint64_t, _QWORD))a4;
  pp_private_log_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v10 = 138412290;
    v11 = v5;
    _os_log_debug_impl(&dword_1C392E000, v7, OS_LOG_TYPE_DEBUG, "Contact feedback received: %@", (uint8_t *)&v10, 0xCu);
  }

  objc_msgSend(v5, "feedbackItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
    +[PPFeedbackStorage logFeedback:domain:domainStatus:inBackground:](PPFeedbackStorage, "logFeedback:domain:domainStatus:inBackground:", v5, 4, 2, 0);
  if (v6)
    v6[2](v6, 1, 0);

}

- (void)rebuildCachedSignificantContactHandlesWithShouldContinue:(id)a3
{
  uint64_t (**v4)(_QWORD);
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  uint64_t i;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  NSObject *v40;
  PPLocalContactStore *v41;
  void *v42;
  id v43;
  void *v44;
  NSObject *v45;
  void *v46;
  id obj;
  uint64_t v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  id v62;
  _BYTE v63[128];
  _BYTE v64[128];
  uint8_t v65[128];
  uint8_t buf[4];
  id v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v4 = (uint64_t (**)(_QWORD))a3;
  +[PPPeopleSuggester sharedInstance](PPPeopleSuggester, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rankedContactIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v4[2](v4) & 1) != 0)
  {
    +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "maxRelevantHighlightContacts");

    v9 = objc_msgSend(v6, "count");
    if (v9 >= v8)
      v10 = v8;
    else
      v10 = v9;
    v11 = objc_alloc(MEMORY[0x1E0C99E60]);
    objc_msgSend(v6, "_pas_proxySubarrayWithRange:", 0, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "initWithArray:", v12);

    v14 = (void *)objc_opt_new();
    v15 = (void *)objc_opt_new();
    -[NSObject allObjects](v13, "allObjects");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setMatchingIdentifiers:", v16);

    +[PPLocalContactStore defaultStore](PPLocalContactStore, "defaultStore");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = 0;
    objc_msgSend(v17, "contactsWithQuery:error:", v15, &v62);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v62;

    if (!v18)
    {
      pp_social_highlights_log_handle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v67 = v19;
        _os_log_error_impl(&dword_1C392E000, v20, OS_LOG_TYPE_ERROR, "PPSocialHighlightRanker: unable to fetch contacts: %@", buf, 0xCu);
      }

      v18 = (void *)MEMORY[0x1E0C9AA60];
    }
    if ((v4[2](v4) & 1) != 0)
    {
      v43 = v19;
      v44 = v15;
      v41 = self;
      v42 = v18;
      v45 = v13;
      v46 = v6;
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      obj = v18;
      v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v65, 16);
      if (v49)
      {
        v48 = *(_QWORD *)v59;
        do
        {
          for (i = 0; i != v49; ++i)
          {
            if (*(_QWORD *)v59 != v48)
              objc_enumerationMutation(obj);
            v22 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
            v54 = 0u;
            v55 = 0u;
            v56 = 0u;
            v57 = 0u;
            objc_msgSend(v22, "emailAddresses", v41);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
            if (v24)
            {
              v25 = v24;
              v26 = *(_QWORD *)v55;
              do
              {
                for (j = 0; j != v25; ++j)
                {
                  if (*(_QWORD *)v55 != v26)
                    objc_enumerationMutation(v23);
                  v28 = (void *)MEMORY[0x1E0D15890];
                  objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * j), "value");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v28, "normalizedStringFromContactString:", v29);
                  v30 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v14, "addObject:", v30);
                }
                v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
              }
              while (v25);
            }

            v52 = 0u;
            v53 = 0u;
            v50 = 0u;
            v51 = 0u;
            objc_msgSend(v22, "phoneNumbers");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
            if (v32)
            {
              v33 = v32;
              v34 = *(_QWORD *)v51;
              do
              {
                for (k = 0; k != v33; ++k)
                {
                  if (*(_QWORD *)v51 != v34)
                    objc_enumerationMutation(v31);
                  v36 = (void *)MEMORY[0x1E0D15890];
                  objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * k), "value");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v36, "normalizedStringFromContactString:", v37);
                  v38 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v14, "addObject:", v38);
                }
                v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
              }
              while (v33);
            }

          }
          v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v65, 16);
        }
        while (v49);
      }

      if ((v4[2](v4) & 1) != 0)
      {
        -[PPContactStorage setCachedSignificantContactHandles:](v41->_contactStorage, "setCachedSignificantContactHandles:", v14);
        v13 = v45;
        v6 = v46;
        v19 = v43;
        v15 = v44;
      }
      else
      {
        pp_contacts_log_handle();
        v40 = objc_claimAutoreleasedReturnValue();
        v13 = v45;
        v6 = v46;
        v19 = v43;
        v15 = v44;
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C392E000, v40, OS_LOG_TYPE_DEFAULT, "PPLocalContactStore: stopped cache rebuild before serialization.", buf, 2u);
        }

      }
      v18 = v42;
    }
    else
    {
      pp_contacts_log_handle();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C392E000, v39, OS_LOG_TYPE_DEFAULT, "PPLocalContactStore: stopped cache rebuild after contact matching call.", buf, 2u);
      }

    }
  }
  else
  {
    pp_contacts_log_handle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v13, OS_LOG_TYPE_DEFAULT, "PPLocalContactStore: stopped cache rebuild after people suggester call.", buf, 2u);
    }
  }

}

- (id)contactsChangeHistoryForClient:(id)a3 error:(id *)a4
{
  return -[PPContactStorage contactsChangeHistoryForClient:error:](self->_contactStorage, "contactsChangeHistoryForClient:error:", a3, a4);
}

- (void)clearChangeHistoryForClient:(id)a3 historyResult:(id)a4
{
  -[PPContactStorage clearChangeHistoryForClient:historyResult:](self->_contactStorage, "clearChangeHistoryForClient:historyResult:", a3, a4);
}

- (BOOL)chineseBirthdayFound
{
  return -[PPContactStorage chineseBirthdayFound](self->_contactStorage, "chineseBirthdayFound");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namedEntityStore, 0);
  objc_storeStrong((id *)&self->_contactStorage, 0);
}

uint64_t __63__PPLocalContactStore_contactNameRecordChangesForClient_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "clientCopy");
}

void __67__PPLocalContactStore_iterContactNameRecordsForClient_error_block___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  objc_class *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;

  v5 = (objc_class *)MEMORY[0x1E0C99DE8];
  v6 = a2;
  v9 = (id)objc_msgSend([v5 alloc], "initWithObjects:", v6, 0);

  +[PPContactScorer scoreContactNameRecords:](PPContactScorer, "scoreContactNameRecords:", v9);
  v7 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, uint64_t))(v7 + 16))(v7, v8, a3);

}

uint64_t __62__PPLocalContactStore_upcomingRelevantContactsForQuery_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "containsObject:", v6);

  if ((v7 & 1) == 0)
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v3, "contact");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v10);

  }
  return v7 ^ 1u;
}

uint64_t __62__PPLocalContactStore_upcomingRelevantContactsForQuery_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v4 = (void *)MEMORY[0x1E0D70D00];
  v5 = a3;
  objc_msgSend(a2, "score");
  v7 = v6;
  objc_msgSend(v5, "score");
  v9 = v8;

  return objc_msgSend(v4, "reverseCompareDouble:withDouble:", v7, v9);
}

void __55__PPLocalContactStore_resolveContactsForNamedEntities___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  uint64_t v34;
  id obj;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "source") == 1)
  {
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    obj = *(id *)(a1 + 32);
    v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (!v37)
      goto LABEL_20;
    v36 = *(_QWORD *)v40;
    while (1)
    {
      v4 = 0;
      do
      {
        v5 = a1;
        if (*(_QWORD *)v40 != v36)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v4);
        v38 = MEMORY[0x1C3BD6630]();
        objc_msgSend(v3, "firstName");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "item");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "name");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v7, "localizedCaseInsensitiveCompare:", v9);

        objc_msgSend(v3, "lastName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "item");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "name");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v11, "localizedCaseInsensitiveCompare:", v13);

        objc_msgSend(v3, "nickname");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "item");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "name");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v15, "localizedCaseInsensitiveCompare:", v17);

        if (!v10 || !v14 || !v18)
        {
          a1 = v5;
          v23 = *(void **)(v5 + 40);
          v24 = *(void **)(v5 + 48);
          objc_msgSend(v6, "score");
          goto LABEL_13;
        }
        objc_msgSend(v3, "localizedFullName");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "item");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "name");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v19, "localizedCaseInsensitiveContainsString:", v21);

        a1 = v5;
        if (v22)
        {
          v23 = *(void **)(v5 + 40);
          v24 = *(void **)(v5 + 48);
          objc_msgSend(v6, "score");
          v26 = v25 * 0.9;
LABEL_13:
          objc_msgSend(v24, "_scoredContactFromContactsRecord:score:", v3, v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "addObject:", v27);
          v28 = (void *)v38;
LABEL_14:

          goto LABEL_15;
        }
        objc_msgSend(*(id *)(v5 + 48), "similarityForNamedEntity:nameRecord:", v6, v3);
        v28 = (void *)v38;
        if (v29 > 0.5)
        {
          v30 = v29;
          v31 = *(void **)(a1 + 40);
          v32 = *(void **)(a1 + 48);
          objc_msgSend(v6, "score");
          objc_msgSend(v32, "_scoredContactFromContactsRecord:score:", v3, v30 * 0.9 * v33);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "addObject:", v27);
          goto LABEL_14;
        }
LABEL_15:
        objc_autoreleasePoolPop(v28);
        ++v4;
      }
      while (v37 != v4);
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      v37 = v34;
      if (!v34)
      {
LABEL_20:

        break;
      }
    }
  }

}

uint64_t __27__PPLocalContactStore_init__block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0D19E98], "defaultHarvestStore");
}

@end
