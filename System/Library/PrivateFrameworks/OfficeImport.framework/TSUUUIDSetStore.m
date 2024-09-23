@implementation TSUUUIDSetStore

- (TSUUUIDSetStore)init
{
  TSUUUIDSetStore *v2;
  uint64_t v3;
  TSUSparseArray *uuidSetForIndex;
  uint64_t v5;
  NSMutableDictionary *indexesUsingUuid;
  uint64_t v7;
  NSLock *lock;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TSUUUIDSetStore;
  v2 = -[TSUUUIDSetStore init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    uuidSetForIndex = v2->_uuidSetForIndex;
    v2->_uuidSetForIndex = (TSUSparseArray *)v3;

    v5 = objc_opt_new();
    indexesUsingUuid = v2->_indexesUsingUuid;
    v2->_indexesUsingUuid = (NSMutableDictionary *)v5;

    v7 = objc_opt_new();
    lock = v2->_lock;
    v2->_lock = (NSLock *)v7;

  }
  return v2;
}

- (id)description
{
  void *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__20;
  v10 = __Block_byref_object_dispose__20;
  v11 = (id)objc_opt_new();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __30__TSUUUIDSetStore_description__block_invoke;
  v5[3] = &unk_24F39C900;
  v5[4] = &v6;
  -[TSUUUIDSetStore foreachUuidSet:](self, "foreachUuidSet:", v5);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@<%p>:\n %@"), objc_opt_class(), self, v7[5]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __30__TSUUUIDSetStore_description__block_invoke(uint64_t a1, uint64_t a2, unsigned int a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "appendFormat:", CFSTR("[%lu] = %@\n"), a3, a2);
}

- (unsigned)addSet:(id)a3
{
  id v4;
  uint64_t v5;
  unsigned int highestIndex;
  void *v7;
  void *v8;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    LODWORD(v5) = -[TSUUUIDSetStore indexOfSet:](self, "indexOfSet:", v4);
    if (!(_DWORD)v5)
    {
      highestIndex = self->_highestIndex;
      v5 = highestIndex + 1;
      self->_highestIndex = v5;
      if (highestIndex == -1)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUUUIDSetStore addSet:]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUUUIDSetStore.mm");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 70, 0, "We just rolled over uuidSet indexes, we shouldn't use that many in one collab session.");

        +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
        if (self->_highestIndex)
        {
          v5 = 0;
        }
        else
        {
          v5 = 1;
          self->_highestIndex = 1;
        }
      }
      -[TSUUUIDSetStore p_addSet:atIndex:](self, "p_addSet:atIndex:", v4, v5);
    }
  }
  else
  {
    LODWORD(v5) = 0;
  }

  return v5;
}

- (unsigned)addSetForUuids:(const void *)a3
{
  TSUUUIDSet *v4;
  unsigned int v5;

  if (*((_QWORD *)a3 + 1) == *(_QWORD *)a3)
    return 0;
  v4 = -[TSUUUIDSet initWithUUIDVector:]([TSUUUIDSet alloc], "initWithUUIDVector:", a3);
  v5 = -[TSUUUIDSetStore addSet:](self, "addSet:", v4);

  return v5;
}

- (void)p_addSet:(id)a3 atIndex:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[5];
  int v12;
  id v13;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = v6;
  if (v6 && (_DWORD)v4)
  {
    if (objc_msgSend(v6, "index") && objc_msgSend(v7, "index") != (_DWORD)v4)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUUUIDSetStore p_addSet:atIndex:]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUUUIDSetStore.mm");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_opt_class();
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 94, 0, "Is this %@ in two %@ instances - that won't work, they each need to set its internal index value.", v10, objc_opt_class());

      +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    }
    objc_msgSend(v7, "setIndex:", v4);
    TSULocker::TSULocker((TSULocker *)&v13, self->_lock);
    -[TSUSparseArray setObject:forKey:](self->_uuidSetForIndex, "setObject:forKey:", v7, v4);
    if (self->_highestIndex < v4)
      self->_highestIndex = v4;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __36__TSUUUIDSetStore_p_addSet_atIndex___block_invoke;
    v11[3] = &unk_24F39C928;
    v11[4] = self;
    v12 = v4;
    objc_msgSend(v7, "foreachUuid:", v11);
    TSULocker::~TSULocker(&v13);
  }

}

void __36__TSUUUIDSetStore_p_addSet_atIndex___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", a2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = (void *)objc_opt_new();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKey:");
  }
  objc_msgSend(v3, "addIndex:", *(unsigned int *)(a1 + 40));

}

- (void)removeSetAtIndex:(unsigned int)a3
{
  id v5;

  TSULocker::TSULocker((TSULocker *)&v5, self->_lock);
  if (a3)
    -[TSUSparseArray setObject:forKey:](self->_uuidSetForIndex, "setObject:forKey:", 0, a3);
  TSULocker::~TSULocker(&v5);
}

- (id)setForIndex:(unsigned int)a3
{
  void *v5;
  id v7;

  TSULocker::TSULocker((TSULocker *)&v7, self->_lock);
  if (a3)
  {
    -[TSUSparseArray objectForKey:](self->_uuidSetForIndex, "objectForKey:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  TSULocker::~TSULocker(&v7);
  return v5;
}

- (unsigned)indexOfSet:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  unsigned int v7;
  void *v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__20;
    v15 = __Block_byref_object_dispose__20;
    v16 = 0;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __30__TSUUUIDSetStore_indexOfSet___block_invoke;
    v10[3] = &unk_24F39BA60;
    v10[4] = self;
    v10[5] = &v11;
    objc_msgSend(v4, "foreachUuid:", v10);
    if (objc_msgSend((id)v12[5], "count") && (v6 = objc_msgSend((id)v12[5], "firstIndex"), v6 != 0x7FFFFFFFFFFFFFFFLL))
    {
      do
      {
        -[TSUUUIDSetStore setForIndex:](self, "setForIndex:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v8, "isEqual:", v5) & 1) != 0)
        {
          v7 = v6;
        }
        else
        {
          v6 = objc_msgSend((id)v12[5], "indexGreaterThanIndex:", v6);
          v7 = 0;
        }

      }
      while (!v7 && v6 != 0x7FFFFFFFFFFFFFFFLL);
    }
    else
    {
      v7 = 0;
    }
    _Block_object_dispose(&v11, 8);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __30__TSUUUIDSetStore_indexOfSet___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  void *v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "indexesUsingUuid:", a2);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "count"))
    goto LABEL_9;
  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (!v5)
  {
    v9 = objc_msgSend(v11, "mutableCopy");
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;
    goto LABEL_11;
  }
  for (i = objc_msgSend(v5, "firstIndex");
        i != 0x7FFFFFFFFFFFFFFFLL;
        i = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "indexGreaterThanIndex:", i))
  {
    if ((objc_msgSend(v11, "containsIndex:", i) & 1) == 0)
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "removeIndex:", i);
  }
  if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count"))
  {
LABEL_9:
    *a3 = 1;
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = 0;
LABEL_11:

  }
}

- (BOOL)containsUuidSet:(id)a3
{
  return -[TSUUUIDSetStore indexOfSet:](self, "indexOfSet:", a3) != 0;
}

- (id)indexesUsingUuid:(const void *)a3
{
  void *v4;
  void *v5;
  id v7;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", a3);
  TSULocker::TSULocker((TSULocker *)&v7, self->_lock);
  -[NSMutableDictionary objectForKey:](self->_indexesUsingUuid, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  TSULocker::~TSULocker(&v7);

  return v5;
}

- (id)indexesUsingAnyOfUuids:(const void *)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v11;

  objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  TSULocker::TSULocker((TSULocker *)&v11, self->_lock);
  v6 = *(_QWORD *)a3;
  v7 = *((_QWORD *)a3 + 1);
  if (*(_QWORD *)a3 != v7)
  {
    do
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", v6);
      -[NSMutableDictionary objectForKey:](self->_indexesUsingUuid, "objectForKey:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addIndexes:", v9);

      v6 += 16;
    }
    while (v6 != v7);
  }
  TSULocker::~TSULocker(&v11);
  return v5;
}

- (void)_foreachUuidSet:(id)a3
{
  id v4;
  TSUSparseArray *uuidSetForIndex;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  uuidSetForIndex = self->_uuidSetForIndex;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __35__TSUUUIDSetStore__foreachUuidSet___block_invoke;
  v7[3] = &unk_24F39C950;
  v8 = v4;
  v6 = v4;
  -[TSUSparseArray foreach:](uuidSetForIndex, "foreach:", v7);

}

uint64_t __35__TSUUUIDSetStore__foreachUuidSet___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)subsetStoreForIndexes:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  TSULocker::TSULocker((TSULocker *)&v14, self->_lock);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __41__TSUUUIDSetStore_subsetStoreForIndexes___block_invoke;
  v11[3] = &unk_24F39C978;
  v6 = v4;
  v12 = v6;
  v7 = v5;
  v13 = v7;
  -[TSUUUIDSetStore _foreachUuidSet:](self, "_foreachUuidSet:", v11);
  v8 = v13;
  v9 = v7;

  TSULocker::~TSULocker(&v14);
  return v9;
}

void __41__TSUUUIDSetStore_subsetStoreForIndexes___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsIndex:", a3))
    objc_msgSend(*(id *)(a1 + 40), "p_addSet:atIndex:", v5, a3);

}

- (void)foreachUuidSet:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  TSULocker::TSULocker((TSULocker *)&v5, self->_lock);
  -[TSUUUIDSetStore _foreachUuidSet:](self, "_foreachUuidSet:", v4);
  TSULocker::~TSULocker(&v5);

}

- (unint64_t)count
{
  return -[TSUSparseArray count](self->_uuidSetForIndex, "count");
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = (void *)objc_opt_new();
  TSULocker::TSULocker((TSULocker *)&v9, self->_lock);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __32__TSUUUIDSetStore_copyWithZone___block_invoke;
  v7[3] = &unk_24F39C9A0;
  v5 = v4;
  v8 = v5;
  -[TSUUUIDSetStore _foreachUuidSet:](self, "_foreachUuidSet:", v7);

  TSULocker::~TSULocker(&v9);
  return v5;
}

uint64_t __32__TSUUUIDSetStore_copyWithZone___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "p_addSet:atIndex:", a2, a3);
}

- (unsigned)addSetForSingleUuid:(const void *)a3
{
  void *v5;
  unsigned int v6;
  TSUUUIDSet *v7;
  unsigned int v8;
  _QWORD v10[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[TSUUUIDSetStore indexesUsingUuid:](self, "indexesUsingUuid:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __39__TSUUUIDSetStore_addSetForSingleUuid___block_invoke;
    v10[3] = &unk_24F39C9C8;
    v10[4] = self;
    v10[5] = &v11;
    v10[6] = a3;
    objc_msgSend(v5, "enumerateIndexesUsingBlock:", v10);
  }
  v6 = *((_DWORD *)v12 + 6);
  if (!v6)
  {
    v7 = -[TSUUUIDSet initWithUUID:]([TSUUUIDSet alloc], "initWithUUID:", a3);
    v8 = -[TSUUUIDSetStore addSet:](self, "addSet:", v7);
    *((_DWORD *)v12 + 6) = v8;

    v6 = *((_DWORD *)v12 + 6);
  }

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __39__TSUUUIDSetStore_addSetForSingleUuid___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  int v4;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setForIndex:", a2);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count") == 1)
  {
    v6 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4;
    *a3 = 1;
    if ((objc_msgSend(v9, "containsUuid:", v6) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUUUIDSetStore addSetForSingleUuid:]_block_invoke");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUUUIDSetStore.mm");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 276, 0, "Oh no, -[%@ indexesUsingUuid:] is broken.", objc_opt_class());

      +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexesUsingUuid, 0);
  objc_storeStrong((id *)&self->_uuidSetForIndex, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end
