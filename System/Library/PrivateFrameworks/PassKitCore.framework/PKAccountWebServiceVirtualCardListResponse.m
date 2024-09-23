@implementation PKAccountWebServiceVirtualCardListResponse

- (PKAccountWebServiceVirtualCardListResponse)initWithData:(id)a3
{
  PKAccountWebServiceVirtualCardListResponse *v3;
  PKAccountWebServiceVirtualCardListResponse *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  PKVirtualCard *v13;
  uint64_t v14;
  NSArray *virtualCards;
  objc_class *v16;
  objc_class *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v23.receiver = self;
  v23.super_class = (Class)PKAccountWebServiceVirtualCardListResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v23, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    -[PKWebServiceResponse JSONObject](v3, "JSONObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject PKArrayForKey:](v6, "PKArrayForKey:", CFSTR("virtualCards"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v28, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v20;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v20 != v11)
              objc_enumerationMutation(v8);
            v13 = -[PKVirtualCard initWithDictionary:]([PKVirtualCard alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v12));
            objc_msgSend(v7, "addObject:", v13);

            ++v12;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v28, 16);
        }
        while (v10);
      }
      v14 = objc_msgSend(v7, "copy");
      virtualCards = v4->_virtualCards;
      v4->_virtualCards = (NSArray *)v14;

    }
    else
    {
      PKLogFacilityTypeGetObject(0xEuLL);
      v6 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
LABEL_14:

        return v4;
      }
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v7;
      v26 = 2114;
      v27 = v8;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);
    }

    goto LABEL_14;
  }
  return v4;
}

- (NSArray)virtualCards
{
  return self->_virtualCards;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_virtualCards, 0);
}

@end
