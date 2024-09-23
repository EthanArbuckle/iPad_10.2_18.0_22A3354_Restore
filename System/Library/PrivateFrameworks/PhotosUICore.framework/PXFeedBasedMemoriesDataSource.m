@implementation PXFeedBasedMemoriesDataSource

- (PXFeedBasedMemoriesDataSource)initWithDataSource:(id)a3
{
  id v4;
  PXFeedBasedMemoriesDataSource *v5;
  uint64_t v6;
  NSArray *entries;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXFeedBasedMemoriesDataSource;
  v5 = -[PXFeedBasedMemoriesDataSource init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "entries");
    v6 = objc_claimAutoreleasedReturnValue();
    entries = v5->_entries;
    v5->_entries = (NSArray *)v6;

  }
  return v5;
}

- (int64_t)numberOfSections
{
  void *v2;
  void *v3;
  int64_t v4;

  -[PXFeedBasedMemoriesDataSource entries](self, "entries");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;

  -[PXFeedBasedMemoriesDataSource entries](self, "entries", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "memories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  return v6;
}

- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t *p_item;
  int64_t item;
  int64_t *p_section;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v13;
  void *v14;

  p_item = &a3->item;
  if (a3->dataSourceIdentifier == *(_QWORD *)off_1E50B7E98)
  {
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMemoriesDataSource.m"), 248, CFSTR("%@: expected an item or section index path"), v14);

    abort();
  }
  item = a3->item;
  p_section = &a3->section;
  if (a3->section == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (item == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_10;
  }
  else if (item == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[PXFeedBasedMemoriesDataSource entries](self, "entries");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (a3->subitem != 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_10;
  -[PXFeedBasedMemoriesDataSource entries](self, "entries");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "memories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  p_section = p_item;
LABEL_9:
  objc_msgSend(v6, "objectAtIndexedSubscript:", *p_section);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (PXSimpleIndexPath)indexPathForObjectReference:(SEL)a3
{
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int64_t v13;
  PXSimpleIndexPath *result;
  _QWORD v15[4];
  id v16;
  objc_super v17;

  v6 = a4;
  *(_OWORD *)&retstr->dataSourceIdentifier = 0u;
  *(_OWORD *)&retstr->item = 0u;
  v17.receiver = self;
  v17.super_class = (Class)PXFeedBasedMemoriesDataSource;
  -[PXSimpleIndexPath indexPathForObjectReference:](&v17, sel_indexPathForObjectReference_, v6);
  if (retstr->dataSourceIdentifier == *(_QWORD *)off_1E50B7E98)
  {
    objc_msgSend(v6, "itemObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "assetCollection");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v9 = 0;
LABEL_11:

        goto LABEL_12;
      }
      v8 = v7;
    }
    v9 = v8;
    if (v8)
    {
      -[PXFeedBasedMemoriesDataSource entries](self, "entries");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "memories");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __61__PXFeedBasedMemoriesDataSource_indexPathForObjectReference___block_invoke;
      v15[3] = &unk_1E5124F80;
      v9 = v9;
      v16 = v9;
      v13 = objc_msgSend(v12, "indexOfObjectPassingTest:", v15);

      if (v13 != 0x7FFFFFFFFFFFFFFFLL)
      {
        retstr->dataSourceIdentifier = -[PXFeedBasedMemoriesDataSource identifier](self, "identifier");
        retstr->section = 0;
        retstr->item = v13;
        retstr->subitem = 0x7FFFFFFFFFFFFFFFLL;
      }

    }
    goto LABEL_11;
  }
LABEL_12:

  return result;
}

- (id)sectionedObjectReferenceForMemoryUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[4];
  _QWORD v13[4];
  id v14;

  v4 = a3;
  -[PXFeedBasedMemoriesDataSource entries](self, "entries");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "memories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __71__PXFeedBasedMemoriesDataSource_sectionedObjectReferenceForMemoryUUID___block_invoke;
  v13[3] = &unk_1E5124F80;
  v8 = v4;
  v14 = v8;
  v9 = objc_msgSend(v7, "indexOfObjectPassingTest:", v13);

  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = 0;
  }
  else
  {
    v12[0] = -[PXFeedBasedMemoriesDataSource identifier](self, "identifier");
    v12[1] = 0;
    v12[2] = v9;
    v12[3] = 0x7FFFFFFFFFFFFFFFLL;
    -[PXFeedBasedMemoriesDataSource objectReferenceAtIndexPath:](self, "objectReferenceAtIndexPath:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (NSArray)entries
{
  return self->_entries;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entries, 0);
}

uint64_t __71__PXFeedBasedMemoriesDataSource_sectionedObjectReferenceForMemoryUUID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(a2, "assetCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CD1698];
  objc_msgSend(v3, "localIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuidFromLocalIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));
  return v7;
}

uint64_t __61__PXFeedBasedMemoriesDataSource_indexPathForObjectReference___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "assetCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 == *(void **)(a1 + 32))
    v5 = 1;
  else
    v5 = objc_msgSend(v3, "isEqual:");

  return v5;
}

@end
