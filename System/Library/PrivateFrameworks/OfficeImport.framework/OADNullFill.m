@implementation OADNullFill

+ (id)nullFill
{
  return objc_alloc_init(OADNullFill);
}

- (OADNullFill)initWithDefaults
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADNullFill;
  return -[OADProperties initWithDefaults](&v3, sel_initWithDefaults);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[OADNullFill initWithDefaults](+[OADNullFill allocWithZone:](OADNullFill, "allocWithZone:", a3), "initWithDefaults");
}

+ (id)defaultProperties
{
  if (+[OADNullFill defaultProperties]::once != -1)
    dispatch_once(&+[OADNullFill defaultProperties]::once, &__block_literal_global_55);
  return (id)+[OADNullFill defaultProperties]::defaultProperties;
}

void __32__OADNullFill_defaultProperties__block_invoke()
{
  OADNullFill *v0;
  void *v1;

  v0 = -[OADNullFill initWithDefaults]([OADNullFill alloc], "initWithDefaults");
  v1 = (void *)+[OADNullFill defaultProperties]::defaultProperties;
  +[OADNullFill defaultProperties]::defaultProperties = (uint64_t)v0;

}

@end
