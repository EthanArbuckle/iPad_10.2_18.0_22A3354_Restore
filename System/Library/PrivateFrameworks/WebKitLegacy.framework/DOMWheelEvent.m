@implementation DOMWheelEvent

- (double)deltaX
{
  double v3;
  void *v4;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  v3 = *((double *)self->super.super.super.super._internal + 23);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v4);
  return v3;
}

- (double)deltaY
{
  double v3;
  void *v4;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  v3 = *((double *)self->super.super.super.super._internal + 24);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v4);
  return v3;
}

- (double)deltaZ
{
  double v3;
  void *v4;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  v3 = *((double *)self->super.super.super.super._internal + 25);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v4);
  return v3;
}

- (unsigned)deltaMode
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = *((_DWORD *)self->super.super.super.super._internal + 52);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return self;
}

- (int)wheelDeltaX
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = *((_DWORD *)self->super.super.super.super._internal + 44);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (int)self;
}

- (int)wheelDeltaY
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = *((_DWORD *)self->super.super.super.super._internal + 45);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (int)self;
}

- (int)wheelDelta
{
  void *v3;
  DOMObjectInternal *internal;
  int v5;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  internal = self->super.super.super.super._internal;
  v5 = *((_DWORD *)internal + 45);
  if (!v5)
    v5 = *((_DWORD *)internal + 44);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v3);
  return v5;
}

- (BOOL)webkitDirectionInvertedFromDevice
{
  void *v3;
  DOMObjectInternal *internal;
  BOOL v5;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  internal = self->super.super.super.super._internal;
  if (*((_BYTE *)internal + 352))
    v5 = *((_BYTE *)internal + 273) != 0;
  else
    v5 = 0;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v3);
  return v5;
}

- (BOOL)isHorizontal
{
  return -[DOMWheelEvent wheelDeltaX](self, "wheelDeltaX") != 0;
}

@end
