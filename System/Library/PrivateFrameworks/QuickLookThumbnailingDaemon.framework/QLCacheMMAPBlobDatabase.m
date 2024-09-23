@implementation QLCacheMMAPBlobDatabase

- (id)copyBlobWithInfo:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  unint64_t v7;
  const void *v8;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unsigned __int8 *vmFile;
  uint64_t v14;
  NSObject *v16;
  unint64_t v17;
  uint64_t i;
  uint64_t v19;
  NSObject *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  size_t v26;
  unint64_t v27;
  uint64_t j;
  uint64_t v29;
  NSObject *v30;

  v4 = a3;
  if (!objc_msgSend(v4, "length"))
    goto LABEL_10;
  if ((unint64_t)objc_msgSend(v4, "location") <= 7)
  {
    _log_7();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[QLCacheMMAPBlobDatabase copyBlobWithInfo:].cold.1();
LABEL_9:

    goto LABEL_10;
  }
  if ((unint64_t)objc_msgSend(v4, "length") < 0x10
    || (v6 = objc_msgSend(v4, "location"),
        v7 = v6 + objc_msgSend(v4, "length") + 8,
        v7 > -[QLCacheFragHandler totalLen](self->_fragHandler, "totalLen")))
  {
    _log_7();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[QLCacheMMAPBlobDatabase copyBlobWithInfo:].cold.2();
    goto LABEL_9;
  }
  v8 = mmap(0, objc_msgSend(v4, "length"), 3, 4097, 1627389952, 0);
  if (!v8)
    goto LABEL_11;
  v10 = objc_msgSend(v4, "location");
  v11 = v10 - 8;
  v12 = objc_msgSend(v4, "length") + 16;
  vmFile = (unsigned __int8 *)self->_vmFile;
  v14 = -8;
  do
  {
    if (vmFile[v10 + v14] != v12)
    {
      v17 = 0;
      for (i = -1; i != -9; --i)
        v17 = vmFile[v10 + i] | (v17 << 8);
      v19 = MEMORY[0x1E0CD3398];
      v20 = *(NSObject **)(MEMORY[0x1E0CD3398] + 56);
      if (!v20)
      {
        QLTInitLogging();
        v20 = *(NSObject **)(v19 + 56);
      }
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[QLCacheMMAPBlobDatabase copyBlobWithInfo:].cold.7();
      _log_7();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[QLCacheMMAPBlobDatabase copyBlobWithInfo:].cold.6();
      goto LABEL_28;
    }
    v12 >>= 8;
  }
  while (!__CFADD__(v14++, 1));
  if (vm_copy(*MEMORY[0x1E0C83DA0], (vm_address_t)&vmFile[objc_msgSend(v4, "location")], objc_msgSend(v4, "length"), (vm_address_t)v8))
  {
    _log_7();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[QLCacheMMAPBlobDatabase copyBlobWithInfo:].cold.5(v4);
  }
  else
  {
    v21 = (char *)self->_vmFile;
    v22 = objc_msgSend(v4, "location");
    v23 = objc_msgSend(v4, "length");
    v24 = 0;
    v25 = &v21[v22 + v23];
    while (v25[v24] == v11)
    {
      v11 >>= 8;
      if (++v24 == 8)
      {
        v26 = objc_msgSend(v4, "length");
        v8 = dispatch_data_create(v8, v26, 0, (dispatch_block_t)*MEMORY[0x1E0C80CE8]);
        goto LABEL_11;
      }
    }
    v27 = 0;
    for (j = 7; j != -1; --j)
      v27 = v25[j] | (v27 << 8);
    v29 = MEMORY[0x1E0CD3398];
    v30 = *(NSObject **)(MEMORY[0x1E0CD3398] + 56);
    if (!v30)
    {
      QLTInitLogging();
      v30 = *(NSObject **)(v29 + 56);
    }
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      -[QLCacheMMAPBlobDatabase copyBlobWithInfo:].cold.4();
    _log_7();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[QLCacheMMAPBlobDatabase copyBlobWithInfo:].cold.3();
  }
LABEL_28:

  MEMORY[0x1D8273994](*MEMORY[0x1E0C83DA0], v8, objc_msgSend(v4, "length"));
LABEL_10:
  v8 = 0;
LABEL_11:

  return (id)v8;
}

- (void)save
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1D54AE000, v0, v1, "save blob database", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)markPurgeable
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  __error();
  OUTLINED_FUNCTION_17();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x18u);
  OUTLINED_FUNCTION_1_0();
}

- (QLCacheMMAPBlobDatabase)initWithPath:(id)a3 cacheSize:(int64_t)a4 cacheThread:(id)a5
{
  id v8;
  id v9;
  QLCacheMMAPBlobDatabase *v10;
  QLCacheMMAPBlobDatabase *v11;
  uint64_t v12;
  NSString *path;
  uint64_t v14;
  NSMutableArray *reservedBuffers;
  objc_super v17;

  v8 = a3;
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)QLCacheMMAPBlobDatabase;
  v10 = -[QLCacheMMAPBlobDatabase init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_file = -1;
    v12 = objc_msgSend(v8, "copy");
    path = v11->_path;
    v11->_path = (NSString *)v12;

    v11->_maxSize = a4;
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 40);
    reservedBuffers = v11->_reservedBuffers;
    v11->_reservedBuffers = (NSMutableArray *)v14;

    objc_storeWeak((id *)&v11->_cacheThread, v9);
  }

  return v11;
}

- (BOOL)deleteBlobWithInfo:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  QLCacheFragHandler **p_fragHandler;
  QLCacheFragHandler *fragHandler;
  unint64_t v9;
  NSObject *v10;
  NSObject *v11;
  BOOL v12;

  v4 = a3;
  if (!objc_msgSend(v4, "length"))
  {
LABEL_6:
    v12 = 0;
    goto LABEL_10;
  }
  v5 = objc_msgSend(v4, "location");
  v6 = v5 + objc_msgSend(v4, "length") + 8;
  fragHandler = self->_fragHandler;
  p_fragHandler = &self->_fragHandler;
  v9 = -[QLCacheFragHandler totalLen](fragHandler, "totalLen");
  _log_7();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v6 > v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[QLCacheMMAPBlobDatabase deleteBlobWithInfo:].cold.1(v4, (id *)p_fragHandler);

    goto LABEL_6;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[QLCacheMMAPBlobDatabase deleteBlobWithInfo:].cold.2();

  -[QLCacheFragHandler releaseSpaceAtPos:withLen:](*p_fragHandler, "releaseSpaceAtPos:withLen:", objc_msgSend(v4, "location") - 8, objc_msgSend(v4, "length") + 16);
  v12 = 1;
LABEL_10:

  return v12;
}

- (BOOL)deleteBlobsWithArray:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    v8 = 1;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v8 &= -[QLCacheMMAPBlobDatabase deleteBlobWithInfo:](self, "deleteBlobWithInfo:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i));
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  else
  {
    LOBYTE(v8) = 1;
  }

  return v8;
}

- (void)compactFragmentation
{
  -[QLCacheFragHandler compact](self->_fragHandler, "compact");
  -[QLCacheFragHandler truncateUselessSpaceAtEndOfFile](self->_fragHandler, "truncateUselessSpaceAtEndOfFile");
}

- (BOOL)doesExist
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString stringByAppendingPathExtension:](self->_path, "stringByAppendingPathExtension:", CFSTR("data"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:", v4);

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString stringByAppendingPathExtension:](self->_path, "stringByAppendingPathExtension:", CFSTR("fraghandler"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "fileExistsAtPath:", v7);

  _log_7();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
  if ((v5 & v8) == 1)
  {
    if (v10)
      -[QLCacheMMAPBlobDatabase doesExist].cold.1(v9, v11, v12);
  }
  else if (v10)
  {
    -[QLCacheMMAPBlobDatabase doesExist].cold.2(v5, v8, v9);
  }

  return v5 & v8;
}

- (float)fragmentation
{
  float result;

  -[QLCacheFragHandler frag](self->_fragHandler, "frag");
  return result;
}

- (id)cacheHolesOrderedByStart
{
  return -[QLCacheFragHandler orderedByStart](self->_fragHandler, "orderedByStart");
}

- (unint64_t)size
{
  return -[QLCacheFragHandler totalLen](self->_fragHandler, "totalLen");
}

- (void)open
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6_0();
  v3 = 2048;
  v4 = v0;
  OUTLINED_FUNCTION_7(&dword_1D54AE000, v1, (uint64_t)v1, "open with blob location %@ with max size : %lld", v2);
  OUTLINED_FUNCTION_5();
}

- (BOOL)isValid
{
  int file;
  _BOOL4 v4;
  NSObject *v5;
  NSObject *v6;
  QLCacheFragHandler **p_fragHandler;
  NSObject *v8;
  NSString **p_path;
  NSString *path;
  id v11;
  int v12;
  NSObject *v13;
  off_t st_size;
  NSObject *v15;
  BOOL v16;
  stat v18;

  file = self->_file;
  v4 = file != -1;
  if (file == -1)
  {
    _log_7();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[QLCacheMMAPBlobDatabase isValid].cold.7();

  }
  if (self->_vmFile == (void *)-1)
  {
    _log_7();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[QLCacheMMAPBlobDatabase isValid].cold.6();

    v4 = 0;
  }
  p_fragHandler = &self->_fragHandler;
  if (!-[QLCacheFragHandler checkConsistency](self->_fragHandler, "checkConsistency"))
  {
    _log_7();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[QLCacheMMAPBlobDatabase isValid].cold.5();

    v4 = 0;
  }
  memset(&v18, 0, sizeof(v18));
  path = self->_path;
  p_path = &self->_path;
  -[NSString stringByAppendingPathExtension:](path, "stringByAppendingPathExtension:", CFSTR("data"), 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v12 = lstat((const char *)objc_msgSend(v11, "fileSystemRepresentation"), &v18);

  if (v12)
  {
    _log_7();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[QLCacheMMAPBlobDatabase isValid].cold.4((id *)p_path);
LABEL_23:

    goto LABEL_24;
  }
  st_size = v18.st_size;
  if (st_size != -[QLCacheFragHandler totalLen](*p_fragHandler, "totalLen"))
  {
    _log_7();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[QLCacheMMAPBlobDatabase isValid].cold.3((uint64_t)&v18.st_size, (id *)p_fragHandler);
    goto LABEL_23;
  }
  if (!v4)
  {
LABEL_24:
    _log_7();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[QLCacheMMAPBlobDatabase isValid].cold.2();
    v16 = 0;
    goto LABEL_27;
  }
  _log_7();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[QLCacheMMAPBlobDatabase isValid].cold.1();
  v16 = 1;
LABEL_27:

  return v16;
}

- (id)checkConsistency:(id)a3
{
  void *v4;
  QLCacheFragHandler *v5;
  void *v6;
  QLCacheFragHandler *v7;
  _BOOL4 v8;
  void *v9;
  unint64_t v10;
  id v11;
  int v12;
  const __CFString *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  off_t st_size;
  unint64_t v34;
  void *v35;
  unint64_t v36;
  QLCacheFragHandler *v37;
  id obj;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  stat v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "sortedArrayWithOptions:usingComparator:", 1, &__block_literal_global_5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [QLCacheFragHandler alloc];
  -[QLCacheMMAPBlobDatabase cacheThread](self, "cacheThread");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[QLCacheFragHandler initWithCacheThread:](v5, "initWithCacheThread:", v6);

  -[QLCacheFragHandler compact](self->_fragHandler, "compact");
  -[QLCacheFragHandler truncateUselessSpaceAtEndOfFile](self->_fragHandler, "truncateUselessSpaceAtEndOfFile");
  -[QLCacheMMAPBlobDatabase save](self, "save");
  v8 = -[QLCacheFragHandler checkConsistency](self->_fragHandler, "checkConsistency");
  if (v8)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendFormat:", CFSTR("inconsistent frag handler"));
  }
  memset(&v43, 0, sizeof(v43));
  v10 = -[QLCacheFragHandler totalLen](self->_fragHandler, "totalLen");
  -[NSString stringByAppendingPathExtension:](self->_path, "stringByAppendingPathExtension:", CFSTR("data"));
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v12 = lstat((const char *)objc_msgSend(v11, "fileSystemRepresentation"), &v43);

  if (v12)
  {
    if (v9)
    {
      if (v8)
      {
LABEL_8:
        v13 = CFSTR("blob file unreadable");
LABEL_15:
        objc_msgSend(v9, "appendFormat:", v13, st_size, v34);
        v14 = 1;
        goto LABEL_16;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37A0], "string");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
        goto LABEL_8;
    }
    objc_msgSend(v9, "appendString:", CFSTR(" - "));
    goto LABEL_8;
  }
  if (v43.st_size < v10)
  {
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB37A0], "string");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (!v8)
      objc_msgSend(v9, "appendString:", CFSTR(" - "));
    st_size = v43.st_size;
    v34 = v10;
    v13 = CFSTR("inconsistent blob length (%llu vs. %llu)");
    goto LABEL_15;
  }
  v14 = !v8;
  v36 = v10;
  v37 = v7;
  -[QLCacheFragHandler allocateSpaceForLength:added:](v7, "allocateSpaceForLength:added:", v10, 0);
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v4;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (!v15)
  {
    v17 = 0;
    goto LABEL_52;
  }
  v16 = v15;
  v35 = v4;
  v17 = 0;
  v18 = *(_QWORD *)v40;
  while (2)
  {
    for (i = 0; i != v16; ++i)
    {
      if (*(_QWORD *)v40 != v18)
        objc_enumerationMutation(obj);
      v20 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
      v21 = objc_msgSend(v20, "length");
      v22 = objc_msgSend(v20, "location");
      v23 = v22;
      if (!v21)
      {
        if (!v22)
          continue;
        if (!v9)
        {
          objc_msgSend(MEMORY[0x1E0CB37A0], "string");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v4 = v35;
        v7 = v37;
        if (!v8)
          objc_msgSend(v9, "appendString:", CFSTR(" - "));
        v27 = CFSTR("zero length block with non zero location");
LABEL_51:
        objc_msgSend(v9, "appendFormat:", v27);
        v14 = 1;
        goto LABEL_52;
      }
      if (v22 <= 7)
      {
        if (!v9)
        {
          objc_msgSend(MEMORY[0x1E0CB37A0], "string");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v4 = v35;
        v7 = v37;
        if (!v8)
          objc_msgSend(v9, "appendString:", CFSTR(" - "));
        v27 = CFSTR("negative blob location");
        goto LABEL_51;
      }
      v24 = objc_msgSend(v20, "length");
      v25 = v23 - 8 - v17;
      if (v23 - 8 < v17)
      {
        if (!v9)
        {
          objc_msgSend(MEMORY[0x1E0CB37A0], "string");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v4 = v35;
        v7 = v37;
        if (!v8)
          objc_msgSend(v9, "appendString:", CFSTR(" - "), v25);
        v27 = CFSTR("overlapping blobs");
        goto LABEL_51;
      }
      v26 = v24;
      if (v23 - 8 > v17)
        -[QLCacheFragHandler releaseSpaceAtPos:withLen:](v37, "releaseSpaceAtPos:withLen:", v17, v25);
      v17 = v23 + v26 + 8;
    }
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    if (v16)
      continue;
    break;
  }
  v4 = v35;
  v7 = v37;
  v14 = !v8;
LABEL_52:

  if (!v9 && v36 > v17)
  {
    -[QLCacheFragHandler releaseSpaceAtPos:withLen:](v7, "releaseSpaceAtPos:withLen:", v17, v36 - v17);
    goto LABEL_55;
  }
LABEL_16:
  if (!v9)
  {
LABEL_55:
    -[QLCacheFragHandler compact](v7, "compact");
    -[QLCacheFragHandler orderedByStart](v7, "orderedByStart");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLCacheFragHandler orderedByStart](self->_fragHandler, "orderedByStart");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v28, "isEqual:", v29) & 1) != 0)
    {
      v9 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37A0], "string");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v30;
      if (v14)
        objc_msgSend(v30, "appendString:", CFSTR(" - "));
      objc_msgSend(v9, "appendFormat:", CFSTR("desynchronized fragmentation"));
      _log_7();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        -[QLCacheMMAPBlobDatabase checkConsistency:].cold.1(v28, v29);

    }
  }

  return v9;
}

uint64_t __44__QLCacheMMAPBlobDatabase_checkConsistency___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  unint64_t v5;
  unint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(a2, "location");
  v6 = objc_msgSend(v4, "location");

  if (v5 < v6)
    return -1;
  else
    return v5 > v6;
}

- (BOOL)isOpen
{
  return self->_file != -1;
}

- (void)close
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  __error();
  OUTLINED_FUNCTION_14_0(&dword_1D54AE000, v0, v1, "can not truncate the blob file %d", v2, v3, v4, v5, 0);
  OUTLINED_FUNCTION_5();
}

- (void)reset
{
  id v3;
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  -[NSString stringByAppendingPathExtension:](self->_path, "stringByAppendingPathExtension:", CFSTR("data"));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  unlink((const char *)objc_msgSend(v3, "fileSystemRepresentation"));

  -[NSString stringByAppendingPathExtension:](self->_path, "stringByAppendingPathExtension:", CFSTR("fraghandler"));
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  unlink((const char *)objc_msgSend(v4, "fileSystemRepresentation"));

  _log_7();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D54AE000, v5, OS_LOG_TYPE_INFO, "reset blob database", v6, 2u);
  }

}

- (id)reserveBufferWithLength:(unint64_t)a3
{
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  NSObject *v9;
  unint64_t maxSize;
  NSObject *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  unint64_t v17;
  unint64_t v18;
  size_t v19;
  QLCacheBlobInfo *v20;
  NSObject *v21;
  char v22;
  uint8_t buf[4];
  unint64_t v24;
  __int16 v25;
  unint64_t v26;
  __int16 v27;
  unint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = -[QLCacheFragHandler totalLen](self->_fragHandler, "totalLen");
  if (!a3)
    return 0;
  v6 = v5;
  v22 = 0;
  v7 = a3 + 16;
  v8 = -[QLCacheFragHandler allocateSpaceForLength:added:](self->_fragHandler, "allocateSpaceForLength:added:", a3 + 16, &v22);
  if (-[QLCacheFragHandler totalLen](self->_fragHandler, "totalLen") > self->_maxSize)
  {
    -[QLCacheFragHandler releaseSpaceAtPos:withLen:](self->_fragHandler, "releaseSpaceAtPos:withLen:", v8, a3 + 16);
    _log_7();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      maxSize = self->_maxSize;
      *(_DWORD *)buf = 134218496;
      v24 = v8;
      v25 = 2048;
      v26 = a3;
      v27 = 2048;
      v28 = maxSize;
      _os_log_impl(&dword_1D54AE000, v9, OS_LOG_TYPE_INFO, "we can't write the blob, it's out of the limit location %llu length %llu limit %llu", buf, 0x20u);
    }

    return 0;
  }
  if (v22)
  {
    _log_7();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v24 = v7 + v8;
      _os_log_debug_impl(&dword_1D54AE000, v12, OS_LOG_TYPE_DEBUG, "new file size %lld", buf, 0xCu);
    }

    if (ftruncate(self->_file, -[QLCacheFragHandler totalLen](self->_fragHandler, "totalLen")) == -1)
    {
      _log_7();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[QLCacheMMAPBlobDatabase reserveBufferWithLength:].cold.1();

      -[QLCacheFragHandler releaseSpaceAtPos:withLen:](self->_fragHandler, "releaseSpaceAtPos:withLen:", v8, v7);
      return 0;
    }
  }
  v13 = 0;
  v14 = (char *)self->_vmFile + v8;
  do
  {
    v14[v13] = v7;
    v7 >>= 8;
    ++v13;
  }
  while (v13 != 8);
  v15 = 0;
  v16 = (char *)self->_vmFile + v8 + a3 + 8;
  v17 = v8;
  do
  {
    v16[v15] = v17;
    v17 >>= 8;
    ++v15;
  }
  while (v15 != 8);
  v18 = v8 + 8;
  if (v6 > v8 + 8)
  {
    if (v18 + a3 >= v6)
      v19 = v6 - (v8 + 8);
    else
      v19 = a3;
    bzero((char *)self->_vmFile + v8 + 8, v19);
  }
  v20 = objc_alloc_init(QLCacheBlobInfo);
  -[QLCacheBlobInfo setLocation:](v20, "setLocation:", v18);
  -[QLCacheBlobInfo setLength:](v20, "setLength:", a3);
  -[NSMutableArray addObject:](self->_reservedBuffers, "addObject:", v20);
  return v20;
}

- (void)bufferPointedToByBlobInfo:(id)a3
{
  char *vmFile;

  vmFile = (char *)self->_vmFile;
  return &vmFile[objc_msgSend(a3, "location")];
}

- (void)discardReservedBufferWithBlobInfo:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[NSMutableArray removeObject:](self->_reservedBuffers, "removeObject:", v4);
    _log_7();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[QLCacheMMAPBlobDatabase discardReservedBufferWithBlobInfo:].cold.1();

    -[QLCacheFragHandler releaseSpaceAtPos:withLen:](self->_fragHandler, "releaseSpaceAtPos:withLen:", objc_msgSend(v4, "location") - 8, objc_msgSend(v4, "length") + 16);
  }

}

- (void)validateReservedBufferWithBlobInfo:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = -[NSMutableArray indexOfObject:](self->_reservedBuffers, "indexOfObject:", v4);
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v6 = v5;
      _log_7();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        -[QLCacheMMAPBlobDatabase validateReservedBufferWithBlobInfo:].cold.1();

      -[NSMutableArray removeObjectAtIndex:](self->_reservedBuffers, "removeObjectAtIndex:", v6);
    }
  }

}

- (unint64_t)maxSize
{
  return self->_maxSize;
}

- (_QLCacheThread)cacheThread
{
  return (_QLCacheThread *)objc_loadWeakRetained((id *)&self->_cacheThread);
}

- (void)setCacheThread:(id)a3
{
  objc_storeWeak((id *)&self->_cacheThread, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cacheThread);
  objc_storeStrong((id *)&self->_reservedBuffers, 0);
  objc_storeStrong((id *)&self->_fragHandler, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

- (void)copyBlobWithInfo:.cold.1()
{
  void *v0;
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_10(v0, v1);
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_3_3(&dword_1D54AE000, v2, v3, "problem blob location, %llu %llu", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_1_0();
}

- (void)copyBlobWithInfo:.cold.2()
{
  void *v0;
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_10(v0, v1);
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_3_3(&dword_1D54AE000, v2, v3, "problem blob length, %llu %llu", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_1_0();
}

- (void)copyBlobWithInfo:.cold.3()
{
  void *v0;
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_10(v0, v1);
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_3_3(&dword_1D54AE000, v2, v3, "problem blob, no suffix %llu %llu", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_1_0();
}

- (void)copyBlobWithInfo:.cold.4()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = 136316162;
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_16(&dword_1D54AE000, v0, v1, "%s marker mismatch 0x%08llx vs. 0x%08llx (%llu vs %llu)", v2, v3, v4, v5, v6);
}

- (void)copyBlobWithInfo:(void *)a1 .cold.5(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "length");
  __error();
  OUTLINED_FUNCTION_0_0(&dword_1D54AE000, v1, v2, "problem with vm_copy, length %lld, errno %d", v3, v4, v5, v6, 0);
  OUTLINED_FUNCTION_3_2();
}

- (void)copyBlobWithInfo:.cold.6()
{
  void *v0;
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_10(v0, v1);
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_3_3(&dword_1D54AE000, v2, v3, "problem blob, no prefix, %llu %llu", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_1_0();
}

- (void)copyBlobWithInfo:.cold.7()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = 136316162;
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_16(&dword_1D54AE000, v0, v1, "%s marker mismatch 0x%08llx vs. 0x%08llx (%llu vs %llu)", v2, v3, v4, v5, v6);
}

- (void)deleteBlobWithInfo:(void *)a1 .cold.1(void *a1, id *a2)
{
  void *v4;
  os_log_t v5;
  os_log_type_t v6;
  const char *v7;
  uint8_t *v8;

  objc_msgSend(a1, "location");
  objc_msgSend(a1, "length");
  objc_msgSend(a1, "location");
  objc_msgSend(a1, "length");
  objc_msgSend(*a2, "totalLen");
  OUTLINED_FUNCTION_17();
  _os_log_error_impl(v4, v5, v6, v7, v8, 0x2Au);
}

- (void)deleteBlobWithInfo:.cold.2()
{
  void *v0;
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_10(v0, v1);
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_4_3(&dword_1D54AE000, v2, v3, "blob deleted at %lld with size %lld", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_1_0();
}

- (void)doesExist
{
  const __CFString *v3;
  const __CFString *v4;
  int v5;
  const __CFString *v6;
  __int16 v7;
  const __CFString *v8;
  uint64_t v9;

  v3 = CFSTR("NO");
  v9 = *MEMORY[0x1E0C80C00];
  if ((a1 & 1) != 0)
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  if ((a2 & 1) != 0)
    v3 = CFSTR("YES");
  v5 = 138412546;
  v6 = v4;
  v7 = 2112;
  v8 = v3;
  OUTLINED_FUNCTION_7(&dword_1D54AE000, a3, (uint64_t)a3, "data file exists %@, frag handler file exists %@", (uint8_t *)&v5);
  OUTLINED_FUNCTION_5();
}

- (void)isValid
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1D54AE000, v0, v1, "the blob database is not opened", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)checkConsistency:(void *)a1 .cold.1(void *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "description");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_3(&dword_1D54AE000, v4, v5, "Constructed holes list:\n\t%@\nStored holes list:\n\t%@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_1_0();
}

- (void)reserveBufferWithLength:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1D54AE000, v0, v1, "problem to increase the size of the file", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)discardReservedBufferWithBlobInfo:.cold.1()
{
  void *v0;
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_10(v0, v1);
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_4_3(&dword_1D54AE000, v2, v3, "discard buffer location %lld length %lld", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_1_0();
}

- (void)validateReservedBufferWithBlobInfo:.cold.1()
{
  void *v0;
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_10(v0, v1);
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_4_3(&dword_1D54AE000, v2, v3, "validate buffer location %lld length %lld", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_1_0();
}

@end
