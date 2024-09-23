@implementation NSDiffableDataSourceTransaction

- (NSDiffableDataSourceSnapshot)finalSnapshot
{
  return self->_finalSnapshot;
}

- (NSArray)sectionTransactions
{
  return self->_sectionTransactions;
}

- (NSDiffableDataSourceSnapshot)initialSnapshot
{
  return self->_initialSnapshot;
}

- (BOOL)isReorderingTransaction
{
  return self->_source == 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reorderedItemIdentifiers, 0);
  objc_storeStrong((id *)&self->_sectionTransactions, 0);
  objc_storeStrong((id *)&self->_difference, 0);
  objc_storeStrong((id *)&self->_finalSnapshot, 0);
  objc_storeStrong((id *)&self->_initialSnapshot, 0);
}

- (NSDiffableDataSourceTransaction)initWithInitialSnapshot:(id)a3 finalSnapshot:(id)a4 source:(int64_t)a5 reorderedItemIdentifiers:(id)a6 difference:(id)a7 sectionTransactions:(id)a8
{
  id v15;
  id v16;
  id v17;
  NSDiffableDataSourceTransaction *v18;
  NSDiffableDataSourceTransaction *v19;
  id v21;
  id v22;
  objc_super v23;

  v22 = a3;
  v21 = a4;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)NSDiffableDataSourceTransaction;
  v18 = -[NSDiffableDataSourceTransaction init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_initialSnapshot, a3);
    objc_storeStrong((id *)&v19->_finalSnapshot, a4);
    v19->_source = a5;
    objc_storeStrong((id *)&v19->_reorderedItemIdentifiers, a6);
    objc_storeStrong((id *)&v19->_difference, a7);
    objc_storeStrong((id *)&v19->_sectionTransactions, a8);
  }

  return v19;
}

- (NSDiffableDataSourceTransaction)initWithInitialSnapshot:(id)a3 finalSnapshot:(id)a4 source:(int64_t)a5 difference:(id)a6 reorderedItemIdentifiers:(id)a7 sectionTransactions:(id)a8
{
  return -[NSDiffableDataSourceTransaction initWithInitialSnapshot:finalSnapshot:source:reorderedItemIdentifiers:difference:sectionTransactions:](self, "initWithInitialSnapshot:finalSnapshot:source:reorderedItemIdentifiers:difference:sectionTransactions:", a3, a4, a5, a7, a6, a8);
}

+ (id)applyTransactionWithInitialSnapshot:(id)a3 finalSnapshot:(id)a4 difference:(id)a5 sectionTransactions:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithInitialSnapshot:finalSnapshot:source:reorderedItemIdentifiers:difference:sectionTransactions:", v12, v11, 0, MEMORY[0x1E0C9AA60], v10, v9);

  return v13;
}

- (NSDiffableDataSourceTransaction)initWithInitialSnapshot:(id)a3 finalSnapshot:(id)a4 source:(int64_t)a5 difference:(id)a6 finalSectionSnapshots:(id)a7
{
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  NSDiffableDataSourceSectionTransaction *v19;
  void *v20;
  NSDiffableDataSourceSectionTransaction *v21;
  NSDiffableDataSourceTransaction *v22;
  NSDiffableDataSourceTransaction *v24;
  id v25;
  id v27;
  id v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v24 = self;
  v35 = *MEMORY[0x1E0C80C00];
  v28 = a3;
  v27 = a4;
  v25 = a6;
  v10 = a7;
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend(v10, "keyEnumerator");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v31;
    v15 = MEMORY[0x1E0C9AA60];
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v31 != v14)
          objc_enumerationMutation(obj);
        v17 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKey:", v17, v24);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = [NSDiffableDataSourceSectionTransaction alloc];
        v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3838]), "initWithChanges:", v15);
        v21 = -[NSDiffableDataSourceSectionTransaction initWithSectionIdentifier:initialSnapshot:finalSnapshot:difference:](v19, "initWithSectionIdentifier:initialSnapshot:finalSnapshot:difference:", v17, v18, v18, v20);

        objc_msgSend(v11, "addObject:", v21);
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v13);
  }

  v22 = -[NSDiffableDataSourceTransaction initWithInitialSnapshot:finalSnapshot:source:reorderedItemIdentifiers:difference:sectionTransactions:](v24, "initWithInitialSnapshot:finalSnapshot:source:reorderedItemIdentifiers:difference:sectionTransactions:", v28, v27, a5, MEMORY[0x1E0C9AA60], v25, v11);
  return v22;
}

- (id)_spiCopy
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _UIDiffableDataSourceTransaction *v10;
  void *v11;
  void *v12;
  int64_t v13;
  void *v14;
  void *v15;
  _UIDiffableDataSourceTransaction *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[NSDiffableDataSourceTransaction sectionTransactions](self, "sectionTransactions", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v8), "_spiCopy");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }

  v10 = [_UIDiffableDataSourceTransaction alloc];
  -[NSDiffableDataSourceTransaction initialSnapshot](self, "initialSnapshot");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDiffableDataSourceTransaction finalSnapshot](self, "finalSnapshot");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[NSDiffableDataSourceTransaction source](self, "source");
  -[NSDiffableDataSourceTransaction reorderedItemIdentifiers](self, "reorderedItemIdentifiers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDiffableDataSourceTransaction difference](self, "difference");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[_UIDiffableDataSourceTransaction initWithInitialSnapshot:finalSnapshot:source:reorderedItemIdentifiers:difference:sectionTransactions:](v10, "initWithInitialSnapshot:finalSnapshot:source:reorderedItemIdentifiers:difference:sectionTransactions:", v11, v12, v13, v14, v15, v3);

  return v16;
}

- (int64_t)source
{
  return self->_source;
}

- (NSArray)reorderedItemIdentifiers
{
  return self->_reorderedItemIdentifiers;
}

- (NSOrderedCollectionDifference)difference
{
  return self->_difference;
}

+ (id)reorderingTransactionWithInitialSnapshot:(id)a3 finalSnapshot:(id)a4 difference:(id)a5 sectionTransactions:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v11 = a5;
  v12 = a6;
  v13 = a4;
  v14 = a3;
  objc_msgSend(v11, "insertions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");
  objc_msgSend(v11, "removals");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count") + v16;

  if (v18 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSDiffableDataSourceTransaction.m"), 103, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("difference.insertions.count + difference.removals.count <= 2"));

  }
  if (!objc_msgSend(v11, "hasChanges"))
    goto LABEL_6;
  objc_msgSend(v11, "insertions");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");
  objc_msgSend(v11, "removals");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");

  if (v20 == v22)
  {
    objc_msgSend(v11, "insertions");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "object");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_6:
    v26 = (void *)MEMORY[0x1E0C9AA60];
  }
  v27 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithInitialSnapshot:finalSnapshot:source:reorderedItemIdentifiers:difference:sectionTransactions:", v14, v13, 1, v26, v11, v12);

  return v27;
}

- (BOOL)isApplyTransaction
{
  return self->_source == 0;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_source);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p - source=%@; initialSnapshot=%p; finalSnapshot=%p; difference=%@; sectionTransactions=%p>"),
    v5,
    self,
    v6,
    self->_initialSnapshot,
    self->_finalSnapshot,
    self->_difference,
    self->_sectionTransactions);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  NSDiffableDataSourceTransaction *v4;
  NSDiffableDataSourceTransaction *v5;
  NSDiffableDataSourceTransaction *v6;
  int64_t source;
  NSOrderedCollectionDifference *difference;
  void *v9;
  NSDiffableDataSourceSnapshot *initialSnapshot;
  void *v11;
  NSDiffableDataSourceSnapshot *finalSnapshot;
  void *v13;
  NSArray *sectionTransactions;
  void *v15;
  char v16;

  v4 = (NSDiffableDataSourceTransaction *)a3;
  v5 = v4;
  if (v4)
  {
    if (v4 == self)
    {
      v16 = 1;
    }
    else
    {
      v6 = v4;
      source = self->_source;
      if (source != -[NSDiffableDataSourceTransaction source](v6, "source"))
        goto LABEL_9;
      difference = self->_difference;
      -[NSDiffableDataSourceTransaction difference](v6, "difference");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(difference) = -[NSOrderedCollectionDifference isEqual:](difference, "isEqual:", v9);

      if (!(_DWORD)difference)
        goto LABEL_9;
      initialSnapshot = self->_initialSnapshot;
      -[NSDiffableDataSourceTransaction initialSnapshot](v6, "initialSnapshot");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(initialSnapshot) = -[NSDiffableDataSourceSnapshot isEqual:](initialSnapshot, "isEqual:", v11);

      if (!(_DWORD)initialSnapshot)
        goto LABEL_9;
      finalSnapshot = self->_finalSnapshot;
      -[NSDiffableDataSourceTransaction finalSnapshot](v6, "finalSnapshot");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(finalSnapshot) = -[NSDiffableDataSourceSnapshot isEqual:](finalSnapshot, "isEqual:", v13);

      if ((_DWORD)finalSnapshot)
      {
        sectionTransactions = self->_sectionTransactions;
        -[NSDiffableDataSourceTransaction sectionTransactions](v6, "sectionTransactions");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[NSArray isEqualToArray:](sectionTransactions, "isEqualToArray:", v15);

      }
      else
      {
LABEL_9:
        v16 = 0;
      }

    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (BOOL)_containsItemIdentifier:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  char v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NSDiffableDataSourceSnapshot indexOfItemIdentifier:](self->_finalSnapshot, "indexOfItemIdentifier:", v4) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = self->_sectionTransactions;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "finalSnapshot", (_QWORD)v12);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "containsItem:", v4);

          if ((v10 & 1) != 0)
          {
            LOBYTE(v6) = 1;
            goto LABEL_13;
          }
        }
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_13:

  }
  else
  {
    LOBYTE(v6) = 1;
  }

  return v6;
}

- (NSDiffableDataSourceTransaction)transactionWithSectionTransactions:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class());
  -[NSDiffableDataSourceTransaction initialSnapshot](self, "initialSnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDiffableDataSourceTransaction finalSnapshot](self, "finalSnapshot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[NSDiffableDataSourceTransaction source](self, "source");
  -[NSDiffableDataSourceTransaction reorderedItemIdentifiers](self, "reorderedItemIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDiffableDataSourceTransaction difference](self, "difference");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v5, "initWithInitialSnapshot:finalSnapshot:source:reorderedItemIdentifiers:difference:sectionTransactions:", v6, v7, v8, v9, v10, v4);

  return (NSDiffableDataSourceTransaction *)v11;
}

+ (id)_computeReorderingTransactionWithInitialSnapshot:(id)a3 reorderingUpdate:(id)a4 sectionSnapshotProvider:(id)a5
{
  id v9;
  id v10;
  void (**v11)(_QWORD, void *);
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  void *v27;
  void *v28;
  unint64_t v29;
  void *v30;
  unint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  void (**v46)(_QWORD, void *);
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  _UIIdentifierDiffer *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id *v58;
  void *v59;
  void *v60;
  void *v61;
  _UIDiffableDataSourceSectionSnapshotRebaser *v62;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  void (**v73)(_QWORD, void *);
  void *v74;
  void *v75;
  _QWORD v76[2];
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  _QWORD v81[2];

  v81[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = (void (**)(_QWORD, void *))a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_40:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSDiffableDataSourceTransaction.m"), 217, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reorderingUpdate"));

    if (v11)
      goto LABEL_4;
    goto LABEL_41;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSDiffableDataSourceTransaction.m"), 216, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("initialSnapshot"));

  if (!v10)
    goto LABEL_40;
LABEL_3:
  if (v11)
    goto LABEL_4;
LABEL_41:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSDiffableDataSourceTransaction.m"), 218, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sectionSnapshotProvider"));

LABEL_4:
  objc_msgSend(v10, "indexPathBeforeUpdate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "indexPathAfterUpdate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "isEqual:", v13))
  {
    v75 = (void *)objc_msgSend(v9, "copy");
    v72 = v10;
    if (v13)
    {
      objc_msgSend(v9, "identifierForIndexPath:", v13);
      v18 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = 0;
    }
    v71 = v12;
    objc_msgSend(v9, "identifierForIndexPath:", v12);
    v19 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sectionIdentifierForSectionContainingItemIdentifier:", v19);
    v20 = objc_claimAutoreleasedReturnValue();
    v73 = v11;
    v74 = (void *)v20;
    v70 = (void *)v18;
    if (v18)
    {
      v21 = (void *)v20;
      v22 = objc_msgSend(v75, "indexOfItemIdentifier:", v19);
      if (v22 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v23 = v22;
        v24 = objc_msgSend(v75, "indexOfItemIdentifier:", v18);
        objc_msgSend(v75, "sectionIdentifierForSectionContainingItemIdentifier:", v18);
        v25 = objc_claimAutoreleasedReturnValue();
        if (v24 <= v23)
        {
          v81[0] = v19;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v81, 1);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "deleteItemsWithIdentifiers:", v36);

        }
        else
        {
          v26 = objc_msgSend(v21, "isEqual:", v25);
          v81[0] = v19;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v81, 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "deleteItemsWithIdentifiers:", v27);

          if (v26)
          {
            v80 = v19;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v80, 1);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v75, "insertItemsWithIdentifiers:afterItemWithIdentifier:", v28, v18);
LABEL_22:
            v35 = v25;

            goto LABEL_23;
          }
        }
        v79 = v19;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v79, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "insertItemsWithIdentifiers:beforeItemWithIdentifier:", v28, v18);
        goto LABEL_22;
      }
    }
    else
    {
      v29 = objc_msgSend(v13, "section");
      if ((unint64_t)objc_msgSend(v13, "length") >= 2)
      {
        objc_msgSend(v9, "sectionIdentifiers");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "count");

        if (v29 < v31)
        {
          v32 = objc_msgSend(v13, "item");
          objc_msgSend(v75, "sectionIdentifiers");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "objectAtIndexedSubscript:", objc_msgSend(v13, "section"));
          v25 = objc_claimAutoreleasedReturnValue();

          if (v32 > objc_msgSend(v9, "numberOfItemsInSection:", v25))
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSDiffableDataSourceTransaction.m"), 259, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("destinationIndex <= [initialSnapshot numberOfItemsInSection:destinationSectionIdentifier]"));

          }
          v78 = v19;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v78, 1);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "deleteItemsWithIdentifiers:", v34);

          v77 = v19;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v77, 1);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v28, v25);
          goto LABEL_22;
        }
      }
    }
    v35 = 0;
LABEL_23:
    v37 = objc_msgSend(v9, "indexOfItemIdentifier:", v19);
    v38 = objc_msgSend(v75, "indexOfItemIdentifier:", v19);
    objc_msgSend(MEMORY[0x1E0CB3830], "changeWithObject:type:index:associatedIndex:", v19, 1, v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3830], "changeWithObject:type:index:associatedIndex:", v19, 0, v38, v37);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_alloc(MEMORY[0x1E0CB3838]);
    v76[0] = v39;
    v76[1] = v40;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 2);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = (void *)objc_msgSend(v41, "initWithChanges:", v42);

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = (void *)v35;
    if (v74 && v35)
    {
      v45 = objc_msgSend(v74, "isEqual:", v35);
      v46 = v73;
      if (v45)
      {
        v73[2](v73, v74);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        if (v47)
        {
          v48 = v43;
          v49 = v47;
          v50 = v74;
LABEL_35:
          objc_msgSend(v48, "setObject:forKey:", v49, v50);
          goto LABEL_36;
        }
        goto LABEL_36;
      }
    }
    else
    {
      v46 = v73;
      if (!v74)
        goto LABEL_32;
    }
    v46[2](v46, v74);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (v51)
      objc_msgSend(v43, "setObject:forKey:", v51, v74);

LABEL_32:
    if (!v44)
    {
LABEL_37:
      v52 = [_UIIdentifierDiffer alloc];
      objc_msgSend(v9, "state");
      v68 = (void *)v19;
      v53 = v44;
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "identifiers");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "state");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "identifiers");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = -[_UIIdentifierDiffer initWithBeforeIdentifiers:afterIdentifiers:collectionDifference:]((id *)&v52->super.isa, v55, v57, v69);

      objc_msgSend(v9, "state");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "state");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      +[_UIDiffableDataSourceDiffer differWithBeforeDataSourceState:afterDataSourceState:itemIdentifierDiffer:]((uint64_t)_UIDiffableDataSourceDiffer, v59, v60, v58);
      v61 = (void *)objc_claimAutoreleasedReturnValue();

      v62 = -[_UIDiffableDataSourceSectionSnapshotRebaser initWithInitialSnapshot:finalSnapshot:initialSectionSnapshots:dataSourceDiffer:shouldPerformChildSnapshotMoves:]([_UIDiffableDataSourceSectionSnapshotRebaser alloc], "initWithInitialSnapshot:finalSnapshot:initialSectionSnapshots:dataSourceDiffer:shouldPerformChildSnapshotMoves:", v9, v75, v43, v61, 1);
      -[_UIDiffableDataSourceSectionSnapshotRebaser computeReorderingTransaction](v62, "computeReorderingTransaction");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = v73;
      v12 = v71;
      v10 = v72;
      goto LABEL_38;
    }
    v46[2](v46, v44);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (v47)
    {
      v48 = v43;
      v49 = v47;
      v50 = v44;
      goto LABEL_35;
    }
LABEL_36:

    goto LABEL_37;
  }
  v14 = objc_alloc(MEMORY[0x1E0CB3838]);
  v15 = MEMORY[0x1E0C9AA60];
  v16 = (void *)objc_msgSend(v14, "initWithChanges:", MEMORY[0x1E0C9AA60]);
  +[NSDiffableDataSourceTransaction applyTransactionWithInitialSnapshot:finalSnapshot:difference:sectionTransactions:](NSDiffableDataSourceTransaction, "applyTransactionWithInitialSnapshot:finalSnapshot:difference:sectionTransactions:", v9, v9, v16, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_38:
  return v17;
}

- (id)initialDataSourceSnapshotter
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __63__NSDiffableDataSourceTransaction_initialDataSourceSnapshotter__block_invoke;
  v3[3] = &unk_1E16B8428;
  v3[4] = self;
  objc_msgSend(off_1E167C258, "snapshotterForSectionCountsProvider:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __63__NSDiffableDataSourceTransaction_initialDataSourceSnapshotter__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  objc_msgSend(*(id *)(a1 + 32), "initialSnapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2 < 0)
  {
    v9 = objc_msgSend(v4, "numberOfSections");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "initialSnapshot");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sectionIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v5, "numberOfItemsInSection:", v8);

  }
  return v9;
}

- (id)finalDataSourceSnapshotter
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __61__NSDiffableDataSourceTransaction_finalDataSourceSnapshotter__block_invoke;
  v3[3] = &unk_1E16B8428;
  v3[4] = self;
  objc_msgSend(off_1E167C258, "snapshotterForSectionCountsProvider:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __61__NSDiffableDataSourceTransaction_finalDataSourceSnapshotter__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  objc_msgSend(*(id *)(a1 + 32), "finalSnapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2 < 0)
  {
    v9 = objc_msgSend(v4, "numberOfSections");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finalSnapshot");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sectionIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v5, "numberOfItemsInSection:", v8);

  }
  return v9;
}

- (id)performDiffGeneratingUpdates
{
  void *v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  id v7;

  -[NSDiffableDataSourceSnapshot state](self->_initialSnapshot, "state");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDiffableDataSourceSnapshot state](self->_finalSnapshot, "state");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIDiffableDataSourceDiffer differWithBeforeDataSourceState:afterDataSourceState:]((uint64_t)_UIDiffableDataSourceDiffer, v3, v4);
  v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = (void *)v5[1];
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

- (int64_t)finalGlobalIndexForInitialGlobalIndex:(int64_t)a3
{
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t v12;
  void *v14;

  -[NSDiffableDataSourceTransaction initialSnapshot](self, "initialSnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "numberOfItems");

  if (v7 <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSDiffableDataSourceTransaction.m"), 356, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("initialGlobalIndex < self.initialSnapshot.numberOfItems"));

  }
  -[NSDiffableDataSourceTransaction initialSnapshot](self, "initialSnapshot");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "itemIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSDiffableDataSourceTransaction finalSnapshot](self, "finalSnapshot");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "indexOfItemIdentifier:", v10);

  return v12;
}

- (int64_t)initialGlobalIndexForFinalGlobalIndex:(int64_t)a3
{
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t v12;
  void *v14;

  -[NSDiffableDataSourceTransaction finalSnapshot](self, "finalSnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "numberOfItems");

  if (v7 <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSDiffableDataSourceTransaction.m"), 363, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("finalGlobalIndex < self.finalSnapshot.numberOfItems"));

  }
  -[NSDiffableDataSourceTransaction finalSnapshot](self, "finalSnapshot");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "itemIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSDiffableDataSourceTransaction initialSnapshot](self, "initialSnapshot");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "indexOfItemIdentifier:", v10);

  return v12;
}

- (id)finalIndexPathForInitialIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "length") >= 2)
  {
    -[NSDiffableDataSourceTransaction initialSnapshot](self, "initialSnapshot");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifierForIndexPath:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[NSDiffableDataSourceTransaction finalSnapshot](self, "finalSnapshot");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "indexPathForIdentifier:", v7);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)initialIndexPathForFinalIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "length") >= 2)
  {
    -[NSDiffableDataSourceTransaction finalSnapshot](self, "finalSnapshot");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifierForIndexPath:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[NSDiffableDataSourceTransaction initialSnapshot](self, "initialSnapshot");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "indexPathForIdentifier:", v7);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (int64_t)finalSectionIndexForInitialSectionIndex:(int64_t)a3
{
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int64_t v13;
  void *v15;

  -[NSDiffableDataSourceTransaction initialSnapshot](self, "initialSnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSDiffableDataSourceTransaction.m"), 396, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("initialSectionIndex < self.initialSnapshot.sectionIdentifiers.count"));

  }
  -[NSDiffableDataSourceTransaction initialSnapshot](self, "initialSnapshot");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sectionIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSDiffableDataSourceTransaction finalSnapshot](self, "finalSnapshot");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "indexOfSectionIdentifier:", v11);

  return v13;
}

- (int64_t)initialSectionIndexForFinalSectionIndex:(int64_t)a3
{
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int64_t v13;
  void *v15;

  -[NSDiffableDataSourceTransaction finalSnapshot](self, "finalSnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSDiffableDataSourceTransaction.m"), 403, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("finalSectionIndex < self.finalSnapshot.sectionIdentifiers.count"));

  }
  -[NSDiffableDataSourceTransaction finalSnapshot](self, "finalSnapshot");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sectionIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSDiffableDataSourceTransaction initialSnapshot](self, "initialSnapshot");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "indexOfSectionIdentifier:", v11);

  return v13;
}

- (id)finalIndexPathForSupplementaryElementOfKind:(id)a3 forInitialIndexPath:(id)a4
{
  return 0;
}

- (id)initialIndexPathForSupplementaryElementOfKind:(id)a3 forFinalIndexPath:(id)a4
{
  return 0;
}

- (_NSRange)initalSectionGlobalItemRangeForSection:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  _NSRange result;

  -[NSDiffableDataSourceTransaction initialSnapshot](self, "initialSnapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "sectionGlobalItemRangeForSection:", a3);
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.length = v9;
  result.location = v8;
  return result;
}

- (_NSRange)finalSectionGlobalItemRangeForSection:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  _NSRange result;

  -[NSDiffableDataSourceTransaction finalSnapshot](self, "finalSnapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "sectionGlobalItemRangeForSection:", a3);
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.length = v9;
  result.location = v8;
  return result;
}

- (int64_t)initialSectionCount
{
  void *v2;
  int64_t v3;

  -[NSDiffableDataSourceTransaction initialSnapshot](self, "initialSnapshot");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "numberOfSections");

  return v3;
}

- (int64_t)finalSectionCount
{
  void *v2;
  int64_t v3;

  -[NSDiffableDataSourceTransaction finalSnapshot](self, "finalSnapshot");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "numberOfSections");

  return v3;
}

@end
