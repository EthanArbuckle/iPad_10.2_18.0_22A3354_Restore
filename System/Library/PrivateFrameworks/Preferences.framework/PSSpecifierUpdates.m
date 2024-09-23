@implementation PSSpecifierUpdates

+ (id)updatesWithSpecifiers:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSpecifiers:", v4);

  return v5;
}

- (id)_init
{
  PSSpecifierUpdates *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PSSpecifierUpdates;
  v2 = -[PSSpecifierUpdates init](&v4, sel_init);
  if (v2)
    v2->_wantsDebugCallbacks = objc_msgSend((id)objc_opt_class(), "_wantsDebugCallbacks");
  return v2;
}

- (PSSpecifierUpdates)init
{
  uint64_t v4;
  const char *Name;
  const char *v6;

  v4 = objc_opt_class();
  Name = sel_getName(a2);
  v6 = sel_getName(sel_initWithSpecifiers_);
  NSLog(CFSTR("-[%@ %s] called; should be initialized using the designated initializer %s"), v4, Name, v6);

  return 0;
}

- (PSSpecifierUpdates)initWithSpecifiers:(id)a3
{
  return -[PSSpecifierUpdates initWithSpecifiers:applyUpdates:](self, "initWithSpecifiers:applyUpdates:", a3, 0);
}

- (PSSpecifierUpdates)initWithSpecifiers:(id)a3 applyUpdates:(id)a4
{
  id v6;
  id v7;
  PSSpecifierUpdates *v8;
  uint64_t v9;
  NSArray *originalSpecifiers;
  uint64_t v11;
  NSMutableArray *currentSpecifiers;
  uint64_t v13;
  NSMutableArray *updates;
  _QWORD v16[4];
  PSSpecifierUpdates *v17;

  v6 = a3;
  v7 = a4;
  v8 = -[PSSpecifierUpdates _init](self, "_init");
  if (v8)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v6);
    originalSpecifiers = v8->_originalSpecifiers;
    v8->_originalSpecifiers = (NSArray *)v9;

    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v6);
    currentSpecifiers = v8->_currentSpecifiers;
    v8->_currentSpecifiers = (NSMutableArray *)v11;

    v13 = objc_opt_new();
    updates = v8->_updates;
    v8->_updates = (NSMutableArray *)v13;

    if (objc_msgSend(v7, "count"))
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __54__PSSpecifierUpdates_initWithSpecifiers_applyUpdates___block_invoke;
      v16[3] = &unk_1E4A66668;
      v17 = v8;
      objc_msgSend(v7, "enumerateObjectsUsingBlock:", v16);

    }
  }

  return v8;
}

uint64_t __54__PSSpecifierUpdates_initWithSpecifiers_applyUpdates___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addAndApplyOperation:", a2);
}

- (id)_initForCopyWithOriginalSpecifiers:(id)a3 currentSpecifiers:(id)a4 updates:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[PSSpecifierUpdates _init](self, "_init");
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    v13 = (void *)v11[5];
    v11[5] = v12;

    v14 = objc_msgSend(v9, "mutableCopy");
    v15 = (void *)v11[1];
    v11[1] = v14;

    v16 = objc_msgSend(v10, "mutableCopy");
    v17 = (void *)v11[2];
    v11[2] = v16;

  }
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initForCopyWithOriginalSpecifiers:currentSpecifiers:updates:", self->_originalSpecifiers, self->_currentSpecifiers, self->_updates);
}

- (PSSpecifierUpdateContext)context
{
  PSSpecifierUpdateContext *context;
  PSSpecifierUpdateContext *v4;
  PSSpecifierUpdateContext *v5;

  context = self->_context;
  if (!context)
  {
    +[PSSpecifierUpdateContext context](PSSpecifierUpdateContext, "context");
    v4 = (PSSpecifierUpdateContext *)objc_claimAutoreleasedReturnValue();
    v5 = self->_context;
    self->_context = v4;

    context = self->_context;
  }
  return context;
}

+ (Class)_groupIndexClass
{
  return (Class)objc_opt_class();
}

- (id)_groupIndexCreatingIfNecessary
{
  PSSpecifierGroupIndex *groupIndex;
  PSSpecifierGroupIndex *v4;
  PSSpecifierGroupIndex *v5;

  groupIndex = self->_groupIndex;
  if (!groupIndex)
  {
    v4 = (PSSpecifierGroupIndex *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "_groupIndexClass")), "initWithSpecifiers:", self->_currentSpecifiers);
    v5 = self->_groupIndex;
    self->_groupIndex = v4;

    groupIndex = self->_groupIndex;
  }
  return groupIndex;
}

- (PSSpecifierGroupIndex)groupIndex
{
  void *v2;
  void *v3;

  -[PSSpecifierUpdates _groupIndexCreatingIfNecessary](self, "_groupIndexCreatingIfNecessary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (PSSpecifierGroupIndex *)v3;
}

- (NSArray)currentSpecifiers
{
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", self->_currentSpecifiers);
}

- (NSArray)updates
{
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", self->_updates);
}

- (void)enumerateUpdatesUsingBlock:(id)a3
{
  id v4;
  NSMutableArray *updates;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  updates = self->_updates;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__PSSpecifierUpdates_enumerateUpdatesUsingBlock___block_invoke;
  v7[3] = &unk_1E4A66690;
  v8 = v4;
  v6 = v4;
  -[NSMutableArray enumerateObjectsUsingBlock:](updates, "enumerateObjectsUsingBlock:", v7);

}

uint64_t __49__PSSpecifierUpdates_enumerateUpdatesUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (unint64_t)indexOfSpecifier:(id)a3
{
  return -[NSMutableArray indexOfObject:](self->_currentSpecifiers, "indexOfObject:", a3);
}

- (unint64_t)indexOfSpecifierWithID:(id)a3
{
  return -[NSMutableArray indexOfSpecifierWithID:](self->_currentSpecifiers, "indexOfSpecifierWithID:", a3);
}

- (id)specifierForID:(id)a3
{
  return (id)-[NSMutableArray specifierForID:](self->_currentSpecifiers, "specifierForID:", a3);
}

- (BOOL)_enumerateArrayWithConjuctionalResult:(id)a3 usingBlock:(id)a4
{
  id v5;
  id v6;
  id v7;
  char v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v5 = a3;
  v6 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 1;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__PSSpecifierUpdates__enumerateArrayWithConjuctionalResult_usingBlock___block_invoke;
  v10[3] = &unk_1E4A666B8;
  v12 = &v13;
  v7 = v6;
  v11 = v7;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);
  v8 = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return v8;
}

uint64_t __71__PSSpecifierUpdates__enumerateArrayWithConjuctionalResult_usingBlock___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  BOOL v4;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if ((_DWORD)result)
    v4 = *(_BYTE *)(v3 + 24) != 0;
  else
    v4 = 0;
  *(_BYTE *)(v3 + 24) = v4;
  return result;
}

+ (BOOL)_wantsDebugCallbacks
{
  return 0;
}

- (BOOL)_addAndApplyOperation:(id)a3
{
  id v4;
  int v5;

  v4 = a3;
  v5 = objc_msgSend(v4, "applyToArray:", self->_currentSpecifiers);
  if (v5)
  {
    -[NSMutableArray addObject:](self->_updates, "addObject:", v4);
    -[PSSpecifierGroupIndex performUpdateOperation:](self->_groupIndex, "performUpdateOperation:", v4);
    if (self->_wantsDebugCallbacks)
      -[PSSpecifierUpdates _didApplyOperation:](self, "_didApplyOperation:", v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Specifier updates %@ failed to apply update operation %@ to specifiers %@.\nThis should not be happening and is almost certainly due to the caller having provided an inconsistent array of specifiers or updates at initialization."), self, v4, self->_currentSpecifiers);
  }

  return v5;
}

- (BOOL)insertSpecifier:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;

  v6 = a3;
  if (v6)
  {
    if (-[NSMutableArray count](self->_currentSpecifiers, "count") >= a4)
    {
      +[PSSpecifierUpdateOperation insertOperationWithSpecifier:atIndex:](PSSpecifierUpdateOperation, "insertOperationWithSpecifier:atIndex:", v6, a4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[PSSpecifierUpdates _addAndApplyOperation:](self, "_addAndApplyOperation:", v7);
      goto LABEL_7;
    }
    if (self->_wantsDebugCallbacks)
    {
      +[PSSpecifierUpdateOperation insertOperationWithSpecifier:atIndex:](PSSpecifierUpdateOperation, "insertOperationWithSpecifier:atIndex:", v6, a4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("attempted to insert specifier at out-of-bounds index %lu"), a4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%s failed: %@"), "-[PSSpecifierUpdates insertSpecifier:atIndex:]", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSSpecifierUpdates _operationFailed:reason:](self, "_operationFailed:reason:", v7, v10);

      v11 = 0;
LABEL_7:

      goto LABEL_8;
    }
  }
  v11 = 0;
LABEL_8:

  return v11;
}

- (BOOL)insertSpecifier:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;

  v6 = a3;
  v7 = a4;
  -[PSSpecifierUpdates _groupIndexCreatingIfNecessary](self, "_groupIndexCreatingIfNecessary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "indexOfSpecifierAtIndexPath:forInsertion:", v7, 1);

  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (self->_wantsDebugCallbacks)
    {
      +[PSSpecifierUpdateOperation insertOperationWithSpecifier:atIndex:](PSSpecifierUpdateOperation, "insertOperationWithSpecifier:atIndex:", v6, 0x7FFFFFFFFFFFFFFFLL);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("attempted to insert at missing indexPath %@"), v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%s failed: %@"), "-[PSSpecifierUpdates insertSpecifier:atIndexPath:]", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSSpecifierUpdates _operationFailed:reason:](self, "_operationFailed:reason:", v10, v13);

    }
    v14 = 0;
  }
  else
  {
    v14 = -[PSSpecifierUpdates insertSpecifier:atIndex:](self, "insertSpecifier:atIndex:", v6, v9);
  }

  return v14;
}

- (BOOL)insertSpecifier:(id)a3 afterSpecifier:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;

  v6 = a3;
  v7 = a4;
  v8 = -[NSMutableArray indexOfObject:](self->_currentSpecifiers, "indexOfObject:", v7);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (self->_wantsDebugCallbacks)
    {
      +[PSSpecifierUpdateOperation insertOperationWithSpecifier:atIndex:](PSSpecifierUpdateOperation, "insertOperationWithSpecifier:atIndex:", v6, 0x8000000000000000);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("attempted to insert after missing specifier %@"), v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("%s failed: %@"), "-[PSSpecifierUpdates insertSpecifier:afterSpecifier:]", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSSpecifierUpdates _operationFailed:reason:](self, "_operationFailed:reason:", v9, v12);

    }
    v13 = 0;
  }
  else
  {
    v13 = -[PSSpecifierUpdates insertSpecifier:atIndex:](self, "insertSpecifier:atIndex:", v6, v8 + 1);
  }

  return v13;
}

- (BOOL)insertSpecifier:(id)a3 afterSpecifierWithID:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;

  v6 = a3;
  v7 = a4;
  v8 = -[NSMutableArray indexOfSpecifierWithID:](self->_currentSpecifiers, "indexOfSpecifierWithID:", v7);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (self->_wantsDebugCallbacks)
    {
      +[PSSpecifierUpdateOperation insertOperationWithSpecifier:atIndex:](PSSpecifierUpdateOperation, "insertOperationWithSpecifier:atIndex:", v6, 0x8000000000000000);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("attempted to insert after missing specifier ID %@"), v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("%s failed: %@"), "-[PSSpecifierUpdates insertSpecifier:afterSpecifierWithID:]", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSSpecifierUpdates _operationFailed:reason:](self, "_operationFailed:reason:", v9, v12);

    }
    v13 = 0;
  }
  else
  {
    v13 = -[PSSpecifierUpdates insertSpecifier:atIndex:](self, "insertSpecifier:atIndex:", v6, v8 + 1);
  }

  return v13;
}

- (BOOL)insertContiguousSpecifiers:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  BOOL v7;
  _QWORD v9[6];

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __57__PSSpecifierUpdates_insertContiguousSpecifiers_atIndex___block_invoke;
    v9[3] = &unk_1E4A666E0;
    v9[4] = self;
    v9[5] = a4;
    v7 = -[PSSpecifierUpdates _enumerateArrayWithConjuctionalResult:usingBlock:](self, "_enumerateArrayWithConjuctionalResult:usingBlock:", v6, v9);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __57__PSSpecifierUpdates_insertContiguousSpecifiers_atIndex___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "insertSpecifier:atIndex:", a2, *(_QWORD *)(a1 + 40) + a3);
}

- (BOOL)insertContiguousSpecifiers:(id)a3 afterSpecifier:(id)a4
{
  NSMutableArray *currentSpecifiers;
  id v7;

  currentSpecifiers = self->_currentSpecifiers;
  v7 = a3;
  LOBYTE(a4) = -[PSSpecifierUpdates insertContiguousSpecifiers:atIndex:](self, "insertContiguousSpecifiers:atIndex:", v7, -[NSMutableArray indexOfObject:](currentSpecifiers, "indexOfObject:", a4) + 1);

  return (char)a4;
}

- (BOOL)insertContiguousSpecifiers:(id)a3 afterSpecifierWithID:(id)a4
{
  NSMutableArray *currentSpecifiers;
  id v7;

  currentSpecifiers = self->_currentSpecifiers;
  v7 = a3;
  LOBYTE(a4) = -[PSSpecifierUpdates insertContiguousSpecifiers:atIndex:](self, "insertContiguousSpecifiers:atIndex:", v7, -[NSMutableArray indexOfSpecifierWithID:](currentSpecifiers, "indexOfSpecifierWithID:", a4) + 1);

  return (char)a4;
}

- (BOOL)appendSpecifier:(id)a3
{
  PSSpecifierUpdates *v3;
  NSMutableArray *currentSpecifiers;
  id v5;

  v3 = self;
  currentSpecifiers = self->_currentSpecifiers;
  v5 = a3;
  LOBYTE(v3) = -[PSSpecifierUpdates insertSpecifier:atIndex:](v3, "insertSpecifier:atIndex:", v5, -[NSMutableArray count](currentSpecifiers, "count"));

  return (char)v3;
}

- (BOOL)appendSpecifiers:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__PSSpecifierUpdates_appendSpecifiers___block_invoke;
  v4[3] = &unk_1E4A66708;
  v4[4] = self;
  return -[PSSpecifierUpdates _enumerateArrayWithConjuctionalResult:usingBlock:](self, "_enumerateArrayWithConjuctionalResult:usingBlock:", a3, v4);
}

uint64_t __39__PSSpecifierUpdates_appendSpecifiers___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendSpecifier:", a2);
}

- (BOOL)appendSpecifier:(id)a3 toGroupAtGroupIndex:(unint64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  BOOL v9;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v11 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[PSSpecifierUpdates appendSpecifiers:toGroupAtGroupIndex:](self, "appendSpecifiers:toGroupAtGroupIndex:", v8, a4, v11, v12);
  return v9;
}

- (BOOL)appendSpecifiers:(id)a3 toGroupAtGroupIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    -[PSSpecifierUpdates _groupIndexCreatingIfNecessary](self, "_groupIndexCreatingIfNecessary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "numberOfGroups") <= a4)
    {
      if (self->_wantsDebugCallbacks)
      {
        objc_msgSend(v6, "firstObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[PSSpecifierUpdateOperation insertOperationWithSpecifier:atIndex:](PSSpecifierUpdateOperation, "insertOperationWithSpecifier:atIndex:", v10, 0x7FFFFFFFFFFFFFFFLL);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("attempted to append specifiers to out-of-bounds group at index %lu"), a4);
        goto LABEL_9;
      }
    }
    else
    {
      v8 = objc_msgSend(v7, "rangeOfSpecifiersInGroupAtGroupIndex:", a4);
      if (v8 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v13 = -[PSSpecifierUpdates insertContiguousSpecifiers:atIndex:](self, "insertContiguousSpecifiers:atIndex:", v6, v8 + v9);
        goto LABEL_12;
      }
      if (self->_wantsDebugCallbacks)
      {
        objc_msgSend(v6, "firstObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[PSSpecifierUpdateOperation insertOperationWithSpecifier:atIndex:](PSSpecifierUpdateOperation, "insertOperationWithSpecifier:atIndex:", v10, 0x7FFFFFFFFFFFFFFFLL);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("attempted to append specifiers to invalid group index %lu"), a4);
LABEL_9:
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringWithFormat:", CFSTR("%s failed: %@"), "-[PSSpecifierUpdates appendSpecifiers:toGroupAtGroupIndex:]", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[PSSpecifierUpdates _operationFailed:reason:](self, "_operationFailed:reason:", v11, v15);

      }
    }
    v13 = 0;
LABEL_12:

    goto LABEL_13;
  }
  v13 = 0;
LABEL_13:

  return v13;
}

- (BOOL)appendSpecifier:(id)a3 toGroup:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  BOOL v10;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v12 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PSSpecifierUpdates appendSpecifiers:toGroup:](self, "appendSpecifiers:toGroup:", v9, v7, v12, v13);
  return v10;
}

- (BOOL)appendSpecifiers:(id)a3 toGroup:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[PSSpecifierUpdates _groupIndexCreatingIfNecessary](self, "_groupIndexCreatingIfNecessary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "groupSpecifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "indexOfObject:", v7);

    if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v16 = -[PSSpecifierUpdates appendSpecifiers:toGroupAtGroupIndex:](self, "appendSpecifiers:toGroupAtGroupIndex:", v6, v10);
      goto LABEL_7;
    }
    if (self->_wantsDebugCallbacks)
    {
      objc_msgSend(v6, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[PSSpecifierUpdateOperation insertOperationWithSpecifier:atIndex:](PSSpecifierUpdateOperation, "insertOperationWithSpecifier:atIndex:", v11, 0x7FFFFFFFFFFFFFFFLL);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("attempted to append specifiers to missing group %@"), v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("%s failed: %@"), "-[PSSpecifierUpdates appendSpecifiers:toGroup:]", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSSpecifierUpdates _operationFailed:reason:](self, "_operationFailed:reason:", v12, v15);

    }
  }
  v16 = 0;
LABEL_7:

  return v16;
}

- (BOOL)appendSpecifier:(id)a3 toGroupWithID:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  BOOL v10;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v12 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PSSpecifierUpdates appendSpecifiers:toGroupWithID:](self, "appendSpecifiers:toGroupWithID:", v9, v7, v12, v13);
  return v10;
}

- (BOOL)appendSpecifiers:(id)a3 toGroupWithID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[PSSpecifierUpdates _groupIndexCreatingIfNecessary](self, "_groupIndexCreatingIfNecessary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "groupSpecifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "indexOfSpecifierWithID:", v7);

    if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v16 = -[PSSpecifierUpdates appendSpecifiers:toGroupAtGroupIndex:](self, "appendSpecifiers:toGroupAtGroupIndex:", v6, v10);
      goto LABEL_7;
    }
    if (self->_wantsDebugCallbacks)
    {
      objc_msgSend(v6, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[PSSpecifierUpdateOperation insertOperationWithSpecifier:atIndex:](PSSpecifierUpdateOperation, "insertOperationWithSpecifier:atIndex:", v11, 0x7FFFFFFFFFFFFFFFLL);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("attempted to append specifiers to missing group ID %@"), v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("%s failed: %@"), "-[PSSpecifierUpdates appendSpecifiers:toGroupWithID:]", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSSpecifierUpdates _operationFailed:reason:](self, "_operationFailed:reason:", v12, v15);

    }
  }
  v16 = 0;
LABEL_7:

  return v16;
}

- (BOOL)removeSpecifier:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  v4 = a3;
  v5 = -[NSMutableArray indexOfObject:](self->_currentSpecifiers, "indexOfObject:", v4);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (self->_wantsDebugCallbacks)
    {
      +[PSSpecifierUpdateOperation removeOperationWithSpecifier:atIndex:](PSSpecifierUpdateOperation, "removeOperationWithSpecifier:atIndex:", v4, 0x7FFFFFFFFFFFFFFFLL);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("attempted to remove missing specifier %@"), v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%s failed: %@"), "-[PSSpecifierUpdates removeSpecifier:]", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSSpecifierUpdates _operationFailed:reason:](self, "_operationFailed:reason:", v6, v9);

    }
    v10 = 0;
  }
  else
  {
    v10 = -[PSSpecifierUpdates removeSpecifierAtIndex:](self, "removeSpecifierAtIndex:", v5);
  }

  return v10;
}

- (BOOL)removeSpecifiers:(id)a3
{
  id v4;
  BOOL v5;
  _QWORD v7[5];

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __39__PSSpecifierUpdates_removeSpecifiers___block_invoke;
    v7[3] = &unk_1E4A66708;
    v7[4] = self;
    v5 = -[PSSpecifierUpdates _enumerateArrayWithConjuctionalResult:usingBlock:](self, "_enumerateArrayWithConjuctionalResult:usingBlock:", v4, v7);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __39__PSSpecifierUpdates_removeSpecifiers___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeSpecifier:", a2);
}

- (BOOL)removeSpecifierWithID:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *currentSpecifiers;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  _QWORD v15[4];
  id v16;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    currentSpecifiers = self->_currentSpecifiers;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __44__PSSpecifierUpdates_removeSpecifierWithID___block_invoke;
    v15[3] = &unk_1E4A66730;
    v7 = v4;
    v16 = v7;
    v8 = -[NSMutableArray indexOfObjectPassingTest:](currentSpecifiers, "indexOfObjectPassingTest:", v15);
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (self->_wantsDebugCallbacks)
      {
        +[PSSpecifierUpdateOperation removeOperationWithSpecifier:atIndex:](PSSpecifierUpdateOperation, "removeOperationWithSpecifier:atIndex:", 0, 0x7FFFFFFFFFFFFFFFLL);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("attempted to remove missing specifier ID %@"), v7);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", CFSTR("%s failed: %@"), "-[PSSpecifierUpdates removeSpecifierWithID:]", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[PSSpecifierUpdates _operationFailed:reason:](self, "_operationFailed:reason:", v9, v12);

      }
      v13 = 0;
    }
    else
    {
      v13 = -[PSSpecifierUpdates removeSpecifierAtIndex:](self, "removeSpecifierAtIndex:", v8);
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

uint64_t __44__PSSpecifierUpdates_removeSpecifierWithID___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  return v4;
}

- (BOOL)removeSpecifiersWithIDs:(id)a3
{
  id v4;
  BOOL v5;
  _QWORD v7[5];

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __46__PSSpecifierUpdates_removeSpecifiersWithIDs___block_invoke;
    v7[3] = &unk_1E4A66758;
    v7[4] = self;
    v5 = -[PSSpecifierUpdates _enumerateArrayWithConjuctionalResult:usingBlock:](self, "_enumerateArrayWithConjuctionalResult:usingBlock:", v4, v7);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __46__PSSpecifierUpdates_removeSpecifiersWithIDs___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeSpecifierWithID:", a2);
}

- (BOOL)removeSpecifierAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;

  if (-[NSMutableArray count](self->_currentSpecifiers, "count") <= a3)
  {
    if (!self->_wantsDebugCallbacks)
      return 0;
    +[PSSpecifierUpdateOperation removeOperationWithSpecifier:atIndex:](PSSpecifierUpdateOperation, "removeOperationWithSpecifier:atIndex:", 0, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("attempted to remove specifier at out-of-bounds index %lu"), a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%s failed: %@"), "-[PSSpecifierUpdates removeSpecifierAtIndex:]", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSpecifierUpdates _operationFailed:reason:](self, "_operationFailed:reason:", v5, v9);

    v7 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_currentSpecifiers, "objectAtIndexedSubscript:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PSSpecifierUpdateOperation removeOperationWithSpecifier:atIndex:](PSSpecifierUpdateOperation, "removeOperationWithSpecifier:atIndex:", v5, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PSSpecifierUpdates _addAndApplyOperation:](self, "_addAndApplyOperation:", v6);
  }

  return v7;
}

- (BOOL)_removeOneSpecifierOnlyAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;

  if (-[NSMutableArray count](self->_currentSpecifiers, "count") <= a3)
  {
    if (!self->_wantsDebugCallbacks)
      return 0;
    +[PSSpecifierUpdateOperation _removeOneSpecifierOnlyOperationWithSpecifier:atIndex:](PSSpecifierUpdateOperation, "_removeOneSpecifierOnlyOperationWithSpecifier:atIndex:", 0, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("attempted to remove specifier at out-of-bounds index %lu"), a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%s failed: %@"), "-[PSSpecifierUpdates _removeOneSpecifierOnlyAtIndex:]", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSpecifierUpdates _operationFailed:reason:](self, "_operationFailed:reason:", v5, v9);

    v7 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_currentSpecifiers, "objectAtIndexedSubscript:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PSSpecifierUpdateOperation _removeOneSpecifierOnlyOperationWithSpecifier:atIndex:](PSSpecifierUpdateOperation, "_removeOneSpecifierOnlyOperationWithSpecifier:atIndex:", v5, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PSSpecifierUpdates _addAndApplyOperation:](self, "_addAndApplyOperation:", v6);
  }

  return v7;
}

- (BOOL)removeSpecifiersInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v6;
  unint64_t v7;
  void *v8;
  NSUInteger v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSRange v17;

  length = a3.length;
  location = a3.location;
  v6 = a3.location + a3.length;
  if (a3.location + a3.length <= -[NSMutableArray count](self->_currentSpecifiers, "count"))
  {
    v9 = v6 - 1;
    v10 = 1;
    while (v9 >= location)
      v10 &= -[PSSpecifierUpdates removeSpecifierAtIndex:](self, "removeSpecifierAtIndex:", v9--);
  }
  else
  {
    if (self->_wantsDebugCallbacks)
    {
      v7 = -[NSMutableArray count](self->_currentSpecifiers, "count");
      if (location >= v7)
      {
        v8 = 0;
      }
      else
      {
        -[NSMutableArray objectAtIndexedSubscript:](self->_currentSpecifiers, "objectAtIndexedSubscript:", location);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      +[PSSpecifierUpdateOperation removeOperationWithSpecifier:atIndex:](PSSpecifierUpdateOperation, "removeOperationWithSpecifier:atIndex:", v8, location);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0CB3940];
      v17.location = location;
      v17.length = length;
      NSStringFromRange(v17);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("attempted to remove specifiers in out-of-bounds range %@"), v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("%s failed: %@"), "-[PSSpecifierUpdates removeSpecifiersInRange:]", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSSpecifierUpdates _operationFailed:reason:](self, "_operationFailed:reason:", v11, v15);

      if (location < v7)
    }
    LOBYTE(v10) = 0;
  }
  return v10;
}

- (BOOL)removeSpecifierAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;

  v4 = a3;
  -[PSSpecifierUpdates _groupIndexCreatingIfNecessary](self, "_groupIndexCreatingIfNecessary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfSpecifierAtIndexPath:", v4);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (self->_wantsDebugCallbacks)
    {
      +[PSSpecifierUpdateOperation removeOperationWithSpecifier:atIndex:](PSSpecifierUpdateOperation, "removeOperationWithSpecifier:atIndex:", 0, 0x7FFFFFFFFFFFFFFFLL);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("attempted to remove specifier at missing or out-of-bounds indexPath %@"), v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%s failed: %@"), "-[PSSpecifierUpdates removeSpecifierAtIndexPath:]", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSSpecifierUpdates _operationFailed:reason:](self, "_operationFailed:reason:", v7, v10);

    }
    v11 = 0;
  }
  else
  {
    v11 = -[PSSpecifierUpdates removeSpecifierAtIndex:](self, "removeSpecifierAtIndex:", v6);
  }

  return v11;
}

- (BOOL)removeSpecifiersInGroupAtGroupIndex:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;

  -[PSSpecifierUpdates _groupIndexCreatingIfNecessary](self, "_groupIndexCreatingIfNecessary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "numberOfGroups") <= a3)
  {
    if (self->_wantsDebugCallbacks)
    {
      +[PSSpecifierUpdateOperation removeOperationWithSpecifier:atIndex:](PSSpecifierUpdateOperation, "removeOperationWithSpecifier:atIndex:", 0, 0x7FFFFFFFFFFFFFFFLL);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("attempted to remove specifiers in out-of-bounds group at index %lu"), a3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", CFSTR("%s failed: %@"), "-[PSSpecifierUpdates removeSpecifiersInGroupAtGroupIndex:]", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSSpecifierUpdates _operationFailed:reason:](self, "_operationFailed:reason:", v8, v16);

      goto LABEL_7;
    }
  }
  else
  {
    v6 = objc_msgSend(v5, "rangeOfSpecifiersInGroupAtGroupIndex:", a3);
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v17 = -[PSSpecifierUpdates removeSpecifiersInRange:](self, "removeSpecifiersInRange:", v6, v7);
      goto LABEL_10;
    }
    if (self->_wantsDebugCallbacks)
    {
      objc_msgSend(v5, "groupSpecifiers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[PSSpecifierUpdateOperation removeOperationWithSpecifier:atIndex:](PSSpecifierUpdateOperation, "removeOperationWithSpecifier:atIndex:", v9, 0x7FFFFFFFFFFFFFFFLL);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("attempted to remove specifiers in group at index %lu that does not have a valid range"), a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%s failed: %@"), "-[PSSpecifierUpdates removeSpecifiersInGroupAtGroupIndex:]", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSSpecifierUpdates _operationFailed:reason:](self, "_operationFailed:reason:", v10, v13);

LABEL_7:
    }
  }
  v17 = 0;
LABEL_10:

  return v17;
}

- (BOOL)removeSpecifiersInGroup:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = v4;
  if (v4 && !objc_msgSend(v4, "cellType"))
  {
    -[PSSpecifierUpdates _groupIndexCreatingIfNecessary](self, "_groupIndexCreatingIfNecessary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "groupIndexOfGroup:", v5);

    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v6 = -[PSSpecifierUpdates removeSpecifiersInGroupAtGroupIndex:](self, "removeSpecifiersInGroupAtGroupIndex:", v9);
      goto LABEL_4;
    }
    if (self->_wantsDebugCallbacks)
    {
      +[PSSpecifierUpdateOperation removeOperationWithSpecifier:atIndex:](PSSpecifierUpdateOperation, "removeOperationWithSpecifier:atIndex:", v5, 0x7FFFFFFFFFFFFFFFLL);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("attempted to remove specifiers in missing group %@"), v5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%s failed: %@"), "-[PSSpecifierUpdates removeSpecifiersInGroup:]", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSSpecifierUpdates _operationFailed:reason:](self, "_operationFailed:reason:", v10, v13);

    }
  }
  v6 = 0;
LABEL_4:

  return v6;
}

- (BOOL)removeSpecifiersInGroupWithID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;

  v4 = a3;
  if (v4)
  {
    -[PSSpecifierUpdates _groupIndexCreatingIfNecessary](self, "_groupIndexCreatingIfNecessary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "groupIndexOfGroupWithID:", v4);

    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v11 = -[PSSpecifierUpdates removeSpecifiersInGroupAtGroupIndex:](self, "removeSpecifiersInGroupAtGroupIndex:", v6);
      goto LABEL_7;
    }
    if (self->_wantsDebugCallbacks)
    {
      +[PSSpecifierUpdateOperation removeOperationWithSpecifier:atIndex:](PSSpecifierUpdateOperation, "removeOperationWithSpecifier:atIndex:", 0, 0x7FFFFFFFFFFFFFFFLL);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("attempted to remove specifiers in missing group with ID %@"), v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%s failed: %@"), "-[PSSpecifierUpdates removeSpecifiersInGroupWithID:]", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSSpecifierUpdates _operationFailed:reason:](self, "_operationFailed:reason:", v7, v10);

    }
  }
  v11 = 0;
LABEL_7:

  return v11;
}

- (BOOL)reloadSpecifier:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  v4 = a3;
  if (v4)
  {
    v5 = -[NSMutableArray indexOfObject:](self->_currentSpecifiers, "indexOfObject:", v4);
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = -[PSSpecifierUpdates reloadSpecifierAtIndex:](self, "reloadSpecifierAtIndex:", v5);
      goto LABEL_7;
    }
    if (self->_wantsDebugCallbacks)
    {
      +[PSSpecifierUpdateOperation reloadOperationWithSpecifier:atIndex:](PSSpecifierUpdateOperation, "reloadOperationWithSpecifier:atIndex:", v4, 0x7FFFFFFFFFFFFFFFLL);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("attempted to reload missing specifier %@"), v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("%s failed: %@"), "-[PSSpecifierUpdates reloadSpecifier:]", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSSpecifierUpdates _operationFailed:reason:](self, "_operationFailed:reason:", v6, v9);

    }
  }
  v10 = 0;
LABEL_7:

  return v10;
}

- (BOOL)reloadSpecifiers:(id)a3
{
  id v4;
  BOOL v5;
  _QWORD v7[5];

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __39__PSSpecifierUpdates_reloadSpecifiers___block_invoke;
    v7[3] = &unk_1E4A66708;
    v7[4] = self;
    v5 = -[PSSpecifierUpdates _enumerateArrayWithConjuctionalResult:usingBlock:](self, "_enumerateArrayWithConjuctionalResult:usingBlock:", v4, v7);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __39__PSSpecifierUpdates_reloadSpecifiers___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifier:", a2);
}

- (BOOL)reloadSpecifiersInGroupAtGroupIndex:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;

  -[PSSpecifierUpdates _groupIndexCreatingIfNecessary](self, "_groupIndexCreatingIfNecessary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "numberOfGroups") <= a3)
  {
    if (self->_wantsDebugCallbacks)
    {
      +[PSSpecifierUpdateOperation reloadOperationWithSpecifier:atIndex:](PSSpecifierUpdateOperation, "reloadOperationWithSpecifier:atIndex:", 0, 0x7FFFFFFFFFFFFFFFLL);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("attempted to reload specifiers in out-of-bounds group at index %lu"), a3);
      goto LABEL_7;
    }
  }
  else
  {
    v6 = objc_msgSend(v5, "rangeOfSpecifiersInGroupAtGroupIndex:", a3);
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v12 = -[PSSpecifierUpdates reloadSpecifiersInRange:](self, "reloadSpecifiersInRange:", v6, v7);
      goto LABEL_10;
    }
    if (self->_wantsDebugCallbacks)
    {
      +[PSSpecifierUpdateOperation reloadOperationWithSpecifier:atIndex:](PSSpecifierUpdateOperation, "reloadOperationWithSpecifier:atIndex:", 0, 0x7FFFFFFFFFFFFFFFLL);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("attempted to reload specifiers in missing group at index %lu"), a3);
LABEL_7:
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("%s failed: %@"), "-[PSSpecifierUpdates reloadSpecifiersInGroupAtGroupIndex:]", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSSpecifierUpdates _operationFailed:reason:](self, "_operationFailed:reason:", v8, v11);

    }
  }
  v12 = 0;
LABEL_10:

  return v12;
}

- (BOOL)reloadSpecifiersInGroup:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = v4;
  if (v4 && !objc_msgSend(v4, "cellType"))
  {
    -[PSSpecifierUpdates _groupIndexCreatingIfNecessary](self, "_groupIndexCreatingIfNecessary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "groupIndexOfGroup:", v5);

    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v6 = -[PSSpecifierUpdates reloadSpecifiersInGroupAtGroupIndex:](self, "reloadSpecifiersInGroupAtGroupIndex:", v9);
      goto LABEL_4;
    }
    if (self->_wantsDebugCallbacks)
    {
      +[PSSpecifierUpdateOperation reloadOperationWithSpecifier:atIndex:](PSSpecifierUpdateOperation, "reloadOperationWithSpecifier:atIndex:", 0, 0x7FFFFFFFFFFFFFFFLL);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("attempted to reload specifiers in missing group %@"), v5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%s failed: %@"), "-[PSSpecifierUpdates reloadSpecifiersInGroup:]", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSSpecifierUpdates _operationFailed:reason:](self, "_operationFailed:reason:", v10, v13);

    }
  }
  v6 = 0;
LABEL_4:

  return v6;
}

- (BOOL)reloadSpecifiersInGroupWithID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;

  v4 = a3;
  if (v4)
  {
    -[PSSpecifierUpdates _groupIndexCreatingIfNecessary](self, "_groupIndexCreatingIfNecessary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "groupIndexOfGroupWithID:", v4);

    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v11 = -[PSSpecifierUpdates reloadSpecifiersInGroupAtGroupIndex:](self, "reloadSpecifiersInGroupAtGroupIndex:", v6);
      goto LABEL_7;
    }
    if (self->_wantsDebugCallbacks)
    {
      +[PSSpecifierUpdateOperation reloadOperationWithSpecifier:atIndex:](PSSpecifierUpdateOperation, "reloadOperationWithSpecifier:atIndex:", 0, 0x7FFFFFFFFFFFFFFFLL);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("attempted to reload specifiers in missing group ID %@"), v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%s failed: %@"), "-[PSSpecifierUpdates reloadSpecifiersInGroupWithID:]", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSSpecifierUpdates _operationFailed:reason:](self, "_operationFailed:reason:", v7, v10);

    }
  }
  v11 = 0;
LABEL_7:

  return v11;
}

- (BOOL)reloadSpecifierWithID:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *currentSpecifiers;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  _QWORD v15[4];
  id v16;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    currentSpecifiers = self->_currentSpecifiers;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __44__PSSpecifierUpdates_reloadSpecifierWithID___block_invoke;
    v15[3] = &unk_1E4A66730;
    v7 = v4;
    v16 = v7;
    v8 = -[NSMutableArray indexOfObjectPassingTest:](currentSpecifiers, "indexOfObjectPassingTest:", v15);
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (self->_wantsDebugCallbacks)
      {
        +[PSSpecifierUpdateOperation reloadOperationWithSpecifier:atIndex:](PSSpecifierUpdateOperation, "reloadOperationWithSpecifier:atIndex:", 0, 0x7FFFFFFFFFFFFFFFLL);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("attempted to reload missing specifier ID %@"), v7);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", CFSTR("%s failed: %@"), "-[PSSpecifierUpdates reloadSpecifierWithID:]", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[PSSpecifierUpdates _operationFailed:reason:](self, "_operationFailed:reason:", v9, v12);

      }
      v13 = 0;
    }
    else
    {
      v13 = -[PSSpecifierUpdates reloadSpecifierAtIndex:](self, "reloadSpecifierAtIndex:", v8);
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

uint64_t __44__PSSpecifierUpdates_reloadSpecifierWithID___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  return v4;
}

- (BOOL)reloadSpecifiersWithIDs:(id)a3
{
  id v4;
  BOOL v5;
  _QWORD v7[5];

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __46__PSSpecifierUpdates_reloadSpecifiersWithIDs___block_invoke;
    v7[3] = &unk_1E4A66758;
    v7[4] = self;
    v5 = -[PSSpecifierUpdates _enumerateArrayWithConjuctionalResult:usingBlock:](self, "_enumerateArrayWithConjuctionalResult:usingBlock:", v4, v7);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __46__PSSpecifierUpdates_reloadSpecifiersWithIDs___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifierWithID:", a2);
}

- (BOOL)reloadSpecifierAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;

  if (-[NSMutableArray count](self->_currentSpecifiers, "count") <= a3)
  {
    if (!self->_wantsDebugCallbacks)
      return 0;
    +[PSSpecifierUpdateOperation reloadOperationWithSpecifier:atIndex:](PSSpecifierUpdateOperation, "reloadOperationWithSpecifier:atIndex:", 0, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("attempted to reload specifier at out-of-bounds index %lu"), a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%s failed: %@"), "-[PSSpecifierUpdates reloadSpecifierAtIndex:]", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSpecifierUpdates _operationFailed:reason:](self, "_operationFailed:reason:", v5, v9);

    v7 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_currentSpecifiers, "objectAtIndexedSubscript:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PSSpecifierUpdateOperation reloadOperationWithSpecifier:atIndex:](PSSpecifierUpdateOperation, "reloadOperationWithSpecifier:atIndex:", v5, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PSSpecifierUpdates _addAndApplyOperation:](self, "_addAndApplyOperation:", v6);
  }

  return v7;
}

- (BOOL)reloadSpecifierAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;

  v4 = a3;
  -[PSSpecifierUpdates _groupIndexCreatingIfNecessary](self, "_groupIndexCreatingIfNecessary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfSpecifierAtIndexPath:", v4);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (self->_wantsDebugCallbacks)
    {
      +[PSSpecifierUpdateOperation reloadOperationWithSpecifier:atIndex:](PSSpecifierUpdateOperation, "reloadOperationWithSpecifier:atIndex:", 0, 0x7FFFFFFFFFFFFFFFLL);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("attempted to reload specifier at missing or out-of-bounds indexPath %@"), v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%s failed: %@"), "-[PSSpecifierUpdates reloadSpecifierAtIndexPath:]", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSSpecifierUpdates _operationFailed:reason:](self, "_operationFailed:reason:", v7, v10);

    }
    v11 = 0;
  }
  else
  {
    v11 = -[PSSpecifierUpdates reloadSpecifierAtIndex:](self, "reloadSpecifierAtIndex:", v6);
  }

  return v11;
}

- (BOOL)reloadSpecifiersInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v6;
  unint64_t v7;
  NSUInteger i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSRange v15;

  length = a3.length;
  location = a3.location;
  v6 = a3.location + a3.length;
  v7 = -[NSMutableArray count](self->_currentSpecifiers, "count");
  if (v6 > v7)
  {
    if (self->_wantsDebugCallbacks)
    {
      +[PSSpecifierUpdateOperation reloadOperationWithSpecifier:atIndex:](PSSpecifierUpdateOperation, "reloadOperationWithSpecifier:atIndex:", 0, v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0CB3940];
      v15.location = location;
      v15.length = length;
      NSStringFromRange(v15);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("attempted to reload specifiers in out-of-bounds range %@"), v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("%s failed: %@"), "-[PSSpecifierUpdates reloadSpecifiersInRange:]", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSSpecifierUpdates _operationFailed:reason:](self, "_operationFailed:reason:", v9, v13);

    }
  }
  else
  {
    for (i = v6 - 1; i >= location; --i)
      -[PSSpecifierUpdates reloadSpecifierAtIndex:](self, "reloadSpecifierAtIndex:", i);
  }
  return v6 <= v7;
}

- (BOOL)moveSpecifierAtIndex:(unint64_t)a3 toIndex:(unint64_t)a4
{
  unint64_t v7;
  void *v8;
  void *v9;
  BOOL v10;
  unint64_t v11;
  BOOL result;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  if (-[NSMutableArray count](self->_currentSpecifiers, "count") > a3)
  {
    v7 = -[NSMutableArray count](self->_currentSpecifiers, "count");
    if (a3 != a4 && v7 > a4)
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_currentSpecifiers, "objectAtIndexedSubscript:", a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[PSSpecifierUpdateOperation moveOperationWithSpecifier:fromIndex:toIndex:](PSSpecifierUpdateOperation, "moveOperationWithSpecifier:fromIndex:toIndex:", v8, a3, a4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[PSSpecifierUpdates _addAndApplyOperation:](self, "_addAndApplyOperation:", v9);

LABEL_11:
      return v10;
    }
  }
  if (!self->_wantsDebugCallbacks)
    return 0;
  v11 = -[NSMutableArray count](self->_currentSpecifiers, "count");
  if (v11 <= a3)
  {
    v8 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_currentSpecifiers, "objectAtIndexedSubscript:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  +[PSSpecifierUpdateOperation moveOperationWithSpecifier:fromIndex:toIndex:](PSSpecifierUpdateOperation, "moveOperationWithSpecifier:fromIndex:toIndex:", v8, a3, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("attempted to move specifier from index %lu to index %lu, when one or more of these indexes are out of bounds"), a3, a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%s failed: %@"), "-[PSSpecifierUpdates moveSpecifierAtIndex:toIndex:]", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSSpecifierUpdates _operationFailed:reason:](self, "_operationFailed:reason:", v13, v16);

  v10 = 0;
  result = 0;
  if (v11 > a3)
    goto LABEL_11;
  return result;
}

- (BOOL)moveSpecifierAtIndexPath:(id)a3 toIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  BOOL v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v6 = a3;
  v7 = a4;
  -[PSSpecifierUpdates _groupIndexCreatingIfNecessary](self, "_groupIndexCreatingIfNecessary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "indexOfSpecifierAtIndexPath:", v6);

  -[PSSpecifierUpdates _groupIndexCreatingIfNecessary](self, "_groupIndexCreatingIfNecessary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "indexOfSpecifierAtIndexPath:", v7);

  if (v9 == 0x7FFFFFFFFFFFFFFFLL || v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (self->_wantsDebugCallbacks)
    {
      v13 = -[NSMutableArray count](self->_currentSpecifiers, "count");
      if (v9 >= v13)
      {
        v14 = 0;
      }
      else
      {
        -[NSMutableArray objectAtIndexedSubscript:](self->_currentSpecifiers, "objectAtIndexedSubscript:", v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      +[PSSpecifierUpdateOperation moveOperationWithSpecifier:fromIndex:toIndex:](PSSpecifierUpdateOperation, "moveOperationWithSpecifier:fromIndex:toIndex:", v14, v9, v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("attempted to move specifier from indexPath %@ to indexPath %@, when one or more of these indexPaths are missing or out of bounds"), v6, v7);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", CFSTR("%s failed: %@"), "-[PSSpecifierUpdates moveSpecifierAtIndexPath:toIndexPath:]", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSSpecifierUpdates _operationFailed:reason:](self, "_operationFailed:reason:", v15, v18);

      if (v9 < v13)
    }
    v12 = 0;
  }
  else
  {
    v12 = -[PSSpecifierUpdates moveSpecifierAtIndex:toIndex:](self, "moveSpecifierAtIndex:toIndex:", v9, v11 - (objc_msgSend(v6, "section") < objc_msgSend(v7, "section")));
  }

  return v12;
}

- (BOOL)moveSpecifier:(id)a3 toIndex:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;

  v6 = a3;
  if (v6)
  {
    v7 = -[NSMutableArray indexOfObject:](self->_currentSpecifiers, "indexOfObject:", v6);
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v12 = -[PSSpecifierUpdates moveSpecifierAtIndex:toIndex:](self, "moveSpecifierAtIndex:toIndex:", v7, a4);
      goto LABEL_7;
    }
    if (self->_wantsDebugCallbacks)
    {
      +[PSSpecifierUpdateOperation moveOperationWithSpecifier:fromIndex:toIndex:](PSSpecifierUpdateOperation, "moveOperationWithSpecifier:fromIndex:toIndex:", 0, 0x7FFFFFFFFFFFFFFFLL, a4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("attempted to move specifier from out-of-bounds index %lu"), 0x7FFFFFFFFFFFFFFFLL);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("%s failed: %@"), "-[PSSpecifierUpdates moveSpecifier:toIndex:]", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSSpecifierUpdates _operationFailed:reason:](self, "_operationFailed:reason:", v8, v11);

    }
  }
  v12 = 0;
LABEL_7:

  return v12;
}

- (BOOL)swapSpecifierAtIndex:(unint64_t)a3 withSpecifierAtIndex:(unint64_t)a4
{
  unint64_t v7;
  _BOOL4 v8;

  if (-[NSMutableArray count](self->_currentSpecifiers, "count") <= a3
    || -[NSMutableArray count](self->_currentSpecifiers, "count") <= a4)
  {
    LOBYTE(v8) = 0;
  }
  else
  {
    if (a3 >= a4)
      v7 = a4;
    else
      v7 = a3;
    if (a3 > a4)
      a4 = a3;
    v8 = -[PSSpecifierUpdates moveSpecifierAtIndex:toIndex:](self, "moveSpecifierAtIndex:toIndex:", v7, a4);
    if (v8)
      LOBYTE(v8) = v7 == a4 - 1
                || -[PSSpecifierUpdates moveSpecifierAtIndex:toIndex:](self, "moveSpecifierAtIndex:toIndex:");
  }
  return v8;
}

- (BOOL)swapSpecifier:(id)a3 withSpecifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL8 v14;
  _BOOL8 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    v10 = -[NSMutableArray indexOfObject:](self->_currentSpecifiers, "indexOfObject:", v6);
    v11 = -[NSMutableArray indexOfObject:](self->_currentSpecifiers, "indexOfObject:", v8);
    if (v10 == 0x7FFFFFFFFFFFFFFFLL || v11 == 0x7FFFFFFFFFFFFFFFLL || v10 == v11)
    {
      if (v10 != v11 && self->_wantsDebugCallbacks)
      {
        v14 = v11 != 0x7FFFFFFFFFFFFFFFLL;
        v15 = v10 != 0x7FFFFFFFFFFFFFFFLL;
        +[PSSpecifierUpdateOperation moveOperationWithSpecifier:fromIndex:toIndex:](PSSpecifierUpdateOperation, "moveOperationWithSpecifier:fromIndex:toIndex:", v6, v10, v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("attempted to swap specifier %@ (found: %d) with specifier %@ (found: %d), when one or more of these specifiers could not be found"), v6, v15, v8, v14);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringWithFormat:", CFSTR("%s failed: %@"), "-[PSSpecifierUpdates swapSpecifier:withSpecifier:]", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[PSSpecifierUpdates _operationFailed:reason:](self, "_operationFailed:reason:", v16, v19);

      }
      v9 = 0;
    }
    else
    {
      v9 = -[PSSpecifierUpdates swapSpecifierAtIndex:withSpecifierAtIndex:](self, "swapSpecifierAtIndex:withSpecifierAtIndex:", v10, v11);
    }
  }

  return v9;
}

+ (void)_assertSpecifierIDsAreUnique:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__PSSpecifierUpdates__assertSpecifierIDsAreUnique___block_invoke;
  v7[3] = &unk_1E4A66780;
  v8 = v4;
  v9 = v3;
  v5 = v3;
  v6 = v4;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

}

void __51__PSSpecifierUpdates__assertSpecifierIDsAreUnique___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v6))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("found specifier with duplicate ID %@ in specifiers %@"), v7, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);

}

+ (id)updatesByDiffingSpecifiers:(id)a3 withSpecifiers:(id)a4 changedBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  id v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  _QWORD v46[4];
  id v47;
  _QWORD v48[4];
  id v49;
  id v50;
  _QWORD v51[4];
  id v52;
  id v53;
  _QWORD v54[4];
  id v55;
  id v56;
  _QWORD v57[4];
  id v58;
  _QWORD v59[4];
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  _QWORD v66[4];
  id v67;
  id v68;
  id v69;
  _QWORD v70[3];

  v70[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = 0;
  if (v8 && v9)
  {
    v45 = v10;
    objc_msgSend((id)objc_opt_class(), "updatesWithSpecifiers:", v8);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_assertSpecifierIDsAreUnique:", v8);
    objc_msgSend(a1, "_assertSpecifierIDsAreUnique:", v9);
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x1E0C809B0];
    v66[0] = MEMORY[0x1E0C809B0];
    v66[1] = 3221225472;
    v66[2] = __77__PSSpecifierUpdates_updatesByDiffingSpecifiers_withSpecifiers_changedBlock___block_invoke;
    v66[3] = &unk_1E4A667A8;
    v18 = v8;
    v67 = v18;
    v19 = v14;
    v68 = v19;
    v20 = v13;
    v69 = v20;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v66);
    v59[0] = v17;
    v59[1] = 3221225472;
    v59[2] = __77__PSSpecifierUpdates_updatesByDiffingSpecifiers_withSpecifiers_changedBlock___block_invoke_2;
    v59[3] = &unk_1E4A667D0;
    v60 = v9;
    v61 = v12;
    v62 = v20;
    v65 = v45;
    v21 = v15;
    v63 = v21;
    v64 = v16;
    v40 = v16;
    v44 = v20;
    v43 = v12;
    objc_msgSend(v18, "enumerateObjectsUsingBlock:", v59);
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:selector:", 0, 1, sel_compare_);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v70[0] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = v17;
    v57[0] = v17;
    v57[1] = 3221225472;
    v57[2] = __77__PSSpecifierUpdates_updatesByDiffingSpecifiers_withSpecifiers_changedBlock___block_invoke_3;
    v57[3] = &unk_1E4A667F8;
    v25 = v41;
    v58 = v25;
    objc_msgSend(v43, "enumerateIndexesWithOptions:usingBlock:", 2, v57);
    objc_msgSend(v21, "allKeys");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "sortedArrayUsingDescriptors:", v23);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v54[0] = v17;
    v54[1] = 3221225472;
    v54[2] = __77__PSSpecifierUpdates_updatesByDiffingSpecifiers_withSpecifiers_changedBlock___block_invoke_4;
    v54[3] = &unk_1E4A66820;
    v55 = (id)objc_claimAutoreleasedReturnValue();
    v56 = v21;
    v42 = v21;
    v27 = v55;
    objc_msgSend(v39, "enumerateObjectsUsingBlock:", v54);
    objc_msgSend(v25, "currentSpecifiers");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v28, "mutableCopy");

    v51[0] = v24;
    v51[1] = 3221225472;
    v51[2] = __77__PSSpecifierUpdates_updatesByDiffingSpecifiers_withSpecifiers_changedBlock___block_invoke_5;
    v51[3] = &unk_1E4A66780;
    v52 = v29;
    v30 = v25;
    v53 = v30;
    v31 = v29;
    objc_msgSend(v27, "enumerateObjectsWithOptions:usingBlock:", 2, v51);
    objc_msgSend(v19, "allKeys");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "sortedArrayUsingDescriptors:", v23);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v48[0] = v24;
    v48[1] = 3221225472;
    v48[2] = __77__PSSpecifierUpdates_updatesByDiffingSpecifiers_withSpecifiers_changedBlock___block_invoke_7;
    v48[3] = &unk_1E4A66820;
    v49 = v19;
    v34 = v30;
    v50 = v34;
    v38 = v19;
    objc_msgSend(v33, "enumerateObjectsUsingBlock:", v48);
    v46[0] = v24;
    v46[1] = 3221225472;
    v46[2] = __77__PSSpecifierUpdates_updatesByDiffingSpecifiers_withSpecifiers_changedBlock___block_invoke_8;
    v46[3] = &unk_1E4A66848;
    v35 = v34;
    v47 = v35;
    objc_msgSend(v40, "enumerateObjectsUsingBlock:", v46);
    v36 = v47;
    v11 = v35;

    v10 = v45;
  }

  return v11;
}

void __77__PSSpecifierUpdates_updatesByDiffingSpecifiers_withSpecifiers_changedBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v11 = v5;
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "indexOfSpecifierWithID:", v7);

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, v10);

    objc_msgSend(*(id *)(a1 + 48), "addIndex:", a3);
  }

}

void __77__PSSpecifierUpdates_updatesByDiffingSpecifiers_withSpecifiers_changedBlock___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v19 = v5;
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "indexOfSpecifierWithID:", v7);

  v9 = *(void **)(a1 + 40);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v9, "addIndex:", a3);
    goto LABEL_13;
  }
  v10 = a3 - objc_msgSend(v9, "countOfIndexesInRange:", 0, a3);
  v11 = v8 - objc_msgSend(*(id *)(a1 + 48), "countOfIndexesInRange:", 0, v8);
  v12 = *(_QWORD *)(a1 + 72);
  if (v12)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = (*(uint64_t (**)(uint64_t, id, void *))(v12 + 16))(v12, v19, v13);

  }
  if (v11 != v10)
  {
    v15 = *(void **)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v19, v16);

    if ((v12 & 1) == 0)
      goto LABEL_13;
LABEL_12:
    v17 = *(void **)(a1 + 64);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v18);

    goto LABEL_13;
  }
  if (*(_QWORD *)(a1 + 72))
    v14 = v12;
  else
    v14 = 1;
  if (v14 == 1)
    goto LABEL_12;
LABEL_13:

}

uint64_t __77__PSSpecifierUpdates_updatesByDiffingSpecifiers_withSpecifiers_changedBlock___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeOneSpecifierOnlyAtIndex:", a2);
}

void __77__PSSpecifierUpdates_updatesByDiffingSpecifiers_withSpecifiers_changedBlock___block_invoke_4(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __77__PSSpecifierUpdates_updatesByDiffingSpecifiers_withSpecifiers_changedBlock___block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __77__PSSpecifierUpdates_updatesByDiffingSpecifiers_withSpecifiers_changedBlock___block_invoke_6;
  v11[3] = &unk_1E4A66730;
  v10 = v5;
  v12 = v10;
  v7 = objc_msgSend(v6, "indexOfObjectWithOptions:passingTest:", 2, v11);
  if (v7 != a3)
  {
    v8 = v7;
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "removeObjectAtIndex:", v8);
    objc_msgSend(*(id *)(a1 + 32), "insertObject:atIndex:", v9, a3);
    objc_msgSend(*(id *)(a1 + 40), "moveSpecifierAtIndex:toIndex:", v8, a3);

  }
}

uint64_t __77__PSSpecifierUpdates_updatesByDiffingSpecifiers_withSpecifiers_changedBlock___block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

void __77__PSSpecifierUpdates_updatesByDiffingSpecifiers_withSpecifiers_changedBlock___block_invoke_7(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(a1 + 40), "insertSpecifier:atIndex:", v3, objc_msgSend(v4, "unsignedIntegerValue"));

}

uint64_t __77__PSSpecifierUpdates_updatesByDiffingSpecifiers_withSpecifiers_changedBlock___block_invoke_8(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifierAtIndex:", objc_msgSend(a2, "unsignedIntegerValue"));
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)PSSpecifierUpdates;
  -[PSSpecifierUpdates description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %lu updates, context: %@, updates: %@"), v4, -[NSMutableArray count](self->_updates, "count"), self->_context, self->_updates);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)stepByStepDescription
{
  void *v3;
  void *v4;
  NSMutableArray *updates;
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;
  PSSpecifierUpdates *v13;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", self->_originalSpecifiers);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Initial specifiers: %@\n"), v4);
  updates = self->_updates;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __43__PSSpecifierUpdates_stepByStepDescription__block_invoke;
  v10[3] = &unk_1E4A66870;
  v11 = v4;
  v12 = v3;
  v13 = self;
  v6 = v3;
  v7 = v4;
  -[NSMutableArray enumerateObjectsUsingBlock:](updates, "enumerateObjectsUsingBlock:", v10);
  objc_msgSend(v6, "appendFormat:", CFSTR("Finished applying updates"));
  v8 = (void *)objc_msgSend(v6, "copy");

  return v8;
}

uint64_t __43__PSSpecifierUpdates_stepByStepDescription__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  id v6;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = a2;
  objc_msgSend(v6, "applyToArray:", v5);
  objc_msgSend(*(id *)(a1 + 40), "appendFormat:", CFSTR("Applied operation %lu of %lu %@\n"), a3 + 1, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 16), "count"), v6);

  return objc_msgSend(*(id *)(a1 + 40), "appendFormat:", CFSTR("Specifiers: %@\n"), *(_QWORD *)(a1 + 32));
}

- (id)specifiersAfterApplyingUpdatesToIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  NSMutableArray *updates;
  id v8;
  _QWORD v10[4];
  id v11;

  if (-[NSMutableArray count](self->_updates, "count") - 1 <= a3)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", self->_currentSpecifiers);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", self->_originalSpecifiers);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, a3 + 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    updates = self->_updates;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __60__PSSpecifierUpdates_specifiersAfterApplyingUpdatesToIndex___block_invoke;
    v10[3] = &unk_1E4A66668;
    v8 = v5;
    v11 = v8;
    -[NSMutableArray enumerateObjectsAtIndexes:options:usingBlock:](updates, "enumerateObjectsAtIndexes:options:usingBlock:", v6, 0, v10);

    return v8;
  }
}

uint64_t __60__PSSpecifierUpdates_specifiersAfterApplyingUpdatesToIndex___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "applyToArray:", *(_QWORD *)(a1 + 32));
}

- (NSArray)originalSpecifiers
{
  return self->_originalSpecifiers;
}

- (void)setContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_originalSpecifiers, 0);
  objc_storeStrong((id *)&self->_groupIndex, 0);
  objc_storeStrong((id *)&self->_updates, 0);
  objc_storeStrong((id *)&self->_currentSpecifiers, 0);
}

@end
