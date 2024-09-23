@implementation DOMTextEvent

- (NSString)data
{
  StringImpl *v3;
  WTF::StringImpl *v4;
  const __CFString *v5;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  v4 = (WTF::StringImpl *)*((_QWORD *)self->super.super.super._internal + 11);
  if (v4)
  {
    *(_DWORD *)v4 += 2;
    v5 = (const __CFString *)WTF::StringImpl::operator NSString *();
    if (*(_DWORD *)v4 == 2)
      WTF::StringImpl::destroy(v4, v3);
    else
      *(_DWORD *)v4 -= 2;
  }
  else
  {
    v5 = &stru_1E9D6EC48;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v3);
  return &v5->isa;
}

- (void)initTextEvent:(id)a3 canBubbleArg:(BOOL)a4 cancelableArg:(BOOL)a5 viewArg:(id)a6 dataArg:(id)a7
{
  const __CFString *v10;
  WTF::StringImpl *v11;
  uint64_t v12;
  WebCore::LocalDOMWindow *v13;
  StringImpl *v14;
  WTF::StringImpl *v15;
  WebCore::WindowProxy *v16;
  WTF::StringImpl *v17;
  WTF *v18;
  void *v19;
  WTF::StringImpl *v20;
  WTF::StringImpl *v21;
  _BYTE v22[80];
  WTF::StringImpl *v23;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v22);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)a3, v10);
  v21 = v23;
  if (!a6)
    goto LABEL_7;
  v11 = (WTF::StringImpl *)*((_QWORD *)a6 + 2);
  if (!v11)
    goto LABEL_8;
  v12 = *((_QWORD *)v11 + 37);
  v13 = *(WebCore::LocalDOMWindow **)(v12 + 696);
  if (v13 && WebCore::LocalDOMWindow::frame(*(WebCore::LocalDOMWindow **)(v12 + 696)))
  {
    v11 = *(WTF::StringImpl **)(WebCore::LocalDOMWindow::frame(v13) + 112);
    if (v11)
      ++*(_DWORD *)v11;
  }
  else
  {
LABEL_7:
    v11 = 0;
  }
LABEL_8:
  v23 = v11;
  MEMORY[0x1D82A3998](&v20, a7);
  WebCore::TextEvent::initTextEvent();
  v15 = v20;
  v20 = 0;
  if (!v15)
    goto LABEL_11;
  if (*(_DWORD *)v15 != 2)
  {
    *(_DWORD *)v15 -= 2;
LABEL_11:
    v16 = v23;
    v23 = 0;
    if (!v16)
      goto LABEL_16;
    goto LABEL_14;
  }
  WTF::StringImpl::destroy(v15, v14);
  v16 = v23;
  v23 = 0;
  if (!v16)
    goto LABEL_16;
LABEL_14:
  if (*(_DWORD *)v16 == 1)
  {
    WebCore::WindowProxy::~WindowProxy(v16);
    WTF::fastFree(v18, v19);
    v17 = v21;
    v21 = 0;
    if (!v17)
      goto LABEL_22;
    goto LABEL_19;
  }
  --*(_DWORD *)v16;
LABEL_16:
  v17 = v21;
  v21 = 0;
  if (!v17)
    goto LABEL_22;
LABEL_19:
  if (*(_DWORD *)v17 == 2)
    WTF::StringImpl::destroy(v17, v14);
  else
    *(_DWORD *)v17 -= 2;
LABEL_22:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v22, v14);
}

@end
