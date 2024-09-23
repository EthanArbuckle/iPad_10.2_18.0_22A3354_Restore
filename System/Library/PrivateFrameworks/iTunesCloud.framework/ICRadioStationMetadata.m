@implementation ICRadioStationMetadata

- (ICRadioStationMetadata)initWithResponseDictionary:(id)a3
{
  id v4;
  ICRadioStationMetadata *v5;
  uint64_t v6;
  NSDictionary *responseDictionary;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICRadioStationMetadata;
  v5 = -[ICRadioStationMetadata init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    responseDictionary = v5->_responseDictionary;
    v5->_responseDictionary = (NSDictionary *)v6;

  }
  return v5;
}

- (BOOL)allowsSharing
{
  void *v2;
  void *v3;
  char v4;

  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("rules"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSDictionary())
  {
    objc_msgSend(v2, "objectForKey:", CFSTR("sharing-enabled"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v4 = objc_msgSend(v3, "BOOLValue");
    else
      v4 = 0;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)allowsItemLiking
{
  void *v2;
  void *v3;
  char v4;

  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("rules"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSDictionary())
  {
    objc_msgSend(v2, "objectForKey:", CFSTR("like-enabled"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v4 = objc_msgSend(v3, "BOOLValue");
    else
      v4 = 0;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (ICStoreArtworkInfo)artworkInfo
{
  void *v2;
  ICStoreArtworkInfo *v3;

  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("artwork"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = -[ICStoreArtworkInfo initWithArtworkResponseValue:]([ICStoreArtworkInfo alloc], "initWithArtworkResponseValue:", v2);
  else
    v3 = 0;

  return v3;
}

- (NSString)coreSeedName
{
  void *v2;
  id v3;

  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("core-seed-name"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
    v3 = v2;
  else
    v3 = 0;

  return (NSString *)v3;
}

- (NSString)descriptionText
{
  void *v2;
  id v3;

  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("description"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
    v3 = v2;
  else
    v3 = 0;

  return (NSString *)v3;
}

- (NSString)name
{
  void *v2;
  id v3;

  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("name"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
    v3 = v2;
  else
    v3 = 0;

  return (NSString *)v3;
}

- (NSString)stationHash
{
  void *v2;
  id v3;

  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("station-hash"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
    v3 = v2;
  else
    v3 = 0;

  return (NSString *)v3;
}

- (int64_t)stationID
{
  void *v2;
  int64_t v3;

  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("station-id"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "longLongValue");
  else
    v3 = 0;

  return v3;
}

- (NSString)stationStringID
{
  void *v2;
  id v3;

  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("radio-station-id"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
    v3 = v2;
  else
    v3 = 0;

  return (NSString *)v3;
}

- (NSString)attributionLabel
{
  void *v2;
  id v3;

  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("attribution-label"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString())
    v3 = v2;
  else
    v3 = 0;

  return (NSString *)v3;
}

- (int64_t)type
{
  return -[NSDictionary ic_intValueForKey:](self->_responseDictionary, "ic_intValueForKey:", CFSTR("station-type"));
}

- (int64_t)subtype
{
  return -[NSDictionary ic_intValueForKey:](self->_responseDictionary, "ic_intValueForKey:", CFSTR("station-subtype"));
}

- (BOOL)isSubscriptionRequired
{
  return -[NSDictionary ic_BOOLValueForKey:](self->_responseDictionary, "ic_BOOLValueForKey:", CFSTR("requires-subscription"));
}

- (ICRadioStationProviderResource)providerResource
{
  void *v2;
  ICRadioStationProviderResource *v3;

  -[NSDictionary objectForKeyedSubscript:](self->_responseDictionary, "objectForKeyedSubscript:", CFSTR("provider-resource"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = -[ICRadioStationProviderResource initWithRadioStationProviderResourceDictionary:]([ICRadioStationProviderResource alloc], "initWithRadioStationProviderResourceDictionary:", v2);
  else
    v3 = 0;

  return v3;
}

- (BOOL)containsVideo
{
  return -[NSDictionary ic_BOOLValueForKey:](self->_responseDictionary, "ic_BOOLValueForKey:", CFSTR("contains-video"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseDictionary, 0);
}

@end
