@implementation PPContactsImporter

- (PPContactsImporter)initWithDatabase:(id)a3
{
  id v5;
  PPContactsImporter *v6;
  PPContactsImporter *v7;
  PPContactStorage *v8;
  PPLocalContactStore *v9;
  PPLocalContactStore *contactStore;
  PPNamedEntityStorage *v11;
  PPLocalNamedEntityStore *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  PPLocalNamedEntityStore *namedEntityStore;
  void *v17;
  NSObject *v18;
  objc_super v20;
  uint8_t buf[16];
  _QWORD v22[4];
  id v23;
  id location;

  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PPContactsImporter;
  v6 = -[PPContactsImporter init](&v20, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_db, a3);
    v8 = -[PPContactStorage initWithDatabase:foundInAppsHarvestStoreGetter:]([PPContactStorage alloc], "initWithDatabase:foundInAppsHarvestStoreGetter:", v7->_db, &__block_literal_global_8092);
    v9 = -[PPLocalContactStore initWithStorage:namedEntityStoreOverride:]([PPLocalContactStore alloc], "initWithStorage:namedEntityStoreOverride:", v8, 0);
    contactStore = v7->_contactStore;
    v7->_contactStore = v9;

    v11 = -[PPNamedEntityStorage initWithDatabase:]([PPNamedEntityStorage alloc], "initWithDatabase:", v7->_db);
    v12 = [PPLocalNamedEntityStore alloc];
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D815E8]), "initWithResult:", v7->_contactStore);
    +[PPTrialWrapper sharedInstance](PPTrialWrapper, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[PPLocalNamedEntityStore initWithStorage:topicStoreForNamedEntityMapping:lazyContactStoreForMapsFeedback:trialWrapper:](v12, "initWithStorage:topicStoreForNamedEntityMapping:lazyContactStoreForMapsFeedback:trialWrapper:", v11, 0, v13, v14);
    namedEntityStore = v7->_namedEntityStore;
    v7->_namedEntityStore = (PPLocalNamedEntityStore *)v15;

    location = 0;
    objc_initWeak(&location, v7);
    v17 = (void *)MEMORY[0x1E0D70BF0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __47__PPContactsImporter__registerForNotifications__block_invoke;
    v22[3] = &unk_1E7E1FCC0;
    objc_copyWeak(&v23, &location);
    objc_msgSend(v17, "addContactsObserverForLifetimeOfObject:block:", v7, v22);
    pp_contacts_log_handle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v18, OS_LOG_TYPE_DEFAULT, "PPContactsImporter: performing initial history sync up.", buf, 2u);
    }

    -[PPContactsImporter _handleNotificationWithError:]((uint64_t)v7);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);

  }
  return v7;
}

- (void)importContactsDataWithShouldContinueBlock:(id)a3
{
  uint64_t (**v3)(_QWORD);
  char v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  uint64_t v8;
  PPSQLDatabase *db;
  void *v10;
  double v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  PPContactsImporter *v21;
  id v22;
  void *v23;
  PPSQLDatabase *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[6];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint8_t v37[128];
  __int128 buf;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = (uint64_t (**)(_QWORD))a3;
  v4 = +[PPContactsImporter _shouldImport]();
  pp_contacts_log_handle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if ((v4 & 1) != 0)
  {
    if (v6)
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1C392E000, v5, OS_LOG_TYPE_DEFAULT, "PPContactsImporter: performing contacts import.", (uint8_t *)&buf, 2u);
    }

    +[PPContactScorer mostRelevantContactsWithStore:shouldContinueBlock:](PPContactScorer, "mostRelevantContactsWithStore:shouldContinueBlock:", self->_contactStore, v3);
    v5 = objc_claimAutoreleasedReturnValue();
    pp_contacts_log_handle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = -[NSObject count](v5, "count");
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_1C392E000, v7, OS_LOG_TYPE_DEFAULT, "PPContactsImporter: got %tu scored contacts", (uint8_t *)&buf, 0xCu);
    }

    if (-[NSObject count](v5, "count"))
    {
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v39 = 0x3032000000;
      v40 = __Block_byref_object_copy__8083;
      v41 = __Block_byref_object_dispose__8084;
      v42 = 0;
      v31 = 0;
      v32 = &v31;
      v33 = 0x3032000000;
      v34 = __Block_byref_object_copy__8083;
      v35 = __Block_byref_object_dispose__8084;
      v36 = 0;
      db = self->_db;
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __69__PPContactsImporter__loadContactIdentifiersAlreadyImportedInPastDay__block_invoke;
      v30[3] = &unk_1E7E18630;
      v30[4] = &buf;
      v30[5] = &v31;
      -[PPSQLDatabase readTransactionWithClient:block:](db, "readTransactionWithClient:block:", 6, v30);
      if (*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
      {
        v10 = (void *)objc_opt_new();
        objc_msgSend(v10, "timeIntervalSinceDate:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
        if ((int)(v11 / 86400.0) >= 1)
        {
          v12 = (void *)v32[5];
          v32[5] = 0;

        }
      }
      v13 = (id)v32[5];
      _Block_object_dispose(&v31, 8);

      _Block_object_dispose(&buf, 8);
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v5 = v5;
      v14 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v26, v37, 16);
      if (v14)
      {
        v15 = *(_QWORD *)v27;
        while (2)
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v27 != v15)
              objc_enumerationMutation(v5);
            v17 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
            v18 = (void *)MEMORY[0x1C3BD6630]();
            if ((v3[2](v3) & 1) == 0)
            {
              if (v13)
              {
                v22 = v13;
                v23 = v22;
                if (self)
                {
                  v24 = self->_db;
                  *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
                  *((_QWORD *)&buf + 1) = 3221225472;
                  v39 = (uint64_t)__56__PPContactsImporter__stashImportedContactsIdentifiers___block_invoke;
                  v40 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E7E1EEB0;
                  v41 = (void (*)(uint64_t))v22;
                  -[PPSQLDatabase writeTransactionWithClient:block:](v24, "writeTransactionWithClient:block:", 6, &buf);

                }
              }
              goto LABEL_32;
            }
            objc_msgSend(v17, "contact");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "contactsContactIdentifierWithError:", 0);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (!objc_msgSend(v20, "length") || objc_msgSend(v13, "containsObject:", v20))
            {

LABEL_32:
              objc_autoreleasePoolPop(v18);

              goto LABEL_33;
            }
            -[PPContactsImporter importScoredContact:contactsIdentifier:error:]((uint64_t)self, v17, v20, 0);
            objc_msgSend(v13, "addObject:", v20);

            objc_autoreleasePoolPop(v18);
          }
          v14 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v26, v37, 16);
          if (v14)
            continue;
          break;
        }

        v21 = self;
        if (!self)
          goto LABEL_33;
      }
      else
      {

        v21 = self;
      }
      -[PPSQLDatabase writeTransactionWithClient:block:](v21->_db, "writeTransactionWithClient:block:", 6, &__block_literal_global_33);
      -[PPContactsImporter _flushNamedEntities]((uint64_t)self);
LABEL_33:

    }
  }
  else if (v6)
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1C392E000, v5, OS_LOG_TYPE_DEFAULT, "PPContactsImporter: skipping Contacts import due to settings.", (uint8_t *)&buf, 2u);
  }

}

- (void)visitDropEverythingEvent:(id)a3
{
  NSObject *v4;
  PPLocalNamedEntityStore *namedEntityStore;
  uint64_t v6;
  BOOL v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  void *v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  pp_contacts_log_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v4, OS_LOG_TYPE_DEFAULT, "PPContactsImporter: CNChangeHistoryDropEverythingEvent", buf, 2u);
  }

  v12 = 0;
  namedEntityStore = self->_namedEntityStore;
  v6 = *MEMORY[0x1E0D70DD0];
  v11 = 0;
  v7 = -[PPLocalNamedEntityStore deleteAllNamedEntitiesFromSourcesWithBundleId:deletedCount:error:](namedEntityStore, "deleteAllNamedEntitiesFromSourcesWithBundleId:deletedCount:error:", v6, &v12, &v11);
  v8 = v11;
  pp_contacts_log_handle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v14 = v12;
      _os_log_impl(&dword_1C392E000, v10, OS_LOG_TYPE_DEFAULT, "PPContactsImporter: CNChangeHistoryDropEverythingEvent: deleted %tu named entities", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v8;
    _os_log_error_impl(&dword_1C392E000, v10, OS_LOG_TYPE_ERROR, "PPContactsImporter: CNChangeHistoryDropEverythingEvent: failed to delete entities: %@", buf, 0xCu);
  }

}

- (void)visitAddContactEvent:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  NSObject *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "contact");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "identifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    pp_contacts_log_handle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v4;
      _os_log_impl(&dword_1C392E000, v5, OS_LOG_TYPE_DEFAULT, "PPContactsImporter: _addContact: %@", buf, 0xCu);
    }

    -[PPContactsImporter _scoredContactWithContactIdentifier:]((uint64_t)self, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contact");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contactsContactIdentifierWithError:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v8, "length"))
    {
      pp_contacts_log_handle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v4;
        _os_log_error_impl(&dword_1C392E000, v10, OS_LOG_TYPE_ERROR, "failed to load contact %@", buf, 0xCu);
      }
      goto LABEL_13;
    }
    v16 = 0;
    v9 = -[PPContactsImporter importScoredContact:contactsIdentifier:error:]((uint64_t)self, v6, v8, &v16);
    v10 = v16;
    pp_contacts_log_handle();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v9)
    {
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
LABEL_12:

LABEL_13:
        goto LABEL_14;
      }
      objc_msgSend(v6, "contact");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v18 = v14;
      _os_log_impl(&dword_1C392E000, v12, OS_LOG_TYPE_DEFAULT, "PPContactsImporter: _addContact: imported %@ due to CN change", buf, 0xCu);
    }
    else
    {
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        goto LABEL_12;
      objc_msgSend(v6, "contact");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v18 = v14;
      v19 = 2112;
      v20 = v10;
      _os_log_error_impl(&dword_1C392E000, v12, OS_LOG_TYPE_ERROR, "PPContactsImporter: _addContact: failed to import %@: %@", buf, 0x16u);
    }

    goto LABEL_12;
  }
LABEL_14:

}

- (void)visitUpdateContactEvent:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  PPLocalNamedEntityStore *namedEntityStore;
  id v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  id v36;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  NSObject *v48;
  id v49;
  __int128 v50;
  uint64_t (*v51)(uint64_t, void *);
  void *v52;
  id v53;
  __int128 buf;
  void (*v55)(uint64_t, void *);
  void *v56;
  id v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "contact");
  v47 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "identifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    pp_contacts_log_handle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v4;
      _os_log_impl(&dword_1C392E000, v5, OS_LOG_TYPE_DEFAULT, "PPContactsImporter: _updateContact: %@", (uint8_t *)&buf, 0xCu);
    }

    -[PPContactsImporter _scoredContactWithContactIdentifier:]((uint64_t)self, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contact");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contactsContactIdentifierWithError:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "length"))
    {
      v44 = v8;
      -[PPContactsImporter _entitiesForScoredContact:](v6);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "_pas_mappedArrayWithTransform:", &__block_literal_global_40);
      v43 = objc_claimAutoreleasedReturnValue();
      v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v43);
      pp_contacts_log_handle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v39 = objc_msgSend(v46, "count");
        LODWORD(buf) = 134217984;
        *(_QWORD *)((char *)&buf + 4) = v39;
        _os_log_debug_impl(&dword_1C392E000, v9, OS_LOG_TYPE_DEBUG, "PPContactsImporter: _updateContact: new set: %tu", (uint8_t *)&buf, 0xCu);
      }

      -[PPContactsImporter _sourceForContactWithContactIdentifier:](v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_opt_new();
      v12 = (void *)MEMORY[0x1C3BD6630]();
      v13 = objc_alloc(MEMORY[0x1E0C99E60]);
      objc_msgSend(v10, "bundleId");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v13, "initWithObjects:", v14, 0);

      objc_autoreleasePoolPop(v12);
      objc_msgSend(v11, "setMatchingSourceBundleIds:", v15);

      v16 = (void *)MEMORY[0x1C3BD6630]();
      v17 = objc_alloc(MEMORY[0x1E0C99E60]);
      objc_msgSend(v10, "documentId");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v17, "initWithObjects:", v18, 0);

      objc_autoreleasePoolPop(v16);
      objc_msgSend(v11, "setMatchingSourceDocumentIds:", v19);

      v20 = (void *)MEMORY[0x1C3BD6630]();
      v21 = objc_alloc(MEMORY[0x1E0C99E60]);
      objc_msgSend(v10, "groupId");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend(v21, "initWithObjects:", v22, 0);

      objc_autoreleasePoolPop(v20);
      objc_msgSend(v11, "setMatchingSourceGroupIds:", v23);

      v24 = (void *)objc_opt_new();
      namedEntityStore = self->_namedEntityStore;
      v49 = 0;
      *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
      *((_QWORD *)&buf + 1) = 3221225472;
      v55 = __51__PPContactsImporter__updateContactWithIdentifier___block_invoke_42;
      v56 = &unk_1E7E1F540;
      v26 = v24;
      v57 = v26;
      LOBYTE(namedEntityStore) = -[PPLocalNamedEntityStore iterNamedEntityRecordsWithQuery:error:block:](namedEntityStore, "iterNamedEntityRecordsWithQuery:error:block:", v11, &v49, &buf);
      v27 = v49;
      pp_contacts_log_handle();
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = v28;
      if ((namedEntityStore & 1) != 0)
      {
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          v40 = objc_msgSend(v26, "count");
          LODWORD(v50) = 134217984;
          *(_QWORD *)((char *)&v50 + 4) = v40;
          _os_log_debug_impl(&dword_1C392E000, v29, OS_LOG_TYPE_DEBUG, "PPContactsImporter: _updateContact: existing set: %tu", (uint8_t *)&v50, 0xCu);
        }

        v30 = (void *)objc_msgSend(v26, "mutableCopy");
        objc_msgSend(v30, "minusSet:", v46);
        pp_contacts_log_handle();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          v41 = objc_msgSend(v30, "count");
          LODWORD(v50) = 134217984;
          *(_QWORD *)((char *)&v50 + 4) = v41;
          _os_log_debug_impl(&dword_1C392E000, v31, OS_LOG_TYPE_DEBUG, "PPContactsImporter: _updateContact: to delete: %tu", (uint8_t *)&v50, 0xCu);
        }

        if (objc_msgSend(v30, "count"))
        {
          pp_contacts_log_handle();
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v50) = 0;
            _os_log_impl(&dword_1C392E000, v32, OS_LOG_TYPE_DEFAULT, "PPContactsImporter: _updateContact: detected deletions, reimporting whole contact.", (uint8_t *)&v50, 2u);
          }

          -[PPContactsImporter _deleteAndReAddWholeContact:contactIdentifier:]((uint64_t)self, v6, v4);
          v33 = (void *)v43;
          v8 = v44;
        }
        else
        {
          v34 = (void *)objc_msgSend(v46, "mutableCopy");
          objc_msgSend(v34, "minusSet:", v26);
          pp_contacts_log_handle();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
          {
            v42 = objc_msgSend(v34, "count");
            LODWORD(v50) = 134217984;
            *(_QWORD *)((char *)&v50 + 4) = v42;
            _os_log_debug_impl(&dword_1C392E000, v35, OS_LOG_TYPE_DEBUG, "PPContactsImporter: _updateContact: to add: %tu", (uint8_t *)&v50, 0xCu);
          }

          *(_QWORD *)&v50 = MEMORY[0x1E0C809B0];
          *((_QWORD *)&v50 + 1) = 3221225472;
          v51 = __51__PPContactsImporter__updateContactWithIdentifier___block_invoke_44;
          v52 = &unk_1E7E18678;
          v36 = v34;
          v53 = v36;
          objc_msgSend(v45, "_pas_filteredArrayWithTest:", &v50);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v37, "count"))
          {
            v48 = v27;
            -[PPContactsImporter _donateScoredNamedEntities:source:error:]((uint64_t)self, v37, v10, &v48);
            v38 = v48;

            v27 = v38;
          }
          v33 = (void *)v43;

          v8 = v44;
        }

      }
      else
      {
        v8 = v44;
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          LODWORD(v50) = 138412290;
          *(_QWORD *)((char *)&v50 + 4) = v27;
          _os_log_error_impl(&dword_1C392E000, v29, OS_LOG_TYPE_ERROR, "PPContactsImporter: _updateContact: failed to iterate existing records: %@", (uint8_t *)&v50, 0xCu);
        }

        -[PPContactsImporter _deleteAndReAddWholeContact:contactIdentifier:]((uint64_t)self, v6, v4);
        v33 = (void *)v43;
      }

    }
    else
    {
      pp_contacts_log_handle();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v4;
        _os_log_error_impl(&dword_1C392E000, v27, OS_LOG_TYPE_ERROR, "failed to load contact %@", (uint8_t *)&buf, 0xCu);
      }
    }

  }
}

- (void)visitDeleteContactEvent:(id)a3
{
  NSObject *v4;
  PPLocalNamedEntityStore *namedEntityStore;
  uint64_t v6;
  void *v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  id v13;
  void *v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "contactIdentifier");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    pp_contacts_log_handle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v12;
      _os_log_impl(&dword_1C392E000, v4, OS_LOG_TYPE_DEFAULT, "PPContactsImporter: _deleteContact: %@", buf, 0xCu);
    }

    v14 = 0;
    namedEntityStore = self->_namedEntityStore;
    v6 = *MEMORY[0x1E0D70DD0];
    v19[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    v8 = -[PPLocalNamedEntityStore deleteAllNamedEntitiesFromSourcesWithBundleId:documentIds:deletedCount:error:](namedEntityStore, "deleteAllNamedEntitiesFromSourcesWithBundleId:documentIds:deletedCount:error:", v6, v7, &v14, &v13);
    v9 = v13;

    pp_contacts_log_handle();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v8)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        v16 = v14;
        v17 = 2112;
        v18 = v12;
        _os_log_impl(&dword_1C392E000, v11, OS_LOG_TYPE_DEFAULT, "PPContactsImporter: _deleteContact: deleted %tu named entities for %@", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v9;
      _os_log_error_impl(&dword_1C392E000, v11, OS_LOG_TYPE_ERROR, "PPContactsImporter: _deleteContact: failed to delete entities: %@", buf, 0xCu);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_namedEntityStore, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_db, 0);
}

- (id)_scoredContactWithContactIdentifier:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v13;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_opt_new();
  v19[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMatchingIdentifiers:", v5);

  v6 = *(void **)(a1 + 16);
  v14 = 0;
  objc_msgSend(v6, "contactsWithQuery:error:", v4, &v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v14;
  if (v7)
  {
    +[PPContactScorer scoredContactsWithContacts:](PPContactScorer, "scoredContactsWithContacts:", v7);
    v9 = objc_claimAutoreleasedReturnValue();
    if ((unint64_t)-[NSObject count](v9, "count") >= 2)
    {
      pp_default_log_handle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        v13 = -[NSObject count](v9, "count");
        *(_DWORD *)buf = 138412546;
        v16 = v3;
        v17 = 2048;
        v18 = v13;
        _os_log_fault_impl(&dword_1C392E000, v10, OS_LOG_TYPE_FAULT, "received an unexpected number of contacts back from identifier query: %@ -> %tu", buf, 0x16u);
      }

    }
    -[NSObject firstObject](v9, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    pp_contacts_log_handle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v8;
      _os_log_error_impl(&dword_1C392E000, v9, OS_LOG_TYPE_ERROR, "PPContactsImporter: _addContact: failed to load contacts to import from CN: %@", buf, 0xCu);
    }
    v11 = 0;
  }

  return v11;
}

- (id)_entitiesForScoredContact:(void *)a1
{
  id v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  double v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  double v45;
  void *v46;
  void *v48;
  id v49;
  id obj;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v1, "scoredPostalAddresses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithCapacity:", objc_msgSend(v3, "count") + 2);

  objc_msgSend(v1, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedFullName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0D70BC0]);
    objc_msgSend(v1, "contact");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedFullName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "languageCode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v8, "initWithName:category:language:", v10, 1, v12);

    v14 = objc_alloc(MEMORY[0x1E0D70C38]);
    objc_msgSend(v1, "score");
    v16 = (void *)objc_msgSend(v14, "initWithItem:score:", v13, fmin(v15, 1.0));
    objc_msgSend(v4, "addObject:", v16);

  }
  objc_msgSend(v1, "contact");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "organizationName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "length");

  if (v19)
  {
    v20 = objc_alloc(MEMORY[0x1E0D70BC0]);
    objc_msgSend(v1, "contact");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "organizationName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "languageCode");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v20, "initWithName:category:language:", v22, 2, v24);

    v26 = objc_alloc(MEMORY[0x1E0D70C38]);
    objc_msgSend(v1, "score");
    v28 = (void *)objc_msgSend(v26, "initWithItem:score:", v25, fmin(v27, 1.0));
    objc_msgSend(v4, "addObject:", v28);

  }
  v48 = v1;
  v49 = v4;
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  objc_msgSend(v1, "scoredPostalAddresses");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v52 != v31)
          objc_enumerationMutation(obj);
        v33 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        objc_msgSend(v33, "labeledValue");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "value");
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v35, "singleLineNormalizedAddressString");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (v36)
        {
          objc_msgSend(v35, "thoroughfare");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v37, "length"))
          {
            objc_msgSend(v35, "locality");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v38, "length"))
            {

            }
            else
            {
              objc_msgSend(v35, "postalCode");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = objc_msgSend(v39, "length");

              if (!v40)
                goto LABEL_17;
            }
            v41 = objc_alloc(MEMORY[0x1E0D70BC0]);
            objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "languageCode");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = (void *)objc_msgSend(v41, "initWithName:category:language:", v36, 12, v43);

            v44 = objc_alloc(MEMORY[0x1E0D70C38]);
            objc_msgSend(v33, "score");
            v46 = (void *)objc_msgSend(v44, "initWithItem:score:", v37, fmin(v45, 1.0));
            objc_msgSend(v49, "addObject:", v46);

          }
        }
LABEL_17:

      }
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
    }
    while (v30);
  }

  return v49;
}

- (id)_sourceForContactWithContactIdentifier:(void *)a1
{
  objc_class *v1;
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v1 = (objc_class *)MEMORY[0x1E0D70C80];
  v2 = a1;
  v3 = (void *)objc_msgSend([v1 alloc], "initWithDwellTimeSeconds:lengthSeconds:lengthCharacters:donationCount:contactHandleCount:flags:", 0, 0, 0, 0, 0, 1);
  v4 = objc_alloc(MEMORY[0x1E0D70C78]);
  v5 = *MEMORY[0x1E0D70DD0];
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_msgSend(v4, "initWithBundleId:groupId:documentId:date:relevanceDate:contactHandles:language:metadata:", v5, 0, v2, v6, 0, 0, 0, v3);

  return v7;
}

void __51__PPContactsImporter__updateContactWithIdentifier___block_invoke_42(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "entity");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (void)_deleteAndReAddWholeContact:(void *)a3 contactIdentifier:
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  char v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 24);
  v8 = *MEMORY[0x1E0D70DD0];
  v19[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  LOBYTE(v8) = objc_msgSend(v7, "deleteAllNamedEntitiesFromSourcesWithBundleId:documentIds:deletedCount:error:", v8, v9, 0, &v16);
  v10 = v16;

  if ((v8 & 1) == 0)
  {
    pp_default_log_handle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v10;
      _os_log_fault_impl(&dword_1C392E000, v11, OS_LOG_TYPE_FAULT, "PPContactsImporter failed to delete old entities during contact update and reimport: %@", buf, 0xCu);
    }

  }
  v15 = v10;
  v12 = -[PPContactsImporter importScoredContact:contactsIdentifier:error:](a1, v5, v6, &v15);
  v13 = v15;

  if ((v12 & 1) == 0)
  {
    pp_contacts_log_handle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v13;
      _os_log_error_impl(&dword_1C392E000, v14, OS_LOG_TYPE_ERROR, "PPContactsImporter: failed to import scored contact during update and reimport: %@", buf, 0xCu);
    }

  }
}

uint64_t __51__PPContactsImporter__updateContactWithIdentifier___block_invoke_44(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

- (uint64_t)_donateScoredNamedEntities:(void *)a3 source:(_QWORD *)a4 error:
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  NSObject *v16;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  pp_contacts_log_handle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_msgSend(v7, "count");
    objc_msgSend(v8, "documentId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v20 = v10;
    v21 = 2112;
    v22 = v11;
    _os_log_impl(&dword_1C392E000, v9, OS_LOG_TYPE_DEFAULT, "PPContactsImporter: donating %tu entities from %@", buf, 0x16u);

  }
  v12 = *(void **)(a1 + 24);
  v18 = 0;
  v13 = objc_msgSend(v12, "donateNamedEntities:source:algorithm:cloudSync:sentimentScore:error:", v7, v8, 14, 0, &v18, 0.0);
  v14 = v18;
  v15 = v14;
  if ((v13 & 1) == 0)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v14);
    pp_contacts_log_handle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v20 = (uint64_t)v15;
      _os_log_error_impl(&dword_1C392E000, v16, OS_LOG_TYPE_ERROR, "PPContactsImporter: failed to donate named entity: %@", buf, 0xCu);
    }

  }
  return v13;
}

- (uint64_t)importScoredContact:(void *)a3 contactsIdentifier:(_QWORD *)a4 error:
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;

  if (!a1)
    return 0;
  v7 = a2;
  -[PPContactsImporter _sourceForContactWithContactIdentifier:](a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPContactsImporter _entitiesForScoredContact:](v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count"))
    v10 = -[PPContactsImporter _donateScoredNamedEntities:source:error:](a1, v9, v8, a4);
  else
    v10 = 1;

  return v10;
}

uint64_t __51__PPContactsImporter__updateContactWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "item");
}

+ (uint64_t)_shouldImport
{
  void *v0;
  uint64_t v1;

  objc_opt_self();
  +[PPSettings sharedInstance](PPSettings, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "bundleIdentifierIsEnabledForDonation:", *MEMORY[0x1E0D70DD0]);

  return v1;
}

- (void)_flushNamedEntities
{
  void *v1;
  char v2;
  id v3;
  NSObject *v4;
  id v5;
  uint8_t buf[4];
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v1 = *(void **)(a1 + 24);
    v5 = 0;
    v2 = objc_msgSend(v1, "flushDonationsWithError:", &v5);
    v3 = v5;
    if ((v2 & 1) == 0)
    {
      pp_default_log_handle();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v7 = v3;
        _os_log_impl(&dword_1C392E000, v4, OS_LOG_TYPE_DEFAULT, "PPContactsImporter: Warning: failed to flush named entities: %@", buf, 0xCu);
      }

    }
  }
}

uint64_t __52__PPContactsImporter__removeStashedImportedContacts__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[PPSQLKVStore removeBlobForKey:transaction:](PPSQLKVStore, "removeBlobForKey:transaction:", CFSTR("alreadyImportedContactsIdentifiers"), a2);
}

void __56__PPContactsImporter__stashImportedContactsIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  objc_msgSend(v4, "addObject:", v5);

  objc_msgSend(v4, "addObject:", *(_QWORD *)(a1 + 32));
  v9 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v9;
  if (v6)
  {
    +[PPSQLKVStore storeBlob:forKey:transaction:](PPSQLKVStore, "storeBlob:forKey:transaction:", v6, CFSTR("alreadyImportedContactsIdentifiers"), v3);
  }
  else
  {
    pp_contacts_log_handle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v7;
      _os_log_error_impl(&dword_1C392E000, v8, OS_LOG_TYPE_ERROR, "_stashAlreadyImportedContactsIdentifiers: failed to serialize NSArray: %@", buf, 0xCu);
    }

  }
}

void __69__PPContactsImporter__loadContactIdentifiersAlreadyImportedInPastDay__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  uint8_t buf[4];
  const __CFString *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[PPSQLKVStore loadBlobForKey:transaction:](PPSQLKVStore, "loadBlobForKey:transaction:", CFSTR("alreadyImportedContactsIdentifiers"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3710];
    v6 = (void *)MEMORY[0x1C3BD6630]();
    v7 = objc_alloc(MEMORY[0x1E0C99E60]);
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = (void *)objc_msgSend(v7, "initWithObjects:", v8, v9, v10, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v6);
    v20 = 0;
    objc_msgSend(v5, "unarchivedObjectOfClasses:fromData:error:", v11, v4, &v20);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v20;

    if (v12 && objc_msgSend(v12, "count") == 2)
    {
      objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v16 = *(void **)(v15 + 40);
      *(_QWORD *)(v15 + 40) = v14;

      objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v19 = *(NSObject **)(v18 + 40);
      *(_QWORD *)(v18 + 40) = v17;
    }
    else
    {
      pp_contacts_log_handle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v22 = CFSTR("alreadyImportedContactsIdentifiers");
        v23 = 2112;
        v24 = v13;
        _os_log_error_impl(&dword_1C392E000, v19, OS_LOG_TYPE_ERROR, "Failed to unarchive _PASTuple2 for KVS key %@: %@", buf, 0x16u);
      }
    }

  }
}

void __47__PPContactsImporter__registerForNotifications__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    -[PPContactsImporter _handleNotificationWithError:]((uint64_t)WeakRetained);
    WeakRetained = v2;
  }

}

- (void)_handleNotificationWithError:(uint64_t)a1
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  id v18;
  uint8_t v19[128];
  uint8_t buf[4];
  NSObject *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if ((+[PPContactsImporter _shouldImport]() & 1) != 0)
  {
    v2 = *(void **)(a1 + 16);
    v18 = 0;
    objc_msgSend(v2, "contactsChangeHistoryForClient:error:", CFSTR("com.apple.proactive.PersonalizationPortrait.PPContactsImporter"), &v18);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v18;
    if (v3)
    {
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      objc_msgSend(v3, "value");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      if (v13)
      {
        v6 = *(_QWORD *)v15;
        v7 = v13;
LABEL_5:
        v8 = 0;
        while (1)
        {
          if (*(_QWORD *)v15 != v6)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v8);
          v10 = (void *)MEMORY[0x1C3BD6630]();
          objc_msgSend(v9, "acceptEventVisitor:", a1);
          objc_opt_class();
          LOBYTE(v9) = objc_opt_isKindOfClass();
          objc_autoreleasePoolPop(v10);
          if ((v9 & 1) != 0)
            break;
          if (v7 == ++v8)
          {
            v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
            if (v7)
              goto LABEL_5;
            break;
          }
        }
      }

      objc_msgSend(*(id *)(a1 + 16), "clearChangeHistoryForClient:historyResult:", CFSTR("com.apple.proactive.PersonalizationPortrait.PPContactsImporter"), v3);
      pp_contacts_log_handle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C392E000, v11, OS_LOG_TYPE_DEFAULT, "PPContactsImporter: done handling contact change history.", buf, 2u);
      }

      if (v13)
        -[PPContactsImporter _flushNamedEntities](a1);
    }
    else
    {
      pp_contacts_log_handle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v4;
        _os_log_error_impl(&dword_1C392E000, v12, OS_LOG_TYPE_ERROR, "PPContactsImporter: failed to load CN change history: %@", buf, 0xCu);
      }

    }
  }
  else
  {
    pp_contacts_log_handle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v4, OS_LOG_TYPE_DEFAULT, "PPContactsImporter: _handleNotificationWithError bypassed due to settings", buf, 2u);
    }
  }

}

uint64_t __39__PPContactsImporter_initWithDatabase___block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0D19E98], "defaultHarvestStore");
}

+ (id)defaultInstance
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  NSObject *v9;
  uint8_t buf[16];

  if ((+[PPContactsImporter _shouldImport]() & 1) != 0)
  {
    +[PPSQLDatabase sharedInstance](PPSQLDatabase, "sharedInstance");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (v2)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __37__PPContactsImporter_defaultInstance__block_invoke;
      block[3] = &unk_1E7E1F4F0;
      v4 = v2;
      v9 = v4;
      if (defaultInstance__pasOnceToken4 == -1)
      {
        v5 = v4;
      }
      else
      {
        dispatch_once(&defaultInstance__pasOnceToken4, block);
        v5 = v9;
      }
      v6 = (id)defaultInstance__pasExprOnceResult;
    }
    else
    {
      pp_contacts_log_handle();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C392E000, v5, OS_LOG_TYPE_INFO, "PPContactsImporter: giving up on initialization due to lack of DB singleton.", buf, 2u);
      }
      v6 = 0;
    }

  }
  else
  {
    pp_contacts_log_handle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v3, OS_LOG_TYPE_DEFAULT, "PPContactsImporter: defaultInstance bypassed due to settings", buf, 2u);
    }
    v6 = 0;
  }

  return v6;
}

void __37__PPContactsImporter_defaultInstance__block_invoke(uint64_t a1)
{
  void *v2;
  PPContactsImporter *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1C3BD6630]();
  v3 = -[PPContactsImporter initWithDatabase:]([PPContactsImporter alloc], "initWithDatabase:", *(_QWORD *)(a1 + 32));
  v4 = (void *)defaultInstance__pasExprOnceResult;
  defaultInstance__pasExprOnceResult = (uint64_t)v3;

  objc_autoreleasePoolPop(v2);
}

@end
