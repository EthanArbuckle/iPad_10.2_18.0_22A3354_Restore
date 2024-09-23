@implementation WFAQIScaleCAQI

- (NSString)name
{
  return (NSString *)CFSTR("CAQI");
}

- (id)scaleCategoryForCategoryIndex:(unint64_t)a3 localizedCategoryDescription:(id)a4
{
  id v5;
  WFAQIScaleCategoryCAQI *v6;

  v5 = a4;
  v6 = -[WFAQIScaleCategory initWithCategoryIndex:localizedCategoryDescription:]([WFAQIScaleCategoryCAQI alloc], "initWithCategoryIndex:localizedCategoryDescription:", a3, v5);

  return v6;
}

@end
