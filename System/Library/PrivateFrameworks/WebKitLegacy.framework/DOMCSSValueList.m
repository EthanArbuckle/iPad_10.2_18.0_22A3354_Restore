@implementation DOMCSSValueList

- (unsigned)length
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = *((_DWORD *)self->super.super._internal + 11);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return self;
}

- (DOMCSSValue)item:(unsigned int)index
{
  DOMObjectInternal *internal;
  WebCore::DeprecatedCSSOMValue *v6;
  DOMCSSValue *v7;
  void *v8;
  _BYTE v10[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  internal = self->super.super._internal;
  if (*((_DWORD *)internal + 11) <= index)
    v6 = 0;
  else
    v6 = *(WebCore::DeprecatedCSSOMValue **)(*((_QWORD *)internal + 4) + 8 * index);
  v7 = (DOMCSSValue *)kit(v6);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v8);
  return v7;
}

@end
