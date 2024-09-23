@implementation TSPFileDataStorage

- (void)performReadWithAccessor:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPFileDataStorage performReadWithAccessor:]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPFileDataStorage.mm");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, v6, 46, CFSTR("Abstract method"));

  v7 = (void *)MEMORY[0x24BDBCE88];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "-[TSPFileDataStorage performReadWithAccessor:]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], v8, 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v9);
}

- (void)performIOChannelReadWithAccessor:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __55__TSPFileDataStorage_performIOChannelReadWithAccessor___block_invoke;
  v6[3] = &unk_24D829F40;
  v7 = v4;
  v5 = v4;
  -[TSPFileDataStorage performReadWithAccessor:](self, "performReadWithAccessor:", v6);

}

void __55__TSPFileDataStorage_performIOChannelReadWithAccessor___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (v4)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB3C68]), "initForReadingURL:", v4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (id)bookmarkDataWithOptions:(unint64_t)a3
{
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
  v9 = __Block_byref_object_copy__4;
  v10 = __Block_byref_object_dispose__4;
  v11 = 0;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __46__TSPFileDataStorage_bookmarkDataWithOptions___block_invoke;
  v5[3] = &unk_24D829F68;
  v5[4] = &v6;
  v5[5] = a3;
  -[TSPFileDataStorage performReadWithAccessor:](self, "performReadWithAccessor:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __46__TSPFileDataStorage_bookmarkDataWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = *(_QWORD *)(a1 + 40);
    v10 = 0;
    objc_msgSend(v3, "bookmarkDataWithOptions:includingResourceValuesForKeys:relativeToURL:error:", v5, 0, 0, &v10);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v10;
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v6;

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
      TSULogErrorInFunction();

  }
}

- (CGDataProvider)newCGDataProvider
{
  CGDataProvider *v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __39__TSPFileDataStorage_newCGDataProvider__block_invoke;
  v4[3] = &unk_24D829F90;
  v4[4] = &v5;
  -[TSPFileDataStorage performIOChannelReadWithAccessor:](self, "performIOChannelReadWithAccessor:", v4);
  v2 = (CGDataProvider *)v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __39__TSPFileDataStorage_newCGDataProvider__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v3 = a2;
  if (v3)
  {
    v9 = v3;
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB3CE8]), "initWithReadChannel:", v3);
    if ((objc_msgSend(v4, "canSeek") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPFileDataStorage newCGDataProvider]_block_invoke");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPFileDataStorage.mm");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, v7, 90, CFSTR("Need a seekable input stream for -cgDataProvider"));

    }
    v8 = v4;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CGDataProviderCreateSequential(v8, &TSPCGDataProviderCallbacks);

    v3 = v9;
  }

}

- (CGImageSource)newCGImageSource
{
  CGImageSource *result;
  CGDataProvider *v3;
  CGImageSource *v4;

  result = -[TSPFileDataStorage newCGDataProvider](self, "newCGDataProvider");
  if (result)
  {
    v3 = result;
    v4 = CGImageSourceCreateWithDataProvider(result, 0);
    CGDataProviderRelease(v3);
    return v4;
  }
  return result;
}

- (id)NSDataWithOptions:(unint64_t)a3
{
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__4;
  v10 = __Block_byref_object_dispose__4;
  v11 = 0;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __40__TSPFileDataStorage_NSDataWithOptions___block_invoke;
  v5[3] = &unk_24D829F90;
  v5[4] = &v6;
  -[TSPFileDataStorage performIOChannelReadWithAccessor:](self, "performIOChannelReadWithAccessor:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __40__TSPFileDataStorage_NSDataWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  dispatch_queue_t v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  NSObject *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v3 = a2;
  if (v3)
  {
    v4 = dispatch_queue_create("TSPFileDataStorage.NSDataWithOptions.Read", 0);
    v5 = dispatch_semaphore_create(0);
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__4;
    v15 = __Block_byref_object_dispose__4;
    objc_msgSend(MEMORY[0x24BDBCEC8], "data");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __40__TSPFileDataStorage_NSDataWithOptions___block_invoke_2;
    v7[3] = &unk_24D829FB8;
    v10 = &v11;
    v8 = v3;
    v6 = v5;
    v9 = v6;
    objc_msgSend(v8, "readFromOffset:length:queue:handler:", 0, -1, v4, v7);
    dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), (id)v12[5]);

    _Block_object_dispose(&v11, 8);
  }

}

void __40__TSPFileDataStorage_NSDataWithOptions___block_invoke_2(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *data;
  _QWORD applier[5];

  data = a3;
  v7 = a4;
  if (!data || v7)
  {
    if (v7)
    {
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = 0;

      objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPFileDataStorage NSDataWithOptions:]_block_invoke_2");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPFileDataStorage.mm");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, v12, 136, CFSTR("Error creating NSData for TSPFileDataStorage, %@"), v7);

    }
  }
  else
  {
    applier[0] = MEMORY[0x24BDAC760];
    applier[1] = 3221225472;
    applier[2] = __40__TSPFileDataStorage_NSDataWithOptions___block_invoke_3;
    applier[3] = &unk_24D829B48;
    applier[4] = *(_QWORD *)(a1 + 48);
    dispatch_data_apply(data, applier);
  }
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "close");
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }

}

uint64_t __40__TSPFileDataStorage_NSDataWithOptions___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "appendBytes:length:", a4, a5);
  return 1;
}

- (id)AVAssetWithOptions:(id)a3 contentTypeUTI:(id)a4
{
  id v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v5 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__4;
  v16 = __Block_byref_object_dispose__4;
  v17 = 0;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __56__TSPFileDataStorage_AVAssetWithOptions_contentTypeUTI___block_invoke;
  v9[3] = &unk_24D829FE0;
  v10 = v5;
  v11 = &v12;
  v6 = v5;
  -[TSPFileDataStorage performReadWithAccessor:](self, "performReadWithAccessor:", v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __56__TSPFileDataStorage_AVAssetWithOptions_contentTypeUTI___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(MEMORY[0x24BDB26C8], "URLAssetWithURL:options:");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)AVAssetWithOptions:(id)a3 usingResourceLoaderWithContentTypeUTI:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  dispatch_queue_t v15;
  TSPAVAssetResourceLoaderDelegate *v16;
  void *v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(CFSTR("iWorkAVAsset://"), "stringByAppendingString:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "URLWithString:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDB26C8], "URLAssetWithURL:options:", v12, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("TSPFileDataStorage.AVAssetResourceLoaderDelegateQueue.Read"), "stringByAppendingString:", v9);
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v15 = dispatch_queue_create((const char *)objc_msgSend(v14, "UTF8String"), 0);
  v16 = -[TSPAVAssetResourceLoaderDelegate initWithTSPFileDataStorage:contentTypeUTI:]([TSPAVAssetResourceLoaderDelegate alloc], "initWithTSPFileDataStorage:contentTypeUTI:", self, v7);
  objc_msgSend(v13, "resourceLoader");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setDelegate:queue:", v16, v15);
  objc_setAssociatedObject(v13, "com.apple.iWork.resourceLoaderDelegate", v16, (void *)1);

  return v13;
}

- (NSString)documentResourceLocator
{
  return 0;
}

- (NSString)packageLocator
{
  return 0;
}

- (unsigned)packageIdentifier
{
  return 0;
}

- (id)filenameForPreferredFilename:(id)a3
{
  return a3;
}

- (unint64_t)encodedLength
{
  unint64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __35__TSPFileDataStorage_encodedLength__block_invoke;
  v4[3] = &unk_24D82A008;
  v4[4] = &v5;
  -[TSPFileDataStorage performReadWithAccessor:](self, "performReadWithAccessor:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __35__TSPFileDataStorage_encodedLength__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByRemovingPercentEncoding");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    objc_msgSend(v7, "attributesOfItemAtPath:error:", v6, &v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v10;

    if (v8)
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v8, "fileSize");
    else
      TSULogErrorInFunction();

  }
}

- (BOOL)readOnly
{
  return 0;
}

- (BOOL)isInPackage:(id)a3
{
  return 0;
}

@end
