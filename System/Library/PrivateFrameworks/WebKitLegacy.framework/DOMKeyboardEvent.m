@implementation DOMKeyboardEvent

- (NSString)keyIdentifier
{
  void *v3;
  const __CFString *v4;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  if (*((_QWORD *)self->super.super.super._internal + 14))
    v4 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v4 = &stru_1E9D6EC48;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v3);
  return &v4->isa;
}

- (unsigned)location
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = *((_DWORD *)self->super.super.super._internal + 30);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return self;
}

- (unsigned)keyLocation
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = *((_DWORD *)self->super.super.super._internal + 30);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return self;
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

- (BOOL)altGraphKey
{
  return 0;
}

- (int)keyCode
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = WebCore::KeyboardEvent::keyCode(self->super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (int)self;
}

- (int)charCode
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = WebCore::KeyboardEvent::charCode(self->super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (int)self;
}

- (BOOL)getModifierState:(NSString *)keyIdentifierArg
{
  DOMObjectInternal *internal;
  StringImpl *v6;
  char ModifierState;
  WTF::StringImpl *v8;
  WTF::StringImpl *v10;
  _BYTE v11[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11);
  internal = self->super.super.super._internal;
  MEMORY[0x1D82A3998](&v10, keyIdentifierArg);
  ModifierState = WebCore::UIEventWithKeyState::getModifierState(internal, (const WTF::String *)&v10);
  v8 = v10;
  v10 = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 2)
      WTF::StringImpl::destroy(v8, v6);
    else
      *(_DWORD *)v8 -= 2;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11, v6);
  return ModifierState;
}

- (void)initKeyboardEvent:(NSString *)type canBubble:(BOOL)canBubble cancelable:(BOOL)cancelable view:(DOMAbstractView *)view keyIdentifier:(NSString *)keyIdentifier location:(unsigned int)location ctrlKey:(BOOL)ctrlKey altKey:(BOOL)altKey shiftKey:(BOOL)shiftKey metaKey:(BOOL)metaKey altGraphKey:(BOOL)altGraphKey
{
  const __CFString *v16;
  const __CFString *v17;
  DOMObjectInternal *internal;
  uint64_t v19;
  WebCore::LocalDOMWindow *v20;
  StringImpl *v21;
  WebCore::WindowProxy *v22;
  WTF::StringImpl *v23;
  WTF *v24;
  void *v25;
  WTF::StringImpl *v26;
  WebCore::WindowProxy *v27;
  WTF::StringImpl *v28;
  _BYTE v29[80];
  WTF::StringImpl *v30;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v29);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)type, v16);
  v28 = v30;
  if (!view)
    goto LABEL_7;
  internal = view->super._internal;
  if (!internal)
    goto LABEL_8;
  v19 = *((_QWORD *)internal + 37);
  v20 = *(WebCore::LocalDOMWindow **)(v19 + 696);
  if (v20 && WebCore::LocalDOMWindow::frame(*(WebCore::LocalDOMWindow **)(v19 + 696)))
  {
    internal = *(DOMObjectInternal **)(WebCore::LocalDOMWindow::frame(v20) + 112);
    if (internal)
      ++*(_DWORD *)internal;
  }
  else
  {
LABEL_7:
    internal = 0;
  }
LABEL_8:
  v27 = internal;
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)keyIdentifier, v17);
  v26 = v30;
  WebCore::KeyboardEvent::initKeyboardEvent();
  if (!v26)
    goto LABEL_11;
  if (*(_DWORD *)v26 != 2)
  {
    *(_DWORD *)v26 -= 2;
LABEL_11:
    v22 = v27;
    if (!v27)
      goto LABEL_16;
    goto LABEL_14;
  }
  WTF::StringImpl::destroy(v26, v21);
  v22 = v27;
  if (!v27)
    goto LABEL_16;
LABEL_14:
  if (*(_DWORD *)v22 == 1)
  {
    WebCore::WindowProxy::~WindowProxy(v22);
    WTF::fastFree(v24, v25);
    v23 = v28;
    if (!v28)
      goto LABEL_22;
    goto LABEL_19;
  }
  --*(_DWORD *)v22;
LABEL_16:
  v23 = v28;
  if (!v28)
    goto LABEL_22;
LABEL_19:
  if (*(_DWORD *)v23 == 2)
    WTF::StringImpl::destroy(v23, v21);
  else
    *(_DWORD *)v23 -= 2;
LABEL_22:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v29, v21);
}

- (void)initKeyboardEvent:(NSString *)type canBubble:(BOOL)canBubble cancelable:(BOOL)cancelable view:(DOMAbstractView *)view keyIdentifier:(NSString *)keyIdentifier location:(unsigned int)location ctrlKey:(BOOL)ctrlKey altKey:(BOOL)altKey shiftKey:(BOOL)shiftKey metaKey:(BOOL)metaKey
{
  const __CFString *v15;
  const __CFString *v16;
  DOMObjectInternal *internal;
  uint64_t v18;
  WebCore::LocalDOMWindow *v19;
  StringImpl *v20;
  WebCore::WindowProxy *v21;
  WTF::StringImpl *v22;
  WTF *v23;
  void *v24;
  WTF::StringImpl *v25;
  WebCore::WindowProxy *v26;
  WTF::StringImpl *v27;
  _BYTE v28[80];
  WTF::StringImpl *v29;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v28);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)type, v15);
  v27 = v29;
  if (!view)
    goto LABEL_7;
  internal = view->super._internal;
  if (!internal)
    goto LABEL_8;
  v18 = *((_QWORD *)internal + 37);
  v19 = *(WebCore::LocalDOMWindow **)(v18 + 696);
  if (v19 && WebCore::LocalDOMWindow::frame(*(WebCore::LocalDOMWindow **)(v18 + 696)))
  {
    internal = *(DOMObjectInternal **)(WebCore::LocalDOMWindow::frame(v19) + 112);
    if (internal)
      ++*(_DWORD *)internal;
  }
  else
  {
LABEL_7:
    internal = 0;
  }
LABEL_8:
  v26 = internal;
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)keyIdentifier, v16);
  v25 = v29;
  WebCore::KeyboardEvent::initKeyboardEvent();
  if (!v25)
    goto LABEL_11;
  if (*(_DWORD *)v25 != 2)
  {
    *(_DWORD *)v25 -= 2;
LABEL_11:
    v21 = v26;
    if (!v26)
      goto LABEL_16;
    goto LABEL_14;
  }
  WTF::StringImpl::destroy(v25, v20);
  v21 = v26;
  if (!v26)
    goto LABEL_16;
LABEL_14:
  if (*(_DWORD *)v21 == 1)
  {
    WebCore::WindowProxy::~WindowProxy(v21);
    WTF::fastFree(v23, v24);
    v22 = v27;
    if (!v27)
      goto LABEL_22;
    goto LABEL_19;
  }
  --*(_DWORD *)v21;
LABEL_16:
  v22 = v27;
  if (!v27)
    goto LABEL_22;
LABEL_19:
  if (*(_DWORD *)v22 == 2)
    WTF::StringImpl::destroy(v22, v20);
  else
    *(_DWORD *)v22 -= 2;
LABEL_22:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v28, v20);
}

- (void)initKeyboardEvent:(NSString *)type canBubble:(BOOL)canBubble cancelable:(BOOL)cancelable view:(DOMAbstractView *)view keyIdentifier:(NSString *)keyIdentifier keyLocation:(unsigned int)keyLocation ctrlKey:(BOOL)ctrlKey altKey:(BOOL)altKey shiftKey:(BOOL)shiftKey metaKey:(BOOL)metaKey altGraphKey:(BOOL)altGraphKey
{
  const __CFString *v16;
  const __CFString *v17;
  DOMObjectInternal *internal;
  uint64_t v19;
  WebCore::LocalDOMWindow *v20;
  StringImpl *v21;
  WebCore::WindowProxy *v22;
  WTF::StringImpl *v23;
  WTF *v24;
  void *v25;
  WTF::StringImpl *v26;
  WebCore::WindowProxy *v27;
  WTF::StringImpl *v28;
  _BYTE v29[80];
  WTF::StringImpl *v30;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v29);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)type, v16);
  v28 = v30;
  if (!view)
    goto LABEL_7;
  internal = view->super._internal;
  if (!internal)
    goto LABEL_8;
  v19 = *((_QWORD *)internal + 37);
  v20 = *(WebCore::LocalDOMWindow **)(v19 + 696);
  if (v20 && WebCore::LocalDOMWindow::frame(*(WebCore::LocalDOMWindow **)(v19 + 696)))
  {
    internal = *(DOMObjectInternal **)(WebCore::LocalDOMWindow::frame(v20) + 112);
    if (internal)
      ++*(_DWORD *)internal;
  }
  else
  {
LABEL_7:
    internal = 0;
  }
LABEL_8:
  v27 = internal;
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)keyIdentifier, v17);
  v26 = v30;
  WebCore::KeyboardEvent::initKeyboardEvent();
  if (!v26)
    goto LABEL_11;
  if (*(_DWORD *)v26 != 2)
  {
    *(_DWORD *)v26 -= 2;
LABEL_11:
    v22 = v27;
    if (!v27)
      goto LABEL_16;
    goto LABEL_14;
  }
  WTF::StringImpl::destroy(v26, v21);
  v22 = v27;
  if (!v27)
    goto LABEL_16;
LABEL_14:
  if (*(_DWORD *)v22 == 1)
  {
    WebCore::WindowProxy::~WindowProxy(v22);
    WTF::fastFree(v24, v25);
    v23 = v28;
    if (!v28)
      goto LABEL_22;
    goto LABEL_19;
  }
  --*(_DWORD *)v22;
LABEL_16:
  v23 = v28;
  if (!v28)
    goto LABEL_22;
LABEL_19:
  if (*(_DWORD *)v23 == 2)
    WTF::StringImpl::destroy(v23, v21);
  else
    *(_DWORD *)v23 -= 2;
LABEL_22:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v29, v21);
}

- (void)initKeyboardEvent:(NSString *)type canBubble:(BOOL)canBubble cancelable:(BOOL)cancelable view:(DOMAbstractView *)view keyIdentifier:(NSString *)keyIdentifier keyLocation:(unsigned int)keyLocation ctrlKey:(BOOL)ctrlKey altKey:(BOOL)altKey shiftKey:(BOOL)shiftKey metaKey:(BOOL)metaKey
{
  const __CFString *v15;
  const __CFString *v16;
  DOMObjectInternal *internal;
  uint64_t v18;
  WebCore::LocalDOMWindow *v19;
  StringImpl *v20;
  WebCore::WindowProxy *v21;
  WTF::StringImpl *v22;
  WTF *v23;
  void *v24;
  WTF::StringImpl *v25;
  WebCore::WindowProxy *v26;
  WTF::StringImpl *v27;
  _BYTE v28[80];
  WTF::StringImpl *v29;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v28);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)type, v15);
  v27 = v29;
  if (!view)
    goto LABEL_7;
  internal = view->super._internal;
  if (!internal)
    goto LABEL_8;
  v18 = *((_QWORD *)internal + 37);
  v19 = *(WebCore::LocalDOMWindow **)(v18 + 696);
  if (v19 && WebCore::LocalDOMWindow::frame(*(WebCore::LocalDOMWindow **)(v18 + 696)))
  {
    internal = *(DOMObjectInternal **)(WebCore::LocalDOMWindow::frame(v19) + 112);
    if (internal)
      ++*(_DWORD *)internal;
  }
  else
  {
LABEL_7:
    internal = 0;
  }
LABEL_8:
  v26 = internal;
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)keyIdentifier, v16);
  v25 = v29;
  WebCore::KeyboardEvent::initKeyboardEvent();
  if (!v25)
    goto LABEL_11;
  if (*(_DWORD *)v25 != 2)
  {
    *(_DWORD *)v25 -= 2;
LABEL_11:
    v21 = v26;
    if (!v26)
      goto LABEL_16;
    goto LABEL_14;
  }
  WTF::StringImpl::destroy(v25, v20);
  v21 = v26;
  if (!v26)
    goto LABEL_16;
LABEL_14:
  if (*(_DWORD *)v21 == 1)
  {
    WebCore::WindowProxy::~WindowProxy(v21);
    WTF::fastFree(v23, v24);
    v22 = v27;
    if (!v27)
      goto LABEL_22;
    goto LABEL_19;
  }
  --*(_DWORD *)v21;
LABEL_16:
  v22 = v27;
  if (!v27)
    goto LABEL_22;
LABEL_19:
  if (*(_DWORD *)v22 == 2)
    WTF::StringImpl::destroy(v22, v20);
  else
    *(_DWORD *)v22 -= 2;
LABEL_22:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v28, v20);
}

@end
