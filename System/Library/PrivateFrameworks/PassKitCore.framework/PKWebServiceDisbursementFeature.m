@implementation PKWebServiceDisbursementFeature

- (PKWebServiceDisbursementFeature)initWithDictionary:(id)a3 region:(id)a4
{
  id v6;
  PKWebServiceDisbursementFeature *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKWebServiceDisbursementFeature;
  v7 = -[PKWebServiceRegionFeature initWithFeatureType:dictionary:region:](&v11, sel_initWithFeatureType_dictionary_region_, 9, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "PKSetContaining:forKey:", objc_opt_class(), CFSTR("implicitFeatureSupportedNetworks"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8)
      v9 = (void *)objc_opt_new();
    objc_storeStrong((id *)&v7->_supportedNetworks, v9);
    if (!v8)

  }
  return v7;
}

- (PKWebServiceDisbursementFeature)initWithSupportedNetworks:(id)a3
{
  id v4;
  PKWebServiceDisbursementFeature *v5;
  uint64_t v6;
  NSSet *supportedNetworks;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKWebServiceDisbursementFeature;
  v5 = -[PKWebServiceDisbursementFeature init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    supportedNetworks = v5->_supportedNetworks;
    v5->_supportedNetworks = (NSSet *)v6;

  }
  return v5;
}

+ (id)disbursementFeatureWithWebService:(id)a3
{
  id v4;
  void *v5;
  PKWebServiceDisbursementFeature *v6;
  PKWebServiceDisbursementFeature *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "targetDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "paymentWebService:supportedRegionFeatureOfType:", v4, 9);
  v6 = (PKWebServiceDisbursementFeature *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = [PKWebServiceDisbursementFeature alloc];
    objc_msgSend(a1, "fallbackSupportedNetworksIfNoFeatureFound");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PKWebServiceDisbursementFeature initWithSupportedNetworks:](v7, "initWithSupportedNetworks:", v8);

  }
  return v6;
}

+ (id)fallbackSupportedNetworksIfNoFeatureFound
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E2C3E9F8, &unk_1E2C3EA10, &unk_1E2C3EA28, &unk_1E2C3EA40, 0);
}

- (NSSet)supportedNetworks
{
  return self->_supportedNetworks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedNetworks, 0);
}

@end
