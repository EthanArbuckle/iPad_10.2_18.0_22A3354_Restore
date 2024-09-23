@implementation OADLineProperties

+ (id)defaultProperties
{
  if (+[OADLineProperties defaultProperties]::once != -1)
    dispatch_once(&+[OADLineProperties defaultProperties]::once, &__block_literal_global_59);
  return (id)+[OADLineProperties defaultProperties]::defaultProperties;
}

void __38__OADLineProperties_defaultProperties__block_invoke()
{
  OADLineProperties *v0;
  void *v1;

  v0 = -[OADGraphicProperties initWithDefaults]([OADLineProperties alloc], "initWithDefaults");
  v1 = (void *)+[OADLineProperties defaultProperties]::defaultProperties;
  +[OADLineProperties defaultProperties]::defaultProperties = (uint64_t)v0;

}

@end
