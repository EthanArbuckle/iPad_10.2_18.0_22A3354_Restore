@implementation PLFetchRecording

- (void)_indexLocked_unmapFile
{
  void *indexLocked_buffer;
  size_t indexLocked_bufferLen;

  os_unfair_lock_assert_owner(&self->_indexLock);
  indexLocked_buffer = self->_indexLocked_buffer;
  if (indexLocked_buffer)
  {
    indexLocked_bufferLen = self->_indexLocked_bufferLen;
    if (indexLocked_bufferLen)
    {
      munmap(indexLocked_buffer, indexLocked_bufferLen);
      self->_indexLocked_buffer = 0;
      self->_indexLocked_bufferLen = 0;
    }
  }
}

- (BOOL)_indexLocked_remapFile
{
  int v3;
  int fd;
  size_t st_size;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  NSURL *url;
  char *v11;
  stat v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->_indexLock);
  -[NSMutableDictionary enumerateKeysAndObjectsWithOptions:usingBlock:](self->_indexLocked_indexEntriesByNormSQLHash, "enumerateKeysAndObjectsWithOptions:usingBlock:", 0, &__block_literal_global_57438);
  -[PLFetchRecording _indexLocked_unmapFile](self, "_indexLocked_unmapFile");
  if (self->_mode)
    v3 = 3;
  else
    v3 = 1;
  fd = self->_fd;
  memset(&v13, 0, sizeof(v13));
  if (fstat(fd, &v13) == -1)
    st_size = 0;
  else
    st_size = v13.st_size;
  v6 = mmap(0, st_size, v3, 1, self->_fd, 0);
  v7 = v6;
  if (v6 == (void *)-1)
  {
    v8 = *__error();
    PLBackendGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      url = self->_url;
      v11 = strerror(v8);
      v13.st_dev = 138412802;
      *(_QWORD *)&v13.st_mode = url;
      WORD2(v13.st_ino) = 2080;
      *(__darwin_ino64_t *)((char *)&v13.st_ino + 6) = (__darwin_ino64_t)v11;
      HIWORD(v13.st_gid) = 1024;
      v13.st_rdev = v8;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "LOFR Could not remap recording file at: %@, %s (%d)", (uint8_t *)&v13, 0x1Cu);
    }

  }
  else
  {
    self->_indexLocked_buffer = v6;
    self->_indexLocked_bufferLen = st_size;
  }
  -[NSMutableDictionary enumerateKeysAndObjectsWithOptions:usingBlock:](self->_indexLocked_indexEntriesByNormSQLHash, "enumerateKeysAndObjectsWithOptions:usingBlock:", 0, &__block_literal_global_31_57440);
  return v7 != (void *)-1;
}

- (void)_indexLocked_close
{
  int fd;

  -[PLFetchRecording _indexLocked_unmapFile](self, "_indexLocked_unmapFile");
  fd = self->_fd;
  if ((fd & 0x80000000) == 0)
  {
    close(fd);
    self->_fd = -1;
  }
}

- (BOOL)_isOpen
{
  return (self->_fd & 0x80000000) == 0 && self->_indexLocked_buffer != (void *)-1 && self->_indexLocked_bufferLen != 0;
}

- (void)_recordVariationWithEntryHeader:(PLFetchRecordingFileNormalizedStatementHeader *)a3 timestamp:(double)a4 pagesHit:(unsigned int)a5 pagesMissed:(unsigned int)a6 rowsAffected:(unsigned int)a7 duration:(double)a8 QOS:(unsigned int)a9
{
  char *v16;
  unsigned int var10_high;
  char var11;
  char v19;

  v16 = (char *)a3
      + 32 * LOBYTE(a3->var11)
      + *(unsigned __int16 *)((char *)&a3->var9 + 5)
      + *(unsigned __int16 *)((char *)&a3->var9 + 7)
      + (unint64_t)*(unsigned __int16 *)((char *)&a3->var10 + 1)
      + *(unsigned __int16 *)((char *)&a3->var10 + 3)
      + *(unsigned __int16 *)((char *)&a3->var10 + 5);
  objc_msgSend((id)objc_opt_class(), "_assertAddress:isValidWithLength:buffer:bufferLength:", v16 + 109, 32, self->_indexLocked_buffer, self->_indexLocked_bufferLen);
  *(double *)(v16 + 109) = a4;
  *(_DWORD *)(v16 + 117) = a9;
  *(double *)(v16 + 121) = a8;
  *(_DWORD *)(v16 + 133) = a6;
  *(_DWORD *)(v16 + 129) = a5;
  *(_DWORD *)(v16 + 137) = a7;
  var10_high = HIBYTE(a3->var10);
  if (var10_high <= 4)
    HIBYTE(a3->var10) = var10_high + 1;
  var11 = a3->var11;
  if ((var11 + 1) <= 4u)
    v19 = var11 + 1;
  else
    v19 = 0;
  LOBYTE(a3->var11) = v19;
}

- (void)_scheduleRemapAfterDelay
{
  void *v3;
  dispatch_time_t v4;
  NSObject *remapQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = (void *)os_transaction_create();
  v4 = dispatch_time(0, 1000000000);
  remapQueue = self->_remapQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__PLFetchRecording__scheduleRemapAfterDelay__block_invoke;
  v7[3] = &unk_1E3677C18;
  v7[4] = self;
  v8 = v3;
  v6 = v3;
  dispatch_after(v4, remapQueue, v7);

}

- (void)_considerIfRemapIsNeeded
{
  unsigned int v2;
  atomic_flag *p_remapPending;
  unsigned __int8 v5;

  v2 = atomic_load((unsigned int *)&self->_numberOfAllocationsSinceLastRemap);
  if (v2 >= 0x32)
  {
    p_remapPending = &self->_remapPending;
    do
      v5 = __ldaxr((unsigned __int8 *)p_remapPending);
    while (__stlxr(1u, (unsigned __int8 *)p_remapPending));
    if ((v5 & 1) == 0)
    {
      -[PLFetchRecording _scheduleRemapAfterDelay](self, "_scheduleRemapAfterDelay");
      atomic_store(0, (unsigned int *)&self->_numberOfAllocationsSinceLastRemap);
    }
  }
}

- (PLFetchRecording)initWithMode:(unint64_t)a3 atFileURL:(id)a4 size:(unint64_t)a5
{
  id v9;
  PLFetchRecording *v10;
  PLFetchRecording *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *remapQueue;
  id v14;
  const char *v15;
  int v16;
  int v17;
  int v18;
  uint64_t v19;
  NSURL *url;
  _BOOL4 v21;
  BOOL v22;
  uint64_t v23;
  NSString *fileVersion;
  uint64_t v25;
  uint64_t v26;
  NSMutableDictionary *indexLocked_indexEntriesByNormSQLHash;
  PLFetchRecording *v28;
  int v29;
  NSObject *v30;
  char *v31;
  NSObject *v32;
  int *v33;
  char *v34;
  NSObject *v35;
  NSString *v36;
  NSObject *v37;
  int *v38;
  char *v39;
  NSObject *v40;
  void *v42;
  void *v43;
  objc_super v44;
  stat v45;
  uint8_t buf[4];
  int v47;
  __int16 v48;
  char *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  if (v9)
  {
    if (!a3)
      goto LABEL_5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLFetchRecording.m"), 688, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("url"));

    if (!a3)
      goto LABEL_5;
  }
  if (a5 <= 0xEA)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLFetchRecording.m"), 689, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mode == PLFetchRecordingFileModeReadOnly || fileSize > sizeof(PLFetchRecordingFileHeader)"));

  }
LABEL_5:
  v44.receiver = self;
  v44.super_class = (Class)PLFetchRecording;
  v10 = -[PLFetchRecording init](&v44, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_fd = -1;
    v12 = dispatch_queue_create("com.apple.photos.fetchrecorder.remapqueue", 0);
    remapQueue = v11->_remapQueue;
    v11->_remapQueue = (OS_dispatch_queue *)v12;

    objc_msgSend(v9, "path");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v15 = (const char *)objc_msgSend(v14, "fileSystemRepresentation");

    if (a3)
      v16 = open(v15, 514, 436);
    else
      v16 = open(v15, 0, 436);
    if (v16 == -1)
    {
      v29 = *__error();
      PLBackendGetLog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v31 = strerror(v29);
        v45.st_dev = 136315650;
        *(_QWORD *)&v45.st_mode = v15;
        WORD2(v45.st_ino) = 2080;
        *(__darwin_ino64_t *)((char *)&v45.st_ino + 6) = (__darwin_ino64_t)v31;
        HIWORD(v45.st_gid) = 1024;
        v45.st_rdev = v29;
        _os_log_impl(&dword_199541000, v30, OS_LOG_TYPE_ERROR, "LOFR Could not open recording file at path %s: %s (%d)", (uint8_t *)&v45, 0x1Cu);
      }

      goto LABEL_49;
    }
    v17 = v16;
    if (a3 != 1 || (memset(&v45, 0, sizeof(v45)), fstat(v16, &v45) != -1) && v45.st_size)
    {
      v18 = 0;
      goto LABEL_14;
    }
    if (a5 && v17 >= 1)
    {
      *(_QWORD *)&v45.st_dev = 0x300000006;
      v45.st_ino = 0;
      *(_QWORD *)&v45.st_uid = a5;
      *(_QWORD *)&v45.st_rdev = 0;
      if (fcntl(v17, 42, &v45) == -1)
      {
        PLBackendGetLog();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          v33 = __error();
          v34 = strerror(*v33);
          *(_DWORD *)buf = 67109378;
          v47 = v17;
          v48 = 2080;
          v49 = v34;
          _os_log_impl(&dword_199541000, v32, OS_LOG_TYPE_ERROR, "LOFR expand: F_PREALLOCATE of %d returned -1: error=%s", buf, 0x12u);
        }

      }
      if (ftruncate(v17, a5) != -1)
      {
        v18 = 1;
LABEL_14:
        v11->_maxFileSize = a5;
        v11->_indexLock._os_unfair_lock_opaque = 0;
        v19 = objc_msgSend(v9, "copy");
        url = v11->_url;
        v11->_url = (NSURL *)v19;

        v11->_mode = a3;
        v11->_fd = v17;
        atomic_store(0, (unsigned int *)&v11->_numberOfAllocationsSinceLastRemap);
        os_unfair_lock_lock(&v11->_indexLock);
        v21 = -[PLFetchRecording _indexLocked_remapFile](v11, "_indexLocked_remapFile");
        v22 = v21;
        if ((v18 & 1) != 0 || !v21)
        {
LABEL_20:
          os_unfair_lock_unlock(&v11->_indexLock);
          if (v22)
          {
            if (v18)
            {
              objc_msgSend((id)objc_opt_class(), "_writeInitialHeaderToBuffer:bufferLen:", v11->_indexLocked_buffer, v11->_indexLocked_bufferLen);
              v11->_fileHeaderSize = 234;
            }
            if (a3 == 1)
            {
              os_unfair_lock_lock(&v11->_indexLock);
              objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
              v26 = objc_claimAutoreleasedReturnValue();
              objc_msgSend((id)objc_opt_class(), "_indexLocked_populateStatementIndex:fromBuffer:bufferLength:fileHeaderSize:fileVersion:", v26, v11->_indexLocked_buffer, v11->_indexLocked_bufferLen, v11->_fileHeaderSize, v11->_fileVersion);
              indexLocked_indexEntriesByNormSQLHash = v11->_indexLocked_indexEntriesByNormSQLHash;
              v11->_indexLocked_indexEntriesByNormSQLHash = (NSMutableDictionary *)v26;

              os_unfair_lock_unlock(&v11->_indexLock);
            }
            goto LABEL_25;
          }
          goto LABEL_48;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", (char *)v11->_indexLocked_buffer + 2, 4);
        v23 = objc_claimAutoreleasedReturnValue();
        fileVersion = v11->_fileVersion;
        v11->_fileVersion = (NSString *)v23;

        if (-[NSString isEqualToString:](v11->_fileVersion, "isEqualToString:", CFSTR("0.54"))
          || -[NSString isEqualToString:](v11->_fileVersion, "isEqualToString:", CFSTR("0.53")))
        {
          v25 = 234;
LABEL_19:
          v11->_fileHeaderSize = v25;
          goto LABEL_20;
        }
        if (-[NSString isEqualToString:](v11->_fileVersion, "isEqualToString:", CFSTR("0.52")))
        {
          v25 = 228;
          goto LABEL_19;
        }
        PLBackendGetLog();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        {
          v36 = v11->_fileVersion;
          v45.st_dev = 138412546;
          *(_QWORD *)&v45.st_mode = v36;
          WORD2(v45.st_ino) = 2112;
          *(__darwin_ino64_t *)((char *)&v45.st_ino + 6) = (__darwin_ino64_t)v9;
          _os_log_impl(&dword_199541000, v35, OS_LOG_TYPE_ERROR, "PLFetchRecording: reader does not recognize file version: %@ for file at url: %@", (uint8_t *)&v45, 0x16u);
        }

        -[PLFetchRecording _indexLocked_unmapFile](v11, "_indexLocked_unmapFile");
        os_unfair_lock_unlock(&v11->_indexLock);
LABEL_48:
        close(v17);
LABEL_49:
        v28 = 0;
        goto LABEL_50;
      }
      PLBackendGetLog();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        v38 = __error();
        v39 = strerror(*v38);
        *(_DWORD *)buf = 67109378;
        v47 = v17;
        v48 = 2080;
        v49 = v39;
        _os_log_impl(&dword_199541000, v37, OS_LOG_TYPE_ERROR, "LOFR expand: F_TRUNCATE of %d returned -1: error=%s", buf, 0x12u);
      }

    }
    PLBackendGetLog();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      v45.st_dev = 134217984;
      *(_QWORD *)&v45.st_mode = a5;
      _os_log_impl(&dword_199541000, v40, OS_LOG_TYPE_ERROR, "LOFR Could not expand empty file to specified size: %ld", (uint8_t *)&v45, 0xCu);
    }

    goto LABEL_48;
  }
LABEL_25:
  v28 = v11;
LABEL_50:

  return v28;
}

- (void)dealloc
{
  os_unfair_lock_s *p_indexLock;
  objc_super v4;

  p_indexLock = &self->_indexLock;
  os_unfair_lock_lock(&self->_indexLock);
  -[PLFetchRecording _indexLocked_close](self, "_indexLocked_close");
  os_unfair_lock_unlock(p_indexLock);
  v4.receiver = self;
  v4.super_class = (Class)PLFetchRecording;
  -[PLFetchRecording dealloc](&v4, sel_dealloc);
}

- (PLFetchRecordingFileHeader)fileHeader
{
  return (PLFetchRecordingFileHeader *)self->_indexLocked_buffer;
}

- (void)close
{
  os_unfair_lock_s *p_indexLock;

  p_indexLock = &self->_indexLock;
  os_unfair_lock_lock(&self->_indexLock);
  -[PLFetchRecording _indexLocked_close](self, "_indexLocked_close");
  os_unfair_lock_unlock(p_indexLock);
}

- (int)fd
{
  return self->_fd;
}

- (BOOL)remap
{
  PLFetchRecording *v2;
  os_unfair_lock_s *p_indexLock;

  v2 = self;
  p_indexLock = &self->_indexLock;
  os_unfair_lock_lock(&self->_indexLock);
  LOBYTE(v2) = -[PLFetchRecording _indexLocked_remapFile](v2, "_indexLocked_remapFile");
  os_unfair_lock_unlock(p_indexLock);
  return (char)v2;
}

- (PLFetchRecordingFileNormalizedStatementHeader)entryForNormalizedSQL:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  PLFetchRecordingFileNormalizedStatementHeader *v7;

  _hashForSQL(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_indexLocked_indexEntriesByNormSQLHash, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "lock");
    v7 = (PLFetchRecordingFileNormalizedStatementHeader *)objc_msgSend(v6, "entryLocked_statementEntryFomBuffer:", self->_indexLocked_buffer);
    objc_msgSend(v6, "unlock");
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)enumerateEntryHeaders:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLFetchRecording.m"), 931, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  if (-[PLFetchRecording _isOpen](self, "_isOpen"))
  {
    os_unfair_lock_lock(&self->_indexLock);
    objc_msgSend((id)objc_opt_class(), "_indexLocked_enumerateEntryHeadersFromBuffer:bufferLength:fileVersion:fileHeaderSize:block:", self->_indexLocked_buffer, self->_indexLocked_bufferLen, self->_fileVersion, self->_fileHeaderSize, v6);
    os_unfair_lock_unlock(&self->_indexLock);
  }

}

- (void)enumerateVariationsFromEntryHeader:(PLFetchRecordingFileNormalizedStatementHeader *)a3 block:(id)a4
{
  void *v7;
  id v8;

  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLFetchRecording.m"), 947, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  if (-[PLFetchRecording _isOpen](self, "_isOpen"))
    objc_msgSend((id)objc_opt_class(), "_enumerateVariationsFromEntryHeader:block:", a3, v8);

}

- (BOOL)recordStatementWithNormalizedSQL:(id)a3 bindVariablesAsString:(id)a4 multiInCounts:(id)a5 contextName:(id)a6 pagesHit:(unsigned int)a7 pagesMissed:(unsigned int)a8 rowCount:(unsigned int)a9 duration:(double)a10 QOS:(unsigned int)a11
{
  id v18;
  id v19;
  id v20;
  void *v21;
  PLFetchRecording *v22;
  uint64_t v23;
  void *v24;
  double Current;
  os_unfair_lock_s *p_indexLock;
  void *v27;
  void *v28;
  uint64_t v29;
  BOOL v30;
  uint64_t v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  unsigned int v38;
  unsigned int v39;
  unint64_t v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  uint64_t v45;
  id v46;
  unsigned int *p_numberOfAllocationsSinceLastRemap;
  unsigned int v48;
  void *v49;
  NSObject *v50;
  const char *v51;
  uint8_t *v52;
  NSObject *v53;
  os_log_type_t v54;
  unsigned int v55;
  unsigned int v56;
  char *v57;
  char *v58;
  char *v59;
  char *v60;
  id v61;
  PLFetchRecordingIndexEntry *v63;
  os_unfair_lock_s *v64;
  void *v65;
  PLFetchRecordingIndexEntry *v66;
  uint64_t v67;
  uint64_t v68;
  os_unfair_lock_s *lock;
  unsigned int v70;
  void *v71;
  id v72;
  id v73;
  unsigned int v74;
  id v75;
  id v76;
  id v77;
  unsigned int v78;
  id v79;
  uint8_t v80[2];
  __int16 v81;
  uint8_t v82[16];
  uint8_t v83[16];
  uint8_t v84[16];
  uint8_t buf[16];

  v18 = a3;
  v79 = a4;
  v19 = a5;
  v20 = a6;
  v21 = (void *)MEMORY[0x19AEC1554]();
  v22 = objc_retainAutorelease(self);
  v23 = -[PLFetchRecording fileHeader](v22, "fileHeader");
  if (-[PLFetchRecording _isOpen](v22, "_isOpen"))
  {
    if (objc_msgSend(v18, "length"))
    {
      v78 = a7;
      _hashForSQL(v18);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v24, "length"))
      {
        PLBackendGetLog();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v84 = 0;
          _os_log_impl(&dword_199541000, v33, OS_LOG_TYPE_DEBUG, "LOFR can't hash sql", v84, 2u);
        }

        v30 = 0;
        ++*(_DWORD *)(v23 + 230);
        goto LABEL_44;
      }
      Current = CFAbsoluteTimeGetCurrent();
      p_indexLock = &v22->_indexLock;
      os_unfair_lock_lock(&v22->_indexLock);
      -[NSMutableDictionary objectForKeyedSubscript:](v22->_indexLocked_indexEntriesByNormSQLHash, "objectForKeyedSubscript:", v24);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v27;
      v74 = a8;
      v75 = v19;
      if (v27)
      {
        objc_msgSend(v27, "lock");
        v29 = objc_msgSend(v28, "entryLocked_statementEntryFomBuffer:", v22->_indexLocked_buffer);
        os_unfair_lock_unlock(&v22->_indexLock);
        v76 = 0;
        v77 = 0;
        v30 = 1;
        v31 = 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_25;
      }
      lock = &v22->_indexLock;
      v71 = v21;
      v72 = v24;
      objc_msgSend(v19, "componentsJoinedByString:", CFSTR(","));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "_backtrace");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "dataUsingEncoding:", 4);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "compressedDataUsingAlgorithm:error:", 0, 0);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      LODWORD(v35) = objc_msgSend(v18, "length");
      LODWORD(v36) = objc_msgSend(v79, "length");
      v38 = objc_msgSend(v34, "length");
      v39 = objc_msgSend(v20, "length");
      v77 = v37;
      v40 = v35
          + (unint64_t)v36
          + v38
          + v39
          + objc_msgSend(v37, "length")
          + 269;
      v76 = v34;
      if (v40 <= 0xA000)
      {
        v42 = objc_msgSend((id)objc_opt_class(), "_indexLocked_allocateSizeToFit:fileHeaderSize:currentEOF:buffer:bufferLength:index:", v40, v22->_fileHeaderSize, *(unsigned int *)(v23 + 222), v22->_indexLocked_buffer, v22->_indexLocked_bufferLen, v22->_indexLocked_indexEntriesByNormSQLHash);
        if (v42 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v45 = v42;
          v29 = (uint64_t)v22->_indexLocked_buffer + v42;
          *(_BYTE *)v29 = (v43 >> 11) - 80;
          v67 = v43;
          v46 = objc_retainAutorelease(v72);
          memcpy((void *)(v29 + 1), (const void *)objc_msgSend(v46, "bytes"), objc_msgSend(v46, "length"));
          *(double *)(v29 + 33) = Current;
          *(_WORD *)(v29 + 93) = objc_msgSend(v18, "length");
          *(_WORD *)(v29 + 95) = objc_msgSend(v79, "length");
          *(_WORD *)(v29 + 99) = objc_msgSend(v20, "length");
          *(_WORD *)(v29 + 97) = objc_msgSend(v34, "length");
          *(_WORD *)(v29 + 101) = objc_msgSend(v77, "length");
          *(_DWORD *)(v29 + 57) = 0;
          v68 = v45;
          *(_DWORD *)(v23 + 222) = v45 + v67;
          p_numberOfAllocationsSinceLastRemap = (unsigned int *)&v22->_numberOfAllocationsSinceLastRemap;
          do
            v48 = __ldaxr(p_numberOfAllocationsSinceLastRemap);
          while (__stlxr(v48 + 1, p_numberOfAllocationsSinceLastRemap));
          -[PLFetchRecording _considerIfRemapIsNeeded](v22, "_considerIfRemapIsNeeded");
          v30 = 1;
          v21 = v71;
          v24 = v72;
          p_indexLock = &v22->_indexLock;
          v28 = 0;
          v31 = v68;
LABEL_25:
          if (objc_msgSend(v28, "unavailable", v67))
          {
            v49 = v28;
            PLBackendGetLog();
            v50 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
            {
              v81 = 0;
              v51 = "LOFR Can't use this index as it was just made unavailable";
              v52 = (uint8_t *)&v81;
              v53 = v50;
              v54 = OS_LOG_TYPE_DEBUG;
LABEL_40:
              _os_log_impl(&dword_199541000, v53, v54, v51, v52, 2u);
            }
          }
          else
          {
            if (v29)
            {
              v55 = v74;
              v56 = v78;
              v70 = v74 + v78;
              if (!v28)
              {
                v73 = v24;
                strncpy((char *)(v29 + 105), (const char *)objc_msgSend(objc_retainAutorelease(v18), "UTF8String"), *(unsigned __int16 *)(v29 + 93) + 1);
                v57 = (char *)(v29 + *(unsigned __int16 *)(v29 + 93) + 106);
                strncpy(v57, (const char *)objc_msgSend(objc_retainAutorelease(v79), "UTF8String"), *(unsigned __int16 *)(v29 + 95) + 1);
                v58 = &v57[*(unsigned __int16 *)(v29 + 95) + 1];
                if (v76)
                  strncpy(v58, (const char *)objc_msgSend(objc_retainAutorelease(v76), "UTF8String"), *(unsigned __int16 *)(v29 + 97) + 1);
                v59 = &v58[*(unsigned __int16 *)(v29 + 97) + 1];
                strncpy(v59, (const char *)objc_msgSend(objc_retainAutorelease(v20), "UTF8String"), *(unsigned __int16 *)(v29 + 99) + 1);
                v60 = &v59[*(unsigned __int16 *)(v29 + 99) + 1];
                v61 = objc_retainAutorelease(v77);
                memcpy(v60, (const void *)objc_msgSend(v61, "bytes"), objc_msgSend(v61, "length"));
                v24 = v73;
                v28 = 0;
                v55 = v74;
                v56 = v78;
              }
              *(_DWORD *)(v29 + 49) += v56;
              *(_DWORD *)(v29 + 53) += v55;
              *(double *)(v29 + 41) = Current;
              if (*(unsigned __int8 *)(v29 + 103) < 5u
                || objc_msgSend((id)objc_opt_class(), "_statsForStatementAreInteresting:totalPages:", v29, v70))
              {
                -[PLFetchRecording _recordVariationWithEntryHeader:timestamp:pagesHit:pagesMissed:rowsAffected:duration:QOS:](v22, "_recordVariationWithEntryHeader:timestamp:pagesHit:pagesMissed:rowsAffected:duration:QOS:", v29, v78, v74, a9, a11, Current, a10);
              }
              objc_msgSend((id)objc_opt_class(), "_updateRunningStatisticsForEntry:givenPageCount:", v29, v70);
              if (v28)
              {
                objc_msgSend(v28, "unlock");
LABEL_43:
                v19 = v75;

LABEL_44:
                goto LABEL_45;
              }
              v63 = -[PLFetchRecordingIndexEntry initWithOffset:]([PLFetchRecordingIndexEntry alloc], "initWithOffset:", v31);
              v64 = p_indexLock;
              v49 = 0;
              v65 = v24;
              v66 = v63;
              -[NSMutableDictionary setObject:forKeyedSubscript:](v22->_indexLocked_indexEntriesByNormSQLHash, "setObject:forKeyedSubscript:", v63, v65);
              os_unfair_lock_unlock(v64);

              v24 = v65;
LABEL_42:
              v28 = v49;
              goto LABEL_43;
            }
            v49 = v28;
            PLBackendGetLog();
            v50 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)v80 = 0;
              v51 = "LOFR Unable to create new entry.";
              v52 = v80;
              v53 = v50;
              v54 = OS_LOG_TYPE_ERROR;
              goto LABEL_40;
            }
          }

          v30 = 0;
          goto LABEL_42;
        }
        PLBackendGetLog();
        v44 = objc_claimAutoreleasedReturnValue();
        v21 = v71;
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v82 = 0;
          _os_log_impl(&dword_199541000, v44, OS_LOG_TYPE_DEBUG, "LOFR failed to allocate space.", v82, 2u);
        }

        p_indexLock = &v22->_indexLock;
        os_unfair_lock_unlock(lock);
        v29 = 0;
        v30 = 0;
        v31 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else
      {
        PLBackendGetLog();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v83 = 0;
          _os_log_impl(&dword_199541000, v41, OS_LOG_TYPE_DEBUG, "LOFR entry is too large to fit.", v83, 2u);
        }

        ++*(_DWORD *)(v23 + 230);
        p_indexLock = &v22->_indexLock;
        os_unfair_lock_unlock(lock);
        v29 = 0;
        v30 = 0;
        v31 = 0x7FFFFFFFFFFFFFFFLL;
        v21 = v71;
      }
      v24 = v72;
      v28 = 0;
      goto LABEL_25;
    }
    PLBackendGetLog();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v32, OS_LOG_TYPE_DEBUG, "LOFR no normalized sql", buf, 2u);
    }

    v30 = 0;
    ++*(_DWORD *)(v23 + 230);
  }
  else
  {
    v30 = 0;
  }
LABEL_45:
  objc_autoreleasePoolPop(v21);

  return v30;
}

- (NSURL)url
{
  return self->_url;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_indexLocked_indexEntriesByNormSQLHash, 0);
  objc_storeStrong((id *)&self->_remapQueue, 0);
  objc_storeStrong((id *)&self->_fileVersion, 0);
}

void __44__PLFetchRecording__scheduleRemapAfterDelay__block_invoke(uint64_t a1)
{
  _BOOL4 v2;
  void *v3;

  v2 = os_unfair_lock_trylock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 56));
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "_indexLocked_remapFile");
    atomic_store(0, (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 12));
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 56));
  }
  else
  {
    objc_msgSend(v3, "_scheduleRemapAfterDelay");
  }
}

uint64_t __42__PLFetchRecording__indexLocked_remapFile__block_invoke_30(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "unlock");
}

uint64_t __42__PLFetchRecording__indexLocked_remapFile__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "lock");
}

+ (void)_indexLocked_populateStatementIndex:(id)a3 fromBuffer:(void *)a4 bufferLength:(unint64_t)a5 fileHeaderSize:(unint64_t)a6 fileVersion:(id)a7
{
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v12 = a3;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __107__PLFetchRecording__indexLocked_populateStatementIndex_fromBuffer_bufferLength_fileHeaderSize_fileVersion___block_invoke;
  v14[3] = &unk_1E366D6D8;
  v15 = v12;
  v13 = v12;
  objc_msgSend(a1, "_indexLocked_enumerateEntryHeadersFromBuffer:bufferLength:fileVersion:fileHeaderSize:block:", a4, a5, a7, a6, v14);

}

+ (PLFetchRecordingFileNormalizedStatementHeader)_currentVersionHeaderFrom_053Header:(PLFetchRecordingFileNormalizedStatementHeader_053 *)a3
{
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = (char *)malloc_type_calloc(1uLL, *(unsigned __int16 *)((char *)&a3->var8 + 5)+ (unint64_t)*(unsigned __int16 *)((char *)&a3->var8 + 7)+ *(unsigned __int16 *)((char *)&a3->var9 + 1)+ (unint64_t)*(unsigned __int16 *)((char *)&a3->var9 + 3)+ *(unsigned __int16 *)((char *)&a3->var9 + 5)+ 269, 0xADC5972BuLL);
  v5 = *(_QWORD *)&a3->var1[32];
  *v4 = a3->var0;
  *(_QWORD *)(v4 + 33) = v5;
  *(_QWORD *)(v4 + 41) = 0;
  *(double *)(v4 + 49) = *(double *)((char *)&a3->var2 + 1);
  *(_DWORD *)(v4 + 57) = *(unsigned int *)((char *)&a3->var3 + 1);
  *(_OWORD *)(v4 + 61) = *(_OWORD *)((char *)&a3->var4 + 1);
  *(_OWORD *)(v4 + 77) = *(_OWORD *)((char *)&a3->var6 + 5);
  v6 = *(unsigned __int16 *)((char *)&a3->var8 + 5);
  *(_WORD *)(v4 + 93) = v6;
  v7 = *(unsigned __int16 *)((char *)&a3->var8 + 7);
  *(_WORD *)(v4 + 95) = v7;
  v8 = *(unsigned __int16 *)((char *)&a3->var9 + 1);
  *(_WORD *)(v4 + 97) = v8;
  v9 = *(unsigned __int16 *)((char *)&a3->var9 + 3);
  *(_WORD *)(v4 + 99) = v9;
  v10 = *(unsigned __int16 *)((char *)&a3->var9 + 5);
  *(_WORD *)(v4 + 101) = v10;
  v4[103] = HIBYTE(a3->var9);
  v4[104] = a3->var10;
  memcpy(v4 + 105, (char *)&a3->var10 + 1, v6 + v7 + v8 + v9 + v10 + 160);
  return (PLFetchRecordingFileNormalizedStatementHeader *)v4;
}

+ (void)_indexLocked_enumerateEntryHeadersFromBuffer:(const void *)a3 bufferLength:(unint64_t)a4 fileVersion:(id)a5 fileHeaderSize:(unint64_t)a6 block:(id)a7
{
  id v12;
  id v13;
  unsigned int v14;
  char v15;
  _BYTE *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  uint8_t buf[15];
  char v22;

  v12 = a5;
  v13 = a7;
  if (a4 < a6)
    goto LABEL_19;
  v22 = 0;
  if (a6 >= a4)
    goto LABEL_19;
  v20 = a1;
  v14 = 0;
  v15 = 0;
  do
  {
    v16 = (char *)a3 + a6;
    if (objc_msgSend(v12, "isEqualToString:", CFSTR("0.53")))
    {
      v16 = (_BYTE *)objc_msgSend(v20, "_currentVersionHeaderFrom_053Header:", (char *)a3 + a6);
      v15 = 1;
    }
    if (*v16)
    {
      v17 = _allocationSizeForEntry(v16);
      if (v17 == -1)
      {
        PLBackendGetLog();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_DEBUG, "LOFR can't read allocation block size.", buf, 2u);
        }

        (*((void (**)(id, _QWORD, unint64_t, _QWORD, _QWORD, char *))v13 + 2))(v13, 0, a6, v14, 0, &v22);
        v18 = 2048;
      }
      else
      {
        v18 = v17;
        (*((void (**)(id, _BYTE *, unint64_t, _QWORD, _BYTE *, char *))v13 + 2))(v13, v16, a6, v14, v16 + 105, &v22);
      }
      ++v14;
      a6 += v18;
      if ((v15 & 1) != 0)
      {
LABEL_15:
        free(v16);
        v16 = 0;
      }
    }
    else
    {
      a6 += 2048;
      if ((v15 & 1) != 0)
        goto LABEL_15;
    }
  }
  while (a6 < a4);
  if (((v16 != 0) & v15) == 1)
    free(v16);
LABEL_19:

}

+ (_NSRange)_indexLocked_allocateSizeToFit:(unint64_t)a3 fileHeaderSize:(unint64_t)a4 currentEOF:(int64_t)a5 buffer:(void *)a6 bufferLength:(unint64_t)a7 index:(id)a8
{
  unsigned int v10;
  id v11;
  unsigned int v12;
  unsigned int v13;
  unint64_t v14;
  unsigned int v15;
  uint64_t v16;
  size_t v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSUInteger v24;
  uint64_t v25;
  NSUInteger v26;
  NSUInteger v27;
  unint64_t v28;
  unint64_t v30;
  uint8_t buf[4];
  size_t v32;
  uint64_t v33;
  _NSRange result;

  v10 = a3;
  v33 = *MEMORY[0x1E0C80C00];
  v11 = a8;
  v12 = v10 >> 11;
  if ((v10 & 0x7FF) != 0)
    ++v12;
  if (v12 >= 0x14)
    v13 = 20;
  else
    v13 = v12;
  v14 = *(unsigned int *)((char *)a6 + 222);
  v30 = v14;
  v15 = 0;
  if (v13)
  {
    v28 = a7;
    do
    {
      v16 = _allocationSizeForEntry((_BYTE *)a6 + v14);
      if (v16)
      {
        v17 = v16;
        if (v16 == -1)
        {
          PLBackendGetLog();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_DEBUG, "LOFR cannot read allocation block size marker, assuming single allocation...", buf, 2u);
          }

          bzero((char *)a6 + v14, 0x800uLL);
          v14 += 2048;
          ++v15;
        }
        else
        {
          PLBackendGetLog();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134217984;
            v32 = v17;
            _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_DEBUG, "LOFR Erasing existing entry with size: %lu...", buf, 0xCu);
          }

          v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", (char *)a6 + v14 + 1, 32);
          objc_msgSend(v11, "objectForKeyedSubscript:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v21)
          {
            PLBackendGetLog();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_ERROR, "LOFR Can't find existing entry in index, failing allocation.", buf, 2u);
            }

            break;
          }
          v22 = v21;
          objc_msgSend(v21, "lock");
          bzero((char *)a6 + v14, v17);
          objc_msgSend(v11, "removeObjectForKey:", v20);
          objc_msgSend(v22, "entryLocked_markUnavailable");
          objc_msgSend(v22, "unlock");
          v15 += v17 >> 11;
          v14 += v17;

          a7 = v28;
        }
      }
      else
      {
        ++v15;
        v14 += 2048;
      }
      if (v14 >= a7)
      {
        v15 = 0;
        ++*(_DWORD *)((char *)a6 + 226);
        v14 = a4;
        v30 = a4;
      }
    }
    while (v15 < v13);
  }
  if (v15 >= v13)
    v24 = v15 << 11;
  else
    v24 = 0;
  if (v15 >= v13)
    v25 = v30;
  else
    v25 = 0x7FFFFFFFFFFFFFFFLL;

  v26 = v25;
  v27 = v24;
  result.length = v27;
  result.location = v26;
  return result;
}

+ (id)_backtrace
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "debugDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (void)_writeInitialHeaderToBuffer:(void *)a3 bufferLen:(unint64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v13;
  id v14;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", 0, a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLFetchRecording.m"), 523, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("buffer"));

  }
  *(_WORD *)a3 = -257;
  strncpy((char *)a3 + 2, (const char *)objc_msgSend(CFSTR("0.54"), "UTF8String"), 0xDuLL);
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "processName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_retainAutorelease(v6);
  strncpy((char *)a3 + 15, (const char *)objc_msgSend(v14, "UTF8String"), 0x81uLL);
  PLPhotoLibraryServicesBinaryImageUUID();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  strncpy((char *)a3 + 144, (const char *)objc_msgSend(v8, "UTF8String"), 0x25uLL);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  strncpy((char *)a3 + 181, (const char *)objc_msgSend(v10, "UTF8String"), 0x25uLL);
  *(_DWORD *)((char *)a3 + 218) = dyld_get_active_platform();
  *(_QWORD *)((char *)a3 + 222) = 234;
  *(_DWORD *)((char *)a3 + 230) = 0;

}

+ (void)_enumerateVariationsFromEntryHeader:(PLFetchRecordingFileNormalizedStatementHeader *)a3 block:(id)a4
{
  void (**v7)(id, char *, unint64_t, _BYTE *);
  unint64_t v8;
  char *v9;
  void *v10;
  char v11;

  v7 = (void (**)(id, char *, unint64_t, _BYTE *))a4;
  if (v7)
  {
    if (!a3)
      goto LABEL_7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLFetchRecording.m"), 558, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

    if (!a3)
      goto LABEL_7;
  }
  v11 = 0;
  if (HIBYTE(a3->var10))
  {
    v8 = 0;
    v9 = (char *)&a3->var13
       + *(unsigned __int16 *)((char *)&a3->var9 + 5)
       + *(unsigned __int16 *)((char *)&a3->var9 + 7)
       + (unint64_t)*(unsigned __int16 *)((char *)&a3->var10 + 1)
       + *(unsigned __int16 *)((char *)&a3->var10 + 3)
       + *(unsigned __int16 *)((char *)&a3->var10 + 5)
       + 1;
    do
    {
      v7[2](v7, v9, v8, &v11);
      if (v11)
        break;
      ++v8;
      v9 += 32;
    }
    while (v8 < HIBYTE(a3->var10));
  }
LABEL_7:

}

+ (BOOL)_statsForStatementAreInteresting:(PLFetchRecordingFileNormalizedStatementHeader *)a3 totalPages:(unsigned int)a4
{
  double v7;
  double v8;
  double v9;
  double v10;

  objc_msgSend(a1, "stdDevPageCountForEntryHeader:");
  v8 = v7;
  objc_msgSend(a1, "meanPageCountForEntryHeader:", a3);
  v10 = (double)a4 - v9;
  if (v10 < 0.0)
    v10 = -v10;
  return v10 > v8;
}

+ (void)_updateRunningStatisticsForEntry:(PLFetchRecordingFileNormalizedStatementHeader *)a3 givenPageCount:(unsigned int)a4
{
  int v4;
  unsigned int v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v4 = *(unsigned int *)((char *)&a3->var4 + 1);
  *(unsigned int *)((char *)&a3->var4 + 1) = v4 + 1;
  if (v4 && (v5 = (v4 + 1) % 0x1F4u) != 0)
  {
    v6 = *(double *)((char *)&a3->var5 + 1);
    v7 = (double)a4 - v6;
    v8 = v6 + v7 / (double)v5;
    *(double *)((char *)&a3->var6 + 5) = v8;
    v9 = *(double *)((char *)&a3->var7 + 5) + v7 * ((double)a4 - v8);
    *(double *)((char *)&a3->var8 + 5) = v9;
    *(double *)((char *)&a3->var5 + 1) = v8;
    *(double *)((char *)&a3->var7 + 5) = v9;
  }
  else
  {
    *(double *)((char *)&a3->var6 + 5) = (double)a4;
    *(double *)((char *)&a3->var5 + 1) = (double)a4;
    *(double *)((char *)&a3->var8 + 5) = 0.0;
    *(double *)((char *)&a3->var7 + 5) = 0.0;
  }
}

+ (const)normalizedSQLForEntryHeader:(PLFetchRecordingFileNormalizedStatementHeader *)a3
{
  return (char *)&a3->var11 + 1;
}

+ (const)bindVariablesForEntryHeader:(PLFetchRecordingFileNormalizedStatementHeader *)a3
{
  return (char *)&a3->var12 + *(unsigned __int16 *)((char *)&a3->var9 + 5);
}

+ (id)multiInCountsForEntryHeader:(PLFetchRecordingFileNormalizedStatementHeader *)a3
{
  unsigned __int8 *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!*(_WORD *)((char *)&a3->var10 + 1))
    return 0;
  v3 = &a3->var0 + *(unsigned __int16 *)((char *)&a3->var9 + 5) + *(unsigned __int16 *)((char *)&a3->var9 + 7);
  if (v3 == (unsigned __int8 *)-107)
    return 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v3 + 107);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR(","));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "integerValue", (_QWORD)v14));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (const)contextNameForEntryHeader:(PLFetchRecordingFileNormalizedStatementHeader *)a3
{
  return (char *)&a3->var13
       + *(unsigned __int16 *)((char *)&a3->var9 + 5)
       + *(unsigned __int16 *)((char *)&a3->var9 + 7)
       + (unint64_t)*(unsigned __int16 *)((char *)&a3->var10 + 1);
}

+ (id)backtraceForEntryHeader:(PLFetchRecordingFileNormalizedStatementHeader *)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLFetchRecording.m"), 837, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("entry"));

  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", (char *)&a3->var13+ *(unsigned __int16 *)((char *)&a3->var9 + 5)+ *(unsigned __int16 *)((char *)&a3->var9 + 7)+ (unint64_t)*(unsigned __int16 *)((char *)&a3->var10 + 1)+ *(unsigned __int16 *)((char *)&a3->var10 + 3)+ 1, *(unsigned __int16 *)((char *)&a3->var10 + 5));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend(v4, "decompressedDataUsingAlgorithm:error:", 0, &v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v13;
  if (v5)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v5, 4);
  }
  else
  {
    PLBackendGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v6;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "LOFR can't decompress backtrace: %@", buf, 0xCu);
    }

    v7 = 0;
  }

  return v7;
}

+ (double)meanPageCountForEntryHeader:(PLFetchRecordingFileNormalizedStatementHeader *)a3
{
  if (*(unsigned int *)((char *)&a3->var4 + 1))
    return *(double *)((char *)&a3->var6 + 5);
  else
    return 0.0;
}

+ (double)varPageCountForEntryHeader:(PLFetchRecordingFileNormalizedStatementHeader *)a3
{
  unsigned int v3;
  double result;

  v3 = *(unsigned int *)((char *)&a3->var4 + 1);
  result = 0.0;
  if (v3 >= 2)
    return *(double *)((char *)&a3->var8 + 5) / (double)((v3 - 1) % 0x1F4);
  return result;
}

+ (double)stdDevPageCountForEntryHeader:(PLFetchRecordingFileNormalizedStatementHeader *)a3
{
  double v3;

  objc_msgSend(a1, "varPageCountForEntryHeader:", a3);
  return sqrt(v3);
}

+ (BOOL)deleteRecording:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;

  if (!a3)
    return 1;
  v5 = a3;
  objc_msgSend(v5, "close");
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "url");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a4) = objc_msgSend(v6, "removeItemAtURL:error:", v7, a4);
  return (char)a4;
}

+ (id)suggestedFilenameForCurrentProcess
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "processName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("%@-recording-v%@.%@"), v4, CFSTR("0.54"), CFSTR("lofr"));

  return v5;
}

void __107__PLFetchRecording__indexLocked_populateStatementIndex_fromBuffer_bufferLength_fileHeaderSize_fileVersion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  PLFetchRecordingIndexEntry *v6;
  id v7;

  if (a2)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", a2 + 1, 32);
    if (v5)
    {
      v7 = v5;
      v6 = -[PLFetchRecordingIndexEntry initWithOffset:]([PLFetchRecordingIndexEntry alloc], "initWithOffset:", a3);
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v7);

      v5 = v7;
    }

  }
}

@end
