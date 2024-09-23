@implementation DOMCSSStyleSheet

- (DOMCSSRule)ownerRule
{
  WebCore::CSSRule *v3;
  DOMCSSRule *v4;
  void *v5;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  v3 = (WebCore::CSSRule *)WebCore::CSSStyleSheet::ownerRule(self->super.super._internal);
  v4 = (DOMCSSRule *)kit(v3);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
  return v4;
}

- (DOMCSSRuleList)cssRules
{
  void *v3;
  DOMCSSRuleList *v4;
  DOMObjectInternal *v6;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  WebCore::CSSStyleSheet::cssRules(self->super.super._internal);
  v4 = (DOMCSSRuleList *)kit(v6);
  if (v6)
    (*(void (**)())(*(_QWORD *)v6 + 24))();
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v3);
  return v4;
}

- (DOMCSSRuleList)rules
{
  void *v3;
  DOMCSSRuleList *v4;
  DOMObjectInternal *v6;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  WebCore::CSSStyleSheet::cssRules(self->super.super._internal);
  v4 = (DOMCSSRuleList *)kit(v6);
  if (v6)
    (*(void (**)())(*(_QWORD *)v6 + 24))();
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v3);
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
  WebCore::CSSStyleSheet::insertRule(internal, (const WTF::String *)&v12);
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
  WebCore::CSSStyleSheet::deleteRule(self->super.super._internal);
  if (v7)
  {
    v8[80] = v5;
    v9 = v6;
    raiseDOMErrorException();
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v4);
}

- (int)addRule:(NSString *)selector style:(NSString *)style index:(unsigned int)index
{
  StringImpl *v7;
  int v8;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;
  int result;
  uint64_t v12;
  WTF::StringImpl *v13;
  WTF::StringImpl *v14;
  int v15;
  uint64_t v16;
  int v17;
  _BYTE v18[88];
  uint64_t v19;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v18);
  MEMORY[0x1D82A3998](&v14, selector);
  MEMORY[0x1D82A3998](&v13, style);
  WebCore::CSSStyleSheet::addRule();
  if (!v17)
  {
    v8 = v15;
    v17 = -1;
    v9 = v13;
    v13 = 0;
    if (v9)
    {
      if (*(_DWORD *)v9 == 2)
      {
        WTF::StringImpl::destroy(v9, v7);
        v10 = v14;
        v14 = 0;
        if (!v10)
        {
LABEL_11:
          WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v18, v7);
          return v8;
        }
LABEL_8:
        if (*(_DWORD *)v10 == 2)
          WTF::StringImpl::destroy(v10, v7);
        else
          *(_DWORD *)v10 -= 2;
        goto LABEL_11;
      }
      *(_DWORD *)v9 -= 2;
    }
    v10 = v14;
    v14 = 0;
    if (!v10)
      goto LABEL_11;
    goto LABEL_8;
  }
  if (v17 == 1)
  {
    v18[80] = v15;
    v12 = v16;
    v16 = 0;
    v19 = v12;
    raiseDOMErrorException();
  }
  result = std::__throw_bad_variant_access[abi:sn180100]();
  __break(1u);
  return result;
}

- (void)removeRule:(unsigned int)index
{
  void *v4;
  char v5;
  uint64_t v6;
  char v7;
  _BYTE v8[88];
  uint64_t v9;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::CSSStyleSheet::deleteRule(self->super.super._internal);
  if (v7)
  {
    v8[80] = v5;
    v9 = v6;
    raiseDOMErrorException();
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v4);
}

@end
