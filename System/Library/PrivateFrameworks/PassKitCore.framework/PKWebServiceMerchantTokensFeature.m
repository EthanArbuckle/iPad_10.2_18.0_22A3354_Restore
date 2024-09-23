@implementation PKWebServiceMerchantTokensFeature

- (PKWebServiceMerchantTokensFeature)initWithDictionary:(id)a3 region:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKWebServiceMerchantTokensFeature;
  return -[PKWebServiceRegionFeature initWithFeatureType:dictionary:region:](&v5, sel_initWithFeatureType_dictionary_region_, 3, a3, a4);
}

@end
