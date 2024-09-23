@implementation RBConcreteTarget

+ (id)systemTarget
{
  if (systemTarget_onceToken != -1)
    dispatch_once(&systemTarget_onceToken, &__block_literal_global_15);
  return (id)systemTarget_systemTarget;
}

- (BOOL)isSystem
{
  return 1;
}

+ (id)targetWithProcess:(id)a3 environment:(id)a4
{
  id v5;
  void *v6;
  id v7;
  RBComplexConcreteTarget *v8;
  void *v9;
  id *v10;

  v5 = a3;
  v6 = v5;
  if (a4)
  {
    v7 = a4;
    v8 = [RBComplexConcreteTarget alloc];
    objc_msgSend(v6, "identity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[RBComplexConcreteTarget _initWithProcess:identity:environment:]((id *)&v8->super.super.isa, v6, v9, v7);

  }
  else
  {
    v10 = (id *)v5;
  }

  return v10;
}

+ (id)targetWithIdentity:(id)a3 environment:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id *v8;

  v5 = a3;
  v6 = v5;
  if (a4)
  {
    v7 = a4;
    v8 = -[RBComplexConcreteTarget _initWithProcess:identity:environment:]((id *)[RBComplexConcreteTarget alloc], 0, v6, v7);

  }
  else
  {
    v8 = (id *)v5;
  }

  return v8;
}

void __32__RBConcreteTarget_systemTarget__block_invoke()
{
  RBConcreteTarget *v0;
  void *v1;

  v0 = objc_alloc_init(RBConcreteTarget);
  v1 = (void *)systemTarget_systemTarget;
  systemTarget_systemTarget = (uint64_t)v0;

}

- (id)createRBSTarget
{
  return (id)objc_msgSend(MEMORY[0x24BE80D38], "systemTarget");
}

- (RBProcess)process
{
  return 0;
}

- (RBSProcessIdentity)identity
{
  return 0;
}

- (NSString)environment
{
  return 0;
}

- (NSString)description
{
  return (NSString *)CFSTR("system");
}

@end
