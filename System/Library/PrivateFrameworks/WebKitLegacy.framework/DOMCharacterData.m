@implementation DOMCharacterData

- (NSString)data
{
  void *v3;
  const __CFString *v4;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  if (*((_QWORD *)self->super.super._internal + 10))
    v4 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v4 = &stru_1E9D6EC48;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v3);
  return &v4->isa;
}

- (void)setData:(NSString *)data
{
  DOMObjectInternal *internal;
  StringImpl *v6;
  WTF::StringImpl *v7;
  void *v8;
  WTF::StringImpl *v9;
  _BYTE v10[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  internal = self->super.super._internal;
  MEMORY[0x1D82A3998](&v9, data);
  WebCore::CharacterData::setData(internal, (const WTF::String *)&v9);
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
  uint64_t v4;
  unsigned int v5;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  v4 = *((_QWORD *)self->super.super._internal + 10);
  if (v4)
    v5 = *(_DWORD *)(v4 + 4);
  else
    v5 = 0;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v3);
  return v5;
}

- (id)previousElementSibling
{
  WebCore::Node *v3;
  WebCore::Node *v4;
  void *v5;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  v3 = (WebCore::Node *)WebCore::Node::previousElementSibling(self->super.super._internal);
  v4 = kit(v3);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
  return v4;
}

- (id)nextElementSibling
{
  WebCore::Node *ElementSibling;
  WebCore::Node *v4;
  void *v5;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  ElementSibling = (WebCore::Node *)WebCore::Node::nextElementSibling(self->super.super._internal);
  v4 = kit(ElementSibling);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
  return v4;
}

- (NSString)substringData:(unsigned int)offset length:(unsigned int)length
{
  WTF::StringImpl *v5;
  StringImpl *v6;
  const __CFString *v7;
  uint64_t v8;
  NSString *result;
  uint64_t v10;
  WTF::StringImpl *v11;
  uint64_t v12;
  unsigned int v13;
  _BYTE v14[80];
  _BYTE v15[8];
  uint64_t v16;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v14);
  WebCore::CharacterData::substringData(self->super.super._internal);
  if (!v13)
  {
    v5 = v11;
    v11 = 0;
    if (v5)
    {
      v7 = (const __CFString *)WTF::StringImpl::operator NSString *();
      if (*(_DWORD *)v5 == 2)
      {
        WTF::StringImpl::destroy(v5, v6);
        v8 = v13;
      }
      else
      {
        *(_DWORD *)v5 -= 2;
        v8 = v13;
        if (v13 == -1)
          goto LABEL_8;
      }
    }
    else
    {
      v7 = &stru_1E9D6EC48;
      v8 = v13;
    }
    ((void (*)(_BYTE *, WTF::StringImpl **))off_1E9D6AD18[v8])(v15, &v11);
LABEL_8:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v14, v6);
    return &v7->isa;
  }
  if (v13 == 1)
  {
    v15[0] = (_BYTE)v11;
    v10 = v12;
    v12 = 0;
    v16 = v10;
    raiseDOMErrorException();
  }
  result = (NSString *)std::__throw_bad_variant_access[abi:sn180100]();
  __break(1u);
  return result;
}

- (void)appendData:(NSString *)data
{
  DOMObjectInternal *internal;
  StringImpl *v6;
  WTF::StringImpl *v7;
  void *v8;
  WTF::StringImpl *v9;
  _BYTE v10[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  internal = self->super.super._internal;
  MEMORY[0x1D82A3998](&v9, data);
  WebCore::CharacterData::appendData(internal, (const WTF::String *)&v9);
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

- (void)insertData:(unsigned int)offset data:(NSString *)data
{
  uint64_t v5;
  DOMObjectInternal *internal;
  StringImpl *v8;
  WTF::StringImpl *v9;
  uint64_t v10;
  WTF::StringImpl *v11;
  char v12;
  uint64_t v13;
  char v14;
  _BYTE v15[88];
  uint64_t v16;

  v5 = *(_QWORD *)&offset;
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15);
  internal = self->super.super._internal;
  MEMORY[0x1D82A3998](&v11, data);
  WebCore::CharacterData::insertData(internal, v5, (const WTF::String *)&v11);
  if (v14)
  {
    v15[80] = v12;
    v10 = v13;
    v13 = 0;
    v16 = v10;
    raiseDOMErrorException();
  }
  v9 = v11;
  v11 = 0;
  if (v9)
  {
    if (*(_DWORD *)v9 == 2)
      WTF::StringImpl::destroy(v9, v8);
    else
      *(_DWORD *)v9 -= 2;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15, v8);
}

- (void)deleteData:(unsigned int)offset length:(unsigned int)length
{
  void *v5;
  char v6;
  uint64_t v7;
  char v8;
  _BYTE v9[88];
  uint64_t v10;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  WebCore::CharacterData::deleteData(self->super.super._internal);
  if (v8)
  {
    v9[80] = v6;
    v10 = v7;
    raiseDOMErrorException();
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v5);
}

- (void)replaceData:(unsigned int)offset length:(unsigned int)length data:(NSString *)data
{
  uint64_t v6;
  uint64_t v7;
  DOMObjectInternal *internal;
  StringImpl *v10;
  WTF::StringImpl *v11;
  uint64_t v12;
  WTF::StringImpl *v13;
  char v14;
  uint64_t v15;
  char v16;
  _BYTE v17[88];
  uint64_t v18;

  v6 = *(_QWORD *)&length;
  v7 = *(_QWORD *)&offset;
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v17);
  internal = self->super.super._internal;
  MEMORY[0x1D82A3998](&v13, data);
  WebCore::CharacterData::replaceData(internal, v7, v6, (const WTF::String *)&v13);
  if (v16)
  {
    v17[80] = v14;
    v12 = v15;
    v15 = 0;
    v18 = v12;
    raiseDOMErrorException();
  }
  v11 = v13;
  v13 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2)
      WTF::StringImpl::destroy(v11, v10);
    else
      *(_DWORD *)v11 -= 2;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v17, v10);
}

- (void)remove
{
  void *v3;
  char v4;
  uint64_t v5;
  char v6;
  _BYTE v7[88];
  uint64_t v8;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  WebCore::Node::remove(self->super.super._internal);
  if (v6)
  {
    v7[80] = v4;
    v8 = v5;
    raiseDOMErrorException();
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v3);
}

@end
