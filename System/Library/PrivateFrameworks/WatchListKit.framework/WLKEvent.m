@implementation WLKEvent

- (WLKEvent)initWithDictionary:(id)a3
{
  id v4;
  WLKEvent *v5;
  uint64_t v6;
  NSDictionary *dictionary;
  void *v8;
  uint64_t v9;
  NSString *canonicalID;
  void *v11;
  uint64_t v12;
  NSString *nowPlayingPassThrough;
  void *v14;
  uint64_t v15;
  NSString *url;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSDate *startDate;
  uint64_t v22;
  NSDate *endDate;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)WLKEvent;
  v5 = -[WLKEvent init](&v25, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    dictionary = v5->_dictionary;
    v5->_dictionary = (NSDictionary *)v6;

    objc_msgSend(v4, "wlk_stringForKey:", CFSTR("canonicalId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    canonicalID = v5->_canonicalID;
    v5->_canonicalID = (NSString *)v9;

    objc_msgSend(v4, "wlk_stringForKey:", CFSTR("nowPlayingPassThrough"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    nowPlayingPassThrough = v5->_nowPlayingPassThrough;
    v5->_nowPlayingPassThrough = (NSString *)v12;

    objc_msgSend(v4, "wlk_stringForKey:", CFSTR("url"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "copy");
    url = v5->_url;
    v5->_url = (NSString *)v15;

    objc_msgSend(v4, "objectForKey:", CFSTR("type"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_contentType = +[WLKBasicContentMetadata contentTypeForString:](WLKBasicContentMetadata, "contentTypeForString:", v17);
    objc_msgSend(v4, "wlk_dictionaryForKey:", CFSTR("eventTime"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "wlk_dictionaryForKey:", CFSTR("tuneInTime"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "wlk_dateFromMillisecondsSince1970ForKey:", CFSTR("startTime"));
    v20 = objc_claimAutoreleasedReturnValue();
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v20;

    objc_msgSend(v19, "wlk_dateFromMillisecondsSince1970ForKey:", CFSTR("endTime"));
    v22 = objc_claimAutoreleasedReturnValue();
    endDate = v5->_endDate;
    v5->_endDate = (NSDate *)v22;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WLKEvent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  WLKEvent *v6;

  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) != 0)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_WLKEventCoderKeyJSONDictionary"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[WLKEvent initWithDictionary:](self, "initWithDictionary:", v5);

    v6 = self;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The coder must allow keyed coding."));
    v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The coder must allow keyed coding."));
  objc_msgSend(v4, "encodeObject:forKey:", self->_dictionary, CFSTR("_WLKEventCoderKeyJSONDictionary"));

}

- (NSString)canonicalID
{
  return self->_canonicalID;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSString)url
{
  return self->_url;
}

- (NSString)nowPlayingPassThrough
{
  return self->_nowPlayingPassThrough;
}

- (unint64_t)contentType
{
  return self->_contentType;
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_storeStrong((id *)&self->_nowPlayingPassThrough, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_canonicalID, 0);
}

@end
