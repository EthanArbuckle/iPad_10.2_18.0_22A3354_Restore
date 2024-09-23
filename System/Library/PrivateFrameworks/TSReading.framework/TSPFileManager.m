@implementation TSPFileManager

+ (BOOL)linkFileAtURL:(id)a3 toURL:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a3, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a1) = objc_msgSend(a1, "linkFileAtPath:toPath:", v7, v8);
  return (char)a1;
}

+ (BOOL)linkFileAtPath:(id)a3 toPath:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  BOOL v13;

  v5 = a3;
  v6 = a4;
  UnsafePointer();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundlePath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByStandardizingPath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stringByStandardizingPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingString:", CFSTR("/"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "hasPrefix:", v11);

  v13 = (v12 & 1) == 0 && TSULink() == 0;
  return v13;
}

+ (BOOL)linkOrCopyURL:(id)a3 toURL:(id)a4
{
  return objc_msgSend(a1, "linkOrCopyURL:decryptionKey:toURL:encryptionKey:", a3, 0, a4, 0);
}

+ (BOOL)linkOrCopyURL:(id)a3 decryptionKey:(id)a4 toURL:(id)a5 encryptionKey:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  BOOL v14;
  char v15;
  void *v16;
  char v17;
  id v18;
  void *v19;
  TSPCryptoTranscodeReadChannel *v20;
  dispatch_queue_t v21;
  dispatch_queue_t v22;
  dispatch_semaphore_t v23;
  NSObject *v24;
  NSObject *v25;
  _QWORD v27[4];
  id v28;
  NSObject *v29;
  NSObject *v30;
  uint64_t *v31;
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = 0;
  if (v10 && v12)
  {
    v33 = 0;
    v34 = &v33;
    v35 = 0x2020000000;
    v36 = 0;
    if (SFUEqualCryptoKeys())
    {
      v15 = objc_msgSend(a1, "linkFileAtURL:toURL:", v10, v12);
      *((_BYTE *)v34 + 24) = v15;
      if ((v15 & 1) != 0)
      {
LABEL_11:
        v14 = *((_BYTE *)v34 + 24) != 0;
        _Block_object_dispose(&v33, 8);
        goto LABEL_12;
      }
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 0;
      v17 = objc_msgSend(v16, "copyItemAtURL:toURL:error:", v10, v12, &v32);
      v18 = v32;
      *((_BYTE *)v34 + 24) = v17;

      if (!*((_BYTE *)v34 + 24))
        TSULogErrorInFunction();
    }
    else
    {
      v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BEB3C68]), "initForReadingURL:", v10);
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB3C68]), "initForStreamWritingURL:", v12);
      v20 = -[TSPCryptoTranscodeReadChannel initWithReadChannel:decryptionKey:encryptionKey:]([TSPCryptoTranscodeReadChannel alloc], "initWithReadChannel:decryptionKey:encryptionKey:", v18, v11, v13);
      if (v20)
      {
        v21 = dispatch_queue_create("com.apple.iWork.CRYPTOREADCHANNEL", 0);
        v22 = dispatch_queue_create("com.apple.iWork.FILEIOWRITECHANNEL", 0);
        *((_BYTE *)v34 + 24) = 1;
        v23 = dispatch_semaphore_create(0);
        v27[0] = MEMORY[0x24BDAC760];
        v27[1] = 3221225472;
        v27[2] = __66__TSPFileManager_linkOrCopyURL_decryptionKey_toURL_encryptionKey___block_invoke;
        v27[3] = &unk_24D82A1C0;
        v28 = v19;
        v24 = v22;
        v29 = v24;
        v31 = &v33;
        v25 = v23;
        v30 = v25;
        -[TSPCryptoTranscodeReadChannel readWithQueue:handler:](v20, "readWithQueue:handler:", v21, v27);
        dispatch_semaphore_wait(v25, 0xFFFFFFFFFFFFFFFFLL);
        -[TSPCryptoTranscodeReadChannel close](v20, "close");

      }
    }

    goto LABEL_11;
  }
LABEL_12:

  return v14;
}

void __66__TSPFileManager_linkOrCopyURL_decryptionKey_toURL_encryptionKey___block_invoke(uint64_t a1, int a2, void *a3, uint64_t a4)
{
  id v7;
  dispatch_semaphore_t v8;
  dispatch_semaphore_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD v13[4];
  NSObject *v14;
  uint64_t v15;

  v7 = a3;
  v8 = dispatch_semaphore_create(0);
  v9 = v8;
  if (!v7 || a4)
  {
    if (a4)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
      objc_msgSend(*(id *)(a1 + 32), "close");
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
    }
  }
  else
  {
    v10 = *(void **)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __66__TSPFileManager_linkOrCopyURL_decryptionKey_toURL_encryptionKey___block_invoke_2;
    v13[3] = &unk_24D82A198;
    v15 = *(_QWORD *)(a1 + 56);
    v12 = v8;
    v14 = v12;
    objc_msgSend(v10, "writeData:queue:handler:", v7, v11, v13);
    dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);

  }
  if (a2)
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

void __66__TSPFileManager_linkOrCopyURL_decryptionKey_toURL_encryptionKey___block_invoke_2(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;

  v8 = a3;
  v7 = a4;
  if (v7)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
  if (a2)
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

@end
