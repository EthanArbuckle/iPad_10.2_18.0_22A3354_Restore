@implementation PFEIWidgetDelegate

+ (void)delegateMap
{
  void *result;

  result = (void *)qword_543348;
  if (!qword_543348)
  {
    objc_sync_enter(a1);
    if (!qword_543348)
      operator new();
    objc_sync_exit(a1);
    return (void *)qword_543348;
  }
  return result;
}

+ (const)keyXmlAttributeName
{
  return PFXWidgetConstantDataWidgetType[0];
}

@end
