@implementation PXSharedLibraryParticipantDataSourceManager

- (id)createInitialDataSource
{
  return (id)objc_msgSend((id)objc_opt_class(), "aggregatedDataSource");
}

- (void)replaceDataSourceWithDataSource:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXSectionedDataSourceManager dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "identifier");
  if (v6 != objc_msgSend(v4, "identifier"))
  {
    objc_msgSend(off_1E50B1608, "changeDetailsWithNoIncrementalChanges");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc((Class)off_1E50B4A18);
    v9 = objc_msgSend(v5, "identifier");
    v10 = objc_msgSend(v4, "identifier");
    v13 = &unk_1E53EE5E0;
    v14[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v8, "initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:", v9, v10, v7, v11, 0);

    -[PXSectionedDataSourceManager setDataSource:changeDetails:](self, "setDataSource:changeDetails:", v4, v12);
  }

}

- (void)addParticipants:(id)a3
{
  id v5;
  void *v6;
  unint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  PXSharedLibraryParticipantDataSourceManager *v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  void *v47;
  void *v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[PXSectionedDataSourceManager dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "canAddParticipants") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryParticipantDataSourceManager.m"), 60, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("currentDataSource.canAddParticipants"));

  }
  v7 = objc_msgSend(v5, "count");
  if (v7 > 5 - objc_msgSend(v6, "numberOfParticipants"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryParticipantDataSourceManager.m"), 61, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("newParticipants.count <= PXSharedLibraryParticipantsMaxCount - currentDataSource.numberOfParticipants"));

  }
  v41 = self;
  v42 = v6;
  objc_msgSend(v6, "participants");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0D71568], "pl_sharedAccountStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cachedPrimaryAppleAccount");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "username");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v13 = v5;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v44 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        objc_msgSend(v18, "appleIDAddress");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "caseInsensitiveCompare:", v12);

        if ((objc_msgSend(v8, "containsObject:", v18) & 1) == 0
          && (objc_msgSend(v9, "containsObject:", v18) & 1) == 0
          && v20)
        {
          objc_msgSend(v9, "addObject:", v18);
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    }
    while (v15);
  }

  v21 = v42;
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v42, "participants");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v22, "mutableCopy");

    v24 = objc_msgSend(v42, "numberOfParticipants");
    v25 = objc_msgSend(v9, "count");
    v39 = v23;
    v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", v24, v25);
    objc_msgSend(v23, "insertObjects:atIndexes:", v9, v40);
    v26 = -[PXSharedLibraryParticipantDataSource _initWithParticipants:]([PXSharedLibraryParticipantDataSource alloc], "_initWithParticipants:", v23);
    v38 = (void *)objc_msgSend(v13, "copy");
    objc_msgSend(v42, "participants");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v26;
    objc_msgSend(v26, "participants");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(off_1E50B1608, "changeDetailsFromArray:toArray:changedObjects:", v27, v28, v38);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = objc_alloc((Class)off_1E50B4A18);
    v31 = objc_msgSend(v42, "identifier");
    v32 = objc_msgSend(v26, "identifier");
    v47 = &unk_1E53EE5E0;
    v48 = v29;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)objc_msgSend(v30, "initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:", v31, v32, v29, v33, 0);

    v21 = v42;
    -[PXSectionedDataSourceManager setDataSource:changeDetails:](v41, "setDataSource:changeDetails:", v37, v34);

  }
}

- (void)removeParticipantAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  -[PXSectionedDataSourceManager dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "participants");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectAtIndex:", a3);
  v8 = -[PXSharedLibraryParticipantDataSource _initWithParticipants:]([PXSharedLibraryParticipantDataSource alloc], "_initWithParticipants:", v6);
  v21[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "participants");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "participants");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E50B1608, "changeDetailsFromArray:toArray:changedObjects:", v10, v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_alloc((Class)off_1E50B4A18);
  v14 = objc_msgSend(v4, "identifier");
  v15 = objc_msgSend(v8, "identifier");
  v19 = &unk_1E53EE5E0;
  v20 = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v13, "initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:", v14, v15, v12, v16, 0);

  -[PXSectionedDataSourceManager setDataSource:changeDetails:](self, "setDataSource:changeDetails:", v8, v17);
}

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXSharedLibraryParticipantDataSourceManager;
  -[PXSharedLibraryParticipantDataSourceManager performChanges:](&v3, sel_performChanges_, a3);
}

- (id)pauseChangeDeliveryWithTimeout:(double)a3 identifier:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryParticipantDataSourceManager.m"), 114, CFSTR("Pausing changes is not supported in PXSharedLibraryParticipantDataSourceManager."));

  abort();
}

- (void)resumeChangeDelivery:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryParticipantDataSourceManager.m"), 118, CFSTR("Resuming changes is not supported in PXSharedLibraryParticipantDataSourceManager."));

  abort();
}

+ (id)aggregatedDataSourceWithParticipants:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[PXSharedLibraryParticipantDataSource _initWithParticipants:]([PXSharedLibraryParticipantDataSource alloc], "_initWithParticipants:", v3);

  return v4;
}

+ (id)aggregatedDataSource
{
  return (id)objc_msgSend(a1, "aggregatedDataSourceWithParticipants:", MEMORY[0x1E0C9AA60]);
}

@end
