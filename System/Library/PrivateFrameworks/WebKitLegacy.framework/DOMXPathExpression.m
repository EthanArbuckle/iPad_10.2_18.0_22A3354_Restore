@implementation DOMXPathExpression

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
        WebCore::XPathExpression::~XPathExpression(internal);
        WTF::fastFree(v5, v6);
      }
      else
      {
        --*(_DWORD *)internal;
      }
    }
    v7.receiver = self;
    v7.super_class = (Class)DOMXPathExpression;
    -[DOMObject dealloc](&v7, sel_dealloc);
  }
}

- (DOMXPathResult)evaluate:(DOMNode *)contextNode type:(unsigned __int16)type inResult:(DOMXPathResult *)inResult
{
  uint64_t v6;
  DOMObjectInternal *internal;
  DOMXPathResult *result;
  DOMObjectInternal *v11;
  void *v12;
  DOMObjectInternal *v13;
  uint64_t v14;
  WTF *v15;
  void *v16;
  uint64_t v17;
  WebCore::XPathResult *v18;
  uint64_t v19;
  unsigned int v20;
  DOMObjectInternal *v21;
  _BYTE v22[80];
  _BYTE v23[8];
  uint64_t v24;

  if (!contextNode)
    return 0;
  v6 = type;
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v22);
  if (inResult)
    internal = inResult->super._internal;
  else
    internal = 0;
  WebCore::XPathExpression::evaluate(self->super._internal, (Node *)contextNode->super._internal, v6, internal);
  if (!v20)
  {
    v11 = v18;
    v18 = 0;
    v21 = v11;
    v13 = kit(v11);
    if (v11)
    {
      if (*(_DWORD *)v11 == 1)
      {
        v15 = (WTF *)MEMORY[0x1D82A3FE0](v11);
        WTF::fastFree(v15, v16);
        v14 = v20;
        goto LABEL_11;
      }
      --*(_DWORD *)v11;
    }
    v14 = v20;
    if (v20 == -1)
    {
LABEL_12:
      WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v22, v12);
      return (DOMXPathResult *)v13;
    }
LABEL_11:
    ((void (*)(_BYTE *, WebCore::XPathResult **))off_1E9D6B000[v14])(v23, &v18);
    goto LABEL_12;
  }
  if (v20 == 1)
  {
    v23[0] = (_BYTE)v18;
    v17 = v19;
    v19 = 0;
    v24 = v17;
    raiseDOMErrorException();
  }
  result = (DOMXPathResult *)std::__throw_bad_variant_access[abi:sn180100]();
  __break(1u);
  return result;
}

@end
