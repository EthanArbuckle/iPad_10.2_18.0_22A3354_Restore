@implementation WCRBloomFilter

- (WCRBloomFilter)init
{
  WCRBloomFilter *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *reloadAssetQueue;
  WCRAutoAssetClient *v5;
  id v6;
  WCRAutoAssetClient *autoAsset;
  uint64_t v8;
  WCRAutoAssetClient *v9;
  void *v10;
  NSObject *v11;
  _QWORD block[4];
  WCRBloomFilter *v14;
  _QWORD v15[4];
  WCRBloomFilter *v16;
  id v17;
  id location;
  id v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)WCRBloomFilter;
  v2 = -[WCRBloomFilter init](&v20, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create((const char *)objc_msgSend(CFSTR("com.apple.WebContentRestrictions.reloadAssetsQueue"), "UTF8String"), 0);
    reloadAssetQueue = v2->_reloadAssetQueue;
    v2->_reloadAssetQueue = (OS_dispatch_queue *)v3;

    v2->_useCipherML = 1;
    v19 = 0;
    v5 = -[WCRAutoAssetClient initWithError:]([WCRAutoAssetClient alloc], "initWithError:", &v19);
    v6 = v19;
    autoAsset = v2->_autoAsset;
    v2->_autoAsset = v5;

    v8 = MEMORY[0x24BDAC760];
    if (v2->_autoAsset)
    {
      objc_initWeak(&location, v2);
      v9 = v2->_autoAsset;
      v15[0] = v8;
      v15[1] = 3221225472;
      v15[2] = __22__WCRBloomFilter_init__block_invoke;
      v15[3] = &unk_251BCBF40;
      v16 = v2;
      objc_copyWeak(&v17, &location);
      -[WCRAutoAssetClient registerForAssetChangedNotificationsWithBlock:](v9, "registerForAssetChangedNotificationsWithBlock:", v15);
      objc_destroyWeak(&v17);

      objc_destroyWeak(&location);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error initializing WCRAutoAssetClient: %@"), v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[WCRLogging log:withType:](WCRLogging, "log:withType:", v10, 1);

    }
    -[WCRBloomFilter reloadAssetQueue](v2, "reloadAssetQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = v8;
    block[1] = 3221225472;
    block[2] = __22__WCRBloomFilter_init__block_invoke_3;
    block[3] = &unk_251BCBF68;
    v14 = v2;
    dispatch_sync(v11, block);

    if (v2->_useCipherML)
      +[WCRCipherMLClient activateCipherML](WCRCipherMLClient, "activateCipherML");

  }
  return v2;
}

void __22__WCRBloomFilter_init__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "reloadAssetQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __22__WCRBloomFilter_init__block_invoke_2;
  block[3] = &unk_251BCBF18;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  dispatch_sync(v2, block);

  objc_destroyWeak(&v4);
}

void __22__WCRBloomFilter_init__block_invoke_2(id *a1)
{
  void *v2;
  id WeakRetained;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("--- Received Download Notification ---"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[WCRLogging log:withType:](WCRLogging, "log:withType:", v2, 0);

  a1 += 4;
  WeakRetained = objc_loadWeakRetained(a1);
  objc_msgSend(WeakRetained, "autoAsset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopUsingLocalAsset");

  v5 = objc_loadWeakRetained(a1);
  objc_msgSend(v5, "_loadAssets");

}

uint64_t __22__WCRBloomFilter_init__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadAssets");
}

- (id)initFromFile:(id)a3
{
  id v5;
  WCRBloomFilter *v6;
  WCRBloomFilter *v7;
  _TtC22WebContentRestrictions15BloomFilterShim *v8;
  _TtC22WebContentRestrictions15BloomFilterShim *bloomFilter;
  void *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WCRBloomFilter;
  v6 = -[WCRBloomFilter init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_localPath, a3);
    v8 = -[BloomFilterShim initWithPath:]([_TtC22WebContentRestrictions15BloomFilterShim alloc], "initWithPath:", v7->_localPath);
    bloomFilter = v7->_bloomFilter;
    v7->_bloomFilter = v8;

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Initializing bloom filter from file %@"), v7->_localPath);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[WCRLogging log:withType:](WCRLogging, "log:withType:", v10, 0);

  }
  return v7;
}

- (void)_loadAssets
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[WCRBloomFilter autoAsset](self, "autoAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[WCRBloomFilter _loadMobileAssets](self, "_loadMobileAssets");
  -[WCRBloomFilter _loadFallbackAssets](self, "_loadFallbackAssets");
  v4 = (void *)objc_opt_class();
  -[WCRBloomFilter localPath](self, "localPath");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByDeletingPathExtension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WCRBloomFilter appleAllowList](self, "appleAllowList");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastPathComponent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByDeletingPathExtension");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reportAnalyticsBloomFilterVersion:withAppleAllowListVersion:", v6, v10);

}

- (void)_loadFallbackAssets
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _TtC22WebContentRestrictions15BloomFilterShim *v9;
  void *v10;
  _TtC22WebContentRestrictions15BloomFilterShim *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;

  -[WCRBloomFilter bloomFilter](self, "bloomFilter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Could not find a bloom filter from MobileAsset. Using local copy %@ instead"), CFSTR("WCRFilter-2024-05-15.plist"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[WCRLogging log:withType:](WCRLogging, "log:withType:", v4, 1);

    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/WebContentRestrictions.framework"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("WCRFilter-2024-05-15.plist"), "stringByDeletingPathExtension");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("WCRFilter-2024-05-15.plist"), "pathExtension");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pathForResource:ofType:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[WCRBloomFilter setLocalPath:](self, "setLocalPath:", v8);
    v9 = [_TtC22WebContentRestrictions15BloomFilterShim alloc];
    -[WCRBloomFilter localPath](self, "localPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[BloomFilterShim initWithPath:](v9, "initWithPath:", v10);
    -[WCRBloomFilter setBloomFilter:](self, "setBloomFilter:", v11);

    -[WCRBloomFilter bloomFilter](self, "bloomFilter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = (void *)MEMORY[0x24BDD17C8];
      -[WCRBloomFilter localPath](self, "localPath");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("Initialized bloom filter at path %@"), v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[WCRLogging log:withType:](WCRLogging, "log:withType:", v15, 0);

    }
  }
  -[WCRBloomFilter appleAllowList](self, "appleAllowList");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Could not find an Apple allow list filter from MobileAsset. Using local copy %@ instead"), CFSTR("WCRAppleAllowList-2024-05-15.plist"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[WCRLogging log:withType:](WCRLogging, "log:withType:", v17, 1);

    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/WebContentRestrictions.framework"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("WCRAppleAllowList-2024-05-15.plist"), "stringByDeletingPathExtension");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("WCRAppleAllowList-2024-05-15.plist"), "pathExtension");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "pathForResource:ofType:", v19, v20);
    v24 = (id)objc_claimAutoreleasedReturnValue();

    v21 = -[WCRAppleAllowList initFromFile:]([WCRAppleAllowList alloc], "initFromFile:", v24);
    -[WCRBloomFilter setAppleAllowList:](self, "setAppleAllowList:", v21);

    -[WCRBloomFilter appleAllowList](self, "appleAllowList");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Initialized Apple allow list at path %@"), v24);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      +[WCRLogging log:withType:](WCRLogging, "log:withType:", v23, 0);

    }
  }
}

- (void)_loadMobileAssets
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _TtC22WebContentRestrictions15BloomFilterShim *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  -[WCRBloomFilter autoAsset](self, "autoAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startUsingLocalAsset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v24, "fileExistsAtPath:", v4) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Will use MobileAsset bundle path: %@"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[WCRLogging log:withType:](WCRLogging, "log:withType:", v5, 2);

    objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("Bloom Filters"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "contentsOfDirectoryAtPath:error:", v6, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Content of bloom filters dir: %@"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[WCRLogging log:withType:](WCRLogging, "log:withType:", v8, 2);

    v23 = (void *)v7;
    objc_msgSend((id)objc_opt_class(), "_nameOfNewestFile:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingPathComponent:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Loading bloom filter from MobileAsset bundle: %@"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[WCRLogging log:withType:](WCRLogging, "log:withType:", v11, 2);

    -[WCRBloomFilter setLocalPath:](self, "setLocalPath:", v10);
    v12 = -[BloomFilterShim initWithPath:]([_TtC22WebContentRestrictions15BloomFilterShim alloc], "initWithPath:", v10);
    -[WCRBloomFilter setBloomFilter:](self, "setBloomFilter:", v12);

    -[WCRBloomFilter bloomFilter](self, "bloomFilter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Initialized bloom filter at path %@"), v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[WCRLogging log:withType:](WCRLogging, "log:withType:", v14, 0);

    }
    objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("Apple Allow Lists"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "contentsOfDirectoryAtPath:error:", v15, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_nameOfNewestFile:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringByAppendingPathComponent:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Loading Apple allow list from MobileAsset bundle: %@"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[WCRLogging log:withType:](WCRLogging, "log:withType:", v19, 2);

    v20 = -[WCRAppleAllowList initFromFile:]([WCRAppleAllowList alloc], "initFromFile:", v18);
    -[WCRBloomFilter setAppleAllowList:](self, "setAppleAllowList:", v20);

    -[WCRBloomFilter appleAllowList](self, "appleAllowList");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Initialized Apple allow list at path %@"), v18);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[WCRLogging log:withType:](WCRLogging, "log:withType:", v22, 0);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("MobileAsset bundle doesn't exist at path: %@"), v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[WCRLogging log:withType:](WCRLogging, "log:withType:", v6, 1);
  }

}

+ (id)_nameOfNewestFile:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __36__WCRBloomFilter__nameOfNewestFile___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (BOOL)shouldBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[WCRBloomFilter bloomFilter](self, "bloomFilter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v5, "_shouldBlock:withBloomFilter:useCipherML:", v4, v6, -[WCRBloomFilter useCipherML](self, "useCipherML"));

  return (char)self;
}

+ (BOOL)_shouldBlock:(id)a3 withBloomFilter:(id)a4 useCipherML:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  __CFString *v16;
  void *v17;
  BOOL v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  _BOOL4 v29;
  id v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v5 = a5;
  v38 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v31 = a4;
  objc_msgSend((id)objc_opt_class(), "_matchingStringsForURL:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v10 = v8;
    v11 = (id)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v11)
    {
      v29 = v5;
      v30 = v7;
      v12 = *(_QWORD *)v34;
LABEL_4:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v34 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v13);
        v15 = objc_msgSend(v31, "contains:", v14);
        v16 = v15 ? CFSTR("Blocked") : CFSTR("Allowed");
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ -> %@"), v14, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        +[WCRLogging log:withType:](WCRLogging, "log:withType:", v17, 5);

        if ((v15 & 1) != 0)
          break;
        if (v11 == (id)++v13)
        {
          v11 = (id)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
          if (v11)
            goto LABEL_4;
          v18 = 0;
          v7 = v30;
          goto LABEL_31;
        }
      }
      v11 = v14;
      objc_msgSend((id)objc_opt_class(), "reportAnalyticsBloomFilterBlocked");

      if (!v29)
      {
        v18 = 1;
        v7 = v30;
        goto LABEL_32;
      }
      v32 = 0;
      +[WCRCipherMLClient categoryForString:withError:](WCRCipherMLClient, "categoryForString:withError:", v11, &v32);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v32;
      v10 = v20;
      v21 = (void *)MEMORY[0x24BDD17C8];
      if (v19 || !v20)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("CipherML response: %@"), v19);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        +[WCRLogging log:withType:](WCRLogging, "log:withType:", v27, 0);

        if (objc_msgSend(v19, "integerValue") != 301)
        {
          v7 = v30;
          v18 = objc_msgSend(v19, "integerValue") == 303
             || objc_msgSend(v19, "integerValue") == 1505
             || objc_msgSend(v19, "integerValue") == 501;
          goto LABEL_30;
        }
        v18 = 1;
      }
      else
      {
        objc_msgSend(v20, "description");
        v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v21, "stringWithFormat:", CFSTR("CipherML error: %s. Falling back to local filter verdict."), objc_msgSend(v22, "UTF8String"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 1;
        +[WCRLogging log:withType:](WCRLogging, "log:withType:", v23, 1);

      }
      v7 = v30;
LABEL_30:

      goto LABEL_31;
    }
    v18 = 0;
LABEL_31:

LABEL_32:
  }
  else
  {
    objc_msgSend(v7, "scheme");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = CFSTR("Unknown format");
    if (!v24)
      v25 = CFSTR("Missing a scheme (e.g. https://)");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unable to parse URL: %@"), v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[WCRLogging log:withType:](WCRLogging, "log:withType:", v26, 1);

    v18 = 0;
  }

  return v18;
}

+ (id)_matchingStringsForDomain:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  if (a3)
  {
    objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("."));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v3, "count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "count"))
    {
      v5 = 0;
      v6 = 0;
      do
      {
        objc_msgSend(v3, "subarrayWithRange:", v6, objc_msgSend(v3, "count") + v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "componentsJoinedByString:", CFSTR("."));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v8);

        ++v6;
        --v5;
      }
      while (objc_msgSend(v3, "count") > v6);
    }
    v9 = (void *)objc_msgSend(v4, "copy");

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

+ (id)_matchingStringsForURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v48;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = (void *)MEMORY[0x24BDBCEF0];
    objc_msgSend(v3, "pathComponents");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithCapacity:", objc_msgSend(v6, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "host");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = (void *)objc_opt_class();
      objc_msgSend(v4, "host");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_matchingStringsForDomain:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "allObjects");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObjectsFromArray:", v12);

      objc_msgSend(v4, "host");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "hasPrefix:", CFSTR("www."));
      objc_msgSend(v4, "host");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v14)
      {
        objc_msgSend(v15, "stringByReplacingOccurrencesOfString:withString:", CFSTR("www."), &stru_251BCC5E8);
        v17 = objc_claimAutoreleasedReturnValue();

        v16 = (void *)v17;
      }

      if (v16)
      {
        v49 = v11;
        objc_msgSend(v7, "addObject:", v16);
        v48 = v16;
        v18 = v16;
        objc_msgSend(v4, "host");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = 0u;
        v51 = 0u;
        v52 = 0u;
        v53 = 0u;
        objc_msgSend(v4, "pathComponents");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v51;
          do
          {
            v24 = 0;
            v25 = v18;
            v26 = v19;
            do
            {
              if (*(_QWORD *)v51 != v23)
                objc_enumerationMutation(v20);
              v27 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * v24);
              objc_msgSend(v25, "stringByAppendingPathComponent:", v27);
              v18 = (id)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v26, "stringByAppendingPathComponent:", v27);
              v19 = (void *)objc_claimAutoreleasedReturnValue();

              v28 = (void *)objc_msgSend(v18, "copy");
              objc_msgSend(v7, "addObject:", v28);

              v29 = (void *)objc_msgSend(v19, "copy");
              objc_msgSend(v7, "addObject:", v29);

              ++v24;
              v25 = v18;
              v26 = v19;
            }
            while (v22 != v24);
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
          }
          while (v22);
        }

        objc_msgSend(v4, "query");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (v30)
        {
          v31 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v4, "query");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "stringWithFormat:", CFSTR("?%@"), v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v18, "stringByAppendingString:", v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v19, "stringByAppendingString:", v33);
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          v36 = (void *)objc_msgSend(v34, "copy");
          objc_msgSend(v7, "addObject:", v36);

          v37 = (void *)objc_msgSend(v35, "copy");
          objc_msgSend(v7, "addObject:", v37);

          v18 = v34;
          v19 = v35;
        }
        objc_msgSend(v4, "fragment");
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = v48;
        if (v38)
        {
          v39 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v4, "fragment");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "stringWithFormat:", CFSTR("#%@"), v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v18, "stringByAppendingString:", v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v19, "stringByAppendingString:", v41);
          v43 = (void *)objc_claimAutoreleasedReturnValue();

          v44 = (void *)objc_msgSend(v42, "copy");
          objc_msgSend(v7, "addObject:", v44);

          v45 = (void *)objc_msgSend(v43, "copy");
          objc_msgSend(v7, "addObject:", v45);

          v18 = v42;
          v19 = v43;
        }
        v11 = v49;
        v46 = (void *)objc_msgSend(v7, "copy");

      }
      else
      {
        v46 = 0;
      }

    }
    else
    {
      v46 = 0;
    }

  }
  else
  {
    v46 = 0;
  }

  return v46;
}

+ (void)reportAnalyticsBloomFilterVersion:(id)a3 withAppleAllowListVersion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5 && v6)
  {
    v9 = v5;
    v10 = v7;
    AnalyticsSendEventLazy();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Analytics: Filter versions were nil!"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[WCRLogging log:withType:](WCRLogging, "log:withType:", v8, 1);

  }
}

id __78__WCRBloomFilter_reportAnalyticsBloomFilterVersion_withAppleAllowListVersion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[2];
  _QWORD v4[3];

  v4[2] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("bloom_filter_version");
  v3[1] = CFSTR("apple_allowlist_version");
  v1 = *(_QWORD *)(a1 + 40);
  v4[0] = *(_QWORD *)(a1 + 32);
  v4[1] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)reportAnalyticsBloomFilterBlocked
{
  AnalyticsSendEventLazy();
}

id __51__WCRBloomFilter_reportAnalyticsBloomFilterBlocked__block_invoke()
{
  const __CFString *v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x24BDAC8D0];
  v1 = CFSTR("bloom_filter_verdict");
  v2[0] = CFSTR("Blocked");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v2, &v1, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)localPath
{
  return self->_localPath;
}

- (void)setLocalPath:(id)a3
{
  objc_storeStrong((id *)&self->_localPath, a3);
}

- (WCRAppleAllowList)appleAllowList
{
  return (WCRAppleAllowList *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAppleAllowList:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (BOOL)useCipherML
{
  return self->_useCipherML;
}

- (void)setUseCipherML:(BOOL)a3
{
  self->_useCipherML = a3;
}

- (WCRAutoAssetClient)autoAsset
{
  return self->_autoAsset;
}

- (void)setAutoAsset:(id)a3
{
  objc_storeStrong((id *)&self->_autoAsset, a3);
}

- (_TtC22WebContentRestrictions15BloomFilterShim)bloomFilter
{
  return (_TtC22WebContentRestrictions15BloomFilterShim *)objc_getProperty(self, a2, 40, 1);
}

- (void)setBloomFilter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (OS_dispatch_queue)reloadAssetQueue
{
  return self->_reloadAssetQueue;
}

- (void)setReloadAssetQueue:(id)a3
{
  objc_storeStrong((id *)&self->_reloadAssetQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reloadAssetQueue, 0);
  objc_storeStrong((id *)&self->_bloomFilter, 0);
  objc_storeStrong((id *)&self->_autoAsset, 0);
  objc_storeStrong((id *)&self->_appleAllowList, 0);
  objc_storeStrong((id *)&self->_localPath, 0);
}

@end
