@implementation ICMusicSubscriptionPlaybackResponseItem

- (ICMusicSubscriptionPlaybackResponseItem)initWithItemResponseDictionary:(id)a3 urlBag:(id)a4
{
  id v6;
  id v7;
  ICMusicSubscriptionPlaybackResponseItem *v8;
  uint64_t v9;
  NSDictionary *itemResponseDictionary;

  v6 = a3;
  v7 = a4;
  v8 = -[ICMusicSubscriptionPlaybackResponseItem init](self, "init");
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    itemResponseDictionary = v8->_itemResponseDictionary;
    v8->_itemResponseDictionary = (NSDictionary *)v9;

    objc_storeStrong((id *)&v8->_urlBag, a4);
  }

  return v8;
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
            -[ICStoreFileAssetInfo setExpectedProtectionType:](v12, "setExpectedProtectionType:", 3);
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
  ICMusicSubscriptionPlaybackResponseItem *v26;
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
  if (-[ICMusicSubscriptionPlaybackResponseItem storeAdamID](self, "storeAdamID"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[ICMusicSubscriptionPlaybackResponseItem storeAdamID](self, "storeAdamID"));
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

- (int64_t)storeAdamID
{
  void *v2;
  int64_t v3;

  -[NSDictionary objectForKey:](self->_itemResponseDictionary, "objectForKey:", CFSTR("songId"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "longLongValue");
  else
    v3 = 0;

  return v3;
}

- (id)fileAssetWithFlavorType:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[ICMusicSubscriptionPlaybackResponseItem fileAssets](self, "fileAssets", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "flavorType") == a3)
        {
          v10 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
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

@end
