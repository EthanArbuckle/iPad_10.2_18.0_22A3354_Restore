@implementation PKAccountWebServiceSharedAccountCloudStoreResponse

- (PKAccountWebServiceSharedAccountCloudStoreResponse)initWithData:(id)a3
{
  PKAccountWebServiceSharedAccountCloudStoreResponse *v3;
  PKAccountWebServiceSharedAccountCloudStoreResponse *v4;
  void *v5;
  void *v6;
  PKSharedAccountCloudStore *v7;
  void *v8;
  uint64_t v9;
  PKSharedAccountCloudStore *sharedAccountCloudStore;
  PKAccountWebServiceSharedAccountCloudStoreResponse *v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  objc_super v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)PKAccountWebServiceSharedAccountCloudStoreResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v18, sel_initWithData_, a3);
  v4 = v3;
  if (!v3)
    goto LABEL_4;
  -[PKWebServiceResponse JSONObject](v3, "JSONObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "PKArrayForKey:", CFSTR("sharedAccountCloudStore"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = [PKSharedAccountCloudStore alloc];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PKSharedAccountCloudStore initWithArray:lastUpdated:](v7, "initWithArray:lastUpdated:", v6, v8);
    sharedAccountCloudStore = v4->_sharedAccountCloudStore;
    v4->_sharedAccountCloudStore = (PKSharedAccountCloudStore *)v9;

LABEL_4:
    v11 = v4;
    goto LABEL_8;
  }
  PKLogFacilityTypeGetObject(0xEuLL);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v20 = v14;
    v21 = 2114;
    v22 = v16;
    _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);

  }
  v11 = 0;
LABEL_8:

  return v11;
}

- (PKSharedAccountCloudStore)sharedAccountCloudStore
{
  return self->_sharedAccountCloudStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedAccountCloudStore, 0);
}

@end
