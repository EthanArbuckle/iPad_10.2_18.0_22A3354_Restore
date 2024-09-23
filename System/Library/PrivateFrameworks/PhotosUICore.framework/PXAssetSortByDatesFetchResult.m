@implementation PXAssetSortByDatesFetchResult

- (PXAssetSortByDatesFetchResult)initWithSortDescriptor:(id)a3 fetchedIndexes:(id)a4 dateByIndex:(id)a5
{
  id v9;
  id v10;
  id v11;
  PXAssetSortByDatesFetchResult *v12;
  PXAssetSortByDatesFetchResult *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PXAssetSortByDatesFetchResult;
  v12 = -[PXAssetSortByDatesFetchResult init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_sortDescriptor, a3);
    objc_storeStrong((id *)&v13->_fetchedIndexes, a4);
    objc_storeStrong((id *)&v13->_dateByIndex, a5);
  }

  return v13;
}

- (void)enumerateFetchedItemsUsingBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  -[PXAssetSortByDatesFetchResult dateByIndex](self, "dateByIndex");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAssetSortByDatesFetchResult fetchedIndexes](self, "fetchedIndexes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__PXAssetSortByDatesFetchResult_enumerateFetchedItemsUsingBlock___block_invoke;
  v9[3] = &unk_1E5144C48;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  objc_msgSend(v6, "enumerateIndexesUsingBlock:", v9);

}

- (NSSortDescriptor)sortDescriptor
{
  return self->_sortDescriptor;
}

- (NSIndexSet)fetchedIndexes
{
  return self->_fetchedIndexes;
}

- (NSDictionary)dateByIndex
{
  return self->_dateByIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateByIndex, 0);
  objc_storeStrong((id *)&self->_fetchedIndexes, 0);
  objc_storeStrong((id *)&self->_sortDescriptor, 0);
}

void __65__PXAssetSortByDatesFetchResult_enumerateFetchedItemsUsingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v5 = v6;
  }

}

@end
