@implementation ICStorePlatformOfferAsset

- (ICStorePlatformOfferAsset)initWithResponseDictionary:(id)a3
{
  id v4;
  ICStorePlatformOfferAsset *v5;
  uint64_t v6;
  NSDictionary *responseDictionary;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICStorePlatformOfferAsset;
  v5 = -[ICStorePlatformOfferAsset init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    responseDictionary = v5->_responseDictionary;
    v5->_responseDictionary = (NSDictionary *)v6;

  }
  return v5;
}

- (double)duration
{
  void *v2;
  double v3;
  double v4;

  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("duration"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 0.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "doubleValue");
    v3 = v4;
  }

  return v3;
}

- (double)previewDuration
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("preview"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSDictionary())
  {
    objc_msgSend(v2, "objectForKey:", CFSTR("duration"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  v4 = 0.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "doubleValue");
    v4 = v5;
  }

  return v4;
}

- (NSURL)previewURL
{
  void *v2;
  void *v3;
  void *v4;

  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("preview"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSDictionary())
  {
    objc_msgSend(v2, "objectForKey:", CFSTR("url"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!_NSIsNSString())
    {
      v4 = 0;
      goto LABEL_7;
    }
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

      goto LABEL_8;
    }
  }
  v4 = 0;
LABEL_8:

  return (NSURL *)v4;
}

- (int64_t)size
{
  void *v2;
  int64_t v3;

  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("size"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "longLongValue");
  else
    v3 = 0;

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseDictionary, 0);
}

@end
