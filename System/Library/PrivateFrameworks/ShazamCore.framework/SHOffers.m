@implementation SHOffers

- (SHOffers)initWithOfferResponse:(id)a3
{
  id v5;
  SHOffers *v6;
  SHOffers *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHOffers;
  v6 = -[SHOffers init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_offerResponse, a3);

  return v7;
}

- (NSString)defaultSubtitle
{
  return (NSString *)-[SHOffers subtitleForOfferNamed:bundleID:](self, "subtitleForOfferNamed:bundleID:", CFSTR("default"), &stru_24DDB28B8);
}

- (NSString)campaignSubtitle
{
  return (NSString *)-[SHOffers subtitleForOfferNamed:bundleID:](self, "subtitleForOfferNamed:bundleID:", CFSTR("campaign"), &stru_24DDB28B8);
}

- (id)defaultURLForBundleID:(id)a3
{
  id v4;
  SHTokenizedURL *v5;
  void *v6;
  SHTokenizedURL *v7;
  void *v8;

  v4 = a3;
  v5 = [SHTokenizedURL alloc];
  -[SHOffers urlForOfferNamed:bundleID:](self, "urlForOfferNamed:bundleID:", CFSTR("default"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[SHTokenizedURL initWithString:](v5, "initWithString:", v6);
  -[SHTokenizedURL URLRepresentation](v7, "URLRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)campaignURLForTrackID:(id)a3 bundleID:(id)a4 token:(id)a5
{
  id v8;
  id v9;
  id v10;
  SHTokenizedURL *v11;
  void *v12;
  SHTokenizedURL *v13;
  void *v14;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  v11 = [SHTokenizedURL alloc];
  -[SHOffers urlForOfferNamed:bundleID:](self, "urlForOfferNamed:bundleID:", CFSTR("campaign"), v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[SHTokenizedURL initWithString:](v11, "initWithString:", v12);
  if (-[SHTokenizedURL containsToken:](v13, "containsToken:", 10)
    && -[SHTokenizedURL containsToken:](v13, "containsToken:", 9))
  {
    -[SHTokenizedURL updateToken:withValue:](v13, "updateToken:withValue:", 9, v8);
    -[SHTokenizedURL updateToken:withValue:](v13, "updateToken:withValue:", 10, v9);
    -[SHTokenizedURL URLRepresentation](v13, "URLRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)urlForOfferNamed:(id)a3 bundleID:(id)a4
{
  void *v4;
  void *v5;

  -[SHOffers configForOfferNamed:bundleID:](self, "configForOfferNamed:bundleID:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("url"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)subtitleForOfferNamed:(id)a3 bundleID:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  -[SHOffers configForOfferNamed:bundleID:](self, "configForOfferNamed:bundleID:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("copy"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("subtitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)configForOfferNamed:(id)a3 bundleID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[SHOffers offerResponse](self, "offerResponse");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHOffers valueForSpecializedKey:forBundleID:inDictionary:](self, "valueForSpecializedKey:forBundleID:inDictionary:", v7, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)valueForSpecializedKey:(id)a3 forBundleID:(id)a4 inDictionary:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;

  v7 = a3;
  v8 = a5;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), v7, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", v7);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  return v13;
}

- (SHTokenizedURL)shazamURL
{
  return self->_shazamURL;
}

- (NSDictionary)offerResponse
{
  return self->_offerResponse;
}

- (SHTokenizedURL)defaultURL
{
  return self->_defaultURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultURL, 0);
  objc_storeStrong((id *)&self->_offerResponse, 0);
  objc_storeStrong((id *)&self->_shazamURL, 0);
}

@end
