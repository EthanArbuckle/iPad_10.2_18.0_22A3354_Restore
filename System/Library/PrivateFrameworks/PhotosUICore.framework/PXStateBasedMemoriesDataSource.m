@implementation PXStateBasedMemoriesDataSource

- (PXStateBasedMemoriesDataSource)initWithState:(id)a3
{
  id v5;
  PXStateBasedMemoriesDataSource *v6;
  PXStateBasedMemoriesDataSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXStateBasedMemoriesDataSource;
  v6 = -[PXStateBasedMemoriesDataSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->__state, a3);

  return v7;
}

- (id)sectionedObjectReferenceForMemoryUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[4];
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v4 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0x7FFFFFFFFFFFFFFFLL;
  -[PXStateBasedMemoriesDataSource _state](self, "_state");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "memories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __72__PXStateBasedMemoriesDataSource_sectionedObjectReferenceForMemoryUUID___block_invoke;
  v13[3] = &unk_1E5124F58;
  v7 = v4;
  v14 = v7;
  v15 = &v16;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v13);

  if (v17[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    v9 = -[PXStateBasedMemoriesDataSource identifier](self, "identifier");
    v10 = v17[3];
    v12[0] = v9;
    v12[1] = 0;
    v12[2] = v10;
    v12[3] = 0x7FFFFFFFFFFFFFFFLL;
    -[PXStateBasedMemoriesDataSource objectReferenceAtIndexPath:](self, "objectReferenceAtIndexPath:", v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  _Block_object_dispose(&v16, 8);
  return v8;
}

- (int64_t)numberOfSections
{
  return 1;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  -[PXStateBasedMemoriesDataSource _state](self, "_state", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "memories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3
{
  void *v4;
  void *v5;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[PXStateBasedMemoriesDataSource _state](self, "_state");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3->dataSourceIdentifier != *(_QWORD *)off_1E50B7E98
    && a3->item != 0x7FFFFFFFFFFFFFFFLL
    && a3->subitem == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v4, "memories");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", a3->item);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "infosByMemory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      +[PXMemoryInfo fastMemoryInfoWithMemory:](PXMemoryInfo, "fastMemoryInfoWithMemory:", v10);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (PXSimpleIndexPath)indexPathForObjectReference:(SEL)a3
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  PXSimpleIndexPath *result;
  objc_super v15;
  __int128 v16;
  __int128 v17;

  v6 = a4;
  v16 = 0u;
  v17 = 0u;
  v15.receiver = self;
  v15.super_class = (Class)PXStateBasedMemoriesDataSource;
  -[PXSimpleIndexPath indexPathForObjectReference:](&v15, sel_indexPathForObjectReference_, v6);
  if ((_QWORD)v16 == *(_QWORD *)off_1E50B7E98)
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
LABEL_10:

        goto LABEL_11;
      }
      v8 = v7;
    }
    v9 = v8;
    if (v8)
    {
      -[PXStateBasedMemoriesDataSource _state](self, "_state");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "memories");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "indexOfObject:", v9);

      if (v12 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v16 = (unint64_t)-[PXStateBasedMemoriesDataSource identifier](self, "identifier");
        *(_QWORD *)&v17 = v12;
        *((_QWORD *)&v17 + 1) = 0x7FFFFFFFFFFFFFFFLL;
      }
    }
    goto LABEL_10;
  }
LABEL_11:
  v13 = v17;
  *(_OWORD *)&retstr->dataSourceIdentifier = v16;
  *(_OWORD *)&retstr->item = v13;

  return result;
}

- (PXMemoriesDataSourceState)_state
{
  return self->__state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__state, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __72__PXStateBasedMemoriesDataSource_sectionedObjectReferenceForMemoryUUID___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  id v9;

  v7 = (void *)MEMORY[0x1E0CD1698];
  objc_msgSend(a2, "localIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uuidFromLocalIdentifier:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }

}

@end
