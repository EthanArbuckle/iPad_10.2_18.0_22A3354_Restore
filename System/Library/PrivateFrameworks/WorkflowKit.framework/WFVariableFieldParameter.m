@implementation WFVariableFieldParameter

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (id)defaultSupportedVariableTypes
{
  return 0;
}

- (id)importQuestionBehavior
{
  __CFString *v2;

  v2 = CFSTR("NotSupported");
  return CFSTR("NotSupported");
}

@end
