@implementation PXPhotoKitPeopleSuggestionsDataSource

- (PXPhotoKitPeopleSuggestionsDataSource)initWithState:(id)a3
{
  id v5;
  PXPhotoKitPeopleSuggestionsDataSource *v6;
  PXPhotoKitPeopleSuggestionsDataSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXPhotoKitPeopleSuggestionsDataSource;
  v6 = -[PXPhotoKitPeopleSuggestionsDataSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->__state, a3);

  return v7;
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

  -[PXPhotoKitPeopleSuggestionsDataSource _state](self, "_state", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "people");
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

  -[PXPhotoKitPeopleSuggestionsDataSource _state](self, "_state");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3->dataSourceIdentifier != *(_QWORD *)off_1E50B7E98
    && a3->item != 0x7FFFFFFFFFFFFFFFLL
    && a3->subitem == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v4, "people");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", a3->item);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "personSuggestionsByPerson");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      +[PXPhotoKitPersonSuggestion personSuggestionWithPerson:](PXPhotoKitPersonSuggestion, "personSuggestionWithPerson:", v10);
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
  uint64_t v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __int128 v15;
  PXSimpleIndexPath *result;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  objc_super v20;
  __int128 v21;
  __int128 v22;

  v6 = a4;
  v21 = 0u;
  v22 = 0u;
  v20.receiver = self;
  v20.super_class = (Class)PXPhotoKitPeopleSuggestionsDataSource;
  -[PXSimpleIndexPath indexPathForObjectReference:](&v20, sel_indexPathForObjectReference_, v6);
  v7 = v21;
  if ((_QWORD)v21 == *(_QWORD *)off_1E50B7E98)
  {
    if (v6)
    {
      objc_msgSend(v6, "indexPath");
      if (v17 != v7 && v18 != 0x7FFFFFFFFFFFFFFFLL && v19 == 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v6, "itemObject");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          -[PXPhotoKitPeopleSuggestionsDataSource _state](self, "_state");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "people");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "itemObject");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "person");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v11, "indexOfObject:", v13);

          if (v14 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v21 = (unint64_t)-[PXPhotoKitPeopleSuggestionsDataSource identifier](self, "identifier");
            *(_QWORD *)&v22 = v14;
            *((_QWORD *)&v22 + 1) = 0x7FFFFFFFFFFFFFFFLL;
          }
        }
      }
    }
  }
  v15 = v22;
  *(_OWORD *)&retstr->dataSourceIdentifier = v21;
  *(_OWORD *)&retstr->item = v15;

  return result;
}

- (PXPhotoKitPeopleSuggestionsDataSourceState)_state
{
  return self->__state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__state, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
