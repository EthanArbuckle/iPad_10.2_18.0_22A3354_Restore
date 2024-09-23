@implementation OADTextWarp

- (BOOL)isEqual:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (unint64_t)hash
{
  return 0;
}

+ (id)nullWarp
{
  OADPresetTextWarp *v2;

  v2 = objc_alloc_init(OADPresetTextWarp);
  -[OADPresetTextWarp setPresetTextWarpType:](v2, "setPresetTextWarpType:", 28);
  return v2;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OADTextWarp;
  -[OADTextWarp description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
