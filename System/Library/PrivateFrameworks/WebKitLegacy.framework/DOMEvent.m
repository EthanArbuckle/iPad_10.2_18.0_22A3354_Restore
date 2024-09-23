@implementation DOMEvent

- (void)dealloc
{
  objc_class *v3;
  DOMObjectInternal *internal;
  objc_super v5;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainThread(v3, (objc_object *)self) & 1) == 0)
  {
    internal = self->super._internal;
    if (internal)
    {
      if (*((_DWORD *)internal + 4) == 1)
        (*(void (**)(DOMObjectInternal *))(*(_QWORD *)internal + 8))(internal);
      else
        --*((_DWORD *)internal + 4);
    }
    v5.receiver = self;
    v5.super_class = (Class)DOMEvent;
    -[DOMObject dealloc](&v5, sel_dealloc);
  }
}

- (NSString)type
{
  void *v3;
  const __CFString *v4;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  if (*((_QWORD *)self->super._internal + 3))
    v4 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v4 = &stru_1E9D6EC48;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v3);
  return &v4->isa;
}

- (id)target
{
  void *v3;
  WebCore::Node *v4;
  WebCore::Node *v5;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  v4 = (WebCore::Node *)*((_QWORD *)self->super._internal + 6);
  if (v4 && (*((_BYTE *)v4 + 22) & 2) != 0)
    v5 = kit(v4);
  else
    v5 = 0;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v3);
  return v5;
}

- (id)currentTarget
{
  void *v3;
  WebCore::Node *v4;
  WebCore::Node *v5;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  v4 = (WebCore::Node *)*((_QWORD *)self->super._internal + 4);
  if (v4 && (*((_BYTE *)v4 + 22) & 2) != 0)
    v5 = kit(v4);
  else
    v5 = 0;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v3);
  return v5;
}

- (unsigned)eventPhase
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = (*((unsigned __int16 *)self->super._internal + 10) >> 12) & 3;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (unsigned __int16)self;
}

- (BOOL)bubbles
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = (*((_DWORD *)self->super._internal + 5) >> 1) & 1;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (char)self;
}

- (BOOL)cancelable
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = (*((_DWORD *)self->super._internal + 5) >> 2) & 1;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (char)self;
}

- (BOOL)composed
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = (*((_DWORD *)self->super._internal + 5) >> 3) & 1;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (char)self;
}

- (DOMTimeStamp)timeStamp
{
  double v3;
  DOMTimeStamp v4;
  void *v5;
  uint64_t v7;
  _BYTE v8[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  v7 = *((_QWORD *)self->super._internal + 7);
  WTF::MonotonicTime::approximateWallTime((WTF::MonotonicTime *)&v7);
  v4 = (unint64_t)(v3 * 1000.0);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v5);
  return v4;
}

- (BOOL)defaultPrevented
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = (*((_DWORD *)self->super._internal + 5) >> 6) & 1;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (char)self;
}

- (BOOL)isTrusted
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = (*((_DWORD *)self->super._internal + 5) >> 9) & 1;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (char)self;
}

- (id)srcElement
{
  void *v3;
  WebCore::Node *v4;
  WebCore::Node *v5;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  v4 = (WebCore::Node *)*((_QWORD *)self->super._internal + 6);
  if (v4 && (*((_BYTE *)v4 + 22) & 2) != 0)
    v5 = kit(v4);
  else
    v5 = 0;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v3);
  return v5;
}

- (BOOL)returnValue
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LOBYTE(self) = (*((_DWORD *)self->super._internal + 5) & 0x40) == 0;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (char)self;
}

- (void)setReturnValue:(BOOL)returnValue
{
  void *v5;
  DOMObjectInternal *internal;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  if (!returnValue)
  {
    internal = self->super._internal;
    if ((*((_DWORD *)internal + 5) & 0x404) == 4)
      *((_DWORD *)internal + 5) |= 0x40u;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
}

- (BOOL)cancelBubble
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LOBYTE(self) = (*((_DWORD *)self->super._internal + 5) & 0x30) != 0;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (char)self;
}

- (void)setCancelBubble:(BOOL)cancelBubble
{
  _BOOL4 v3;
  void *v5;
  _BYTE v6[80];

  v3 = cancelBubble;
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  if (v3)
    *((_DWORD *)self->super._internal + 5) |= 0x10u;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v5);
}

- (void)stopPropagation
{
  void *v3;
  _BYTE v4[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4);
  *((_DWORD *)self->super._internal + 5) |= 0x10u;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4, v3);
}

- (void)preventDefault
{
  void *v3;
  DOMObjectInternal *internal;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  internal = self->super._internal;
  if ((*((_DWORD *)internal + 5) & 0x404) == 4)
    *((_DWORD *)internal + 5) |= 0x40u;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
}

- (void)initEvent:(NSString *)eventTypeArg canBubbleArg:(BOOL)canBubbleArg cancelableArg:(BOOL)cancelableArg
{
  const __CFString *v6;
  StringImpl *v7;
  WTF::StringImpl *v8;
  _BYTE v9[80];
  WTF::StringImpl *v10;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)eventTypeArg, v6);
  v8 = v10;
  WebCore::Event::initEvent();
  if (v8)
  {
    if (*(_DWORD *)v8 == 2)
      WTF::StringImpl::destroy(v8, v7);
    else
      *(_DWORD *)v8 -= 2;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v7);
}

- (void)stopImmediatePropagation
{
  void *v3;
  _BYTE v4[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4);
  *((_DWORD *)self->super._internal + 5) |= 0x20u;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4, v3);
}

@end
