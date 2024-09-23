@implementation PXPersonsSectionedDataSource

- (PXPersonsSectionedDataSource)initWithPhotoLibrary:(id)a3 personsSections:(id)a4 faceTiles:(id)a5 peopleHomeSortingType:(unint64_t)a6
{
  id v11;
  id v12;
  id v13;
  PXPersonsSectionedDataSource *v14;
  PXPersonsSectionedDataSource *v15;
  uint64_t v16;
  NSArray *personsSections;
  uint64_t v18;
  NSDictionary *faceTiles;
  NSMutableDictionary *v20;
  NSMutableDictionary *cachedSortedPersonsByTypeAndSection;
  objc_super v23;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v23.receiver = self;
  v23.super_class = (Class)PXPersonsSectionedDataSource;
  v14 = -[PXPersonsSectionedDataSource init](&v23, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_photoLibrary, a3);
    v16 = objc_msgSend(v12, "copy");
    personsSections = v15->_personsSections;
    v15->_personsSections = (NSArray *)v16;

    v18 = objc_msgSend(v13, "copy");
    faceTiles = v15->_faceTiles;
    v15->_faceTiles = (NSDictionary *)v18;

    v15->_peopleHomeSortingType = a6;
    v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    cachedSortedPersonsByTypeAndSection = v15->_cachedSortedPersonsByTypeAndSection;
    v15->_cachedSortedPersonsByTypeAndSection = v20;

  }
  return v15;
}

- (int64_t)numberOfSections
{
  void *v2;
  int64_t v3;

  -[PXPersonsSectionedDataSource personsSections](self, "personsSections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  void *v4;
  void *v5;
  int64_t v6;

  -[PXPersonsSectionedDataSource personsSections](self, "personsSections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  return v6;
}

- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier;
  __int128 v7;
  void *v8;
  BOOL v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v14;
  void *v15;
  __int128 v16;
  void *v17;
  __int128 v18;
  __int128 v19;

  dataSourceIdentifier = a3->dataSourceIdentifier;
  if (dataSourceIdentifier != -[PXPersonsSectionedDataSource identifier](self, "identifier"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPersonsSectionedDataSource.m"), 50, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath.dataSourceIdentifier == self.identifier"));

  }
  v7 = *(_OWORD *)&a3->item;
  v18 = *(_OWORD *)&a3->dataSourceIdentifier;
  v19 = v7;
  -[PXPersonsSectionedDataSource sortedObjectsInIndexPath:](self, "sortedObjectsInIndexPath:", &v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = a3->dataSourceIdentifier == *(_QWORD *)off_1E50B7E98 || a3->item == 0x7FFFFFFFFFFFFFFFLL;
  if (v9 || ((v10 = v8, a3->subitem == 0x7FFFFFFFFFFFFFFFLL) ? (v11 = v8 == 0) : (v11 = 1), v11))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(_OWORD *)&a3->item;
    v18 = *(_OWORD *)&a3->dataSourceIdentifier;
    v19 = v16;
    PXSimpleIndexPathDescription();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPersonsSectionedDataSource.m"), 56, CFSTR("%@ invalid indexPath: %@"), self, v17);

    abort();
  }
  objc_msgSend(v8, "objectAtIndex:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)objectsInIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;

  dataSourceIdentifier = a3->dataSourceIdentifier;
  if (dataSourceIdentifier != -[PXPersonsSectionedDataSource identifier](self, "identifier"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPersonsSectionedDataSource.m"), 63, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath.dataSourceIdentifier == self.identifier"));

  }
  if (a3->dataSourceIdentifier == *(_QWORD *)off_1E50B7E98
    || a3->section == 0x7FFFFFFFFFFFFFFFLL
    || a3->item != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(_OWORD *)&a3->dataSourceIdentifier;
    v16 = *(_OWORD *)&a3->item;
    PXSimpleIndexPathDescription();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPersonsSectionedDataSource.m"), 68, CFSTR("%@ invalid indexPath: %@"), self, v14, v15, v16);

    abort();
  }
  -[PXPersonsSectionedDataSource personsSections](self, "personsSections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", a3->section);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)sortedObjectsInIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier;
  int64_t section;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  dataSourceIdentifier = a3->dataSourceIdentifier;
  if (dataSourceIdentifier != -[PXPersonsSectionedDataSource identifier](self, "identifier"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPersonsSectionedDataSource.m"), 74, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath.dataSourceIdentifier == self.identifier"));

  }
  section = a3->section;
  v8 = objc_alloc((Class)off_1E50B5CD8);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[PXPersonsSectionedDataSource peopleHomeSortingType](self, "peopleHomeSortingType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", section);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v8, "initWithObjects:", v11);

  -[NSMutableDictionary objectForKey:](self->_cachedSortedPersonsByTypeAndSection, "objectForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    -[PXPersonsSectionedDataSource _personsInSection:](self, "_personsInSection:", a3->section);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXPeopleUtilities comparatorByPeopleHomeSortingType:](PXPeopleUtilities, "comparatorByPeopleHomeSortingType:", -[PXPersonsSectionedDataSource peopleHomeSortingType](self, "peopleHomeSortingType"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sortedArrayUsingComparator:", v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](self->_cachedSortedPersonsByTypeAndSection, "setObject:forKey:", v13, v12);

  }
  return v13;
}

- (id)_personsInSection:(int64_t)a3
{
  void *v6;
  void *v7;
  void *v8;
  void *v10;

  -[PXPersonsSectionedDataSource personsSections](self, "personsSections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPersonsSectionedDataSource.m"), 90, CFSTR("%@ invalid section: %lu"), self, a3);

  }
  objc_msgSend(v7, "fetchedObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)faceTileForIndexPath:(PXSimpleIndexPath *)a3
{
  __int128 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PXPeopleFaceTile *v9;
  void *v10;
  void *v11;
  PXPeopleFaceTile *v12;
  _OWORD v14[2];

  v4 = *(_OWORD *)&a3->item;
  v14[0] = *(_OWORD *)&a3->dataSourceIdentifier;
  v14[1] = v4;
  -[PXPersonsSectionedDataSource objectAtIndexPath:](self, "objectAtIndexPath:", v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPersonsSectionedDataSource faceTiles](self, "faceTiles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = [PXPeopleFaceTile alloc];
  objc_msgSend(v8, "face");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "asset");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PXPeopleFaceTile initWithFace:asset:person:](v9, "initWithFace:asset:person:", v10, v11, v5);

  return v12;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (NSDictionary)faceTiles
{
  return self->_faceTiles;
}

- (unint64_t)peopleHomeSortingType
{
  return self->_peopleHomeSortingType;
}

- (NSArray)personsSections
{
  return self->_personsSections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personsSections, 0);
  objc_storeStrong((id *)&self->_faceTiles, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_cachedSortedPersonsByTypeAndSection, 0);
}

@end
