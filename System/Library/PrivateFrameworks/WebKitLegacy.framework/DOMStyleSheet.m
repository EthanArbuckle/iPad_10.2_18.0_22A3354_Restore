@implementation DOMStyleSheet

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
      if (*((_DWORD *)internal + 2) == 1)
        (*(void (**)(DOMObjectInternal *))(*(_QWORD *)internal + 8))(internal);
      else
        --*((_DWORD *)internal + 2);
    }
    v5.receiver = self;
    v5.super_class = (Class)DOMStyleSheet;
    -[DOMObject dealloc](&v5, sel_dealloc);
  }
}

- (NSString)type
{
  StringImpl *v3;
  const __CFString *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v7;
  _BYTE v8[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  (*(void (**)(WTF::StringImpl **__return_ptr))(*(_QWORD *)self->super._internal + 72))(&v7);
  if (v7)
  {
    v4 = (const __CFString *)WTF::StringImpl::operator NSString *();
    v5 = v7;
    v7 = 0;
    if (v5)
    {
      if (*(_DWORD *)v5 == 2)
        WTF::StringImpl::destroy(v5, v3);
      else
        *(_DWORD *)v5 -= 2;
    }
  }
  else
  {
    v4 = &stru_1E9D6EC48;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
  return &v4->isa;
}

- (BOOL)disabled
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LOBYTE(self) = (*(uint64_t (**)(DOMObjectInternal *))(*(_QWORD *)self->super._internal + 16))(self->super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (char)self;
}

- (void)setDisabled:(BOOL)disabled
{
  _BOOL8 v3;
  void *v5;
  _BYTE v6[80];

  v3 = disabled;
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  (*(void (**)(DOMObjectInternal *, _BOOL8))(*(_QWORD *)self->super._internal + 24))(self->super._internal, v3);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v5);
}

- (DOMNode)ownerNode
{
  WebCore::Node *v3;
  DOMNode *v4;
  void *v5;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  v3 = (WebCore::Node *)(*(uint64_t (**)(DOMObjectInternal *))(*(_QWORD *)self->super._internal + 32))(self->super._internal);
  v4 = (DOMNode *)kit(v3);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
  return v4;
}

- (DOMStyleSheet)parentStyleSheet
{
  DOMObjectInternal *v3;
  DOMStyleSheet *v4;
  void *v5;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  v3 = (DOMObjectInternal *)(*(uint64_t (**)(DOMObjectInternal *))(*(_QWORD *)self->super._internal + 40))(self->super._internal);
  v4 = (DOMStyleSheet *)kit(v3);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
  return v4;
}

- (NSString)href
{
  StringImpl *v3;
  const __CFString *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v7;
  _BYTE v8[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  (*(void (**)(WTF::StringImpl **__return_ptr))(*(_QWORD *)self->super._internal + 48))(&v7);
  if (v7)
  {
    v4 = (const __CFString *)WTF::StringImpl::operator NSString *();
    v5 = v7;
    v7 = 0;
    if (v5)
    {
      if (*(_DWORD *)v5 == 2)
        WTF::StringImpl::destroy(v5, v3);
      else
        *(_DWORD *)v5 -= 2;
    }
  }
  else
  {
    v4 = &stru_1E9D6EC48;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
  return &v4->isa;
}

- (NSString)title
{
  StringImpl *v3;
  const __CFString *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v7;
  _BYTE v8[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  (*(void (**)(WTF::StringImpl **__return_ptr))(*(_QWORD *)self->super._internal + 56))(&v7);
  if (v7)
  {
    v4 = (const __CFString *)WTF::StringImpl::operator NSString *();
    v5 = v7;
    v7 = 0;
    if (v5)
    {
      if (*(_DWORD *)v5 == 2)
        WTF::StringImpl::destroy(v5, v3);
      else
        *(_DWORD *)v5 -= 2;
    }
  }
  else
  {
    v4 = &stru_1E9D6EC48;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
  return &v4->isa;
}

- (DOMMediaList)media
{
  DOMObjectInternal *v3;
  DOMMediaList *v4;
  void *v5;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  v3 = (DOMObjectInternal *)(*(uint64_t (**)(DOMObjectInternal *))(*(_QWORD *)self->super._internal + 64))(self->super._internal);
  v4 = (DOMMediaList *)kit(v3);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
  return v4;
}

@end
