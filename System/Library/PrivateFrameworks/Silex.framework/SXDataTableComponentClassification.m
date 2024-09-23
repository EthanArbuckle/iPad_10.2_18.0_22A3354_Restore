@implementation SXDataTableComponentClassification

+ (id)typeString
{
  return CFSTR("data_table");
}

- (Class)componentModelClass
{
  return (Class)objc_opt_class();
}

- (id)textRules
{
  return +[SXComponentTextRules bodyTextRules](SXComponentTextRules, "bodyTextRules");
}

@end
