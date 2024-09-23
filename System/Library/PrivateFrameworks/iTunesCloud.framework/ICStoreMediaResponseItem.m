@implementation ICStoreMediaResponseItem

- (ICStoreMediaResponseItem)initWithItemResponseDictionary:(id)a3 urlBag:(id)a4
{
  id v7;
  id v8;
  ICStoreMediaResponseItem *v9;
  ICStoreMediaResponseItem *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICStoreMediaResponseItem;
  v9 = -[ICStoreMediaResponseItem init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_itemResponseDictionary, a3);
    objc_storeStrong((id *)&v10->_urlBag, a4);
  }

  return v10;
}

- (int64_t)storeAdamID
{
  void *v2;
  int64_t v3;

  -[NSDictionary objectForKey:](self->_itemResponseDictionary, "objectForKey:", CFSTR("songId"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSNumber())
    v3 = objc_msgSend(v2, "longLongValue");
  else
    v3 = 0;

  return v3;
}

- (NSURL)artworkURL
{
  void *v2;
  void *v3;

  -[NSDictionary objectForKey:](self->_itemResponseDictionary, "objectForKey:", CFSTR("artworkURL"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSURL *)v3;
}

- (NSURL)cancelDownloadURL
{
  void *v2;
  void *v3;

  -[NSDictionary objectForKey:](self->_itemResponseDictionary, "objectForKey:", CFSTR("cancel-download-url"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSURL *)v3;
}

- (NSString)downloadIdentifier
{
  void *v2;
  void *v3;
  NSString *v4;

  -[NSDictionary objectForKey:](self->_itemResponseDictionary, "objectForKey:", CFSTR("download-id"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (BOOL)isPurchasedRedownload
{
  void *v2;
  char v3;

  -[NSDictionary objectForKey:](self->_itemResponseDictionary, "objectForKey:", CFSTR("purchased-redownload"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSNumber())
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (ICStoreFinanceItemMetadata)metadata
{
  void *v2;
  ICStoreFinanceItemMetadata *v3;

  -[NSDictionary objectForKey:](self->_itemResponseDictionary, "objectForKey:", CFSTR("metadata"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSDictionary())
    v3 = -[ICStoreFinanceItemMetadata initWithMetadataDictionary:]([ICStoreFinanceItemMetadata alloc], "initWithMetadataDictionary:", v2);
  else
    v3 = 0;

  return v3;
}

- (NSDate)purchaseDate
{
  void *v2;
  void *v3;

  -[NSDictionary objectForKey:](self->_itemResponseDictionary, "objectForKey:", CFSTR("purchaseDate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    if (purchaseDate_sOnceToken != -1)
      dispatch_once(&purchaseDate_sOnceToken, &__block_literal_global_4073);
    objc_msgSend((id)purchaseDate_sPurchaseDateFormatter, "dateFromString:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSDate *)v3;
}

- (NSString)redownloadParameters
{
  void *v2;
  void *v3;
  NSString *v4;

  -[NSDictionary objectForKey:](self->_itemResponseDictionary, "objectForKey:", CFSTR("redownload-parameters"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (id)suzeLeaseID
{
  void *v2;

  -[NSDictionary objectForKey:](self->_itemResponseDictionary, "objectForKey:", CFSTR("lease-id"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqual:", CFSTR("null")))
  {

    v2 = 0;
  }
  return v2;
}

- (NSArray)fileAssets
{
  void *v3;
  ICStoreFileAssetInfo *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  ICStoreFileAssetInfo *v11;
  ICStoreFileAssetInfo *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  ICStoreFileAssetInfo *v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[NSDictionary objectForKey:](self->_itemResponseDictionary, "objectForKey:", CFSTR("assets"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSArray())
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v4 = v3;
    v5 = -[ICStoreFileAssetInfo countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v4);
          v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          if (_NSIsNSDictionary())
          {
            v11 = [ICStoreFileAssetInfo alloc];
            v12 = -[ICStoreFileAssetInfo initWithFileAssetResponseDictionary:](v11, "initWithFileAssetResponseDictionary:", v10, (_QWORD)v14);
            -[ICStoreFileAssetInfo setExpectedProtectionType:](v12, "setExpectedProtectionType:", 2);
            if (v12)
            {
              if (!v7)
                v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[ICStoreFileAssetInfo count](v4, "count"));
              objc_msgSend(v7, "addObject:", v12);
            }

          }
        }
        v6 = -[ICStoreFileAssetInfo countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      }
      while (v6);
    }
    else
    {
      v7 = 0;
    }
  }
  else
  {
    v4 = -[ICStoreFileAssetInfo initWithFileAssetResponseDictionary:]([ICStoreFileAssetInfo alloc], "initWithFileAssetResponseDictionary:", self->_itemResponseDictionary);
    -[ICStoreFileAssetInfo assetURL](v4, "assetURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v18 = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return (NSArray *)v7;
}

- (ICStoreHLSAssetInfo)hlsAsset
{
  ICStoreHLSAssetInfo *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSDictionary *itemResponseDictionary;
  int v25;
  ICStoreMediaResponseItem *v26;
  __int16 v27;
  NSDictionary *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = -[ICStoreHLSAssetInfo initWithItemResponseDictionary:]([ICStoreHLSAssetInfo alloc], "initWithItemResponseDictionary:", self->_itemResponseDictionary);
  -[ICStoreHLSAssetInfo keyServerURL](v3, "keyServerURL");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4
    || (v5 = (void *)v4,
        -[ICStoreHLSAssetInfo keyCertificateURL](v3, "keyCertificateURL"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        !v6))
  {
    -[ICStoreHLSAssetInfo keyServerProtocolType](v3, "keyServerProtocolType");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7 == CFSTR("simplified"))
      v9 = 1;
    else
      v9 = -[__CFString isEqual:](v7, "isEqual:", CFSTR("simplified"));

    -[ICURLBag enhancedAudioConfiguration](self->_urlBag, "enhancedAudioConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICStoreHLSAssetInfo keyServerURL](v3, "keyServerURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      if (v9 && (objc_msgSend(v10, "keyServerURL"), (v12 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v13 = (void *)v12;
        objc_msgSend(v10, "keyServerURL");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        -[ICURLBag urlForBagKey:](self->_urlBag, "urlForBagKey:", CFSTR("fps-request"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[ICStoreHLSAssetInfo setKeyServerURL:](v3, "setKeyServerURL:", v14);

    }
    -[ICStoreHLSAssetInfo keyCertificateURL](v3, "keyCertificateURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      if (v9 && (objc_msgSend(v10, "certificateURL"), (v16 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v17 = (void *)v16;
        objc_msgSend(v10, "certificateURL");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        -[ICURLBag urlForBagKey:](self->_urlBag, "urlForBagKey:", CFSTR("fps-cert"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[ICStoreHLSAssetInfo setKeyCertificateURL:](v3, "setKeyCertificateURL:", v18);

    }
  }
  if (-[ICStoreMediaResponseItem storeAdamID](self, "storeAdamID"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[ICStoreMediaResponseItem storeAdamID](self, "storeAdamID"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICStoreHLSAssetInfo setKeyServerAdamID:](v3, "setKeyServerAdamID:", v19);

  }
  else
  {
    -[ICStoreHLSAssetInfo keyServerURL](v3, "keyServerURL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {

    }
    else
    {
      -[ICStoreHLSAssetInfo keyCertificateURL](v3, "keyCertificateURL");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v21)
        return v3;
    }
    v22 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      itemResponseDictionary = self->_itemResponseDictionary;
      v25 = 138543618;
      v26 = self;
      v27 = 2114;
      v28 = itemResponseDictionary;
      _os_log_impl(&dword_1A03E3000, v22, OS_LOG_TYPE_ERROR, "%{public}@ Payload contains HLS asset without an adam ID, which is unexpected: %{public}@", (uint8_t *)&v25, 0x16u);
    }

  }
  return v3;
}

- (id)downloadableAsset
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[ICStoreMediaResponseItem fileAssets](self, "fileAssets", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v6, "assetURL");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
        {
          v3 = v6;
          goto LABEL_11;
        }
      }
      v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)downloadableAssetMatchingFlavorType:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[ICStoreMediaResponseItem fileAssets](self, "fileAssets", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v9, "flavorType") == a3)
        {
          objc_msgSend(v9, "assetURL");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10)
          {
            v11 = v9;
            goto LABEL_12;
          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_12:

  return v11;
}

- (NSDate)assetExpirationDate
{
  return self->_assetExpirationDate;
}

- (void)setAssetExpirationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetExpirationDate, 0);
  objc_storeStrong((id *)&self->_urlBag, 0);
  objc_storeStrong((id *)&self->_itemResponseDictionary, 0);
}

void __40__ICStoreMediaResponseItem_purchaseDate__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)purchaseDate_sPurchaseDateFormatter;
  purchaseDate_sPurchaseDateFormatter = (uint64_t)v0;

  objc_msgSend((id)purchaseDate_sPurchaseDateFormatter, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ss'Z'"));
  v2 = (void *)purchaseDate_sPurchaseDateFormatter;
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

  objc_msgSend((id)purchaseDate_sPurchaseDateFormatter, "setLenient:", 1);
  v4 = (void *)purchaseDate_sPurchaseDateFormatter;
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimeZone:", v5);

}

@end
