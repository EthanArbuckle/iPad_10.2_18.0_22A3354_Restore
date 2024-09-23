@implementation ODDLayoutVariablePropertySet

- (ODDLayoutVariablePropertySet)initWithDefaults
{
  ODDLayoutVariablePropertySet *v2;
  ODDLayoutVariablePropertySet *v3;
  ODDLayoutVariablePropertySet *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ODDLayoutVariablePropertySet;
  v2 = -[OADProperties initWithDefaults](&v6, sel_initWithDefaults);
  v3 = v2;
  if (v2)
  {
    -[ODDLayoutVariablePropertySet setDirection:](v2, "setDirection:", 0);
    v4 = v3;
  }

  return v3;
}

- (int)direction
{
  _DWORD *v2;
  int v3;

  -[OADProperties overrideForSelector:](self, "overrideForSelector:", sel_hasDirection);
  v2 = (_DWORD *)objc_claimAutoreleasedReturnValue();
  v3 = v2[5];

  return v3;
}

- (void)setDirection:(int)a3
{
  *((_DWORD *)&self->super + 5) = a3;
  LOBYTE(self->mDirection) = 1;
}

- (BOOL)hasDirection
{
  return LOBYTE(self->mDirection)
      || -[OADProperties isMergedPropertyForSelector:](self, "isMergedPropertyForSelector:", a2);
}

+ (id)defaultProperties
{
  if (+[ODDLayoutVariablePropertySet defaultProperties]::once != -1)
    dispatch_once(&+[ODDLayoutVariablePropertySet defaultProperties]::once, &__block_literal_global_66);
  return (id)+[ODDLayoutVariablePropertySet defaultProperties]::defaultProperties;
}

void __49__ODDLayoutVariablePropertySet_defaultProperties__block_invoke()
{
  ODDLayoutVariablePropertySet *v0;
  void *v1;

  v0 = -[ODDLayoutVariablePropertySet initWithDefaults]([ODDLayoutVariablePropertySet alloc], "initWithDefaults");
  v1 = (void *)+[ODDLayoutVariablePropertySet defaultProperties]::defaultProperties;
  +[ODDLayoutVariablePropertySet defaultProperties]::defaultProperties = (uint64_t)v0;

}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ODDLayoutVariablePropertySet;
  -[OADProperties description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
