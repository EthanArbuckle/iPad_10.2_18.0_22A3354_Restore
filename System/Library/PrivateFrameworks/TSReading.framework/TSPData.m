@implementation TSPData

+ (id)dataFromURL:(id)a3 context:(id)a4
{
  objc_msgSend(a1, "dataFromURL:useExternalReferenceIfAllowed:context:", a3, 0, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)dataFromURL:(id)a3 useExternalReferenceIfAllowed:(BOOL)a4 context:(id)a5
{
  objc_msgSend(a1, "dataFromURL:useExternalReferenceIfAllowed:useFileCoordination:context:", a3, a4, 1, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)dataFromURL:(id)a3 useExternalReferenceIfAllowed:(BOOL)a4 useFileCoordination:(BOOL)a5 context:(id)a6
{
  _BOOL8 v7;
  _BOOL4 v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = a6;
  v11 = v10;
  if (v8 && objc_msgSend(v10, "areNewExternalReferencesToDataAllowed"))
  {
    objc_msgSend(v11, "dataManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dataFromExternalReferenceURL:useFileCoordination:", v9, v7);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v11, "dataManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dataFromURL:useFileCoordination:", v9, v7);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v13;

  return v14;
}

+ (id)dataFromNSData:(id)a3 filename:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;

  v7 = a3;
  v8 = a4;
  objc_msgSend(a5, "dataManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dataFromNSData:filename:", v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)dataFromDataRep:(id)a3 filename:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  id v9;
  TSPDataRepReadChannel *v10;
  void *v11;
  void *v12;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = -[TSPDataRepReadChannel initWithRepresentation:]([TSPDataRepReadChannel alloc], "initWithRepresentation:", v7);
  objc_msgSend(v9, "dataManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dataFromReadChannel:filename:", v10, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)dataFromReadChannel:(id)a3 filename:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;

  v7 = a3;
  v8 = a4;
  objc_msgSend(a5, "dataManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dataFromReadChannel:filename:", v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)readOnlyDataFromURL:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  TSPReadOnlyFileDataStorage *v7;
  void *v8;
  dispatch_semaphore_t v9;
  NSObject *v10;
  uint64_t v11;
  TSPData *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  TSPData *v16;
  uint64_t v17;
  _QWORD v19[4];
  NSObject *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v5 = a3;
  v6 = a4;
  v7 = -[TSPReadOnlyFileDataStorage initWithURL:]([TSPReadOnlyFileDataStorage alloc], "initWithURL:", v5);
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB3C68]), "initForReadingURL:", v5);
  if (v8)
  {
    v9 = dispatch_semaphore_create(0);
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __39__TSPData_readOnlyDataFromURL_context___block_invoke;
    v19[3] = &unk_24D829DD0;
    v21 = &v22;
    v10 = v9;
    v20 = v10;
    +[TSPDataManager readWithChannel:handler:](TSPDataManager, "readWithChannel:handler:", v8, v19);
    dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
    objc_msgSend(v8, "close");

  }
  if (!v23[3])
  {
    TSULogErrorInFunction();
    v11 = operator new();
    *(_QWORD *)v11 = 0;
    *(_QWORD *)(v11 + 8) = 0;
    *(_DWORD *)(v11 + 16) = 0;
    v23[3] = v11;
  }
  v12 = [TSPData alloc];
  v13 = v23[3];
  objc_msgSend(v5, "lastPathComponent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[TSPData initWithIdentifier:digest:filename:storage:manager:](v12, "initWithIdentifier:digest:filename:storage:manager:", 0, v13, v14, v7, v15);

  v17 = v23[3];
  if (v17)
    MEMORY[0x219A153B8](v17, 0x1000C40A86A77D5);

  _Block_object_dispose(&v22, 8);
  return v16;
}

void __39__TSPData_readOnlyDataFromURL_context___block_invoke(uint64_t a1, int a2, void *a3, void *a4, uint64_t a5)
{
  id v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  v9 = a4;
  if (a2)
  {
    if (a5)
    {
      v10 = operator new();
      *(_OWORD *)v10 = *(_OWORD *)a5;
      *(_DWORD *)(v10 + 16) = *(_DWORD *)(a5 + 16);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v10;
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }

}

+ (id)readOnlyDataFromNSData:(id)a3 filename:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  id v9;
  TSPReadOnlyMemoryDataStorage *v10;
  TSPData *v11;
  void *v12;
  TSPData *v13;
  _QWORD v15[5];
  CC_SHA1_CTX c;
  unsigned __int8 md[20];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = -[TSPReadOnlyMemoryDataStorage initWithNSData:]([TSPReadOnlyMemoryDataStorage alloc], "initWithNSData:", v7);
  CC_SHA1_Init(&c);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __51__TSPData_readOnlyDataFromNSData_filename_context___block_invoke;
  v15[3] = &__block_descriptor_40_e29_v40__0r_v8__NSRange_QQ_16_B32l;
  v15[4] = &c;
  objc_msgSend(v7, "enumerateByteRangesUsingBlock:", v15);
  CC_SHA1_Final(md, &c);
  v11 = [TSPData alloc];
  objc_msgSend(v9, "dataManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[TSPData initWithIdentifier:digest:filename:storage:manager:](v11, "initWithIdentifier:digest:filename:storage:manager:", 0, md, v8, v10, v12);

  return v13;
}

uint64_t __51__TSPData_readOnlyDataFromNSData_filename_context___block_invoke(uint64_t a1, const void *a2, int a3, CC_LONG len)
{
  return CC_SHA1_Update(*(CC_SHA1_CTX **)(a1 + 32), a2, len);
}

+ (id)readOnlyDataFromDataRep:(id)a3 filename:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  id v9;
  TSPReadOnlyProvidedDataStorage *v10;
  TSPData *v11;
  void *v12;
  TSPData *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = -[TSPReadOnlyProvidedDataStorage initWithDataRepresentation:]([TSPReadOnlyProvidedDataStorage alloc], "initWithDataRepresentation:", v7);
  LODWORD(v16) = 0;
  v11 = [TSPData alloc];
  objc_msgSend(v9, "dataManager", 0, 0, v16, v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[TSPData initWithIdentifier:digest:filename:storage:manager:](v11, "initWithIdentifier:digest:filename:storage:manager:", 0, &v15, v8, v10, v12);

  return v13;
}

+ (id)readOnlyDataWithoutDataDigestFromURL:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  TSPReadOnlyFileDataStorage *v7;
  TSPData *v8;
  void *v9;
  void *v10;
  TSPData *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = -[TSPReadOnlyFileDataStorage initWithURL:]([TSPReadOnlyFileDataStorage alloc], "initWithURL:", v5);
  LODWORD(v14) = 0;
  v8 = [TSPData alloc];
  objc_msgSend(v5, "lastPathComponent", 0, 0, v14, v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[TSPData initWithIdentifier:digest:filename:storage:manager:](v8, "initWithIdentifier:digest:filename:storage:manager:", 0, &v13, v9, v7, v10);

  return v11;
}

+ (id)null
{
  if (+[TSPData null]::onceToken != -1)
    dispatch_once(&+[TSPData null]::onceToken, &__block_literal_global_7);
  return (id)+[TSPData null]::nullData;
}

void __15__TSPData_null__block_invoke()
{
  TSPData *v0;
  void *v1;
  _QWORD v2[2];
  int v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2[0] = 0;
  v2[1] = 0;
  v3 = 0;
  v0 = -[TSPData initWithIdentifier:digest:filename:storage:manager:]([TSPData alloc], "initWithIdentifier:digest:filename:storage:manager:", 0, v2, &stru_24D82FEB0, 0, 0);
  v1 = (void *)+[TSPData null]::nullData;
  +[TSPData null]::nullData = (uint64_t)v0;

}

+ (id)cullingListenersQueue
{
  if (+[TSPData cullingListenersQueue]::onceToken != -1)
    dispatch_once(&+[TSPData cullingListenersQueue]::onceToken, &__block_literal_global_13);
  return (id)sCullingListenersQueue;
}

void __32__TSPData_cullingListenersQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("TSPData.Culling", 0);
  v1 = (void *)sCullingListenersQueue;
  sCullingListenersQueue = (uint64_t)v0;

}

+ (void)addCullingListener:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  if (+[TSPData addCullingListener:]::onceToken != -1)
    dispatch_once(&+[TSPData addCullingListener:]::onceToken, &__block_literal_global_15);
  objc_msgSend(a1, "cullingListenersQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__TSPData_addCullingListener___block_invoke_2;
  block[3] = &unk_24D829778;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

}

void __30__TSPData_addCullingListener___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDD15C0]), "initWithOptions:capacity:", 517, 0);
  v1 = (void *)sCullingListeners;
  sCullingListeners = v0;

}

uint64_t __30__TSPData_addCullingListener___block_invoke_2(uint64_t a1)
{
  return objc_msgSend((id)sCullingListeners, "addObject:", *(_QWORD *)(a1 + 32));
}

+ (void)removeCullingListener:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  objc_msgSend(a1, "cullingListenersQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__TSPData_removeCullingListener___block_invoke;
  block[3] = &unk_24D829778;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

}

uint64_t __33__TSPData_removeCullingListener___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)sCullingListeners, "removeObject:", *(_QWORD *)(a1 + 32));
}

+ (id)cullingListeners
{
  NSObject *v2;
  id v3;
  _QWORD block[5];
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
  objc_msgSend(a1, "cullingListenersQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __27__TSPData_cullingListeners__block_invoke;
  block[3] = &unk_24D829E78;
  block[4] = &v6;
  dispatch_sync(v2, block);

  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __27__TSPData_cullingListeners__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = objc_msgSend((id)sCullingListeners, "count");
  if (v2)
    v3 = (void *)objc_msgSend((id)sCullingListeners, "copy");
  else
    v3 = 0;
  v4 = v3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v3);
  if (v2)

}

- (void)dealloc
{
  objc_super v3;

  self->_isDeallocating = 1;
  -[TSPData willCull](self, "willCull");
  v3.receiver = self;
  v3.super_class = (Class)TSPData;
  -[TSPData dealloc](&v3, sel_dealloc);
}

- (void)willCull
{
  int *p_didCull;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  p_didCull = &self->_didCull;
  do
  {
    if (__ldaxr((unsigned int *)p_didCull))
    {
      __clrex();
      return;
    }
  }
  while (__stlxr(1u, (unsigned int *)p_didCull));
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend((id)objc_opt_class(), "cullingListeners", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "willCullData:", self);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (id)bookmarkData
{
  void *v2;
  void *v3;

  -[TSPData storage](self, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bookmarkDataWithOptions:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)NSData
{
  void *v2;
  void *v3;

  -[TSPData storage](self, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "NSDataWithOptions:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CGDataProvider)newCGDataProvider
{
  void *v2;
  CGDataProvider *v3;

  -[TSPData storage](self, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (CGDataProvider *)objc_msgSend(v2, "newCGDataProvider");

  return v3;
}

- (CGImageSource)newCGImageSource
{
  void *v2;
  CGImageSource *v3;

  -[TSPData storage](self, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (CGImageSource *)objc_msgSend(v2, "newCGImageSource");

  return v3;
}

- (CGImage)newCGImage
{
  CGImage *result;
  CGImage *v3;
  CGImage *ImageAtIndex;

  result = -[TSPData newCGImageSource](self, "newCGImageSource");
  if (result)
  {
    v3 = result;
    ImageAtIndex = CGImageSourceCreateImageAtIndex(result, 0, 0);
    CFRelease(v3);
    return ImageAtIndex;
  }
  return result;
}

- (id)AVAsset
{
  return -[TSPData AVAssetWithOptions:](self, "AVAssetWithOptions:", 0);
}

- (id)AVAssetWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "requiredAVAssetOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  if (v4)
    objc_msgSend(v6, "addEntriesFromDictionary:", v4);
  -[TSPData storage](self, "storage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSPData type](self, "type");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "AVAssetWithOptions:contentTypeUTI:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)requiredAVAssetOptions
{
  uint64_t v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDB21E0];
  v4[0] = &unk_24D8FABC0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)filename
{
  NSObject *accessQueue;
  id v4;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  if (self->_isDeallocating)
  {
    -[TSPData preferredFilename](self, "preferredFilename");
    return (NSString *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
    v7 = &v6;
    v8 = 0x3032000000;
    v9 = __Block_byref_object_copy__3;
    v10 = __Block_byref_object_dispose__3;
    v11 = 0;
    accessQueue = self->_accessQueue;
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __19__TSPData_filename__block_invoke;
    v5[3] = &unk_24D8297F0;
    v5[4] = self;
    v5[5] = &v6;
    dispatch_sync(accessQueue, v5);
    v4 = (id)v7[5];
    _Block_object_dispose(&v6, 8);

    return (NSString *)v4;
  }
}

void __19__TSPData_filename__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "preferredFilename");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSString)type
{
  void *v2;
  __CFString *v3;
  __CFString *PreferredIdentifierForTag;

  -[TSPData filename](self, "filename");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathExtension");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v3)
    PreferredIdentifierForTag = (__CFString *)UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x24BDC1658], v3, 0);
  else
    PreferredIdentifierForTag = 0;

  return (NSString *)PreferredIdentifierForTag;
}

- (BOOL)isReadable
{
  return -[TSPData isLengthLikelyToBeGreaterThan:](self, "isLengthLikelyToBeGreaterThan:", 0);
}

- (BOOL)isApplicationData
{
  void *v2;
  BOOL v3;

  -[TSPData documentResourceLocator](self, "documentResourceLocator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isExternalData
{
  void *v2;
  char isKindOfClass;

  -[TSPData storage](self, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (NSString)documentResourceLocator
{
  void *v2;
  void *v3;

  -[TSPData storage](self, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "documentResourceLocator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)packageLocator
{
  void *v2;
  void *v3;

  -[TSPData storage](self, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "packageLocator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (unsigned)packageIdentifier
{
  void *v2;
  unsigned __int8 v3;

  -[TSPData storage](self, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "packageIdentifier");

  return v3;
}

- (TSPObjectContext)context
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  objc_msgSend(WeakRetained, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (TSPObjectContext *)v3;
}

- (NSString)uniqueName
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "tsp_stringForDigest:length:", &self->_digest, 20);
}

- (id)copyWithContext:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "dataManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copyData:", self);

  return v5;
}

- (void)performIOChannelReadWithAccessor:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[TSPData storage](self, "storage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performIOChannelReadWithAccessor:", v5);

}

- (void)performInputStreamReadWithAccessor:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __46__TSPData_performInputStreamReadWithAccessor___block_invoke;
    v6[3] = &unk_24D829EA0;
    v6[4] = self;
    v7 = v4;
    -[TSPData performIOChannelReadWithAccessor:](self, "performIOChannelReadWithAccessor:", v6);

  }
}

void __46__TSPData_performInputStreamReadWithAccessor___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v6 = a2;
  if (v6)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB3CE8]), "initWithReadChannel:", v6);
  }
  else
  {
    v4 = objc_alloc(MEMORY[0x24BEB3C18]);
    objc_msgSend(*(id *)(a1 + 32), "NSData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_msgSend(v4, "initWithData:", v5);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (BOOL)needsDownload
{
  void *v2;
  char v3;

  -[TSPData storage](self, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "needsDownload");
  else
    v3 = 0;

  return v3;
}

- (void)addDownloadObserver:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[TSPData storage](self, "storage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "addDownloadObserver:forData:completionHandler:", v8, self, v6);

}

- (unint64_t)hash
{
  return *(_QWORD *)-[TSPData digest](self, "digest");
}

- (BOOL)isEqual:(id)a3
{
  TSPData *v4;
  TSPData *v5;
  void *v6;
  void *v7;
  BOOL v8;
  _QWORD *v9;
  uint64_t v10;

  v4 = (TSPData *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[TSPData context](self, "context");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[TSPData context](v5, "context");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6 == v7)
      {
        v9 = -[TSPData digest](self, "digest");
        v10 = -[TSPData digest](v5, "digest");
        v8 = *v9 == *(_QWORD *)v10
          && v9[1] == *(_QWORD *)(v10 + 8)
          && *((_DWORD *)v9 + 4) == (unint64_t)*(unsigned int *)(v10 + 16);
      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  int v8;
  int v9;
  void *v10;
  uint64_t v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)TSPData;
  -[TSPData description](&v13, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSPData preferredFilename](self, "preferredFilename");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" \"%@\"), v4);
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  -[TSPDataStorage documentResourceLocator](self->_storage, "documentResourceLocator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[TSPDataStorage readOnly](self->_storage, "readOnly");
  v8 = v7;
  if (v6)
    v9 = 1;
  else
    v9 = v7;
  if (v9 == 1)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithCapacity:", 32);
    objc_msgSend(v10, "appendString:", CFSTR("("));
    if (v6)
    {
      objc_msgSend(v10, "appendString:", CFSTR("application data"));
      if (v8)
      {
        objc_msgSend(v10, "appendString:", CFSTR(", "));
LABEL_11:
        objc_msgSend(v10, "appendString:", CFSTR("read only"));
      }
    }
    else if (v8)
    {
      goto LABEL_11;
    }
    objc_msgSend(v10, "appendString:", CFSTR(")"));
    objc_msgSend(v3, "stringByAppendingString:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v11;
  }

  return v3;
}

- (BOOL)writeToURL:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  dispatch_queue_t v10;
  dispatch_semaphore_t v11;
  NSObject *v12;
  NSObject *v13;
  BOOL v14;
  uint64_t v16;
  void *v17;
  _QWORD v18[4];
  dispatch_queue_t v19;
  dispatch_semaphore_t v20;
  uint64_t *v21;
  uint64_t *v22;
  int v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;

  v6 = a3;
  if ((objc_msgSend(v6, "isFileURL") & 1) == 0)
  {
    v14 = 0;
    goto LABEL_7;
  }
  objc_msgSend(v6, "path");
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 1;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__3;
  v28 = __Block_byref_object_dispose__3;
  v29 = 0;
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  unlink((const char *)objc_msgSend(v7, "fileSystemRepresentation"));
  objc_msgSend(v6, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = TSUOpen();

  if (v9 < 0)
  {
    *((_BYTE *)v31 + 24) = 0;
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], *__error(), 0);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v25[5];
    v25[5] = v16;

    if (!a4)
      goto LABEL_5;
    goto LABEL_4;
  }
  v10 = dispatch_queue_create("TSPData.WriteToURL", 0);
  v11 = dispatch_semaphore_create(0);
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __28__TSPData_writeToURL_error___block_invoke;
  v18[3] = &unk_24D829F18;
  v23 = v9;
  v21 = &v30;
  v22 = &v24;
  v19 = v10;
  v20 = v11;
  v12 = v11;
  v13 = v10;
  -[TSPData performIOChannelReadWithAccessor:](self, "performIOChannelReadWithAccessor:", v18);
  dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);

  close(v9);
  if (a4)
LABEL_4:
    *a4 = objc_retainAutorelease((id)v25[5]);
LABEL_5:
  v14 = *((_BYTE *)v31 + 24) != 0;
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
LABEL_7:

  return v14;
}

void __28__TSPData_writeToURL_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  __int128 v6;
  _QWORD v7[4];
  __int128 v8;
  uint64_t v9;
  int v10;

  v3 = a2;
  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __28__TSPData_writeToURL_error___block_invoke_2;
    v7[3] = &unk_24D829EF0;
    v10 = *(_DWORD *)(a1 + 64);
    v9 = *(_QWORD *)(a1 + 56);
    v6 = *(_OWORD *)(a1 + 40);
    v5 = (id)v6;
    v8 = v6;
    objc_msgSend(v3, "readFromOffset:length:queue:handler:", 0, -1, v4, v7);

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }

}

void __28__TSPData_writeToURL_error___block_invoke_2(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  uint64_t v8;
  BOOL v9;
  NSObject *data;
  _QWORD applier[5];
  int v12;

  data = a3;
  v7 = a4;
  if (data)
  {
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (*(_BYTE *)(v8 + 24))
    {
      applier[0] = MEMORY[0x24BDAC760];
      applier[1] = 3221225472;
      applier[2] = __28__TSPData_writeToURL_error___block_invoke_3;
      applier[3] = &unk_24D829EC8;
      v12 = *(_DWORD *)(a1 + 56);
      applier[4] = *(_QWORD *)(a1 + 48);
      v9 = dispatch_data_apply(data, applier);
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    }
    else
    {
      v9 = 0;
    }
    *(_BYTE *)(v8 + 24) = v9;
  }
  if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a4);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  if (a2)
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

uint64_t __28__TSPData_writeToURL_error___block_invoke_3(uint64_t a1, int a2, int a3, void *__buf, size_t __nbyte)
{
  ssize_t v7;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = write(*(_DWORD *)(a1 + 40), __buf, __nbyte);
  if (v7 < 0)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], *__error(), 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;
  }
  else
  {
    if (v7 == __nbyte)
      return 1;
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPData writeToURL:error:]_block_invoke_3");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPData.mm");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, v13, 566, CFSTR("Didn't write as many bytes as we wanted to"));

  }
  return 0;
}

- (BOOL)isLengthLikelyToBeGreaterThan:(unint64_t)a3
{
  void *v4;

  -[TSPData storage](self, "storage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "encodedLength") > a3;

  return a3;
}

- (unint64_t)encodedLength
{
  void *v2;
  unint64_t v3;

  -[TSPData storage](self, "storage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "encodedLength");

  return v3;
}

- (TSPData)initWithIdentifier:(int64_t)a3 digest:(const void *)a4 filename:(id)a5 storage:(id)a6 manager:(id)a7
{
  id v13;
  id v14;
  id v15;
  char *v16;
  TSPData *v17;
  __int128 v18;
  dispatch_queue_t v19;
  OS_dispatch_queue *accessQueue;
  TSPData *v21;
  objc_super v23;

  v13 = a5;
  v14 = a6;
  v15 = a7;
  v23.receiver = self;
  v23.super_class = (Class)TSPData;
  v16 = -[TSPData init](&v23, sel_init);
  v17 = (TSPData *)v16;
  if (v16)
  {
    *((_QWORD *)v16 + 2) = a3;
    v18 = *(_OWORD *)a4;
    *((_DWORD *)v16 + 18) = *((_DWORD *)a4 + 4);
    *(_OWORD *)(v16 + 56) = v18;
    objc_storeStrong((id *)v16 + 5, a5);
    objc_storeStrong((id *)&v17->_storage, a6);
    objc_storeWeak((id *)&v17->_manager, v15);
    v19 = dispatch_queue_create("TSPData.Access", MEMORY[0x24BDAC9C0]);
    accessQueue = v17->_accessQueue;
    v17->_accessQueue = (OS_dispatch_queue *)v19;

    v21 = v17;
  }

  return v17;
}

- (TSPDataStorage)storage
{
  NSObject *accessQueue;
  id v4;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  if (self->_isDeallocating)
    return self->_storage;
  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__3;
  v10 = __Block_byref_object_dispose__3;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __18__TSPData_storage__block_invoke;
  v5[3] = &unk_24D8297F0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v4 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (TSPDataStorage *)v4;
}

void __18__TSPData_storage__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 32));
}

- (void)setStorage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *accessQueue;
  id v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  if (self->_isDeallocating)
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPData setStorage:]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPData.mm");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, v7, 662, CFSTR("Storage should not be modified while TSPData is being deallocated"));

  }
  accessQueue = self->_accessQueue;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __22__TSPData_setStorage___block_invoke;
  v10[3] = &unk_24D829818;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  dispatch_barrier_async(accessQueue, v10);

}

void __22__TSPData_setStorage___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 40));
}

- (void)setFilename:(id)a3 storage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *accessQueue;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  if (self->_isDeallocating)
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPData setFilename:storage:]");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPData.mm");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, v10, 671, CFSTR("Filename and storage should not be modified while TSPData is being deallocated"));

  }
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__TSPData_setFilename_storage___block_invoke;
  block[3] = &unk_24D829D28;
  block[4] = self;
  v15 = v6;
  v16 = v7;
  v12 = v7;
  v13 = v6;
  dispatch_barrier_async(accessQueue, block);

}

void __31__TSPData_setFilename_storage___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), *(id *)(a1 + 40));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 48));
}

- (id)preferredFilename
{
  TSPDataStorage *storage;
  NSString *filename;
  NSString *v5;

  storage = self->_storage;
  filename = self->_filename;
  if (storage)
  {
    -[TSPDataStorage filenameForPreferredFilename:](storage, "filenameForPreferredFilename:", filename);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = filename;
  }
  return v5;
}

- (const)digest
{
  return &self->_digest;
}

- (BOOL)isStorageInPackage:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[TSPData storage](self, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isInPackage:", v4);

  return v6;
}

+ (BOOL)updateDigest:(void *)a3 withProtobufString:(const void *)a4
{
  int v4;
  __int128 v5;

  v4 = *((char *)a4 + 23);
  if ((v4 & 0x80000000) == 0)
  {
    if (v4 != 20)
      goto LABEL_7;
LABEL_6:
    v5 = *(_OWORD *)a4;
    *((_DWORD *)a3 + 4) = *((_DWORD *)a4 + 4);
    *(_OWORD *)a3 = v5;
    return 1;
  }
  if (*((_QWORD *)a4 + 1) == 20)
  {
    a4 = *(const void **)a4;
    goto LABEL_6;
  }
LABEL_7:
  TSULogErrorInFunction();
  return 0;
}

- (int64_t)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_manager);
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end
