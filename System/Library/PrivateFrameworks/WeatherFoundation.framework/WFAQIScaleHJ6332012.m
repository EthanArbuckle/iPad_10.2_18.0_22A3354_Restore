@implementation WFAQIScaleHJ6332012

- (NSString)name
{
  return (NSString *)CFSTR("HJ6332012");
}

- (id)scaleCategoryForCategoryIndex:(unint64_t)a3 localizedCategoryDescription:(id)a4
{
  id v5;
  WFAQIScaleCategoryHJ6332012 *v6;

  v5 = a4;
  v6 = -[WFAQIScaleCategory initWithCategoryIndex:localizedCategoryDescription:]([WFAQIScaleCategoryHJ6332012 alloc], "initWithCategoryIndex:localizedCategoryDescription:", a3, v5);

  return v6;
}

@end
