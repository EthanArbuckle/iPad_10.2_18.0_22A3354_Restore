@implementation PSSpecifierGroupIndex

+ (PSSpecifierGroupIndex)groupIndexWithSpecifiers:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSpecifiers:", v4);

  return (PSSpecifierGroupIndex *)v5;
}

- (PSSpecifierGroupIndex)init
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

- (id)_init
{
  PSSpecifierGroupIndex *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PSSpecifierGroupIndex;
  v2 = -[PSSpecifierGroupIndex init](&v4, sel_init);
  if (v2)
    v2->_wantsDebugCallbacks = objc_msgSend((id)objc_opt_class(), "_wantsDebuggingCallbacks");
  return v2;
}

- (PSSpecifierGroupIndex)initWithSpecifiers:(id)a3
{
  id v4;
  PSSpecifierGroupIndex *v5;
  uint64_t v6;
  NSMutableArray *specifiers;
  uint64_t v8;
  NSMutableArray *groupSections;
  uint64_t v10;
  NSMutableArray *groupSpecifiers;

  v4 = a3;
  v5 = -[PSSpecifierGroupIndex _init](self, "_init");
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v4);
    specifiers = v5->_specifiers;
    v5->_specifiers = (NSMutableArray *)v6;

    v8 = objc_opt_new();
    groupSections = v5->_groupSections;
    v5->_groupSections = (NSMutableArray *)v8;

    v10 = objc_opt_new();
    groupSpecifiers = v5->_groupSpecifiers;
    v5->_groupSpecifiers = (NSMutableArray *)v10;

    -[PSSpecifierGroupIndex _createGroupIndex](v5, "_createGroupIndex");
  }

  return v5;
}

- (id)_initForCopyWithGroupIndex:(id)a3
{
  id *v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v4 = (id *)a3;
  v5 = -[PSSpecifierGroupIndex _init](self, "_init");
  if (v5)
  {
    v6 = objc_msgSend(v4[1], "mutableCopy");
    v7 = (void *)v5[1];
    v5[1] = v6;

    v8 = objc_msgSend(v4[2], "mutableCopy");
    v9 = (void *)v5[2];
    v5[2] = v8;

    v10 = objc_msgSend(v4[3], "mutableCopy");
    v11 = (void *)v5[3];
    v5[3] = v10;

    v12 = objc_msgSend(v4[4], "mutableCopy");
    v13 = (void *)v5[4];
    v5[4] = v12;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "_initForCopyWithGroupIndex:", self);
}

- (void)_createGroupIndex
{
  NSMutableArray *specifiers;
  _QWORD v4[7];
  _QWORD v5[4];
  _QWORD v6[5];
  id v7;

  -[NSMutableArray removeAllObjects](self->_groupSections, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_groupSpecifiers, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_ungroupedPrefixSpecifiers, "removeAllObjects");
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3032000000;
  v6[3] = __Block_byref_object_copy__10;
  v6[4] = __Block_byref_object_dispose__10;
  v7 = 0;
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x2020000000;
  v5[3] = 0;
  specifiers = self->_specifiers;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__PSSpecifierGroupIndex__createGroupIndex__block_invoke;
  v4[3] = &unk_1E4A68288;
  v4[4] = self;
  v4[5] = v6;
  v4[6] = v5;
  -[NSMutableArray enumerateObjectsUsingBlock:](specifiers, "enumerateObjectsUsingBlock:", v4);
  _Block_object_dispose(v5, 8);
  _Block_object_dispose(v6, 8);

}

void __42__PSSpecifierGroupIndex__createGroupIndex__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v3 = objc_msgSend(v10, "cellType");
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v4)
    v5 = 1;
  else
    v5 = v3 == 0;
  if (v5)
  {
    if (!v3)
    {
      if (v4)
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
      v4 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    }
    objc_msgSend(v4, "addObject:", v10);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_ungroupedPrefixSpecifiers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v10);

  }
}

- (id)_ungroupedPrefixSpecifiers
{
  NSMutableArray *ungroupedPrefixSpecifiers;
  NSMutableArray *v4;
  NSMutableArray *v5;

  ungroupedPrefixSpecifiers = self->_ungroupedPrefixSpecifiers;
  if (!ungroupedPrefixSpecifiers)
  {
    v4 = (NSMutableArray *)objc_opt_new();
    v5 = self->_ungroupedPrefixSpecifiers;
    self->_ungroupedPrefixSpecifiers = v4;

    ungroupedPrefixSpecifiers = self->_ungroupedPrefixSpecifiers;
  }
  return ungroupedPrefixSpecifiers;
}

- (void)reloadWithSpecifiers:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *specifiers;

  if (self->_specifiers != a3)
  {
    v4 = (NSMutableArray *)objc_msgSend(a3, "mutableCopy");
    specifiers = self->_specifiers;
    self->_specifiers = v4;

    -[PSSpecifierGroupIndex _createGroupIndex](self, "_createGroupIndex");
  }
}

- (void)performSpecifierUpdates:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[5];
  id v15;

  v4 = a3;
  v5 = -[NSMutableArray count](self->_specifiers, "count");
  objc_msgSend(v4, "originalSpecifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v5 != v7)
  {
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = *MEMORY[0x1E0C99768];
    objc_msgSend(v4, "originalSpecifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "raise:format:", v9, CFSTR("Attempting to apply specifier updates (%@) when the original specifier array of these updates (count: %lu) does not match the specifier array of %@ (count: %lu)."), v4, objc_msgSend(v10, "count"), self, -[NSMutableArray count](self->_specifiers, "count"));

  }
  objc_msgSend(v4, "updates");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "indexOfObjectPassingTest:", &__block_literal_global_30);

  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __49__PSSpecifierGroupIndex_performSpecifierUpdates___block_invoke_2;
    v14[3] = &unk_1E4A682D0;
    v14[4] = self;
    v15 = v4;
    objc_msgSend(v15, "enumerateUpdatesUsingBlock:", v14);

  }
  else
  {
    objc_msgSend(v4, "currentSpecifiers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSpecifierGroupIndex reloadWithSpecifiers:](self, "reloadWithSpecifiers:", v13);

  }
}

BOOL __49__PSSpecifierGroupIndex_performSpecifierUpdates___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "specifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "cellType") == 0;

  return v3;
}

uint64_t __49__PSSpecifierGroupIndex_performSpecifierUpdates___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "performUpdateOperation:forSpecifierUpdates:", a2, *(_QWORD *)(a1 + 40));
}

- (void)performUpdateOperation:(id)a3
{
  -[PSSpecifierGroupIndex performUpdateOperation:forSpecifierUpdates:](self, "performUpdateOperation:forSpecifierUpdates:", a3, 0);
}

- (void)performUpdateOperation:(id)a3 forSpecifierUpdates:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;

  v6 = a3;
  v7 = a4;
  if (self->_wantsDebugCallbacks)
    -[PSSpecifierGroupIndex _willPerformOperation:forSpecifierUpdates:](self, "_willPerformOperation:forSpecifierUpdates:", v6, v7);
  objc_msgSend(v6, "specifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "index");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedIntegerValue");

  v11 = objc_msgSend(v8, "cellType");
  v12 = objc_msgSend(v6, "applyToArray:", self->_specifiers);
  if (!v11)
  {
    -[PSSpecifierGroupIndex _createGroupIndex](self, "_createGroupIndex");
    goto LABEL_22;
  }
  if ((v12 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Group index %@ failed to apply update %@ to specifiers %@.\nThis should not be happening and is almost certainly due to the caller providing an inconsistent set of specifier updates."), self, v6, self->_specifiers);
    goto LABEL_22;
  }
  v13 = objc_msgSend(v6, "operation");
  switch(v13)
  {
    case 4:
      if (v10 < -[NSMutableArray count](self->_ungroupedPrefixSpecifiers, "count"))
      {
        -[NSMutableArray removeObjectAtIndex:](self->_ungroupedPrefixSpecifiers, "removeObjectAtIndex:", v10);
        break;
      }
      v18 = 0x7FFFFFFFFFFFFFFFLL;
      v19 = 0x7FFFFFFFFFFFFFFFLL;
      -[PSSpecifierGroupIndex getGroup:row:ofSpecifierAtIndex:](self, "getGroup:row:ofSpecifierAtIndex:", &v19, &v18, v10);
      -[NSMutableArray objectAtIndexedSubscript:](self->_groupSections, "objectAtIndexedSubscript:", v19);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "removeObjectAtIndex:", v18);
LABEL_21:

      break;
    case 2:
      if (v10 >= -[NSMutableArray count](self->_ungroupedPrefixSpecifiers, "count"))
      {
        v18 = 0x7FFFFFFFFFFFFFFFLL;
        v19 = 0x7FFFFFFFFFFFFFFFLL;
        -[PSSpecifierGroupIndex _getSection:row:forSpecifierAtIndex:forInsertion:](self, "_getSection:row:forSpecifierAtIndex:forInsertion:", &v19, &v18, v10, 0);
        -[NSMutableArray objectAtIndexedSubscript:](self->_groupSections, "objectAtIndexedSubscript:", v19);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "removeObjectAtIndex:", v18);

      }
      else
      {
        -[NSMutableArray removeObjectAtIndex:](self->_ungroupedPrefixSpecifiers, "removeObjectAtIndex:", v10);
      }
      objc_msgSend(v6, "toIndex");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v15, "unsignedIntegerValue");

      goto LABEL_17;
    case 1:
LABEL_17:
      if (v10 <= -[NSMutableArray count](self->_ungroupedPrefixSpecifiers, "count"))
      {
        -[PSSpecifierGroupIndex _ungroupedPrefixSpecifiers](self, "_ungroupedPrefixSpecifiers");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "insertObject:atIndex:", v8, v10);

        break;
      }
      v18 = 0x7FFFFFFFFFFFFFFFLL;
      v19 = 0x7FFFFFFFFFFFFFFFLL;
      -[PSSpecifierGroupIndex _getSection:row:forSpecifierAtIndex:forInsertion:](self, "_getSection:row:forSpecifierAtIndex:forInsertion:", &v19, &v18, v10, 1);
      -[NSMutableArray objectAtIndexedSubscript:](self->_groupSections, "objectAtIndexedSubscript:", v19);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "insertObject:atIndex:", v8, v18);
      goto LABEL_21;
  }
LABEL_22:
  if (self->_wantsDebugCallbacks)
    -[PSSpecifierGroupIndex _didPerformOperation:forSpecifierUpdates:](self, "_didPerformOperation:forSpecifierUpdates:", v6, v7);

}

- (void)performSpecifierUpdatesUsingBlock:(id)a3
{
  NSMutableArray *specifiers;
  void (**v5)(id, id);
  id v6;

  if (a3)
  {
    specifiers = self->_specifiers;
    v5 = (void (**)(id, id))a3;
    +[PSSpecifierUpdates updatesWithSpecifiers:](PSSpecifierUpdates, "updatesWithSpecifiers:", specifiers);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v6);

    -[PSSpecifierGroupIndex performSpecifierUpdates:](self, "performSpecifierUpdates:", v6);
  }
}

- (unint64_t)numberOfGroups
{
  return -[NSMutableArray count](self->_groupSections, "count");
}

- (unint64_t)numberOfRowsInGroupAtIndex:(unint64_t)a3
{
  void *v5;
  unint64_t v6;

  if (-[NSMutableArray count](self->_groupSections, "count") <= a3)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99858], CFSTR("group index %lu is out of bounds (number of groups: %lu)"), a3, -[PSSpecifierGroupIndex numberOfGroups](self, "numberOfGroups"));
    return 0;
  }
  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_groupSections, "objectAtIndexedSubscript:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    return v6;
  }
}

- (void)_manuallyFindSection:(unint64_t *)a3 row:(unint64_t *)a4 forSpecifierAtIndex:(unint64_t)a5
{
  void *v9;
  NSMutableArray *specifiers;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  if (-[NSMutableArray count](self->_specifiers, "count") <= a5)
  {
    if (a4)
      *a4 = 0x7FFFFFFFFFFFFFFFLL;
    if (a3)
      *a3 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0x7FFFFFFFFFFFFFFFLL;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, a5 + 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  specifiers = self->_specifiers;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __70__PSSpecifierGroupIndex__manuallyFindSection_row_forSpecifierAtIndex___block_invoke;
  v14[3] = &unk_1E4A682F8;
  v14[4] = &v19;
  v14[5] = &v15;
  -[NSMutableArray enumerateObjectsAtIndexes:options:usingBlock:](specifiers, "enumerateObjectsAtIndexes:options:usingBlock:", v9, 0, v14);
  if (a3)
    *a3 = v20[3];
  if (a4)
  {
    v11 = v16[3];
    v12 = 0x7FFFFFFFFFFFFFFFLL;
    if (v11 != a5)
    {
      v13 = ~v11 + a5;
      if (v20[3] != 0x7FFFFFFFFFFFFFFFLL)
        v12 = v13;
    }
    *a4 = v12;
  }

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
}

uint64_t __70__PSSpecifierGroupIndex__manuallyFindSection_row_forSpecifierAtIndex___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = objc_msgSend(a2, "cellType");
  if (!result)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(_QWORD *)(v6 + 24);
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
      v8 = 0;
    else
      v8 = v7 + 1;
    *(_QWORD *)(v6 + 24) = v8;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
  }
  return result;
}

- (void)_getSection:(unint64_t *)a3 row:(unint64_t *)a4 forSpecifierAtIndex:(unint64_t)a5 forInsertion:(BOOL)a6
{
  -[PSSpecifierGroupIndex _getSection:row:forSpecifierAtIndex:forInsertion:allowGroupSpecifiers:](self, "_getSection:row:forSpecifierAtIndex:forInsertion:allowGroupSpecifiers:", a3, a4, a5, a6, 0);
}

- (void)_getSection:(unint64_t *)a3 row:(unint64_t *)a4 forSpecifierAtIndex:(unint64_t)a5 forInsertion:(BOOL)a6 allowGroupSpecifiers:(BOOL)a7
{
  _BOOL4 v8;
  NSMutableArray *groupSections;
  _QWORD v14[11];
  BOOL v15;
  _QWORD v16[3];
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v8 = a6;
  if (-[NSMutableArray count](self->_specifiers, "count") + (unint64_t)a6 <= a5)
  {
    if (a4)
      *a4 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    if (-[NSMutableArray count](self->_ungroupedPrefixSpecifiers, "count") <= a5)
      goto LABEL_9;
    if (a4)
      *a4 = a5;
  }
  if (a3)
    *a3 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_9:
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v17 = 0;
  v17 = -[NSMutableArray count](self->_ungroupedPrefixSpecifiers, "count");
  groupSections = self->_groupSections;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __95__PSSpecifierGroupIndex__getSection_row_forSpecifierAtIndex_forInsertion_allowGroupSpecifiers___block_invoke;
  v14[3] = &unk_1E4A68320;
  v15 = a7;
  v14[4] = self;
  v14[5] = v16;
  v14[8] = v8;
  v14[9] = a3;
  v14[10] = a4;
  v14[6] = &v18;
  v14[7] = a5;
  -[NSMutableArray enumerateObjectsUsingBlock:](groupSections, "enumerateObjectsUsingBlock:", v14);
  if (!*((_BYTE *)v19 + 24))
  {
    if (a3)
      *a3 = 0x7FFFFFFFFFFFFFFFLL;
    if (a4)
      *a4 = 0x7FFFFFFFFFFFFFFFLL;
  }
  _Block_object_dispose(v16, 8);
  _Block_object_dispose(&v18, 8);
}

uint64_t __95__PSSpecifierGroupIndex__getSection_row_forSpecifierAtIndex_forInsertion_allowGroupSpecifiers___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  unint64_t *v12;

  ++*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  result = objc_msgSend(a2, "count");
  v8 = *(_QWORD *)(a1[5] + 8);
  v9 = *(_QWORD *)(v8 + 24);
  v10 = a1[7] - v9;
  if (v10 >= a1[8] + result)
  {
    *(_QWORD *)(v8 + 24) = v9 + result;
  }
  else
  {
    v11 = (_QWORD *)a1[9];
    if (v11)
      *v11 = a3;
    v12 = (unint64_t *)a1[10];
    if (v12)
    {
      if (v10 >= 0x7FFFFFFFFFFFFFFFLL)
        v10 = 0x7FFFFFFFFFFFFFFFLL;
      *v12 = v10;
    }
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (unint64_t)_indexOfSpecifierInSection:(unint64_t)a3 row:(unint64_t)a4 forInsertion:(BOOL)a5
{
  NSMutableArray *groupSections;
  unint64_t v9;
  _QWORD v11[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v15 = -[NSMutableArray count](self->_ungroupedPrefixSpecifiers, "count", a3, a4, a5);
  groupSections = self->_groupSections;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __69__PSSpecifierGroupIndex__indexOfSpecifierInSection_row_forInsertion___block_invoke;
  v11[3] = &unk_1E4A68348;
  v11[4] = &v12;
  v11[5] = a3;
  v11[6] = a4;
  -[NSMutableArray enumerateObjectsUsingBlock:](groupSections, "enumerateObjectsUsingBlock:", v11);
  v9 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v9;
}

uint64_t __69__PSSpecifierGroupIndex__indexOfSpecifierInSection_row_forInsertion___block_invoke(uint64_t result, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v4;

  v4 = result;
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  if (*(_QWORD *)(result + 40) == a3)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += *(_QWORD *)(result + 48);
    *a4 = 1;
  }
  else
  {
    result = objc_msgSend(a2, "count");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v4 + 32) + 8) + 24) += result;
  }
  return result;
}

- (unint64_t)indexOfSpecifierAtIndexPath:(id)a3
{
  return -[PSSpecifierGroupIndex indexOfSpecifierAtIndexPath:forInsertion:](self, "indexOfSpecifierAtIndexPath:forInsertion:", a3, 0);
}

- (unint64_t)indexOfSpecifierAtIndexPath:(id)a3 forInsertion:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  v4 = a4;
  v6 = a3;
  v7 = objc_msgSend(v6, "section");
  if (v6 && (v8 = v7, v7 < -[NSMutableArray count](self->_groupSections, "count")))
    v9 = -[PSSpecifierGroupIndex _indexOfSpecifierInSection:row:forInsertion:](self, "_indexOfSpecifierInSection:row:forInsertion:", v8, objc_msgSend(v6, "row"), v4);
  else
    v9 = 0x7FFFFFFFFFFFFFFFLL;

  return v9;
}

- (id)indexPathForSpecifierAtIndex:(unint64_t)a3
{
  return -[PSSpecifierGroupIndex indexPathForSpecifierAtIndex:forInsertion:](self, "indexPathForSpecifierAtIndex:forInsertion:", a3, 0);
}

- (id)indexPathForSpecifierAtIndex:(unint64_t)a3 forInsertion:(BOOL)a4
{
  uint64_t v6;
  uint64_t v7;

  v6 = 0x7FFFFFFFFFFFFFFFLL;
  v7 = 0x7FFFFFFFFFFFFFFFLL;
  -[PSSpecifierGroupIndex _getSection:row:forSpecifierAtIndex:forInsertion:](self, "_getSection:row:forSpecifierAtIndex:forInsertion:", &v7, &v6, a3, a4);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL || v6 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)specifierAtIndexPath:(id)a3
{
  unint64_t v4;
  void *v5;

  v4 = -[PSSpecifierGroupIndex indexOfSpecifierAtIndexPath:](self, "indexOfSpecifierAtIndexPath:", a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_specifiers, "objectAtIndexedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)indexPathForSpecifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (objc_msgSend(v4, "cellType"))
  {
    -[PSSpecifierGroupIndex indexPathForSpecifierAtIndex:](self, "indexPathForSpecifierAtIndex:", -[NSMutableArray indexOfObject:](self->_specifiers, "indexOfObject:", v4));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)indexPathForSpecifierWithID:(id)a3
{
  return -[PSSpecifierGroupIndex indexPathForSpecifierAtIndex:](self, "indexPathForSpecifierAtIndex:", -[NSMutableArray indexOfSpecifierWithID:](self->_specifiers, "indexOfSpecifierWithID:", a3));
}

- (BOOL)getGroup:(unint64_t *)a3 row:(unint64_t *)a4 ofSpecifierAtIndex:(unint64_t)a5
{
  unint64_t v6;
  unint64_t v8;

  v8 = 0x7FFFFFFFFFFFFFFFLL;
  -[PSSpecifierGroupIndex _getSection:row:forSpecifierAtIndex:forInsertion:](self, "_getSection:row:forSpecifierAtIndex:forInsertion:", &v8, a4, a5, 0);
  v6 = v8;
  if (a3)
    *a3 = v8;
  return v6 != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)getGroup:(unint64_t *)a3 row:(unint64_t *)a4 ofSpecifier:(id)a5
{
  return -[PSSpecifierGroupIndex getGroup:row:ofSpecifierAtIndex:](self, "getGroup:row:ofSpecifierAtIndex:", a3, a4, -[NSMutableArray indexOfObject:](self->_specifiers, "indexOfObject:", a5));
}

- (BOOL)getGroup:(unint64_t *)a3 row:(unint64_t *)a4 ofSpecifierWithID:(id)a5
{
  return -[PSSpecifierGroupIndex getGroup:row:ofSpecifierAtIndex:](self, "getGroup:row:ofSpecifierAtIndex:", a3, a4, -[NSMutableArray indexOfSpecifierWithID:](self->_specifiers, "indexOfSpecifierWithID:", a5));
}

- (_NSRange)rangeOfSpecifiersInGroupAtGroupIndex:(unint64_t)a3
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  NSUInteger v10;
  NSUInteger v11;
  _NSRange result;

  v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (-[NSMutableArray count](self->_groupSections, "count") <= a3
    || (v6 = -[PSSpecifierGroupIndex _indexOfSpecifierInSection:row:forInsertion:](self, "_indexOfSpecifierInSection:row:forInsertion:", a3, 0, 0), v6 == 0x7FFFFFFFFFFFFFFFLL))
  {
    v7 = 0;
  }
  else
  {
    v8 = v6;
    -[NSMutableArray objectAtIndexedSubscript:](self->_groupSections, "objectAtIndexedSubscript:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v9, "count");

    v5 = v8;
  }
  v10 = v5;
  v11 = v7;
  result.length = v11;
  result.location = v10;
  return result;
}

- (_NSRange)rangeOfSpecifiersInGroup:(id)a3
{
  NSUInteger v3;
  NSUInteger v4;
  _NSRange result;

  v3 = -[PSSpecifierGroupIndex rangeOfSpecifiersInGroupAtGroupIndex:](self, "rangeOfSpecifiersInGroupAtGroupIndex:", -[NSMutableArray indexOfObject:](self->_groupSpecifiers, "indexOfObject:", a3));
  result.length = v4;
  result.location = v3;
  return result;
}

- (_NSRange)rangeOfSpecifiersInGroupWithID:(id)a3
{
  NSUInteger v3;
  NSUInteger v4;
  _NSRange result;

  v3 = -[PSSpecifierGroupIndex rangeOfSpecifiersInGroupAtGroupIndex:](self, "rangeOfSpecifiersInGroupAtGroupIndex:", -[NSMutableArray indexOfSpecifierWithID:](self->_groupSpecifiers, "indexOfSpecifierWithID:", a3));
  result.length = v4;
  result.location = v3;
  return result;
}

- (id)specifiersInGroupAtGroupIndex:(unint64_t)a3
{
  void *v5;

  if (-[NSMutableArray count](self->_groupSections, "count") <= a3)
  {
    v5 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_groupSections, "objectAtIndexedSubscript:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)specifiersInGroup:(id)a3
{
  return -[PSSpecifierGroupIndex specifiersInGroupAtGroupIndex:](self, "specifiersInGroupAtGroupIndex:", -[NSMutableArray indexOfObject:](self->_groupSpecifiers, "indexOfObject:", a3));
}

- (id)specifiersInGroupWithID:(id)a3
{
  return -[PSSpecifierGroupIndex specifiersInGroupAtGroupIndex:](self, "specifiersInGroupAtGroupIndex:", -[NSMutableArray indexOfSpecifierWithID:](self->_groupSpecifiers, "indexOfSpecifierWithID:", a3));
}

- (NSArray)groupSpecifiers
{
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", self->_groupSpecifiers);
}

- (unint64_t)groupIndexOfGroup:(id)a3
{
  return -[NSMutableArray indexOfObject:](self->_groupSpecifiers, "indexOfObject:", a3);
}

- (unint64_t)groupIndexOfGroupWithID:(id)a3
{
  return -[NSMutableArray indexOfSpecifierWithID:](self->_groupSpecifiers, "indexOfSpecifierWithID:", a3);
}

- (unint64_t)indexOfGroupAtGroupIndex:(unint64_t)a3
{
  unint64_t v5;
  unint64_t v6;

  v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (-[NSMutableArray count](self->_groupSpecifiers, "count") > a3)
  {
    v6 = -[PSSpecifierGroupIndex _indexOfSpecifierInSection:row:forInsertion:](self, "_indexOfSpecifierInSection:row:forInsertion:", a3, 0, 0);
    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
      return 0x7FFFFFFFFFFFFFFFLL;
    else
      return v6 - 1;
  }
  return v5;
}

- (unint64_t)indexOfGroup:(id)a3
{
  return -[PSSpecifierGroupIndex indexOfGroupAtGroupIndex:](self, "indexOfGroupAtGroupIndex:", -[NSMutableArray indexOfObject:](self->_groupSpecifiers, "indexOfObject:", a3));
}

- (unint64_t)indexOfGroupWithID:(id)a3
{
  return -[PSSpecifierGroupIndex indexOfGroupAtGroupIndex:](self, "indexOfGroupAtGroupIndex:", -[NSMutableArray indexOfSpecifierWithID:](self->_groupSpecifiers, "indexOfSpecifierWithID:", a3));
}

- (id)_groupSections
{
  return self->_groupSections;
}

- (id)_synthesizedSpecifiersFromGroupIndex
{
  void *v3;
  NSMutableArray *groupSections;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  PSSpecifierGroupIndex *v10;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSMutableArray count](self->_specifiers, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", self->_ungroupedPrefixSpecifiers);
  groupSections = self->_groupSections;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__PSSpecifierGroupIndex__synthesizedSpecifiersFromGroupIndex__block_invoke;
  v8[3] = &unk_1E4A68370;
  v5 = v3;
  v9 = v5;
  v10 = self;
  -[NSMutableArray enumerateObjectsUsingBlock:](groupSections, "enumerateObjectsUsingBlock:", v8);
  v6 = v5;

  return v6;
}

void __61__PSSpecifierGroupIndex__synthesizedSpecifiersFromGroupIndex__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
  v8 = a2;
  objc_msgSend(v6, "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v7);

  objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v8);
}

+ (BOOL)_wantsDebuggingCallbacks
{
  return 0;
}

- (id)_tabStringOfDepth:(unint64_t)a3
{
  void *i;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:");
  for (i = (void *)objc_claimAutoreleasedReturnValue(); a3; --a3)
    objc_msgSend(i, "appendString:", CFSTR("\t"));
  v5 = (void *)objc_msgSend(i, "copy");

  return v5;
}

- (void)_appendDescriptionOfArray:(id)a3 toString:(id)a4 withTabLevel:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  -[PSSpecifierGroupIndex _tabStringOfDepth:](self, "_tabStringOfDepth:", a5 - 1);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringByAppendingString:", CFSTR("\t"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendString:", CFSTR("{\n"));
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __73__PSSpecifierGroupIndex__appendDescriptionOfArray_toString_withTabLevel___block_invoke;
  v15[3] = &unk_1E4A67AB0;
  v16 = v9;
  v17 = v10;
  v18 = v8;
  v11 = v8;
  v12 = v10;
  v13 = v9;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v15);
  objc_msgSend(v13, "appendFormat:", CFSTR("%@}"), v14);

}

void __73__PSSpecifierGroupIndex__appendDescriptionOfArray_toString_withTabLevel___block_invoke(_QWORD *a1, void *a2, unint64_t a3)
{
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  id v8;

  v4 = (void *)a1[4];
  v5 = a1[5];
  v6 = (void *)a1[6];
  v8 = a2;
  if (objc_msgSend(v6, "count") - 1 <= a3)
    v7 = &stru_1E4A69238;
  else
    v7 = CFSTR(",");
  objc_msgSend(v4, "appendFormat:", CFSTR("%@%@%@\n"), v5, v8, v7);

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  const __CFString *v7;
  NSMutableArray *groupSections;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  PSSpecifierGroupIndex *v14;
  objc_super v15;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v15.receiver = self;
  v15.super_class = (Class)PSSpecifierGroupIndex;
  -[PSSpecifierGroupIndex description](&v15, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%lu groups, %lu specifiers)"), v4, -[NSMutableArray count](self->_groupSections, "count"), -[NSMutableArray count](self->_specifiers, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[NSMutableArray count](self->_groupSections, "count")
    || -[NSMutableArray count](self->_ungroupedPrefixSpecifiers, "count"))
  {
    objc_msgSend(v5, "appendString:", CFSTR(": {\n"));
    if (-[NSMutableArray count](self->_ungroupedPrefixSpecifiers, "count"))
    {
      objc_msgSend(v5, "appendFormat:", CFSTR("\t(no group): "));
      -[PSSpecifierGroupIndex _appendDescriptionOfArray:toString:withTabLevel:](self, "_appendDescriptionOfArray:toString:withTabLevel:", self->_ungroupedPrefixSpecifiers, v5, 2);
      v6 = -[NSMutableArray count](self->_groupSections, "count");
      v7 = CFSTR(",");
      if (!v6)
        v7 = &stru_1E4A69238;
      objc_msgSend(v5, "appendFormat:", CFSTR("%@\n"), v7);
    }
    groupSections = self->_groupSections;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __36__PSSpecifierGroupIndex_description__block_invoke;
    v12[3] = &unk_1E4A68370;
    v9 = v5;
    v13 = v9;
    v14 = self;
    -[NSMutableArray enumerateObjectsUsingBlock:](groupSections, "enumerateObjectsUsingBlock:", v12);
    objc_msgSend(v9, "appendString:", CFSTR("}"));

  }
  v10 = (void *)objc_msgSend(v5, "copy");

  return v10;
}

uint64_t __36__PSSpecifierGroupIndex_description__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  const __CFString *v10;

  v5 = *(void **)(a1 + 32);
  v6 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
  v7 = a2;
  objc_msgSend(v6, "objectAtIndexedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\t%@: "), v8);

  objc_msgSend(*(id *)(a1 + 40), "_appendDescriptionOfArray:toString:withTabLevel:", v7, *(_QWORD *)(a1 + 32), 2);
  v9 = *(void **)(a1 + 32);
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "count") - 1 <= a3)
    v10 = &stru_1E4A69238;
  else
    v10 = CFSTR(",");
  return objc_msgSend(v9, "appendFormat:", CFSTR("%@\n"), v10);
}

- (NSArray)specifiers
{
  return &self->_specifiers->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ungroupedPrefixSpecifiers, 0);
  objc_storeStrong((id *)&self->_groupSpecifiers, 0);
  objc_storeStrong((id *)&self->_groupSections, 0);
  objc_storeStrong((id *)&self->_specifiers, 0);
}

@end
