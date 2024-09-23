@implementation OADGroupFill

+ (id)defaultProperties
{
  if (+[OADGroupFill defaultProperties]::once != -1)
    dispatch_once(&+[OADGroupFill defaultProperties]::once, &__block_literal_global_34);
  return (id)+[OADGroupFill defaultProperties]::defaultProperties;
}

- (OADGroupFill)initWithDefaults
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADGroupFill;
  return -[OADProperties initWithDefaults](&v3, sel_initWithDefaults);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[OADGroupFill initWithDefaults](+[OADGroupFill allocWithZone:](OADGroupFill, "allocWithZone:", a3), "initWithDefaults");
}

void __33__OADGroupFill_defaultProperties__block_invoke()
{
  OADGroupFill *v0;
  void *v1;

  v0 = -[OADGroupFill initWithDefaults]([OADGroupFill alloc], "initWithDefaults");
  v1 = (void *)+[OADGroupFill defaultProperties]::defaultProperties;
  +[OADGroupFill defaultProperties]::defaultProperties = (uint64_t)v0;

}

@end
