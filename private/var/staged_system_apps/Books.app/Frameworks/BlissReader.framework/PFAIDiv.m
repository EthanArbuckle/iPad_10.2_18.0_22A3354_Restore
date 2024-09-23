@implementation PFAIDiv

+ (void)delegateMap
{
  void *result;

  result = (void *)qword_5436F8;
  if (!qword_5436F8)
  {
    objc_sync_enter(a1);
    if (!qword_5436F8)
      operator new();
    objc_sync_exit(a1);
    return (void *)qword_5436F8;
  }
  return result;
}

+ (Class)blockClass
{
  return (Class)objc_opt_class(PFAIBlock, a2);
}

@end
