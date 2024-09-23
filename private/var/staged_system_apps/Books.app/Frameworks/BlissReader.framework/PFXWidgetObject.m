@implementation PFXWidgetObject

+ (void)delegateMap
{
  void *result;

  result = (void *)qword_543750;
  if (!qword_543750)
  {
    objc_sync_enter(a1);
    if (!qword_543750)
      operator new();
    objc_sync_exit(a1);
    return (void *)qword_543750;
  }
  return result;
}

+ (const)keyXmlAttributeName
{
  return PFXWidgetConstantDataWidgetType[0];
}

@end
