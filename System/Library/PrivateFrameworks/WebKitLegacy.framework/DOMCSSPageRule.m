@implementation DOMCSSPageRule

- (NSString)selectorText
{
  StringImpl *v3;
  const __CFString *v4;
  WTF::StringImpl *v6;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  WebCore::CSSPageRule::selectorText(self->super.super._internal);
  if (v6)
  {
    v4 = (const __CFString *)WTF::StringImpl::operator NSString *();
    if (*(_DWORD *)v6 == 2)
      WTF::StringImpl::destroy(v6, v3);
    else
      *(_DWORD *)v6 -= 2;
  }
  else
  {
    v4 = &stru_1E9D6EC48;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v3);
  return &v4->isa;
}

- (void)setSelectorText:(NSString *)selectorText
{
  DOMObjectInternal *internal;
  StringImpl *v6;
  WTF::StringImpl *v7;
  void *v8;
  WTF::StringImpl *v9;
  _BYTE v10[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  internal = self->super.super._internal;
  MEMORY[0x1D82A3998](&v9, selectorText);
  WebCore::CSSPageRule::setSelectorText(internal, (const WTF::String *)&v9);
  v7 = v9;
  v9 = 0;
  if (!v7)
    goto LABEL_4;
  if (*(_DWORD *)v7 != 2)
  {
    *(_DWORD *)v7 -= 2;
LABEL_4:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v6);
    return;
  }
  WTF::StringImpl::destroy(v7, v6);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v8);
}

- (DOMCSSStyleDeclaration)style
{
  DOMObjectInternal *v3;
  DOMCSSStyleDeclaration *v4;
  void *v5;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  v3 = (DOMObjectInternal *)WebCore::CSSPageRule::style(self->super.super._internal);
  v4 = (DOMCSSStyleDeclaration *)kit(v3);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
  return v4;
}

@end
