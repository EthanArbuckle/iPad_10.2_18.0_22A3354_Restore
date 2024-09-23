@implementation _PASInternPool

- (id)intern:(id)a3
{
  return -[_PASInternPool _intern:copyInput:]((uint64_t)self, a3, 1);
}

- (id)_intern:(char)a3 copyInput:
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  uint64_t *v14;
  char v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v5 = a2;
  v6 = v5;
  v7 = 0;
  if (a1 && v5)
  {
    if (malloc_size(v5))
    {
      v8 = (void *)MEMORY[0x1A1AFDC98]();
      v16 = 0;
      v17 = &v16;
      v18 = 0x3032000000;
      v19 = __Block_byref_object_copy__2044;
      v20 = __Block_byref_object_dispose__2045;
      v21 = 0;
      v9 = *(void **)(a1 + 8);
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __36___PASInternPool__intern_copyInput___block_invoke;
      v11[3] = &unk_1E442FEA8;
      v13 = a1;
      v14 = &v16;
      v15 = a3;
      v12 = v6;
      objc_msgSend(v9, "runWithLockAcquired:", v11);
      v7 = (id)v17[5];

      _Block_object_dispose(&v16, 8);
      objc_autoreleasePoolPop(v8);
    }
    else
    {
      v7 = v6;
    }
  }

  return v7;
}

- (_PASInternPool)initWithBehavior:(unint64_t)a3 copyWithZone:(id)a4
{
  id v6;
  _PASInternPool *v7;
  _PASInternPool *v8;
  uint64_t v9;
  void *v10;
  _PASLock *v11;
  _PASLock *lock;
  void *v13;
  uint64_t v14;
  id copyWithZone;
  objc_super v17;

  v6 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_PASInternPool;
  v7 = -[_PASInternPool init](&v17, sel_init);
  v8 = v7;
  if (v7)
  {
    if (a3 == 1)
      v9 = 0;
    else
      v9 = 5;
    v10 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3690], "allocWithZone:", -[_PASZonedObject allocationZone](v7, "allocationZone")), "initWithOptions:capacity:", v9, 0);
    v11 = -[_PASLock initWithGuardedData:]([_PASLock alloc], "initWithGuardedData:", v10);
    lock = v8->_lock;
    v8->_lock = v11;

    if (v6)
      v13 = v6;
    else
      v13 = &__block_literal_global_2050;
    v14 = MEMORY[0x1A1AFDE78](v13);
    copyWithZone = v8->_copyWithZone;
    v8->_copyWithZone = (id)v14;

  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_copyWithZone, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

- (_PASInternPool)init
{
  return -[_PASInternPool initWithBehavior:copyWithZone:](self, "initWithBehavior:copyWithZone:", 0, 0);
}

- (id)internNoCopy:(id)a3
{
  return -[_PASInternPool _intern:copyInput:]((uint64_t)self, a3, 0);
}

- (BOOL)isInterned:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _PASLock *lock;
  BOOL v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (malloc_size(v4))
    {
      v6 = (void *)MEMORY[0x1A1AFDC98]();
      v13 = 0;
      v14 = &v13;
      v15 = 0x2020000000;
      lock = self->_lock;
      v16 = 0;
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __29___PASInternPool_isInterned___block_invoke;
      v10[3] = &unk_1E442FED0;
      v12 = &v13;
      v11 = v5;
      -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v10);
      v8 = *((_BYTE *)v14 + 24) != 0;

      _Block_object_dispose(&v13, 8);
      objc_autoreleasePoolPop(v6);
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (BOOL)isEmpty
{
  _PASInternPool *v2;
  void *v3;
  _PASLock *lock;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v2 = self;
  v3 = (void *)MEMORY[0x1A1AFDC98](self, a2);
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  lock = v2->_lock;
  v10 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __25___PASInternPool_isEmpty__block_invoke;
  v6[3] = &unk_1E442FEF8;
  v6[4] = &v7;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v6);
  LOBYTE(v2) = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  objc_autoreleasePoolPop(v3);
  return (char)v2;
}

- (void)clear
{
  void *v3;

  v3 = (void *)MEMORY[0x1A1AFDC98](self, a2);
  -[_PASLock runWithLockAcquired:](self->_lock, "runWithLockAcquired:", &__block_literal_global_3);
  objc_autoreleasePoolPop(v3);
}

@end
