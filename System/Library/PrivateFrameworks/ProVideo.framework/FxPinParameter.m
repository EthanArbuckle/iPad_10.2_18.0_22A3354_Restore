@implementation FxPinParameter

- (FxPinParameter)init
{
  FxPinParameter *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FxPinParameter;
  result = -[FxPin init](&v3, sel_init);
  if (result)
    result->customUI = 0;
  return result;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v9;

  FxDebugAssert(self->_paramPriv != 0, CFSTR("_paramPriv == NULL"), v2, v3, v4, v5, v6, v7, (char)v9.receiver);
  free(self->_paramPriv);
  v9.receiver = self;
  v9.super_class = (Class)FxPinParameter;
  -[FxPin dealloc](&v9, sel_dealloc);
}

- (id)defaultValue
{
  return self->defaultValue;
}

- (void)setDefaultValue:(id)a3
{
  id defaultValue;

  defaultValue = self->defaultValue;
  if (defaultValue)

  self->defaultValue = a3;
}

- (Class)customPinControl
{
  return self->customUI;
}

@end
