@implementation PFAITocObjectHandler

+ (void)delegateMap
{
  void *result;

  result = (void *)qword_5436F0;
  if (!qword_5436F0)
  {
    objc_sync_enter(a1);
    if (!qword_5436F0)
      operator new();
    objc_sync_exit(a1);
    return (void *)qword_5436F0;
  }
  return result;
}

+ (const)keyXmlAttributeName
{
  return "type";
}

@end
