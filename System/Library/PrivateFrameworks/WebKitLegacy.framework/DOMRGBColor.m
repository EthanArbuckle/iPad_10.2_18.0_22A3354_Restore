@implementation DOMRGBColor

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
    v6.super_class = (Class)DOMRGBColor;
    -[DOMObject dealloc](&v6, sel_dealloc);
  }
}

- (DOMCSSPrimitiveValue)red
{
  DOMCSSPrimitiveValue *v3;
  void *v4;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  v3 = (DOMCSSPrimitiveValue *)kit(*((WebCore::DeprecatedCSSOMValue **)self->super._internal + 1));
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v4);
  return v3;
}

- (DOMCSSPrimitiveValue)green
{
  DOMCSSPrimitiveValue *v3;
  void *v4;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  v3 = (DOMCSSPrimitiveValue *)kit(*((WebCore::DeprecatedCSSOMValue **)self->super._internal + 2));
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v4);
  return v3;
}

- (DOMCSSPrimitiveValue)blue
{
  DOMCSSPrimitiveValue *v3;
  void *v4;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  v3 = (DOMCSSPrimitiveValue *)kit(*((WebCore::DeprecatedCSSOMValue **)self->super._internal + 3));
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v4);
  return v3;
}

- (DOMCSSPrimitiveValue)alpha
{
  DOMCSSPrimitiveValue *v3;
  void *v4;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  v3 = (DOMCSSPrimitiveValue *)kit(*((WebCore::DeprecatedCSSOMValue **)self->super._internal + 4));
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v4);
  return v3;
}

- (NSColor)color
{
  void *v3;
  uint64_t v4;
  NSColor *v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v10;
  NSColor *arg;
  _BYTE v12[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12);
  v10 = bswap32(*((_DWORD *)self->super._internal + 1)) | 0x1104000000000000;
  WebCore::cachedCGColor();
  if (arg)
  {
    CFAutorelease(arg);
    v4 = v10;
    v5 = arg;
    if ((v10 & 0x8000000000000) == 0)
      goto LABEL_9;
  }
  else
  {
    v5 = 0;
    v4 = v10;
    if ((v10 & 0x8000000000000) == 0)
      goto LABEL_9;
  }
  v6 = (unsigned int *)(v4 & 0xFFFFFFFFFFFFLL);
  do
  {
    v7 = __ldaxr(v6);
    v8 = v7 - 1;
  }
  while (__stlxr(v8, v6));
  if (!v8)
  {
    atomic_store(1u, v6);
    WTF::fastFree((WTF *)v6, v3);
  }
LABEL_9:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12, v3);
  return v5;
}

@end
