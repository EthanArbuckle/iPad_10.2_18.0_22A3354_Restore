@implementation DOMBlob

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
    v5.super_class = (Class)DOMBlob;
    -[DOMObject dealloc](&v5, sel_dealloc);
  }
}

- (unint64_t)size
{
  unint64_t v3;
  void *v4;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  v3 = WebCore::Blob::size(self->super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v4);
  return v3;
}

- (id)type
{
  void *v3;
  const __CFString *v4;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  if (*((_QWORD *)self->super._internal + 6))
    v4 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v4 = &stru_1E9D6EC48;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v3);
  return (id)v4;
}

@end
