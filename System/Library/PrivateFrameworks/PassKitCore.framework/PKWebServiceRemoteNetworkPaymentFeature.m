@implementation PKWebServiceRemoteNetworkPaymentFeature

- (PKWebServiceRemoteNetworkPaymentFeature)initWithDictionary:(id)a3 region:(id)a4
{
  id v6;
  PKWebServiceRemoteNetworkPaymentFeature *v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  objc_super v19;

  v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PKWebServiceRemoteNetworkPaymentFeature;
  v7 = -[PKWebServiceRegionFeature initWithFeatureType:dictionary:region:](&v19, sel_initWithFeatureType_dictionary_region_, 17, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "PKNumberForKey:", CFSTR("enabled"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      v10 = objc_msgSend(v8, "BOOLValue");
    else
      v10 = 1;
    v7->_enabled = v10;
    objc_msgSend(v6, "PKArrayForKey:", CFSTR("unsupportedIssuerCardCountryCodes"));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    v13 = (void *)MEMORY[0x1E0C9AA60];
    if (v11)
      v14 = (void *)v11;
    else
      v14 = (void *)MEMORY[0x1E0C9AA60];
    objc_storeStrong((id *)&v7->_unsupportedIssuerCardCountryCodes, v14);

    objc_msgSend(v6, "PKArrayForKey:", CFSTR("unsupportedNetworks"));
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (v15)
      v17 = (void *)v15;
    else
      v17 = v13;
    objc_storeStrong((id *)&v7->_unsupportedNetworks, v17);

  }
  return v7;
}

+ (id)remoteNetworkPaymentFeatureWithWebService:(id)a3
{
  return (id)objc_msgSend(a3, "supportedRegionFeatureOfType:didFailOSVersionRequirements:", 17, 0);
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (NSArray)unsupportedIssuerCardCountryCodes
{
  return self->_unsupportedIssuerCardCountryCodes;
}

- (NSArray)unsupportedNetworks
{
  return self->_unsupportedNetworks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unsupportedNetworks, 0);
  objc_storeStrong((id *)&self->_unsupportedIssuerCardCountryCodes, 0);
}

@end
