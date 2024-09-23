@implementation DOMTokenList

- (void)dealloc
{
  objc_class *v3;
  DOMObjectInternal *internal;
  uint64_t v5;
  int v6;
  objc_super v7;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainThread(v3, (objc_object *)self) & 1) == 0)
  {
    internal = self->super._internal;
    if (internal)
    {
      v5 = *(_QWORD *)internal;
      v6 = *(_DWORD *)(*(_QWORD *)internal + 24) - 2;
      if (v6)
      {
        *(_DWORD *)(v5 + 24) = v6;
      }
      else if ((*(_WORD *)(v5 + 30) & 0x400) == 0)
      {
        WebCore::Node::removedLastRef((WebCore::Node *)v5);
      }
    }
    v7.receiver = self;
    v7.super_class = (Class)DOMTokenList;
    -[DOMObject dealloc](&v7, sel_dealloc);
  }
}

- (unsigned)length
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = *(_DWORD *)(WebCore::DOMTokenList::tokens(self->super._internal) + 12);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return self;
}

- (NSString)value
{
  void *v3;
  const __CFString *v4;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  if (*(_QWORD *)WebCore::DOMTokenList::value(self->super._internal))
    v4 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v4 = &stru_1E9D6EC48;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v3);
  return &v4->isa;
}

- (void)setValue:(id)a3
{
  const __CFString *v4;
  StringImpl *v5;
  void *v6;
  WTF::StringImpl *v7;
  _BYTE v8[80];
  WTF::StringImpl *v9;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)a3, v4);
  v7 = v9;
  WebCore::DOMTokenList::setValue();
  if (!v7)
    goto LABEL_4;
  if (*(_DWORD *)v7 != 2)
  {
    *(_DWORD *)v7 -= 2;
LABEL_4:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v5);
    return;
  }
  WTF::StringImpl::destroy(v7, v5);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v6);
}

- (id)item:(unsigned int)a3
{
  uint64_t v5;
  void *v6;
  _QWORD *v7;
  const __CFString *v8;
  _BYTE v10[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  v5 = WebCore::DOMTokenList::tokens(self->super._internal);
  if (*(_DWORD *)(v5 + 12) <= a3)
    v7 = (_QWORD *)MEMORY[0x1E0CBF2F8];
  else
    v7 = (_QWORD *)(*(_QWORD *)v5 + 8 * a3);
  if (*v7)
    v8 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v8 = &stru_1E9D6EC48;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v6);
  return (id)v8;
}

- (BOOL)contains:(id)a3
{
  const __CFString *v4;
  StringImpl *v5;
  char v6;
  WTF::StringImpl *v8;
  _BYTE v9[80];
  WTF::StringImpl *v10;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)a3, v4);
  v8 = v10;
  v6 = WebCore::DOMTokenList::contains();
  if (v8)
  {
    if (*(_DWORD *)v8 == 2)
      WTF::StringImpl::destroy(v8, v5);
    else
      *(_DWORD *)v8 -= 2;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v5);
  return v6;
}

- (BOOL)toggle:(id)a3 force:(BOOL)a4
{
  const __CFString *v5;
  StringImpl *v6;
  BOOL result;
  WTF::StringImpl *v8;
  char v9;
  uint64_t v10;
  int v11;
  _BYTE v12[80];
  WTF::StringImpl *v13;
  uint64_t v14;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)a3, v5);
  v8 = v13;
  WebCore::DOMTokenList::toggle();
  if (v11)
  {
    if (v11 == 1)
    {
      LOBYTE(v13) = v9;
      v14 = v10;
      raiseDOMErrorException();
    }
    result = std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
  }
  else
  {
    if (v8)
    {
      if (*(_DWORD *)v8 == 2)
        WTF::StringImpl::destroy(v8, v6);
      else
        *(_DWORD *)v8 -= 2;
    }
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12, v6);
    return v9 != 0;
  }
  return result;
}

@end
