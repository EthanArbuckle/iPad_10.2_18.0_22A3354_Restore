@implementation DOMDocumentFragment

- (id)children
{
  void *v3;
  id v4;
  DOMObjectInternal *v6;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  WebCore::ContainerNode::children(self->super.super._internal);
  v4 = kit(v6);
  if (v6)
  {
    if (*((_DWORD *)v6 + 4) == 1)
      (*(void (**)())(*(_QWORD *)v6 + 8))();
    else
      --*((_DWORD *)v6 + 4);
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v3);
  return v4;
}

- (id)firstElementChild
{
  WebCore::Node *ElementChild;
  WebCore::Node *v4;
  void *v5;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  ElementChild = (WebCore::Node *)WebCore::ContainerNode::firstElementChild(self->super.super._internal);
  v4 = kit(ElementChild);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
  return v4;
}

- (id)lastElementChild
{
  WebCore::Node *ElementChild;
  WebCore::Node *v4;
  void *v5;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  ElementChild = (WebCore::Node *)WebCore::ContainerNode::lastElementChild(self->super.super._internal);
  v4 = kit(ElementChild);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
  return v4;
}

- (unsigned)childElementCount
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = WebCore::ContainerNode::childElementCount(self->super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return self;
}

- (id)getElementById:(id)a3
{
  const __CFString *v4;
  WebCore::Node *ElementById;
  StringImpl *v6;
  WebCore::Node *v7;
  WTF::StringImpl *v9;
  _BYTE v10[80];
  WTF::StringImpl *v11;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)a3, v4);
  v9 = v11;
  ElementById = (WebCore::Node *)WebCore::DocumentFragment::getElementById();
  v7 = kit(ElementById);
  if (v9)
  {
    if (*(_DWORD *)v9 == 2)
      WTF::StringImpl::destroy(v9, v6);
    else
      *(_DWORD *)v9 -= 2;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v6);
  return v7;
}

- (id)querySelector:(id)a3
{
  DOMObjectInternal *internal;
  StringImpl *v6;
  WebCore::Node *v7;
  WTF::StringImpl *v8;
  id result;
  uint64_t v10;
  WTF::StringImpl *v11;
  WebCore::Node *v12;
  uint64_t v13;
  int v14;
  _BYTE v15[80];
  _BYTE v16[8];
  uint64_t v17;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15);
  internal = self->super.super._internal;
  MEMORY[0x1D82A3998](&v11, a3);
  WebCore::ContainerNode::querySelector(internal, (const WTF::String *)&v11);
  if (v14)
  {
    if (v14 == 1)
    {
      v16[0] = (_BYTE)v12;
      v10 = v13;
      v13 = 0;
      v17 = v10;
      raiseDOMErrorException();
    }
    result = (id)std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
  }
  else
  {
    v7 = kit(v12);
    if (v14 != -1)
      ((void (*)(_BYTE *, WebCore::Node **))off_1E9D6ADD8[v14])(v16, &v12);
    v14 = -1;
    v8 = v11;
    v11 = 0;
    if (v8)
    {
      if (*(_DWORD *)v8 == 2)
        WTF::StringImpl::destroy(v8, v6);
      else
        *(_DWORD *)v8 -= 2;
    }
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15, v6);
    return v7;
  }
  return result;
}

- (id)querySelectorAll:(id)a3
{
  DOMObjectInternal *internal;
  DOMObjectInternal *v6;
  StringImpl *v7;
  DOMObjectInternal *v8;
  uint64_t v9;
  WTF::StringImpl *v10;
  id result;
  uint64_t v12;
  WTF::StringImpl *v13;
  DOMObjectInternal *v14;
  uint64_t v15;
  unsigned int v16;
  _BYTE v17[80];
  char v18[8];
  uint64_t v19;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v17);
  internal = self->super.super._internal;
  MEMORY[0x1D82A3998](&v13, a3);
  WebCore::ContainerNode::querySelectorAll(internal, (const WTF::String *)&v13);
  if (!v16)
  {
    v6 = v14;
    v14 = 0;
    v8 = kit(v6);
    if (v6)
    {
      if (*((_DWORD *)v6 + 4) == 1)
      {
        (*(void (**)(DOMObjectInternal *))(*(_QWORD *)v6 + 8))(v6);
        v9 = v16;
        if (v16 == -1)
          goto LABEL_7;
        goto LABEL_6;
      }
      --*((_DWORD *)v6 + 4);
    }
    v9 = v16;
    if (v16 == -1)
    {
LABEL_7:
      v16 = -1;
      v10 = v13;
      v13 = 0;
      if (v10)
      {
        if (*(_DWORD *)v10 == 2)
          WTF::StringImpl::destroy(v10, v7);
        else
          *(_DWORD *)v10 -= 2;
      }
      WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v17, v7);
      return v8;
    }
LABEL_6:
    ((void (*)(char *, DOMObjectInternal **))off_1E9D6ADE8[v9])(v18, &v14);
    goto LABEL_7;
  }
  if (v16 == 1)
  {
    v18[0] = (char)v14;
    v12 = v15;
    v15 = 0;
    v19 = v12;
    raiseDOMErrorException();
  }
  result = (id)std::__throw_bad_variant_access[abi:sn180100]();
  __break(1u);
  return result;
}

@end
