@implementation DOMCSSFontFaceRule

- (DOMCSSStyleDeclaration)style
{
  DOMObjectInternal *v3;
  DOMCSSStyleDeclaration *v4;
  void *v5;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  v3 = (DOMObjectInternal *)WebCore::CSSFontFaceRule::style(self->super.super._internal);
  v4 = (DOMCSSStyleDeclaration *)kit(v3);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
  return v4;
}

@end
