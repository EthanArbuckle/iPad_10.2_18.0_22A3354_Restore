@implementation ICRadioStationProviderResource

- (ICRadioStationProviderResource)initWithRadioStationProviderResourceDictionary:(id)a3
{
  id v4;
  ICRadioStationProviderResource *v5;
  void *v6;
  uint64_t v7;
  NSURL *url;
  void *v9;
  uint64_t v10;
  NSString *bundleIdentifier;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ICRadioStationProviderResource;
  v5 = -[ICRadioStationProviderResource init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("url"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    url = v5->_url;
    v5->_url = (NSURL *)v7;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bundle-id"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v10;

  }
  return v5;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
