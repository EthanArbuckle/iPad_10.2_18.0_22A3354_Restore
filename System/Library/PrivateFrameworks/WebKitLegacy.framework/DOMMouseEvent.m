@implementation DOMMouseEvent

- (int)screenX
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = *((_DWORD *)self->super.super.super._internal + 22);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (int)self;
}

- (int)screenY
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = *((_DWORD *)self->super.super.super._internal + 23);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (int)self;
}

- (int)clientX
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = *((_DWORD *)self->super.super.super._internal + 24) / 64;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (int)self;
}

- (int)clientY
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = *((_DWORD *)self->super.super.super._internal + 25) / 64;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (int)self;
}

- (BOOL)ctrlKey
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = (*((unsigned __int8 *)self->super.super.super._internal + 84) >> 1) & 1;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (char)self;
}

- (BOOL)shiftKey
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = (*((unsigned __int8 *)self->super.super.super._internal + 84) >> 3) & 1;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (char)self;
}

- (BOOL)altKey
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LOBYTE(self) = *((_BYTE *)self->super.super.super._internal + 84) & 1;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (char)self;
}

- (BOOL)metaKey
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = (*((unsigned __int8 *)self->super.super.super._internal + 84) >> 2) & 1;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (char)self;
}

- (__int16)button
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LOWORD(self) = *((_WORD *)self->super.super.super._internal + 77);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (__int16)self;
}

- (id)relatedTarget
{
  void *v3;
  WebCore::Node *v4;
  WebCore::Node *v5;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  v4 = (WebCore::Node *)*((_QWORD *)self->super.super.super._internal + 20);
  if (v4 && (*((_BYTE *)v4 + 22) & 2) != 0)
    v5 = kit(v4);
  else
    v5 = 0;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v3);
  return v5;
}

- (int)offsetX
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = WebCore::MouseRelatedEvent::offsetX(self->super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (int)self;
}

- (int)offsetY
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = WebCore::MouseRelatedEvent::offsetY(self->super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (int)self;
}

- (int)x
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = *((_DWORD *)self->super.super.super._internal + 24) / 64;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (int)self;
}

- (int)y
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = *((_DWORD *)self->super.super.super._internal + 25) / 64;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (int)self;
}

- (DOMNode)fromElement
{
  void *v3;
  DOMNode *v4;
  WebCore::Node *v5;
  WebCore::Node *v7;
  _BYTE v8[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  (*(void (**)(WebCore::Node **__return_ptr))(*(_QWORD *)self->super.super.super._internal + 232))(&v7);
  v4 = (DOMNode *)kit(v7);
  v5 = v7;
  v7 = 0;
  if (v5)
  {
    if (*((_DWORD *)v5 + 6) == 2)
    {
      if ((*((_WORD *)v5 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v5);
    }
    else
    {
      *((_DWORD *)v5 + 6) -= 2;
    }
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
  return v4;
}

- (DOMNode)toElement
{
  void *v3;
  DOMNode *v4;
  WebCore::Node *v5;
  WebCore::Node *v7;
  _BYTE v8[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  (*(void (**)(WebCore::Node **__return_ptr))(*(_QWORD *)self->super.super.super._internal + 224))(&v7);
  v4 = (DOMNode *)kit(v7);
  v5 = v7;
  v7 = 0;
  if (v5)
  {
    if (*((_DWORD *)v5 + 6) == 2)
    {
      if ((*((_WORD *)v5 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v5);
    }
    else
    {
      *((_DWORD *)v5 + 6) -= 2;
    }
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
  return v4;
}

- (void)initMouseEvent:(NSString *)type canBubble:(BOOL)canBubble cancelable:(BOOL)cancelable view:(DOMAbstractView *)view detail:(int)detail screenX:(int)screenX screenY:(int)screenY clientX:(int)clientX clientY:(int)clientY ctrlKey:(BOOL)ctrlKey altKey:(BOOL)altKey shiftKey:(BOOL)shiftKey metaKey:(BOOL)metaKey button:(unsigned __int16)button relatedTarget:(id)relatedTarget
{
  const __CFString *v19;
  DOMObjectInternal *internal;
  uint64_t v21;
  WebCore::LocalDOMWindow *v22;
  StringImpl *v23;
  WebCore::WindowProxy *v24;
  WTF::StringImpl *v25;
  WTF *v26;
  void *v27;
  WTF::StringImpl *v28;
  _BYTE v29[80];
  DOMObjectInternal *v30;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v29);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)type, v19);
  v28 = v30;
  if (!view)
    goto LABEL_7;
  internal = view->super._internal;
  if (!internal)
    goto LABEL_8;
  v21 = *((_QWORD *)internal + 37);
  v22 = *(WebCore::LocalDOMWindow **)(v21 + 696);
  if (v22 && WebCore::LocalDOMWindow::frame(*(WebCore::LocalDOMWindow **)(v21 + 696)))
  {
    internal = *(DOMObjectInternal **)(WebCore::LocalDOMWindow::frame(v22) + 112);
    if (internal)
      ++*(_DWORD *)internal;
  }
  else
  {
LABEL_7:
    internal = 0;
  }
LABEL_8:
  v30 = internal;
  WebCore::MouseEvent::initMouseEvent();
  v24 = v30;
  v30 = 0;
  if (v24)
  {
    if (*(_DWORD *)v24 == 1)
    {
      WebCore::WindowProxy::~WindowProxy(v24);
      WTF::fastFree(v26, v27);
      v25 = v28;
      if (!v28)
        goto LABEL_17;
      goto LABEL_14;
    }
    --*(_DWORD *)v24;
  }
  v25 = v28;
  if (!v28)
    goto LABEL_17;
LABEL_14:
  if (*(_DWORD *)v25 == 2)
    WTF::StringImpl::destroy(v25, v23);
  else
    *(_DWORD *)v25 -= 2;
LABEL_17:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v29, v23);
}

- (void)initMouseEvent:(NSString *)type :(BOOL)canBubble :(BOOL)cancelable :(DOMAbstractView *)view :(int)detail :(int)screenX :(int)screenY :(int)clientX :(int)clientY :(BOOL)ctrlKey :(BOOL)altKey :(BOOL)shiftKey :(BOOL)metaKey :(unsigned __int16)button :(id)relatedTarget
{
  -[DOMMouseEvent initMouseEvent:canBubble:cancelable:view:detail:screenX:screenY:clientX:clientY:ctrlKey:altKey:shiftKey:metaKey:button:relatedTarget:](self, "initMouseEvent:canBubble:cancelable:view:detail:screenX:screenY:clientX:clientY:ctrlKey:altKey:shiftKey:metaKey:button:relatedTarget:", type, canBubble, cancelable, view, *(_QWORD *)&detail, *(_QWORD *)&screenX);
}

@end
