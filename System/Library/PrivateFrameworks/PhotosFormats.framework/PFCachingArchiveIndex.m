@implementation PFCachingArchiveIndex

- (unint64_t)indexFileVersion
{
  -[PFCachingArchiveIndex doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BOOL)loadIndexFile:(const char *)a3 fileSize:(int64_t)a4
{
  -[PFCachingArchiveIndex doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return 0;
}

- (id)indexName
{
  -[PFCachingArchiveIndex doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (const)indexLabel
{
  -[PFCachingArchiveIndex doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (unique_ptr<pf::ArchiveLineParser,)archiveLineParserForIndexPath:(id)a3
{
  _QWORD *v3;
  _QWORD *v4;
  unique_ptr<pf::ArchiveLineParser, std::default_delete<pf::ArchiveLineParser>> v5;

  v4 = v3;
  v5.var0.var0 = (ArchiveLineParser *)-[PFCachingArchiveIndex doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  *v4 = 0;
  return v5;
}

- (id)dataArchivePath
{
  void *v3;
  void *v4;
  void *v5;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFCachingArchiveIndex indexName](self, "indexName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathForResource:ofType:", v4, CFSTR("bz2"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[PFCachingArchiveIndex indexName](self, "indexName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bundlePath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v7;
    v11 = 2114;
    v12 = v8;
    _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error finding %{public}@ data archive resource in bundle %{public}@.", (uint8_t *)&v9, 0x16u);

  }
  return v5;
}

- (BOOL)indexSupported
{
  return 1;
}

- (id)indexPath:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  NSTemporaryDirectory();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "processName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingFormat:", CFSTR("com.apple.%@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PFCachingArchiveIndex indexName](self, "indexName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingPathExtension:", CFSTR("index"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "stringByAppendingPathComponent:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
    *a3 = objc_retainAutorelease(v8);

  return v11;
}

- (BOOL)indexFileValid:(const char *)a3
{
  int v6;
  stat v7;
  uint8_t buf[4];
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (!stat(a3, &v7) && (__int16)v7.st_mode < 0)
    return -[PFCachingArchiveIndex loadIndexFile:fileSize:](self, "loadIndexFile:fileSize:", a3, v7.st_size);
  if (*__error() != 2 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v6 = *__error();
    *(_DWORD *)buf = 67109120;
    v9 = v6;
    _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unexpected result checking if archive file exists: %d.", buf, 8u);
  }
  return 0;
}

- (BOOL)loadOrCreateIndex
{
  void *v3;
  id v4;
  id v5;
  const char *v6;
  int v8;
  id v9;
  stat v10;
  uint8_t buf[4];
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)&-[PFCachingArchiveIndex loadOrCreateIndex]::cacheLock);
  if (!self->_loaded)
  {
    if (-[PFCachingArchiveIndex indexSupported](self, "indexSupported"))
    {
      v9 = 0;
      -[PFCachingArchiveIndex indexPath:](self, "indexPath:", &v9);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v9;
      v5 = objc_retainAutorelease(v3);
      v6 = (const char *)objc_msgSend(v5, "fileSystemRepresentation");
      if (!-[PFCachingArchiveIndex indexFileValid:](self, "indexFileValid:", v6)
        && -[PFCachingArchiveIndex makeAndCacheIndexFileInDirectory:indexPath:](self, "makeAndCacheIndexFileInDirectory:indexPath:", v4, v5))
      {
        if (stat(v6, &v10) || ((__int16)v10.st_mode & 0x80000000) == 0)
        {
          if (*__error() != 2 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            v8 = *__error();
            *(_DWORD *)buf = 67109120;
            v12 = v8;
            _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unexpected result checking if archive file exists: %d.", buf, 8u);
          }
        }
        else
        {
          -[PFCachingArchiveIndex loadIndexFile:fileSize:](self, "loadIndexFile:fileSize:", v6, v10.st_size);
        }
      }

    }
    self->_loaded = 1;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&-[PFCachingArchiveIndex loadOrCreateIndex]::cacheLock);
  return 1;
}

- (BOOL)makeAndCacheIndexFileInDirectory:(id)a3 indexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  char v13;
  id v14;
  char *v15;
  const char *v17;
  const char *v18;
  const char *v19;
  id v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "stringByAppendingString:", CFSTR(".tmp"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFCachingArchiveIndex dataArchivePath](self, "dataArchivePath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      -[PFCachingArchiveIndex indexName](self, "indexName");
      v15 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v23 = v15;
      _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error cannot use nil data archive path for %@.", buf, 0xCu);

    }
    goto LABEL_17;
  }
  v21 = 0;
  v11 = objc_msgSend(v9, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v6, 1, 0, &v21);
  v12 = v21;
  if ((v11 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v17 = -[PFCachingArchiveIndex indexLabel](self, "indexLabel");
      *(_DWORD *)buf = 136315650;
      v23 = v17;
      v24 = 2112;
      v25 = v6;
      v26 = 2112;
      v27 = v12;
      _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error making cache directory for %s index %@: %@", buf, 0x20u);
    }
    goto LABEL_16;
  }
  objc_msgSend(v9, "removeItemAtPath:error:", v7, 0);
  if (!-[PFCachingArchiveIndex createIndexFromArchiveFile:tempIndexFile:](self, "createIndexFromArchiveFile:tempIndexFile:", v10, v8))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v18 = -[PFCachingArchiveIndex indexLabel](self, "indexLabel");
      *(_DWORD *)buf = 136315394;
      v23 = v18;
      v24 = 2112;
      v25 = v12;
      _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error creating %s index file %@", buf, 0x16u);
    }
LABEL_16:

LABEL_17:
    v13 = 0;
    goto LABEL_18;
  }
  v20 = 0;
  v13 = objc_msgSend(v9, "moveItemAtPath:toPath:error:", v8, v7, &v20);
  v14 = v20;
  if ((v13 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v19 = -[PFCachingArchiveIndex indexLabel](self, "indexLabel");
      *(_DWORD *)buf = 136315906;
      v23 = v19;
      v24 = 2112;
      v25 = v8;
      v26 = 2112;
      v27 = v7;
      v28 = 2112;
      v29 = v14;
      _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error renaming %s index file %@ to %@: %@", buf, 0x2Au);
    }
    objc_msgSend(v9, "removeItemAtPath:error:", v8, 0);
  }

LABEL_18:
  return v13;
}

- (BOOL)createIndexFromArchiveFile:(id)a3 tempIndexFile:(id)a4
{
  id v6;
  id v7;
  id v8;
  BOOL v9;
  void *v11;
  char v12;
  id v13;
  int data_block;
  void *v15;
  char v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  id v21[2];
  int __dst;
  const char *v23;
  __int16 v24;
  uint64_t v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  archive_read_new();
  v21[1] = 0;
  archive_read_support_filter_bzip2();
  archive_read_support_format_raw();
  v8 = objc_retainAutorelease(v6);
  objc_msgSend(v8, "fileSystemRepresentation");
  if (archive_read_open_filename() || archive_read_next_header())
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      __dst = 136315394;
      v23 = -[PFCachingArchiveIndex indexLabel](self, "indexLabel");
      v24 = 2080;
      v25 = archive_error_string();
      _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error opening %s source file: %s.", (uint8_t *)&__dst, 0x16u);
    }
    archive_read_free();
    v9 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = 0;
    v12 = objc_msgSend(v11, "removeItemAtPath:error:", v7, v21);
    v13 = v21[0];

    if ((v12 & 1) != 0
      || objc_msgSend(v13, "code") == 4
      && (objc_msgSend(v13, "domain"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v16 = objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0CB28A8]),
          v15,
          (v16 & 1) != 0))
    {
      -[PFCachingArchiveIndex archiveLineParserForIndexPath:](self, "archiveLineParserForIndexPath:", v7);
      v19 = -[PFCachingArchiveIndex indexLabel](self, "indexLabel");
      do
      {
        data_block = archive_read_data_block();
        v9 = data_block != 0;
      }
      while (!data_block);
      if (data_block != 1)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          v17 = archive_error_string();
          *(_DWORD *)buf = 136315394;
          v27 = v19;
          v28 = 2080;
          v29 = v17;
          _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error decoding %s source archive file: %s.", buf, 0x16u);
        }
        v9 = 0;
      }
      archive_read_free();
      (*(void (**)())(*(_QWORD *)v20 + 24))();
      if (v20)
        (*(void (**)())(*(_QWORD *)v20 + 8))();
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v18 = -[PFCachingArchiveIndex indexLabel](self, "indexLabel");
        __dst = 136315394;
        v23 = v18;
        v24 = 2112;
        v25 = (uint64_t)v13;
        _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error removing old %s index: %@", (uint8_t *)&__dst, 0x16u);
      }
      v9 = 0;
    }

  }
  return v9;
}

- (unsigned)architectureHash
{
  return 146072;
}

@end
