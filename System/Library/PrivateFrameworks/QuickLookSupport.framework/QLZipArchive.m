@implementation QLZipArchive

- (id)libarchiveError
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  if (self->_archive)
  {
    v2 = archive_error_string();
    if (v2)
    {
      v7 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v2);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v8[0] = v3;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], (int)archive_errno(), v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 12, 0);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (QLZipArchive)initWithURL:(id)a3 error:(id *)a4
{
  id v7;
  QLZipArchive *v8;
  QLZipArchive *v9;
  QLZipArchive *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)QLZipArchive;
  v8 = -[QLZipArchive init](&v12, sel_init);
  v9 = v8;
  if (v8 && (objc_storeStrong((id *)&v8->_url, a3), !-[QLZipArchive _reopenWithError:](v9, "_reopenWithError:", a4)))
    v10 = 0;
  else
    v10 = v9;

  return v10;
}

- (QLZipArchive)initWithData:(id)a3 error:(id *)a4
{
  id v7;
  QLZipArchive *v8;
  QLZipArchive *v9;
  QLZipArchive *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)QLZipArchive;
  v8 = -[QLZipArchive init](&v12, sel_init);
  v9 = v8;
  if (v8 && (objc_storeStrong((id *)&v8->_data, a3), !-[QLZipArchive _reopenWithError:](v9, "_reopenWithError:", a4)))
    v10 = 0;
  else
    v10 = v9;

  return v10;
}

- (BOOL)_reopenWithError:(id *)a3
{
  archive *v5;
  NSObject *v6;
  NSURL *url;
  const char *v8;
  BOOL result;
  NSObject *v10;
  NSURL *v11;
  id v12;
  NSURL *v13;
  NSURL *v14;
  NSData *data;
  NSURL *v16;
  int v17;
  NSURL *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = (archive *)archive_read_new();
  self->_archive = v5;
  if (v5)
  {
    if (archive_read_support_filter_all() || archive_read_support_format_all())
    {
      v6 = _qlsLogHandle;
      if (!_qlsLogHandle)
      {
        QLSInitLogging();
        v6 = _qlsLogHandle;
      }
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        goto LABEL_9;
      url = self->_url;
      v17 = 138412290;
      v18 = url;
      v8 = "Could not configure archive struct to unzip %@ #Conversion";
    }
    else
    {
      v13 = self->_url;
      if (v13
        && (-[NSURL fileSystemRepresentation](v13, "fileSystemRepresentation"),
            archive_read_open_filename()))
      {
        v6 = _qlsLogHandle;
        if (!_qlsLogHandle)
        {
          QLSInitLogging();
          v6 = _qlsLogHandle;
        }
        if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
          goto LABEL_9;
        v14 = self->_url;
        v17 = 138412290;
        v18 = v14;
        v8 = "Could not unzip %@ #Conversion";
      }
      else
      {
        data = self->_data;
        if (!data)
          return 1;
        -[NSData bytes](data, "bytes");
        -[NSData length](self->_data, "length");
        if (!archive_read_open_memory())
          return 1;
        v6 = _qlsLogHandle;
        if (!_qlsLogHandle)
        {
          QLSInitLogging();
          v6 = _qlsLogHandle;
        }
        if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
          goto LABEL_9;
        v16 = self->_url;
        v17 = 138412290;
        v18 = v16;
        v8 = "Could not unzip %@ #Conversion";
      }
    }
    _os_log_impl(&dword_20D4C7000, v6, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v17, 0xCu);
LABEL_9:
    if (a3)
    {
      -[QLZipArchive libarchiveError](self, "libarchiveError");
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    archive_read_free();
    result = 0;
    self->_archive = 0;
    return result;
  }
  v10 = _qlsLogHandle;
  if (!_qlsLogHandle)
  {
    QLSInitLogging();
    v10 = _qlsLogHandle;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = self->_url;
    v17 = 138412290;
    v18 = v11;
    _os_log_impl(&dword_20D4C7000, v10, OS_LOG_TYPE_DEFAULT, "Could not create archive struct to unzip %@ #Conversion", (uint8_t *)&v17, 0xCu);
  }
  if (!a3)
    return 0;
  -[QLZipArchive libarchiveError](self, "libarchiveError");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  result = 0;
  *a3 = v12;
  return result;
}

- (id)readCurrentDataWithEntry:(archive_entry *)a3 error:(id *)a4
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  uint64_t data;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  int v17;
  uint64_t v18;
  uint64_t v19;

  v4 = MEMORY[0x24BDAC7A8](self, a2, a3, a4);
  v6 = v5;
  v7 = (void *)v4;
  v19 = *MEMORY[0x24BDAC8D0];
  if (archive_entry_size_is_set())
  {
    v8 = archive_entry_size();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithCapacity:", v8);
    objc_msgSend(v9, "setLength:", v8);
    v10 = objc_retainAutorelease(v9);
    objc_msgSend(v10, "mutableBytes");
    if (archive_read_data() < 1)
    {
      v14 = _qlsLogHandle;
      if (!_qlsLogHandle)
      {
        QLSInitLogging();
        v14 = _qlsLogHandle;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = v14;
        v17 = 136315138;
        v18 = archive_error_string();
        _os_log_impl(&dword_20D4C7000, v15, OS_LOG_TYPE_DEFAULT, "Error reading archive: %s #Conversion", (uint8_t *)&v17, 0xCu);

      }
      if (v6)
      {
        objc_msgSend(v7, "libarchiveError");
        v11 = 0;
        *v6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = 0;
      }
    }
    else
    {
      v11 = v10;
    }

  }
  else
  {
    v11 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    data = archive_read_data();
    if (data)
    {
      v13 = data;
      do
      {
        objc_msgSend(v11, "appendBytes:length:", &v17, v13);
        v13 = archive_read_data();
      }
      while (v13);
    }
  }
  return v11;
}

- (void)enumerateEntriesWithHandler:(id)a3
{
  void (**v4)(id, QLZipArchiveEntry *, _QWORD, unsigned __int8 *);
  BOOL v5;
  id v6;
  void *v7;
  int next_header;
  QLZipArchiveEntry *v9;
  int v10;
  void *v11;
  id v12;
  unsigned __int8 v13;

  v4 = (void (**)(id, QLZipArchiveEntry *, _QWORD, unsigned __int8 *))a3;
  v13 = 0;
  if (self->_archive)
  {
LABEL_4:
    while (1)
    {
      next_header = archive_read_next_header();
      if (next_header)
        break;
      v9 = objc_alloc_init(QLZipArchiveEntry);
      -[QLZipArchiveEntry setArchive:](v9, "setArchive:", self);
      -[QLZipArchiveEntry setEntry:](v9, "setEntry:", 0);
      v4[2](v4, v9, 0, &v13);
      archive_read_data_skip();
      v10 = v13;

      if (v10)
        goto LABEL_9;
    }
    if (next_header != 1)
    {
      -[QLZipArchive libarchiveError](self, "libarchiveError");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, QLZipArchiveEntry *, void *, unsigned __int8 *))v4)[2](v4, 0, v11, &v13);

    }
LABEL_9:
    archive_read_free();
    self->_archive = 0;
  }
  else
  {
    v12 = 0;
    v5 = -[QLZipArchive _reopenWithError:](self, "_reopenWithError:", &v12);
    v6 = v12;
    v7 = v6;
    if (v5)
    {

      goto LABEL_4;
    }
    ((void (**)(id, QLZipArchiveEntry *, id, unsigned __int8 *))v4)[2](v4, 0, v6, &v13);

  }
}

- (id)fileWrapper
{
  NSFileWrapper *fileWrapper;
  void *v5;
  id v6;
  NSFileWrapper *v7;
  NSFileWrapper *v8;
  id v9;
  NSFileWrapper *v10;
  _QWORD v11[5];
  id v12;

  fileWrapper = self->_fileWrapper;
  if (fileWrapper)
    return fileWrapper;
  v5 = (void *)objc_opt_new();
  v6 = objc_alloc(MEMORY[0x24BDD1598]);
  v7 = (NSFileWrapper *)objc_msgSend(v6, "initDirectoryWithFileWrappers:", MEMORY[0x24BDBD1B8]);
  v8 = self->_fileWrapper;
  self->_fileWrapper = v7;

  objc_msgSend(v5, "setObject:forKey:", self->_fileWrapper, CFSTR("/"));
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __27__QLZipArchive_fileWrapper__block_invoke;
  v11[3] = &unk_24C71B340;
  v11[4] = self;
  v12 = v5;
  v9 = v5;
  -[QLZipArchive enumerateEntriesWithHandler:](self, "enumerateEntriesWithHandler:", v11);
  v10 = self->_fileWrapper;

  return v10;
}

void __27__QLZipArchive_fileWrapper__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  id v30;
  id v31;
  uint8_t buf[4];
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    goto LABEL_22;
  objc_msgSend(v4, "URLByDeletingLastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "relativePath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("/")))
  {

    goto LABEL_5;
  }
  objc_msgSend(v6, "relativePath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("."));

  if (v9)
  {
LABEL_5:
    objc_msgSend(*(id *)(a1 + 32), "fileWrapper");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      goto LABEL_14;
    goto LABEL_8;
  }
  v11 = *(void **)(a1 + 40);
  objc_msgSend(v6, "relativePath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    goto LABEL_14;
LABEL_8:
  objc_msgSend(v6, "lastPathComponent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc(MEMORY[0x24BDD1598]);
  v10 = (void *)objc_msgSend(v14, "initDirectoryWithFileWrappers:", MEMORY[0x24BDBD1B8]);
  objc_msgSend(v10, "setPreferredFilename:", v13);
  v15 = *(void **)(a1 + 40);
  objc_msgSend(v6, "relativePath");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKey:", v10, v16);

  objc_msgSend(v6, "URLByDeletingLastPathComponent");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "relativePath");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "isEqualToString:", CFSTR("/")))
  {

  }
  else
  {
    objc_msgSend(v17, "relativePath");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("."));

    if (!v20)
    {
      v23 = *(void **)(a1 + 40);
      objc_msgSend(v17, "relativePath");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKeyedSubscript:", v21);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (id)objc_msgSend(v24, "addFileWrapper:", v10);

      goto LABEL_13;
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("/"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (id)objc_msgSend(v21, "addFileWrapper:", v10);
LABEL_13:

LABEL_14:
  v31 = 0;
  objc_msgSend(v3, "readDataWithError:", &v31);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v31;
  if (v27 || !objc_msgSend(v26, "length"))
  {
    v28 = _qlsLogHandle;
    if (!_qlsLogHandle)
    {
      QLSInitLogging();
      v28 = _qlsLogHandle;
    }
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v33 = v27;
      _os_log_impl(&dword_20D4C7000, v28, OS_LOG_TYPE_ERROR, "Error while reading data: %@ #ZIPHandling", buf, 0xCu);
    }
  }
  else
  {
    objc_msgSend(v5, "lastPathComponent");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (id)objc_msgSend(v10, "addRegularFileWithContents:preferredFilename:", v26, v29);

  }
LABEL_22:

}

- (void)dealloc
{
  objc_super v3;

  if (self->_archive)
    archive_read_free();
  v3.receiver = self;
  v3.super_class = (Class)QLZipArchive;
  -[QLZipArchive dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileWrapper, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
