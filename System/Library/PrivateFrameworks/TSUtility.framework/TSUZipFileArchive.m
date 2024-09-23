@implementation TSUZipFileArchive

+ (void)readArchiveFromURL:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  _QWORD block[4];
  NSObject *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithURL:", v10);

  if (v11)
  {
    objc_msgSend(v11, "readArchiveWithQueue:completion:", v9, v8);
  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __57__TSUZipFileArchive_readArchiveFromURL_queue_completion___block_invoke;
    block[3] = &unk_24D61B500;
    v13 = v8;
    dispatch_async(v9, block);

    v9 = v13;
  }

}

void __57__TSUZipFileArchive_readArchiveFromURL_queue_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "tsu_IOErrorWithCode:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

- (TSUZipFileArchive)initWithURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  TSUZipFileArchive *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *accessQueue;
  objc_super v12;

  v4 = a3;
  if ((objc_msgSend(v4, "isFileURL") & 1) == 0)
  {
    +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUZipFileArchive initWithURL:]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipFileArchive.m");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, v7, 46, CFSTR("Need a file URL"));

  }
  v12.receiver = self;
  v12.super_class = (Class)TSUZipFileArchive;
  v8 = -[TSUZipArchive init](&v12, sel_init);
  if (v8)
  {
    v9 = dispatch_queue_create("TSUZipFileArchive.Access", 0);
    accessQueue = v8->_accessQueue;
    v8->_accessQueue = (OS_dispatch_queue *)v9;

    if (!-[TSUZipFileArchive openWithURL:](v8, "openWithURL:", v4))
    {

      v8 = 0;
    }
  }

  return v8;
}

- (BOOL)openWithURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  TSUReadChannel *v18;
  TSUReadChannel *archiveReadChannel;
  BOOL v20;
  id v22;
  void *v23;

  v4 = a3;
  if (self->_archiveReadChannel)
  {
    +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUZipFileArchive openWithURL:]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipFileArchive.m");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, v7, 67, CFSTR("Shouldn't open the archive if it's already open."));

  }
  v23 = 0;
  v8 = *MEMORY[0x24BDBCC48];
  v22 = 0;
  v9 = objc_msgSend(v4, "getResourceValue:forKey:error:", &v23, v8, &v22);
  v10 = v23;
  v11 = v22;
  v12 = v10;
  v17 = v12;
  if (v9)
  {
    self->_archiveLength = objc_msgSend(v12, "unsignedLongLongValue");
    v18 = -[TSUFileIOChannel initForReadingURL:]([TSUFileIOChannel alloc], "initForReadingURL:", v4);
    archiveReadChannel = self->_archiveReadChannel;
    self->_archiveReadChannel = v18;

    v20 = self->_archiveReadChannel != 0;
  }
  else
  {
    TSULogErrorInFunction((uint64_t)"-[TSUZipFileArchive openWithURL:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipFileArchive.m", 87, (uint64_t)CFSTR("Couldn't get size for %@: %@"), v13, v14, v15, v16, (uint64_t)v4);

    v20 = 0;
  }

  return v20;
}

- (TSUZipFileArchive)initWithWriter:(id)a3 atURL:(id)a4
{
  id v6;
  id v7;
  TSUZipFileArchive *v8;
  TSUZipFileArchive *v9;
  unint64_t archiveLength;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  TSUZipFileArchive *v17;

  v6 = a3;
  v7 = a4;
  v8 = -[TSUZipFileArchive initWithURL:](self, "initWithURL:", v7);
  v9 = v8;
  if (v8)
  {
    archiveLength = v8->_archiveLength;
    if (archiveLength != objc_msgSend(v6, "archiveLength"))
    {
      +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUZipFileArchive initWithWriter:atURL:]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipFileArchive.m");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "path");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, v13, 103, CFSTR("Length of archive at %@ doesn't match archive length of writer. %llu != %llu"), v14, v9->_archiveLength, objc_msgSend(v6, "archiveLength"));

    }
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __42__TSUZipFileArchive_initWithWriter_atURL___block_invoke;
    v16[3] = &unk_24D61B578;
    v17 = v9;
    objc_msgSend(v6, "enumerateEntriesUsingBlock:", v16);

  }
  return v9;
}

uint64_t __42__TSUZipFileArchive_initWithWriter_atURL___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addEntry:", a2);
}

- (void)dealloc
{
  TSUReadChannel *archiveReadChannel;
  objc_super v4;

  self->_archiveLength = 0;
  archiveReadChannel = self->_archiveReadChannel;
  self->_archiveReadChannel = 0;

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
  TSUTemporaryDirectory *v8;
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
      v8 = -[TSUTemporaryDirectory initWithSignature:]([TSUTemporaryDirectory alloc], "initWithSignature:", CFSTR("ZipFile"));
      -[TSUTemporaryDirectory leakTemporaryDirectory](v8, "leakTemporaryDirectory");
      -[TSUTemporaryDirectory URL](v8, "URL");
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
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSURL *v11;
  id v12;

  if (self->_temporaryDirectoryURL)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    temporaryDirectoryURL = self->_temporaryDirectoryURL;
    v12 = 0;
    v5 = objc_msgSend(v3, "removeItemAtURL:error:", temporaryDirectoryURL, &v12);
    v6 = v12;

    if ((v5 & 1) == 0)
      TSULogErrorInFunction((uint64_t)"-[TSUZipFileArchive removeTemporaryDirectory]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipFileArchive.m", 153, (uint64_t)CFSTR("Failed to remove temporary directory with error: %@"), v7, v8, v9, v10, (uint64_t)v6);
    v11 = self->_temporaryDirectoryURL;
    self->_temporaryDirectoryURL = 0;

  }
}

- (BOOL)reopenWithTemporaryURL:(id)a3
{
  unint64_t archiveLength;
  id *p_archiveReadChannel;
  TSUReadChannel *archiveReadChannel;
  TSUReadChannel *v8;
  id v9;
  id v10;
  BOOL v11;

  archiveLength = self->_archiveLength;
  p_archiveReadChannel = (id *)&self->_archiveReadChannel;
  archiveReadChannel = self->_archiveReadChannel;
  v8 = archiveReadChannel;
  self->_archiveLength = 0;
  v9 = *p_archiveReadChannel;
  *p_archiveReadChannel = 0;
  v10 = a3;

  v11 = -[TSUZipFileArchive openWithURL:](self, "openWithURL:", v10);
  if (!v11)
  {
    self->_archiveLength = archiveLength;
    objc_storeStrong(p_archiveReadChannel, archiveReadChannel);
  }

  return v11;
}

- (BOOL)copyToTemporaryLocationRelativeToURL:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__TSUZipFileArchive_copyToTemporaryLocationRelativeToURL___block_invoke;
  block[3] = &unk_24D61B5F0;
  block[4] = self;
  v9 = v4;
  v10 = &v11;
  v6 = v4;
  dispatch_sync(accessQueue, block);
  LOBYTE(accessQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)accessQueue;
}

void __58__TSUZipFileArchive_copyToTemporaryLocationRelativeToURL___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  dispatch_queue_t v9;
  void *v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  void *v26;
  _QWORD v27[4];
  NSObject *v28;
  id v29;
  NSObject *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2[5])
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  else
  {
    if (!v2[4])
    {
      +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUZipFileArchive copyToTemporaryLocationRelativeToURL:]_block_invoke");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipFileArchive.m");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, v5, 187, CFSTR("Read channel should be initialized."));

      v2 = *(_QWORD **)(a1 + 32);
    }
    objc_msgSend(v2, "createTemporaryDirectoryRelativeToURL:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "URLByAppendingPathComponent:", CFSTR("Temp.zip"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v7 = -[TSUFileIOChannel initForStreamWritingURL:]([TSUFileIOChannel alloc], "initForStreamWritingURL:", v6);
    else
      v7 = 0;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v7 != 0;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      v32 = 0;
      v33 = &v32;
      v34 = 0x3032000000;
      v35 = __Block_byref_object_copy__3;
      v36 = __Block_byref_object_dispose__3;
      v37 = 0;
      v8 = dispatch_group_create();
      v9 = dispatch_queue_create("TSUZipFileArchive.Copy", 0);
      dispatch_group_enter(v8);
      v10 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 3221225472;
      v27[2] = __58__TSUZipFileArchive_copyToTemporaryLocationRelativeToURL___block_invoke_27;
      v27[3] = &unk_24D61B5C8;
      v31 = &v32;
      v11 = v8;
      v28 = v11;
      v12 = v7;
      v29 = v12;
      v13 = v9;
      v30 = v13;
      objc_msgSend(v10, "readFromOffset:length:queue:handler:", 0, -1, v13, v27);
      dispatch_group_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
      objc_msgSend(v12, "close");

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v33[5] == 0;
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      {
        objc_msgSend(*(id *)(a1 + 40), "path");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "path");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        TSULogErrorInFunction((uint64_t)"-[TSUZipFileArchive copyToTemporaryLocationRelativeToURL:]_block_invoke_3", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipFileArchive.m", 238, (uint64_t)CFSTR("Failed to copy zip file from %@ to %@ with error: %@"), v15, v16, v17, v18, (uint64_t)v14);

      }
      _Block_object_dispose(&v32, 8);

      v7 = 0;
    }
    else
    {
      objc_msgSend(v6, "path");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      TSULogErrorInFunction((uint64_t)"-[TSUZipFileArchive copyToTemporaryLocationRelativeToURL:]_block_invoke_3", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUZipFileArchive.m", 243, (uint64_t)CFSTR("Failed to write to temporary zip file: %@"), v20, v21, v22, v23, (uint64_t)v19);

    }
    v24 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    if (*(_BYTE *)(v24 + 24))
    {
      v25 = objc_msgSend(*(id *)(a1 + 32), "reopenWithTemporaryURL:", v6);
      v24 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    }
    else
    {
      v25 = 0;
    }
    *(_BYTE *)(v24 + 24) = v25;
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      objc_msgSend(*(id *)(a1 + 32), "removeTemporaryDirectory");

  }
}

void __58__TSUZipFileArchive_copyToTemporaryLocationRelativeToURL___block_invoke_27(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id *v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;

  v7 = a3;
  v8 = a4;
  v9 = (void *)v8;
  if (v7 && !(v8 | *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)))
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __58__TSUZipFileArchive_copyToTemporaryLocationRelativeToURL___block_invoke_2;
    v15[3] = &unk_24D61B5A0;
    v10 = *(_QWORD *)(a1 + 48);
    v17 = *(_QWORD *)(a1 + 56);
    v11 = *(void **)(a1 + 40);
    v16 = *(id *)(a1 + 32);
    objc_msgSend(v11, "writeData:queue:handler:", v7, v10, v15);

  }
  if (a2)
  {
    if (v9)
    {
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v14 = *(_QWORD *)(v12 + 40);
      v13 = (id *)(v12 + 40);
      if (!v14)
        objc_storeStrong(v13, a4);
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }

}

void __58__TSUZipFileArchive_copyToTemporaryLocationRelativeToURL___block_invoke_2(uint64_t a1, int a2, void *a3, void *a4)
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
  v5[3] = &unk_24D61B618;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __34__TSUZipFileArchive_archiveLength__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 24);
  return result;
}

- (id)readChannel
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
  v9 = __Block_byref_object_copy__3;
  v10 = __Block_byref_object_dispose__3;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __32__TSUZipFileArchive_readChannel__block_invoke;
  v5[3] = &unk_24D61B618;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __32__TSUZipFileArchive_readChannel__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 32));
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  +[TSUDescription descriptionWithObject:class:](TSUDescription, "descriptionWithObject:class:", self, objc_opt_class());
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
  objc_storeStrong((id *)&self->_temporaryDirectoryURL, 0);
  objc_storeStrong((id *)&self->_archiveReadChannel, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end
