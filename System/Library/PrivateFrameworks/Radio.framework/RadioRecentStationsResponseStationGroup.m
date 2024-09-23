@implementation RadioRecentStationsResponseStationGroup

- (RadioRecentStationsResponseStationGroup)initWithResponseDictionary:(id)a3
{
  id v4;
  RadioRecentStationsResponseStationGroup *v5;
  uint64_t v6;
  NSDictionary *responseDictionary;

  v4 = a3;
  v5 = -[RadioRecentStationsResponseStationGroup init](self, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    responseDictionary = v5->_responseDictionary;
    v5->_responseDictionary = (NSDictionary *)v6;

  }
  return v5;
}

- (BOOL)isActive
{
  void *v2;
  char v3;

  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("is-active"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (NSString)localizedTitle
{
  void *v2;
  void *v3;
  NSString *v4;

  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("title"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isNSString"))
  {
    if (objc_msgSend(v2, "length"))
      v3 = v2;
    else
      v3 = 0;
  }
  else
  {
    v3 = 0;
  }
  v4 = v3;

  return v4;
}

- (NSArray)stationDictionaries
{
  void *v2;
  void *v3;
  NSArray *v4;

  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("stations"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isNSArray"))
  {
    if (objc_msgSend(v2, "count"))
      v3 = v2;
    else
      v3 = 0;
  }
  else
  {
    v3 = 0;
  }
  v4 = v3;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseDictionary, 0);
}

@end
