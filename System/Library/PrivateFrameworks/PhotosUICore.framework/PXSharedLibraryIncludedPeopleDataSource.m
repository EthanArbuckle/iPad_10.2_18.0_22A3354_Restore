@implementation PXSharedLibraryIncludedPeopleDataSource

- (PXSharedLibraryIncludedPeopleDataSource)initWithInfos:(id)a3 infosWithBothPeopleAndParticipants:(id)a4 infosWithoutPeople:(id)a5
{
  id v8;
  id v9;
  id v10;
  PXSharedLibraryIncludedPeopleDataSource *v11;
  uint64_t v12;
  NSArray *allInfos;
  uint64_t v14;
  NSArray *infosWithBothPeopleAndParticipants;
  uint64_t v16;
  NSArray *infosWithoutPeople;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PXSharedLibraryIncludedPeopleDataSource;
  v11 = -[PXSharedLibraryIncludedPeopleDataSource init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    allInfos = v11->_allInfos;
    v11->_allInfos = (NSArray *)v12;

    v14 = objc_msgSend(v9, "copy");
    infosWithBothPeopleAndParticipants = v11->_infosWithBothPeopleAndParticipants;
    v11->_infosWithBothPeopleAndParticipants = (NSArray *)v14;

    v16 = objc_msgSend(v10, "copy");
    infosWithoutPeople = v11->_infosWithoutPeople;
    v11->_infosWithoutPeople = (NSArray *)v16;

  }
  return v11;
}

- (NSArray)allPersonUUIDs
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[PXSharedLibraryIncludedPeopleDataSource allInfos](self, "allInfos", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v8), "person");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "uuid");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v10, "length"))
          objc_msgSend(v3, "addObject:", v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  v11 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v11;
}

- (id)infoAtItemIndexPath:(PXSimpleIndexPath *)a3
{
  __int128 v5;
  void *v6;
  void *v8;
  objc_class *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  _OWORD v13[2];

  v5 = *(_OWORD *)&a3->item;
  v13[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v13[1] = v5;
  -[PXSharedLibraryIncludedPeopleDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryIncludedPeopleDataSourceManager.m"), 152, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("[self objectAtIndexPath:indexPath]"), v10);
LABEL_6:

    return v6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "px_descriptionForAssertionMessage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryIncludedPeopleDataSourceManager.m"), 152, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("[self objectAtIndexPath:indexPath]"), v10, v12);

    goto LABEL_6;
  }
  return v6;
}

- (id)infoForParticipant:(id)a3
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  int v12;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryIncludedPeopleDataSourceManager.m"), 156, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("participant"));

  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[PXSharedLibraryIncludedPeopleDataSource allInfos](self, "allInfos");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "participant");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqual:", v5);

        if (v12)
        {
          v7 = v10;
          goto LABEL_13;
        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_13:

  return v7;
}

- (id)infoForPersonUUID:(id)a3
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryIncludedPeopleDataSourceManager.m"), 168, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("personUUID.length > 0"));

  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[PXSharedLibraryIncludedPeopleDataSource allInfos](self, "allInfos");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "person");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "uuid");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v5);

        if (v13)
        {
          v7 = v10;
          goto LABEL_13;
        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_13:

  return v7;
}

- (int64_t)numberOfSections
{
  return 1;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  void *v4;
  int64_t v5;
  void *v8;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryIncludedPeopleDataSourceManager.m"), 186, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("section == 0"));

  }
  -[PXSharedLibraryIncludedPeopleDataSource allInfos](self, "allInfos");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier;
  void *v9;
  void *v10;
  void *v12;
  void *v13;

  dataSourceIdentifier = a3->dataSourceIdentifier;
  if (dataSourceIdentifier != -[PXSharedLibraryIncludedPeopleDataSource identifier](self, "identifier"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryIncludedPeopleDataSourceManager.m"), 191, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath.dataSourceIdentifier == self.identifier"));

  }
  if (a3->dataSourceIdentifier == *(_QWORD *)off_1E50B7E98
    || a3->item == 0x7FFFFFFFFFFFFFFFLL
    || a3->subitem != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryIncludedPeopleDataSourceManager.m"), 192, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PXSimpleIndexPathIsItem(indexPath)"));

  }
  -[PXSharedLibraryIncludedPeopleDataSource allInfos](self, "allInfos");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", a3->item);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (PXSimpleIndexPath)indexPathForObjectReference:(SEL)a3
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v12;
  void *v13;
  uint64_t v14;
  __int128 v15;
  PXSimpleIndexPath *result;
  void *v17;
  void *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  objc_super v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;

  v7 = a4;
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("PXSharedLibraryIncludedPeopleDataSourceManager.m"), 198, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("objectReference"));

    v27 = 0u;
    v28 = 0u;
    v9 = *(_QWORD *)off_1E50B7E98;
LABEL_18:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("PXSharedLibraryIncludedPeopleDataSourceManager.m"), 199, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PXSimpleIndexPathIsItem(objectReference.indexPath)"));

    goto LABEL_10;
  }
  objc_msgSend(v7, "indexPath");
  v9 = *(_QWORD *)off_1E50B7E98;
  if ((_QWORD)v27 == *(_QWORD *)off_1E50B7E98
    || (_QWORD)v28 == 0x7FFFFFFFFFFFFFFFLL
    || *((_QWORD *)&v28 + 1) != 0x7FFFFFFFFFFFFFFFLL)
  {
    goto LABEL_18;
  }
LABEL_10:
  v25 = 0u;
  v26 = 0u;
  v24.receiver = self;
  v24.super_class = (Class)PXSharedLibraryIncludedPeopleDataSource;
  -[PXSimpleIndexPath indexPathForObjectReference:](&v24, sel_indexPathForObjectReference_, v8);
  if ((_QWORD)v25 != v9)
    goto LABEL_16;
  objc_msgSend(v8, "itemObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("PXSharedLibraryIncludedPeopleDataSourceManager.m"), 203, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("objectReference.itemObject"), v21);
LABEL_21:

    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "px_descriptionForAssertionMessage");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("PXSharedLibraryIncludedPeopleDataSourceManager.m"), 203, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("objectReference.itemObject"), v21, v23);

    goto LABEL_21;
  }
LABEL_13:
  -[PXSharedLibraryIncludedPeopleDataSource allInfos](self, "allInfos");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "indexOfObject:", v12);

  if (v14 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v25 = (unint64_t)-[PXSharedLibraryIncludedPeopleDataSource identifier](self, "identifier");
    *(_QWORD *)&v26 = v14;
    *((_QWORD *)&v26 + 1) = 0x7FFFFFFFFFFFFFFFLL;
  }

LABEL_16:
  v15 = v26;
  *(_OWORD *)&retstr->dataSourceIdentifier = v25;
  *(_OWORD *)&retstr->item = v15;

  return result;
}

- (NSArray)allInfos
{
  return self->_allInfos;
}

- (NSArray)infosWithBothPeopleAndParticipants
{
  return self->_infosWithBothPeopleAndParticipants;
}

- (NSArray)infosWithoutPeople
{
  return self->_infosWithoutPeople;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_infosWithoutPeople, 0);
  objc_storeStrong((id *)&self->_infosWithBothPeopleAndParticipants, 0);
  objc_storeStrong((id *)&self->_allInfos, 0);
}

@end
