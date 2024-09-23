@implementation TSPDocumentResourceCache

+ (id)defaultCacheURL
{
  if (defaultCacheURL_onceToken != -1)
    dispatch_once(&defaultCacheURL_onceToken, &__block_literal_global_9);
  return (id)defaultCacheURL_defaultCacheURL;
}

void __43__TSPDocumentResourceCache_defaultCacheURL__block_invoke()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  objc_msgSend(v0, "URLForDirectory:inDomain:appropriateForURL:create:error:", 14, 1, 0, 1, &v5);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v5;

  if (v1)
  {
    objc_msgSend(v1, "URLByAppendingPathComponent:isDirectory:", CFSTR("Document Resources"), 1);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)defaultCacheURL_defaultCacheURL;
    defaultCacheURL_defaultCacheURL = v3;

  }
  else
  {
    TSULogErrorInFunction();
  }

}

+ (id)sharedCache
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__TSPDocumentResourceCache_sharedCache__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedCache_onceToken != -1)
    dispatch_once(&sharedCache_onceToken, block);
  return (id)sharedCache_sharedCache;
}

void __39__TSPDocumentResourceCache_sharedCache__block_invoke(uint64_t a1)
{
  TSPDocumentResourceCache *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = [TSPDocumentResourceCache alloc];
  objc_msgSend(*(id *)(a1 + 32), "defaultCacheURL");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[TSPDocumentResourceCache initWithCacheURL:](v2, "initWithCacheURL:", v5);
  v4 = (void *)sharedCache_sharedCache;
  sharedCache_sharedCache = v3;

}

- (TSPDocumentResourceCache)init
{
  void *v3;
  TSPDocumentResourceCache *v4;

  objc_msgSend((id)objc_opt_class(), "defaultCacheURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[TSPDocumentResourceCache initWithCacheURL:](self, "initWithCacheURL:", v3);

  return v4;
}

- (TSPDocumentResourceCache)initWithCacheURL:(id)a3
{
  id v4;
  TSPDocumentResourceCache *v5;
  uint64_t v6;
  NSURL *cacheURL;
  dispatch_queue_t v8;
  OS_dispatch_queue *accessQueue;
  NSMutableDictionary *v10;
  NSMutableDictionary *entries;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TSPDocumentResourceCache;
  v5 = -[TSPDocumentResourceCache init](&v13, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    cacheURL = v5->_cacheURL;
    v5->_cacheURL = (NSURL *)v6;

    v5->_maxCacheSizeInBytes = 5242880;
    v8 = dispatch_queue_create("TSPDocumentResourceCache.Access", 0);
    accessQueue = v5->_accessQueue;
    v5->_accessQueue = (OS_dispatch_queue *)v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    entries = v5->_entries;
    v5->_entries = v10;

    -[TSPDocumentResourceCache reloadEntries](v5, "reloadEntries");
  }

  return v5;
}

- (id)entryForDigestString:(id)a3
{
  id v4;
  TSPDocumentResourceCacheEntry *v5;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_entries, "objectForKeyedSubscript:", v4);
  v5 = (TSPDocumentResourceCacheEntry *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = -[TSPDocumentResourceCacheEntry initWithDigestString:]([TSPDocumentResourceCacheEntry alloc], "initWithDigestString:", v4);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_entries, "setObject:forKeyedSubscript:", v5, v4);
  }

  return v5;
}

- (id)URLForDocumentResourceDigestString:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__5;
  v16 = __Block_byref_object_dispose__5;
  v17 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__TSPDocumentResourceCache_URLForDocumentResourceDigestString___block_invoke;
  block[3] = &unk_24D82A3A8;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(accessQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __63__TSPDocumentResourceCache_URLForDocumentResourceDigestString___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "entryForDigestString:", *(_QWORD *)(a1 + 40));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URL");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "checkResourceIsReachableAndReturnError:", 0) & 1) == 0)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = 0;

  }
}

- (BOOL)cacheDocumentResourceDigestString:(id)a3 extension:(id)a4 sourceURL:(id)a5 fileSize:(int64_t)a6 wasDownloaded:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *accessQueue;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v21;
  id v22;
  id v23;
  uint64_t *v24;
  int64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __105__TSPDocumentResourceCache_cacheDocumentResourceDigestString_extension_sourceURL_fileSize_wasDownloaded___block_invoke;
  block[3] = &unk_24D82A3D0;
  block[4] = self;
  v21 = v12;
  v26 = a7;
  v22 = v13;
  v23 = v14;
  v24 = &v27;
  v25 = a6;
  v16 = v14;
  v17 = v13;
  v18 = v12;
  dispatch_sync(accessQueue, block);
  LOBYTE(accessQueue) = *((_BYTE *)v28 + 24);

  _Block_object_dispose(&v27, 8);
  return (char)accessQueue;
}

void __105__TSPDocumentResourceCache_cacheDocumentResourceDigestString_extension_sourceURL_fileSize_wasDownloaded___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  uint64_t v12;
  char v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  char v25;
  void *v26;
  uint64_t v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "entryForDigestString:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "checkResourceIsReachableAndReturnError:", 0) & 1) != 0)
  {
    if (v3)
    {
      if (objc_msgSend(v2, "wasDownloaded") && *(_BYTE *)(a1 + 80))
      {
        objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPDocumentResourceCache cacheDocumentResourceDigestString:extension:sourceURL:fileSize:wasDownloaded:]_block_invoke");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPDocumentResourceCache.m");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, v6, 179, CFSTR("Cache entry for digest %@ was downloaded more than once."), *(_QWORD *)(a1 + 40));

      }
      goto LABEL_21;
    }
  }
  else
  {

  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), 1, 0, 0);
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(*(id *)(a1 + 40), "stringByAppendingPathExtension:", *(_QWORD *)(a1 + 48));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByAppendingPathComponent:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_BYTE *)(a1 + 80))
    v10 = objc_msgSend(v3, "moveItemAtURL:toURL:error:", *(_QWORD *)(a1 + 56), v9, 0);
  else
    v10 = 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v10;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    v11 = 0;
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 56);
    v34 = 0;
    v13 = objc_msgSend(v3, "copyItemAtURL:toURL:error:", v12, v9, &v34);
    v11 = v34;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v13;
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    {
      objc_msgSend(*(id *)(a1 + 56), "path");
      v22 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    }
  }
  objc_msgSend(v2, "setURL:", v9);
  v35 = *MEMORY[0x24BDBCC68];
  v36[0] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "path");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v11;
  v16 = objc_msgSend(v3, "setAttributes:ofItemAtPath:error:", v14, v15, &v33);
  v17 = v33;

  if ((v16 & 1) == 0)
  {
    v27 = *(_QWORD *)(a1 + 40);
    v28 = v17;
    TSULogErrorInFunction();
  }
  v18 = *(_QWORD *)(a1 + 72);
  if (v18)
  {
    v11 = v17;
    goto LABEL_19;
  }
  v32 = 0;
  v19 = *MEMORY[0x24BDBCC48];
  v31 = 0;
  v20 = objc_msgSend(v9, "getResourceValue:forKey:error:", &v32, v19, &v31);
  v21 = v32;
  v11 = v31;
  v22 = v21;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v20;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
LABEL_24:
    TSULogErrorInFunction();

    goto LABEL_25;
  }
  v18 = objc_msgSend(v22, "longLongValue");

LABEL_19:
  v23 = v11;
  objc_msgSend(v2, "setFileSize:", v18, v27, v28);
  v30 = 0;
  v24 = *MEMORY[0x24BDBCBD8];
  v29 = 0;
  v25 = objc_msgSend(v9, "getResourceValue:forKey:error:", &v30, v24, &v29);
  v26 = v30;
  v11 = v29;
  v22 = v26;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v25;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    goto LABEL_24;
  objc_msgSend(v2, "setContentAccessDate:", v22);

  objc_msgSend(v2, "setWasDownloaded:", *(unsigned __int8 *)(a1 + 80));
  v3 = 0;
LABEL_21:
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
LABEL_25:

}

- (BOOL)beginDocumentResourceAccessForDigestString:(id)a3
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
  block[2] = __71__TSPDocumentResourceCache_beginDocumentResourceAccessForDigestString___block_invoke;
  block[3] = &unk_24D82A3A8;
  block[4] = self;
  v9 = v4;
  v10 = &v11;
  v6 = v4;
  dispatch_sync(accessQueue, block);
  LOBYTE(accessQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)accessQueue;
}

void __71__TSPDocumentResourceCache_beginDocumentResourceAccessForDigestString___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  char v7;
  id v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "entryForDigestString:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v3, "checkResourceIsReachableAndReturnError:", 0);
  objc_msgSend(v2, "setAccessCount:", objc_msgSend(v2, "accessCount") + 1);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setContentAccessDate:", v4);

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    objc_msgSend(v2, "contentAccessDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x24BDBCBD8];
    v10 = 0;
    v7 = objc_msgSend(v3, "setResourceValue:forKey:error:", v5, v6, &v10);
    v8 = v10;

    if ((v7 & 1) == 0)
    {
      objc_msgSend(v2, "digestString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      TSULogErrorInFunction();

    }
  }
  else
  {
    v8 = 0;
  }

}

- (void)endDocumentResourceAccessForDigestString:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __69__TSPDocumentResourceCache_endDocumentResourceAccessForDigestString___block_invoke;
  v7[3] = &unk_24D82A3F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(accessQueue, v7);

}

void __69__TSPDocumentResourceCache_endDocumentResourceAccessForDigestString___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v2;
  if (!v2)
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPDocumentResourceCache endDocumentResourceAccessForDigestString:]_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPDocumentResourceCache.m");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, v6, 231, CFSTR("Cannot end using document resource with digest %@ because it is not cached."), *(_QWORD *)(a1 + 40));
    goto LABEL_5;
  }
  v3 = objc_msgSend(v2, "accessCount");
  objc_msgSend(v7, "setAccessCount:", v3 - 1);
  if (v3 <= 0)
  {
    objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSPDocumentResourceCache endDocumentResourceAccessForDigestString:]_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPDocumentResourceCache.m");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, v6, 226, CFSTR("Unbalanced calls to -beginUsingDocumentResource: and -endUsingDocumentResource: for document resource digest %@."), *(_QWORD *)(a1 + 40));
LABEL_5:

  }
}

- (void)shrinkCache
{
  -[TSPDocumentResourceCache shrinkCacheWithMaxCacheSizeInBytes:](self, "shrinkCacheWithMaxCacheSizeInBytes:", self->_maxCacheSizeInBytes);
}

- (void)clearCache
{
  -[TSPDocumentResourceCache shrinkCacheWithMaxCacheSizeInBytes:](self, "shrinkCacheWithMaxCacheSizeInBytes:", 0);
}

- (void)shrinkCacheWithMaxCacheSizeInBytes:(int64_t)a3
{
  NSObject *accessQueue;
  _QWORD v4[6];

  accessQueue = self->_accessQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __63__TSPDocumentResourceCache_shrinkCacheWithMaxCacheSizeInBytes___block_invoke;
  v4[3] = &unk_24D82A488;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(accessQueue, v4);
}

void __63__TSPDocumentResourceCache_shrinkCacheWithMaxCacheSizeInBytes___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[4];
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count"));
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __63__TSPDocumentResourceCache_shrinkCacheWithMaxCacheSizeInBytes___block_invoke_2;
  v24[3] = &unk_24D82A420;
  v26 = &v27;
  v18 = v2;
  v25 = v18;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v24);
  if (v28[3] > *(_QWORD *)(a1 + 40))
  {
    objc_msgSend(v18, "sortedArrayUsingComparator:", &__block_literal_global_32);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v31, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v21 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v10, "URL", v16, v17);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = 0;
          v12 = objc_msgSend(v5, "removeItemAtURL:error:", v11, &v19);
          v13 = v19;

          if (v12)
          {
            objc_msgSend(v10, "setURL:", 0);
            v14 = objc_msgSend(v10, "fileSize");
            v15 = v28[3] - v14;
            v28[3] = v15;
            if (v15 <= *(_QWORD *)(a1 + 40))
            {

              goto LABEL_13;
            }
          }
          else
          {
            objc_msgSend(v10, "digestString");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = v13;
            TSULogErrorInFunction();

          }
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v31, 16);
      }
      while (v7);
    }
LABEL_13:

  }
  _Block_object_dispose(&v27, 8);
}

void __63__TSPDocumentResourceCache_shrinkCacheWithMaxCacheSizeInBytes___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  int v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "URL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "checkResourceIsReachableAndReturnError:", 0);

  if (v5)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += objc_msgSend(v6, "fileSize");
    if (!objc_msgSend(v6, "accessCount"))
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
  }

}

uint64_t __63__TSPDocumentResourceCache_shrinkCacheWithMaxCacheSizeInBytes___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "contentAccessDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentAccessDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (void)enumerateEntriesFromCacheURLWithHandler:(id)a3
{
  void *v4;
  NSURL *cacheURL;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  id v19;
  char v20;
  id v21;
  id v22;
  char v23;
  id v24;
  id v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void (**v31)(id, void *, void *, uint64_t, id, _BYTE *);
  uint64_t v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  unsigned __int8 v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _QWORD v54[7];

  v54[4] = *MEMORY[0x24BDAC8D0];
  v31 = (void (**)(id, void *, void *, uint64_t, id, _BYTE *))a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  cacheURL = self->_cacheURL;
  v6 = *MEMORY[0x24BDBCC60];
  v39 = *MEMORY[0x24BDBCCD0];
  v54[0] = *MEMORY[0x24BDBCCD0];
  v54[1] = v6;
  v7 = *MEMORY[0x24BDBCBD8];
  v34 = *MEMORY[0x24BDBCC48];
  v54[2] = *MEMORY[0x24BDBCC48];
  v54[3] = v7;
  v32 = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v54, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", cacheURL, v8, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v50;
    v37 = v10;
    v38 = v6;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v50 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v14);
        v16 = (void *)MEMORY[0x219A15874](v11);
        v47 = 0;
        v48 = 0;
        v17 = objc_msgSend(v15, "getResourceValue:forKey:error:", &v48, v6, &v47);
        v18 = v48;
        v19 = v47;
        if ((v17 & 1) == 0)
        {
          TSULogErrorInFunction();
          goto LABEL_20;
        }
        if ((objc_msgSend(v18, "BOOLValue") & 1) != 0)
          goto LABEL_20;
        v45 = 0;
        v46 = 0;
        v20 = objc_msgSend(v15, "getResourceValue:forKey:error:", &v46, v39, &v45);
        v21 = v46;
        v22 = v45;

        if ((v20 & 1) != 0)
        {
          v36 = v21;
          v43 = 0;
          v44 = 0;
          v23 = objc_msgSend(v15, "getResourceValue:forKey:error:", &v44, v34, &v43);
          v24 = v44;
          v25 = v43;

          if ((v23 & 1) != 0)
          {
            v33 = v24;
            v41 = 0;
            v42 = 0;
            v26 = objc_msgSend(v15, "getResourceValue:forKey:error:", &v42, v32, &v41);
            v35 = v42;
            v19 = v41;

            if ((v26 & 1) != 0)
            {
              v27 = v36;
              objc_msgSend(v36, "stringByDeletingPathExtension");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = 0;
              v29 = v33;
              v31[2](v31, v28, v15, objc_msgSend(v33, "longLongValue"), v35, &v40);
              v30 = v40;

              v6 = v38;
              if (v30)
              {

                objc_autoreleasePoolPop(v16);
                v10 = v37;
                goto LABEL_22;
              }
            }
            else
            {
              TSULogErrorInFunction();
              v6 = v38;
              v29 = v24;
              v27 = v36;
            }

            goto LABEL_19;
          }
          TSULogErrorInFunction();

          v19 = v25;
        }
        else
        {
          TSULogErrorInFunction();

          v19 = v22;
        }
        v6 = v38;
LABEL_19:
        v10 = v37;
LABEL_20:

        objc_autoreleasePoolPop(v16);
        ++v14;
      }
      while (v12 != v14);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
      v12 = v11;
    }
    while (v11);
  }
LABEL_22:

}

- (void)reloadEntries
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__TSPDocumentResourceCache_reloadEntries__block_invoke;
  block[3] = &unk_24D82A4D8;
  block[4] = self;
  dispatch_async(accessQueue, block);
}

uint64_t __41__TSPDocumentResourceCache_reloadEntries__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __41__TSPDocumentResourceCache_reloadEntries__block_invoke_2;
  v3[3] = &unk_24D82A4B0;
  v3[4] = v1;
  return objc_msgSend(v1, "enumerateEntriesFromCacheURLWithHandler:", v3);
}

void __41__TSPDocumentResourceCache_reloadEntries__block_invoke_2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  void *v8;
  id v9;
  id v10;
  id v11;

  v8 = *(void **)(a1 + 32);
  v9 = a5;
  v10 = a3;
  objc_msgSend(v8, "entryForDigestString:", a2);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setURL:", v10);

  objc_msgSend(v11, "setFileSize:", a4);
  objc_msgSend(v11, "setContentAccessDate:", v9);

}

- (int64_t)maxCacheSizeInBytes
{
  return self->_maxCacheSizeInBytes;
}

- (void)setMaxCacheSizeInBytes:(int64_t)a3
{
  self->_maxCacheSizeInBytes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entries, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_cacheURL, 0);
}

@end
