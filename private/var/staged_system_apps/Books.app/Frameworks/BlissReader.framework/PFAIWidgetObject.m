@implementation PFAIWidgetObject

+ (void)delegateMap
{
  void *result;

  result = (void *)qword_543708;
  if (!qword_543708)
  {
    objc_sync_enter(a1);
    if (!qword_543708)
      operator new();
    objc_sync_exit(a1);
    return (void *)qword_543708;
  }
  return result;
}

+ (const)keyXmlAttributeName
{
  return PFXWidgetConstantDataWidgetType[0];
}

@end
