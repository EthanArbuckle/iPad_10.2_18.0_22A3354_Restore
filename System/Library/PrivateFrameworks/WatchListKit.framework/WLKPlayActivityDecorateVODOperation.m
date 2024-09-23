@implementation WLKPlayActivityDecorateVODOperation

+ (id)identifierForPlayActivityID:(id)a3 channelID:(id)a4 duration:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  uint64_t v14;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v7, "length") && objc_msgSend(v8, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "URLQueryAllowedCharacterSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAddingPercentEncodingWithAllowedCharacters:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@"), v8, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "integerValue") >= 1)
    {
      objc_msgSend(v9, "doubleValue");
      objc_msgSend(v12, "stringByAppendingFormat:", CFSTR(":%.0f"), v13 * 1000.0);
      v14 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v14;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (WLKPlayActivityDecorateVODOperation)initWithExternalId:(id)a3 brandId:(id)a4 hlsAssetDuration:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSString *v12;
  NSString *compoundId;
  void *v14;
  void *v15;
  void *v16;
  WLKPlayActivityDecorateVODOperation *v17;
  objc_super v19;
  _QWORD v20[3];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!v8)
    -[WLKPlayActivityDecorateVODOperation initWithExternalId:brandId:hlsAssetDuration:].cold.1();
  if (!v9)
    -[WLKPlayActivityDecorateVODOperation initWithExternalId:brandId:hlsAssetDuration:].cold.2();
  v11 = v10;
  if (!v10)
    -[WLKPlayActivityDecorateVODOperation initWithExternalId:brandId:hlsAssetDuration:].cold.3();
  objc_msgSend((id)objc_opt_class(), "identifierForPlayActivityID:channelID:duration:", v8, v9, v10);
  v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  compoundId = self->_compoundId;
  self->_compoundId = v12;

  v20[0] = CFSTR("externalId");
  v20[1] = CFSTR("brandId");
  v21[0] = v8;
  v21[1] = v9;
  v20[2] = CFSTR("hlsAssetDuration");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), objc_msgSend(v11, "integerValue"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  +[WLKURLRequestProperties requestPropertiesWithEndpoint:queryParameters:httpMethod:headers:caller:timeout:apiVersion:options:](WLKURLRequestProperties, "requestPropertiesWithEndpoint:queryParameters:httpMethod:headers:caller:timeout:apiVersion:options:", CFSTR("contents/play-metadata/vod"), v15, 0, 0, 0, 0, &unk_1E68C9848, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19.receiver = self;
  v19.super_class = (Class)WLKPlayActivityDecorateVODOperation;
  v17 = -[WLKUTSNetworkRequestOperation initWithRequestProperties:](&v19, sel_initWithRequestProperties_, v16);

  return v17;
}

- (void)processResponse
{
  void *v3;
  WLKPlayActivityMetadata *v4;
  WLKPlayActivityMetadata *v5;
  NSDictionary *v6;
  NSDictionary *metadataByIdentifier;
  NSString *compoundId;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  -[WLKUTSNetworkRequestOperation responseDictionary](self, "responseDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = -[WLKPlayActivityMetadata initWithDictionary:]([WLKPlayActivityMetadata alloc], "initWithDictionary:", v3);
    v5 = v4;
    if (self->_compoundId)
    {
      if (v4)
      {
        compoundId = self->_compoundId;
        v9[0] = v4;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &compoundId, 1);
        v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
        metadataByIdentifier = self->_metadataByIdentifier;
        self->_metadataByIdentifier = v6;

      }
      else
      {
        NSLog(CFSTR("WLKPlayActivityDecorateVODOperation: WLKPlayActivityMetadata object is nil. Cannot cache it."));
      }
    }
    else
    {
      NSLog(CFSTR("WLKPlayActivityDecorateVODOperation: CompoundId is nil. Cannot cache the metadata."));
    }

  }
}

- (NSArray)playActivityIdentifiers
{
  return self->_playActivityIdentifiers;
}

- (NSDictionary)metadataByIdentifier
{
  return self->_metadataByIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataByIdentifier, 0);
  objc_storeStrong((id *)&self->_playActivityIdentifiers, 0);
  objc_storeStrong((id *)&self->_compoundId, 0);
}

- (void)initWithExternalId:brandId:hlsAssetDuration:.cold.1()
{
  __assert_rtn("-[WLKPlayActivityDecorateVODOperation initWithExternalId:brandId:hlsAssetDuration:]", "WLKPlayActivityDecorateVODOperation.m", 52, "externalId != nil");
}

- (void)initWithExternalId:brandId:hlsAssetDuration:.cold.2()
{
  __assert_rtn("-[WLKPlayActivityDecorateVODOperation initWithExternalId:brandId:hlsAssetDuration:]", "WLKPlayActivityDecorateVODOperation.m", 53, "brandId != nil");
}

- (void)initWithExternalId:brandId:hlsAssetDuration:.cold.3()
{
  __assert_rtn("-[WLKPlayActivityDecorateVODOperation initWithExternalId:brandId:hlsAssetDuration:]", "WLKPlayActivityDecorateVODOperation.m", 54, "hlsAssetDuration != nil");
}

@end
