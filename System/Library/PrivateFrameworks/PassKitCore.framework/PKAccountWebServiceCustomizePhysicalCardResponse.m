@implementation PKAccountWebServiceCustomizePhysicalCardResponse

- (PKAccountWebServiceCustomizePhysicalCardResponse)initWithData:(id)a3
{
  PKAccountWebServiceCustomizePhysicalCardResponse *v3;
  PKAccountWebServiceCustomizePhysicalCardResponse *v4;
  void *v5;
  id v6;
  uint64_t v7;
  NSArray *nameOptions;
  void *v9;
  uint64_t v10;
  NSArray *artworkOptions;
  NSObject *v12;
  uint64_t v13;
  NSArray *priceOptions;
  objc_class *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  objc_super v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)PKAccountWebServiceCustomizePhysicalCardResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v20, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    -[PKWebServiceResponse JSONObject](v3, "JSONObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      objc_msgSend(v6, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("nameOptions"));
      v7 = objc_claimAutoreleasedReturnValue();
      nameOptions = v4->_nameOptions;
      v4->_nameOptions = (NSArray *)v7;

      objc_msgSend(v6, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("artworkOptions"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "pk_arrayByApplyingBlock:", &__block_literal_global_298);
      v10 = objc_claimAutoreleasedReturnValue();
      artworkOptions = v4->_artworkOptions;
      v4->_artworkOptions = (NSArray *)v10;

      objc_msgSend(v6, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("priceOptions"));
      v12 = objc_claimAutoreleasedReturnValue();

      -[NSObject pk_arrayByApplyingBlock:](v12, "pk_arrayByApplyingBlock:", &__block_literal_global_303);
      v13 = objc_claimAutoreleasedReturnValue();
      priceOptions = v4->_priceOptions;
      v4->_priceOptions = (NSArray *)v13;

    }
    else
    {
      PKLogFacilityTypeGetObject(0xEuLL);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (objc_class *)objc_opt_class();
        NSStringFromClass(v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (objc_class *)objc_opt_class();
        NSStringFromClass(v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v22 = v16;
        v23 = 2114;
        v24 = v18;
        _os_log_impl(&dword_18FC92000, v12, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);

      }
    }

  }
  return v4;
}

PKPhysicalCardArtworkOption *__65__PKAccountWebServiceCustomizePhysicalCardResponse_initWithData___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  PKPhysicalCardArtworkOption *v3;

  v2 = a2;
  v3 = -[PKPhysicalCardArtworkOption initWithDictionary:]([PKPhysicalCardArtworkOption alloc], "initWithDictionary:", v2);

  return v3;
}

PKPhysicalCardPriceOption *__65__PKAccountWebServiceCustomizePhysicalCardResponse_initWithData___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  PKPhysicalCardPriceOption *v3;

  v2 = a2;
  v3 = -[PKPhysicalCardPriceOption initWithDictionary:]([PKPhysicalCardPriceOption alloc], "initWithDictionary:", v2);

  return v3;
}

- (NSArray)artworkOptions
{
  return self->_artworkOptions;
}

- (NSArray)nameOptions
{
  return self->_nameOptions;
}

- (NSArray)priceOptions
{
  return self->_priceOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_priceOptions, 0);
  objc_storeStrong((id *)&self->_nameOptions, 0);
  objc_storeStrong((id *)&self->_artworkOptions, 0);
}

@end
