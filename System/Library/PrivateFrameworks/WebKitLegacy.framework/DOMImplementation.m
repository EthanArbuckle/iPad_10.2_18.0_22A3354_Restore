@implementation DOMImplementation

- (void)dealloc
{
  objc_class *v3;
  DOMObjectInternal *internal;
  uint64_t v5;
  objc_super v6;

  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainThread(v3, (objc_object *)self) & 1) == 0)
  {
    internal = self->super._internal;
    if (internal)
    {
      v5 = *(_QWORD *)(*((_QWORD *)internal + 1) + 8);
      if (*(_DWORD *)(v5 + 24) == 2)
      {
        if ((*(_WORD *)(v5 + 30) & 0x400) == 0)
          WebCore::Node::removedLastRef((WebCore::Node *)v5);
      }
      else
      {
        *(_DWORD *)(v5 + 24) -= 2;
      }
    }
    v6.receiver = self;
    v6.super_class = (Class)DOMImplementation;
    -[DOMObject dealloc](&v6, sel_dealloc);
  }
}

- (BOOL)hasFeature:(NSString *)feature version:(NSString *)version
{
  const WTF::String *v5;
  StringImpl *v6;
  char hasFeatureForLegacyBindings;
  WTF::StringImpl *v8;
  WTF::StringImpl *v9;
  WTF::StringImpl *v11;
  WTF::StringImpl *v12;

  MEMORY[0x1D82A3998](&v12, feature);
  MEMORY[0x1D82A3998](&v11, version);
  hasFeatureForLegacyBindings = WebCore::SVGTests::hasFeatureForLegacyBindings((WebCore::SVGTests *)&v12, (const WTF::String *)&v11, v5);
  v8 = v11;
  v11 = 0;
  if (!v8)
  {
LABEL_4:
    v9 = v12;
    v12 = 0;
    if (!v9)
      return hasFeatureForLegacyBindings;
    goto LABEL_7;
  }
  if (*(_DWORD *)v8 != 2)
  {
    *(_DWORD *)v8 -= 2;
    goto LABEL_4;
  }
  WTF::StringImpl::destroy(v8, v6);
  v9 = v12;
  v12 = 0;
  if (!v9)
    return hasFeatureForLegacyBindings;
LABEL_7:
  if (*(_DWORD *)v9 != 2)
  {
    *(_DWORD *)v9 -= 2;
    return hasFeatureForLegacyBindings;
  }
  WTF::StringImpl::destroy(v9, v6);
  return hasFeatureForLegacyBindings;
}

- (DOMDocumentType)createDocumentType:(NSString *)qualifiedName publicId:(NSString *)publicId systemId:(NSString *)systemId
{
  const __CFString *v8;
  WebCore::Node *v9;
  StringImpl *v10;
  DOMDocumentType *v11;
  WTF::StringImpl *v12;
  WTF::StringImpl *v13;
  WTF::StringImpl *v14;
  DOMDocumentType *result;
  uint64_t v16;
  WTF::StringImpl *v17;
  WTF::StringImpl *v18;
  WTF::StringImpl *v19;
  WebCore::Node *v20;
  uint64_t v21;
  int v22;
  WebCore::Node *v23;
  _BYTE v24[80];
  _QWORD v25[2];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v24);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)qualifiedName, v8);
  v19 = (WTF::StringImpl *)v25[0];
  MEMORY[0x1D82A3998](&v18, publicId);
  MEMORY[0x1D82A3998](&v17, systemId);
  WebCore::DOMImplementation::createDocumentType();
  if (!v22)
  {
    v9 = v20;
    v20 = 0;
    v23 = v9;
    v11 = (DOMDocumentType *)kit(v9);
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
    if (v22 != -1)
      ((void (*)(_QWORD *, WebCore::Node **))off_1E9D6AED0[v22])(v25, &v20);
    v22 = -1;
    v12 = v17;
    v17 = 0;
    if (v12)
    {
      if (*(_DWORD *)v12 == 2)
      {
        WTF::StringImpl::destroy(v12, v10);
        v13 = v18;
        v18 = 0;
        if (!v13)
          goto LABEL_17;
LABEL_15:
        if (*(_DWORD *)v13 == 2)
        {
          WTF::StringImpl::destroy(v13, v10);
          v14 = v19;
          v19 = 0;
          if (!v14)
          {
LABEL_23:
            WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v24, v10);
            return v11;
          }
LABEL_20:
          if (*(_DWORD *)v14 == 2)
            WTF::StringImpl::destroy(v14, v10);
          else
            *(_DWORD *)v14 -= 2;
          goto LABEL_23;
        }
        *(_DWORD *)v13 -= 2;
LABEL_17:
        v14 = v19;
        v19 = 0;
        if (!v14)
          goto LABEL_23;
        goto LABEL_20;
      }
      *(_DWORD *)v12 -= 2;
    }
    v13 = v18;
    v18 = 0;
    if (!v13)
      goto LABEL_17;
    goto LABEL_15;
  }
  if (v22 == 1)
  {
    LOBYTE(v25[0]) = (_BYTE)v20;
    v16 = v21;
    v21 = 0;
    v25[1] = v16;
    raiseDOMErrorException();
  }
  result = (DOMDocumentType *)std::__throw_bad_variant_access[abi:sn180100]();
  __break(1u);
  return result;
}

- (DOMDocument)createDocument:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName doctype:(DOMDocumentType *)doctype
{
  const __CFString *v7;
  const __CFString *v8;
  WebCore::Node *v9;
  StringImpl *v10;
  DOMDocument *v11;
  WTF::StringImpl *v12;
  DOMDocument *result;
  uint64_t v14;
  WTF::StringImpl *v15;
  WTF::StringImpl *v16;
  WebCore::Node *v17;
  uint64_t v18;
  int v19;
  WebCore::Node *v20;
  _BYTE v21[80];
  _QWORD v22[2];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v21);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)namespaceURI, v7);
  v16 = (WTF::StringImpl *)v22[0];
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)qualifiedName, v8);
  v15 = (WTF::StringImpl *)v22[0];
  WebCore::DOMImplementation::createDocument();
  if (!v19)
  {
    v9 = v17;
    v17 = 0;
    v20 = v9;
    v11 = (DOMDocument *)kit(v9);
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
    if (v19 != -1)
      ((void (*)(_QWORD *, WebCore::Node **))off_1E9D6AEE0[v19])(v22, &v17);
    v19 = -1;
    if (v15)
    {
      if (*(_DWORD *)v15 == 2)
      {
        WTF::StringImpl::destroy(v15, v10);
        v12 = v16;
        if (!v16)
        {
LABEL_18:
          WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v21, v10);
          return v11;
        }
LABEL_15:
        if (*(_DWORD *)v12 == 2)
          WTF::StringImpl::destroy(v12, v10);
        else
          *(_DWORD *)v12 -= 2;
        goto LABEL_18;
      }
      *(_DWORD *)v15 -= 2;
    }
    v12 = v16;
    if (!v16)
      goto LABEL_18;
    goto LABEL_15;
  }
  if (v19 == 1)
  {
    LOBYTE(v22[0]) = (_BYTE)v17;
    v14 = v18;
    v18 = 0;
    v22[1] = v14;
    raiseDOMErrorException();
  }
  result = (DOMDocument *)std::__throw_bad_variant_access[abi:sn180100]();
  __break(1u);
  return result;
}

- (DOMCSSStyleSheet)createCSSStyleSheet:(NSString *)title media:(NSString *)media
{
  const WTF::String *v6;
  StringImpl *v7;
  DOMCSSStyleSheet *v8;
  DOMObjectInternal *v9;
  WTF::StringImpl *v10;
  WTF::StringImpl *v11;
  WTF::StringImpl *v13;
  WTF::StringImpl *v14;
  DOMObjectInternal *v15;
  _BYTE v16[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v16);
  MEMORY[0x1D82A3998](&v14, title);
  MEMORY[0x1D82A3998](&v13, media);
  WebCore::DOMImplementation::createCSSStyleSheet((WebCore::DOMImplementation *)&v14, (const WTF::String *)&v13, v6);
  v8 = (DOMCSSStyleSheet *)kit(v15);
  v9 = v15;
  v15 = 0;
  if (v9)
  {
    if (*((_DWORD *)v9 + 2) == 1)
    {
      (*(void (**)(DOMObjectInternal *))(*(_QWORD *)v9 + 8))(v9);
      v10 = v13;
      v13 = 0;
      if (!v10)
        goto LABEL_8;
      goto LABEL_5;
    }
    --*((_DWORD *)v9 + 2);
  }
  v10 = v13;
  v13 = 0;
  if (!v10)
    goto LABEL_8;
LABEL_5:
  if (*(_DWORD *)v10 == 2)
    WTF::StringImpl::destroy(v10, v7);
  else
    *(_DWORD *)v10 -= 2;
LABEL_8:
  v11 = v14;
  v14 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2)
      WTF::StringImpl::destroy(v11, v7);
    else
      *(_DWORD *)v11 -= 2;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v16, v7);
  return v8;
}

- (DOMHTMLDocument)createHTMLDocument:(NSString *)title
{
  StringImpl *v4;
  DOMHTMLDocument *v5;
  WebCore::Node *v6;
  WTF::StringImpl *v7;
  WTF::StringImpl *v9;
  WebCore::Node *v10;
  _BYTE v11[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11);
  MEMORY[0x1D82A3998](&v9, title);
  WebCore::DOMImplementation::createHTMLDocument();
  v5 = (DOMHTMLDocument *)kit(v10);
  v6 = v10;
  v10 = 0;
  if (v6)
  {
    if (*((_DWORD *)v6 + 6) == 2)
    {
      if ((*((_WORD *)v6 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v6);
    }
    else
    {
      *((_DWORD *)v6 + 6) -= 2;
    }
  }
  v7 = v9;
  v9 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2)
      WTF::StringImpl::destroy(v7, v4);
    else
      *(_DWORD *)v7 -= 2;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11, v4);
  return v5;
}

@end
