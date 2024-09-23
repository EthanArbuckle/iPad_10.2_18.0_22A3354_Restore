@implementation SDArchive

- (int)_initlibArchiveshouldCompress:(int)a3
{
  void *v5;
  void *v6;
  const __CFString *v7;
  archive *disk_new;
  int result;
  void *v10;
  uint8_t v11[16];
  uint8_t v12[16];
  uint8_t buf[16];

  self->_archive = (archive *)archive_write_new(self, a2);
  if (a3)
  {
    if (a3 != 1)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SDArchive: Invalid compression type for tar", v11, 2u);
      }
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v10, "log:", CFSTR("SDArchive: Invalid compression type for tar"));

      return -1;
    }
    archive_write_add_filter_gzip();
    archive_write_set_options(self->_archive, "compression-level=1");
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SDArchive: Creating tar with gzip compression", buf, 2u);
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v6 = v5;
    v7 = CFSTR("SDArchive: Creating tar with gzip compression");
  }
  else
  {
    archive_write_add_filter_none();
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SDArchive: Creating tar without compression", v12, 2u);
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v6 = v5;
    v7 = CFSTR("SDArchive: Creating tar without compression");
  }
  objc_msgSend(v5, "log:", v7);

  archive_write_set_format_pax(self->_archive);
  if (!archive_write_open_fd(self->_archive, self->_archiveFD))
  {
    disk_new = (archive *)archive_read_disk_new();
    result = 0;
    self->_disk_reader = disk_new;
    return result;
  }
  return -1;
}

- (void)_getCompressionParameters:(id *)a3 forAlgo:(int)a4
{
  unint64_t v4;

  a3->var0 = 2;
  a3->var1 = a4;
  v4 = 0x100000;
  if (a4 == 3)
    v4 = 0x400000;
  a3->var2 = v4;
  a3->var3 = v4;
}

- (int)_initlibParallelCompressionWithOption:(int)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  uint8_t v12[16];
  uint8_t v13[8];
  void *v14;
  void *v15;
  void *v16;
  uint8_t buf[16];
  __int128 v18;
  __int128 v19;
  int *p_archiveFD;

  if ((a3 - 2) >= 3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SDArchive: Invalid compression type for yaa", buf, 2u);
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v9 = v8;
    v10 = CFSTR("SDArchive: Invalid compression type for yaa");
    goto LABEL_11;
  }
  v4 = dword_100070A08[a3 - 2];
  p_archiveFD = 0;
  v18 = 0u;
  v19 = 0u;
  *(_OWORD *)buf = 0u;
  -[SDArchive _getCompressionParameters:forAlgo:](self, "_getCompressionParameters:forAlgo:", buf, v4);
  p_archiveFD = &self->_archiveFD;
  *(_QWORD *)&v19 = sub_100058858;
  v5 = (void *)ParallelCompressionOStreamCreate(buf);
  self->_ostream = v5;
  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ParallelCompressionOStreamCreate failed", v13, 2u);
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v9 = v8;
    v10 = CFSTR("ParallelCompressionOStreamCreate failed");
LABEL_11:
    objc_msgSend(v8, "log:", v10);
    v7 = -1;
LABEL_12:

    return v7;
  }
  *(_QWORD *)v13 = 0;
  v14 = &ParallelCompressionOStreamWrite;
  v15 = &ParallelCompressionOStreamAbort;
  v16 = v5;
  v6 = (void *)ParallelArchiveWriterCreate(v13);
  self->_writer = v6;
  if (!v6)
  {
    ParallelCompressionOStreamDestroy(self->_ostream);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ParallelArchiveWriterCreate failed", v12, 2u);
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v9, "log:", CFSTR("ParallelArchiveWriterCreate failed"));
    v7 = 0;
    goto LABEL_12;
  }
  return 0;
}

- (BOOL)shouldParallelCompress:(int)a3
{
  return (a3 - 2) < 3;
}

- (SDArchive)initWithPath:(id)a3 withOptions:(int)a4 withName:(id)a5
{
  uint64_t v5;
  id v8;
  const char *v9;
  _BOOL4 v10;
  uint64_t v11;
  SDArchive *v12;

  v5 = *(_QWORD *)&a4;
  v8 = a5;
  v9 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "fileSystemRepresentation");
  v10 = -[SystemDiagnostic isDeviceUnlockedSinceBoot]_0();
  v11 = sub_1000259F0(v9, v10);
  if ((_DWORD)v11 == -1)
  {
    v12 = 0;
  }
  else
  {
    self = -[SDArchive initWithFD:withOptions:withName:](self, "initWithFD:withOptions:withName:", v11, v5, v8);
    v12 = self;
  }

  return v12;
}

- (SDArchive)initWithFD:(int)a3 withOptions:(int)a4 withName:(id)a5
{
  uint64_t v6;
  id v9;
  SDArchive *v10;
  NSMutableSet *v11;
  NSMutableSet *objects;
  id v13;
  void *v14;
  NSString *v15;
  NSString *basePath;
  NSString *v17;
  NSString *v18;
  void *v19;
  void *v20;
  id v21;
  FILE *v22;
  int *v23;
  char *v24;
  void *v25;
  int *v26;
  void *v27;
  void *v28;
  void *v29;
  unsigned int v30;
  void *v31;
  unsigned int v32;
  _BOOL4 v33;
  void *v34;
  SDArchive *v35;
  unsigned int v36;
  int archiveFD;
  void *v38;
  OS_dispatch_queue *v39;
  OS_dispatch_queue *tarQueue;
  objc_super v42;
  uint8_t buf[4];
  id v44;
  __int16 v45;
  _BYTE v46[10];

  v6 = *(_QWORD *)&a4;
  v9 = a5;
  if ((a3 & 0x80000000) == 0)
  {
    v42.receiver = self;
    v42.super_class = (Class)SDArchive;
    v10 = -[SDArchive init](&v42, "init");
    self = v10;
    if (!v10)
      goto LABEL_31;
    v10->_archiveFD = a3;
    v10->_archiveStatus = 0;
    v10->_shouldCompress = (v6 & 0xFFFFFFFD) != 0;
    v10->_uncompressed_size = 0;
    v10->_compressed_size = 0;
    v10->_useParallelCompression = -[SDArchive shouldParallelCompress:](v10, "shouldParallelCompress:", v6);
    v11 = (NSMutableSet *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", 0));
    objects = self->_objects;
    self->_objects = v11;

    objc_storeStrong((id *)&self->_name, a5);
    v13 = sub_100025654(self->_archiveFD);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringByDeletingPathExtension"));
    basePath = self->_basePath;
    self->_basePath = v15;

    if (self->_shouldCompress && !self->_useParallelCompression)
    {
      v17 = (NSString *)objc_claimAutoreleasedReturnValue(-[NSString stringByDeletingPathExtension](self->_basePath, "stringByDeletingPathExtension"));
      v18 = self->_basePath;
      self->_basePath = v17;

    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSString stringByAppendingString:](self->_basePath, "stringByAppendingString:", CFSTR("-diagnostic_summary.log")));
    v20 = v19;
    if (v19)
    {
      v21 = objc_retainAutorelease(v19);
      v22 = fopen((const char *)objc_msgSend(v21, "fileSystemRepresentation"), "wx");
      self->_summaryFD = v22;
      if (!v22)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v23 = __error();
          v24 = strerror(*v23);
          *(_DWORD *)buf = 138412546;
          v44 = v21;
          v45 = 2080;
          *(_QWORD *)v46 = v24;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to open fd at %@ with error %s", buf, 0x16u);
        }
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
        v26 = __error();
        objc_msgSend(v25, "log:", CFSTR("Failed to open fd at %@ with error %s"), v21, strerror(*v26));

      }
    }
    if (self->_useParallelCompression)
    {
      v27 = dlopen(0, 2);
      if (v27)
      {
        v28 = v27;
        dlerror();
        if (!dlsym(v28, "ParallelArchiveWriterCreate"))
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SDArchive: Couldn't locate PatallelCompression. Defaulting to libarchive", buf, 2u);
          }
          v29 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
          objc_msgSend(v29, "log:", CFSTR("SDArchive: Couldn't locate PatallelCompression. Defaulting to libarchive"));

          self->_useParallelCompression = 0;
        }
        dlclose(v28);
        if (self->_useParallelCompression)
        {
          v30 = -[SDArchive _initlibParallelCompressionWithOption:](self, "_initlibParallelCompressionWithOption:", v6);
LABEL_23:
          v32 = v30;
          v33 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
          if (v32)
          {
            if (v33)
            {
              *(_DWORD *)buf = 138412290;
              v44 = v14;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SDArchive: Error creating archive at path %@", buf, 0xCu);
            }
            v34 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
            objc_msgSend(v34, "log:", CFSTR("SDArchive: Error creating archive at path %@"), v14);

            goto LABEL_27;
          }
          if (v33)
          {
            v36 = -[SDArchive getProtectionClass](self, "getProtectionClass");
            archiveFD = self->_archiveFD;
            *(_DWORD *)buf = 138412802;
            v44 = v14;
            v45 = 1024;
            *(_DWORD *)v46 = v36;
            *(_WORD *)&v46[4] = 1024;
            *(_DWORD *)&v46[6] = archiveFD;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SDArchive: Successfully created tar at %@ with class %d and descriptor %d", buf, 0x18u);
          }
          v38 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
          objc_msgSend(v38, "log:", CFSTR("SDArchive: Successfully created tar at %@ with class %d and descriptor %d"), v14, -[SDArchive getProtectionClass](self, "getProtectionClass"), self->_archiveFD);

          v39 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.sysdiagnose.tar", 0);
          tarQueue = self->_tarQueue;
          self->_tarQueue = v39;

LABEL_31:
          self = self;
          v35 = self;
          goto LABEL_32;
        }
      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Couldn't get handle to current executable", buf, 2u);
        }
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
        objc_msgSend(v31, "log:", CFSTR("Couldn't get handle to current executable"));

        self->_useParallelCompression = 0;
      }
    }
    v30 = -[SDArchive _initlibArchiveshouldCompress:](self, "_initlibArchiveshouldCompress:", v6);
    goto LABEL_23;
  }
LABEL_27:
  v35 = 0;
LABEL_32:

  return v35;
}

- (int)_writeChunk:(int)a3 maxSize:(int64_t)a4
{
  unint64_t v4;
  size_t v7;
  ssize_t v8;
  ssize_t v9;
  int64_t v10;
  size_t v11;
  _BYTE v13[8192];

  v4 = a4;
  if ((unint64_t)a4 >= 0x2000)
    v7 = 0x2000;
  else
    v7 = a4;
  v8 = read(a3, v13, v7);
  if (v8 < 1)
    return 0;
  v9 = v8;
  while (1)
  {
    v10 = -[SDArchive _writeEntryData:size:](self, "_writeEntryData:size:", v13, v9);
    if (v10 != v9)
      break;
    self->_archiveStatus = 0;
    v4 -= v9;
    if (v4)
    {
      v11 = v4 >= 0x2000 ? 0x2000 : v4;
      v9 = read(a3, v13, v11);
      if (v9 > 0)
        continue;
    }
    return 0;
  }
  self->_archiveStatus = v10;
  return -1;
}

- (void)_createHeaderEntrywithFile:(id)a3 attributes:(stat *)a4
{
  id v6;
  const char *v7;
  _QWORD *v8;
  _QWORD *v9;
  void *v10;
  uint64_t v11;
  int *v12;
  char *v13;
  void *v14;
  int *v15;
  off_t st_size;
  uint64_t v18;
  uint8_t buf[4];
  char *v20;

  v6 = objc_retainAutorelease(a3);
  v7 = (const char *)objc_msgSend(v6, "UTF8String");
  if (!self->_useParallelCompression)
  {
    v11 = archive_entry_new();
    if (v11)
    {
      v9 = (_QWORD *)v11;
      archive_entry_copy_stat(v11, a4);
      archive_entry_set_pathname(v9, v7);
      goto LABEL_18;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SDArchive: archive_entry_new() failed!", buf, 2u);
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v14, "log:", CFSTR("SDArchive: archive_entry_new() failed!"), v18);
LABEL_16:

LABEL_17:
    v9 = 0;
    goto LABEL_18;
  }
  v8 = malloc_type_malloc(0x890uLL, 0x10000409D0E155EuLL);
  if (!v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v12 = __error();
      v13 = strerror(*v12);
      *(_DWORD *)buf = 136315138;
      v20 = v13;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SDArchive: malloc failed, err : %s", buf, 0xCu);
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v15 = __error();
    objc_msgSend(v14, "log:", CFSTR("SDArchive: malloc failed, err : %s"), strerror(*v15));
    goto LABEL_16;
  }
  v9 = v8;
  bzero(v8, 0x890uLL);
  if (strlen(v7) >= 0x400)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = (char *)v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SDArchive: header entry for file path %@ is too long, skipping.", buf, 0xCu);
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v10, "log:", CFSTR("SDArchive: header entry for file path %@ is too long, skipping."), v6);

    free(v9);
    goto LABEL_17;
  }
  v9[1] = *(_QWORD *)&a4->st_uid;
  *((_DWORD *)v9 + 4) = a4->st_flags;
  *((_DWORD *)v9 + 5) = 33188;
  st_size = a4->st_size;
  v9[8] = st_size;
  v9[5] = st_size;
  *v9 = 0x4600008201;
  __strlcpy_chk(v9 + 18, v7, 1024, 1024);
LABEL_18:

  return v9;
}

- (void)_disposeEntry:(void *)a3
{
  if (self->_useParallelCompression)
    free(a3);
  else
    archive_entry_free(a3, a2);
}

- (int)_writeArchiveHeader:(void *)a3
{
  int v4;
  int64_t archiveStatus;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  int64_t v10;
  __int16 v11;
  uint64_t v12;

  if (self->_useParallelCompression)
  {
    v4 = ParallelArchiveWriteEntryHeader(self->_writer, a3, 0, 0);
    if (v4 < 0)
      self->_archiveStatus = -30;
  }
  else
  {
    v4 = archive_write_header(self->_archive, a3);
    if (v4)
    {
      self->_archiveStatus = (int)archive_errno(self->_archive);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        archiveStatus = self->_archiveStatus;
        v6 = archive_error_string(self->_archive);
        *(_DWORD *)buf = 134218242;
        v10 = archiveStatus;
        v11 = 2080;
        v12 = v6;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SDArchive: failed to write header. Status: %zd, reason: %s", buf, 0x16u);
      }
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v7, "log:", CFSTR("SDArchive: failed to write header. Status: %zd, reason: %s"), self->_archiveStatus, archive_error_string(self->_archive));

    }
  }
  return v4;
}

- (int64_t)_writeEntryData:(void *)a3 size:(int64_t)a4
{
  int64_t v4;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int64_t v10;
  int v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint8_t buf[4];
  int64_t v17;
  __int16 v18;
  int v19;
  __int16 v20;
  uint64_t v21;

  v4 = a4;
  if (self->_useParallelCompression)
  {
    v6 = ParallelArchiveWriteEntryData(self->_writer, a3, a4);
    if ((_DWORD)v6)
    {
      v7 = v6;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v17) = v7;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SDArchive: ParallelCompression failed with error %d", buf, 8u);
      }
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v8, "log:", CFSTR("SDArchive: ParallelCompression failed with error %d"), v7);

      return (int)v7;
    }
  }
  else
  {
    v9 = archive_write_data(self->_archive, a3, a4);
    if (v9 != v4)
    {
      v10 = v9;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v11 = archive_errno(self->_archive);
        v12 = archive_error_string(self->_archive);
        *(_DWORD *)buf = 134218498;
        v17 = v10;
        v18 = 1024;
        v19 = v11;
        v20 = 2080;
        v21 = v12;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SDArchive: SDArchive failed by returning %zd with error number %d and string %s", buf, 0x1Cu);
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      v14 = archive_errno(self->_archive);
      objc_msgSend(v13, "log:", CFSTR("SDArchive: SDArchive failed by returning %zd with error number %d and string %s"), v10, v14, archive_error_string(self->_archive));

      return v10;
    }
  }
  return v4;
}

- (void)addArchiveObject:(id)a3
{
  id v4;
  unsigned int v5;
  void *v6;
  char *v7;
  void *v8;
  void *v9;
  id v10;
  int64_t archiveStatus;
  id v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  char *v28;
  void *v29;
  uint64_t v30;
  char *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  unint64_t v38;
  off_t v39;
  void *v40;
  id v41;
  void *v42;
  int64_t v43;
  int *v44;
  char *v45;
  void *v46;
  int *v47;
  int64_t compressed_size;
  off_t v49;
  void *v50;
  void *v51;
  void *v52;
  unsigned int v53;
  stat v54;
  void *v55;
  void *v56;
  uint8_t buf[4];
  char *v58;
  __int16 v59;
  char *v60;
  __int16 v61;
  int v62;

  v4 = a3;
  memset(&v54, 0, sizeof(v54));
  v5 = objc_msgSend(v4, "fd");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sourcePath"));
  v7 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "targetPath"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "offsets"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sizes"));
  if (!v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1000627E0();
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v14 = CFSTR("SDArchive: not going to add file to archive, as its source path is nil");
    objc_msgSend(v13, "stderrWrite:", CFSTR("SDArchive: not going to add file to archive, as its source path is nil"));

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v16 = v15;
    goto LABEL_12;
  }
  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_100062824((uint64_t)v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v14 = CFSTR("SDArchive: not going to add source file %@ to archive, as its target path is nil");
    objc_msgSend(v17, "stderrWrite:", CFSTR("SDArchive: not going to add source file %@ to archive, as its target path is nil"), v6);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v16 = v15;
    v50 = v6;
LABEL_12:
    objc_msgSend(v15, "log:", v14, v50);
LABEL_13:

    goto LABEL_14;
  }
  v10 = 0;
  archiveStatus = self->_archiveStatus;
  if (archiveStatus == -30 || archiveStatus == 1)
  {
    v12 = 0;
    goto LABEL_15;
  }
  if (self->_archiveFD < 0)
  {
LABEL_14:
    v10 = 0;
    v12 = 0;
    goto LABEL_15;
  }
  if (-[NSMutableSet containsObject:](self->_objects, "containsObject:", v7))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v58 = v7;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SDArchive: not going to add %@ to the archive, as it is already present", buf, 0xCu);
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v16, "log:", CFSTR("SDArchive: not going to add %@ to the archive, as it is already present"), v7);
    goto LABEL_13;
  }
  -[NSMutableSet addObject:](self->_objects, "addObject:", v7);
  if (v5 == -1)
  {
    v18 = objc_retainAutorelease(v6);
    v5 = sub_100053A74((const char *)objc_msgSend(v18, "fileSystemRepresentation"), 0);
    if (v5 == -1)
    {
      v34 = *__error();
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v58 = (char *)v18;
        v59 = 2080;
        v60 = strerror(v34);
        v61 = 1024;
        v62 = v34;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SDArchive: Error opening source file %@: %s (%d)", buf, 0x1Cu);
      }
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v35, "log:", CFSTR("SDArchive: Error opening source file %@: %s (%d)"), v18, strerror(v34), v34);

      goto LABEL_14;
    }
  }
  if (fstat(v5, &v54) == -1)
  {
    v30 = *__error();
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v31 = strerror(v30);
      *(_DWORD *)buf = 138412802;
      v58 = (char *)v6;
      v59 = 2080;
      v60 = v31;
      v61 = 1024;
      v62 = v30;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SDArchive: Failed to stat source file %@: %s (%d)", buf, 0x1Cu);
    }
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v32, "log:", CFSTR("SDArchive: Failed to stat source file %@: %s (%d)"), v6, strerror(v30), v30);

    v10 = 0;
    v12 = 0;
  }
  else
  {
    v53 = v5;
    if (v8
      && objc_msgSend(v8, "count")
      && (v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "valueForKeyPath:", CFSTR("@sum.self"))),
          v20 = objc_msgSend(v19, "longLongValue"),
          v19,
          v20)
      && (uint64_t)v20 < v54.st_size)
    {
      v54.st_size = (off_t)v20;
    }
    else
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0));
      v56 = v21;
      v22 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v56, 1));

      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v54.st_size));
      v55 = v23;
      v24 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v55, 1));

      v9 = (void *)v24;
      v8 = (void *)v22;
    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pathComponents"));
    v10 = objc_msgSend(v25, "mutableCopy");

    if (-[NSString length](self->_name, "length") && (unint64_t)objc_msgSend(v10, "count") >= 2)
      objc_msgSend(v10, "setObject:atIndexedSubscript:", self->_name, 0);
    v12 = (id)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](NSString, "pathWithComponents:", v10));
    v26 = -[SDArchive _createHeaderEntrywithFile:attributes:](self, "_createHeaderEntrywithFile:attributes:", v12, &v54);
    if (v26)
    {
      v27 = v26;
      if (!self->_useParallelCompression)
      {
        archive_entry_copy_sourcepath(v26, objc_msgSend(objc_retainAutorelease(v6), "UTF8String"));
        archive_read_disk_entry_from_file(self->_disk_reader, v27, v5, &v54);
        archive_entry_set_mode(v27, 33188);
      }
      v51 = v27;
      if (-[SDArchive _writeArchiveHeader:](self, "_writeArchiveHeader:", v27))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v28 = (char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
          *(_DWORD *)buf = 136315138;
          v58 = v28;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SDArchive: failed to write header for file, %s", buf, 0xCu);
        }
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
        v12 = objc_retainAutorelease(v12);
        objc_msgSend(v29, "log:", CFSTR("SDArchive: failed to write header for file, %s"), objc_msgSend(v12, "UTF8String"));

        -[SDArchive _disposeEntry:](self, "_disposeEntry:", v51);
      }
      else
      {
        v52 = v9;
        if (objc_msgSend(v8, "count"))
        {
          v36 = 0;
          while (1)
          {
            v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v36));
            v38 = (unint64_t)objc_msgSend(v37, "longLongValue");

            if (v38)
            {
              v39 = lseek(v53, v38, (v38 >> 62) & 2);
              if (v39 < 0)
                break;
            }
            v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "objectAtIndexedSubscript:", v36));
            v41 = objc_msgSend(v40, "longLongValue");

            if (-[SDArchive _writeChunk:maxSize:](self, "_writeChunk:maxSize:", v53, v41))
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v58 = (char *)v6;
                v59 = 2112;
                v60 = (char *)v12;
                _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SDArchive: Failed for file: %@, with destination at: %@", buf, 0x16u);
              }
              v42 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
              objc_msgSend(v42, "log:", CFSTR("SDArchive: Failed for file: %@, with destination at: %@"), v6, v12);

              goto LABEL_62;
            }
            if ((unint64_t)objc_msgSend(v8, "count") <= ++v36)
              goto LABEL_62;
          }
          v43 = v39;
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            v44 = __error();
            v45 = strerror(*v44);
            *(_DWORD *)buf = 136315138;
            v58 = v45;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "lseek failed :%s", buf, 0xCu);
          }
          v46 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
          v47 = __error();
          objc_msgSend(v46, "log:", CFSTR("lseek failed :%s"), strerror(*v47));

          self->_archiveStatus = v43;
        }
LABEL_62:
        compressed_size = self->_compressed_size;
        v49 = sub_100025FE4(self->_archiveFD);
        self->_compressed_size = v49;
        sub_1000261D4(self->_summaryFD, v7, self->_basePath, (void *)v54.st_size, (void *)(v49 - compressed_size));
        -[SDArchive _disposeEntry:](self, "_disposeEntry:", v51);
        self->_uncompressed_size += v54.st_size;
        v9 = v52;
        v5 = v53;
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SDArchive: creating entry for header failed", buf, 2u);
      }
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v33, "log:", CFSTR("SDArchive: creating entry for header failed"));

    }
  }
  if (objc_msgSend(v4, "fd") == -1)
    close(v5);
LABEL_15:

}

- (void)addFileToArchive:(id)a3 withFileName:(id)a4
{
  id v6;
  id v7;
  SDArchiveFile *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[SDArchiveFile initWithPath:target:ofType:]([SDArchiveFile alloc], "initWithPath:target:ofType:", v7, v6, NSFileTypeRegular);

  -[SDArchive addArchiveObject:](self, "addArchiveObject:", v8);
}

- (void)addDirectoryToArchive:(id)a3 withDirName:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _QWORD v30[2];

  v5 = a3;
  v23 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v21 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v5, 1));
  v30[0] = NSURLNameKey;
  v30[1] = NSURLIsDirectoryKey;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v30, 2));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v7, v8, 20, &stru_10009A120));

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v26;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v26 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v14);
        v16 = objc_autoreleasePoolPush();
        v24 = 0;
        objc_msgSend(v15, "getResourceValue:forKey:error:", &v24, NSURLIsDirectoryKey, 0);
        v17 = v24;
        if ((objc_msgSend(v17, "BOOLValue") & 1) == 0)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "relativePath"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "path"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "stringByAppendingPathComponent:", v18));
          -[SDArchive addFileToArchive:withFileName:](self, "addFileToArchive:withFileName:", v19, v20);

        }
        objc_autoreleasePoolPop(v16);
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v12);
  }

}

- (void)addArchiveFile:(id)a3
{
  id v4;
  NSFileAttributeType v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    v8 = v4;
    v5 = (NSFileAttributeType)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fileType"));

    if (v5 == NSFileTypeDirectory)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sourcePath"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "targetPath"));
      -[SDArchive addDirectoryToArchive:withDirName:](self, "addDirectoryToArchive:withDirName:", v6, v7);

    }
    else
    {
      -[SDArchive addArchiveObject:](self, "addArchiveObject:", v8);
    }
    v4 = v8;
  }

}

- (int)getProtectionClass
{
  return sub_100025750(self->_archiveFD);
}

- (int64_t)getUncompressedSize
{
  return self->_uncompressed_size;
}

- (void)closeArchive
{
  int archiveFD;
  void *v4;
  int v5;
  int v6;
  void *v7;
  uint8_t buf[4];
  int v9;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    archiveFD = self->_archiveFD;
    *(_DWORD *)buf = 67109120;
    v9 = archiveFD;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SDArchive: Closing archive with descriptor %d", buf, 8u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v4, "log:", CFSTR("SDArchive: Closing archive with descriptor %d"), self->_archiveFD);

  v5 = self->_archiveFD;
  if (v5 < 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v6 = self->_archiveFD;
      *(_DWORD *)buf = 67109120;
      v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SDArchive: Not a valid tar descriptor %d to close", buf, 8u);
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v7, "log:", CFSTR("SDArchive: Not a valid tar descriptor %d to close"), self->_archiveFD);

  }
  else
  {
    close(v5);
  }
  self->_archiveFD = -1;
}

- (void)finalizeArchiveAndClose:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  FILE *summaryFD;
  void *v9;
  unsigned __int8 v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  void *v17;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSString stringByAppendingString:](self->_basePath, "stringByAppendingString:", CFSTR("-diagnostic_summary.log")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSString lastPathComponent](self->_basePath, "lastPathComponent"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("/summaries/diagnostic_summary.log")));

  summaryFD = self->_summaryFD;
  if (summaryFD)
  {
    fclose(summaryFD);
    -[SDArchive addFileToArchive:withFileName:](self, "addFileToArchive:withFileName:", v5, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v15 = 0;
    v10 = objc_msgSend(v9, "removeItemAtPath:error:", v5, &v15);
    v11 = v15;

    if ((v10 & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedDescription"));
        *(_DWORD *)buf = 138412290;
        v17 = v12;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SDARCHIVE: error removing summary file %@", buf, 0xCu);

      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedDescription"));
      objc_msgSend(v13, "log:", CFSTR("SDARCHIVE: error removing summary file %@"), v14);

    }
  }
  if (self->_useParallelCompression)
  {
    ParallelArchiveWriterDestroy(self->_writer);
    ParallelCompressionOStreamDestroy(self->_ostream);
    if (!v3)
      goto LABEL_10;
    goto LABEL_9;
  }
  archive_write_close(self->_archive);
  archive_write_free(self->_archive);
  archive_read_free(self->_disk_reader);
  if (v3)
LABEL_9:
    -[SDArchive closeArchive](self, "closeArchive");
LABEL_10:
  if (!self->_archiveStatus)
    self->_archiveStatus = 1;

}

- (OS_dispatch_queue)tarQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 112, 1);
}

- (void)setTarQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (int64_t)archiveStatus
{
  return self->_archiveStatus;
}

- (void)setArchiveStatus:(int64_t)a3
{
  self->_archiveStatus = a3;
}

- (int)archiveFD
{
  return self->_archiveFD;
}

- (void)setArchiveFD:(int)a3
{
  self->_archiveFD = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tarQueue, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_objects, 0);
  objc_storeStrong((id *)&self->_basePath, 0);
}

@end
