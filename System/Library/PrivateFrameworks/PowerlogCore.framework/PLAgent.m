@implementation PLAgent

+ (void)load
{
  uint64_t v3;
  objc_super v4;

  v3 = objc_opt_class();
  if (v3 != objc_opt_class())
  {
    v4.receiver = a1;
    v4.super_class = (Class)&OBJC_METACLASS___PLAgent;
    objc_msgSendSuper2(&v4, sel_load);
  }
}

- (PLAgent)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PLAgent;
  return -[PLOperator init](&v3, sel_init);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PLAgent;
  -[PLOperator dealloc](&v2, sel_dealloc);
}

@end
