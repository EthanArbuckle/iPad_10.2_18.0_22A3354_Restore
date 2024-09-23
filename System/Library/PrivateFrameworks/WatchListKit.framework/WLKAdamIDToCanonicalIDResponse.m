@implementation WLKAdamIDToCanonicalIDResponse

- (WLKAdamIDToCanonicalIDResponse)initWithDictionary:(id)a3
{
  id v4;
  WLKAdamIDToCanonicalIDResponse *v5;
  uint64_t v6;
  NSString *canonicalID;
  uint64_t v8;
  NSString *showID;
  uint64_t v10;
  NSString *url;
  uint64_t v12;
  NSString *type;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)WLKAdamIDToCanonicalIDResponse;
  v5 = -[WLKAdamIDToCanonicalIDResponse init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "wlk_stringForKey:", CFSTR("id"));
    v6 = objc_claimAutoreleasedReturnValue();
    canonicalID = v5->_canonicalID;
    v5->_canonicalID = (NSString *)v6;

    objc_msgSend(v4, "wlk_stringForKey:", CFSTR("showId"));
    v8 = objc_claimAutoreleasedReturnValue();
    showID = v5->_showID;
    v5->_showID = (NSString *)v8;

    objc_msgSend(v4, "wlk_stringForKey:", CFSTR("url"));
    v10 = objc_claimAutoreleasedReturnValue();
    url = v5->_url;
    v5->_url = (NSString *)v10;

    objc_msgSend(v4, "wlk_stringForKey:", CFSTR("type"));
    v12 = objc_claimAutoreleasedReturnValue();
    type = v5->_type;
    v5->_type = (NSString *)v12;

  }
  return v5;
}

- (NSString)canonicalID
{
  return self->_canonicalID;
}

- (NSString)showID
{
  return self->_showID;
}

- (NSString)url
{
  return self->_url;
}

- (NSString)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_showID, 0);
  objc_storeStrong((id *)&self->_canonicalID, 0);
}

@end
