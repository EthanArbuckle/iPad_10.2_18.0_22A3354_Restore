@implementation PLAggregateAlbumListChangeNotification

- (PLAggregateAlbumListChangeNotification)initWithAggregateAlbumList:(id)a3 fromAlbumListChangeNotification:(id)a4 indexOffset:(unint64_t)a5
{
  id v9;
  id v10;
  id *v11;
  PLAggregateAlbumListChangeNotification *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PLAggregateAlbumListChangeNotification;
  v11 = -[PLContainerChangeNotification _init](&v14, sel__init);
  v12 = (PLAggregateAlbumListChangeNotification *)v11;
  if (v11)
  {
    objc_storeStrong(v11 + 12, a3);
    objc_storeStrong((id *)&v12->_note, a4);
    v12->_indexOffet = a5;
  }

  return v12;
}

- (void)dealloc
{
  PLAggregateAlbumList *albumList;
  PLAssetContainerListChangeNotification *note;
  objc_super v5;

  albumList = self->_albumList;
  self->_albumList = 0;

  note = self->_note;
  self->_note = 0;

  v5.receiver = self;
  v5.super_class = (Class)PLAggregateAlbumListChangeNotification;
  -[PLContainerChangeNotification dealloc](&v5, sel_dealloc);
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
  return -[PLContainerChangeNotification shouldReload](self->_note, "shouldReload");
}

- (id)deletedIndexes
{
  void *v3;
  void *v4;

  -[PLContainerChangeNotification deletedIndexes](self->_note, "deletedIndexes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "shiftIndexesStartingAtIndex:by:", 0, self->_indexOffet);
  return v4;
}

- (id)insertedIndexes
{
  void *v3;
  void *v4;

  -[PLContainerChangeNotification insertedIndexes](self->_note, "insertedIndexes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "shiftIndexesStartingAtIndex:by:", 0, self->_indexOffet);
  return v4;
}

- (void)enumerateMovesWithBlock:(id)a3
{
  id v4;
  PLAssetContainerListChangeNotification *note;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  note = self->_note;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__PLAggregateAlbumListChangeNotification_enumerateMovesWithBlock___block_invoke;
  v7[3] = &unk_1E366E250;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[PLContainerChangeNotification enumerateMovesWithBlock:](note, "enumerateMovesWithBlock:", v7);

}

- (id)changedIndexes
{
  void *v3;
  void *v4;

  -[PLContainerChangeNotification changedIndexes](self->_note, "changedIndexes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "shiftIndexesStartingAtIndex:by:", 0, self->_indexOffet);
  return v4;
}

- (id)changedIndexesRelativeToSnapshot
{
  void *v3;
  void *v4;

  -[PLContainerChangeNotification changedIndexesRelativeToSnapshot](self->_note, "changedIndexesRelativeToSnapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "shiftIndexesStartingAtIndex:by:", 0, self->_indexOffet);
  return v4;
}

- (unint64_t)snapshotIndexForContainedObject:(id)a3
{
  id v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PLAggregateAlbumListChangeNotification;
  v4 = -[PLContainerChangeNotification snapshotIndexForContainedObject:](&v7, sel_snapshotIndexForContainedObject_, a3);
  v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (v4 != (id)0x7FFFFFFFFFFFFFFFLL)
    return (unint64_t)v4 + self->_indexOffet;
  return v5;
}

- (id)deletedObjects
{
  return -[PLContainerChangeNotification deletedObjects](self->_note, "deletedObjects");
}

- (id)insertedObjects
{
  return -[PLContainerChangeNotification insertedObjects](self->_note, "insertedObjects");
}

- (id)changedObjects
{
  return -[PLContainerChangeNotification changedObjects](self->_note, "changedObjects");
}

- (BOOL)_getOldSet:(id *)a3 newSet:(id *)a4
{
  return -[PLContainerChangeNotification _getOldSet:newSet:](self->_note, "_getOldSet:newSet:", a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_note, 0);
  objc_storeStrong((id *)&self->_albumList, 0);
}

uint64_t __66__PLAggregateAlbumListChangeNotification_enumerateMovesWithBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112) + a2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112) + a3);
  return result;
}

+ (id)notificationForAggregateAlbumList:(id)a3 fromAlbumListChangeNotification:(id)a4 indexOffset:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a3;
  v9 = a4;
  if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v10 = 0;
  else
    v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAggregateAlbumList:fromAlbumListChangeNotification:indexOffset:", v8, v9, a5);

  return v10;
}

@end
