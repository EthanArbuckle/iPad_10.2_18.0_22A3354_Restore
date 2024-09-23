@implementation TSUZipFileArchive

+ (BOOL)isZipArchiveAtURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  char v10;
  void *v11;
  id v12;

  v6 = a3;
  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(v6, "path");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = open((const char *)objc_msgSend(v8, "fileSystemRepresentation"), 0, 0);

    if ((v9 & 0x80000000) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "tsu_fileReadPOSIXErrorWithNumber:userInfo:", *__error(), 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 0;
      if (!a4)
        goto LABEL_12;
      goto LABEL_8;
    }
    v10 = objc_msgSend(a1, "isZipArchiveAtFD:", v9);
    close(v9);
  }
  else
  {
    v10 = 0;
  }
  v11 = 0;
  if (!a4)
    goto LABEL_12;
LABEL_8:
  if ((v10 & 1) == 0)
  {
    if (v11)
    {
      *a4 = objc_retainAutorelease(v11);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "tsu_fileReadUnknownErrorWithUserInfo:", 0);
      v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a4 = v12;

    }
  }
LABEL_12:

  return v10;
}

+ (BOOL)isZipArchiveAtFD:(int)a3
{
  off_t v4;
  off_t v5;
  BOOL v7;
  int v9;

  v4 = lseek(a3, 0, 1);
  v5 = v4;
  if ((unint64_t)(v4 - 1) > 0xFFFFFFFFFFFFFFFDLL)
  {
    if (v4 == -1)
      return 0;
  }
  else if (lseek(a3, 0, 0) == -1)
  {
    goto LABEL_12;
  }
  if (read(a3, &v9, 4uLL) == 4)
  {
    v7 = v9 == 67324752 || v9 == 101010256;
    return lseek(a3, v5, 0) != -1 && v7;
  }
LABEL_12:
  v7 = 0;
  return lseek(a3, v5, 0) != -1 && v7;
}

- (id)URL
{
  return self->_URL;
}

+ (void)readArchiveFromURL:(id)a3 options:(unint64_t)a4 queue:(id)a5 completion:(id)a6
{
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  id v14;
  _QWORD block[4];
  id v16;
  NSObject *v17;
  id v18;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  v18 = 0;
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initForReadingFromURL:options:error:", v12, a4, &v18);

  v14 = v18;
  if (v13)
  {
    objc_msgSend(v13, "readArchiveWithQueue:completion:", v11, v10);
  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __65__TSUZipFileArchive_readArchiveFromURL_options_queue_completion___block_invoke;
    block[3] = &unk_24F39BAB0;
    v17 = v10;
    v16 = v14;
    dispatch_async(v11, block);

    v11 = v17;
  }

}

void __65__TSUZipFileArchive_readArchiveFromURL_options_queue_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 32))
  {
    (*(void (**)(_QWORD, _QWORD))(v1 + 16))(*(_QWORD *)(a1 + 40), 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "tsu_fileReadUnknownErrorWithUserInfo:");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

  }
}

+ (id)zipArchiveFromURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8;
  int v9;
  dispatch_semaphore_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v17[4];
  NSObject *v18;
  uint64_t *v19;
  uint64_t *v20;
  id obj;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v8 = a3;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__12;
  v32 = __Block_byref_object_dispose__12;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__12;
  v26 = __Block_byref_object_dispose__12;
  v27 = 0;
  obj = 0;
  v9 = objc_msgSend(a1, "isZipArchiveAtURL:error:", v8, &obj);
  objc_storeStrong(&v27, obj);
  if (v9)
  {
    v10 = dispatch_semaphore_create(0);
    dispatch_get_global_queue(0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __53__TSUZipFileArchive_zipArchiveFromURL_options_error___block_invoke;
    v17[3] = &unk_24F39BAD8;
    v19 = &v28;
    v20 = &v22;
    v12 = v10;
    v18 = v12;
    objc_msgSend(a1, "readArchiveFromURL:options:queue:completion:", v8, a4, v11, v17);
    dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);

  }
  if (a5 && !v29[5])
  {
    v13 = (void *)v23[5];
    if (v13)
    {
      *a5 = objc_retainAutorelease(v13);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "tsu_fileReadUnknownErrorWithUserInfo:", 0);
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a5 = v14;

    }
  }
  v15 = (id)v29[5];
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
  return v15;
}

void __53__TSUZipFileArchive_zipArchiveFromURL_options_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)initForReadingFromURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  TSUZipFileArchive *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *accessQueue;
  objc_super v15;

  v8 = a3;
  if ((objc_msgSend(v8, "isFileURL") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUZipFileArchive initForReadingFromURL:options:error:]");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipFileArchive.m");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 154, 0, "Need a file URL");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  v15.receiver = self;
  v15.super_class = (Class)TSUZipFileArchive;
  v11 = -[TSUZipArchive initWithOptions:](&v15, sel_initWithOptions_, a4);
  if (v11)
  {
    v12 = dispatch_queue_create("TSUZipFileArchive.Access", 0);
    accessQueue = v11->_accessQueue;
    v11->_accessQueue = (OS_dispatch_queue *)v12;

    if (!-[TSUZipFileArchive openWithURL:error:](v11, "openWithURL:error:", v8, a5))
    {

      v11 = 0;
    }
  }

  return v11;
}

- (BOOL)openWithURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  NSURL *v9;
  NSURL *URL;
  uint64_t v11;
  int v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  TSUZipFileDescriptorWrapper *v17;
  TSUZipFileDescriptorWrapper *fdWrapper;
  BOOL v19;
  uint64_t v20;
  TSUZipFileDescriptorWrapper *v21;
  void *v22;
  id v24;
  id v25;

  v6 = a3;
  if (self->_fdWrapper)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUZipFileArchive openWithURL:error:]");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipFileArchive.m");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 172, 0, "Shouldn't open the archive if it's already open.");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  v9 = (NSURL *)objc_msgSend(v6, "copy");
  URL = self->_URL;
  self->_URL = v9;

  v11 = *MEMORY[0x24BDBCC48];
  objc_msgSend(v6, "removeCachedResourceValueForKey:", *MEMORY[0x24BDBCC48]);
  v24 = 0;
  v25 = 0;
  v12 = objc_msgSend(v6, "getResourceValue:forKey:error:", &v25, v11, &v24);
  v13 = v25;
  v14 = v24;
  if (v12)
  {
    self->_archiveLength = objc_msgSend(v13, "unsignedLongLongValue");
    objc_msgSend(v6, "path");
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v16 = open((const char *)objc_msgSend(v15, "fileSystemRepresentation"), 0, 0);

    if ((v16 & 0x80000000) != 0)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "tsu_fileReadPOSIXErrorWithNumber:userInfo:", *__error(), 0);
      v20 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = -[TSUZipFileDescriptorWrapper initWithFileDescriptor:queue:]([TSUZipFileDescriptorWrapper alloc], "initWithFileDescriptor:queue:", v16, self->_accessQueue);
      fdWrapper = self->_fdWrapper;
      self->_fdWrapper = v17;

      if (self->_fdWrapper)
      {
        if ((objc_msgSend((id)objc_opt_class(), "isZipArchiveAtFD:", v16) & 1) != 0)
        {
          v19 = 1;
          if (!a4)
            goto LABEL_18;
          goto LABEL_16;
        }
        v21 = self->_fdWrapper;
        self->_fdWrapper = 0;

        objc_msgSend(MEMORY[0x24BDD1540], "tsu_fileReadCorruptedFileErrorWithUserInfo:", 0);
        v20 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1540], "tsu_fileReadUnknownErrorWithUserInfo:", 0);
        v20 = objc_claimAutoreleasedReturnValue();
      }
    }
    v22 = (void *)v20;

    v19 = 0;
    v14 = v22;
    if (!a4)
      goto LABEL_18;
    goto LABEL_16;
  }
  if (TSUDefaultCat_init_token == -1)
  {
    v19 = 0;
    if (!a4)
      goto LABEL_18;
  }
  else
  {
    dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_24);
    v19 = 0;
    if (!a4)
      goto LABEL_18;
  }
LABEL_16:
  if (v14)
    *a4 = objc_retainAutorelease(v14);
LABEL_18:

  return v19;
}

void __39__TSUZipFileArchive_openWithURL_error___block_invoke()
{
  uint64_t v0;
  void *v1;

  TSULogCreateCategory("TSUDefaultCat");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;

}

- (TSUZipFileArchive)initWithWriter:(id)a3 forReadingFromURL:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  TSUZipFileArchive *v12;
  TSUZipFileArchive *v13;
  unint64_t archiveLength;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  TSUZipFileArchive *v20;

  v10 = a3;
  v11 = a4;
  v12 = -[TSUZipFileArchive initForReadingFromURL:options:error:](self, "initForReadingFromURL:options:error:", v11, a5, a6);
  v13 = v12;
  if (v12)
  {
    archiveLength = v12->_archiveLength;
    if (archiveLength == objc_msgSend(v10, "archiveLength"))
    {
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __68__TSUZipFileArchive_initWithWriter_forReadingFromURL_options_error___block_invoke;
      v19[3] = &unk_24F39BB20;
      v13 = v13;
      v20 = v13;
      objc_msgSend(v10, "enumerateEntriesUsingBlock:", v19);

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUZipFileArchive initWithWriter:forReadingFromURL:options:error:]");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipFileArchive.m");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "path");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 228, 0, "Length of archive at %@ doesn't match archive length of writer. %llu != %llu", v17, v13->_archiveLength, objc_msgSend(v10, "archiveLength"));

      +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
      v13 = 0;
    }
  }

  return v13;
}

uint64_t __68__TSUZipFileArchive_initWithWriter_forReadingFromURL_options_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addEntry:", a2);
}

- (void)dealloc
{
  TSUZipFileDescriptorWrapper *fdWrapper;
  objc_super v4;

  self->_archiveLength = 0;
  fdWrapper = self->_fdWrapper;
  self->_fdWrapper = 0;

  -[TSUZipFileArchive removeTemporaryDirectory](self, "removeTemporaryDirectory");
  v4.receiver = self;
  v4.super_class = (Class)TSUZipFileArchive;
  -[TSUZipFileArchive dealloc](&v4, sel_dealloc);
}

- (void)createTemporaryDirectoryRelativeToURL:(id)a3
{
  id v4;
  void *v5;
  NSURL *v6;
  NSURL *temporaryDirectoryURL;
  OITSUTemporaryDirectory *v8;
  NSURL *v9;
  NSURL *v10;
  id v11;

  v4 = a3;
  if (!self->_temporaryDirectoryURL)
  {
    v11 = v4;
    if (!v4)
      goto LABEL_4;
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URLForDirectory:inDomain:appropriateForURL:create:error:", 99, 1, v11, 1, 0);
    v6 = (NSURL *)objc_claimAutoreleasedReturnValue();
    temporaryDirectoryURL = self->_temporaryDirectoryURL;
    self->_temporaryDirectoryURL = v6;

    v4 = v11;
    if (!self->_temporaryDirectoryURL)
    {
LABEL_4:
      v8 = -[OITSUTemporaryDirectory initWithSignature:error:]([OITSUTemporaryDirectory alloc], "initWithSignature:error:", CFSTR("ZipFile"), 0);
      -[OITSUTemporaryDirectory leakTemporaryDirectory](v8, "leakTemporaryDirectory");
      -[OITSUTemporaryDirectory URL](v8, "URL");
      v9 = (NSURL *)objc_claimAutoreleasedReturnValue();
      v10 = self->_temporaryDirectoryURL;
      self->_temporaryDirectoryURL = v9;

      v4 = v11;
    }
  }

}

- (void)removeTemporaryDirectory
{
  void *v3;
  NSURL *temporaryDirectoryURL;
  char v5;
  id v6;
  NSURL *v7;
  id v8;

  if (self->_temporaryDirectoryURL)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    temporaryDirectoryURL = self->_temporaryDirectoryURL;
    v8 = 0;
    v5 = objc_msgSend(v3, "removeItemAtURL:error:", temporaryDirectoryURL, &v8);
    v6 = v8;

    if ((v5 & 1) == 0 && TSUDefaultCat_init_token != -1)
      dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_17_1);
    v7 = self->_temporaryDirectoryURL;
    self->_temporaryDirectoryURL = 0;

  }
}

void __45__TSUZipFileArchive_removeTemporaryDirectory__block_invoke()
{
  uint64_t v0;
  void *v1;

  TSULogCreateCategory("TSUDefaultCat");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;

}

- (BOOL)reopenWithTemporaryURL:(id)a3 error:(id *)a4
{
  unint64_t archiveLength;
  id *p_fdWrapper;
  TSUZipFileDescriptorWrapper *fdWrapper;
  TSUZipFileDescriptorWrapper *v10;
  id v11;
  id v12;
  BOOL v13;

  archiveLength = self->_archiveLength;
  p_fdWrapper = (id *)&self->_fdWrapper;
  fdWrapper = self->_fdWrapper;
  v10 = fdWrapper;
  self->_archiveLength = 0;
  v11 = *p_fdWrapper;
  *p_fdWrapper = 0;
  v12 = a3;

  v13 = -[TSUZipFileArchive openWithURL:error:](self, "openWithURL:error:", v12, a4);
  if (!v13)
  {
    self->_archiveLength = archiveLength;
    objc_storeStrong(p_fdWrapper, fdWrapper);
  }

  return v13;
}

- (BOOL)copyToTemporaryLocationRelativeToURL:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *accessQueue;
  id v8;
  void *v9;
  id v10;
  char v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  TSUZipFileArchive *v17;
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  v6 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__12;
  v25 = __Block_byref_object_dispose__12;
  accessQueue = self->_accessQueue;
  v26 = 0;
  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __64__TSUZipFileArchive_copyToTemporaryLocationRelativeToURL_error___block_invoke;
  v16 = &unk_24F39BBF8;
  v17 = self;
  v8 = v6;
  v18 = v8;
  v19 = &v21;
  v20 = &v27;
  dispatch_sync(accessQueue, &v13);
  if (a4 && !*((_BYTE *)v28 + 24))
  {
    v9 = (void *)v22[5];
    if (v9)
    {
      *a4 = objc_retainAutorelease(v9);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "tsu_fileReadUnknownErrorWithUserInfo:", 0, v13, v14, v15, v16, v17);
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a4 = v10;

    }
  }
  v11 = *((_BYTE *)v28 + 24);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v11;
}

void __64__TSUZipFileArchive_copyToTemporaryLocationRelativeToURL_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  TSUFileIOChannel *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  char v19;
  id obj;
  _QWORD v21[4];
  NSObject *v22;
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  id v31;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 64))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }
  else
  {
    v3 = *(id *)(v2 + 56);
    v4 = (void *)MEMORY[0x22E2DDB58]();
    if (!v3)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUZipFileArchive copyToTemporaryLocationRelativeToURL:error:]_block_invoke");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUZipFileArchive.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 301, 0, "File should be opened.");

      +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    }
    objc_msgSend(*(id *)(a1 + 32), "createTemporaryDirectoryRelativeToURL:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "URLByAppendingPathComponent:", CFSTR("Temp.zip"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = [TSUFileIOChannel alloc];
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v31 = *(id *)(v9 + 40);
      v10 = -[TSUFileIOChannel initForStreamWritingURL:error:](v8, "initForStreamWritingURL:error:", v7, &v31);
      objc_storeStrong((id *)(v9 + 40), v31);
    }
    else
    {
      v10 = 0;
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v10 != 0;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      v25 = 0;
      v26 = &v25;
      v27 = 0x3032000000;
      v28 = __Block_byref_object_copy__12;
      v29 = __Block_byref_object_dispose__12;
      v30 = 0;
      v11 = dispatch_group_create();
      dispatch_group_enter(v11);
      objc_msgSend(v3, "readChannel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __64__TSUZipFileArchive_copyToTemporaryLocationRelativeToURL_error___block_invoke_2;
      v21[3] = &unk_24F39BB90;
      v24 = &v25;
      v13 = v11;
      v22 = v13;
      v14 = v10;
      v23 = v14;
      objc_msgSend(v12, "readFromOffset:length:handler:", 0, -1, v21);

      dispatch_group_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
      objc_msgSend(v14, "close");

      v15 = v26;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v26[5] == 0;
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
      {
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), (id)v15[5]);
        if (TSUDefaultCat_init_token != -1)
          dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_23);
      }

      _Block_object_dispose(&v25, 8);
      v10 = 0;
    }
    else if (TSUDefaultCat_init_token != -1)
    {
      dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_24);
    }
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    if (*(_BYTE *)(v16 + 24))
    {
      v17 = *(void **)(a1 + 32);
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      obj = *(id *)(v18 + 40);
      v19 = objc_msgSend(v17, "reopenWithTemporaryURL:error:", v7, &obj);
      objc_storeStrong((id *)(v18 + 40), obj);
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    }
    else
    {
      v19 = 0;
    }
    *(_BYTE *)(v16 + 24) = v19;
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
      objc_msgSend(*(id *)(a1 + 32), "removeTemporaryDirectory");

    objc_autoreleasePoolPop(v4);
    objc_msgSend(v3, "waitForAccessToEnd");

  }
}

void __64__TSUZipFileArchive_copyToTemporaryLocationRelativeToURL_error___block_invoke_2(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id *v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;

  v7 = a3;
  v8 = a4;
  v9 = (void *)v8;
  if (v7 && !(v8 | *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)))
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __64__TSUZipFileArchive_copyToTemporaryLocationRelativeToURL_error___block_invoke_3;
    v14[3] = &unk_24F39BB68;
    v10 = *(void **)(a1 + 40);
    v16 = *(_QWORD *)(a1 + 48);
    v15 = *(id *)(a1 + 32);
    objc_msgSend(v10, "writeData:handler:", v7, v14);

  }
  if (a2)
  {
    if (v9)
    {
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v13 = *(_QWORD *)(v11 + 40);
      v12 = (id *)(v11 + 40);
      if (!v13)
        objc_storeStrong(v12, a4);
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }

}

void __64__TSUZipFileArchive_copyToTemporaryLocationRelativeToURL_error___block_invoke_3(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  id *v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  v7 = a4;
  v8 = v7;
  if (a2)
  {
    if (v7)
    {
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v11 = *(_QWORD *)(v9 + 40);
      v10 = (id *)(v9 + 40);
      if (!v11)
        objc_storeStrong(v10, a4);
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }

}

void __64__TSUZipFileArchive_copyToTemporaryLocationRelativeToURL_error___block_invoke_4()
{
  uint64_t v0;
  void *v1;

  TSULogCreateCategory("TSUDefaultCat");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;

}

void __64__TSUZipFileArchive_copyToTemporaryLocationRelativeToURL_error___block_invoke_5()
{
  uint64_t v0;
  void *v1;

  TSULogCreateCategory("TSUDefaultCat");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;

}

- (unint64_t)archiveLength
{
  NSObject *accessQueue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __34__TSUZipFileArchive_archiveLength__block_invoke;
  v5[3] = &unk_24F39B4D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __34__TSUZipFileArchive_archiveLength__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 48);
  return result;
}

- (id)newArchiveReadChannel
{
  NSObject *accessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__12;
  v10 = __Block_byref_object_dispose__12;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __42__TSUZipFileArchive_newArchiveReadChannel__block_invoke;
  v5[3] = &unk_24F39B958;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __42__TSUZipFileArchive_newArchiveReadChannel__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  TSUFileIOChannel *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  int v14;

  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 56);
  v3 = v2;
  if (!v2)
  {
    if (TSUDefaultCat_init_token == -1)
      goto LABEL_7;
    v11 = &__block_literal_global_27;
    goto LABEL_10;
  }
  v4 = dup(objc_msgSend(v2, "fileDescriptor"));
  if ((v4 & 0x80000000) != 0)
  {
    if (TSUDefaultCat_init_token == -1)
      goto LABEL_7;
    v11 = &__block_literal_global_26;
LABEL_10:
    dispatch_once(&TSUDefaultCat_init_token, v11);
    goto LABEL_7;
  }
  v5 = v4;
  objc_msgSend(v3, "beginAccess");
  v6 = [TSUFileIOChannel alloc];
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __42__TSUZipFileArchive_newArchiveReadChannel__block_invoke_2;
  v12[3] = &unk_24F39BC20;
  v14 = v5;
  v13 = v3;
  v8 = -[TSUFileIOChannel initForReadingDescriptor:queue:cleanupHandler:](v6, "initForReadingDescriptor:queue:cleanupHandler:", v5, v7, v12);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

LABEL_7:
}

uint64_t __42__TSUZipFileArchive_newArchiveReadChannel__block_invoke_2(uint64_t a1)
{
  close(*(_DWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "endAccess");
}

void __42__TSUZipFileArchive_newArchiveReadChannel__block_invoke_3()
{
  uint64_t v0;
  void *v1;

  TSULogCreateCategory("TSUDefaultCat");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;

}

void __42__TSUZipFileArchive_newArchiveReadChannel__block_invoke_4()
{
  uint64_t v0;
  void *v1;

  TSULogCreateCategory("TSUDefaultCat");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;

}

- (BOOL)isValid
{
  NSObject *accessQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __28__TSUZipFileArchive_isValid__block_invoke;
  v5[3] = &unk_24F39B958;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

ssize_t __28__TSUZipFileArchive_isValid__block_invoke(uint64_t a1)
{
  void *v2;
  ssize_t result;
  char v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  if (v2)
    result = objc_msgSend(v2, "fileDescriptor");
  else
    result = 0xFFFFFFFFLL;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (int)result >= 0;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v4 = 0;
    result = read(result, &v4, 0);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result == 0;
  }
  return result;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  +[OITSUDescription descriptionWithObject:class:](OITSUDescription, "descriptionWithObject:class:", self, objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%qu"), self->_archiveLength);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addField:value:", CFSTR("archiveLength"), v4);

  v8.receiver = self;
  v8.super_class = (Class)TSUZipFileArchive;
  -[TSUZipArchive debugDescription](&v8, sel_debugDescription);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addFieldValue:", v5);

  objc_msgSend(v3, "descriptionString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_temporaryDirectoryURL, 0);
  objc_storeStrong((id *)&self->_fdWrapper, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end
