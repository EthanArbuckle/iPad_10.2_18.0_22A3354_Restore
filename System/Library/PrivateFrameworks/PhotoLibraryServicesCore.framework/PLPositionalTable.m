@implementation PLPositionalTable

- (BOOL)isReadOnly
{
  return self->_isReadOnly;
}

- (tagPLPositionalTableMemoryPool)pool
{
  return self->_pool;
}

- (unint64_t)entryLength
{
  return self->_entryLength;
}

- (BOOL)readDataAtIndex:(unint64_t)a3 intoPoolNode:(tagPLPositionalTableMemoryPoolNode *)a4 bytesRead:(unint64_t *)a5
{
  size_t entryLength;
  ssize_t v7;

  entryLength = self->_entryLength;
  v7 = pread(self->_descriptor, a4->var0, entryLength, entryLength * a3);
  if (a5 && v7 == entryLength)
    *a5 = entryLength;
  return v7 == entryLength;
}

- (PLPositionalTable)initWithPath:(id)a3 readOnly:(BOOL)a4 entryLength:(unint64_t)a5
{
  _BOOL4 v6;
  id v9;
  PLPositionalTable *v10;
  id v11;
  const char *v12;
  int v13;
  int v14;
  uint64_t v15;
  NSString *path;
  NSObject *v17;
  int descriptor;
  __darwin_ino64_t v19;
  int *v20;
  char *v21;
  int v22;
  int v23;
  off_t st_size;
  unint64_t entryLength;
  unint64_t v26;
  OSQueueHead *v27;
  NSObject *v28;
  unint64_t v29;
  PLPositionalTable *v30;
  int v31;
  NSObject *v32;
  NSObject *v33;
  const char *v34;
  NSObject *v35;
  os_log_type_t v36;
  uint32_t v37;
  char *v38;
  char *v39;
  void *v41;
  void *v42;
  objc_super v43;
  stat buf;
  uint64_t v45;

  v6 = a4;
  v45 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v43.receiver = self;
  v43.super_class = (Class)PLPositionalTable;
  v10 = -[PLPositionalTable init](&v43, sel_init);
  if (v10)
  {
    if (v9)
    {
      if (a5)
        goto LABEL_4;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("PLPositionalTable.m"), 224, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("path"));

      if (a5)
        goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("PLPositionalTable.m"), 225, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("entryLength > 0"));

LABEL_4:
    v10->_flushAfterWrite = 1;
    v10->_readOnly = v6;
    v11 = objc_retainAutorelease(v9);
    v12 = (const char *)objc_msgSend(v11, "fileSystemRepresentation");
    if (v6)
      v13 = open(v12, 0, 438);
    else
      v13 = open(v12, 514, 438);
    if (v13 != -1)
    {
      v14 = v13;
      v15 = objc_msgSend(v11, "copy");
      path = v10->_path;
      v10->_path = (NSString *)v15;

      v10->_descriptor = v14;
      v10->_expansionLock._os_unfair_lock_opaque = 0;
      if (fcntl(v14, 45, 1) == -1)
      {
        PLThumbnailsGetLog();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          descriptor = v10->_descriptor;
          v19 = (__darwin_ino64_t)v10->_path;
          v20 = __error();
          v21 = strerror(*v20);
          buf.st_dev = 67109634;
          *(_DWORD *)&buf.st_mode = descriptor;
          LOWORD(buf.st_ino) = 2112;
          *(__darwin_ino64_t *)((char *)&buf.st_ino + 2) = v19;
          HIWORD(buf.st_uid) = 2080;
          *(_QWORD *)&buf.st_gid = v21;
          _os_log_impl(&dword_199DF7000, v17, OS_LOG_TYPE_DEBUG, "Failed to issue set read ahead for file: %d at path: %@ with error=%s", (uint8_t *)&buf, 0x1Cu);
        }

      }
      v10->_entryLength = a5;
      v22 = v10->_descriptor;
      memset(&buf, 0, sizeof(buf));
      v23 = fstat(v22, &buf);
      st_size = buf.st_size;
      if (v23 == -1)
        st_size = 0;
      v10->_entryCapacity = (int)(st_size / (int64_t)v10->_entryLength);
      pl_dispatch_once(&PLIsReallyAssetsd_didCheckReadOnly, &__block_literal_global_42_3368);
      entryLength = v10->_entryLength;
      LODWORD(v26) = 2;
      if (!PLIsReallyAssetsd_isAssetsd && (__PLIsAssetsdProxyService & 1) == 0)
        v26 = 0x300000 / entryLength;
      v27 = PLPositionalTableMemoryPool_Create((void *)entryLength, v26);
      if (!v27)
      {
        PLThumbnailsGetLog();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          v29 = v10->_entryLength * v26;
          buf.st_dev = 134217984;
          *(_QWORD *)&buf.st_mode = v29;
          _os_log_impl(&dword_199DF7000, v28, OS_LOG_TYPE_DEFAULT, "Unable to allocate requested PLPositionalTablePool at size: %ld, using standard alloc.", (uint8_t *)&buf, 0xCu);
        }

      }
      v10->_pool = (tagPLPositionalTableMemoryPool *)v27;
      goto LABEL_22;
    }
    v31 = *__error();
    if (v6)
    {
      PLThumbnailsGetLog();
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = v32;
      if (v31 == 2)
      {
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          buf.st_dev = 138412290;
          *(_QWORD *)&buf.st_mode = v11;
          v34 = "No PLPositionalImageTable file found at path %@";
          v35 = v33;
          v36 = OS_LOG_TYPE_DEFAULT;
          v37 = 12;
LABEL_32:
          _os_log_impl(&dword_199DF7000, v35, v36, v34, (uint8_t *)&buf, v37);
        }
LABEL_33:

        v30 = 0;
        goto LABEL_34;
      }
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        goto LABEL_33;
      v39 = strerror(v31);
      buf.st_dev = 138412802;
      *(_QWORD *)&buf.st_mode = v11;
      WORD2(buf.st_ino) = 2080;
      *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v39;
      HIWORD(buf.st_gid) = 1024;
      buf.st_rdev = v31;
      v34 = "Could not open PLPositionalImageTable at path %@: %s (%d)";
    }
    else
    {
      PLThumbnailsGetLog();
      v33 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        goto LABEL_33;
      v38 = strerror(v31);
      buf.st_dev = 138412802;
      *(_QWORD *)&buf.st_mode = v11;
      WORD2(buf.st_ino) = 2080;
      *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v38;
      HIWORD(buf.st_gid) = 1024;
      buf.st_rdev = v31;
      v34 = "Could not create PLPositionalImageTable at path %@: %s (%d)";
    }
    v35 = v33;
    v36 = OS_LOG_TYPE_ERROR;
    v37 = 28;
    goto LABEL_32;
  }
LABEL_22:
  v30 = v10;
LABEL_34:

  return v30;
}

- (BOOL)_increaseEntryCapacityIfNeededToStoreIndex:(int64_t)a3
{
  unint64_t entryCapacity;
  uint64_t v4;

  if (a3 < 0)
    return 1;
  entryCapacity = self->_entryCapacity;
  v4 = a3 - entryCapacity;
  if (a3 < entryCapacity)
    return 1;
  if (v4 <= 63)
    v4 = 63;
  return -[PLPositionalTable _setEntryCapacity:](self, "_setEntryCapacity:", entryCapacity + v4 + 1);
}

- (BOOL)_setEntryCapacity:(int64_t)a3
{
  os_unfair_lock_s *p_expansionLock;
  int64_t entryCapacity;
  BOOL v7;
  off_t v8;
  NSObject *v9;
  int descriptor;
  NSString *path;
  int *v12;
  char *v13;
  int v14;
  NSObject *v16;
  int v17;
  NSString *v18;
  int *v19;
  char *v20;
  _QWORD v21[4];
  uint8_t buf[4];
  int v23;
  __int16 v24;
  NSString *v25;
  __int16 v26;
  off_t v27;
  __int16 v28;
  char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  p_expansionLock = &self->_expansionLock;
  os_unfair_lock_lock(&self->_expansionLock);
  entryCapacity = self->_entryCapacity;
  if (entryCapacity != a3)
  {
    if (entryCapacity < a3)
    {
      v8 = self->_entryLength * a3;
      v21[0] = 12;
      v21[1] = 0;
      v21[2] = v8;
      v21[3] = 0;
      if (fcntl(self->_descriptor, 42, v21) == -1)
      {
        PLThumbnailsGetLog();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          descriptor = self->_descriptor;
          path = self->_path;
          v12 = __error();
          v13 = strerror(*v12);
          *(_DWORD *)buf = 67109890;
          v23 = descriptor;
          v24 = 2112;
          v25 = path;
          v26 = 2048;
          v27 = v8;
          v28 = 2080;
          v29 = v13;
          _os_log_impl(&dword_199DF7000, v9, OS_LOG_TYPE_DEBUG, "*** ImageTable expand: F_PREALLOCATE of %d %@ to %lld returned -1: error=%s", buf, 0x26u);
        }

      }
      if (ftruncate(self->_descriptor, v8) == -1)
      {
        PLThumbnailsGetLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          v17 = self->_descriptor;
          v18 = self->_path;
          v19 = __error();
          v20 = strerror(*v19);
          *(_DWORD *)buf = 67109890;
          v23 = v17;
          v24 = 2112;
          v25 = v18;
          v26 = 2048;
          v27 = v8;
          v28 = 2080;
          v29 = v20;
          _os_log_impl(&dword_199DF7000, v16, OS_LOG_TYPE_DEBUG, "*** ImageTable: ftruncate of %d %@ to %lld returned -1: error=%s", buf, 0x26u);
        }

        v14 = 0;
        goto LABEL_11;
      }
      self->_entryCapacity = a3;
    }
    v14 = 1;
LABEL_11:
    v7 = v14 != 0;
    goto LABEL_12;
  }
  v7 = 1;
LABEL_12:
  os_unfair_lock_unlock(p_expansionLock);
  return v7;
}

- (void)dealloc
{
  OSQueueHead *pool;
  int descriptor;
  objc_super v5;

  pool = (OSQueueHead *)self->_pool;
  if (pool)
    PLPositionalTableMemoryPool_Destroy(pool);
  descriptor = self->_descriptor;
  if (descriptor)
    close(descriptor);
  v5.receiver = self;
  v5.super_class = (Class)PLPositionalTable;
  -[PLPositionalTable dealloc](&v5, sel_dealloc);
}

- (int64_t)fileLength
{
  int descriptor;
  stat v4;

  descriptor = self->_descriptor;
  memset(&v4, 0, sizeof(v4));
  if (fstat(descriptor, &v4) == -1)
    return 0;
  else
    return v4.st_size;
}

- (id)fileStatistics
{
  void *v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PLPositionalTable entryCapacity](self, "entryCapacity");
  if (v4)
  {
    v6 = 0;
    v7 = 0;
    do
      v7 += -[PLPositionalTable isEmptyAtIndex:](self, "isEmptyAtIndex:", v6++);
    while (v4 != v6);
  }
  else
  {
    v7 = 0;
  }
  *(float *)&v5 = (float)((float)v4 - (float)v7) / (float)v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("spaceUtilization"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("capacity"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("countEmpty"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4 - v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("countFilled"));

  return v3;
}

- (BOOL)isEmptyAtIndex:(unint64_t)a3
{
  const void **v5;
  BOOL v6;
  uint64_t v8;

  -[PLPositionalTable entryLength](self, "entryLength");
  -[PLPositionalTable entryLength](self, "entryLength");
  if (self->_entryCapacity <= a3)
    return 0;
  v5 = (const void **)PLPositionalTableMemoryPool_Alloc((OSQueueHead *)-[PLPositionalTable pool](self, "pool"), (void *)-[PLPositionalTable entryLength](self, "entryLength"));
  v8 = 0;
  v6 = -[PLPositionalTable readDataAtIndex:intoPoolNode:bytesRead:](self, "readDataAtIndex:intoPoolNode:bytesRead:", a3, v5, &v8)&& !*(_BYTE *)*v5&& memcmp(*v5, (char *)*v5 + 1, v8 - 1) == 0;
  PLPositionalTableMemoryPool_Free((OSQueueHead **)v5);
  return v6;
}

- (Class)entriesClass
{
  return (Class)objc_opt_class();
}

- (id)readEntriesAtIndexes:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;
  uint64_t v12;

  v4 = a3;
  v5 = objc_msgSend(v4, "rangeCount");
  v6 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  if (v5)
    v5 = (uint64_t)malloc_type_calloc(1uLL, 8 * v5, 0x80040B8603338uLL);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __42__PLPositionalTable_readEntriesAtIndexes___block_invoke;
  v10[3] = &unk_1E376C008;
  v11 = v6;
  v12 = v5;
  v10[4] = self;
  v7 = v6;
  objc_msgSend(v4, "enumerateRangesWithOptions:usingBlock:", 0, v10);
  v8 = (void *)objc_msgSend(objc_alloc(-[PLPositionalTable entriesClass](self, "entriesClass")), "initWithBuffers:forIndexes:entryLength:", v5, v7, self->_entryLength);

  return v8;
}

- (void)touchEntriesInRange:(_NSRange)a3
{
  int descriptor;
  unint64_t entryLength;
  NSObject *v6;
  int v7;
  NSString *path;
  int *v9;
  char *v10;
  _QWORD v11[2];
  uint8_t buf[4];
  int v13;
  __int16 v14;
  NSString *v15;
  __int16 v16;
  char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  descriptor = self->_descriptor;
  if (descriptor)
  {
    entryLength = self->_entryLength;
    v11[0] = entryLength * a3.location;
    v11[1] = (entryLength * LODWORD(a3.length));
    if (fcntl(descriptor, 44, v11) == -1)
    {
      PLThumbnailsGetLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        v7 = self->_descriptor;
        path = self->_path;
        v9 = __error();
        v10 = strerror(*v9);
        *(_DWORD *)buf = 67109634;
        v13 = v7;
        v14 = 2112;
        v15 = path;
        v16 = 2080;
        v17 = v10;
        _os_log_impl(&dword_199DF7000, v6, OS_LOG_TYPE_DEBUG, "Failed to issue advisory read for file: %d at path: %@ with error=%s", buf, 0x1Cu);
      }

    }
  }
}

- (BOOL)writeEntryData:(id)a3 toIndex:(unint64_t)a4
{
  id v7;
  NSObject *v8;
  int descriptor;
  size_t entryLength;
  const void *v11;
  _BOOL4 flushAfterWrite;
  ssize_t v13;
  BOOL v14;
  void *v16;
  void *v17;
  uint8_t buf[16];

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPositionalTable.m"), 412, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data"));

  }
  if (objc_msgSend(v7, "length") != self->_entryLength)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPositionalTable.m"), 413, CFSTR("Data length must equal entry length."));

  }
  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    PLThumbnailsGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199DF7000, v8, OS_LOG_TYPE_DEFAULT, "Unable to write thumbnail data to index NSNotFound.", buf, 2u);
    }

    goto LABEL_13;
  }
  if (!-[PLPositionalTable _increaseEntryCapacityIfNeededToStoreIndex:](self, "_increaseEntryCapacityIfNeededToStoreIndex:", a4))
  {
LABEL_13:
    v14 = 0;
    goto LABEL_14;
  }
  descriptor = self->_descriptor;
  entryLength = self->_entryLength;
  v11 = (const void *)objc_msgSend(objc_retainAutorelease(v7), "bytes");
  flushAfterWrite = self->_flushAfterWrite;
  v13 = pwrite(descriptor, v11, entryLength, entryLength * a4);
  v14 = v13 == entryLength;
  if (flushAfterWrite && v13 == entryLength)
  {
    fsync(descriptor);
    v14 = 1;
  }
LABEL_14:

  return v14;
}

- (BOOL)deleteEntryAtIndex:(unint64_t)a3
{
  NSObject *v4;
  const char *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint32_t v8;
  void *v10;
  void *v11;
  int descriptor;
  size_t entryLength;
  _BOOL4 flushAfterWrite;
  ssize_t v15;
  ssize_t v16;
  int64_t entryCapacity;
  int v19;
  unint64_t v20;
  __int16 v21;
  int64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (self->_readOnly)
    goto LABEL_18;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    PLThumbnailsGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      v5 = "Unable to write thumbnail data to index NSNotFound.";
      v6 = v4;
      v7 = OS_LOG_TYPE_DEFAULT;
      v8 = 2;
LABEL_16:
      _os_log_impl(&dword_199DF7000, v6, v7, v5, (uint8_t *)&v19, v8);
      goto LABEL_17;
    }
    goto LABEL_17;
  }
  if (self->_entryCapacity <= a3)
  {
    PLThumbnailsGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      entryCapacity = self->_entryCapacity;
      v19 = 134218240;
      v20 = a3;
      v21 = 2048;
      v22 = entryCapacity;
      v5 = "Unable to delete thumbnail index: %lu that is out of range of the file (capacity: %lu)";
      v6 = v4;
      v7 = OS_LOG_TYPE_DEFAULT;
      v8 = 22;
      goto LABEL_16;
    }
LABEL_17:

LABEL_18:
    LOBYTE(v10) = 0;
    return (char)v10;
  }
  v10 = malloc_type_calloc(1uLL, self->_entryLength, 0x3BDE1024uLL);
  if (v10)
  {
    v11 = v10;
    descriptor = self->_descriptor;
    entryLength = self->_entryLength;
    flushAfterWrite = self->_flushAfterWrite;
    v15 = pwrite(descriptor, v10, entryLength, entryLength * a3);
    v16 = v15;
    if (flushAfterWrite && v15 == entryLength)
      fsync(descriptor);
    free(v11);
    if (v16 != entryLength)
    {
      PLThumbnailsGetLog();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        v19 = 134217984;
        v20 = a3;
        v5 = "Unable to write empty data to index: %lu";
        v6 = v4;
        v7 = OS_LOG_TYPE_DEBUG;
        v8 = 12;
        goto LABEL_16;
      }
      goto LABEL_17;
    }
    LOBYTE(v10) = 1;
  }
  return (char)v10;
}

- (void)flush
{
  int descriptor;

  descriptor = self->_descriptor;
  if (descriptor)
  {
    if (!self->_readOnly)
      fsync(descriptor);
  }
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  objc_storeStrong((id *)&self->_path, a3);
}

- (int64_t)entryCapacity
{
  return self->_entryCapacity;
}

- (void)setEntryCapacity:(int64_t)a3
{
  self->_entryCapacity = a3;
}

- (BOOL)flushAfterWrite
{
  return self->_flushAfterWrite;
}

- (void)setFlushAfterWrite:(BOOL)a3
{
  self->_flushAfterWrite = a3;
}

- (void)setEntryLength:(unint64_t)a3
{
  self->_entryLength = a3;
}

- (void)setIsReadOnly:(BOOL)a3
{
  self->_isReadOnly = a3;
}

- (int)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(int)a3
{
  self->_descriptor = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
}

void __42__PLPositionalTable_readEntriesAtIndexes___block_invoke(uint64_t a1, NSUInteger a2, size_t count)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  int *v14;
  char *v15;
  int v16;
  void *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  char *v23;
  uint64_t v24;
  NSRange v25;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = malloc_type_calloc(count, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), 0xB1768F49uLL);
  if (pread(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 24), v6, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) * count, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) * a2) == v7 * count)
  {
    v8 = *(_QWORD *)(a1 + 48);
    *(_QWORD *)(v8 + 8 * objc_msgSend(*(id *)(a1 + 40), "rangeCount")) = v6;
    objc_msgSend(*(id *)(a1 + 40), "addIndexesInRange:", a2, count);
  }
  else
  {
    PLThumbnailsGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v25.location = a2;
      v25.length = count;
      NSStringFromRange(v25);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(_DWORD *)(v11 + 24);
      v13 = *(_QWORD *)(v11 + 32);
      v14 = __error();
      v15 = strerror(*v14);
      v16 = 138544130;
      v17 = v10;
      v18 = 1024;
      v19 = v12;
      v20 = 2112;
      v21 = v13;
      v22 = 2080;
      v23 = v15;
      _os_log_impl(&dword_199DF7000, v9, OS_LOG_TYPE_DEFAULT, "Unable to read indexes in range: %{public}@ for file: %d at path: %@ with error=%s", (uint8_t *)&v16, 0x26u);

    }
    free(v6);
  }
}

@end
