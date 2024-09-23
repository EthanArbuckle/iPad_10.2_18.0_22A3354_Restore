@implementation PKAccountWebServiceRequestPhysicalCardResponse

- (PKAccountWebServiceRequestPhysicalCardResponse)initWithData:(id)a3
{
  PKAccountWebServiceRequestPhysicalCardResponse *v3;
  PKAccountWebServiceRequestPhysicalCardResponse *v4;
  void *v5;
  id v6;
  PKPhysicalCard *v7;
  void *v8;
  uint64_t v9;
  PKPhysicalCard *physicalCard;
  uint64_t v11;
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
  v18.super_class = (Class)PKAccountWebServiceRequestPhysicalCardResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v18, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    -[PKWebServiceResponse JSONObject](v3, "JSONObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      v7 = [PKPhysicalCard alloc];
      objc_msgSend(v6, "PKDictionaryForKey:", CFSTR("physicalCard"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[PKPhysicalCard initWithDictionary:](v7, "initWithDictionary:", v8);
      physicalCard = v4->_physicalCard;
      v4->_physicalCard = (PKPhysicalCard *)v9;

      v4->_shipmentQuoteMinimum = objc_msgSend(v6, "PKIntegerForKey:", CFSTR("shipmentQuoteMinimum"));
      v11 = objc_msgSend(v6, "PKIntegerForKey:", CFSTR("shipmentQuoteMaximum"));

      v4->_shipmentQuoteMaximum = v11;
    }
    else
    {
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
    }

  }
  return v4;
}

- (PKPhysicalCard)physicalCard
{
  return self->_physicalCard;
}

- (unint64_t)shipmentQuoteMinimum
{
  return self->_shipmentQuoteMinimum;
}

- (unint64_t)shipmentQuoteMaximum
{
  return self->_shipmentQuoteMaximum;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_physicalCard, 0);
}

@end
