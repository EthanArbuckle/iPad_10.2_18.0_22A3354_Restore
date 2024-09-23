@implementation ICRadioStationTrack

- (ICRadioStationTrack)initWithResponseDictionary:(id)a3 responseVersion:(int64_t)a4 expirationDate:(id)a5
{
  id v8;
  id v9;
  ICRadioStationTrack *v10;
  uint64_t v11;
  NSDate *expirationDate;
  uint64_t v13;
  NSDictionary *responseDictionary;
  objc_super v16;

  v8 = a3;
  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)ICRadioStationTrack;
  v10 = -[ICRadioStationTrack init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v9, "copy");
    expirationDate = v10->_expirationDate;
    v10->_expirationDate = (NSDate *)v11;

    v13 = objc_msgSend(v8, "copy");
    responseDictionary = v10->_responseDictionary;
    v10->_responseDictionary = (NSDictionary *)v13;

    v10->_responseVersion = a4;
  }

  return v10;
}

- (id)description
{
  void *v3;
  int64_t v4;
  __CFString *v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[ICRadioStationTrack trackType](self, "trackType");
  switch(v4)
  {
    case 1:
      v5 = CFSTR("Standard");
      break;
    case 4:
      v5 = CFSTR("Stream");
      break;
    case 2:
      v5 = CFSTR("AudioCliip");
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown-%ld"), v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
  }
  v6 = -[ICRadioStationTrack storeAdamID](self, "storeAdamID");
  -[ICRadioStationTrack storePlatformMetadata](self, "storePlatformMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<ICRadioStationTrack: %p type=%@ adamID=%lld name='%@'>"), self, v5, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (ICRadioStationTrack)afterPromoContentTrack
{
  void *v3;
  void *v4;
  ICRadioStationTrack *v5;

  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("promo-content"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSDictionary())
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("after"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSDictionary())
    {
      v5 = -[ICRadioStationTrack initWithResponseDictionary:responseVersion:expirationDate:]([ICRadioStationTrack alloc], "initWithResponseDictionary:responseVersion:expirationDate:", v4, self->_responseVersion, self->_expirationDate);
      objc_storeStrong((id *)&v5->_parentTrack, self);
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (ICRadioStationTrack)beforePromoContentTrack
{
  void *v3;
  void *v4;
  ICRadioStationTrack *v5;

  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("promo-content"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSDictionary())
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("before"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSDictionary())
    {
      v5 = -[ICRadioStationTrack initWithResponseDictionary:responseVersion:expirationDate:]([ICRadioStationTrack alloc], "initWithResponseDictionary:responseVersion:expirationDate:", v4, self->_responseVersion, self->_expirationDate);
      objc_storeStrong((id *)&v5->_parentTrack, self);
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSArray)fileAssets
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  ICStoreFileAssetInfo *v15;
  void *v16;
  void *v17;
  ICStoreFileAssetInfo *v18;
  id v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (-[ICRadioStationTrack trackType](self, "trackType") == 4)
    return (NSArray *)0;
  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("asset-info"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSDictionary())
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("drm-type"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSString())
    {
      if (objc_msgSend(v5, "isEqualToString:", CFSTR("subscription")))
        v6 = 3;
      else
        v6 = 4;
    }
    else
    {
      v6 = 4;
    }
    objc_msgSend(v4, "objectForKey:", CFSTR("assets"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSArray())
    {
      v20 = v4;
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v9 = v8;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v10)
      {
        v11 = v10;
        v7 = 0;
        v12 = *(_QWORD *)v22;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v22 != v12)
              objc_enumerationMutation(v9);
            v14 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
            if (_NSIsNSDictionary())
            {
              v15 = -[ICStoreFileAssetInfo initWithFileAssetResponseDictionary:]([ICStoreFileAssetInfo alloc], "initWithFileAssetResponseDictionary:", v14);
              -[ICStoreFileAssetInfo setExpectedProtectionType:](v15, "setExpectedProtectionType:", v6);
              if (v15)
              {
                if (!v7)
                  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                objc_msgSend(v7, "addObject:", v15);
              }

            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        }
        while (v11);
      }
      else
      {
        v7 = 0;
      }

      v4 = v20;
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }
  if (!objc_msgSend(v7, "count"))
  {
    -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("asset-url"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSString() && objc_msgSend(v16, "length"))
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v18 = objc_alloc_init(ICStoreFileAssetInfo);
        -[ICStoreFileAssetInfo setAssetURL:](v18, "setAssetURL:", v17);
        -[ICStoreFileAssetInfo setExpectedProtectionType:](v18, "setExpectedProtectionType:", 4);
        if (v18)
        {
          v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);

          objc_msgSend(v19, "addObject:", v18);
          v7 = v19;
        }

      }
    }

  }
  return (NSArray *)v7;
}

- (BOOL)hasStartTime
{
  void *v2;
  char v3;

  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("start-position-in-milliseconds"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  return v3 & 1;
}

- (ICStoreHLSAssetInfo)hlsAsset
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("asset-info"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSDictionary())
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("assets"));
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      while (2)
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v8);
          if (_NSIsNSDictionary())
          {
            objc_msgSend(v9, "objectForKey:", CFSTR("stream-protocol"), (_QWORD)v13);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            if (_NSIsNSString() && (objc_msgSend(v10, "isEqualToString:", CFSTR("HLS")) & 1) != 0)
            {
              -[ICRadioStationTrack _hlsAssetFromAssetDictionary:](self, "_hlsAssetFromAssetDictionary:", v9);
              v11 = (void *)objc_claimAutoreleasedReturnValue();

              goto LABEL_16;
            }

          }
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v6)
          continue;
        break;
      }
    }
    v11 = 0;
LABEL_16:

  }
  else
  {
    v11 = 0;
  }

  return (ICStoreHLSAssetInfo *)v11;
}

- (NSArray)radioStreamAssets
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  ICStoreRadioStreamAssetInfo *v11;
  ICStoreRadioStreamAssetInfo *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("asset-info"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSDictionary())
  {
    objc_msgSend(v2, "objectForKey:", CFSTR("assets"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSArray())
    {
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
      v15 = 0u;
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v5 = v3;
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v16;
        do
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v16 != v8)
              objc_enumerationMutation(v5);
            v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9);
            v11 = [ICStoreRadioStreamAssetInfo alloc];
            v12 = -[ICStoreRadioStreamAssetInfo initWithItemResponseDictionary:](v11, "initWithItemResponseDictionary:", v10, (_QWORD)v15);
            if (v12)
              objc_msgSend(v4, "addObject:", v12);

            ++v9;
          }
          while (v7 != v9);
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        }
        while (v7);
      }

      v13 = (void *)objc_msgSend(v4, "copy");
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return (NSArray *)v13;
}

- (BOOL)isSkippable
{
  void *v2;
  char v3;

  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("is-skippable"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 1;

  return v3;
}

- (int64_t)likeState
{
  void *v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  int64_t v6;

  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("like-value"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = objc_msgSend(v2, "integerValue");
    v4 = v3 >> 63;
    if (v3)
    {
      v5 = 1;
      goto LABEL_6;
    }
  }
  else
  {
    LODWORD(v4) = 0;
  }
  v5 = 0;
LABEL_6:
  if ((_DWORD)v4)
    v6 = -1;
  else
    v6 = v5;

  return v6;
}

- (double)startTime
{
  void *v2;
  double v3;
  double v4;

  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("start-position-in-milliseconds"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 0.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "doubleValue");
    v3 = v4 / 1000.0;
  }

  return v3;
}

- (int64_t)storeAdamID
{
  void *v2;
  int64_t v3;

  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("adam-id"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "longLongValue");
  else
    v3 = 0;

  return v3;
}

- (NSDictionary)serverTrackInfo
{
  void *v2;
  id v3;

  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("track-info"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSDictionary())
    v3 = v2;
  else
    v3 = 0;

  return (NSDictionary *)v3;
}

- (ICStorePlatformMetadata)storePlatformMetadata
{
  void *v3;
  id v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  ICStorePlatformMetadata *v6;
  void *v7;
  void *v8;
  id v9;
  ICStorePlatformMetadata *v10;
  _QWORD v12[4];
  id v13;
  ICRadioStationTrack *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("metadata"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSDictionary())
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__17061;
    v20 = __Block_byref_object_dispose__17062;
    v21 = 0;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __44__ICRadioStationTrack_storePlatformMetadata__block_invoke;
    v12[3] = &unk_1E438CB30;
    v15 = &v16;
    v4 = v3;
    v13 = v4;
    v14 = self;
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A1AFA8D0](v12);
    ((void (**)(_QWORD, const __CFString *, const __CFString *))v5)[2](v5, CFSTR("album-id"), CFSTR("collectionId"));
    ((void (**)(_QWORD, const __CFString *, const __CFString *))v5)[2](v5, CFSTR("is-explicit"), CFSTR("is-explicit"));
    v6 = [ICStorePlatformMetadata alloc];
    v7 = (void *)v17[5];
    -[ICRadioStationTrack expirationDate](self, "expirationDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v9 = v7;
    else
      v9 = v4;
    v10 = -[ICStorePlatformMetadata initWithMetadataDictionary:expirationDate:](v6, "initWithMetadataDictionary:expirationDate:", v9, v8);

    _Block_object_dispose(&v16, 8);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (int64_t)trackType
{
  void *v2;
  int64_t v3;

  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("type"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "integerValue");
  else
    v3 = 0;

  return v3;
}

- (id)_hlsAssetFromAssetDictionary:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  ICStoreHLSAssetInfo *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v17;
  NSObject *v18;
  NSDictionary *responseDictionary;
  int v20;
  ICRadioStationTrack *v21;
  __int16 v22;
  NSDictionary *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("stream-url"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString()
    && objc_msgSend(v5, "length")
    && (objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v5), (v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v7 = (void *)v6;
    v8 = objc_alloc_init(ICStoreHLSAssetInfo);
    -[ICStoreHLSAssetInfo setPlaylistURL:](v8, "setPlaylistURL:", v7);
    objc_msgSend(v4, "ic_stringValueForKey:", CFSTR("key-server-protocol-type"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICStoreHLSAssetInfo setKeyServerProtocolType:](v8, "setKeyServerProtocolType:", v9);
    objc_msgSend(v4, "objectForKey:", CFSTR("stream-key-cert-url"));
    v10 = objc_claimAutoreleasedReturnValue();
    if (_NSIsNSString() && objc_msgSend((id)v10, "length"))
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        -[ICStoreHLSAssetInfo setKeyCertificateURL:](v8, "setKeyCertificateURL:", v11);

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("stream-key-server-url"));
    v12 = objc_claimAutoreleasedReturnValue();
    if (_NSIsNSString() && objc_msgSend((id)v12, "length"))
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
        -[ICStoreHLSAssetInfo setKeyServerURL:](v8, "setKeyServerURL:", v13);

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("is-itunes-stream"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v15 = objc_msgSend(v14, "BOOLValue");
    else
      v15 = 1;
    -[ICStoreHLSAssetInfo setITunesStoreStream:](v8, "setITunesStoreStream:", v15);
    if (-[ICRadioStationTrack storeAdamID](self, "storeAdamID"))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", -[ICRadioStationTrack storeAdamID](self, "storeAdamID"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICStoreHLSAssetInfo setKeyServerAdamID:](v8, "setKeyServerAdamID:", v17);

    }
    else if (v10 | v12)
    {
      v18 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        responseDictionary = self->_responseDictionary;
        v20 = 138543618;
        v21 = self;
        v22 = 2114;
        v23 = responseDictionary;
        _os_log_impl(&dword_1A03E3000, v18, OS_LOG_TYPE_ERROR, "%{public}@ Payload contains HLS asset without an adam ID, which is unexpected: %{public}@", (uint8_t *)&v20, 0x16u);
      }

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (ICRadioStationTrack)parentTrack
{
  return self->_parentTrack;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentTrack, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_responseDictionary, 0);
}

void __44__ICRadioStationTrack_storePlatformMetadata__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v6 = objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "objectForKey:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forKey:", v9, v5);

}

+ (id)flattenedTracksWithTracks:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "beforePromoContentTrack", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v4, "addObject:", v11);
        objc_msgSend(v4, "addObject:", v10);
        objc_msgSend(v10, "afterPromoContentTrack");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v4, "addObject:", v12);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

@end
