@implementation ADFrequencyCap

- (ADFrequencyCap)initWithIdentifier:(id)a3
{
  id v4;
  ADFrequencyCap *v5;
  ADFrequencyCap *v6;
  void *v7;
  uint64_t v8;
  NSString *identifier;
  uint64_t v10;
  NSString *adMetadata;
  void *v12;
  double v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ADFrequencyCap;
  v5 = -[ADFrequencyCap init](&v15, "init");
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ADFrequencyCap splitCapData:](v5, "splitCapData:", v4));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ADIdentifierKey")));
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v8;

    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("ADAdMetadataKey")));
    adMetadata = v6->_adMetadata;
    v6->_adMetadata = (NSString *)v10;

    v6->_downloadType = 0;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v12, "timeIntervalSince1970");
    v6->_timestamp = v13;

  }
  return v6;
}

- (ADFrequencyCap)initWithDictionary:(id)a3
{
  id v4;
  ADFrequencyCap *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *adMetadata;
  void *v10;
  void *v11;
  double v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ADFrequencyCap;
  v5 = -[ADFrequencyCap init](&v14, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ADIdentifierKey")));
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ADAdMetadataKey")));
    adMetadata = v5->_adMetadata;
    v5->_adMetadata = (NSString *)v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ADDownloadTypeKey")));
    v5->_downloadType = (int)objc_msgSend(v10, "intValue");

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ADSetTimeKey")));
    objc_msgSend(v11, "doubleValue");
    v5->_timestamp = v12;

  }
  return v5;
}

- (id)splitCapData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  unint64_t i;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("|")));
  v6 = objc_msgSend(v5, "count");
  if (v6)
  {
    v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", 0));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("ADIdentifierKey"));

    if (v7 != (id)1)
    {
      v9 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
      for (i = 1; (id)i != v7; ++i)
      {
        if (i >= 2)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingString:", CFSTR("|")));
          v12 = objc_msgSend(v11, "mutableCopy");

          v9 = v12;
        }
        v13 = v9;
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", i));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingString:", v14));
        v9 = objc_msgSend(v15, "mutableCopy");

      }
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("ADAdMetadataKey"));

    }
  }
  v16 = objc_msgSend(v4, "copy");

  return v16;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *adMetadata;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_identifier, CFSTR("ADIdentifierKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_timestamp));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("ADSetTimeKey"));

  adMetadata = self->_adMetadata;
  if (adMetadata)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", adMetadata, CFSTR("ADAdMetadataKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", LODWORD(self->_downloadType)));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("ADDownloadTypeKey"));

  return v3;
}

- (id)description
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ADFrequencyCap dictionaryRepresentation](self, "dictionaryRepresentation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v2));

  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)adMetadata
{
  return self->_adMetadata;
}

- (void)setAdMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_adMetadata, a3);
}

- (int64_t)downloadType
{
  return self->_downloadType;
}

- (void)setDownloadType:(int64_t)a3
{
  self->_downloadType = a3;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adMetadata, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
