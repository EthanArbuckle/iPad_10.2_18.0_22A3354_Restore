@implementation OADBackgroundFill

+ (id)defaultProperties
{
  if (+[OADBackgroundFill defaultProperties]::once != -1)
    dispatch_once(&+[OADBackgroundFill defaultProperties]::once, &__block_literal_global_30_1);
  return (id)+[OADBackgroundFill defaultProperties]::defaultProperties;
}

- (OADBackgroundFill)initWithDefaults
{
  OADBackgroundFill *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADBackgroundFill;
  result = -[OADProperties initWithDefaults](&v3, sel_initWithDefaults);
  if (result)
    *((_BYTE *)&result->super.super + 17) = 0;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[OADBackgroundFill initWithDefaults](+[OADBackgroundFill allocWithZone:](OADBackgroundFill, "allocWithZone:", a3), "initWithDefaults");
}

void __38__OADBackgroundFill_defaultProperties__block_invoke()
{
  OADBackgroundFill *v0;
  void *v1;

  v0 = -[OADBackgroundFill initWithDefaults]([OADBackgroundFill alloc], "initWithDefaults");
  v1 = (void *)+[OADBackgroundFill defaultProperties]::defaultProperties;
  +[OADBackgroundFill defaultProperties]::defaultProperties = (uint64_t)v0;

}

@end
