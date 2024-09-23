@implementation DOMCSSMediaRule

- (DOMMediaList)media
{
  DOMObjectInternal *v3;
  DOMMediaList *v4;
  void *v5;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  v3 = (DOMObjectInternal *)WebCore::CSSMediaRule::media(self->super.super._internal);
  v4 = (DOMMediaList *)kit(v3);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
  return v4;
}

- (DOMCSSRuleList)cssRules
{
  DOMObjectInternal *v3;
  DOMCSSRuleList *v4;
  void *v5;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  v3 = (DOMObjectInternal *)WebCore::CSSGroupingRule::cssRules(self->super.super._internal);
  v4 = (DOMCSSRuleList *)kit(v3);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
  return v4;
}

- (unsigned)insertRule:(NSString *)rule index:(unsigned int)index
{
  DOMObjectInternal *internal;
  StringImpl *v7;
  unsigned int v8;
  WTF::StringImpl *v9;
  unsigned int result;
  uint64_t v11;
  WTF::StringImpl *v12;
  unsigned int v13;
  uint64_t v14;
  int v15;
  _BYTE v16[88];
  uint64_t v17;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v16);
  internal = self->super.super._internal;
  MEMORY[0x1D82A3998](&v12, rule);
  WebCore::CSSGroupingRule::insertRule(internal, (const WTF::String *)&v12);
  if (v15)
  {
    if (v15 == 1)
    {
      v16[80] = v13;
      v11 = v14;
      v14 = 0;
      v17 = v11;
      raiseDOMErrorException();
    }
    result = std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
  }
  else
  {
    v8 = v13;
    v15 = -1;
    v9 = v12;
    v12 = 0;
    if (v9)
    {
      if (*(_DWORD *)v9 == 2)
        WTF::StringImpl::destroy(v9, v7);
      else
        *(_DWORD *)v9 -= 2;
    }
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v16, v7);
    return v8;
  }
  return result;
}

- (void)deleteRule:(unsigned int)index
{
  void *v4;
  char v5;
  uint64_t v6;
  char v7;
  _BYTE v8[88];
  uint64_t v9;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::CSSGroupingRule::deleteRule(self->super.super._internal);
  if (v7)
  {
    v8[80] = v5;
    v9 = v6;
    raiseDOMErrorException();
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v4);
}

@end
