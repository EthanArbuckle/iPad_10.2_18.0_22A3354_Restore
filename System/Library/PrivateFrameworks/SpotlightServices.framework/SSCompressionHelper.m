@implementation SSCompressionHelper

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__SSCompressionHelper_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance_shared;
}

void __37__SSCompressionHelper_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_shared;
  sharedInstance_shared = (uint64_t)v1;

}

- (char)getDataOutWithSize:(unint64_t)a3 withFlag:(unint64_t)a4 fd:(int *)a5
{
  int TemporaryFileOfSize;
  int v8;
  char *result;
  NSObject *v10;

  *a5 = -1;
  TemporaryFileOfSize = allocateTemporaryFileOfSize(a3, a4);
  if (TemporaryFileOfSize < 0)
  {
    PRSLogCategoryDefault();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SSCompressionHelper getDataOutWithSize:withFlag:fd:].cold.1();
  }
  else
  {
    v8 = TemporaryFileOfSize;
    result = (char *)mmap(0, a3, 3, 1, TemporaryFileOfSize, 0);
    if (result != (char *)-1)
    {
      *a5 = v8;
      return result;
    }
    close(v8);
    PRSLogCategoryDefault();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SSCompressionHelper getDataOutWithSize:withFlag:fd:].cold.2();
  }

  return 0;
}

- (void)uncompressedContentsForCompressedFile:(id)a3 outPath:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  const uint8_t *v12;
  size_t v13;
  size_t v14;
  uint8_t *v15;
  uint64_t v16;
  int v17;
  int v18;
  NSObject *v19;
  NSObject *v20;
  _QWORD v21[6];
  int v22;
  int v23;
  uint64_t v24;
  id v25;

  v5 = a4;
  v6 = (objc_class *)MEMORY[0x1E0C99D50];
  v7 = a3;
  v25 = 0;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithContentsOfFile:options:error:", v7, 8, &v25);

  v9 = v25;
  if (v9)
  {
    PRSLogCategoryDefault();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
      -[SSCompressionHelper uncompressedContentsForCompressedFile:outPath:].cold.4();
    goto LABEL_16;
  }
  v24 = -1;
  v23 = -1;
  v11 = objc_msgSend(v8, "length");
  v12 = (const uint8_t *)objc_msgSend(objc_retainAutorelease(v8), "bytes");
  v13 = *((_QWORD *)v12 - 1);
  v14 = doBlockDecompression(v12, v11 - 8, v13, (uint8_t **)&v24, COMPRESSION_LZFSE, &v23);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __69__SSCompressionHelper_uncompressedContentsForCompressedFile_outPath___block_invoke;
  v21[3] = &__block_descriptor_52_e5_v8__0l;
  v15 = (uint8_t *)v24;
  v21[4] = v24;
  v21[5] = v14;
  v22 = v23;
  v16 = MEMORY[0x1BCCB38DC](v21);
  v10 = v16;
  if (!v14)
  {
    (*(void (**)(uint64_t))(v16 + 16))(v16);
    PRSLogCategoryDefault();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[SSCompressionHelper uncompressedContentsForCompressedFile:outPath:].cold.1();
    goto LABEL_15;
  }
  v17 = open((const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"), 514, 384);
  if (v17 < 0)
  {
    PRSLogCategoryDefault();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[SSCompressionHelper uncompressedContentsForCompressedFile:outPath:].cold.2();
LABEL_15:

    goto LABEL_16;
  }
  v18 = v17;
  if (write(v17, v15, v13) == -1)
  {
    PRSLogCategoryDefault();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[SSCompressionHelper uncompressedContentsForCompressedFile:outPath:].cold.1();

  }
  close(v18);
  (*(void (**)(uint64_t))(v10 + 16))(v10);
LABEL_16:

}

uint64_t __69__SSCompressionHelper_uncompressedContentsForCompressedFile_outPath___block_invoke(uint64_t a1)
{
  uint64_t result;
  int v3;
  char v4[1024];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  result = munmap(*(void **)(a1 + 32), *(_QWORD *)(a1 + 40));
  v3 = *(_DWORD *)(a1 + 48);
  if (v3 != -1)
  {
    bzero(v4, 0x400uLL);
    if ((fcntl(v3, 50, v4) & 0x80000000) == 0)
    {
      if (v4[0])
        unlink(v4);
    }
    return close(*(_DWORD *)(a1 + 48));
  }
  return result;
}

- (int)unpackageTarForFd:(int)a3 size:(unint64_t)a4 parentDir:(const char *)a5
{
  int v8;
  int v9;
  void *v10;
  void *v11;
  int support_filter_bzip2;
  int support_format_tar;
  int v14;
  int open_memory;
  int v16;
  size_t v17;
  uint64_t v19;
  uint64_t v20;
  stat v21;
  _BYTE v22[1024];
  char v23[1024];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  memset(&v21, 0, sizeof(v21));
  if (stat(a5, &v21) == -1 && mkdir(a5, 0x1C0u))
    return -1;
  bzero(v23, 0x400uLL);
  __strcpy_chk();
  __strcat_chk();
  v8 = open(v23, 2562, 384);
  if (v8 < 0)
    return -1;
  v9 = v8;
  v10 = mmap(0, 0x2800000uLL, 3, 1, v8, 0);
  if (v10 == (void *)-1)
  {
    v17 = 41943040;
LABEL_15:
    munmap((void *)0xFFFFFFFFFFFFFFFFLL, v17);
    close(v9);
    return -1;
  }
  v11 = v10;
  if (mmap(0, a4, 1, 1, a3, 0) == (void *)-1)
  {
    v17 = a4;
    goto LABEL_15;
  }
  archive_read_new();
  archive_write_disk_new();
  support_filter_bzip2 = archive_read_support_filter_bzip2();
  support_format_tar = archive_read_support_format_tar();
  v14 = archive_write_disk_set_standard_lookup();
  open_memory = archive_read_open_memory();
  v16 = -1;
  if (!support_filter_bzip2 && !support_format_tar && !v14 && !open_memory)
  {
    if (archive_read_next_header())
    {
LABEL_10:
      archive_write_free();
      archive_read_free();
      sync();
      munmap(v11, 0x2800000uLL);
      unlink(v23);
      v16 = 0;
    }
    else
    {
      while (1)
      {
        bzero(v22, 0x400uLL);
        __strcpy_chk();
        __strcat_chk();
        archive_entry_pathname();
        __strcat_chk();
        archive_entry_set_pathname();
        if (archive_write_header())
          break;
        v19 = archive_entry_size();
        if (v19 > 41943040)
          break;
        v20 = v19;
        if (archive_read_data_into_fd()
          || archive_write_data() != v20
          || lseek(v9, 0, 0)
          || ftruncate(v9, 0)
          || archive_write_finish_entry())
        {
          break;
        }
        if (archive_read_next_header())
          goto LABEL_10;
      }
      munmap(v11, 0x2800000uLL);
      v16 = -1;
    }
    close(v9);
  }
  return v16;
}

- (int)unTarFileWithFd:(id)a3 toPath:(id)a4
{
  id v6;
  id v7;
  int v8;
  int v9;
  NSObject *v10;
  int v11;
  NSObject *v12;
  uint8_t v14[16];
  stat v15;

  v6 = a3;
  v7 = a4;
  v8 = dup(objc_msgSend(v6, "fileDescriptor"));
  if ((v8 & 0x80000000) == 0)
  {
    v9 = v8;
    memset(&v15, 0, sizeof(v15));
    if (fstat(v8, &v15))
    {
      close(v9);
      PRSLogCategoryDefault();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[SSCompressionHelper unTarFileWithFd:toPath:].cold.2(v10);
    }
    else
    {
      v11 = -[SSCompressionHelper unpackageTarForFd:size:parentDir:](self, "unpackageTarForFd:size:parentDir:", objc_msgSend(v6, "fileDescriptor"), v15.st_size, objc_msgSend(objc_retainAutorelease(v7), "UTF8String"));
      PRSLogCategoryDefault();
      v12 = objc_claimAutoreleasedReturnValue();
      v10 = v12;
      if (!v11)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v14 = 0;
          _os_log_impl(&dword_1B86C5000, v10, OS_LOG_TYPE_DEFAULT, "[Model loading] unpackaged resources version", v14, 2u);
          v11 = 0;
        }
        goto LABEL_10;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[SSCompressionHelper unTarFileWithFd:toPath:].cold.1();
    }
    v11 = -1;
LABEL_10:

    goto LABEL_11;
  }
  v11 = -1;
LABEL_11:

  return v11;
}

- (void)getDataOutWithSize:withFlag:fd:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B86C5000, v0, v1, "[Model loading] Error opening encrypted file", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)getDataOutWithSize:withFlag:fd:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B86C5000, v0, v1, "[Model loading] Error reading mmaped encrypted file", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)uncompressedContentsForCompressedFile:outPath:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B86C5000, v0, v1, "[Model loading] returning unsuccessfully post decompression due to invalid destination size", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)uncompressedContentsForCompressedFile:outPath:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B86C5000, v0, v1, "[Model loading] Error in out file.\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)uncompressedContentsForCompressedFile:outPath:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B86C5000, v0, v1, "[Model loading] Error reading data from compressed file", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)unTarFileWithFd:toPath:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B86C5000, v0, v1, "[Model loading] failed to unpackage resources", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)unTarFileWithFd:(NSObject *)a1 toPath:.cold.2(NSObject *a1)
{
  int *v2;
  char *v3;
  int v4;
  char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = __error();
  v3 = strerror(*v2);
  v4 = 136315138;
  v5 = v3;
  _os_log_error_impl(&dword_1B86C5000, a1, OS_LOG_TYPE_ERROR, "failed stat %s", (uint8_t *)&v4, 0xCu);
}

@end
