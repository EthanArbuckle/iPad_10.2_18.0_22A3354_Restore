@implementation PKWebServiceMerchantCategoryCodesFeature

- (PKWebServiceMerchantCategoryCodesFeature)initWithDictionary:(id)a3 region:(id)a4
{
  id v6;
  PKWebServiceMerchantCategoryCodesFeature *v7;
  uint64_t v8;
  NSArray *appleCardUnsupportedMerchantCategoryCodes;
  uint64_t v10;
  NSArray *appleCashUnsupportedMerchantCategoryCodes;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKWebServiceMerchantCategoryCodesFeature;
  v7 = -[PKWebServiceRegionFeature initWithFeatureType:dictionary:region:](&v13, sel_initWithFeatureType_dictionary_region_, 16, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "PKArrayForKey:", CFSTR("appleCardUnsupportedMerchantCategoryCodes"));
    v8 = objc_claimAutoreleasedReturnValue();
    appleCardUnsupportedMerchantCategoryCodes = v7->_appleCardUnsupportedMerchantCategoryCodes;
    v7->_appleCardUnsupportedMerchantCategoryCodes = (NSArray *)v8;

    objc_msgSend(v6, "PKArrayForKey:", CFSTR("appleCashUnsupportedMerchantCategoryCodes"));
    v10 = objc_claimAutoreleasedReturnValue();
    appleCashUnsupportedMerchantCategoryCodes = v7->_appleCashUnsupportedMerchantCategoryCodes;
    v7->_appleCashUnsupportedMerchantCategoryCodes = (NSArray *)v10;

  }
  return v7;
}

+ (id)merchantCategoryCodesFeatureWithWebService:(id)a3
{
  return (id)objc_msgSend(a3, "supportedRegionFeatureOfType:didFailOSVersionRequirements:", 16, 0);
}

- (NSArray)appleCardUnsupportedMerchantCategoryCodes
{
  return self->_appleCardUnsupportedMerchantCategoryCodes;
}

- (NSArray)appleCashUnsupportedMerchantCategoryCodes
{
  return self->_appleCashUnsupportedMerchantCategoryCodes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleCashUnsupportedMerchantCategoryCodes, 0);
  objc_storeStrong((id *)&self->_appleCardUnsupportedMerchantCategoryCodes, 0);
}

@end
