@implementation WLKCanonicalContainerRequestOperation

- (void)processResponse
{
  void *v3;
  WLKCanonicalContainerResponse *v4;
  WLKCanonicalContainerResponse *containerResponse;
  WLKDictionaryResponseProcessor *v6;

  v6 = objc_alloc_init(WLKDictionaryResponseProcessor);
  -[WLKDictionaryResponseProcessor setObjectClass:](v6, "setObjectClass:", objc_opt_class());
  -[WLKNetworkRequestOperation data](self, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLKDictionaryResponseProcessor processResponseData:error:](v6, "processResponseData:error:", v3, 0);
  v4 = (WLKCanonicalContainerResponse *)objc_claimAutoreleasedReturnValue();
  containerResponse = self->_containerResponse;
  self->_containerResponse = v4;

}

- (WLKCanonicalContainerResponse)containerResponse
{
  return self->_containerResponse;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerResponse, 0);
}

@end
