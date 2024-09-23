@implementation PLFilteredAlbumListChangeNotification

- (PLFilteredAlbumListChangeNotification)init
{

  return 0;
}

- (PLFilteredAlbumListChangeNotification)initWithFilteredAlbumList:(id)a3 albumListChangeNotification:(id)a4
{
  id v7;
  id v8;
  id *v9;
  PLFilteredAlbumListChangeNotification *v10;
  void *v11;
  uint64_t v12;
  NSIndexSet *oldFilteredIndexes;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PLFilteredAlbumListChangeNotification;
  v9 = -[PLContainerChangeNotification _init](&v15, sel__init);
  v10 = (PLFilteredAlbumListChangeNotification *)v9;
  if (v9)
  {
    objc_storeStrong(v9 + 12, a3);
    objc_msgSend(v8, "snapshot");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "filteredIndexesForFilter:", v10->_albumList);
    v12 = objc_claimAutoreleasedReturnValue();
    oldFilteredIndexes = v10->_oldFilteredIndexes;
    v10->_oldFilteredIndexes = (NSIndexSet *)v12;

    objc_storeStrong((id *)&v10->_backingNotification, a4);
  }

  return v10;
}

- (id)object
{
  return self->_albumList;
}

- (id)albumList
{
  return self->_albumList;
}

- (BOOL)shouldReload
{
  objc_super v3;

  if (!self->_oldFilteredIndexes)
    return 1;
  v3.receiver = self;
  v3.super_class = (Class)PLFilteredAlbumListChangeNotification;
  return -[PLContainerChangeNotification shouldReload](&v3, sel_shouldReload);
}

- (BOOL)countDidChange
{
  NSIndexSet *oldFilteredIndexes;
  uint64_t v4;
  void *v5;
  BOOL v6;

  oldFilteredIndexes = self->_oldFilteredIndexes;
  if (!oldFilteredIndexes)
    return 1;
  v4 = -[NSIndexSet count](oldFilteredIndexes, "count");
  -[PLFilteredAlbumListChangeNotification updatedFilteredIndexes](self, "updatedFilteredIndexes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 != objc_msgSend(v5, "count");

  return v6;
}

- (NSString)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x19AEC1554](self, a2);
  v4 = (void *)MEMORY[0x1E0CB37A0];
  v5 = objc_opt_class();
  -[PLFilteredAlbumListChangeNotification object](self, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p> filtered album list: %p backing note: <%@: %p>"), v5, self, v6, objc_opt_class(), self->_backingNotification);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLFilteredAlbumListChangeNotification _diffDescription](self, "_diffDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendString:", v8);

  objc_autoreleasePoolPop(v3);
  return (NSString *)v7;
}

- (id)_diffDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t, uint64_t);
  void *v21;
  id v22;

  v3 = (void *)MEMORY[0x19AEC1554](-[PLContainerChangeNotification _calculateDiffsIfNecessary](self, "_calculateDiffsIfNecessary"));
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PLFilteredAlbumListChangeNotification shouldReload](self, "shouldReload"))
  {
    -[PLAssetContainerListChangeNotification _contentRelationshipName](self, "_contentRelationshipName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(", %@ need reload"), v5);

  }
  else
  {
    -[PLContainerChangeNotification deletedIndexes](self, "deletedIndexes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[PLContainerChangeNotification deletedIndexes](self, "deletedIndexes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "pl_shortDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendFormat:", CFSTR(", deleted: {%@}"), v8);

    }
    -[PLContainerChangeNotification insertedIndexes](self, "insertedIndexes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[PLContainerChangeNotification insertedIndexes](self, "insertedIndexes");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "pl_shortDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendFormat:", CFSTR(", inserted: {%@}"), v11);

    }
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __57__PLFilteredAlbumListChangeNotification__diffDescription__block_invoke;
    v21 = &unk_1E3675448;
    v13 = v12;
    v22 = v13;
    -[PLContainerChangeNotification enumerateMovesWithBlock:](self, "enumerateMovesWithBlock:", &v18);
    if (objc_msgSend(v13, "length"))
      objc_msgSend(v4, "appendFormat:", CFSTR(", moved: {%@}"), v13, v18, v19, v20, v21);

    -[PLContainerChangeNotification changedIndexes](self, "changedIndexes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[PLContainerChangeNotification changedIndexes](self, "changedIndexes");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "pl_shortDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appendFormat:", CFSTR(", changed: {%@}"), v16);

    }
    if (-[PLFilteredAlbumListChangeNotification countDidChange](self, "countDidChange"))
      objc_msgSend(v4, "appendString:", CFSTR(", count changed"));
  }
  objc_autoreleasePoolPop(v3);
  return v4;
}

- (BOOL)_getOldSet:(id *)a3 newSet:(id *)a4
{
  PLAssetContainerListChangeNotification *backingNotification;
  _BOOL4 v8;
  id v9;
  id v10;
  NSIndexSet *v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;
  id v22;

  backingNotification = self->_backingNotification;
  v21 = 0;
  v22 = 0;
  v8 = -[PLContainerChangeNotification _getOldSet:newSet:](backingNotification, "_getOldSet:newSet:", &v22, &v21);
  v9 = v22;
  v10 = v21;
  if (v8)
  {
    v11 = self->_oldFilteredIndexes;
    -[PLFilteredAlbumListChangeNotification updatedFilteredIndexes](self, "updatedFilteredIndexes");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v11)
      v14 = v12 == 0;
    else
      v14 = 1;
    v15 = !v14;
    if (!v14)
    {
      v16 = (void *)MEMORY[0x1E0C99E40];
      objc_msgSend(v9, "objectsAtIndexes:", v11);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "orderedSetWithArray:", v17);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

      v18 = (void *)MEMORY[0x1E0C99E40];
      objc_msgSend(v10, "objectsAtIndexes:", v13);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "orderedSetWithArray:", v19);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)_changedObjects
{
  return -[PLContainerChangeNotification _changedObjects](self->_backingNotification, "_changedObjects");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingNotification, 0);
  objc_storeStrong((id *)&self->_indexMapper, 0);
  objc_storeStrong((id *)&self->_filteredIndexes, 0);
  objc_storeStrong((id *)&self->_oldFilteredIndexes, 0);
  objc_storeStrong((id *)&self->_albumList, 0);
}

uint64_t __57__PLFilteredAlbumListChangeNotification__diffDescription__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%lu->%lu, "), a2, a3);
}

+ (id)notificationForDerivedObject:(id)a3 priorChangeState:(id)a4 forBackingObjectNotification:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v13 = 0;
  }
  else
  {
    v11 = v8;
    v12 = v10;
    if (v11)
    {
      objc_opt_class();
      objc_opt_isKindOfClass();
    }
    objc_opt_class();
    objc_opt_isKindOfClass();
    v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFilteredAlbumList:albumListChangeNotification:", v11, v12);

  }
  return v13;
}

- (NSIndexSet)updatedFilteredIndexes
{
  return -[PLFilteredAlbumList filteredIndexes](self->_albumList, "filteredIndexes");
}

- (PLIndexMapper)indexMapper
{
  PLIndexMapper *indexMapper;
  PLIndexMapper *v4;
  PLIndexMapper *v5;

  indexMapper = self->_indexMapper;
  if (!indexMapper)
  {
    v4 = -[PLIndexMapper initWithDataSource:]([PLIndexMapper alloc], "initWithDataSource:", self);
    v5 = self->_indexMapper;
    self->_indexMapper = v4;

    indexMapper = self->_indexMapper;
  }
  return indexMapper;
}

- (NSIndexSet)filteredIndexes
{
  return self->_filteredIndexes;
}

- (void)setFilteredIndexes:(id)a3
{
  NSIndexSet *v5;
  NSIndexSet *v6;

  v5 = (NSIndexSet *)a3;
  if (self->_filteredIndexes != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_filteredIndexes, a3);
    v5 = v6;
  }

}

- (BOOL)shouldIncludeObjectAtIndex:(unint64_t)a3
{
  return 0;
}

@end
