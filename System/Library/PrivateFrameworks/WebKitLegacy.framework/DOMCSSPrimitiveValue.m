@implementation DOMCSSPrimitiveValue

- (unsigned)primitiveType
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LOWORD(self) = WebCore::DeprecatedCSSOMPrimitiveValue::primitiveType(self->super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (unsigned __int16)self;
}

- (void)setFloatValue:(unsigned __int16)unitType floatValue:(float)floatValue
{
  _BYTE v4[88];
  uint64_t v5;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4);
  v4[80] = 4;
  v5 = 0;
  raiseDOMErrorException();
}

- (float)getFloatValue:(unsigned __int16)unitType
{
  void *v4;
  float result;
  float v6;
  uint64_t v7;
  int v8;
  _BYTE v9[88];
  uint64_t v10;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  WebCore::DeprecatedCSSOMPrimitiveValue::getFloatValue(self->super.super._internal);
  if (v8)
  {
    if (v8 == 1)
    {
      v9[80] = LOBYTE(v6);
      v10 = v7;
      raiseDOMErrorException();
    }
    std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
  }
  else
  {
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v4);
    return v6;
  }
  return result;
}

- (void)setStringValue:(unsigned __int16)stringType stringValue:(NSString *)stringValue
{
  _BYTE v5[8];
  _BYTE v6[88];
  uint64_t v7;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  MEMORY[0x1D82A3998](v5, stringValue);
  v6[80] = 4;
  v7 = 0;
  raiseDOMErrorException();
}

- (NSString)getStringValue
{
  WTF::StringImpl *v3;
  StringImpl *v4;
  const __CFString *v5;
  uint64_t v6;
  NSString *result;
  uint64_t v8;
  WTF::StringImpl *v9;
  uint64_t v10;
  unsigned int v11;
  _BYTE v12[80];
  _BYTE v13[8];
  uint64_t v14;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12);
  WebCore::DeprecatedCSSOMPrimitiveValue::getStringValue(self->super.super._internal);
  if (!v11)
  {
    v3 = v9;
    v9 = 0;
    if (v3)
    {
      v5 = (const __CFString *)WTF::StringImpl::operator NSString *();
      if (*(_DWORD *)v3 == 2)
      {
        WTF::StringImpl::destroy(v3, v4);
        v6 = v11;
      }
      else
      {
        *(_DWORD *)v3 -= 2;
        v6 = v11;
        if (v11 == -1)
          goto LABEL_8;
      }
    }
    else
    {
      v5 = &stru_1E9D6EC48;
      v6 = v11;
    }
    ((void (*)(_BYTE *, WTF::StringImpl **))off_1E9D6AC90[v6])(v13, &v9);
LABEL_8:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12, v4);
    return &v5->isa;
  }
  if (v11 == 1)
  {
    v13[0] = (_BYTE)v9;
    v8 = v10;
    v10 = 0;
    v14 = v8;
    raiseDOMErrorException();
  }
  result = (NSString *)std::__throw_bad_variant_access[abi:sn180100]();
  __break(1u);
  return result;
}

- (DOMCounter)getCounterValue
{
  DOMObjectInternal *v3;
  StringImpl *v4;
  DOMCounter *v5;
  void *v6;
  DOMCounter *result;
  uint64_t v8;
  DOMObjectInternal *v9;
  uint64_t v10;
  int v11;
  _BYTE v12[80];
  _BYTE v13[8];
  uint64_t v14;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12);
  WebCore::DeprecatedCSSOMPrimitiveValue::getCounterValue(self->super.super._internal);
  if (v11)
  {
    if (v11 == 1)
    {
      v13[0] = (_BYTE)v9;
      v8 = v10;
      v10 = 0;
      v14 = v8;
      raiseDOMErrorException();
    }
    result = (DOMCounter *)std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
  }
  else
  {
    v3 = v9;
    v9 = 0;
    v5 = (DOMCounter *)kit(v3);
    if (v3)
      WTF::RefCounted<WebCore::DeprecatedCSSOMCounter>::deref((WTF::StringImpl **)v3, v4);
    ((void (*)(_BYTE *, DOMObjectInternal **))off_1E9D6ACA0[v11])(v13, &v9);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12, v6);
    return v5;
  }
  return result;
}

- (DOMRect)getRectValue
{
  DOMObjectInternal *v3;
  void *v4;
  DOMObjectInternal *v5;
  void *v6;
  DOMRect *result;
  uint64_t v8;
  DOMObjectInternal *v9;
  uint64_t v10;
  int v11;
  _BYTE v12[80];
  _BYTE v13[8];
  uint64_t v14;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12);
  WebCore::DeprecatedCSSOMPrimitiveValue::getRectValue(self->super.super._internal);
  if (v11)
  {
    if (v11 == 1)
    {
      v13[0] = (_BYTE)v9;
      v8 = v10;
      v10 = 0;
      v14 = v8;
      raiseDOMErrorException();
    }
    result = (DOMRect *)std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
  }
  else
  {
    v3 = v9;
    v9 = 0;
    v5 = kit(v3);
    if (v3)
      WTF::RefCounted<WebCore::DeprecatedCSSOMRGBColor>::deref(v3, v4);
    ((void (*)(_BYTE *, DOMObjectInternal **))off_1E9D6ACB0[v11])(v13, &v9);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12, v6);
    return (DOMRect *)v5;
  }
  return result;
}

- (DOMRGBColor)getRGBColorValue
{
  DOMObjectInternal *v3;
  void *v4;
  DOMObjectInternal *v5;
  void *v6;
  DOMRGBColor *result;
  uint64_t v8;
  DOMObjectInternal *v9;
  uint64_t v10;
  int v11;
  _BYTE v12[80];
  _BYTE v13[8];
  uint64_t v14;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12);
  WebCore::DeprecatedCSSOMPrimitiveValue::getRGBColorValue(self->super.super._internal);
  if (v11)
  {
    if (v11 == 1)
    {
      v13[0] = (_BYTE)v9;
      v8 = v10;
      v10 = 0;
      v14 = v8;
      raiseDOMErrorException();
    }
    result = (DOMRGBColor *)std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
  }
  else
  {
    v3 = v9;
    v9 = 0;
    v5 = kit(v3);
    if (v3)
      WTF::RefCounted<WebCore::DeprecatedCSSOMRGBColor>::deref(v3, v4);
    ((void (*)(_BYTE *, DOMObjectInternal **))off_1E9D6ACC0[v11])(v13, &v9);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12, v6);
    return (DOMRGBColor *)v5;
  }
  return result;
}

@end
