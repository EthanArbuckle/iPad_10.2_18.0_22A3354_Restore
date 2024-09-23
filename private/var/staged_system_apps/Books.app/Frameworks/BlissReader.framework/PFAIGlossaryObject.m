@implementation PFAIGlossaryObject

+ (void)delegateMap
{
  void *result;

  result = (void *)qword_543730;
  if (!qword_543730)
  {
    objc_sync_enter(a1);
    if (!qword_543730)
      operator new();
    objc_sync_exit(a1);
    return (void *)qword_543730;
  }
  return result;
}

+ (const)keyXmlAttributeName
{
  return "type";
}

@end
