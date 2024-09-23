@implementation PXSharedLibraryRulePeopleDataManager

- (PXSharedLibraryRulePeopleDataManager)initWithSharedLibraryStatusProvider:(id)a3
{
  id v5;
  PXSharedLibraryRulePeopleDataManager *v6;
  PXSharedLibraryRulePeopleDataManager *v7;
  void *v8;
  uint64_t v9;
  PXSharedLibraryRule *currentSharedLibraryRule;
  NSArray *currentPersonIdentifiers;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PXSharedLibraryRulePeopleDataManager;
  v6 = -[PXSharedLibraryRulePeopleDataManager init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_statusProvider, a3);
    -[PXSharedLibraryStatusProvider registerChangeObserver:context:](v7->_statusProvider, "registerChangeObserver:context:", v7, PXSharedLibraryStatusProviderObservationContext_194418);
    -[PXSharedLibraryStatusProvider sharedLibrary](v7->_statusProvider, "sharedLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "rule");
    v9 = objc_claimAutoreleasedReturnValue();
    currentSharedLibraryRule = v7->_currentSharedLibraryRule;
    v7->_currentSharedLibraryRule = (PXSharedLibraryRule *)v9;

    currentPersonIdentifiers = v7->_currentPersonIdentifiers;
    v7->_currentPersonIdentifiers = (NSArray *)MEMORY[0x1E0C9AA60];

  }
  return v7;
}

- (void)_updateCurrentSnapshot
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSArray *v7;
  NSString *statusMessage;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  objc_class *v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSDiffableDataSourceSnapshot *v41;
  NSDiffableDataSourceSnapshot *currentSnapshot;
  NSDiffableDataSourceSnapshot *v43;
  NSArray *currentPersonIdentifiers;
  void *v45;
  void *v46;
  void *v47;
  void *v49;
  id v50;
  PXSharedLibraryRulePeopleDataManager *v51;
  void *v52;
  uint8_t buf[16];
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  -[PXSharedLibraryRulePeopleDataManager statusProvider](self, "statusProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sharedLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXSharedLibraryRule personUUIDs](self->_currentSharedLibraryRule, "personUUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  v52 = v6;
  v7 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  statusMessage = self->_statusMessage;
  v51 = self;
  self->_statusMessage = 0;

  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  objc_msgSend(v4, "participants");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v59;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v59 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v14);
        if ((objc_msgSend(v15, "isCurrentUser") & 1) == 0)
        {
          objc_msgSend(v15, "person");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = (objc_class *)objc_opt_class();
              NSStringFromClass(v23);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "px_descriptionForAssertionMessage");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", a2, v51, CFSTR("PXSharedLibraryRulePeopleDataManager.m"), 69, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("participant.person"), v24, v46);

            }
            objc_msgSend(v16, "uuid");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "removeObject:", v17);

            +[PXSharedLibraryRulePerson rulePersonWithParticipant:](PXSharedLibraryRulePerson, "rulePersonWithParticipant:", v15);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "addObject:", v18);

            v19 = (void *)MEMORY[0x1E0CD16C0];
            objc_msgSend(v16, "uuid");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "localIdentifierWithUUID:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSArray addObject:](v7, "addObject:", v21);

LABEL_11:
          }
          else if (!v51->_statusMessage && (objc_msgSend(v15, "isCurrentUser") & 1) == 0)
          {
            PXSharedLibrarySettingsTextForIdentifyingParticipant(v15);
            v22 = objc_claimAutoreleasedReturnValue();
            v20 = v51->_statusMessage;
            v51->_statusMessage = (NSString *)v22;
            goto LABEL_11;
          }

        }
        ++v14;
      }
      while (v12 != v14);
      v25 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
      v12 = v25;
    }
    while (v25);
  }

  v26 = v4;
  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    v27 = v26;
  else
    v27 = 0;

  objc_msgSend(v27, "libraryScope");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "photoLibrary");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    v49 = v29;
    v50 = v26;
    objc_msgSend(v29, "librarySpecificFetchOptions");
    v30 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsWithLocalIdentifiers:options:", v52, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v55;
      do
      {
        for (i = 0; i != v33; ++i)
        {
          if (*(_QWORD *)v55 != v34)
            objc_enumerationMutation(v31);
          v36 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
          +[PXSharedLibraryRulePerson rulePersonWithPerson:](PXSharedLibraryRulePerson, "rulePersonWithPerson:", v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v37);

          v38 = (void *)MEMORY[0x1E0CD16C0];
          objc_msgSend(v36, "uuid");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "localIdentifierWithUUID:", v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray addObject:](v7, "addObject:", v40);

        }
        v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
      }
      while (v33);
    }

    v29 = v49;
    v26 = v50;
  }
  else
  {
    PLSharedLibraryGetLog();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v30, OS_LOG_TYPE_ERROR, "Unable to add people to the snapshot without a valid Photo Library", buf, 2u);
    }
  }

  v41 = (NSDiffableDataSourceSnapshot *)objc_opt_new();
  -[NSDiffableDataSourceSnapshot appendSectionsWithIdentifiers:](v41, "appendSectionsWithIdentifiers:", &unk_1E53EA128);
  -[NSDiffableDataSourceSnapshot appendItemsWithIdentifiers:](v41, "appendItemsWithIdentifiers:", v9);
  currentSnapshot = v51->_currentSnapshot;
  v51->_currentSnapshot = v41;
  v43 = v41;

  currentPersonIdentifiers = v51->_currentPersonIdentifiers;
  v51->_currentPersonIdentifiers = v7;

  -[PXSharedLibraryRulePeopleDataManager delegate](v51, "delegate");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "sharedLibraryRulePeopleControllerDidChangeCurrentSnapshot:", v51);

}

- (void)_updateIfNeeded
{
  void *v3;
  void *v4;
  PXSharedLibraryRule *v5;
  char v6;
  PXSharedLibraryRule *obj;

  -[PXSharedLibraryRulePeopleDataManager statusProvider](self, "statusProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sharedLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rule");
  obj = (PXSharedLibraryRule *)objc_claimAutoreleasedReturnValue();

  v5 = self->_currentSharedLibraryRule;
  if (v5 == obj)
  {

  }
  else
  {
    v6 = -[PXSharedLibraryRule isEqual:](v5, "isEqual:", obj);

    if ((v6 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_currentSharedLibraryRule, obj);
      -[PXSharedLibraryRulePeopleDataManager _updateCurrentSnapshot](self, "_updateCurrentSnapshot");
    }
  }

}

- (NSDiffableDataSourceSnapshot)currentSnapshot
{
  NSDiffableDataSourceSnapshot *currentSnapshot;

  currentSnapshot = self->_currentSnapshot;
  if (!currentSnapshot)
  {
    -[PXSharedLibraryRulePeopleDataManager _updateCurrentSnapshot](self, "_updateCurrentSnapshot");
    currentSnapshot = self->_currentSnapshot;
  }
  return currentSnapshot;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  void *v8;
  id v9;

  v9 = a3;
  if ((void *)PXSharedLibraryStatusProviderObservationContext_194418 != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryRulePeopleDataManager.m"), 123, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  -[PXSharedLibraryRulePeopleDataManager _updateIfNeeded](self, "_updateIfNeeded");

}

- (NSArray)currentPersonIdentifiers
{
  return self->_currentPersonIdentifiers;
}

- (NSString)statusMessage
{
  return self->_statusMessage;
}

- (PXSharedLibraryRulePeopleDataManagerDelegate)delegate
{
  return (PXSharedLibraryRulePeopleDataManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PXSharedLibraryStatusProvider)statusProvider
{
  return self->_statusProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_statusMessage, 0);
  objc_storeStrong((id *)&self->_currentPersonIdentifiers, 0);
  objc_storeStrong((id *)&self->_currentSnapshot, 0);
  objc_storeStrong((id *)&self->_currentSharedLibraryRule, 0);
}

@end
