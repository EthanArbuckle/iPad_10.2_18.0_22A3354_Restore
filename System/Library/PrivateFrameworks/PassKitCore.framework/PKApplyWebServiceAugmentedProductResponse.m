@implementation PKApplyWebServiceAugmentedProductResponse

- (PKApplyWebServiceAugmentedProductResponse)initWithData:(id)a3
{
  PKApplyWebServiceAugmentedProductResponse *v3;
  PKApplyWebServiceAugmentedProductResponse *v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKApplyWebServiceAugmentedProductResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
    v5 = -[PKApplyWebServiceAugmentedProductResponse _generateProduct](v3, "_generateProduct");
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentSetupProduct)product
{
  PKPaymentSetupProduct *product;
  PKPaymentSetupProduct *v4;
  PKPaymentSetupProduct *v5;

  product = self->_product;
  if (!product)
  {
    -[PKApplyWebServiceAugmentedProductResponse _generateProduct](self, "_generateProduct");
    v4 = (PKPaymentSetupProduct *)objc_claimAutoreleasedReturnValue();
    v5 = self->_product;
    self->_product = v4;

    product = self->_product;
  }
  return product;
}

- (id)_generateProduct
{
  void *v2;
  void *v3;
  PKPaymentSetupProduct *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[PKWebServiceResponse JSONObject](self, "JSONObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("product"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = objc_alloc_init(PKPaymentSetupProduct);
      -[PKPaymentSetupProduct updateWithProductDictionary:](v4, "updateWithProductDictionary:", v3);
    }
    else
    {
      v4 = 0;
    }

  }
  else
  {
    PKLogFacilityTypeGetObject(6uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v7;
      _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "Malformed PKApplyWebServiceAugmentedProductResponse: expected dictionary and received %{public}@", (uint8_t *)&v9, 0xCu);

    }
    v4 = 0;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_product, 0);
}

@end
