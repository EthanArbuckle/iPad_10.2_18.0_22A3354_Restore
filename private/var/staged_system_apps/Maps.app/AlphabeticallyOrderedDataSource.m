@implementation AlphabeticallyOrderedDataSource

- (AlphabeticallyOrderedDataSource)initWithObjects:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  AlphabeticallyOrderedDataSource *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v4, "count"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v11, "conformsToProtocol:", &OBJC_PROTOCOL___AlphabeticallySortableObject, (_QWORD)v15))objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  v12 = objc_msgSend(v5, "copy");
  v13 = -[AlphabeticallyOrderedDataSource initWithAlphabeticallySortableObject:](self, "initWithAlphabeticallySortableObject:", v12);

  return v13;
}

- (AlphabeticallyOrderedDataSource)initWithAlphabeticallySortableObject:(id)a3
{
  id v4;
  AlphabeticallyOrderedDataSource *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  NSArray *sectionIndexTitles;
  void *v10;
  char *v11;
  id v12;
  char *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  void *v21;
  char *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  NSArray *v27;
  NSArray *sections;
  NSArray *v29;
  NSArray *orderedObjects;
  id v32;
  char *v33;
  AlphabeticallyOrderedDataSource *v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  objc_super v40;
  _BYTE v41[128];

  v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)AlphabeticallyOrderedDataSource;
  v5 = -[AlphabeticallyOrderedDataSource init](&v40, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UILocalizedIndexedCollation currentCollation](UILocalizedIndexedCollation, "currentCollation"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sectionIndexTitles"));
    v8 = (NSArray *)objc_msgSend(v7, "copy");
    sectionIndexTitles = v5->_sectionIndexTitles;
    v34 = v5;
    v5->_sectionIndexTitles = v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sectionTitles"));
    v11 = (char *)objc_msgSend(v10, "count");

    v12 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v11);
    v32 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v4, "count"));
    if (v11)
    {
      v13 = v11;
      do
      {
        v14 = objc_alloc_init((Class)NSMutableArray);
        objc_msgSend(v12, "addObject:", v14);

        --v13;
      }
      while (v13);
    }
    v33 = v11;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v35 = v4;
    v15 = v4;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(_QWORD *)v37 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v20, "conformsToProtocol:", &OBJC_PROTOCOL___AlphabeticallySortableObject, v32))
          {
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v6, "sectionForObject:collationStringSelector:", v20, "_maps_alphabeticallySortableObject_name")));
            objc_msgSend(v21, "addObject:", v20);

          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      }
      while (v17);
    }

    if (v33)
    {
      v22 = 0;
      v23 = 0;
      v24 = v32;
      do
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", v22, v32));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sortedArrayFromArray:collationStringSelector:", v25, "_maps_alphabeticallySortableObject_name"));
        objc_msgSend(v12, "setObject:atIndexedSubscript:", v26, v22);
        if (objc_msgSend(v25, "count"))
          ++v23;
        objc_msgSend(v24, "addObjectsFromArray:", v26);

        ++v22;
      }
      while (v33 != v22);
    }
    else
    {
      v23 = 0;
      v24 = v32;
    }
    v27 = (NSArray *)objc_msgSend(v12, "copy", v32);
    v5 = v34;
    sections = v34->_sections;
    v34->_sections = v27;

    v29 = (NSArray *)objc_msgSend(v24, "copy");
    orderedObjects = v34->_orderedObjects;
    v34->_orderedObjects = v29;

    v34->_numberOfSectionsNotEmpty = v23;
    v4 = v35;
  }

  return v5;
}

- (int64_t)numberOfSections
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AlphabeticallyOrderedDataSource sections](self, "sections"));
  v3 = objc_msgSend(v2, "count");

  return (int64_t)v3;
}

- (int64_t)numberOfRowsInSection:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AlphabeticallyOrderedDataSource sections](self, "sections"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", a3));
  v6 = objc_msgSend(v5, "count");

  return (int64_t)v6;
}

- (id)objectAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AlphabeticallyOrderedDataSource sections](self, "sections"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v4, "section")));

  v7 = objc_msgSend(v4, "row");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", v7));

  return v8;
}

- (id)titleForHeaderInSection:(int64_t)a3
{
  return 0;
}

- (id)viewForHeaderInSection:(int64_t)a3 isFirstNonEmptySection:(BOOL)a4
{
  return 0;
}

- (NSArray)sectionIndexTitles
{
  return self->_sectionIndexTitles;
}

- (void)setSectionIndexTitles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unint64_t)numberOfSectionsNotEmpty
{
  return self->_numberOfSectionsNotEmpty;
}

- (NSArray)orderedObjects
{
  return self->_orderedObjects;
}

- (void)setOrderedObjects:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_orderedObjects, 0);
  objc_storeStrong((id *)&self->_sectionIndexTitles, 0);
}

@end
