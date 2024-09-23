@implementation PKDiscoveryArticleLayoutResponse

- (PKDiscoveryArticleLayoutResponse)initWithData:(id)a3
{
  PKDiscoveryArticleLayoutResponse *v3;
  PKDiscoveryArticleLayoutResponse *v4;
  void *v5;
  PKDiscoveryArticleLayout *v6;
  PKDiscoveryArticleLayout *discoveryArticleLayout;
  PKDiscoveryArticleLayout *v8;
  PKDiscoveryArticleLayoutResponse *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  objc_super v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)PKDiscoveryArticleLayoutResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v16, sel_initWithData_, a3);
  v4 = v3;
  if (!v3)
    goto LABEL_4;
  -[PKWebServiceResponse JSONObject](v3, "JSONObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    PKLogFacilityTypeGetObject(0x10uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v18 = v12;
      v19 = 2114;
      v20 = v14;
      _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);

    }
    goto LABEL_8;
  }
  v6 = -[PKDiscoveryArticleLayout initWithDictionary:]([PKDiscoveryArticleLayout alloc], "initWithDictionary:", v5);
  discoveryArticleLayout = v4->_discoveryArticleLayout;
  v4->_discoveryArticleLayout = v6;

  v8 = v4->_discoveryArticleLayout;
  if (!v8)
  {
LABEL_8:
    v9 = 0;
    goto LABEL_9;
  }
LABEL_4:
  v9 = v4;
LABEL_9:

  return v9;
}

- (PKDiscoveryArticleLayout)discoveryArticleLayout
{
  return self->_discoveryArticleLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discoveryArticleLayout, 0);
}

@end
