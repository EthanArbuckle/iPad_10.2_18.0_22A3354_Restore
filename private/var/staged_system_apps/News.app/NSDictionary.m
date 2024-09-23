@implementation NSDictionary

- (NSDate)sync_expirationDate
{
  return (NSDate *)-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("sync_expirationDate"));
}

- (NSArray)sync_sections
{
  return (NSArray *)-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("sync_sections"));
}

- (unint64_t)sync_headlineCount
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("sync_headlineCount")));
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return (unint64_t)v3;
}

- (NSString)sync_identifier
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("sync_identifier"));
}

- (NSString)sync_name
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("sync_name"));
}

- (unint64_t)sync_type
{
  void *v2;
  id v3;
  id v4;
  NSObject *v5;
  int v7;
  id v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("sync_type")));
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  if ((unint64_t)v3 >= 6)
  {
    v4 = NNSetupCompanionSyncLog();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7 = 134217984;
      v8 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Unknown type %lu", (uint8_t *)&v7, 0xCu);
    }

    return 0;
  }
  return (unint64_t)v3;
}

- (NSString)sync_title
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("sync_title"));
}

- (NSString)sync_excerpt
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("sync_excerpt"));
}

- (NSArray)sync_headlines
{
  return (NSArray *)-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("sync_headlines"));
}

- (NSString)sync_publisherName
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("sync_publisherName"));
}

- (NSString)sync_publisherIdentifier
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("sync_publisherIdentifier"));
}

- (NSString)sync_colorHexString
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("sync_colorHexString"));
}

- (NSData)sync_thumbnailImageData
{
  return (NSData *)-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("sync_thumbnailImageData"));
}

- (NSData)sync_publisherLogoImageData
{
  return (NSData *)-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("sync_publisherLogoImageData"));
}

- (NSString)sync_NewsURLString
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:](self, "objectForKeyedSubscript:", CFSTR("sync_NewsURLString"));
}

@end
