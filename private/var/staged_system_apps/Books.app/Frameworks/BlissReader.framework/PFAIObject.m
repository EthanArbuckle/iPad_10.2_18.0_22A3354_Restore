@implementation PFAIObject

+ (void)delegateMap
{
  void *result;

  result = (void *)qword_543700;
  if (!qword_543700)
  {
    objc_sync_enter(a1);
    if (!qword_543700)
      operator new();
    objc_sync_exit(a1);
    return (void *)qword_543700;
  }
  return result;
}

+ (const)keyXmlAttributeName
{
  return "type";
}

@end
