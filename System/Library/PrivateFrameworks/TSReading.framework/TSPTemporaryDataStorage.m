@implementation TSPTemporaryDataStorage

- (TSPTemporaryDataStorage)initWithURL:(id)a3 decryptionKey:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  TSPTemporaryDataStorage *v12;
  TSPTemporaryDataStorage *v13;
  TSPTemporaryDataStorage *v14;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(v7, "isFileURL") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPTemporaryDataStorage initWithURL:decryptionKey:]");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPTemporaryDataStorage.mm");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, v11, 29, CFSTR("Expected a file URL"));

  }
  v16.receiver = self;
  v16.super_class = (Class)TSPTemporaryDataStorage;
  v12 = -[TSPTemporaryDataStorage init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_URL, a3);
    objc_storeStrong((id *)&v13->_decryptionKey, a4);
    v14 = v13;
  }

  return v13;
}

- (TSPTemporaryDataStorage)initWithURL:(id)a3
{
  return -[TSPTemporaryDataStorage initWithURL:decryptionKey:](self, "initWithURL:decryptionKey:", a3, 0);
}

- (void)dealloc
{
  void *v3;
  NSURL *URL;
  char v5;
  id v6;
  void *v7;
  void *v8;
  NSURL *v9;
  id v10;
  objc_super v11;
  id v12;

  if (!self->_isMissingData)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    URL = self->_URL;
    v12 = 0;
    v5 = objc_msgSend(v3, "removeItemAtURL:error:", URL, &v12);
    v6 = v12;
    if ((v5 & 1) == 0)
    {
      -[NSURL path](self->_URL, "path");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringByDeletingLastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v3, "fileExistsAtPath:", v8))
      {
        v9 = self->_URL;
        v10 = v6;
        TSULogErrorInFunction();
      }

    }
  }
  v11.receiver = self;
  v11.super_class = (Class)TSPTemporaryDataStorage;
  -[TSPTemporaryDataStorage dealloc](&v11, sel_dealloc, v9, v10);
}

- (void)performReadWithAccessor:(id)a3
{
  id v4;
  NSURL *URL;
  id v6;

  v4 = a3;
  if (self->_isMissingData)
    URL = 0;
  else
    URL = self->_URL;
  v6 = v4;
  (*((void (**)(id, NSURL *))v4 + 2))(v4, URL);

}

- (void)performIOChannelReadWithAccessor:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __60__TSPTemporaryDataStorage_performIOChannelReadWithAccessor___block_invoke;
  v6[3] = &unk_24D82A058;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[TSPTemporaryDataStorage performReadWithAccessor:](self, "performReadWithAccessor:", v6);

}

void __60__TSPTemporaryDataStorage_performIOChannelReadWithAccessor___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  BOOL v6;
  id v7;
  void *v8;
  _QWORD v9[5];

  v3 = a2;
  v4 = objc_msgSend(objc_alloc(MEMORY[0x24BEB3C68]), "initForReadingURL:", v3);
  v5 = (void *)v4;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
    v6 = v4 == 0;
  else
    v6 = 1;
  if (v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v7 = objc_alloc(MEMORY[0x24BEB3C30]);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __60__TSPTemporaryDataStorage_performIOChannelReadWithAccessor___block_invoke_2;
    v9[3] = &unk_24D82A030;
    v9[4] = *(_QWORD *)(a1 + 32);
    v8 = (void *)objc_msgSend(v7, "initWithReadChannel:streamReadChannelBlock:", v5, v9);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

TSPCryptoReadChannel *__60__TSPTemporaryDataStorage_performIOChannelReadWithAccessor___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  TSPCryptoReadChannel *v4;

  v3 = a2;
  v4 = -[TSPCryptoReadChannel initWithReadChannel:decryptionKey:]([TSPCryptoReadChannel alloc], "initWithReadChannel:decryptionKey:", v3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));

  return v4;
}

- (BOOL)isMissingData
{
  return self->_isMissingData;
}

- (void)setIsMissingData:(BOOL)a3
{
  self->_isMissingData = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decryptionKey, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end
