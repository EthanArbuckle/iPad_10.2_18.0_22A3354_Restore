@implementation OADBevelLineJoin

+ (id)defaultProperties
{
  if (+[OADBevelLineJoin defaultProperties]::once != -1)
    dispatch_once(&+[OADBevelLineJoin defaultProperties]::once, &__block_literal_global_72_0);
  return (id)+[OADBevelLineJoin defaultProperties]::defaultProperties;
}

- (OADBevelLineJoin)initWithDefaults
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADBevelLineJoin;
  return -[OADProperties initWithDefaults](&v3, sel_initWithDefaults);
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

- (id)copyWithZone:(_NSZone *)a3
{
  return -[OADBevelLineJoin initWithDefaults](+[OADBevelLineJoin allocWithZone:](OADBevelLineJoin, "allocWithZone:", a3), "initWithDefaults");
}

void __37__OADBevelLineJoin_defaultProperties__block_invoke()
{
  OADBevelLineJoin *v0;
  void *v1;

  v0 = -[OADBevelLineJoin initWithDefaults]([OADBevelLineJoin alloc], "initWithDefaults");
  v1 = (void *)+[OADBevelLineJoin defaultProperties]::defaultProperties;
  +[OADBevelLineJoin defaultProperties]::defaultProperties = (uint64_t)v0;

}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADBevelLineJoin;
  return -[OADProperties hash](&v3, sel_hash);
}

@end
