@implementation DOMHTMLMetaElement

- (NSString)content
{
  void *v2;
  const __CFString *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  if (*(_QWORD *)WebCore::Element::getAttribute())
    v3 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v3 = &stru_1E9D6EC48;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v2);
  return &v3->isa;
}

- (void)setContent:(NSString *)content
{
  const __CFString *v4;
  StringImpl *v5;
  void *v6;
  WTF::StringImpl *v7;
  _BYTE v8[80];
  WTF::StringImpl *v9;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)content, v4);
  v7 = v9;
  WebCore::Element::setAttributeWithoutSynchronization();
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

- (NSString)httpEquiv
{
  void *v2;
  const __CFString *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  if (*(_QWORD *)WebCore::Element::getAttribute())
    v3 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v3 = &stru_1E9D6EC48;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v2);
  return &v3->isa;
}

- (void)setHttpEquiv:(NSString *)httpEquiv
{
  const __CFString *v4;
  StringImpl *v5;
  void *v6;
  WTF::StringImpl *v7;
  _BYTE v8[80];
  WTF::StringImpl *v9;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)httpEquiv, v4);
  v7 = v9;
  WebCore::Element::setAttributeWithoutSynchronization();
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

- (NSString)name
{
  void *v3;
  uint64_t v4;
  unsigned int v5;
  const __CFString *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v12[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12);
  v4 = *((_QWORD *)self->super.super.super.super._internal + 13);
  if (v4)
  {
    v5 = *(_DWORD *)(v4 + 4);
    if ((v5 & 2) != 0)
    {
      if ((v5 & 1) != 0)
      {
        v7 = *(uint64_t **)(v4 + 40);
        LODWORD(v8) = *(_DWORD *)(v4 + 52);
        if (!(_DWORD)v8)
        {
LABEL_15:
          v7 = 0;
          goto LABEL_16;
        }
      }
      else
      {
        v7 = (uint64_t *)(v4 + 32);
        LODWORD(v8) = v5 >> 5;
        if (!(_DWORD)v8)
          goto LABEL_15;
      }
      v9 = *MEMORY[0x1E0DD60E0];
      v8 = v8;
      while (1)
      {
        v10 = *v7;
        if (*v7 == v9 || *(_QWORD *)(v10 + 24) == *(_QWORD *)(v9 + 24) && *(_QWORD *)(v10 + 32) == *(_QWORD *)(v9 + 32))
          break;
        v7 += 2;
        if (!--v8)
          goto LABEL_15;
      }
LABEL_16:
      if (v7[1])
        goto LABEL_4;
LABEL_17:
      v6 = &stru_1E9D6EC48;
      goto LABEL_18;
    }
  }
  if (!*MEMORY[0x1E0CBF2F8])
    goto LABEL_17;
LABEL_4:
  v6 = (const __CFString *)WTF::StringImpl::operator NSString *();
LABEL_18:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12, v3);
  return &v6->isa;
}

- (void)setName:(NSString *)name
{
  const __CFString *v4;
  StringImpl *v5;
  void *v6;
  WTF::StringImpl *v7;
  _BYTE v8[80];
  WTF::StringImpl *v9;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)name, v4);
  v7 = v9;
  WebCore::Element::setAttributeWithoutSynchronization();
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

- (NSString)scheme
{
  void *v2;
  const __CFString *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  if (*(_QWORD *)WebCore::Element::getAttribute())
    v3 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v3 = &stru_1E9D6EC48;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v2);
  return &v3->isa;
}

- (void)setScheme:(NSString *)scheme
{
  const __CFString *v4;
  StringImpl *v5;
  void *v6;
  WTF::StringImpl *v7;
  _BYTE v8[80];
  WTF::StringImpl *v9;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)scheme, v4);
  v7 = v9;
  WebCore::Element::setAttributeWithoutSynchronization();
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

@end
