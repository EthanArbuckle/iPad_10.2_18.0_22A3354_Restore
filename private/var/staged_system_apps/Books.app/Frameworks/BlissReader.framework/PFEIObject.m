@implementation PFEIObject

+ (void)delegateMap
{
  void *result;

  result = (void *)qword_543768;
  if (!qword_543768)
  {
    objc_sync_enter(a1);
    if (!qword_543768)
      operator new();
    objc_sync_exit(a1);
    return (void *)qword_543768;
  }
  return result;
}

+ (const)keyXmlAttributeName
{
  return "type";
}

@end
