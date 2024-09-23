@implementation _TUIDynamicArrayUpdateGroup

- (_TUIDynamicArrayUpdateGroup)initWithGeneration:(id)a3 count:(unint64_t)a4 transaction:(id)a5
{
  id v9;
  id v10;
  _TUIDynamicArrayUpdateGroup *v11;
  _TUIDynamicArrayUpdateGroup *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)_TUIDynamicArrayUpdateGroup;
  v11 = -[_TUIDynamicArrayUpdateGroup init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong(&v11->_generation, a3);
    v12->_count = a4;
    v12->_oldCount = a4;
    objc_storeStrong((id *)&v12->_transaction, a5);
    -[_TUITransaction addCompletionDeferral](v12->_transaction, "addCompletionDeferral");
  }

  return v12;
}

- (void)dealloc
{
  objc_super v3;

  -[_TUITransaction removeCompletionDeferral](self->_transaction, "removeCompletionDeferral");
  v3.receiver = self;
  v3.super_class = (Class)_TUIDynamicArrayUpdateGroup;
  -[_TUIDynamicArrayUpdateGroup dealloc](&v3, "dealloc");
}

- (NSArray)updates
{
  return (NSArray *)self->_updates;
}

- (void)insertItemAtIndex:(unint64_t)a3
{
  NSMutableArray *inserts;
  NSMutableArray *v6;
  NSMutableArray *v7;
  _TUIDynamicArrayUpdate *v8;

  v8 = objc_opt_new(_TUIDynamicArrayUpdate);
  -[_TUIDynamicArrayUpdate setNewIndex:](v8, "setNewIndex:", a3);
  -[_TUIDynamicArrayUpdate setOldIndex:](v8, "setOldIndex:", 0x7FFFFFFFFFFFFFFFLL);
  -[_TUIDynamicArrayUpdate setKind:](v8, "setKind:", 0);
  ++self->_count;
  inserts = self->_inserts;
  if (!inserts)
  {
    v6 = objc_opt_new(NSMutableArray);
    v7 = self->_inserts;
    self->_inserts = v6;

    inserts = self->_inserts;
  }
  -[NSMutableArray addObject:](inserts, "addObject:", v8);

}

- (void)deleteItemAtIndex:(unint64_t)a3
{
  NSMutableArray *deletes;
  NSMutableArray *v6;
  NSMutableArray *v7;
  _TUIDynamicArrayUpdate *v8;

  v8 = objc_opt_new(_TUIDynamicArrayUpdate);
  -[_TUIDynamicArrayUpdate setNewIndex:](v8, "setNewIndex:", 0x7FFFFFFFFFFFFFFFLL);
  -[_TUIDynamicArrayUpdate setOldIndex:](v8, "setOldIndex:", a3);
  -[_TUIDynamicArrayUpdate setKind:](v8, "setKind:", 1);
  --self->_count;
  deletes = self->_deletes;
  if (!deletes)
  {
    v6 = objc_opt_new(NSMutableArray);
    v7 = self->_deletes;
    self->_deletes = v6;

    deletes = self->_deletes;
  }
  -[NSMutableArray addObject:](deletes, "addObject:", v8);

}

- (void)updateItemAtIndex:(unint64_t)a3
{
  NSMutableArray *updatesOrMoves;
  NSMutableArray *v6;
  NSMutableArray *v7;
  _TUIDynamicArrayUpdate *v8;

  v8 = objc_opt_new(_TUIDynamicArrayUpdate);
  -[_TUIDynamicArrayUpdate setOldIndex:](v8, "setOldIndex:", a3);
  -[_TUIDynamicArrayUpdate setNewIndex:](v8, "setNewIndex:", 0x7FFFFFFFFFFFFFFFLL);
  -[_TUIDynamicArrayUpdate setKind:](v8, "setKind:", 2);
  updatesOrMoves = self->_updatesOrMoves;
  if (!updatesOrMoves)
  {
    v6 = objc_opt_new(NSMutableArray);
    v7 = self->_updatesOrMoves;
    self->_updatesOrMoves = v6;

    updatesOrMoves = self->_updatesOrMoves;
  }
  -[NSMutableArray addObject:](updatesOrMoves, "addObject:", v8);

}

- (void)moveItemFromIndex:(unint64_t)a3 toIndex:(unint64_t)a4
{
  NSMutableArray *updatesOrMoves;
  NSMutableArray *v8;
  NSMutableArray *v9;
  _TUIDynamicArrayUpdate *v10;

  v10 = objc_opt_new(_TUIDynamicArrayUpdate);
  -[_TUIDynamicArrayUpdate setNewIndex:](v10, "setNewIndex:", a4);
  -[_TUIDynamicArrayUpdate setOldIndex:](v10, "setOldIndex:", a3);
  -[_TUIDynamicArrayUpdate setKind:](v10, "setKind:", 3);
  updatesOrMoves = self->_updatesOrMoves;
  if (!updatesOrMoves)
  {
    v8 = objc_opt_new(NSMutableArray);
    v9 = self->_updatesOrMoves;
    self->_updatesOrMoves = v8;

    updatesOrMoves = self->_updatesOrMoves;
  }
  -[NSMutableArray addObject:](updatesOrMoves, "addObject:", v10);

}

- (void)finalizeUpdates
{
  NSMutableArray *v3;
  NSMutableArray *updates;

  -[_TUIDynamicArrayUpdateGroup _validateInserts](self, "_validateInserts");
  v3 = objc_opt_new(NSMutableArray);
  updates = self->_updates;
  self->_updates = v3;

  -[NSMutableArray addObjectsFromArray:](self->_updates, "addObjectsFromArray:", self->_deletes);
  -[NSMutableArray addObjectsFromArray:](self->_updates, "addObjectsFromArray:", self->_inserts);
  -[NSMutableArray addObjectsFromArray:](self->_updates, "addObjectsFromArray:", self->_updatesOrMoves);
}

- (void)_validateInserts
{
  -[NSMutableArray sortUsingComparator:](self->_inserts, "sortUsingComparator:", &stru_2411E0);
}

- (id)trimWithStart:(int64_t)a3 end:(int64_t)a4
{
  TUIIndexMapper *v6;
  NSMutableArray *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  id v13;
  id v14;
  int64_t v16;
  _QWORD v17[4];
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v16 = a4;
  v6 = -[TUIIndexMapper initWithCount:]([TUIIndexMapper alloc], "initWithCount:", self->_oldCount);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = self->_updates;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        switch((unint64_t)objc_msgSend(v12, "kind", v16))
        {
          case 0uLL:
            -[TUIIndexMapper insertAtIndex:](v6, "insertAtIndex:", objc_msgSend(v12, "newIndex"));
            break;
          case 1uLL:
            -[TUIIndexMapper deleteAtIndex:](v6, "deleteAtIndex:", objc_msgSend(v12, "oldIndex"));
            break;
          case 2uLL:
            -[TUIIndexMapper updateAtIndex:](v6, "updateAtIndex:", objc_msgSend(v12, "oldIndex"));
            break;
          case 3uLL:
            -[TUIIndexMapper moveFromIndex:toIndex:](v6, "moveFromIndex:toIndex:", objc_msgSend(v12, "oldIndex"), objc_msgSend(v12, "newIndex"));
            break;
          default:
            continue;
        }
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }

  -[TUIIndexMapper trimWithStart:end:](v6, "trimWithStart:end:", a3, v16);
  v13 = objc_msgSend(objc_alloc((Class)objc_opt_class(self)), "initWithGeneration:count:transaction:", self->_generation, -[TUIIndexMapper oldCount](v6, "oldCount"), self->_transaction);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_D32FC;
  v17[3] = &unk_241208;
  v14 = v13;
  v18 = v14;
  -[TUIIndexMapper computeUpdatesWithBlock:](v6, "computeUpdatesWithBlock:", v17);
  objc_msgSend(v14, "finalizeUpdates");

  return v14;
}

- (unint64_t)count
{
  return self->_count;
}

- (id)generation
{
  return self->_generation;
}

- (_TUITransaction)transaction
{
  return self->_transaction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong(&self->_generation, 0);
  objc_storeStrong((id *)&self->_updatesOrMoves, 0);
  objc_storeStrong((id *)&self->_inserts, 0);
  objc_storeStrong((id *)&self->_deletes, 0);
  objc_storeStrong((id *)&self->_updates, 0);
}

@end
