@implementation OADRoundLineJoin

+ (id)defaultProperties
{
  if (+[OADRoundLineJoin defaultProperties]::once != -1)
    dispatch_once(&+[OADRoundLineJoin defaultProperties]::once, &__block_literal_global_89);
  return (id)+[OADRoundLineJoin defaultProperties]::defaultProperties;
}

- (OADRoundLineJoin)initWithDefaults
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADRoundLineJoin;
  return -[OADProperties initWithDefaults](&v3, sel_initWithDefaults);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithDefaults");
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = a3;
  v4 = objc_opt_class();
  LOBYTE(v4) = v4 == objc_opt_class();

  return v4;
}

void __37__OADRoundLineJoin_defaultProperties__block_invoke()
{
  OADRoundLineJoin *v0;
  void *v1;

  v0 = -[OADRoundLineJoin initWithDefaults]([OADRoundLineJoin alloc], "initWithDefaults");
  v1 = (void *)+[OADRoundLineJoin defaultProperties]::defaultProperties;
  +[OADRoundLineJoin defaultProperties]::defaultProperties = (uint64_t)v0;

}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADRoundLineJoin;
  return -[OADProperties hash](&v3, sel_hash);
}

@end
