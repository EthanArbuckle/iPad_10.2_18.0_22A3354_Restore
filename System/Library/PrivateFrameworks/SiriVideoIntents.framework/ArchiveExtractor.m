@implementation ArchiveExtractor

- (archive)createReadArchive
{
  uint64_t v2;
  archive *v3;
  NSObject *v4;
  NSObject *v5;
  int support_filter_all;
  uint8_t v8[16];

  v2 = archive_read_new();
  if (!v2)
  {
    TRILogCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[ArchiveExtractor createReadArchive].cold.1();
    goto LABEL_10;
  }
  v3 = (archive *)v2;
  if (archive_read_support_format_zip())
  {
    TRILogCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
LABEL_5:

      if (!archive_read_free())
        return 0;
      TRILogCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_21E85A000, v5, OS_LOG_TYPE_DEFAULT, "Unable to free archive_read (leaking)", v8, 2u);
      }
LABEL_10:

      return 0;
    }
LABEL_4:
    -[ArchiveExtractor createReadArchive].cold.2();
    goto LABEL_5;
  }
  support_filter_all = archive_read_support_filter_all();
  if (support_filter_all != -20 && support_filter_all)
  {
    TRILogCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      goto LABEL_5;
    goto LABEL_4;
  }
  return v3;
}

- (archive)createWriteDiskArchive
{
  archive *v2;
  NSObject *v3;
  NSObject *v4;
  uint8_t v6[16];

  v2 = (archive *)archive_write_disk_new();
  if (v2)
  {
    if (archive_write_disk_set_standard_lookup())
    {
      TRILogCategory();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        -[ArchiveExtractor createWriteDiskArchive].cold.2();
    }
    else
    {
      if (!archive_write_disk_set_options())
        return v2;
      TRILogCategory();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        -[ArchiveExtractor createWriteDiskArchive].cold.1();
    }

    if (archive_write_free())
    {
      TRILogCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_21E85A000, v4, OS_LOG_TYPE_DEFAULT, "Unable to free archive_write_disk (leaking)", v6, 2u);
      }

    }
    return 0;
  }
  return v2;
}

- (BOOL)copyDataFromReadArchive:(archive *)a3 toWriteDiskArchive:(archive *)a4
{
  int data_block;
  NSObject *v5;

  while (1)
  {
    data_block = archive_read_data_block();
    if (data_block)
      break;
    if (archive_write_data_block() < 0)
    {
      TRILogCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        -[ArchiveExtractor copyDataFromReadArchive:toWriteDiskArchive:].cold.2();
      goto LABEL_8;
    }
  }
  if (data_block == 1)
    return data_block;
  TRILogCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[ArchiveExtractor copyDataFromReadArchive:toWriteDiskArchive:].cold.1();
LABEL_8:

  LOBYTE(data_block) = 0;
  return data_block;
}

- (BOOL)performExtractionForArchive:(archive *)a3 toDestinationDirectory:(id)a4
{
  id v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  archive *v12;
  archive *v13;
  void *v14;
  int next_header;
  int v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  int v21;
  NSObject *v22;
  size_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  BOOL v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  uint8_t v37;
  _BYTE v38[15];
  uint64_t v39;
  id v40;
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  size_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0;
  v8 = objc_msgSend(v7, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v6, 1, 0, &v40);
  v9 = v40;

  if ((v8 & 1) == 0)
  {
    -[NSObject domain](v9, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BDD0B88]))
    {
      v11 = -[NSObject code](v9, "code");

      if (v11 == 516)
        goto LABEL_4;
    }
    else
    {

    }
    TRILogCategory();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      -[ArchiveExtractor performExtractionForArchive:toDestinationDirectory:].cold.10();

    goto LABEL_39;
  }
LABEL_4:

  v12 = -[ArchiveExtractor createWriteDiskArchive](self, "createWriteDiskArchive");
  if (!v12)
  {
    TRILogCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ArchiveExtractor performExtractionForArchive:toDestinationDirectory:].cold.1();
LABEL_39:
    v32 = 0;
    goto LABEL_59;
  }
  v13 = v12;
  objc_msgSend(v6, "URLByResolvingSymlinksInPath");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  do
  {
    v39 = 0;
    next_header = archive_read_next_header();
    if (next_header)
    {
      if (next_header == 1)
      {
        v32 = 1;
        goto LABEL_51;
      }
      TRILogCategory();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        -[ArchiveExtractor performExtractionForArchive:toDestinationDirectory:].cold.4();
      goto LABEL_46;
    }
    v16 = archive_entry_filetype();
    v17 = (void *)MEMORY[0x2207B3714]();
    v18 = archive_entry_pathname_utf8();
    if (!v18)
    {
      TRILogCategory();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        -[ArchiveExtractor performExtractionForArchive:toDestinationDirectory:].cold.5();

      objc_autoreleasePoolPop(v17);
      goto LABEL_50;
    }
    v19 = (const char *)v18;
    v20 = 0;
    do
      v21 = *(unsigned __int8 *)(v18 + v20++);
    while (v21 == 47);
    if (v20 != 1)
    {
      TRILogCategory();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v23 = strlen(v19);
        *(_DWORD *)buf = 134218240;
        v42 = v20 - 1;
        v43 = 2048;
        v44 = v23;
        _os_log_impl(&dword_21E85A000, v22, OS_LOG_TYPE_INFO, "archive_entry with absolute path encountered...ignoring leading %zu of %zu bytes.", buf, 0x16u);
      }

    }
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", &v19[v20 - 1]);
    v25 = v24;
    if (!v24)
    {
      TRILogCategory();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v42 = (uint64_t)&v19[v20 - 1];
        _os_log_error_impl(&dword_21E85A000, v27, OS_LOG_TYPE_ERROR, "Unable to initialize entry path with string %s", buf, 0xCu);
      }
      LODWORD(v26) = 1;
      goto LABEL_23;
    }
    v26 = objc_msgSend(v24, "length");
    if (!v26 && v16 != 0x4000)
    {
      TRILogCategory();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        -[ArchiveExtractor performExtractionForArchive:toDestinationDirectory:].cold.9(&v37, v38, v27);
      LODWORD(v26) = 2;
LABEL_23:

      objc_autoreleasePoolPop(v17);
      continue;
    }
    objc_msgSend(v14, "path");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "stringByAppendingPathComponent:", v25);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = objc_retainAutorelease(v29);
    objc_msgSend(v30, "fileSystemRepresentation");
    archive_entry_update_pathname_utf8();

    objc_autoreleasePoolPop(v17);
    archive_entry_perm();
    archive_entry_set_perm();
    if (v26)
    {
      if (archive_write_header())
      {
        TRILogCategory();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          -[ArchiveExtractor performExtractionForArchive:toDestinationDirectory:].cold.8();
        goto LABEL_46;
      }
      if ((!archive_entry_size_is_set() || archive_entry_size() >= 1)
        && !-[ArchiveExtractor copyDataFromReadArchive:toWriteDiskArchive:](self, "copyDataFromReadArchive:toWriteDiskArchive:", a3, v13))
      {
        TRILogCategory();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          -[ArchiveExtractor performExtractionForArchive:toDestinationDirectory:].cold.7();
        goto LABEL_46;
      }
      if (archive_write_finish_entry())
      {
        TRILogCategory();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          -[ArchiveExtractor performExtractionForArchive:toDestinationDirectory:].cold.6();
LABEL_46:

        goto LABEL_50;
      }
      LODWORD(v26) = 0;
    }
  }
  while (!(_DWORD)v26);
  if ((_DWORD)v26 != 2)
  {
    v32 = 0;
    goto LABEL_60;
  }
LABEL_50:
  v32 = 0;
LABEL_51:
  if (archive_write_close())
  {
    TRILogCategory();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      -[ArchiveExtractor performExtractionForArchive:toDestinationDirectory:].cold.3();

    v32 = 0;
  }
  if (archive_write_free())
  {
    TRILogCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ArchiveExtractor performExtractionForArchive:toDestinationDirectory:].cold.2();
    v6 = v14;
LABEL_59:

    v14 = v6;
  }
LABEL_60:

  return v32;
}

- (BOOL)unarchiveData:(id)a3 toDestinationDirectory:(id)a4
{
  id v6;
  id v7;
  archive *v8;
  archive *v9;
  id v10;
  NSObject *v11;
  BOOL v12;
  NSObject *v13;
  uint8_t v15[16];

  v6 = a3;
  v7 = a4;
  v8 = -[ArchiveExtractor createReadArchive](self, "createReadArchive");
  if (!v8)
  {
    TRILogCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[ArchiveExtractor unarchiveData:toDestinationDirectory:].cold.1();
    v12 = 0;
    goto LABEL_16;
  }
  v9 = v8;
  v10 = objc_retainAutorelease(v6);
  objc_msgSend(v10, "bytes");
  objc_msgSend(v10, "length");
  if (archive_read_open_memory())
  {
    TRILogCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[ArchiveExtractor unarchiveData:toDestinationDirectory:].cold.3();
    v12 = 0;
  }
  else
  {
    v12 = -[ArchiveExtractor performExtractionForArchive:toDestinationDirectory:](self, "performExtractionForArchive:toDestinationDirectory:", v9, v7);
    if (!archive_read_close())
      goto LABEL_13;
    TRILogCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[ArchiveExtractor unarchiveData:toDestinationDirectory:].cold.2();
  }

LABEL_13:
  if (archive_read_free())
  {
    TRILogCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_21E85A000, v13, OS_LOG_TYPE_DEFAULT, "unable to free archive_read (leaking)", v15, 2u);
    }
LABEL_16:

  }
  return v12;
}

- (BOOL)extractArchiveAtURL:(id)a3 toDestinationDirectoryURL:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  BOOL v11;
  NSObject *v12;
  id v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithContentsOfFile:options:error:", v8, 8, &v14);
  v10 = v14;
  if (!v9)
  {
    TRILogCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[ArchiveExtractor extractArchiveAtURL:toDestinationDirectoryURL:].cold.1();
    goto LABEL_8;
  }
  if (!-[ArchiveExtractor unarchiveData:toDestinationDirectory:](self, "unarchiveData:toDestinationDirectory:", v9, v7))
  {
    TRILogCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[ArchiveExtractor extractArchiveAtURL:toDestinationDirectoryURL:].cold.2();
LABEL_8:

    v11 = 0;
    goto LABEL_9;
  }
  v11 = 1;
LABEL_9:

  return v11;
}

- (void)createReadArchive
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21E85A000, v0, v1, "archive_read unable to set supported formats: %s.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)createWriteDiskArchive
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21E85A000, v0, v1, "archive_write_disk unable to set lookup functions - %s.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)copyDataFromReadArchive:toWriteDiskArchive:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21E85A000, v0, v1, "archive_read_data_block failed - %s.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)copyDataFromReadArchive:toWriteDiskArchive:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21E85A000, v0, v1, "archive_write_data_block failed - %s.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)performExtractionForArchive:toDestinationDirectory:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_21E85A000, v0, v1, "Error creating disk archive for writing.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)performExtractionForArchive:toDestinationDirectory:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_21E85A000, v0, v1, "unable to free archive_write_disk", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)performExtractionForArchive:toDestinationDirectory:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_21E85A000, v0, v1, "unable to close archive_write_disk", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)performExtractionForArchive:toDestinationDirectory:.cold.4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21E85A000, v0, v1, "archive_read_next_header failed - %s.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)performExtractionForArchive:toDestinationDirectory:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_21E85A000, v0, v1, "archive_entry with no path encountered.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)performExtractionForArchive:toDestinationDirectory:.cold.6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21E85A000, v0, v1, "archive_write_finish_entry failed - %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)performExtractionForArchive:toDestinationDirectory:.cold.7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21E85A000, v0, v1, "error copying data to write archive - %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)performExtractionForArchive:toDestinationDirectory:.cold.8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21E85A000, v0, v1, "archive_write_header failed - %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)performExtractionForArchive:(os_log_t)log toDestinationDirectory:.cold.9(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_21E85A000, log, OS_LOG_TYPE_ERROR, "archive_entry with no path after sanitization encountered.", buf, 2u);
}

- (void)performExtractionForArchive:toDestinationDirectory:.cold.10()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_21E85A000, v0, v1, "failed to create directory at %@ - %@.");
  OUTLINED_FUNCTION_9();
}

- (void)unarchiveData:toDestinationDirectory:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_21E85A000, v0, v1, "Error creating archive for reading.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)unarchiveData:toDestinationDirectory:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21E85A000, v0, v1, "unable to close archive_read - %s.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)unarchiveData:toDestinationDirectory:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21E85A000, v0, v1, "unable to open archive_read - %s.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)extractArchiveAtURL:toDestinationDirectoryURL:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_21E85A000, v0, v1, "Error reading archive file at %@: %@");
  OUTLINED_FUNCTION_9();
}

- (void)extractArchiveAtURL:toDestinationDirectoryURL:.cold.2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_21E85A000, v0, OS_LOG_TYPE_ERROR, "Error unarchiving file at %@", v1, 0xCu);
  OUTLINED_FUNCTION_9();
}

@end
