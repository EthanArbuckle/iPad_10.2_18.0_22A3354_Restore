@implementation SHAMPConfiguration

- (SHAMPConfiguration)initWithResponse:(id)a3
{
  id v4;
  SHAMPConfiguration *v5;
  SHOffers *v6;
  void *v7;
  uint64_t v8;
  SHOffers *offers;
  SHStreamingProviders *v10;
  void *v11;
  uint64_t v12;
  SHStreamingProviders *streamingProviders;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SHAMPConfiguration;
  v5 = -[SHAMPConfiguration init](&v15, sel_init);
  if (v5)
  {
    v6 = [SHOffers alloc];
    -[SHAMPConfiguration offerResponseFromResponse:](v5, "offerResponseFromResponse:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SHOffers initWithOfferResponse:](v6, "initWithOfferResponse:", v7);
    offers = v5->_offers;
    v5->_offers = (SHOffers *)v8;

    v10 = [SHStreamingProviders alloc];
    -[SHAMPConfiguration streamingProvidersResponseFromResponse:](v5, "streamingProvidersResponseFromResponse:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[SHStreamingProviders initWithResponse:](v10, "initWithResponse:", v11);
    streamingProviders = v5->_streamingProviders;
    v5->_streamingProviders = (SHStreamingProviders *)v12;

  }
  return v5;
}

- (id)offerResponseFromResponse:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("results"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("appleMusicOffers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)streamingProvidersResponseFromResponse:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("results"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("streamingProviders"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (SHOffers)offers
{
  return self->_offers;
}

- (SHStreamingProviders)streamingProviders
{
  return self->_streamingProviders;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamingProviders, 0);
  objc_storeStrong((id *)&self->_offers, 0);
}

@end
