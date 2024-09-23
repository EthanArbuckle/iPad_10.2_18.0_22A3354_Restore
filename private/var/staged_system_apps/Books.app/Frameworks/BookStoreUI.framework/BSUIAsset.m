@implementation BSUIAsset

- (BSUIAsset)initWithDictionary:(id)a3
{
  id v4;
  BSUIAsset *v5;
  NSDictionary *v6;
  NSDictionary *assetDictionary;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BSUIAsset;
  v5 = -[BSUIAsset init](&v9, "init");
  if (v5)
  {
    v6 = (NSDictionary *)objc_msgSend(v4, "copy");
    assetDictionary = v5->_assetDictionary;
    v5->_assetDictionary = v6;

  }
  return v5;
}

- (NSString)assetID
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v3 = objc_opt_class(NSString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIAsset assetDictionary](self, "assetDictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assetID")));
  v6 = BUDynamicCast(v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (v7)
    v9 = v7;
  else
    v9 = (id)objc_claimAutoreleasedReturnValue(-[BSUIAsset storeID](self, "storeID"));
  v10 = v9;

  return (NSString *)v10;
}

- (NSString)storeID
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = objc_opt_class(NSString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIAsset assetDictionary](self, "assetDictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("storeId")));
  v6 = BUDynamicCast(v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return (NSString *)v7;
}

- (NSString)seriesID
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = objc_opt_class(NSString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIAsset assetDictionary](self, "assetDictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("seriesId")));
  v6 = BUDynamicCast(v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return (NSString *)v7;
}

- (NSString)title
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = objc_opt_class(NSString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIAsset assetDictionary](self, "assetDictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("title")));
  v6 = BUDynamicCast(v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return (NSString *)v7;
}

- (NSString)author
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = objc_opt_class(NSString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIAsset assetDictionary](self, "assetDictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("author")));
  v6 = BUDynamicCast(v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return (NSString *)v7;
}

- (NSDictionary)offer
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = objc_opt_class(NSDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIAsset assetDictionary](self, "assetDictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("offer")));
  v6 = BUDynamicCast(v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return (NSDictionary *)v7;
}

- (NSString)formattedPrice
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = objc_opt_class(NSString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIAsset offer](self, "offer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("priceFormatted")));
  v6 = BUDynamicCast(v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return (NSString *)v7;
}

- (NSString)buyParameters
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = objc_opt_class(NSString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIAsset offer](self, "offer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("buyParameters")));
  v6 = BUDynamicCast(v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return (NSString *)v7;
}

- (NSNumber)isExplicit
{
  return (NSNumber *)&__kCFBooleanFalse;
}

- (NSString)sampleURL
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIAsset assetDictionary](self, "assetDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("downloadSampleURL")));

  v4 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    v5 = v3;
  }
  else
  {
    v6 = objc_opt_class(NSURL);
    if ((objc_opt_isKindOfClass(v3, v6) & 1) != 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "standardizedURL"));
      v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "absoluteString"));

    }
    else
    {
      v5 = 0;
    }
  }

  return (NSString *)v5;
}

- (NSString)storeURL
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIAsset assetDictionary](self, "assetDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("storeURL")));

  v4 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    v5 = v3;
  }
  else
  {
    v6 = objc_opt_class(NSURL);
    if ((objc_opt_isKindOfClass(v3, v6) & 1) != 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "standardizedURL"));
      v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "absoluteString"));

    }
    else
    {
      v5 = 0;
    }
  }

  return (NSString *)v5;
}

- (NSNumber)readingProgress
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = objc_opt_class(NSNumber);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIAsset assetDictionary](self, "assetDictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("readingProgress")));
  v6 = BUDynamicCast(v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return (NSNumber *)v7;
}

- (NSString)formattedReadingProgress
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIAsset readingProgress](self, "readingProgress"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString bc_formattedReadingProgress:isFinished:](NSString, "bc_formattedReadingProgress:isFinished:", v3, -[BSUIAsset isFinished](self, "isFinished")));

  return (NSString *)v4;
}

- (NSNumber)contentType
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = objc_opt_class(NSNumber);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIAsset assetDictionary](self, "assetDictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contentType")));
  v6 = BUDynamicCast(v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return (NSNumber *)v7;
}

- (BOOL)isFinished
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unsigned __int8 v8;

  v3 = objc_opt_class(NSNumber);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIAsset assetDictionary](self, "assetDictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isFinished")));
  v6 = BUDynamicCast(v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = objc_msgSend(v7, "BOOLValue");

  return v8;
}

- (BOOL)isNew
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;
  float v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIAsset readingProgress](self, "readingProgress"));
  v4 = objc_opt_class(NSNumber);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIAsset assetDictionary](self, "assetDictionary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isNew")));
  v7 = BUDynamicCast(v4, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if ((objc_msgSend(v8, "BOOLValue") & 1) != 0)
  {
    v9 = 1;
  }
  else
  {
    objc_msgSend(v3, "floatValue");
    v9 = v10 == 0.0;
  }

  return v9;
}

- (BOOL)isSample
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unsigned __int8 v8;

  v3 = objc_opt_class(NSNumber);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIAsset assetDictionary](self, "assetDictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSample")));
  v6 = BUDynamicCast(v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = objc_msgSend(v7, "BOOLValue");

  return v8;
}

- (BOOL)isNonLocalSample
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unsigned __int8 v8;

  v3 = objc_opt_class(NSNumber);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIAsset assetDictionary](self, "assetDictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isNonLocalSample")));
  v6 = BUDynamicCast(v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = objc_msgSend(v7, "BOOLValue");

  return v8;
}

- (BOOL)isMemberOfSamplesCollection
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unsigned __int8 v8;

  v3 = objc_opt_class(NSNumber);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIAsset assetDictionary](self, "assetDictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isMemberOfSamplesCollection")));
  v6 = BUDynamicCast(v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = objc_msgSend(v7, "BOOLValue");

  return v8;
}

- (BOOL)isLocal
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unsigned __int8 v8;

  v3 = objc_opt_class(NSNumber);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIAsset assetDictionary](self, "assetDictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isLocal")));
  v6 = BUDynamicCast(v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = objc_msgSend(v7, "BOOLValue");

  return v8;
}

- (BOOL)isSupplementalContent
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unsigned __int8 v8;

  v3 = objc_opt_class(NSNumber);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIAsset assetDictionary](self, "assetDictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSupplementalContent")));
  v6 = BUDynamicCast(v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = objc_msgSend(v7, "BOOLValue");

  return v8;
}

- (BOOL)hasRACSupport
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unsigned __int8 v8;

  v3 = objc_opt_class(NSNumber);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIAsset assetDictionary](self, "assetDictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasRACSupport")));
  v6 = BUDynamicCast(v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = objc_msgSend(v7, "BOOLValue");

  return v8;
}

- (NSDate)lastEngagedDate
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = objc_opt_class(NSDate);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIAsset assetDictionary](self, "assetDictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lastEngagedDate")));
  v6 = BUDynamicCast(v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return (NSDate *)v7;
}

- (NSDate)lastOpenDate
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = objc_opt_class(NSDate);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIAsset assetDictionary](self, "assetDictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lastOpenDate")));
  v6 = BUDynamicCast(v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return (NSDate *)v7;
}

- (NSDate)purchasedDate
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = objc_opt_class(NSDate);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIAsset assetDictionary](self, "assetDictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("purchasedDate")));
  v6 = BUDynamicCast(v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return (NSDate *)v7;
}

- (NSNumber)fileSize
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = objc_opt_class(NSNumber);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIAsset assetDictionary](self, "assetDictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fileSize")));
  v6 = BUDynamicCast(v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return (NSNumber *)v7;
}

- (NSString)fileURL
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIAsset assetDictionary](self, "assetDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("fileURL")));

  v4 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    v5 = v3;
  }
  else
  {
    v6 = objc_opt_class(NSURL);
    if ((objc_opt_isKindOfClass(v3, v6) & 1) != 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "standardizedURL"));
      v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "absoluteString"));

    }
    else
    {
      v5 = 0;
    }
  }

  return (NSString *)v5;
}

- (NSString)pageProgressionDirection
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = objc_opt_class(NSString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIAsset assetDictionary](self, "assetDictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pageProgressionDirection")));
  v6 = BUDynamicCast(v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return (NSString *)v7;
}

- (NSString)coverURL
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = objc_opt_class(NSString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIAsset assetDictionary](self, "assetDictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("coverURL")));
  v6 = BUDynamicCast(v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return (NSString *)v7;
}

- (NSString)cloudAssetType
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIAsset assetDictionary](self, "assetDictionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("cloudAssetType")));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIAsset assetDictionary](self, "assetDictionary"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cloudAssetType")));

  }
  else
  {
    v6 = 0;
  }
  return (NSString *)v6;
}

- (NSNumber)seriesItemCount
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = objc_opt_class(NSNumber);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIAsset assetDictionary](self, "assetDictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("seriesItemCount")));
  v6 = BUDynamicCast(v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return (NSNumber *)v7;
}

- (NSNumber)seriesContentType
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = objc_opt_class(NSNumber);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIAsset assetDictionary](self, "assetDictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("seriesContentType")));
  v6 = BUDynamicCast(v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return (NSNumber *)v7;
}

- (void)_updateAssetDictionaryReadingProgressAndIsNewOverrides
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  id v15;
  void *v16;
  id v17;

  v3 = objc_opt_class(NSString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIAsset assetDictionary](self, "assetDictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("formattedReadingProgress")));
  v6 = BUDynamicCast(v3, v5);
  v17 = (id)objc_claimAutoreleasedReturnValue(v6);

  v7 = objc_opt_class(NSNumber);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIAsset assetDictionary](self, "assetDictionary"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("isNew")));
  v10 = BUDynamicCast(v7, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIAsset formattedReadingProgress](self, "formattedReadingProgress"));
  v13 = -[BSUIAsset isNew](self, "isNew");
  if (!objc_msgSend(v17, "isEqualToString:", v12) || v13 != objc_msgSend(v11, "BOOLValue"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIAsset assetDictionary](self, "assetDictionary"));
    v15 = objc_msgSend(v14, "mutableCopy");

    objc_msgSend(v15, "setObject:forKeyedSubscript:", v12, CFSTR("formattedReadingProgress"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v13));
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, CFSTR("isNew"));

    -[BSUIAsset setAssetDictionary:](self, "setAssetDictionary:", v15);
  }

}

- (id)toDictionary
{
  -[BSUIAsset _updateAssetDictionaryReadingProgressAndIsNewOverrides](self, "_updateAssetDictionaryReadingProgressAndIsNewOverrides");
  return -[BSUIAsset assetDictionary](self, "assetDictionary");
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = sub_2D284;
  v14 = sub_2D294;
  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v15 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("<%@(%p)"), v5, self));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIAsset toDictionary](self, "toDictionary"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_2D29C;
  v9[3] = &unk_2E5208;
  v9[4] = &v10;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v9);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v11[5], "stringByAppendingString:", CFSTR(">")));
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (NSDictionary)assetDictionary
{
  return self->_assetDictionary;
}

- (void)setAssetDictionary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetDictionary, 0);
}

@end
