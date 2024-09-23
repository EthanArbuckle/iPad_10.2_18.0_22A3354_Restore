@implementation TUIMutableDynamicArray

- (void)performBatchUpdatesWithGeneration:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[TUITransaction currentOrImplicitTransaction](TUITransaction, "currentOrImplicitTransaction"));
  -[TUIMutableDynamicArray performBatchUpdatesWithTransaction:generation:block:](self, "performBatchUpdatesWithTransaction:generation:block:", v8, v7, v6);

}

- (void)performBatchUpdatesWithTransaction:(id)a3 generation:(id)a4 block:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD, _QWORD);
  uint64_t v11;
  id v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void (**)(_QWORD, _QWORD))v9;
  if (v9)
  {
    if (self->_updateGroup)
    {
      (*((void (**)(id, TUIMutableDynamicArray *))v9 + 2))(v9, self);
    }
    else
    {
      v11 = (uint64_t)v13;
      if (!v13)
        v11 = objc_claimAutoreleasedReturnValue(+[TUITransaction currentOrImplicitTransaction](TUITransaction, "currentOrImplicitTransaction"));
      v13 = (id)v11;
      -[TUIMutableDynamicArray _beginBatchUpdatesWithTransaction:generation:](self, "_beginBatchUpdatesWithTransaction:generation:", v11, v8);
      ((void (**)(_QWORD, TUIMutableDynamicArray *))v10)[2](v10, self);
      -[TUIMutableDynamicArray _endBatchUpdates](self, "_endBatchUpdates");
      v12 = (id)objc_opt_self(v13);
    }
  }

}

- (void)_beginBatchUpdatesWithTransaction:(id)a3 generation:(id)a4
{
  _TUIDynamicArrayUpdateGroup *v5;
  _TUIDynamicArrayUpdateGroup *updateGroup;

  v5 = -[TUIDynamicArray _newUpdateGroupWithGeneration:transaction:](self, "_newUpdateGroupWithGeneration:transaction:", a4, a3);
  updateGroup = self->_updateGroup;
  self->_updateGroup = v5;

}

- (void)_endBatchUpdates
{
  _TUIDynamicArrayUpdateGroup *updateGroup;

  -[_TUIDynamicArrayUpdateGroup finalizeUpdates](self->_updateGroup, "finalizeUpdates");
  -[TUIDynamicArray _enqueueUpdate:](self, "_enqueueUpdate:", self->_updateGroup);
  updateGroup = self->_updateGroup;
  self->_updateGroup = 0;

}

- (void)insertItemAtIndex:(unint64_t)a3
{
  _TUIDynamicArrayUpdateGroup *updateGroup;

  updateGroup = self->_updateGroup;
  if (updateGroup)
    -[_TUIDynamicArrayUpdateGroup insertItemAtIndex:](updateGroup, "insertItemAtIndex:", a3);
}

- (void)deleteItemAtIndex:(unint64_t)a3
{
  _TUIDynamicArrayUpdateGroup *updateGroup;

  updateGroup = self->_updateGroup;
  if (updateGroup)
    -[_TUIDynamicArrayUpdateGroup deleteItemAtIndex:](updateGroup, "deleteItemAtIndex:", a3);
}

- (void)updateItemAtIndex:(unint64_t)a3
{
  _TUIDynamicArrayUpdateGroup *updateGroup;

  updateGroup = self->_updateGroup;
  if (updateGroup)
    -[_TUIDynamicArrayUpdateGroup updateItemAtIndex:](updateGroup, "updateItemAtIndex:", a3);
}

- (void)moveItemFromIndex:(unint64_t)a3 toIndex:(unint64_t)a4
{
  _TUIDynamicArrayUpdateGroup *updateGroup;

  updateGroup = self->_updateGroup;
  if (updateGroup)
    -[_TUIDynamicArrayUpdateGroup moveItemFromIndex:toIndex:](updateGroup, "moveItemFromIndex:toIndex:", a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateGroup, 0);
}

@end
