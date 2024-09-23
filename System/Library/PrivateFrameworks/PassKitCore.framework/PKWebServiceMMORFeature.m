@implementation PKWebServiceMMORFeature

- (PKWebServiceMMORFeature)initWithDictionary:(id)a3 region:(id)a4
{
  id v6;
  PKWebServiceMMORFeature *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKWebServiceMMORFeature;
  v7 = -[PKWebServiceRegionFeature initWithFeatureType:dictionary:region:](&v11, sel_initWithFeatureType_dictionary_region_, 4, v6, a4);
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

- (NSSet)supportedNetworks
{
  return self->_supportedNetworks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedNetworks, 0);
}

@end
