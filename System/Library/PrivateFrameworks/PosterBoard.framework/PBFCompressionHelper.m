@implementation PBFCompressionHelper

+ (int)unpackageTarData:(void *)a3 size:(unint64_t)a4 parentDir:(const char *)a5
{
  int v6;
  int v7;
  void *v8;
  void *v9;
  int support_filter_gzip;
  int support_format_tar;
  int v12;
  int open_memory;
  int result;
  uint64_t v15;
  uint64_t v16;
  stat v17;
  char v18[1024];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  memset(&v17, 0, sizeof(v17));
  if (stat(a5, &v17) == -1 && mkdir(a5, 0x1C0u))
    return -1;
  __strcpy_chk();
  __strcat_chk();
  v6 = open(v18, 2562, 384);
  if (v6 < 0)
    return -1;
  v7 = v6;
  v8 = mmap(0, 0x2800000uLL, 3, 1, v6, 0);
  if (v8 == (void *)-1)
  {
    close(v7);
    return -1;
  }
  v9 = v8;
  archive_read_new();
  archive_write_disk_new();
  support_filter_gzip = archive_read_support_filter_gzip();
  support_format_tar = archive_read_support_format_tar();
  v12 = archive_write_disk_set_standard_lookup();
  open_memory = archive_read_open_memory();
  result = -1;
  if (!support_filter_gzip && !support_format_tar && !v12 && !open_memory)
  {
    if (archive_read_next_header())
    {
LABEL_9:
      archive_write_free();
      archive_read_free();
      sync();
      munmap(v9, 0x2800000uLL);
      unlink(v18);
      close(v7);
      return 0;
    }
    while (1)
    {
      __strcpy_chk();
      __strcat_chk();
      archive_entry_pathname();
      __strcat_chk();
      archive_entry_set_pathname();
      if (archive_write_header())
        return -1;
      v15 = archive_entry_size();
      if (v15 > 41943040)
        return -1;
      v16 = v15;
      if (archive_read_data_into_fd()
        || archive_write_data() != v16
        || lseek(v7, 0, 0)
        || ftruncate(v7, 0)
        || archive_write_finish_entry())
      {
        return -1;
      }
      if (archive_read_next_header())
        goto LABEL_9;
    }
  }
  return result;
}

+ (int)unTarFileWithFd:(id)a3 toPath:(id)a4
{
  id v6;
  id v7;
  int v8;
  int v9;
  NSObject *v10;
  int *v11;
  char *v12;
  int v13;
  void *v14;
  off_t st_size;
  NSObject *v16;
  _BOOL4 v17;
  stat v19;
  uint8_t buf[4];
  char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = dup(objc_msgSend(v6, "fileDescriptor"));
  if (v8 < 0)
  {
    v13 = -1;
  }
  else
  {
    v9 = v8;
    memset(&v19, 0, sizeof(v19));
    if (fstat(v8, &v19))
    {
      close(v9);
      PBFLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = __error();
        v12 = strerror(*v11);
        *(_DWORD *)buf = 136315138;
        v21 = v12;
        _os_log_impl(&dword_1CB9FA000, v10, OS_LOG_TYPE_INFO, "failed stat %s", buf, 0xCu);
      }
      v13 = -1;
    }
    else
    {
      objc_msgSend(v6, "availableData");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      st_size = v19.st_size;
      v10 = objc_retainAutorelease(v14);
      LODWORD(st_size) = objc_msgSend(a1, "unpackageTarData:size:parentDir:", -[NSObject bytes](v10, "bytes"), st_size, objc_msgSend(objc_retainAutorelease(v7), "UTF8String"));
      PBFLogCommon();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
      if ((_DWORD)st_size)
      {
        if (v17)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CB9FA000, v16, OS_LOG_TYPE_INFO, "failed to unpackage resources", buf, 2u);
        }
        v13 = -1;
      }
      else
      {
        if (v17)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CB9FA000, v16, OS_LOG_TYPE_INFO, "unpackaged resources version", buf, 2u);
        }
        v13 = 0;
      }

    }
  }

  return v13;
}

+ (BOOL)unarchiveFileAtURL:(id)a3 toURL:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0CB3608];
  v7 = a4;
  objc_msgSend(a3, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fileHandleForReadingAtPath:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a1) = objc_msgSend(a1, "unTarFileWithFd:toPath:", v9, v10) == 0;
  return (char)a1;
}

@end
