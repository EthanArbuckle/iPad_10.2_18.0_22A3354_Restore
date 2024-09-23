@implementation PETReservoirSamplingLog

- (PETReservoirSamplingLog)initWithStore:(id)a3 limit:(unint64_t)a4
{
  id v8;
  void *v9;
  PETReservoirSamplingLog *v10;
  PETReservoirSamplingLog *v11;
  objc_class *v13;
  void *v14;
  void *v15;
  objc_super v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = v8;
  if (a4 - 0xFFFFFFFF > 0xFFFFFFFF00000001)
  {
    if (v8)
      goto LABEL_3;
LABEL_12:
    v11 = 0;
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PETReservoirSamplingLog.m"), 236, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("limit > 0 && limit < UINT32_MAX"));

  if (!v9)
    goto LABEL_12;
LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)PETReservoirSamplingLog;
  v10 = -[PETReservoirSamplingLog init](&v16, sel_init);
  self = v10;
  if (v10)
  {
    pthread_mutex_init(&v10->_lock, 0);
    objc_storeStrong((id *)&self->_store, a3);
    self->_limit = a4;
    self->_rng = ($FEF0A0984D2795EAE1E2AD40E2F6E7E6)xmmword_18FADA990;
    if (!-[PETReservoirSamplingLog _readHeader](self, "_readHeader"))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v18 = v14;
        _os_log_error_impl(&dword_18FAB0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error reading %@ header, emptying log", buf, 0xCu);

      }
      if (!-[PETReservoirSamplingLogStore attemptToRecreate](self->_store, "attemptToRecreate")
        || !-[PETReservoirSamplingLog _readHeader](self, "_readHeader"))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_18FAB0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Could not empty log", buf, 2u);
        }
        goto LABEL_12;
      }
    }
  }
  self = self;
  v11 = self;
LABEL_13:

  return v11;
}

- (PETReservoirSamplingLog)initWithPath:(id)a3 limit:(unint64_t)a4
{
  id v6;
  PETReservoirSamplingLogStoreFile *v7;
  PETReservoirSamplingLog *v8;

  v6 = a3;
  v7 = -[PETReservoirSamplingLogStoreFile initWithPath:]([PETReservoirSamplingLogStoreFile alloc], "initWithPath:", v6);

  v8 = -[PETReservoirSamplingLog initWithStore:limit:](self, "initWithStore:limit:", v7, a4);
  return v8;
}

- (id)initInMemoryWithLimit:(unint64_t)a3
{
  void *v5;
  PETReservoirSamplingLog *v6;

  v5 = (void *)objc_opt_new();
  v6 = -[PETReservoirSamplingLog initWithStore:limit:](self, "initWithStore:limit:", v5, a3);

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  pthread_mutex_destroy(&self->_lock);
  v3.receiver = self;
  v3.super_class = (Class)PETReservoirSamplingLog;
  -[PETReservoirSamplingLog dealloc](&v3, sel_dealloc);
}

- (BOOL)_readHeader
{
  uint64_t v3;
  PETReservoirSamplingLogStore *store;
  _QWORD *v5;
  uint64_t limit;
  BOOL v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  unint64_t v12;

  if (-[PETReservoirSamplingLog _lock](self, "_lock"))
  {
    v3 = -[PETReservoirSamplingLogStore currentLength](self->_store, "currentLength");
    v12 = 0;
    store = self->_store;
    if (v3)
    {
      v5 = (_QWORD *)-[PETReservoirSamplingLogStore remap:](store, "remap:", &v12);
      if (v5)
      {
        limit = self->_limit;
        if (v12 >= 8 * limit + 16 && *v5 == __PAIR64__(limit, -1014632835))
        {
LABEL_13:
          v7 = 1;
LABEL_15:
          -[PETReservoirSamplingLog _unlock](self, "_unlock");
          return v7;
        }
      }
    }
    else if (-[PETReservoirSamplingLogStore changeLength:](store, "changeLength:", 8 * self->_limit + 16))
    {
      v8 = -[PETReservoirSamplingLogStore remap:](self->_store, "remap:", &v12);
      if (v8)
      {
        if (v12 == 8 * self->_limit + 16)
        {
          *(_DWORD *)v8 = -1014632835;
          v9 = self->_limit;
          *(_QWORD *)(v8 + 8) = 0;
          *(_DWORD *)(v8 + 4) = v9;
          v10 = self->_limit;
          if ((_DWORD)v10)
            memset((void *)(v8 + 16), 255, 8 * v10);
          goto LABEL_13;
        }
      }
    }
    v7 = 0;
    goto LABEL_15;
  }
  return 0;
}

- (BOOL)_lock
{
  pthread_mutex_lock(&self->_lock);
  return -[PETReservoirSamplingLogStore lock](self->_store, "lock");
}

- (void)_unlock
{
  -[PETReservoirSamplingLogStore unlock](self->_store, "unlock");
  pthread_mutex_unlock(&self->_lock);
}

- (void)log:(id)a3
{
  id v4;
  uint64_t v5;
  unsigned int v6;
  unint64_t v7;
  unsigned int limit;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  unsigned int v21;
  int v22;
  int *v23;
  char *v24;
  uint64_t v25;
  unint64_t v26;
  uint8_t buf[4];
  int v28;
  __int16 v29;
  char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[PETReservoirSamplingLog _lock](self, "_lock"))
  {
    v26 = 0;
    v5 = -[PETReservoirSamplingLogStore headerMap:](self->_store, "headerMap:", &v26);
    v25 = v5;
    if (v5 && v26 >= 8 * (unint64_t)self->_limit + 16)
    {
      v6 = *(_DWORD *)(v5 + 12);
      v7 = v6 + 1;
      *(_DWORD *)(v5 + 12) = v7;
      limit = self->_limit;
      if (v6 < limit)
      {
        v9 = -[PETReservoirSamplingLogStore currentLength](self->_store, "currentLength");
        if (-[PETReservoirSamplingLogStore appendData:andReturnMapPointer:](self->_store, "appendData:andReturnMapPointer:", v4, &v25))
        {
          if (v25)
          {
            *(_DWORD *)(v25 + 8 * *(unsigned int *)(v25 + 8) + 16) = v9;
            v10 = objc_msgSend(v4, "length");
            v11 = v25;
            v12 = *(unsigned int *)(v25 + 8);
            *(_DWORD *)(v25 + 8 * v12 + 20) = v10;
            *(_DWORD *)(v11 + 8) = v12 + 1;
          }
          goto LABEL_15;
        }
LABEL_13:
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          v22 = *__error();
          v23 = __error();
          v24 = strerror(*v23);
          *(_DWORD *)buf = 67109378;
          v28 = v22;
          v29 = 2080;
          v30 = v24;
          _os_log_error_impl(&dword_18FAB0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Could not append: [%i] %s", buf, 0x12u);
        }
        goto LABEL_15;
      }
      v13 = self->_rng.s[0];
      v14 = self->_rng.s[1];
      v15 = v14 + v13;
      v16 = v14 ^ v13;
      self->_rng.s[0] = __ROR8__(v13, 9) ^ (v16 << 14) ^ v16;
      self->_rng.s[1] = __ROR8__(v16, 28);
      v17 = v15 % v7;
      if (limit > (v15 % v7))
      {
        v18 = -[PETReservoirSamplingLogStore currentLength](self->_store, "currentLength");
        if (-[PETReservoirSamplingLogStore appendData:andReturnMapPointer:](self->_store, "appendData:andReturnMapPointer:", v4, &v25))
        {
          if (v25)
          {
            *(_DWORD *)(v25 + 8 * v17 + 16) = v18;
            v19 = objc_msgSend(v4, "length");
            v20 = v25;
            *(_DWORD *)(v25 + 8 * v17 + 20) = v19;
            v21 = *(_DWORD *)(v20 + 8) + 1;
            *(_DWORD *)(v20 + 8) = v21;
            if (v21 > 2 * self->_limit)
              -[PETReservoirSamplingLog _gc](self, "_gc");
          }
          goto LABEL_15;
        }
        goto LABEL_13;
      }
    }
LABEL_15:
    -[PETReservoirSamplingLog _unlock](self, "_unlock", v25);
  }

}

- (void)_gc
{
  uint64_t v3;
  _DWORD *v4;
  unsigned int *v5;
  unsigned int v6;
  unint64_t limit;
  unsigned int v8;
  unint64_t v9;
  unsigned int *v10;
  NSObject *v11;
  size_t v12;
  unsigned int v13;
  uint8_t v14[8];
  unint64_t v15;

  v15 = 0;
  v3 = -[PETReservoirSamplingLogStore remap:](self->_store, "remap:", &v15);
  if (v3 && v15 >= 8 * (unint64_t)self->_limit + 16)
  {
    v4 = (_DWORD *)v3;
    v5 = (unsigned int *)(v3 + 16);
    qsort((void *)(v3 + 16), *(unsigned int *)(v3 + 4), 8uLL, (int (__cdecl *)(const void *, const void *))chunkCompareByOffset);
    v6 = 8 * v4[1] + 16;
    LODWORD(limit) = self->_limit;
    if ((_DWORD)limit)
    {
      v8 = *v5;
      if (*v5 != -1)
      {
        v9 = 0;
        v10 = v4 + 6;
        v11 = MEMORY[0x1E0C81028];
        do
        {
          v12 = *(v10 - 1);
          if (v15 >= v12 + v8)
          {
            memmove((char *)v4 + v6, (char *)v4 + v8, v12);
            *(v10 - 2) = v6;
            v6 += *(v10 - 1);
          }
          else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v14 = 0;
            _os_log_error_impl(&dword_18FAB0000, v11, OS_LOG_TYPE_ERROR, "Out of bounds chunk", v14, 2u);
          }
          ++v9;
          limit = self->_limit;
          if (v9 >= limit)
            break;
          v13 = *v10;
          v10 += 2;
          v8 = v13;
        }
        while (v13 != -1);
      }
    }
    v4[2] = limit;
    -[PETReservoirSamplingLogStore changeLength:](self->_store, "changeLength:", v6);
  }
}

- (void)enumerateItemsWithBlock:(id)a3
{
  id v4;

  v4 = a3;
  if (-[PETReservoirSamplingLog _lock](self, "_lock"))
  {
    -[PETReservoirSamplingLog _enumerateItemsWithBlockLocked:](self, "_enumerateItemsWithBlockLocked:", v4);
    -[PETReservoirSamplingLog _unlock](self, "_unlock");
  }

}

- (void)_enumerateItemsWithBlockLocked:(id)a3
{
  void (**v4)(id, void *, _BYTE *);
  uint64_t v5;
  unint64_t limit;
  uint64_t v8;
  unint64_t v9;
  NSObject *v10;
  unsigned int *v11;
  void *v12;
  void *v13;
  int v14;
  uint8_t v15[7];
  unsigned __int8 v16;
  unint64_t v17;

  v4 = (void (**)(id, void *, _BYTE *))a3;
  v17 = 0;
  v5 = -[PETReservoirSamplingLogStore remap:](self->_store, "remap:", &v17);
  if (v5)
  {
    limit = self->_limit;
    if (v17 >= 8 * limit + 16 && limit != 0)
    {
      v8 = v5;
      v9 = 0;
      v10 = MEMORY[0x1E0C81028];
      v11 = (unsigned int *)(v5 + 16);
      do
      {
        if (*v11 != -1)
        {
          v12 = (void *)MEMORY[0x19400723C]();
          v16 = 0;
          if (v17 >= v11[1] + *v11)
          {
            v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", v8 + *v11, v11[1], 0);
            v4[2](v4, v13, &v16);
            v14 = v16;

            if (v14)
            {
              objc_autoreleasePoolPop(v12);
              break;
            }
          }
          else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v15 = 0;
            _os_log_error_impl(&dword_18FAB0000, v10, OS_LOG_TYPE_ERROR, "Out of bounds chunk", v15, 2u);
          }
          objc_autoreleasePoolPop(v12);
          limit = self->_limit;
        }
        ++v9;
        v11 += 2;
      }
      while (v9 < limit);
    }
  }

}

- (void)clear
{
  if (-[PETReservoirSamplingLog _lock](self, "_lock"))
  {
    -[PETReservoirSamplingLog _clearLocked](self, "_clearLocked");
    -[PETReservoirSamplingLog _unlock](self, "_unlock");
  }
}

- (void)_clearLocked
{
  uint64_t v3;
  uint64_t limit;
  uint64_t v5;
  unint64_t v6;

  v6 = 0;
  v3 = -[PETReservoirSamplingLogStore remap:](self->_store, "remap:", &v6);
  if (v3 && v6 >= 8 * (unint64_t)self->_limit + 16)
  {
    *(_QWORD *)(v3 + 8) = 0;
    limit = self->_limit;
    if ((_DWORD)limit)
    {
      memset((void *)(v3 + 16), 255, 8 * limit);
      v5 = 8 * self->_limit + 16;
    }
    else
    {
      v5 = 16;
    }
    -[PETReservoirSamplingLogStore changeLength:](self->_store, "changeLength:", v5);
  }
}

- (void)enumerateAndClearItemsWithBlock:(id)a3
{
  id v4;

  v4 = a3;
  if (-[PETReservoirSamplingLog _lock](self, "_lock"))
  {
    -[PETReservoirSamplingLog _enumerateItemsWithBlockLocked:](self, "_enumerateItemsWithBlockLocked:", v4);
    -[PETReservoirSamplingLog _clearLocked](self, "_clearLocked");
    -[PETReservoirSamplingLog _unlock](self, "_unlock");
  }

}

- (void)unlock
{
  -[PETReservoirSamplingLogStore unlock](self->_store, "unlock");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
}

@end
