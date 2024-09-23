@implementation PKWebServiceStaticContentDataSourceFeature

- (PKWebServiceStaticContentDataSourceFeature)initWithDictionary:(id)a3 region:(id)a4
{
  id v6;
  PKWebServiceStaticContentDataSourceFeature *v7;
  uint64_t v8;
  NSURL *contentURL;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKWebServiceStaticContentDataSourceFeature;
  v7 = -[PKWebServiceRegionFeature initWithFeatureType:dictionary:region:](&v11, sel_initWithFeatureType_dictionary_region_, 14, v6, a4);
  if (v7)
  {
    v7->_enabled = objc_msgSend(v6, "PKBoolForKey:", CFSTR("enabled"));
    v7->_blockStaticContentFetching = objc_msgSend(v6, "PKBoolForKey:", CFSTR("blockStaticContentFetching"));
    objc_msgSend(v6, "PKURLForKey:", CFSTR("staticContentURL"));
    v8 = objc_claimAutoreleasedReturnValue();
    contentURL = v7->_contentURL;
    v7->_contentURL = (NSURL *)v8;

  }
  return v7;
}

- (id)createProductsRequestWithIsFetchBlocked:(BOOL *)a3
{
  _BOOL4 blockStaticContentFetching;
  PKPaymentCommonAvailableProductsRequest *v5;

  blockStaticContentFetching = self->_blockStaticContentFetching;
  if (a3)
    *a3 = blockStaticContentFetching;
  if (blockStaticContentFetching || self->_contentURL == 0)
    v5 = 0;
  else
    v5 = -[PKPaymentCommonAvailableProductsRequest initWithContentURL:]([PKPaymentCommonAvailableProductsRequest alloc], "initWithContentURL:", self->_contentURL);
  return v5;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)blockStaticContentFetching
{
  return self->_blockStaticContentFetching;
}

- (NSURL)contentURL
{
  return self->_contentURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentURL, 0);
}

@end
