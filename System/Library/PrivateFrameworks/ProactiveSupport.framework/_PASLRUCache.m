@implementation _PASLRUCache

- (id)objectForKey:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__2370;
  v16 = __Block_byref_object_dispose__2371;
  v17 = 0;
  lock = self->_lock;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __29___PASLRUCache_objectForKey___block_invoke;
  v9[3] = &unk_1E44301B0;
  v11 = &v12;
  v6 = v4;
  v10 = v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  _PASLock *lock;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _PASLRUCache *v14;

  v6 = a3;
  v7 = a4;
  lock = self->_lock;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __33___PASLRUCache_setObject_forKey___block_invoke;
  v11[3] = &unk_1E44301D8;
  v12 = v7;
  v13 = v6;
  v14 = self;
  v9 = v6;
  v10 = v7;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v11);

}

- (_PASLRUCache)initWithCountLimit:(unint64_t)a3
{
  _PASLRUCache *v4;
  _PASLRUCache *v5;
  _PASLock *v6;
  void *v7;
  uint64_t v8;
  _PASLock *lock;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_PASLRUCache;
  v4 = -[_PASLRUCache init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_countLimit = a3;
    v6 = [_PASLock alloc];
    v7 = (void *)objc_opt_new();
    v8 = -[_PASLock initWithGuardedData:](v6, "initWithGuardedData:", v7);
    lock = v5->_lock;
    v5->_lock = (_PASLock *)v8;

  }
  return v5;
}

- (void)removeObjectForKey:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35___PASLRUCache_removeObjectForKey___block_invoke;
  v7[3] = &unk_1E4430200;
  v8 = v4;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);

}

- (void)removeAllObjects
{
  -[_PASLock runWithLockAcquired:](self->_lock, "runWithLockAcquired:", &__block_literal_global_2373);
}

- (void)enumerateKeysAndObjectsUsingBlock:(id)a3
{
  void (**v4)(id, uint64_t, void *, char *);
  _PASLock *lock;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  char v16;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, void *, char *))a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__2370;
  v28 = __Block_byref_object_dispose__2371;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__2370;
  v22 = __Block_byref_object_dispose__2371;
  v23 = 0;
  lock = self->_lock;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __50___PASLRUCache_enumerateKeysAndObjectsUsingBlock___block_invoke;
  v17[3] = &unk_1E4430268;
  v17[4] = &v24;
  v17[5] = &v18;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v17);
  v16 = 0;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = (id)v19[5];
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v30, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v8)
        objc_enumerationMutation(v6);
      v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
      objc_msgSend((id)v25[5], "objectForKeyedSubscript:", v10, (_QWORD)v12);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, v10, v11, &v16);
      LOBYTE(v10) = v16 == 0;

      if ((v10 & 1) == 0)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v30, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
}

@end
