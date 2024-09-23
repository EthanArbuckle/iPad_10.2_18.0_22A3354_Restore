@implementation DOMRect

- (void)dealloc
{
  objc_class *v3;
  void *v4;
  DOMObjectInternal *internal;
  objc_super v6;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainThread(v3, (objc_object *)self) & 1) == 0)
  {
    internal = self->super._internal;
    if (internal)
      WTF::RefCounted<WebCore::DeprecatedCSSOMRGBColor>::deref(internal, v4);
    v6.receiver = self;
    v6.super_class = (Class)DOMRect;
    -[DOMObject dealloc](&v6, sel_dealloc);
  }
}

- (DOMCSSPrimitiveValue)top
{
  DOMCSSPrimitiveValue *v3;
  void *v4;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  v3 = (DOMCSSPrimitiveValue *)kit(*((WebCore::DeprecatedCSSOMValue **)self->super._internal + 1));
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v4);
  return v3;
}

- (DOMCSSPrimitiveValue)right
{
  DOMCSSPrimitiveValue *v3;
  void *v4;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  v3 = (DOMCSSPrimitiveValue *)kit(*((WebCore::DeprecatedCSSOMValue **)self->super._internal + 2));
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v4);
  return v3;
}

- (DOMCSSPrimitiveValue)bottom
{
  DOMCSSPrimitiveValue *v3;
  void *v4;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  v3 = (DOMCSSPrimitiveValue *)kit(*((WebCore::DeprecatedCSSOMValue **)self->super._internal + 3));
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v4);
  return v3;
}

- (DOMCSSPrimitiveValue)left
{
  DOMCSSPrimitiveValue *v3;
  void *v4;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  v3 = (DOMCSSPrimitiveValue *)kit(*((WebCore::DeprecatedCSSOMValue **)self->super._internal + 4));
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v4);
  return v3;
}

@end
