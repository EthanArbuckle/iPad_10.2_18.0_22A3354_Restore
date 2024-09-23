@implementation DOMXPathResult

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
        v5 = (WTF *)MEMORY[0x1D82A3FE0]();
        WTF::fastFree(v5, v6);
      }
      else
      {
        --*(_DWORD *)internal;
      }
    }
    v7.receiver = self;
    v7.super_class = (Class)DOMXPathResult;
    -[DOMObject dealloc](&v7, sel_dealloc);
  }
}

- (unsigned)resultType
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LOWORD(self) = WebCore::XPathResult::resultType(self->super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (unsigned __int16)self;
}

- (double)numberValue
{
  void *v3;
  double result;
  double v5;
  uint64_t v6;
  int v7;
  _BYTE v8[88];
  uint64_t v9;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::XPathResult::numberValue(self->super._internal);
  if (v7)
  {
    if (v7 == 1)
    {
      v8[80] = LOBYTE(v5);
      v9 = v6;
      raiseDOMErrorException();
    }
    std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
  }
  else
  {
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
    return v5;
  }
  return result;
}

- (NSString)stringValue
{
  WTF::StringImpl *v3;
  StringImpl *v4;
  const __CFString *v5;
  uint64_t v6;
  NSString *result;
  uint64_t v8;
  WTF::StringImpl *v9;
  uint64_t v10;
  unsigned int v11;
  _BYTE v12[80];
  _BYTE v13[8];
  uint64_t v14;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12);
  WebCore::XPathResult::stringValue(self->super._internal);
  if (!v11)
  {
    v3 = v9;
    v9 = 0;
    if (v3)
    {
      v5 = (const __CFString *)WTF::StringImpl::operator NSString *();
      if (*(_DWORD *)v3 == 2)
      {
        WTF::StringImpl::destroy(v3, v4);
        v6 = v11;
      }
      else
      {
        *(_DWORD *)v3 -= 2;
        v6 = v11;
        if (v11 == -1)
          goto LABEL_8;
      }
    }
    else
    {
      v5 = &stru_1E9D6EC48;
      v6 = v11;
    }
    ((void (*)(_BYTE *, WTF::StringImpl **))off_1E9D6B020[v6])(v13, &v9);
LABEL_8:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v12, v4);
    return &v5->isa;
  }
  if (v11 == 1)
  {
    v13[0] = (_BYTE)v9;
    v8 = v10;
    v10 = 0;
    v14 = v8;
    raiseDOMErrorException();
  }
  result = (NSString *)std::__throw_bad_variant_access[abi:sn180100]();
  __break(1u);
  return result;
}

- (BOOL)BOOLeanValue
{
  void *v3;
  BOOL result;
  BOOL v5;
  uint64_t v6;
  int v7;
  _BYTE v8[88];
  uint64_t v9;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::XPathResult::BOOLeanValue(self->super._internal);
  if (v7)
  {
    if (v7 == 1)
    {
      v8[80] = v5;
      v9 = v6;
      raiseDOMErrorException();
    }
    result = std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
  }
  else
  {
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
    return v5;
  }
  return result;
}

- (DOMNode)singleNodeValue
{
  DOMNode *v3;
  void *v4;
  DOMNode *result;
  uint64_t v6;
  WebCore::Node *v7;
  uint64_t v8;
  int v9;
  _BYTE v10[80];
  _BYTE v11[8];
  uint64_t v12;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  WebCore::XPathResult::singleNodeValue(self->super._internal);
  if (v9)
  {
    if (v9 == 1)
    {
      v11[0] = (_BYTE)v7;
      v6 = v8;
      v8 = 0;
      v12 = v6;
      raiseDOMErrorException();
    }
    result = (DOMNode *)std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
  }
  else
  {
    v3 = (DOMNode *)kit(v7);
    ((void (*)(_BYTE *, WebCore::Node **))off_1E9D6B040[v9])(v11, &v7);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v4);
    return v3;
  }
  return result;
}

- (BOOL)invalidIteratorState
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LOBYTE(self) = WebCore::XPathResult::invalidIteratorState(self->super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (char)self;
}

- (unsigned)snapshotLength
{
  void *v3;
  unsigned int result;
  unsigned int v5;
  uint64_t v6;
  int v7;
  _BYTE v8[88];
  uint64_t v9;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::XPathResult::snapshotLength(self->super._internal);
  if (v7)
  {
    if (v7 == 1)
    {
      v8[80] = v5;
      v9 = v6;
      raiseDOMErrorException();
    }
    result = std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
  }
  else
  {
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
    return v5;
  }
  return result;
}

- (DOMNode)iterateNext
{
  DOMNode *v3;
  void *v4;
  DOMNode *result;
  uint64_t v6;
  WebCore::Node *v7;
  uint64_t v8;
  int v9;
  _BYTE v10[80];
  _BYTE v11[8];
  uint64_t v12;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  WebCore::XPathResult::iterateNext(self->super._internal);
  if (v9)
  {
    if (v9 == 1)
    {
      v11[0] = (_BYTE)v7;
      v6 = v8;
      v8 = 0;
      v12 = v6;
      raiseDOMErrorException();
    }
    result = (DOMNode *)std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
  }
  else
  {
    v3 = (DOMNode *)kit(v7);
    ((void (*)(_BYTE *, WebCore::Node **))off_1E9D6B040[v9])(v11, &v7);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v4);
    return v3;
  }
  return result;
}

- (DOMNode)snapshotItem:(unsigned int)index
{
  DOMNode *v4;
  void *v5;
  DOMNode *result;
  uint64_t v7;
  WebCore::Node *v8;
  uint64_t v9;
  int v10;
  _BYTE v11[80];
  _BYTE v12[8];
  uint64_t v13;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11);
  WebCore::XPathResult::snapshotItem(self->super._internal);
  if (v10)
  {
    if (v10 == 1)
    {
      v12[0] = (_BYTE)v8;
      v7 = v9;
      v9 = 0;
      v13 = v7;
      raiseDOMErrorException();
    }
    result = (DOMNode *)std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
  }
  else
  {
    v4 = (DOMNode *)kit(v8);
    ((void (*)(_BYTE *, WebCore::Node **))off_1E9D6B040[v10])(v12, &v8);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11, v5);
    return v4;
  }
  return result;
}

@end
