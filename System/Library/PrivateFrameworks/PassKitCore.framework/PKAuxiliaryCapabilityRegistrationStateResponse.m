@implementation PKAuxiliaryCapabilityRegistrationStateResponse

- (PKAuxiliaryCapabilityRegistrationStateResponse)initWithData:(id)a3
{
  PKAuxiliaryCapabilityRegistrationStateResponse *v3;
  PKAuxiliaryCapabilityRegistrationStateResponse *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *p_super;
  objc_class *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  objc_super v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)PKAuxiliaryCapabilityRegistrationStateResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v15, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    -[PKWebServiceResponse JSONObject](v3, "JSONObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      objc_msgSend(v6, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("unregisteredRequirements"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_34);
      v8 = objc_claimAutoreleasedReturnValue();
      p_super = &v4->_unregisteredRequirements->super;
      v4->_unregisteredRequirements = (NSArray *)v8;
    }
    else
    {
      PKLogFacilityTypeGetObject(0x1CuLL);
      p_super = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        v10 = (objc_class *)objc_opt_class();
        NSStringFromClass(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v17 = v11;
        v18 = 2114;
        v19 = v13;
        _os_log_impl(&dword_18FC92000, p_super, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);

      }
      v7 = v4;
      v4 = 0;
    }

  }
  return v4;
}

PKAuxiliaryCapabilityUnregisteredRequirements *__63__PKAuxiliaryCapabilityRegistrationStateResponse_initWithData___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  PKAuxiliaryCapabilityUnregisteredRequirements *v3;

  v2 = a2;
  v3 = -[PKAuxiliaryCapabilityUnregisteredRequirements initWithDictionary:]([PKAuxiliaryCapabilityUnregisteredRequirements alloc], "initWithDictionary:", v2);

  return v3;
}

- (NSArray)unregisteredRequirements
{
  return self->_unregisteredRequirements;
}

- (void)setUnregisteredRequirements:(id)a3
{
  objc_storeStrong((id *)&self->_unregisteredRequirements, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unregisteredRequirements, 0);
}

@end
