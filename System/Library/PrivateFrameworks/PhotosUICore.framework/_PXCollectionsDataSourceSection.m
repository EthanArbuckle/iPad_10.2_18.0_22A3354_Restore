@implementation _PXCollectionsDataSourceSection

- (_PXCollectionsDataSourceSection)initWithCollectionsDataSource:(id)a3 lockStatePerCollection:(id)a4
{
  id v8;
  id v9;
  _PXCollectionsDataSourceSection *v10;
  _PXCollectionsDataSourceSection *v11;
  uint64_t v12;
  void *v14;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "numberOfSections") >= 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCollectionsDataSection.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("collectionsDataSource.numberOfSections <= 1"));

  }
  v15.receiver = self;
  v15.super_class = (Class)_PXCollectionsDataSourceSection;
  v10 = -[PXDataSection initWithOutlineObject:](&v15, sel_initWithOutlineObject_, 0);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_collectionsDataSource, a3);
    objc_storeStrong((id *)&v11->_lockStatePerCollection, a4);
    if (objc_msgSend(v8, "numberOfSections") == 1)
      v12 = objc_msgSend(v8, "numberOfItemsInSection:", 0);
    else
      v12 = 0;
    v11->_count = v12;
  }

  return v11;
}

- (_PXCollectionsDataSourceSection)initWithCollectionsDataSource:(id)a3
{
  return -[_PXCollectionsDataSourceSection initWithCollectionsDataSource:lockStatePerCollection:](self, "initWithCollectionsDataSource:lockStatePerCollection:", a3, MEMORY[0x1E0C9AA70]);
}

- (int64_t)indexOfCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[_PXCollectionsDataSourceSection collectionsDataSource](self, "collectionsDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathForCollection:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = objc_msgSend(v6, "px_item");
  else
    v7 = 0x7FFFFFFFFFFFFFFFLL;

  return v7;
}

- (int64_t)countForCollection:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;

  v4 = a3;
  -[_PXCollectionsDataSourceSection collectionsDataSource](self, "collectionsDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countForCollection:", v4);

  return v6;
}

- (unint64_t)lockStateForCollection:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCollectionsDataSection.m"), 59, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("collection"));

  }
  -[_PXCollectionsDataSourceSection lockStatePerCollection](self, "lockStatePerCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_PXCollectionsDataSourceSection lockStatePerCollection](self, "lockStatePerCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "unsignedIntegerValue");
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)existingAssetsFetchResultAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  _QWORD v7[4];

  -[_PXCollectionsDataSourceSection collectionsDataSource](self, "collectionsDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "numberOfSections") == 1)
  {
    v7[0] = objc_msgSend(v4, "identifier");
    v7[1] = 0;
    v7[2] = a3;
    v7[3] = 0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend(v4, "existingAssetsFetchResultAtIndexPath:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)content
{
  void *v2;
  void *v3;

  -[_PXCollectionsDataSourceSection collectionsDataSource](self, "collectionsDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "content");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)count
{
  return self->_count;
}

- (id)objectAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  _QWORD v7[4];

  -[_PXCollectionsDataSourceSection collectionsDataSource](self, "collectionsDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = objc_msgSend(v4, "identifier");
  v7[1] = 0;
  v7[2] = a3;
  v7[3] = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(v4, "objectAtIndexPath:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  void *v10;
  id v11;
  void *v12;
  unint64_t v13;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;

  -[_PXCollectionsDataSourceSection collectionsDataSource](self, "collectionsDataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "numberOfSections"))
  {
    v13 = 0;
    goto LABEL_7;
  }
  if (objc_msgSend(v10, "numberOfSections") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCollectionsDataSection.m"), 104, CFSTR("This code path is not implemented."));

    abort();
  }
  v18 = objc_msgSend(v10, "identifier");
  v19 = xmmword_1A7C0C1F0;
  v20 = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(v10, "objectsInIndexPath:", &v18);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCollectionsDataSection.m"), 101, CFSTR("%@ should conform to protocol %@, but it is nil"), CFSTR("objects"), CFSTR("NSFastEnumeration"));
LABEL_10:

    goto LABEL_5;
  }
  if ((objc_msgSend(v11, "conformsToProtocol:", &unk_1EEA110F0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "px_descriptionForAssertionMessage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCollectionsDataSection.m"), 101, CFSTR("%@ should conform to protocol %@, but %@ doesn't"), CFSTR("objects"), CFSTR("NSFastEnumeration"), v16);

    goto LABEL_10;
  }
LABEL_5:
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", a3, a4, a5);

LABEL_7:
  return v13;
}

- (PXCollectionsDataSource)collectionsDataSource
{
  return self->_collectionsDataSource;
}

- (NSDictionary)lockStatePerCollection
{
  return self->_lockStatePerCollection;
}

- (unint64_t)section
{
  return self->_section;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockStatePerCollection, 0);
  objc_storeStrong((id *)&self->_collectionsDataSource, 0);
}

@end
