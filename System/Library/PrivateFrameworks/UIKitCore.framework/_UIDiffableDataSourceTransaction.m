@implementation _UIDiffableDataSourceTransaction

- (BOOL)isReorderingTransaction
{
  return self->_source == 1;
}

- (_UIDiffableDataSourceTransaction)initWithInitialSnapshot:(id)a3 finalSnapshot:(id)a4 source:(int64_t)a5 reorderedItemIdentifiers:(id)a6 difference:(id)a7 sectionTransactions:(id)a8
{
  id v15;
  id v16;
  id v17;
  _UIDiffableDataSourceTransaction *v18;
  _UIDiffableDataSourceTransaction *v19;
  id v21;
  id v22;
  objc_super v23;

  v22 = a3;
  v21 = a4;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)_UIDiffableDataSourceTransaction;
  v18 = -[_UIDiffableDataSourceTransaction init](&v23, sel_init);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionTransactions, 0);
  objc_storeStrong((id *)&self->_difference, 0);
  objc_storeStrong((id *)&self->_finalSnapshot, 0);
  objc_storeStrong((id *)&self->_initialSnapshot, 0);
  objc_storeStrong((id *)&self->_reorderedItemIdentifiers, 0);
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
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIDiffableDataSourceTransaction.m"), 57, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("difference.insertions.count + difference.removals.count <= 2"));

  }
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
    v26 = (void *)MEMORY[0x1E0C9AA60];
  }
  v27 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithInitialSnapshot:finalSnapshot:source:reorderedItemIdentifiers:difference:sectionTransactions:", v14, v13, 1, v26, v11, v12);

  return v27;
}

- (id)reorderedItemIdentifiers
{
  return self->_reorderedItemIdentifiers;
}

- (int64_t)source
{
  return self->_source;
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
  _UIDiffableDataSourceTransaction *v4;
  _UIDiffableDataSourceTransaction *v5;
  _UIDiffableDataSourceTransaction *v6;
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

  v4 = (_UIDiffableDataSourceTransaction *)a3;
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
      if (source != -[_UIDiffableDataSourceTransaction source](v6, "source"))
        goto LABEL_9;
      difference = self->_difference;
      -[_UIDiffableDataSourceTransaction difference](v6, "difference");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(difference) = -[NSOrderedCollectionDifference isEqual:](difference, "isEqual:", v9);

      if (!(_DWORD)difference)
        goto LABEL_9;
      initialSnapshot = self->_initialSnapshot;
      -[_UIDiffableDataSourceTransaction initialSnapshot](v6, "initialSnapshot");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(initialSnapshot) = -[NSDiffableDataSourceSnapshot isEqual:](initialSnapshot, "isEqual:", v11);

      if (!(_DWORD)initialSnapshot)
        goto LABEL_9;
      finalSnapshot = self->_finalSnapshot;
      -[_UIDiffableDataSourceTransaction finalSnapshot](v6, "finalSnapshot");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(finalSnapshot) = -[NSDiffableDataSourceSnapshot isEqual:](finalSnapshot, "isEqual:", v13);

      if ((_DWORD)finalSnapshot)
      {
        sectionTransactions = self->_sectionTransactions;
        -[_UIDiffableDataSourceTransaction sectionTransactions](v6, "sectionTransactions");
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

- (id)initialDataSourceSnapshotter
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __64___UIDiffableDataSourceTransaction_initialDataSourceSnapshotter__block_invoke;
  v3[3] = &unk_1E16B8428;
  v3[4] = self;
  objc_msgSend(off_1E167C258, "snapshotterForSectionCountsProvider:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)finalDataSourceSnapshotter
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __62___UIDiffableDataSourceTransaction_finalDataSourceSnapshotter__block_invoke;
  v3[3] = &unk_1E16B8428;
  v3[4] = self;
  objc_msgSend(off_1E167C258, "snapshotterForSectionCountsProvider:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
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

  -[_UIDiffableDataSourceTransaction initialSnapshot](self, "initialSnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "numberOfItems");

  if (v7 <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDiffableDataSourceTransaction.m"), 159, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("initialGlobalIndex < self.initialSnapshot.numberOfItems"));

  }
  -[_UIDiffableDataSourceTransaction initialSnapshot](self, "initialSnapshot");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "itemIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIDiffableDataSourceTransaction finalSnapshot](self, "finalSnapshot");
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

  -[_UIDiffableDataSourceTransaction finalSnapshot](self, "finalSnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "numberOfItems");

  if (v7 <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDiffableDataSourceTransaction.m"), 166, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("finalGlobalIndex < self.finalSnapshot.numberOfItems"));

  }
  -[_UIDiffableDataSourceTransaction finalSnapshot](self, "finalSnapshot");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "itemIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIDiffableDataSourceTransaction initialSnapshot](self, "initialSnapshot");
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
    -[_UIDiffableDataSourceTransaction initialSnapshot](self, "initialSnapshot");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifierForIndexPath:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[_UIDiffableDataSourceTransaction finalSnapshot](self, "finalSnapshot");
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
    -[_UIDiffableDataSourceTransaction finalSnapshot](self, "finalSnapshot");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifierForIndexPath:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[_UIDiffableDataSourceTransaction initialSnapshot](self, "initialSnapshot");
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

  -[_UIDiffableDataSourceTransaction initialSnapshot](self, "initialSnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDiffableDataSourceTransaction.m"), 199, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("initialSectionIndex < self.initialSnapshot.sectionIdentifiers.count"));

  }
  -[_UIDiffableDataSourceTransaction initialSnapshot](self, "initialSnapshot");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sectionIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIDiffableDataSourceTransaction finalSnapshot](self, "finalSnapshot");
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

  -[_UIDiffableDataSourceTransaction finalSnapshot](self, "finalSnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIDiffableDataSourceTransaction.m"), 206, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("finalSectionIndex < self.finalSnapshot.sectionIdentifiers.count"));

  }
  -[_UIDiffableDataSourceTransaction finalSnapshot](self, "finalSnapshot");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sectionIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIDiffableDataSourceTransaction initialSnapshot](self, "initialSnapshot");
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

  -[_UIDiffableDataSourceTransaction initialSnapshot](self, "initialSnapshot");
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

  -[_UIDiffableDataSourceTransaction finalSnapshot](self, "finalSnapshot");
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

  -[_UIDiffableDataSourceTransaction initialSnapshot](self, "initialSnapshot");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "numberOfSections");

  return v3;
}

- (int64_t)finalSectionCount
{
  void *v2;
  int64_t v3;

  -[_UIDiffableDataSourceTransaction finalSnapshot](self, "finalSnapshot");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "numberOfSections");

  return v3;
}

- (NSDiffableDataSourceSnapshot)initialSnapshot
{
  return self->_initialSnapshot;
}

- (NSDiffableDataSourceSnapshot)finalSnapshot
{
  return self->_finalSnapshot;
}

- (NSOrderedCollectionDifference)difference
{
  return self->_difference;
}

- (NSArray)sectionTransactions
{
  return self->_sectionTransactions;
}

@end
