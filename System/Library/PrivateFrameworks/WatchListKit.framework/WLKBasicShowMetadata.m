@implementation WLKBasicShowMetadata

- (WLKBasicShowMetadata)initWithDictionary:(id)a3
{
  id v4;
  WLKBasicShowMetadata *v5;
  uint64_t v6;
  NSDate *releaseDate;
  uint64_t v8;
  NSDate *finaleDate;
  void *v10;
  uint64_t v11;
  NSString *network;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WLKBasicShowMetadata;
  v5 = -[WLKBasicContentMetadata initWithDictionary:](&v14, sel_initWithDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "wlk_dateFromMillisecondsSince1970ForKey:", CFSTR("releaseDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    releaseDate = v5->_releaseDate;
    v5->_releaseDate = (NSDate *)v6;

    objc_msgSend(v4, "wlk_dateFromMillisecondsSince1970ForKey:", CFSTR("finaleDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    finaleDate = v5->_finaleDate;
    v5->_finaleDate = (NSDate *)v8;

    objc_msgSend(v4, "wlk_stringForKey:", CFSTR("network"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "copy");
    network = v5->_network;
    v5->_network = (NSString *)v11;

  }
  return v5;
}

- (WLKBasicShowMetadata)init
{
  return -[WLKBasicShowMetadata initWithDictionary:](self, "initWithDictionary:", 0);
}

- (NSDate)releaseDate
{
  return self->_releaseDate;
}

- (NSDate)finaleDate
{
  return self->_finaleDate;
}

- (NSString)network
{
  return self->_network;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_network, 0);
  objc_storeStrong((id *)&self->_finaleDate, 0);
  objc_storeStrong((id *)&self->_releaseDate, 0);
}

@end
