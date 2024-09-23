@implementation PKWebServicePaymentOffersFeature

- (PKWebServicePaymentOffersFeature)initWithDictionary:(id)a3 region:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKWebServicePaymentOffersFeature;
  return -[PKWebServiceRegionFeature initWithFeatureType:dictionary:region:](&v5, sel_initWithFeatureType_dictionary_region_, 15, a3, a4);
}

- (BOOL)isSupportedOnDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  -[PKWebServiceRegionFeature versionRange](self, "versionRange");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "deviceClass");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKOSVersionRequirement fromDeviceVersion](PKOSVersionRequirement, "fromDeviceVersion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKWebServiceRegionFeature versionRange](self, "versionRange");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "versionMeetsRequirements:deviceClass:", v7, v6);

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; "), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKWebServiceRegionFeature versionRange](self, "versionRange");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "asDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("versionRange: '%@'; "), v8);

  objc_msgSend(v6, "appendFormat:", CFSTR(">"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
