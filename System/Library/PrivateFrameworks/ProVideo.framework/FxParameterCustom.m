@implementation FxParameterCustom

- (FxParameterCustom)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FxParameterCustom;
  return -[FxPinParameter init](&v3, sel_init);
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

  FxDebugAssert(self->_customPriv != 0, CFSTR("_customPriv == NULL"), v2, v3, v4, v5, v6, v7, (char)v9.receiver);
  free(self->_customPriv);
  v9.receiver = self;
  v9.super_class = (Class)FxParameterCustom;
  -[FxPinParameter dealloc](&v9, sel_dealloc);
}

- (id)dataFromValue:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char vars0;

  FxDebugLog(CFSTR("-dataFromValue: not defined by FxParameterCustom."), (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, vars0);
  return 0;
}

- (id)valueFromData:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char vars0;

  FxDebugLog(CFSTR("-valueFromData: not defined by FxParameterCustom."), (uint64_t)a2, (uint64_t)a3, v3, v4, v5, v6, v7, vars0);
  return 0;
}

@end
