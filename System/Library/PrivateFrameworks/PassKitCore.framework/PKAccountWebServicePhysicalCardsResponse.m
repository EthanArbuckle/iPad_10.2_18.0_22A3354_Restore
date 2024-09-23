@implementation PKAccountWebServicePhysicalCardsResponse

- (PKAccountWebServicePhysicalCardsResponse)initWithData:(id)a3
{
  PKAccountWebServicePhysicalCardsResponse *v3;
  PKAccountWebServicePhysicalCardsResponse *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSSet *physicalCards;
  void *v9;
  uint64_t v10;
  NSSet *expirationMessaging;
  PKAccountWebServicePhysicalCardsResponse *v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  objc_super v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)PKAccountWebServicePhysicalCardsResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v19, sel_initWithData_, a3);
  v4 = v3;
  if (!v3)
    goto LABEL_4;
  -[PKWebServiceResponse JSONObject](v3, "JSONObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "PKSetContaining:forKey:", objc_opt_class(), CFSTR("physicalCards"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pk_setByApplyingBlock:", &__block_literal_global_574);
    v7 = objc_claimAutoreleasedReturnValue();
    physicalCards = v4->_physicalCards;
    v4->_physicalCards = (NSSet *)v7;

    objc_msgSend(v5, "PKSetContaining:forKey:", objc_opt_class(), CFSTR("physicalCardExpirationMessaging"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pk_setBySafelyApplyingBlock:", &__block_literal_global_578);
    v10 = objc_claimAutoreleasedReturnValue();
    expirationMessaging = v4->_expirationMessaging;
    v4->_expirationMessaging = (NSSet *)v10;

LABEL_4:
    v12 = v4;
    goto LABEL_8;
  }
  PKLogFacilityTypeGetObject(0xEuLL);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v21 = v15;
    v22 = 2114;
    v23 = v17;
    _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);

  }
  v12 = 0;
LABEL_8:

  return v12;
}

PKPhysicalCard *__57__PKAccountWebServicePhysicalCardsResponse_initWithData___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  PKPhysicalCard *v3;

  v2 = a2;
  v3 = -[PKPhysicalCard initWithDictionary:]([PKPhysicalCard alloc], "initWithDictionary:", v2);

  return v3;
}

PKAccountPhysicalCardExpirationMessagingInfo *__57__PKAccountWebServicePhysicalCardsResponse_initWithData___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  PKAccountPhysicalCardExpirationMessagingInfo *v3;

  v2 = a2;
  v3 = -[PKAccountPhysicalCardExpirationMessagingInfo initWithDictionary:]([PKAccountPhysicalCardExpirationMessagingInfo alloc], "initWithDictionary:", v2);

  return v3;
}

- (NSSet)physicalCards
{
  return self->_physicalCards;
}

- (NSSet)expirationMessaging
{
  return self->_expirationMessaging;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationMessaging, 0);
  objc_storeStrong((id *)&self->_physicalCards, 0);
}

@end
