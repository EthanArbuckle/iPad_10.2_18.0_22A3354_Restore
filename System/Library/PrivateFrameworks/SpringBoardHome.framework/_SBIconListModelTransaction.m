@implementation _SBIconListModelTransaction

- (_SBIconListModelTransaction)initWithListModel:(id)a3
{
  id v4;
  _SBIconListModelTransaction *v5;
  _SBIconListModelTransaction *v6;
  uint64_t v7;
  NSMutableSet *addedNodeIdentifiers;
  uint64_t v9;
  NSMutableSet *deletedNodeIdentifiers;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_SBIconListModelTransaction;
  v5 = -[_SBIconListModelTransaction init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_listModel, v4);
    v7 = objc_opt_new();
    addedNodeIdentifiers = v6->_addedNodeIdentifiers;
    v6->_addedNodeIdentifiers = (NSMutableSet *)v7;

    v9 = objc_opt_new();
    deletedNodeIdentifiers = v6->_deletedNodeIdentifiers;
    v6->_deletedNodeIdentifiers = (NSMutableSet *)v9;

  }
  return v6;
}

- (void)addNodeIdentifiers:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (-[NSMutableSet containsObject:](self->_deletedNodeIdentifiers, "containsObject:", v9))
          -[NSMutableSet removeObject:](self->_deletedNodeIdentifiers, "removeObject:", v9);
        else
          -[NSMutableSet addObject:](self->_addedNodeIdentifiers, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)removeNodeIdentifiers:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (-[NSMutableSet containsObject:](self->_addedNodeIdentifiers, "containsObject:", v9))
          -[NSMutableSet removeObject:](self->_addedNodeIdentifiers, "removeObject:", v9);
        else
          -[NSMutableSet addObject:](self->_deletedNodeIdentifiers, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)addAssertion:(id)a3
{
  id v4;
  NSPointerArray *coalesceChangesAssertions;
  NSPointerArray *v6;
  NSPointerArray *v7;
  id v8;

  v4 = a3;
  coalesceChangesAssertions = self->_coalesceChangesAssertions;
  v8 = v4;
  if (!coalesceChangesAssertions)
  {
    objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
    v6 = (NSPointerArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_coalesceChangesAssertions;
    self->_coalesceChangesAssertions = v6;

    v4 = v8;
    coalesceChangesAssertions = self->_coalesceChangesAssertions;
  }
  -[NSPointerArray addPointer:](coalesceChangesAssertions, "addPointer:", v4);

}

- (void)removeAssertion:(id)a3
{
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  id v7;
  id v8;

  v8 = a3;
  v4 = -[NSPointerArray count](self->_coalesceChangesAssertions, "count");
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    while (1)
    {
      -[NSPointerArray pointerAtIndex:](self->_coalesceChangesAssertions, "pointerAtIndex:", v6);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      if (v7 == v8)
        break;

      if (v5 == ++v6)
        goto LABEL_7;
    }
    -[NSPointerArray removePointerAtIndex:](self->_coalesceChangesAssertions, "removePointerAtIndex:", v6);

  }
LABEL_7:

}

- (unint64_t)assertionCount
{
  return -[NSPointerArray count](self->_coalesceChangesAssertions, "count");
}

- (void)queueNotifyingListObserversDidAddIcons:(id)a3 didRemoveIcons:(id)a4 movedIcons:(id)a5 didReplaceIcon:(id)a6 withIcon:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (v12)
    -[_SBIconListModelTransaction addAddedIcons:](self, "addAddedIcons:", v12);
  if (v13)
    -[_SBIconListModelTransaction addRemovedIcons:](self, "addRemovedIcons:", v13);
  if (v14)
    -[_SBIconListModelTransaction addMovedIcons:](self, "addMovedIcons:", v14);
  if (v15)
  {
    -[_SBIconListModelTransaction replacedIcon](self, "replacedIcon");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    if (v17)
    {
      v24[0] = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SBIconListModelTransaction addRemovedIcons:](self, "addRemovedIcons:", v19);

    }
    -[_SBIconListModelTransaction setReplacedIcon:](self, "setReplacedIcon:", v15);

  }
  if (v16)
  {
    -[_SBIconListModelTransaction replacementIcon](self, "replacementIcon");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    if (v20)
    {
      v23 = v20;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SBIconListModelTransaction addAddedIcons:](self, "addAddedIcons:", v22);

    }
    -[_SBIconListModelTransaction setReplacementIcon:](self, "setReplacementIcon:", v16);

  }
}

- (void)addAddedIcons:(id)a3
{
  id v4;
  NSMutableOrderedSet *addedIcons;
  NSMutableOrderedSet *v6;
  NSMutableOrderedSet *v7;
  id v8;

  v4 = a3;
  addedIcons = self->_addedIcons;
  v8 = v4;
  if (!addedIcons)
  {
    v6 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    v7 = self->_addedIcons;
    self->_addedIcons = v6;

    v4 = v8;
    addedIcons = self->_addedIcons;
  }
  -[NSMutableOrderedSet addObjectsFromArray:](addedIcons, "addObjectsFromArray:", v4);
  -[NSMutableOrderedSet removeObjectsInArray:](self->_removedIcons, "removeObjectsInArray:", v8);

}

- (void)addRemovedIcons:(id)a3
{
  id v4;
  NSMutableOrderedSet *removedIcons;
  NSMutableOrderedSet *v6;
  NSMutableOrderedSet *v7;
  id v8;

  v4 = a3;
  removedIcons = self->_removedIcons;
  v8 = v4;
  if (!removedIcons)
  {
    v6 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    v7 = self->_removedIcons;
    self->_removedIcons = v6;

    v4 = v8;
    removedIcons = self->_removedIcons;
  }
  -[NSMutableOrderedSet addObjectsFromArray:](removedIcons, "addObjectsFromArray:", v4);
  -[NSMutableOrderedSet removeObjectsInArray:](self->_addedIcons, "removeObjectsInArray:", v8);

}

- (void)addMovedIcons:(id)a3
{
  id v4;
  NSMutableOrderedSet *movedIcons;
  NSMutableOrderedSet *v6;
  NSMutableOrderedSet *v7;
  id v8;

  v4 = a3;
  movedIcons = self->_movedIcons;
  v8 = v4;
  if (!movedIcons)
  {
    v6 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    v7 = self->_movedIcons;
    self->_movedIcons = v6;

    v4 = v8;
    movedIcons = self->_movedIcons;
  }
  -[NSMutableOrderedSet addObjectsFromArray:](movedIcons, "addObjectsFromArray:", v4);

}

- (void)commitChanges
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  BOOL v27;
  BOOL v28;

  -[_SBIconListModelTransaction listModel](self, "listModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)-[NSMutableSet copy](self->_addedNodeIdentifiers, "copy");
  v5 = (void *)-[NSMutableSet copy](self->_deletedNodeIdentifiers, "copy");
  v6 = objc_msgSend(v4, "count");
  v7 = objc_msgSend(v5, "count");
  v8 = MEMORY[0x1E0C809B0];
  if (v6 | v7)
  {
    v9 = v7 != 0;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __44___SBIconListModelTransaction_commitChanges__block_invoke;
    v23[3] = &unk_1E8D8AB98;
    v27 = v6 != 0;
    v24 = v3;
    v25 = v4;
    v28 = v9;
    v26 = v5;
    objc_msgSend(v24, "enumerateNodeObserversUsingBlock:", v23);

  }
  -[NSMutableOrderedSet array](self->_addedIcons, "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableOrderedSet array](self->_removedIcons, "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableOrderedSet array](self->_movedIcons, "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SBIconListModelTransaction replacedIcon](self, "replacedIcon");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SBIconListModelTransaction replacementIcon](self, "replacementIcon");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v10 || v11 || v12 || v13 || v14)
  {
    v16[0] = v8;
    v16[1] = 3221225472;
    v16[2] = __44___SBIconListModelTransaction_commitChanges__block_invoke_2;
    v16[3] = &unk_1E8D8AB70;
    v17 = v3;
    v18 = v10;
    v19 = v11;
    v20 = v12;
    v21 = v13;
    v22 = v15;
    objc_msgSend(v17, "_notifyListObservers:", v16);

  }
}

- (id)description
{
  return -[_SBIconListModelTransaction descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[_SBIconListModelTransaction succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_SBIconListModelTransaction descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  -[_SBIconListModelTransaction succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendObject:withName:", self->_addedNodeIdentifiers, CFSTR("addedNodeIdentifiers"));
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", self->_deletedNodeIdentifiers, CFSTR("removedNodeIdentifiers"));
  v7 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", self->_addedIcons, CFSTR("addedIcons"), 1);
  v8 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", self->_removedIcons, CFSTR("removedIcons"), 1);
  v9 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", self->_movedIcons, CFSTR("movedIcons"), 1);
  v10 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", self->_movedIcons, CFSTR("movedIcons"), 1);
  v11 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", self->_replacedIcon, CFSTR("replacedIcon"), 1);
  v12 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", self->_replacementIcon, CFSTR("replacementIcon"), 1);
  -[NSPointerArray allObjects](self->_coalesceChangesAssertions, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bs_compactMap:", &__block_literal_global_1030);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (id)objc_msgSend(v4, "appendObject:withName:", v14, CFSTR("reasons"));
  return v4;
}

- (SBIconListModel)listModel
{
  return (SBIconListModel *)objc_loadWeakRetained((id *)&self->_listModel);
}

- (void)setListModel:(id)a3
{
  objc_storeWeak((id *)&self->_listModel, a3);
}

- (SBIcon)replacedIcon
{
  return self->_replacedIcon;
}

- (void)setReplacedIcon:(id)a3
{
  objc_storeStrong((id *)&self->_replacedIcon, a3);
}

- (SBIcon)replacementIcon
{
  return self->_replacementIcon;
}

- (void)setReplacementIcon:(id)a3
{
  objc_storeStrong((id *)&self->_replacementIcon, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replacementIcon, 0);
  objc_storeStrong((id *)&self->_replacedIcon, 0);
  objc_destroyWeak((id *)&self->_listModel);
  objc_storeStrong((id *)&self->_movedIcons, 0);
  objc_storeStrong((id *)&self->_removedIcons, 0);
  objc_storeStrong((id *)&self->_addedIcons, 0);
  objc_storeStrong((id *)&self->_coalesceChangesAssertions, 0);
  objc_storeStrong((id *)&self->_deletedNodeIdentifiers, 0);
  objc_storeStrong((id *)&self->_addedNodeIdentifiers, 0);
}

@end
