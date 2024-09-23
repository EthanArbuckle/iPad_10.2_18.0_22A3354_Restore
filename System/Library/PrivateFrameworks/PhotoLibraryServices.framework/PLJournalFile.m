@implementation PLJournalFile

- (PLJournalFile)initWithURL:(id)a3 payloadClass:(Class)a4
{
  id v7;
  PLJournalFile *v8;
  PLJournalFile *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PLJournalFile;
  v8 = -[PLJournalFile init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_url, a3);
    v9->_payloadClass = a4;
  }

  return v9;
}

- (BOOL)openForReadingUsingBlock:(id)a3 error:(id *)a4
{
  uint64_t (**v6)(id, _QWORD);
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = (uint64_t (**)(id, _QWORD))a3;
  -[NSURL path](self->_url, "path");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = open((const char *)objc_msgSend(v7, "fileSystemRepresentation"), 0);

  if ((_DWORD)v8 == -1)
  {
    if (*__error() == 2)
    {
      LOBYTE(a4) = v6[2](v6, 0);
    }
    else if (a4)
    {
      v10 = (void *)MEMORY[0x1E0CB35C8];
      v11 = *MEMORY[0x1E0CB2FE0];
      v12 = *__error();
      v18 = *MEMORY[0x1E0CB2D50];
      v13 = (void *)MEMORY[0x1E0CB3940];
      v14 = __error();
      objc_msgSend(v13, "stringWithUTF8String:", strerror(*v14));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, v12, v16);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      LOBYTE(a4) = 0;
    }
  }
  else
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3608]), "initWithFileDescriptor:closeOnDealloc:", v8, 0);
    LOBYTE(a4) = ((uint64_t (**)(id, void *))v6)[2](v6, v9);
    close(v8);

  }
  return (char)a4;
}

- (BOOL)enumerateEntriesUsingBlock:(id)a3 decodePayload:(BOOL)a4 error:(id *)a5
{
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  id *v13;
  BOOL v14;

  v8 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64__PLJournalFile_enumerateEntriesUsingBlock_decodePayload_error___block_invoke;
  v11[3] = &unk_1E366E4B8;
  v14 = a4;
  v11[4] = self;
  v12 = v8;
  v13 = a5;
  v9 = v8;
  LOBYTE(a5) = -[PLJournalFile openForReadingUsingBlock:error:](self, "openForReadingUsingBlock:error:", v11, a5);

  return (char)a5;
}

- (id)fileHandleForWritingWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL path](self->_url, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByDeletingLastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v7, 1, 0, 0);

  -[NSURL path](self->_url, "path");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = open((const char *)objc_msgSend(v8, "fileSystemRepresentation"), 513, 438);

  if ((_DWORD)v9 == -1)
  {
    if (a3)
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v13 = *MEMORY[0x1E0CB2FE0];
      v14 = *__error();
      v19 = *MEMORY[0x1E0CB2D50];
      v15 = (void *)MEMORY[0x1E0CB3940];
      v16 = __error();
      objc_msgSend(v15, "stringWithUTF8String:", strerror(*v16));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v17;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, v14, v18);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

      a3 = 0;
    }
    return a3;
  }
  else
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3608]), "initWithFileDescriptor:closeOnDealloc:", v9, 1);
    objc_msgSend(v10, "seekToEndOfFile");
    return v10;
  }
}

- (BOOL)openForWritingUsingBlock:(id)a3 error:(id *)a4
{
  uint64_t (**v6)(id, uint64_t);
  uint64_t v7;
  void *v8;
  char v9;

  v6 = (uint64_t (**)(id, uint64_t))a3;
  -[PLJournalFile fileHandleForWritingWithError:](self, "fileHandleForWritingWithError:", a4);
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    v9 = v6[2](v6, v7);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)appendEntries:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;
  _QWORD v9[4];
  id v10;
  PLJournalFile *v11;
  id *v12;

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __37__PLJournalFile_appendEntries_error___block_invoke;
    v9[3] = &unk_1E366E4E0;
    v10 = v6;
    v11 = self;
    v12 = a4;
    v7 = -[PLJournalFile openForWritingUsingBlock:error:](self, "openForWritingUsingBlock:error:", v9, a4);

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (BOOL)removeFileWithError:(id *)a3
{
  return objc_msgSend((id)objc_opt_class(), "removeURL:error:", self->_url, a3);
}

- (BOOL)createEmptyFileWithError:(id *)a3
{
  return objc_msgSend((id)objc_opt_class(), "createEmptyURL:error:", self->_url, a3);
}

- (BOOL)moveToURL:(id)a3 error:(id *)a4
{
  id v6;

  v6 = a3;
  LOBYTE(a4) = objc_msgSend((id)objc_opt_class(), "moveURL:toURL:error:", self->_url, v6, a4);

  return (char)a4;
}

- (BOOL)copyToURL:(id)a3 error:(id *)a4
{
  id v6;

  v6 = a3;
  LOBYTE(a4) = objc_msgSend((id)objc_opt_class(), "copyURL:toURL:error:", self->_url, v6, a4);

  return (char)a4;
}

- (BOOL)fileSize:(unint64_t *)a3 error:(id *)a4
{
  return -[PLJournalFile _fileSize:forKey:error:](self, "_fileSize:forKey:error:", a3, *MEMORY[0x1E0C99998], a4);
}

- (BOOL)allocatedFileSize:(unint64_t *)a3 error:(id *)a4
{
  return -[PLJournalFile _fileSize:forKey:error:](self, "_fileSize:forKey:error:", a3, *MEMORY[0x1E0C99900], a4);
}

- (BOOL)_fileSize:(unint64_t *)a3 forKey:(id)a4 error:(id *)a5
{
  PLJournalFile *v6;
  NSURL *url;
  id v8;
  NSURL *v9;
  id v10;
  void *v11;
  id v12;
  char v13;
  id v14;
  id v16;
  void *v17;

  v6 = self;
  *a3 = 0;
  url = self->_url;
  v8 = a4;
  -[NSURL removeCachedResourceValueForKey:](url, "removeCachedResourceValueForKey:", v8);
  v9 = v6->_url;
  v16 = 0;
  v17 = 0;
  LODWORD(v6) = -[NSURL getResourceValue:forKey:error:](v9, "getResourceValue:forKey:error:", &v17, v8, &v16);

  v10 = v16;
  if ((_DWORD)v6)
  {
    v11 = v17;
    v12 = v16;
    *a3 = objc_msgSend(v11, "unsignedLongLongValue");
    v13 = 1;
  }
  else
  {
    v14 = v16;
    v13 = PLIsErrorEqualToCode();
  }

  return v13;
}

- (BOOL)fileExists
{
  return objc_msgSend((id)objc_opt_class(), "fileExistsAtURL:", self->_url);
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
}

uint64_t __37__PLJournalFile_appendEntries_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v16;
  void *v17;
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v21;
    while (2)
    {
      v9 = 0;
      v10 = v7;
      do
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v9);
        v12 = (void *)MEMORY[0x19AEC1554]();
        if (objc_msgSend(v11, "payloadClass") != *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8))
        {
          v16 = (void *)MEMORY[0x1E0C99DA0];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Payload classes don't match: %@, %@"), objc_msgSend(v11, "payloadClass"), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "exceptionWithName:reason:userInfo:", CFSTR("PLJournalException"), v17, 0);
          v18 = (id)objc_claimAutoreleasedReturnValue();

          objc_exception_throw(v18);
        }
        v19 = v10;
        v13 = objc_msgSend(v11, "writeToFileHandle:checksumContext:error:", v3, 0, &v19);
        v7 = v19;

        objc_autoreleasePoolPop(v12);
        if (!v13)
        {

          if (*(_QWORD *)(a1 + 48))
          {
            v7 = objc_retainAutorelease(v7);
            v14 = 0;
            **(_QWORD **)(a1 + 48) = v7;
          }
          else
          {
            v14 = 0;
          }
          goto LABEL_16;
        }
        ++v9;
        v10 = v7;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v7 = 0;
  }

  v14 = 1;
LABEL_16:

  return v14;
}

uint64_t __64__PLJournalFile_enumerateEntriesUsingBlock_decodePayload_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  PLJournalEntry *v7;
  uint64_t v8;
  void *v9;
  id v11;
  uint64_t v12;

  v3 = a2;
  if (v3)
  {
    v4 = 0;
    while (1)
    {
      v5 = v4;
      v6 = (void *)MEMORY[0x19AEC1554]();
      v7 = objc_alloc_init(PLJournalEntry);
      v11 = v4;
      v12 = 0;
      v8 = -[PLJournalEntry readFromFileHandle:decodePayload:payloadClass:entryOffset:error:](v7, "readFromFileHandle:decodePayload:payloadClass:entryOffset:error:", v3, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), &v12, &v11);
      v4 = v11;

      if (!(_DWORD)v8)
        break;
      -[PLJournalEntry payloadID](v7, "payloadID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

      objc_autoreleasePoolPop(v6);
    }

    objc_autoreleasePoolPop(v6);
    if (objc_msgSend(v4, "code") == 51005)
    {
      v8 = 1;
    }
    else if (*(_QWORD *)(a1 + 48))
    {
      **(_QWORD **)(a1 + 48) = objc_retainAutorelease(v4);
    }

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

+ (BOOL)removeURL:(id)a3 error:(id *)a4
{
  id v5;
  int v6;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "path");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = unlink((const char *)objc_msgSend(v5, "fileSystemRepresentation"));

  if (!v6 || *__error() == 2)
    return 1;
  if (a4)
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v9 = *MEMORY[0x1E0CB2FE0];
    v10 = *__error();
    v15 = *MEMORY[0x1E0CB2D50];
    v11 = (void *)MEMORY[0x1E0CB3940];
    v12 = __error();
    objc_msgSend(v11, "stringWithUTF8String:", strerror(*v12));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, v10, v14);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

+ (BOOL)createEmptyURL:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB3620];
  v6 = a3;
  objc_msgSend(v5, "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByDeletingLastPathComponent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v9, 1, 0, 0);

  objc_msgSend(v6, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_retainAutorelease(v10);
  v12 = open((const char *)objc_msgSend(v11, "fileSystemRepresentation"), 1537, 438);

  if (v12 == -1)
  {
    if (a4)
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v14 = *MEMORY[0x1E0CB2FE0];
      v15 = *__error();
      v21 = *MEMORY[0x1E0CB2D50];
      v16 = (void *)MEMORY[0x1E0CB3940];
      v17 = __error();
      objc_msgSend(v16, "stringWithUTF8String:", strerror(*v17));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, v15, v19);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    close(v12);
  }
  return v12 != -1;
}

+ (BOOL)moveURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  const std::__fs::filesystem::path *v9;
  id v10;
  const std::__fs::filesystem::path *v11;
  std::error_code *v12;
  int v13;
  int v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  int *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v7 = objc_retainAutorelease(a3);
  v8 = a4;
  v9 = (const std::__fs::filesystem::path *)objc_msgSend(v7, "fileSystemRepresentation");
  v10 = objc_retainAutorelease(v8);
  v11 = (const std::__fs::filesystem::path *)objc_msgSend(v10, "fileSystemRepresentation");

  rename(v9, v11, v12);
  v14 = v13;
  if (a5 && v13)
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *MEMORY[0x1E0CB2FE0];
    v17 = *__error();
    v23 = *MEMORY[0x1E0CB2D50];
    v18 = (void *)MEMORY[0x1E0CB3940];
    v19 = __error();
    objc_msgSend(v18, "stringWithUTF8String:", strerror(*v19));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, v17, v21);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v14 == 0;
}

+ (BOOL)copyURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  const char *v9;
  id v10;
  const char *v11;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v7 = objc_retainAutorelease(a3);
  v8 = a4;
  v9 = (const char *)objc_msgSend(v7, "fileSystemRepresentation");
  v10 = objc_retainAutorelease(v8);
  v11 = (const char *)objc_msgSend(v10, "fileSystemRepresentation");

  if (!copyfile(v9, v11, 0, 0x1000000u) || *__error() == 2)
    return 1;
  if (a5)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0CB2FE0];
    v15 = *__error();
    v20 = *MEMORY[0x1E0CB2D50];
    v16 = (void *)MEMORY[0x1E0CB3940];
    v17 = __error();
    objc_msgSend(v16, "stringWithUTF8String:", strerror(*v17));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, v15, v19);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return 0;
}

+ (BOOL)writeData:(id)a3 toURL:(id)a4 atomically:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;

  v7 = a5;
  v9 = a4;
  v10 = a3;
  v11 = v10;
  if (v7)
  {
    objc_msgSend(v9, "lastPathComponent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByDeletingPathExtension");
    v13 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "lastPathComponent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "pathExtension");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "URLByDeletingLastPathComponent");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-tmp"), v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringByAppendingPathExtension:", v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "URLByAppendingPathComponent:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v16) = objc_msgSend(v11, "writeToURL:options:error:", v19, 0, a6);
    if ((_DWORD)v16)
      v20 = objc_msgSend((id)objc_opt_class(), "moveURL:toURL:error:", v19, v9, a6);
    else
      v20 = 0;

    v11 = (void *)v13;
  }
  else
  {
    v20 = objc_msgSend(v10, "writeToURL:options:error:", v9, 0, a6);
  }

  return v20;
}

+ (BOOL)fileExistsAtURL:(id)a3
{
  return objc_msgSend(a3, "checkResourceIsReachableAndReturnError:", 0);
}

@end
