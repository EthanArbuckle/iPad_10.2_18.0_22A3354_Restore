@implementation DOMMediaList

- (void)dealloc
{
  objc_class *v3;
  DOMObjectInternal *internal;
  WTF *v5;
  void *v6;
  objc_super v7;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainThread(v3, (objc_object *)self) & 1) == 0)
  {
    internal = self->super._internal;
    if (internal)
    {
      if (*(_DWORD *)internal == 1)
      {
        WebCore::MediaList::~MediaList(internal);
        WTF::fastFree(v5, v6);
      }
      else
      {
        --*(_DWORD *)internal;
      }
    }
    v7.receiver = self;
    v7.super_class = (Class)DOMMediaList;
    -[DOMObject dealloc](&v7, sel_dealloc);
  }
}

- (NSString)mediaText
{
  StringImpl *v3;
  const __CFString *v4;
  WTF::StringImpl *v6;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  WebCore::MediaList::mediaText(self->super._internal);
  if (v6)
  {
    v4 = (const __CFString *)WTF::StringImpl::operator NSString *();
    if (*(_DWORD *)v6 == 2)
      WTF::StringImpl::destroy(v6, v3);
    else
      *(_DWORD *)v6 -= 2;
  }
  else
  {
    v4 = &stru_1E9D6EC48;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v3);
  return &v4->isa;
}

- (void)setMediaText:(NSString *)mediaText
{
  DOMObjectInternal *internal;
  StringImpl *v6;
  WTF::StringImpl *v7;
  void *v8;
  WTF::StringImpl *v9;
  _BYTE v10[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  internal = self->super._internal;
  MEMORY[0x1D82A3998](&v9, mediaText);
  WebCore::MediaList::setMediaText(internal, (const WTF::String *)&v9);
  v7 = v9;
  v9 = 0;
  if (!v7)
    goto LABEL_4;
  if (*(_DWORD *)v7 != 2)
  {
    *(_DWORD *)v7 -= 2;
LABEL_4:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v6);
    return;
  }
  WTF::StringImpl::destroy(v7, v6);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v8);
}

- (unsigned)length
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = WebCore::MediaList::length(self->super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return self;
}

- (NSString)item:(unsigned int)index
{
  StringImpl *v4;
  const __CFString *v5;
  WTF::StringImpl *v7;
  _BYTE v8[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::MediaList::item(self->super._internal);
  if (v7)
  {
    v5 = (const __CFString *)WTF::StringImpl::operator NSString *();
    if (*(_DWORD *)v7 == 2)
      WTF::StringImpl::destroy(v7, v4);
    else
      *(_DWORD *)v7 -= 2;
  }
  else
  {
    v5 = &stru_1E9D6EC48;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v4);
  return &v5->isa;
}

- (void)deleteMedium:(NSString *)oldMedium
{
  DOMObjectInternal *internal;
  StringImpl *v6;
  WTF::StringImpl *v7;
  void *v8;
  uint64_t v9;
  WTF::StringImpl *v10;
  char v11;
  uint64_t v12;
  char v13;
  _BYTE v14[88];
  uint64_t v15;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v14);
  internal = self->super._internal;
  MEMORY[0x1D82A3998](&v10, oldMedium);
  WebCore::MediaList::deleteMedium(internal, (const WTF::String *)&v10);
  if (v13)
  {
    v14[80] = v11;
    v9 = v12;
    v12 = 0;
    v15 = v9;
    raiseDOMErrorException();
  }
  v7 = v10;
  v10 = 0;
  if (!v7)
    goto LABEL_5;
  if (*(_DWORD *)v7 != 2)
  {
    *(_DWORD *)v7 -= 2;
LABEL_5:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v14, v6);
    return;
  }
  WTF::StringImpl::destroy(v7, v6);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v14, v8);
}

- (void)appendMedium:(NSString *)newMedium
{
  DOMObjectInternal *internal;
  StringImpl *v6;
  WTF::StringImpl *v7;
  void *v8;
  WTF::StringImpl *v9;
  _BYTE v10[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  internal = self->super._internal;
  MEMORY[0x1D82A3998](&v9, newMedium);
  WebCore::MediaList::appendMedium(internal, (const WTF::String *)&v9);
  v7 = v9;
  v9 = 0;
  if (!v7)
    goto LABEL_4;
  if (*(_DWORD *)v7 != 2)
  {
    *(_DWORD *)v7 -= 2;
LABEL_4:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v6);
    return;
  }
  WTF::StringImpl::destroy(v7, v6);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v8);
}

@end
