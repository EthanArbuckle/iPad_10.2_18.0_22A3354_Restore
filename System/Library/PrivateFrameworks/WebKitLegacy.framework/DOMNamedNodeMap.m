@implementation DOMNamedNodeMap

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
      WebCore::NamedNodeMap::deref(internal);
    v5.receiver = self;
    v5.super_class = (Class)DOMNamedNodeMap;
    -[DOMObject dealloc](&v5, sel_dealloc);
  }
}

- (unsigned)length
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LODWORD(self) = WebCore::NamedNodeMap::length(self->super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return self;
}

- (DOMNode)getNamedItem:(NSString *)name
{
  const __CFString *v4;
  StringImpl *v5;
  DOMNode *v6;
  WTF::StringImpl *v8;
  WebCore::Node *v9;
  _BYTE v10[80];
  WTF::StringImpl *v11;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)name, v4);
  v8 = v11;
  WebCore::NamedNodeMap::getNamedItem();
  v6 = (DOMNode *)kit(v9);
  if (v9)
  {
    if (*((_DWORD *)v9 + 6) == 2)
    {
      if ((*((_WORD *)v9 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v9);
    }
    else
    {
      *((_DWORD *)v9 + 6) -= 2;
    }
  }
  if (v8)
  {
    if (*(_DWORD *)v8 == 2)
      WTF::StringImpl::destroy(v8, v5);
    else
      *(_DWORD *)v8 -= 2;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v5);
  return v6;
}

- (DOMNode)setNamedItem:(DOMNode *)node
{
  DOMObjectInternal *internal;
  WebCore::Node *v5;
  void *v6;
  DOMNode *v7;
  uint64_t v9;
  WebCore::Node *v10;
  uint64_t v11;
  int v12;
  _BYTE v13[80];
  _BYTE v14[8];
  uint64_t v15;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13);
  if (!node)
    raiseTypeErrorException();
  internal = node->super._internal;
  if (((*(uint64_t (**)(DOMObjectInternal *))(*(_QWORD *)internal + 184))(internal) & 1) == 0)
    raiseTypeErrorException();
  if (((*(uint64_t (**)(DOMObjectInternal *))(*(_QWORD *)internal + 184))(internal) & 1) == 0)
  {
    __break(0xC471u);
    goto LABEL_19;
  }
  WebCore::NamedNodeMap::setNamedItem();
  if (v12)
  {
    if (v12 == 1)
    {
      v14[0] = (_BYTE)v10;
      v9 = v11;
      v11 = 0;
      v15 = v9;
      raiseDOMErrorException();
    }
    std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
LABEL_19:
    JUMPOUT(0x1D8029594);
  }
  v5 = v10;
  v10 = 0;
  v7 = (DOMNode *)kit(v5);
  if (v5)
  {
    if (*((_DWORD *)v5 + 6) == 2)
    {
      if ((*((_WORD *)v5 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v5);
    }
    else
    {
      *((_DWORD *)v5 + 6) -= 2;
    }
  }
  if (v12 != -1)
    ((void (*)(_BYTE *, WebCore::Node **))off_1E9D6AEF0[v12])(v14, &v10);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v13, v6);
  return v7;
}

- (DOMNode)removeNamedItem:(NSString *)name
{
  const __CFString *v4;
  WebCore::Node *v5;
  StringImpl *v6;
  DOMNode *v7;
  DOMNode *result;
  uint64_t v9;
  WTF::StringImpl *v10;
  WebCore::Node *v11;
  uint64_t v12;
  int v13;
  WebCore::Node *v14;
  _BYTE v15[80];
  _QWORD v16[2];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)name, v4);
  v10 = (WTF::StringImpl *)v16[0];
  WebCore::NamedNodeMap::removeNamedItem();
  if (v13)
  {
    if (v13 == 1)
    {
      LOBYTE(v16[0]) = (_BYTE)v11;
      v9 = v12;
      v12 = 0;
      v16[1] = v9;
      raiseDOMErrorException();
    }
    result = (DOMNode *)std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
  }
  else
  {
    v5 = v11;
    v11 = 0;
    v14 = v5;
    v7 = (DOMNode *)kit(v5);
    if (v5)
    {
      if (*((_DWORD *)v5 + 6) == 2)
      {
        if ((*((_WORD *)v5 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v5);
      }
      else
      {
        *((_DWORD *)v5 + 6) -= 2;
      }
    }
    if (v13 != -1)
      ((void (*)(_QWORD *, WebCore::Node **))off_1E9D6AF00[v13])(v16, &v11);
    v13 = -1;
    if (v10)
    {
      if (*(_DWORD *)v10 == 2)
        WTF::StringImpl::destroy(v10, v6);
      else
        *(_DWORD *)v10 -= 2;
    }
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15, v6);
    return v7;
  }
  return result;
}

- (DOMNode)item:(unsigned int)index
{
  void *v4;
  DOMNode *v5;
  WebCore::Node *v7;
  _BYTE v8[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::NamedNodeMap::item(self->super._internal);
  v5 = (DOMNode *)kit(v7);
  if (v7)
  {
    if (*((_DWORD *)v7 + 6) == 2)
    {
      if ((*((_WORD *)v7 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v7);
    }
    else
    {
      *((_DWORD *)v7 + 6) -= 2;
    }
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v4);
  return v5;
}

- (DOMNode)getNamedItemNS:(NSString *)namespaceURI localName:(NSString *)localName
{
  const __CFString *v6;
  const __CFString *v7;
  StringImpl *v8;
  DOMNode *v9;
  WTF::StringImpl *v10;
  WTF::StringImpl *v12;
  WTF::StringImpl *v13;
  WebCore::Node *v14;
  _BYTE v15[80];
  WTF::StringImpl *v16;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)namespaceURI, v6);
  v13 = v16;
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)localName, v7);
  v12 = v16;
  WebCore::NamedNodeMap::getNamedItemNS();
  v9 = (DOMNode *)kit(v14);
  if (v14)
  {
    if (*((_DWORD *)v14 + 6) == 2)
    {
      if ((*((_WORD *)v14 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v14);
    }
    else
    {
      *((_DWORD *)v14 + 6) -= 2;
    }
  }
  if (v12)
  {
    if (*(_DWORD *)v12 == 2)
    {
      WTF::StringImpl::destroy(v12, v8);
      v10 = v13;
      if (!v13)
        goto LABEL_15;
      goto LABEL_12;
    }
    *(_DWORD *)v12 -= 2;
  }
  v10 = v13;
  if (!v13)
    goto LABEL_15;
LABEL_12:
  if (*(_DWORD *)v10 == 2)
    WTF::StringImpl::destroy(v10, v8);
  else
    *(_DWORD *)v10 -= 2;
LABEL_15:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15, v8);
  return v9;
}

- (DOMNode)removeNamedItemNS:(NSString *)namespaceURI localName:(NSString *)localName
{
  const __CFString *v6;
  const __CFString *v7;
  WebCore::Node *v8;
  StringImpl *v9;
  DOMNode *v10;
  WTF::StringImpl *v11;
  DOMNode *result;
  uint64_t v13;
  WTF::StringImpl *v14;
  WTF::StringImpl *v15;
  WebCore::Node *v16;
  uint64_t v17;
  int v18;
  WebCore::Node *v19;
  _BYTE v20[80];
  _QWORD v21[2];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v20);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)namespaceURI, v6);
  v15 = (WTF::StringImpl *)v21[0];
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)localName, v7);
  v14 = (WTF::StringImpl *)v21[0];
  WebCore::NamedNodeMap::removeNamedItemNS();
  if (!v18)
  {
    v8 = v16;
    v16 = 0;
    v19 = v8;
    v10 = (DOMNode *)kit(v8);
    if (v8)
    {
      if (*((_DWORD *)v8 + 6) == 2)
      {
        if ((*((_WORD *)v8 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v8);
      }
      else
      {
        *((_DWORD *)v8 + 6) -= 2;
      }
    }
    if (v18 != -1)
      ((void (*)(_QWORD *, WebCore::Node **))off_1E9D6AF00[v18])(v21, &v16);
    v18 = -1;
    if (v14)
    {
      if (*(_DWORD *)v14 == 2)
      {
        WTF::StringImpl::destroy(v14, v9);
        v11 = v15;
        if (!v15)
        {
LABEL_18:
          WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v20, v9);
          return v10;
        }
LABEL_15:
        if (*(_DWORD *)v11 == 2)
          WTF::StringImpl::destroy(v11, v9);
        else
          *(_DWORD *)v11 -= 2;
        goto LABEL_18;
      }
      *(_DWORD *)v14 -= 2;
    }
    v11 = v15;
    if (!v15)
      goto LABEL_18;
    goto LABEL_15;
  }
  if (v18 == 1)
  {
    LOBYTE(v21[0]) = (_BYTE)v16;
    v13 = v17;
    v17 = 0;
    v21[1] = v13;
    raiseDOMErrorException();
  }
  result = (DOMNode *)std::__throw_bad_variant_access[abi:sn180100]();
  __break(1u);
  return result;
}

@end
