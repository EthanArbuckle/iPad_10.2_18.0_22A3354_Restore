@implementation DOMCounter

- (void)dealloc
{
  objc_class *v3;
  StringImpl *v4;
  WTF::StringImpl **internal;
  objc_super v6;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainThread(v3, (objc_object *)self) & 1) == 0)
  {
    internal = (WTF::StringImpl **)self->super._internal;
    if (internal)
      WTF::RefCounted<WebCore::DeprecatedCSSOMCounter>::deref(internal, v4);
    v6.receiver = self;
    v6.super_class = (Class)DOMCounter;
    -[DOMObject dealloc](&v6, sel_dealloc);
  }
}

- (NSString)identifier
{
  StringImpl *v3;
  WTF::StringImpl *v4;
  const __CFString *v5;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  v4 = (WTF::StringImpl *)*((_QWORD *)self->super._internal + 1);
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

- (NSString)listStyle
{
  StringImpl *v3;
  WTF::StringImpl *v4;
  const __CFString *v5;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  v4 = (WTF::StringImpl *)*((_QWORD *)self->super._internal + 3);
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

- (NSString)separator
{
  StringImpl *v3;
  WTF::StringImpl *v4;
  const __CFString *v5;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  v4 = (WTF::StringImpl *)*((_QWORD *)self->super._internal + 2);
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

@end
