@implementation PKWebServiceTorinoFeature

- (PKWebServiceTorinoFeature)initWithDictionary:(id)a3 region:(id)a4
{
  id v6;
  PKWebServiceTorinoFeature *v7;
  uint64_t v8;
  NSArray *implicitFeatureSupportedNetworks;

  v6 = a3;
  v7 = -[PKWebServiceRegionFeature initWithFeatureType:dictionary:region:](self, "initWithFeatureType:dictionary:region:", 6, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "PKArrayForKey:", CFSTR("implicitFeatureSupportedNetworks"));
    v8 = objc_claimAutoreleasedReturnValue();
    implicitFeatureSupportedNetworks = v7->_implicitFeatureSupportedNetworks;
    v7->_implicitFeatureSupportedNetworks = (NSArray *)v8;

  }
  return v7;
}

- (NSArray)implicitFeatureSupportedNetworks
{
  return self->_implicitFeatureSupportedNetworks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_implicitFeatureSupportedNetworks, 0);
}

@end
