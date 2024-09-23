@implementation PKWebServiceIssuerBindingFeature

- (PKWebServiceIssuerBindingFeature)initWithDictionary:(id)a3 region:(id)a4
{
  id v6;
  PKWebServiceIssuerBindingFeature *v7;
  void *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKWebServiceIssuerBindingFeature;
  v7 = -[PKWebServiceRegionFeature initWithFeatureType:dictionary:region:](&v10, sel_initWithFeatureType_dictionary_region_, 11, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("enabled"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      v7->_enabled = objc_msgSend(v6, "PKBoolForKey:", CFSTR("enabled"));
    else
      v7->_enabled = 1;
  }

  return v7;
}

- (BOOL)enabled
{
  return self->_enabled;
}

@end
