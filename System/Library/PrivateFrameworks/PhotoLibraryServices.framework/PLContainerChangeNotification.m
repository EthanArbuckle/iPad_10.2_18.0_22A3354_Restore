@implementation PLContainerChangeNotification

- (PLContainerChangeNotification)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLContainerChangeNotification;
  return -[PLContainerChangeNotification init](&v3, sel_init);
}

- (void)dealloc
{
  __CFArray *movedFromIndexes;
  objc_super v4;

  movedFromIndexes = self->_movedFromIndexes;
  if (movedFromIndexes)
    CFRelease(movedFromIndexes);
  v4.receiver = self;
  v4.super_class = (Class)PLContainerChangeNotification;
  -[PLContainerChangeNotification dealloc](&v4, sel_dealloc);
}

- (id)object
{
  return self->_object;
}

- (id)name
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLContainerChangeNotification.m"), 67, CFSTR("Abstract class"));

  return 0;
}

- (BOOL)shouldReload
{
  -[PLContainerChangeNotification _calculateDiffsIfNecessary](self, "_calculateDiffsIfNecessary");
  return self->_shouldReload;
}

- (NSIndexSet)deletedIndexes
{
  -[PLContainerChangeNotification _calculateDiffsIfNecessary](self, "_calculateDiffsIfNecessary");
  return self->_deletedIndexes;
}

- (NSIndexSet)insertedIndexes
{
  -[PLContainerChangeNotification _calculateDiffsIfNecessary](self, "_calculateDiffsIfNecessary");
  return self->_insertedIndexes;
}

- (void)enumerateMovesWithBlock:(id)a3
{
  id v4;
  NSIndexSet *movedIndexes;
  _QWORD v6[5];
  id v7;
  _QWORD *v8;
  _QWORD v9[4];

  v4 = a3;
  -[PLContainerChangeNotification _calculateDiffsIfNecessary](self, "_calculateDiffsIfNecessary");
  movedIndexes = self->_movedIndexes;
  if (movedIndexes)
  {
    if (self->_movedFromIndexes)
    {
      -[NSIndexSet count](self->_movedIndexes, "count");
      CFArrayGetCount(self->_movedFromIndexes);
      movedIndexes = self->_movedIndexes;
    }
    v9[0] = 0;
    v9[1] = v9;
    v9[2] = 0x2020000000;
    v9[3] = 0;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __57__PLContainerChangeNotification_enumerateMovesWithBlock___block_invoke;
    v6[3] = &unk_1E366A308;
    v6[4] = self;
    v8 = v9;
    v7 = v4;
    -[NSIndexSet enumerateIndexesUsingBlock:](movedIndexes, "enumerateIndexesUsingBlock:", v6);

    _Block_object_dispose(v9, 8);
  }

}

- (BOOL)hasMoves
{
  NSIndexSet *movedIndexes;

  movedIndexes = self->_movedIndexes;
  if (movedIndexes)
    LOBYTE(movedIndexes) = -[NSIndexSet count](movedIndexes, "count") != 0;
  return (char)movedIndexes;
}

- (NSIndexSet)changedIndexes
{
  -[PLContainerChangeNotification _calculateDiffsIfNecessary](self, "_calculateDiffsIfNecessary");
  return self->_changedIndexes;
}

- (NSIndexSet)changedIndexesRelativeToSnapshot
{
  _BOOL4 v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  id v19;
  id v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[PLContainerChangeNotification _calculateDiffsIfNecessary](self, "_calculateDiffsIfNecessary");
  v19 = 0;
  v20 = 0;
  v3 = -[PLContainerChangeNotification _getOldSet:newSet:](self, "_getOldSet:newSet:", &v20, &v19);
  v4 = v20;
  v5 = v19;
  v6 = v5;
  v7 = 0;
  if (v3)
  {
    objc_msgSend(v5, "objectsAtIndexes:", self->_changedIndexes);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 0u;
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v9 = v8;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v16;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v16 != v12)
              objc_enumerationMutation(v9);
            objc_msgSend(v7, "addIndex:", objc_msgSend(v4, "indexOfObject:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), (_QWORD)v15));
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
        }
        while (v11);
      }

    }
    else
    {
      v7 = 0;
    }

  }
  return (NSIndexSet *)v7;
}

- (BOOL)countDidChange
{
  -[PLContainerChangeNotification _calculateDiffsIfNecessary](self, "_calculateDiffsIfNecessary");
  return self->_countDidChange;
}

- (NSArray)deletedObjects
{
  _BOOL4 v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v9;
  id v10;

  -[PLContainerChangeNotification _calculateDiffsIfNecessary](self, "_calculateDiffsIfNecessary");
  v9 = 0;
  v10 = 0;
  v3 = -[PLContainerChangeNotification _getOldSet:newSet:](self, "_getOldSet:newSet:", &v10, &v9);
  v4 = v10;
  v5 = v9;
  if (v3)
  {
    -[PLContainerChangeNotification deletedIndexes](self, "deletedIndexes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectsAtIndexes:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSArray *)v7;
}

- (NSArray)insertedObjects
{
  _BOOL4 v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v9;
  id v10;

  -[PLContainerChangeNotification _calculateDiffsIfNecessary](self, "_calculateDiffsIfNecessary");
  v9 = 0;
  v10 = 0;
  v3 = -[PLContainerChangeNotification _getOldSet:newSet:](self, "_getOldSet:newSet:", &v10, &v9);
  v4 = v10;
  v5 = v9;
  if (v3)
  {
    -[PLContainerChangeNotification insertedIndexes](self, "insertedIndexes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectsAtIndexes:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSArray *)v7;
}

- (NSArray)changedObjects
{
  _BOOL4 v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v9;
  id v10;

  -[PLContainerChangeNotification _calculateDiffsIfNecessary](self, "_calculateDiffsIfNecessary");
  v9 = 0;
  v10 = 0;
  v3 = -[PLContainerChangeNotification _getOldSet:newSet:](self, "_getOldSet:newSet:", &v10, &v9);
  v4 = v10;
  v5 = v9;
  if (v3)
  {
    -[PLContainerChangeNotification changedIndexes](self, "changedIndexes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectsAtIndexes:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSArray *)v7;
}

- (unint64_t)snapshotIndexForContainedObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;

  v4 = a3;
  if (self->_snapshot)
  {
    -[PLContainerChangeNotification _contentRelationshipName](self, "_contentRelationshipName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 && -[PLObjectSnapshot hasSnapshotValueForProperty:](self->_snapshot, "hasSnapshotValueForProperty:", v5))
    {
      -[PLObjectSnapshot snapshotValueForProperty:](self->_snapshot, "snapshotValueForProperty:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
        v8 = objc_msgSend(v6, "indexOfObject:", v4);
      else
        v8 = 0x7FFFFFFFFFFFFFFFLL;

    }
    else
    {
      v8 = 0x7FFFFFFFFFFFFFFFLL;
    }

  }
  else
  {
    v8 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v8;
}

- (NSIndexSet)movedIndexes
{
  return self->_movedIndexes;
}

- (__CFArray)movedFromIndexes
{
  return self->_movedFromIndexes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changedIndexes, 0);
  objc_storeStrong((id *)&self->_movedIndexes, 0);
  objc_storeStrong((id *)&self->_insertedIndexes, 0);
  objc_storeStrong((id *)&self->_deletedIndexes, 0);
  objc_storeStrong((id *)&self->_changedObjects, 0);
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong(&self->_object, 0);
}

uint64_t __57__PLContainerChangeNotification_enumerateMovesWithBlock___block_invoke(_QWORD *a1)
{
  const __CFArray *v2;
  uint64_t v3;
  CFIndex v4;

  v2 = *(const __CFArray **)(a1[4] + 64);
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(_QWORD *)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v4 + 1;
  CFArrayGetValueAtIndex(v2, v4);
  return (*(uint64_t (**)(void))(a1[5] + 16))();
}

- (id)_initWithObject:(id)a3 snapshot:(id)a4 changedObjects:(id)a5
{
  id v9;
  id v10;
  id v11;
  id *v12;
  id *v13;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = -[PLContainerChangeNotification _init](self, "_init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong(v12 + 1, a3);
    objc_storeStrong(v13 + 2, a4);
    objc_storeStrong(v13 + 3, a5);
  }

  return v13;
}

- (BOOL)_didCalculateDiffs
{
  return self->_didCalculateDiffs;
}

- (void)_setDidCalculateDiffs:(BOOL)a3
{
  self->_didCalculateDiffs = a3;
}

- (PLManagedObject)_managedObject
{
  return (PLManagedObject *)self->_object;
}

- (NSArray)_changedObjects
{
  return self->_changedObjects;
}

- (NSString)_contentRelationshipName
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLContainerChangeNotification.m"), 260, CFSTR("Abstract class"));

  return 0;
}

- (PLObjectSnapshot)snapshot
{
  return self->_snapshot;
}

- (NSString)_diffDescription
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
  NSIndexSet *movedIndexes;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[5];
  id v19;
  _QWORD *v20;
  _QWORD v21[4];

  v3 = (void *)MEMORY[0x19AEC1554](-[PLContainerChangeNotification _calculateDiffsIfNecessary](self, "_calculateDiffsIfNecessary"));
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PLContainerChangeNotification shouldReload](self, "shouldReload"))
  {
    -[PLContainerChangeNotification _contentRelationshipName](self, "_contentRelationshipName");
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
    if (self->_movedIndexes)
    {
      objc_msgSend(v4, "appendString:", CFSTR(", moved: {"));
      v21[0] = 0;
      v21[1] = v21;
      v21[2] = 0x2020000000;
      v21[3] = 0;
      movedIndexes = self->_movedIndexes;
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __59__PLContainerChangeNotification_Internal___diffDescription__block_invoke;
      v18[3] = &unk_1E366FB70;
      v18[4] = self;
      v20 = v21;
      v13 = v4;
      v19 = v13;
      -[NSIndexSet enumerateIndexesUsingBlock:](movedIndexes, "enumerateIndexesUsingBlock:", v18);
      objc_msgSend(v13, "appendString:", CFSTR("}"));

      _Block_object_dispose(v21, 8);
    }
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
    if (self->_countDidChange)
      objc_msgSend(v4, "appendString:", CFSTR(", count changed"));
  }
  objc_autoreleasePoolPop(v3);
  return (NSString *)v4;
}

- (BOOL)_getOldSet:(id *)a3 newSet:(id *)a4
{
  void *v7;
  _BOOL4 v8;
  void *v9;

  -[PLContainerChangeNotification _contentRelationshipName](self, "_contentRelationshipName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PLObjectSnapshot hasSnapshotValueForProperty:](self->_snapshot, "hasSnapshotValueForProperty:", v7);
  if (v8)
  {
    -[PLObjectSnapshot snapshotValueForProperty:](self->_snapshot, "snapshotValueForProperty:", v7);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    -[PLContainerChangeNotification _managedObject](self, "_managedObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "valueForKey:", v7);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (void)_calculateDiffsIfNecessary
{
  if (!-[PLContainerChangeNotification _didCalculateDiffs](self, "_didCalculateDiffs"))
    -[PLContainerChangeNotification _calculateDiffs](self, "_calculateDiffs");
}

- (void)_calculateDiffs
{
  _BOOL4 v3;
  id v4;
  id v5;
  NSIndexSet **p_deletedIndexes;
  NSIndexSet *deletedIndexes;
  NSIndexSet *insertedIndexes;
  NSIndexSet *movedIndexes;
  CFTypeRef *p_movedFromIndexes;
  __CFArray *movedFromIndexes;
  NSIndexSet **p_changedIndexes;
  NSIndexSet *changedIndexes;
  void *v14;
  id v15;
  id v16;
  id v17;
  char *v18;
  uint64_t v19;
  NSIndexSet *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  NSIndexSet *v24;
  uint64_t v25;
  char *v26;
  id v27;
  id v28;
  id v29;
  id *location;
  void *v31;
  void *v32;
  char *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;

  self->_didCalculateDiffs = 1;
  v38 = 0;
  v37 = 0;
  v3 = -[PLContainerChangeNotification _getOldSet:newSet:](self, "_getOldSet:newSet:", &v38, &v37);
  v4 = v38;
  v5 = v37;
  self->_shouldReload = !v3;
  if (v3)
  {
    p_deletedIndexes = &self->_deletedIndexes;
    deletedIndexes = self->_deletedIndexes;
    self->_deletedIndexes = 0;

    insertedIndexes = self->_insertedIndexes;
    location = (id *)&self->_insertedIndexes;
    self->_insertedIndexes = 0;

    movedIndexes = self->_movedIndexes;
    self->_movedIndexes = 0;

    p_movedFromIndexes = (CFTypeRef *)&self->_movedFromIndexes;
    movedFromIndexes = self->_movedFromIndexes;
    if (movedFromIndexes)
    {
      CFRelease(movedFromIndexes);
      *p_movedFromIndexes = 0;
    }
    p_changedIndexes = &self->_changedIndexes;
    changedIndexes = self->_changedIndexes;
    self->_changedIndexes = 0;

    -[PLContainerChangeNotification _changedObjects](self, "_changedObjects");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0;
    v36 = 0;
    v33 = 0;
    v34 = 0;
    v31 = v5;
    v32 = v4;
    diffOrderedSets(v4, v5, v14, &v36, &v35, &v34, (CFTypeRef *)&self->_movedFromIndexes, &v33);
    v15 = v36;
    v29 = v36;
    v16 = v35;
    v28 = v35;
    v17 = v34;
    v27 = v34;
    v18 = v33;
    v26 = v33;

    objc_storeStrong((id *)&self->_deletedIndexes, v15);
    objc_storeStrong(location, v16);
    objc_storeStrong((id *)&self->_movedIndexes, v17);
    if (*p_movedFromIndexes)
      CFRetain(*p_movedFromIndexes);
    objc_storeStrong((id *)&self->_changedIndexes, v18);
    if (!*p_deletedIndexes)
    {
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = *p_deletedIndexes;
      *p_deletedIndexes = (NSIndexSet *)v19;

    }
    v5 = v31;
    v4 = v32;
    if (!*location)
    {
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = *location;
      *location = (id)v21;

    }
    if (!*p_changedIndexes)
    {
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = *p_changedIndexes;
      *p_changedIndexes = (NSIndexSet *)v23;

    }
    v25 = objc_msgSend(v32, "count");
    self->_countDidChange = v25 != objc_msgSend(v31, "count");

  }
}

uint64_t __59__PLContainerChangeNotification_Internal___diffDescription__block_invoke(uint64_t a1, uint64_t a2)
{
  const __CFArray *v4;
  uint64_t v5;
  CFIndex v6;

  v4 = *(const __CFArray **)(*(_QWORD *)(a1 + 32) + 64);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(_QWORD *)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6 + 1;
  return objc_msgSend(*(id *)(a1 + 40), "appendFormat:", CFSTR("%lu->%lu, "), CFArrayGetValueAtIndex(v4, v6), a2);
}

@end
