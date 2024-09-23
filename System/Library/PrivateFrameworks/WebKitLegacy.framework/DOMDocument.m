@implementation DOMDocument

- (DOMDocumentType)doctype
{
  WebCore::Node *v3;
  DOMDocumentType *v4;
  void *v5;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  v3 = (WebCore::Node *)WebCore::Document::doctype(self->super.super._internal);
  v4 = (DOMDocumentType *)kit(v3);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
  return v4;
}

- (DOMImplementation)implementation
{
  DOMObjectInternal *v3;
  DOMImplementation *v4;
  void *v5;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  v3 = (DOMObjectInternal *)WebCore::Document::implementation(self->super.super._internal);
  v4 = (DOMImplementation *)kit(v3);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
  return v4;
}

- (DOMElement)documentElement
{
  DOMElement *v3;
  void *v4;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  v3 = (DOMElement *)kit(*((WebCore::Node **)self->super.super._internal + 159));
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v4);
  return v3;
}

- (NSString)inputEncoding
{
  StringImpl *v3;
  const __CFString *v4;
  WTF::StringImpl *v6;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  WebCore::Document::characterSetWithUTF8Fallback(self->super.super._internal);
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

- (NSString)xmlEncoding
{
  StringImpl *v3;
  WTF::StringImpl *v4;
  const __CFString *v5;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  v4 = (WTF::StringImpl *)*((_QWORD *)self->super.super._internal + 212);
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

- (NSString)xmlVersion
{
  StringImpl *v3;
  WTF::StringImpl *v4;
  const __CFString *v5;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  v4 = (WTF::StringImpl *)*((_QWORD *)self->super.super._internal + 213);
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

- (void)setXmlVersion:(NSString *)xmlVersion
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
  internal = self->super.super._internal;
  MEMORY[0x1D82A3998](&v10, xmlVersion);
  WebCore::Document::setXMLVersion(internal, (const WTF::String *)&v10);
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

- (BOOL)xmlStandalone
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LOBYTE(self) = *((_BYTE *)self->super.super._internal + 3369) == 1;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (char)self;
}

- (void)setXmlStandalone:(BOOL)xmlStandalone
{
  void *v4;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  WebCore::Document::setXMLStandalone(self->super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v4);
}

- (NSString)documentURI
{
  StringImpl *v3;
  const __CFString *v4;
  WTF::StringImpl *v6;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  WebCore::Document::documentURI(self->super.super._internal);
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

- (void)setDocumentURI:(NSString *)documentURI
{
  DOMObjectInternal *internal;
  StringImpl *v6;
  WTF::StringImpl *v7;
  void *v8;
  WTF::StringImpl *v9;
  _BYTE v10[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  internal = self->super.super._internal;
  MEMORY[0x1D82A3998](&v9, documentURI);
  WebCore::Document::setDocumentURI(internal, (const WTF::String *)&v9);
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

- (DOMAbstractView)defaultView
{
  WebCore::WindowProxy *v3;
  void *v4;
  WebCore::LocalDOMWindow *v5;
  DOMAbstractView *v6;
  _BYTE v8[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  v3 = (WebCore::WindowProxy *)WebCore::Document::windowProxy(self->super.super._internal);
  if (v3 && (v5 = (WebCore::LocalDOMWindow *)WebCore::WindowProxy::window(v3)) != 0 && !*((_BYTE *)v5 + 56))
    v6 = (DOMAbstractView *)kit(v5);
  else
    v6 = 0;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v4);
  return v6;
}

- (DOMStyleSheetList)styleSheets
{
  DOMObjectInternal *v3;
  DOMObjectInternal *v4;
  void *v5;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  v3 = (DOMObjectInternal *)WebCore::Document::styleSheets(self->super.super._internal);
  v4 = kit(v3);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
  return (DOMStyleSheetList *)v4;
}

- (id)contentType
{
  StringImpl *v3;
  const __CFString *v4;
  WTF::StringImpl *v6;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  WebCore::Document::contentType(self->super.super._internal);
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
  return (id)v4;
}

- (NSString)title
{
  void *v3;
  const __CFString *v4;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  if (*((_QWORD *)self->super.super._internal + 181))
    v4 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v4 = &stru_1E9D6EC48;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v3);
  return &v4->isa;
}

- (void)setTitle:(NSString *)title
{
  StringImpl *v4;
  WTF::StringImpl *v5;
  void *v6;
  WTF::StringImpl *v7;
  _BYTE v8[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  MEMORY[0x1D82A3998](&v7, title);
  WebCore::Document::setTitle();
  v5 = v7;
  v7 = 0;
  if (!v5)
    goto LABEL_4;
  if (*(_DWORD *)v5 != 2)
  {
    *(_DWORD *)v5 -= 2;
LABEL_4:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v4);
    return;
  }
  WTF::StringImpl::destroy(v5, v4);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v6);
}

- (id)dir
{
  void *v3;
  const __CFString *v4;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  if (*(_QWORD *)WebCore::Document::dir(self->super.super._internal))
    v4 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v4 = &stru_1E9D6EC48;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v3);
  return (id)v4;
}

- (void)setDir:(id)a3
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
  WebCore::Document::setDir();
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

- (NSString)referrer
{
  StringImpl *v3;
  const __CFString *v4;
  WTF::StringImpl *v6;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  WebCore::Document::referrer(self->super.super._internal);
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

- (NSString)domain
{
  StringImpl *v3;
  const __CFString *v4;
  WTF::StringImpl *v6;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  WebCore::Document::domain(self->super.super._internal);
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

- (NSString)URL
{
  void *v3;
  const __CFString *v4;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  if (*(_QWORD *)WebCore::Document::urlForBindings(self->super.super._internal))
    v4 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v4 = &stru_1E9D6EC48;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v3);
  return &v4->isa;
}

- (NSString)cookie
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
  WebCore::Document::cookie(self->super.super._internal);
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
    ((void (*)(_BYTE *, WTF::StringImpl **))off_1E9D6AD28[v6])(v13, &v9);
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

- (void)setCookie:(NSString *)cookie
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
  internal = self->super.super._internal;
  MEMORY[0x1D82A3998](&v10, cookie);
  WebCore::Document::setCookie(internal, (const WTF::String *)&v10);
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

- (DOMHTMLElement)body
{
  WebCore::Node *v3;
  DOMHTMLElement *v4;
  void *v5;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  v3 = (WebCore::Node *)WebCore::Document::bodyOrFrameset(self->super.super._internal);
  v4 = (DOMHTMLElement *)kit(v3);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
  return v4;
}

- (void)setBody:(DOMHTMLElement *)body
{
  DOMObjectInternal *internal;
  void *v5;
  void *v6;
  WebCore::Node *v7;
  char v8;
  uint64_t v9;
  char v10;
  _BYTE v11[88];
  uint64_t v12;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11);
  if (body)
  {
    internal = body->super.super.super._internal;
    if (internal)
      *((_DWORD *)internal + 6) += 2;
  }
  else
  {
    internal = 0;
  }
  v7 = internal;
  WebCore::Document::setBodyOrFrameset();
  if (v10)
  {
    v11[80] = v8;
    v12 = v9;
    raiseDOMErrorException();
  }
  if (!v7)
    goto LABEL_9;
  if (*((_DWORD *)v7 + 6) != 2)
  {
    *((_DWORD *)v7 + 6) -= 2;
LABEL_9:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11, v5);
    return;
  }
  if ((*((_WORD *)v7 + 15) & 0x400) != 0)
    goto LABEL_9;
  WebCore::Node::removedLastRef(v7);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11, v6);
}

- (id)head
{
  WebCore::Node *v3;
  WebCore::Node *v4;
  void *v5;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  v3 = (WebCore::Node *)WebCore::Document::head(self->super.super._internal);
  v4 = kit(v3);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
  return v4;
}

- (DOMHTMLCollection)images
{
  void *v3;
  DOMHTMLCollection *v4;
  DOMObjectInternal *v5;
  DOMObjectInternal *v7;
  _BYTE v8[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  MEMORY[0x1D82A6DB8](&v7, self->super.super._internal);
  v4 = (DOMHTMLCollection *)kit(v7);
  v5 = v7;
  v7 = 0;
  if (v5)
  {
    if (*((_DWORD *)v5 + 4) == 1)
      (*(void (**)(DOMObjectInternal *))(*(_QWORD *)v5 + 8))(v5);
    else
      --*((_DWORD *)v5 + 4);
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
  return v4;
}

- (DOMHTMLCollection)applets
{
  void *v3;
  DOMHTMLCollection *v4;
  DOMObjectInternal *v6;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  WebCore::Document::applets(self->super.super._internal);
  v4 = (DOMHTMLCollection *)kit(v6);
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

- (DOMHTMLCollection)links
{
  void *v3;
  DOMHTMLCollection *v4;
  DOMObjectInternal *v5;
  DOMObjectInternal *v7;
  _BYTE v8[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  MEMORY[0x1D82A6D7C](&v7, self->super.super._internal);
  v4 = (DOMHTMLCollection *)kit(v7);
  v5 = v7;
  v7 = 0;
  if (v5)
  {
    if (*((_DWORD *)v5 + 4) == 1)
      (*(void (**)(DOMObjectInternal *))(*(_QWORD *)v5 + 8))(v5);
    else
      --*((_DWORD *)v5 + 4);
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
  return v4;
}

- (DOMHTMLCollection)forms
{
  void *v3;
  DOMHTMLCollection *v4;
  DOMObjectInternal *v5;
  DOMObjectInternal *v7;
  _BYTE v8[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  MEMORY[0x1D82A6D70](&v7, self->super.super._internal);
  v4 = (DOMHTMLCollection *)kit(v7);
  v5 = v7;
  v7 = 0;
  if (v5)
  {
    if (*((_DWORD *)v5 + 4) == 1)
      (*(void (**)(DOMObjectInternal *))(*(_QWORD *)v5 + 8))(v5);
    else
      --*((_DWORD *)v5 + 4);
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
  return v4;
}

- (DOMHTMLCollection)anchors
{
  void *v3;
  DOMHTMLCollection *v4;
  DOMObjectInternal *v5;
  DOMObjectInternal *v7;
  _BYTE v8[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  MEMORY[0x1D82A6DD0](&v7, self->super.super._internal);
  v4 = (DOMHTMLCollection *)kit(v7);
  v5 = v7;
  v7 = 0;
  if (v5)
  {
    if (*((_DWORD *)v5 + 4) == 1)
      (*(void (**)(DOMObjectInternal *))(*(_QWORD *)v5 + 8))(v5);
    else
      --*((_DWORD *)v5 + 4);
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
  return v4;
}

- (NSString)lastModified
{
  StringImpl *v3;
  const __CFString *v4;
  WTF::StringImpl *v6;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  WebCore::Document::lastModified(self->super.super._internal);
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

- (NSString)charset
{
  StringImpl *v3;
  WTF::StringImpl *v4;
  int v5;
  const __CFString *v6;
  _BYTE v8[80];
  WTF::StringImpl *v9;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::Document::encoding(self->super.super._internal);
  v4 = v9;
  if (v9)
  {
    v5 = *(_DWORD *)v9;
    *(_DWORD *)v9 += 2;
    v9 = 0;
    if (v5)
      *(_DWORD *)v4 = v5;
    else
      WTF::StringImpl::destroy(v4, v3);
    v6 = (const __CFString *)WTF::StringImpl::operator NSString *();
    if (*(_DWORD *)v4 == 2)
      WTF::StringImpl::destroy(v4, v3);
    else
      *(_DWORD *)v4 -= 2;
  }
  else
  {
    v6 = &stru_1E9D6EC48;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
  return &v6->isa;
}

- (void)setCharset:(NSString *)charset
{
  DOMObjectInternal *internal;
  StringImpl *v6;
  WTF::StringImpl *v7;
  void *v8;
  WTF::StringImpl *v9;
  _BYTE v10[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  internal = self->super.super._internal;
  MEMORY[0x1D82A3998](&v9, charset);
  WebCore::Document::setCharset(internal, (const WTF::String *)&v9);
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

- (NSString)defaultCharset
{
  StringImpl *v2;
  NSString *v3;
  WTF::StringImpl *v5;

  WebCore::Document::defaultCharsetForLegacyBindings(self->super.super._internal);
  if (!v5)
    return (NSString *)&stru_1E9D6EC48;
  v3 = (NSString *)WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)v5 == 2)
  {
    WTF::StringImpl::destroy(v5, v2);
    return v3;
  }
  else
  {
    *(_DWORD *)v5 -= 2;
    return v3;
  }
}

- (NSString)readyState
{
  void *v3;
  unint64_t v4;
  const __CFString *v5;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  v4 = *((char *)self->super.super._internal + 3363);
  if (v4 > 2)
    v5 = CFSTR("complete");
  else
    v5 = (const __CFString *)*((_QWORD *)&off_1E9D6AE18 + v4);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v3);
  return &v5->isa;
}

- (NSString)characterSet
{
  StringImpl *v3;
  const __CFString *v4;
  WTF::StringImpl *v6;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  WebCore::Document::characterSetWithUTF8Fallback(self->super.super._internal);
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

- (NSString)preferredStylesheetSet
{
  return 0;
}

- (NSString)selectedStylesheetSet
{
  return 0;
}

- (DOMElement)activeElement
{
  WebCore::Node *active;
  DOMElement *v4;
  void *v5;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  active = (WebCore::Node *)WebCore::Document::activeElement(self->super.super._internal);
  v4 = (DOMElement *)kit(active);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
  return v4;
}

- (id)compatMode
{
  StringImpl *v3;
  const __CFString *v4;
  WTF::StringImpl *v6;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  WebCore::Document::compatMode(self->super.super._internal);
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
  return (id)v4;
}

- (BOOL)webkitIsFullScreen
{
  void *v3;
  uint64_t v4;
  BOOL v5;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  v4 = *((_QWORD *)self->super.super._internal + 249);
  if (!v4)
    v4 = WebCore::Document::ensureFullscreenManager(self->super.super._internal);
  v5 = *(_QWORD *)(v4 + 56) != 0;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v3);
  return v5;
}

- (BOOL)webkitFullScreenKeyboardInputAllowed
{
  void *v3;
  uint64_t v4;
  BOOL v5;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  v4 = *((_QWORD *)self->super.super._internal + 249);
  if (!v4)
    v4 = WebCore::Document::ensureFullscreenManager(self->super.super._internal);
  if (*(_QWORD *)(v4 + 56))
    v5 = *(_BYTE *)(v4 + 129) != 0;
  else
    v5 = 0;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v3);
  return v5;
}

- (id)webkitCurrentFullScreenElement
{
  DOMObjectInternal *internal;
  uint64_t v4;
  WebCore::Node *v5;
  WebCore::Node *v6;
  void *v7;
  _BYTE v9[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  internal = self->super.super._internal;
  v4 = *((_QWORD *)internal + 249);
  if (!v4)
    v4 = WebCore::Document::ensureFullscreenManager(internal);
  v5 = (WebCore::Node *)WebCore::TreeScope::ancestorElementInThisScope((DOMObjectInternal *)((char *)internal + 96), *(WebCore::Element **)(v4 + 56));
  v6 = kit(v5);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v7);
  return v6;
}

- (BOOL)webkitFullscreenEnabled
{
  WebCore::FullscreenManager *v3;
  char isFullscreenEnabled;
  void *v5;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  v3 = (WebCore::FullscreenManager *)*((_QWORD *)self->super.super._internal + 249);
  if (!v3)
    v3 = (WebCore::FullscreenManager *)WebCore::Document::ensureFullscreenManager(self->super.super._internal);
  isFullscreenEnabled = WebCore::FullscreenManager::isFullscreenEnabled(v3);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
  return isFullscreenEnabled;
}

- (id)webkitFullscreenElement
{
  DOMObjectInternal *internal;
  WebCore::FullscreenManager *v4;
  WebCore::Element *v5;
  WebCore::Node *v6;
  WebCore::Node *v7;
  void *v8;
  _BYTE v10[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  internal = self->super.super._internal;
  v4 = (WebCore::FullscreenManager *)*((_QWORD *)internal + 249);
  if (!v4)
    v4 = (WebCore::FullscreenManager *)WebCore::Document::ensureFullscreenManager(internal);
  v5 = (WebCore::Element *)WebCore::FullscreenManager::fullscreenElement(v4);
  v6 = (WebCore::Node *)WebCore::TreeScope::ancestorElementInThisScope((DOMObjectInternal *)((char *)internal + 96), v5);
  v7 = kit(v6);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10, v8);
  return v7;
}

- (id)visibilityState
{
  void *v3;
  const __CFString *v4;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  if (WebCore::Document::visibilityState(self->super.super._internal))
    v4 = CFSTR("visible");
  else
    v4 = CFSTR("hidden");
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v3);
  return (id)v4;
}

- (BOOL)hidden
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LOBYTE(self) = WebCore::Document::hidden(self->super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (char)self;
}

- (id)currentScript
{
  void *v3;
  DOMObjectInternal *internal;
  uint64_t v5;
  uint64_t v6;
  WebCore::Node *v7;
  _BYTE v9[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  internal = self->super.super._internal;
  v5 = *((unsigned int *)internal + 405);
  if ((_DWORD)v5
    && (v6 = *(_QWORD *)(*((_QWORD *)internal + 201) + 8 * v5 - 8)) != 0
    && (*(_WORD *)(v6 + 28) & 0x10) != 0
    && *(_QWORD *)(*(_QWORD *)(v6 + 96) + 24) == *(_QWORD *)(*MEMORY[0x1E0DD6210] + 24))
  {
    v7 = kit((WebCore::Node *)v6);
  }
  else
  {
    v7 = 0;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v3);
  return v7;
}

- (id)origin
{
  WebCore::SecurityOrigin *v3;
  StringImpl *v4;
  const __CFString *v5;
  WTF::StringImpl *v7;
  _BYTE v8[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  v3 = (WebCore::SecurityOrigin *)WebCore::SecurityContext::securityOrigin((WebCore::SecurityContext *)((char *)self->super.super._internal + 192));
  WebCore::SecurityOrigin::toString(v3);
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
  return (id)v5;
}

- (id)scrollingElement
{
  WebCore::Node *v3;
  WebCore::Node *v4;
  void *v5;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  v3 = (WebCore::Node *)WebCore::Document::scrollingElementForAPI(self->super.super._internal);
  v4 = kit(v3);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v5);
  return v4;
}

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

- (DOMElement)createElement:(NSString *)tagName
{
  const __CFString *v4;
  WebCore::Node *v5;
  StringImpl *v6;
  DOMElement *v7;
  DOMElement *result;
  uint64_t v9;
  WTF::StringImpl *v10;
  WebCore::Node *v11;
  uint64_t v12;
  int v13;
  WebCore::Node *v14;
  _BYTE v15[80];
  _QWORD v16[2];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)tagName, v4);
  v10 = (WTF::StringImpl *)v16[0];
  WebCore::Document::createElementForBindings();
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
    result = (DOMElement *)std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
  }
  else
  {
    v5 = v11;
    v11 = 0;
    v14 = v5;
    v7 = (DOMElement *)kit(v5);
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
      ((void (*)(_QWORD *, WebCore::Node **))off_1E9D6AD38[v13])(v16, &v11);
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

- (DOMDocumentFragment)createDocumentFragment
{
  void *v3;
  DOMDocumentFragment *v4;
  WebCore::Node *v6;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  WebCore::Document::createDocumentFragment(self->super.super._internal);
  v4 = (DOMDocumentFragment *)kit(v6);
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
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v3);
  return v4;
}

- (DOMText)createTextNode:(NSString *)data
{
  StringImpl *v4;
  DOMText *v5;
  WebCore::Node *v6;
  WTF::StringImpl *v7;
  WTF::StringImpl *v9;
  WebCore::Node *v10;
  _BYTE v11[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11);
  MEMORY[0x1D82A3998](&v9, data);
  WebCore::Document::createTextNode();
  v5 = (DOMText *)kit(v10);
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

- (DOMComment)createComment:(NSString *)data
{
  StringImpl *v4;
  DOMComment *v5;
  WebCore::Node *v6;
  WTF::StringImpl *v7;
  WTF::StringImpl *v9;
  WebCore::Node *v10;
  _BYTE v11[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11);
  MEMORY[0x1D82A3998](&v9, data);
  WebCore::Document::createComment();
  v5 = (DOMComment *)kit(v10);
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

- (DOMCDATASection)createCDATASection:(NSString *)data
{
  WebCore::Node *v4;
  StringImpl *v5;
  DOMCDATASection *v6;
  WTF::StringImpl *v7;
  DOMCDATASection *result;
  uint64_t v9;
  WTF::StringImpl *v10;
  WebCore::Node *v11;
  uint64_t v12;
  int v13;
  WebCore::Node *v14;
  _BYTE v15[80];
  _BYTE v16[8];
  uint64_t v17;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15);
  MEMORY[0x1D82A3998](&v10, data);
  WebCore::Document::createCDATASection();
  if (v13)
  {
    if (v13 == 1)
    {
      v16[0] = (_BYTE)v11;
      v9 = v12;
      v12 = 0;
      v17 = v9;
      raiseDOMErrorException();
    }
    result = (DOMCDATASection *)std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
  }
  else
  {
    v4 = v11;
    v11 = 0;
    v14 = v4;
    v6 = (DOMCDATASection *)kit(v4);
    if (v4)
    {
      if (*((_DWORD *)v4 + 6) == 2)
      {
        if ((*((_WORD *)v4 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v4);
      }
      else
      {
        *((_DWORD *)v4 + 6) -= 2;
      }
    }
    if (v13 != -1)
      ((void (*)(_BYTE *, WebCore::Node **))off_1E9D6AD48[v13])(v16, &v11);
    v13 = -1;
    v7 = v10;
    v10 = 0;
    if (v7)
    {
      if (*(_DWORD *)v7 == 2)
        WTF::StringImpl::destroy(v7, v5);
      else
        *(_DWORD *)v7 -= 2;
    }
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15, v5);
    return v6;
  }
  return result;
}

- (DOMProcessingInstruction)createProcessingInstruction:(NSString *)target data:(NSString *)data
{
  WebCore::Node *v6;
  StringImpl *v7;
  DOMProcessingInstruction *v8;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;
  DOMProcessingInstruction *result;
  uint64_t v12;
  WTF::StringImpl *v13;
  WTF::StringImpl *v14;
  WebCore::Node *v15;
  uint64_t v16;
  int v17;
  WebCore::Node *v18;
  _BYTE v19[80];
  _BYTE v20[8];
  uint64_t v21;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v19);
  MEMORY[0x1D82A3998](&v14, target);
  MEMORY[0x1D82A3998](&v13, data);
  WebCore::Document::createProcessingInstruction();
  if (!v17)
  {
    v6 = v15;
    v15 = 0;
    v18 = v6;
    v8 = (DOMProcessingInstruction *)kit(v6);
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
    if (v17 != -1)
      ((void (*)(_BYTE *, WebCore::Node **))off_1E9D6AD58[v17])(v20, &v15);
    v17 = -1;
    v9 = v13;
    v13 = 0;
    if (v9)
    {
      if (*(_DWORD *)v9 == 2)
      {
        WTF::StringImpl::destroy(v9, v7);
        v10 = v14;
        v14 = 0;
        if (!v10)
        {
LABEL_18:
          WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v19, v7);
          return v8;
        }
LABEL_15:
        if (*(_DWORD *)v10 == 2)
          WTF::StringImpl::destroy(v10, v7);
        else
          *(_DWORD *)v10 -= 2;
        goto LABEL_18;
      }
      *(_DWORD *)v9 -= 2;
    }
    v10 = v14;
    v14 = 0;
    if (!v10)
      goto LABEL_18;
    goto LABEL_15;
  }
  if (v17 == 1)
  {
    v20[0] = (_BYTE)v15;
    v12 = v16;
    v16 = 0;
    v21 = v12;
    raiseDOMErrorException();
  }
  result = (DOMProcessingInstruction *)std::__throw_bad_variant_access[abi:sn180100]();
  __break(1u);
  return result;
}

- (DOMAttr)createAttribute:(NSString *)name
{
  const __CFString *v4;
  WebCore::Node *v5;
  StringImpl *v6;
  DOMAttr *v7;
  DOMAttr *result;
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
  WebCore::Document::createAttribute();
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
    result = (DOMAttr *)std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
  }
  else
  {
    v5 = v11;
    v11 = 0;
    v14 = v5;
    v7 = (DOMAttr *)kit(v5);
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
      ((void (*)(_QWORD *, WebCore::Node **))off_1E9D6AD68[v13])(v16, &v11);
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

- (DOMEntityReference)createEntityReference:(NSString *)name
{
  raiseNotSupportedErrorException();
}

- (DOMNodeList)getElementsByTagName:(NSString *)tagname
{
  const __CFString *v4;
  StringImpl *v5;
  DOMNodeList *v6;
  WTF::StringImpl *v7;
  WTF::StringImpl *v9;
  DOMObjectInternal *v10;
  _BYTE v11[80];
  WTF::StringImpl *v12;

  if (!tagname)
    return 0;
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)tagname, v4);
  v9 = v12;
  WebCore::ContainerNode::getElementsByTagName();
  v6 = (DOMNodeList *)kit(v10);
  if (!v10)
  {
LABEL_5:
    v7 = v9;
    if (v9)
      goto LABEL_6;
    goto LABEL_10;
  }
  if (*((_DWORD *)v10 + 4) != 1)
  {
    --*((_DWORD *)v10 + 4);
    goto LABEL_5;
  }
  (*(void (**)())(*(_QWORD *)v10 + 8))();
  v7 = v9;
  if (v9)
  {
LABEL_6:
    if (*(_DWORD *)v7 == 2)
      WTF::StringImpl::destroy(v7, v5);
    else
      *(_DWORD *)v7 -= 2;
  }
LABEL_10:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11, v5);
  return v6;
}

- (DOMNode)importNode:(DOMNode *)importedNode deep:(BOOL)deep
{
  WebCore::Node *v6;
  void *v7;
  DOMNode *v8;
  DOMNode *result;
  uint64_t v10;
  WebCore::Node *v11;
  uint64_t v12;
  int v13;
  WebCore::Node *v14;
  _BYTE v15[80];
  _BYTE v16[8];
  uint64_t v17;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15);
  if (!importedNode)
    raiseTypeErrorException();
  WebCore::Document::importNode(self->super.super._internal, importedNode->super._internal);
  if (v13)
  {
    if (v13 == 1)
    {
      v16[0] = (_BYTE)v11;
      v10 = v12;
      v12 = 0;
      v17 = v10;
      raiseDOMErrorException();
    }
    result = (DOMNode *)std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
  }
  else
  {
    v6 = v11;
    v11 = 0;
    v14 = v6;
    v8 = (DOMNode *)kit(v6);
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
    if (v13 != -1)
      ((void (*)(_BYTE *, WebCore::Node **))off_1E9D6AD78[v13])(v16, &v11);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15, v7);
    return v8;
  }
  return result;
}

- (DOMElement)createElementNS:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName
{
  const __CFString *v6;
  const __CFString *v7;
  WebCore::Node *v8;
  StringImpl *v9;
  DOMElement *v10;
  WTF::StringImpl *v11;
  DOMElement *result;
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
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)qualifiedName, v7);
  v14 = (WTF::StringImpl *)v21[0];
  WebCore::Document::createElementNS();
  if (!v18)
  {
    v8 = v16;
    v16 = 0;
    v19 = v8;
    v10 = (DOMElement *)kit(v8);
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
      ((void (*)(_QWORD *, WebCore::Node **))off_1E9D6AD38[v18])(v21, &v16);
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
  result = (DOMElement *)std::__throw_bad_variant_access[abi:sn180100]();
  __break(1u);
  return result;
}

- (DOMAttr)createAttributeNS:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName
{
  const __CFString *v6;
  const __CFString *v7;
  WebCore::Node *v8;
  StringImpl *v9;
  DOMAttr *v10;
  WTF::StringImpl *v11;
  DOMAttr *result;
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
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)qualifiedName, v7);
  v14 = (WTF::StringImpl *)v21[0];
  WebCore::Document::createAttributeNS();
  if (!v18)
  {
    v8 = v16;
    v16 = 0;
    v19 = v8;
    v10 = (DOMAttr *)kit(v8);
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
      ((void (*)(_QWORD *, WebCore::Node **))off_1E9D6AD68[v18])(v21, &v16);
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
  result = (DOMAttr *)std::__throw_bad_variant_access[abi:sn180100]();
  __break(1u);
  return result;
}

- (DOMNodeList)getElementsByTagNameNS:(NSString *)namespaceURI localName:(NSString *)localName
{
  const __CFString *v6;
  const __CFString *v7;
  StringImpl *v8;
  DOMNodeList *v9;
  WTF::StringImpl *v10;
  WTF::StringImpl *v12;
  WTF::StringImpl *v13;
  DOMObjectInternal *v14;
  _BYTE v15[80];
  WTF::StringImpl *v16;

  if (!localName)
    return 0;
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)namespaceURI, v6);
  v13 = v16;
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)localName, v7);
  v12 = v16;
  WebCore::ContainerNode::getElementsByTagNameNS();
  v9 = (DOMNodeList *)kit(v14);
  if (!v14)
  {
LABEL_5:
    v10 = v12;
    if (v12)
      goto LABEL_6;
    goto LABEL_10;
  }
  if (*((_DWORD *)v14 + 4) != 1)
  {
    --*((_DWORD *)v14 + 4);
    goto LABEL_5;
  }
  (*(void (**)())(*(_QWORD *)v14 + 8))();
  v10 = v12;
  if (v12)
  {
LABEL_6:
    if (*(_DWORD *)v10 == 2)
      WTF::StringImpl::destroy(v10, v8);
    else
      *(_DWORD *)v10 -= 2;
  }
LABEL_10:
  if (v13)
  {
    if (*(_DWORD *)v13 == 2)
      WTF::StringImpl::destroy(v13, v8);
    else
      *(_DWORD *)v13 -= 2;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15, v8);
  return v9;
}

- (DOMNode)adoptNode:(DOMNode *)source
{
  WebCore::Node *v5;
  void *v6;
  DOMNode *v7;
  DOMNode *result;
  uint64_t v9;
  WebCore::Node *v10;
  uint64_t v11;
  int v12;
  WebCore::Node *v13;
  _BYTE v14[80];
  _BYTE v15[8];
  uint64_t v16;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v14);
  if (!source)
    raiseTypeErrorException();
  WebCore::Document::adoptNode(self->super.super._internal, source->super._internal);
  if (v12)
  {
    if (v12 == 1)
    {
      v15[0] = (_BYTE)v10;
      v9 = v11;
      v11 = 0;
      v16 = v9;
      raiseDOMErrorException();
    }
    result = (DOMNode *)std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
  }
  else
  {
    v5 = v10;
    v10 = 0;
    v13 = v5;
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
      ((void (*)(_BYTE *, WebCore::Node **))off_1E9D6AD78[v12])(v15, &v10);
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v14, v6);
    return v7;
  }
  return result;
}

- (DOMEvent)createEvent:(NSString *)eventType
{
  DOMObjectInternal *internal;
  DOMObjectInternal *v6;
  StringImpl *v7;
  DOMEvent *v8;
  uint64_t v9;
  WTF::StringImpl *v10;
  DOMEvent *result;
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
  MEMORY[0x1D82A3998](&v13, eventType);
  WebCore::Document::createEvent(internal, (const WTF::String *)&v13);
  if (!v16)
  {
    v6 = v14;
    v14 = 0;
    v8 = (DOMEvent *)kit(v6);
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
    ((void (*)(char *, DOMObjectInternal **))off_1E9D6AD88[v9])(v18, &v14);
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
  result = (DOMEvent *)std::__throw_bad_variant_access[abi:sn180100]();
  __break(1u);
  return result;
}

- (DOMRange)createRange
{
  void *v3;
  DOMObjectInternal *v4;
  WebCore::Range *v5;
  WebCore::Range *v7;
  _BYTE v8[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  MEMORY[0x1D82A6B18](&v7, self->super.super._internal);
  v4 = kit(v7);
  v5 = v7;
  v7 = 0;
  if (v5)
  {
    if (*((_DWORD *)v5 + 2) == 1)
      (*(void (**)(WebCore::Range *))(*(_QWORD *)v5 + 8))(v5);
    else
      --*((_DWORD *)v5 + 2);
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v3);
  return (DOMRange *)v4;
}

- (DOMNodeIterator)createNodeIterator:(DOMNode *)root whatToShow:(unsigned int)whatToShow filter:(id)filter expandEntityReferences:(BOOL)expandEntityReferences
{
  uint64_t v8;
  _DWORD *v9;
  WebCore::NodeIterator *v10;
  void *v11;
  DOMNodeIterator *v12;
  _DWORD *v13;
  uint64_t v15;
  WebCore::NodeIterator *v16;
  WebCore::NodeIterator *v17;
  _BYTE v18[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v18);
  if (!root)
    raiseTypeErrorException();
  if (filter)
  {
    v8 = WTF::fastMalloc((WTF *)0x18);
    *(_DWORD *)(v8 + 8) = 1;
    *(_QWORD *)v8 = &unk_1E9D6B110;
    *(_QWORD *)(v8 + 16) = filter;
    CFRetain(filter);
    v17 = (WebCore::NodeIterator *)v8;
    v9 = (_DWORD *)WTF::fastMalloc((WTF *)0x20);
    WebCore::NativeNodeFilter::NativeNodeFilter();
    v10 = v17;
    v16 = 0;
    if (v10)
    {
      if (*((_DWORD *)v10 + 2) == 1)
        (*(void (**)(WebCore::NodeIterator *))(*(_QWORD *)v10 + 8))(v10);
      else
        --*((_DWORD *)v10 + 2);
    }
    ++v9[4];
  }
  else
  {
    v9 = 0;
  }
  WebCore::Document::createNodeIterator();
  v12 = (DOMNodeIterator *)kit(v16);
  if (v16)
  {
    if (*((_DWORD *)v16 + 2) == 1)
    {
      v15 = MEMORY[0x1D82A41CC]();
      MEMORY[0x1D82A41D8](v15);
      v13 = v9;
      if (!v9)
        goto LABEL_16;
      goto LABEL_13;
    }
    --*((_DWORD *)v16 + 2);
  }
  v13 = v9;
  if (!v9)
    goto LABEL_16;
LABEL_13:
  if (v13[4] == 1)
    (*(void (**)(_DWORD *))(*(_QWORD *)v13 + 16))(v13);
  else
    --v13[4];
LABEL_16:
  if (filter)
  {
    if (v9[4] == 1)
      (*(void (**)(_DWORD *))(*(_QWORD *)v9 + 16))(v9);
    else
      --v9[4];
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v18, v11);
  return v12;
}

- (DOMTreeWalker)createTreeWalker:(DOMNode *)root whatToShow:(unsigned int)whatToShow filter:(id)filter expandEntityReferences:(BOOL)expandEntityReferences
{
  uint64_t v8;
  _DWORD *v9;
  WebCore::TreeWalker *v10;
  void *v11;
  DOMObjectInternal *v12;
  WebCore::TreeWalker *v14;
  WebCore::TreeWalker *v15;
  _BYTE v16[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v16);
  if (!root)
    raiseTypeErrorException();
  if (filter)
  {
    v8 = WTF::fastMalloc((WTF *)0x18);
    *(_DWORD *)(v8 + 8) = 1;
    *(_QWORD *)v8 = &unk_1E9D6B110;
    *(_QWORD *)(v8 + 16) = filter;
    CFRetain(filter);
    v15 = (WebCore::TreeWalker *)v8;
    v9 = (_DWORD *)WTF::fastMalloc((WTF *)0x20);
    WebCore::NativeNodeFilter::NativeNodeFilter();
    v10 = v15;
    v14 = 0;
    if (v10)
    {
      if (*((_DWORD *)v10 + 2) == 1)
        (*(void (**)(WebCore::TreeWalker *))(*(_QWORD *)v10 + 8))(v10);
      else
        --*((_DWORD *)v10 + 2);
    }
    ++v9[4];
  }
  else
  {
    v9 = 0;
  }
  WebCore::Document::createTreeWalker();
  v12 = kit(v14);
  if (v14)
    WTF::RefCounted<WebCore::TreeWalker>::deref((_QWORD *)v14 + 1);
  if (v9)
  {
    if (v9[4] == 1)
    {
      (*(void (**)(_DWORD *))(*(_QWORD *)v9 + 16))(v9);
      if (!filter)
        goto LABEL_20;
      goto LABEL_17;
    }
    --v9[4];
  }
  if (!filter)
    goto LABEL_20;
LABEL_17:
  if (v9[4] == 1)
    (*(void (**)(_DWORD *))(*(_QWORD *)v9 + 16))(v9);
  else
    --v9[4];
LABEL_20:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v16, v11);
  return (DOMTreeWalker *)v12;
}

- (DOMCSSStyleDeclaration)getOverrideStyle:(DOMElement *)element pseudoElement:(NSString *)pseudoElement
{
  return 0;
}

- (DOMXPathExpression)createExpression:(NSString *)expression resolver:(id)resolver
{
  uint64_t v6;
  DOMObjectInternal *v7;
  StringImpl *v8;
  DOMObjectInternal *v9;
  uint64_t v10;
  WTF::StringImpl *v11;
  DOMXPathExpression *result;
  WTF *v13;
  void *v14;
  uint64_t v15;
  _DWORD *v16;
  WTF::StringImpl *v17;
  WebCore::XPathExpression *v18;
  uint64_t v19;
  unsigned int v20;
  DOMObjectInternal *v21;
  _BYTE v22[80];
  _BYTE v23[8];
  uint64_t v24;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v22);
  MEMORY[0x1D82A3998](&v17, expression);
  if (resolver)
  {
    if (objc_msgSend(resolver, "isMemberOfClass:", objc_opt_class()))
    {
      v6 = *((_QWORD *)resolver + 2);
      if (v6)
        ++*(_DWORD *)(v6 + 8);
    }
    else
    {
      v6 = WTF::fastMalloc((WTF *)0x18);
      *(_DWORD *)(v6 + 8) = 1;
      *(_QWORD *)v6 = &unk_1E9D6ACE0;
      *(_QWORD *)(v6 + 16) = resolver;
    }
  }
  else
  {
    v6 = 0;
  }
  v16 = (_DWORD *)v6;
  WebCore::Document::createExpression();
  if (!v20)
  {
    v7 = v18;
    v18 = 0;
    v21 = v7;
    v9 = kit(v7);
    if (v7)
    {
      if (*(_DWORD *)v7 == 1)
      {
        WebCore::XPathExpression::~XPathExpression(v7);
        WTF::fastFree(v13, v14);
        v10 = v20;
        if (v20 == -1)
        {
LABEL_13:
          v20 = -1;
          if (v16)
          {
            if (v16[2] == 1)
            {
              (*(void (**)(_DWORD *))(*(_QWORD *)v16 + 8))(v16);
              v11 = v17;
              v17 = 0;
              if (!v11)
              {
LABEL_22:
                WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v22, v8);
                return (DOMXPathExpression *)v9;
              }
LABEL_19:
              if (*(_DWORD *)v11 == 2)
                WTF::StringImpl::destroy(v11, v8);
              else
                *(_DWORD *)v11 -= 2;
              goto LABEL_22;
            }
            --v16[2];
          }
          v11 = v17;
          v17 = 0;
          if (!v11)
            goto LABEL_22;
          goto LABEL_19;
        }
LABEL_12:
        ((void (*)(_BYTE *, WebCore::XPathExpression **))off_1E9D6AD98[v10])(v23, &v18);
        goto LABEL_13;
      }
      --*(_DWORD *)v7;
    }
    v10 = v20;
    if (v20 == -1)
      goto LABEL_13;
    goto LABEL_12;
  }
  if (v20 == 1)
  {
    v23[0] = (_BYTE)v18;
    v15 = v19;
    v19 = 0;
    v24 = v15;
    raiseDOMErrorException();
  }
  result = (DOMXPathExpression *)std::__throw_bad_variant_access[abi:sn180100]();
  __break(1u);
  return result;
}

- (id)createNSResolver:(DOMNode *)nodeResolver
{
  void *v5;
  DOMObjectInternal *v6;
  WebCore::XPathNSResolver *v8;
  _BYTE v9[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9);
  if (nodeResolver)
  {
    WebCore::Document::createNSResolver(self->super.super._internal, nodeResolver->super._internal);
    v6 = kit(v8);
    if (v8)
    {
      if (*((_DWORD *)v8 + 2) == 1)
        (*(void (**)())(*(_QWORD *)v8 + 8))();
      else
        --*((_DWORD *)v8 + 2);
    }
  }
  else
  {
    v6 = 0;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v9, v5);
  return v6;
}

- (DOMXPathResult)evaluate:(NSString *)expression contextNode:(DOMNode *)contextNode resolver:(id)resolver type:(unsigned __int16)type inResult:(DOMXPathResult *)inResult
{
  _DWORD *v9;
  DOMObjectInternal *v10;
  uint64_t v11;
  DOMObjectInternal *v12;
  StringImpl *v13;
  uint64_t v14;
  WTF::StringImpl *v15;
  DOMXPathResult *result;
  WTF *v17;
  void *v18;
  uint64_t v19;
  _DWORD *v20;
  WTF::StringImpl *v21;
  WebCore::XPathResult *v22;
  uint64_t v23;
  unsigned int v24;
  DOMObjectInternal *v25;
  _BYTE v26[80];
  _BYTE v27[8];
  uint64_t v28;

  if (!contextNode)
    return 0;
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v26);
  MEMORY[0x1D82A3998](&v21, expression);
  if (!resolver)
  {
    v9 = 0;
LABEL_8:
    v20 = v9;
    goto LABEL_10;
  }
  if (objc_msgSend(resolver, "isMemberOfClass:", objc_opt_class()))
  {
    v9 = (_DWORD *)*((_QWORD *)resolver + 2);
    if (v9)
    {
      ++v9[2];
      v20 = v9;
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  v11 = WTF::fastMalloc((WTF *)0x18);
  *(_DWORD *)(v11 + 8) = 1;
  *(_QWORD *)v11 = &unk_1E9D6ACE0;
  *(_QWORD *)(v11 + 16) = resolver;
  v20 = (_DWORD *)v11;
LABEL_10:
  WebCore::Document::evaluate();
  if (!v24)
  {
    v12 = v22;
    v22 = 0;
    v25 = v12;
    v10 = kit(v12);
    if (v12)
    {
      if (*(_DWORD *)v12 == 1)
      {
        v17 = (WTF *)MEMORY[0x1D82A3FE0](v12);
        WTF::fastFree(v17, v18);
        v14 = v24;
        if (v24 == -1)
        {
LABEL_16:
          v24 = -1;
          if (v20)
          {
            if (v20[2] == 1)
            {
              (*(void (**)(_DWORD *))(*(_QWORD *)v20 + 8))(v20);
              v15 = v21;
              v21 = 0;
              if (!v15)
              {
LABEL_25:
                WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v26, v13);
                return (DOMXPathResult *)v10;
              }
LABEL_22:
              if (*(_DWORD *)v15 == 2)
                WTF::StringImpl::destroy(v15, v13);
              else
                *(_DWORD *)v15 -= 2;
              goto LABEL_25;
            }
            --v20[2];
          }
          v15 = v21;
          v21 = 0;
          if (!v15)
            goto LABEL_25;
          goto LABEL_22;
        }
LABEL_15:
        ((void (*)(_BYTE *, WebCore::XPathResult **))off_1E9D6ADA8[v14])(v27, &v22);
        goto LABEL_16;
      }
      --*(_DWORD *)v12;
    }
    v14 = v24;
    if (v24 == -1)
      goto LABEL_16;
    goto LABEL_15;
  }
  if (v24 == 1)
  {
    v27[0] = (_BYTE)v22;
    v19 = v23;
    v23 = 0;
    v28 = v19;
    raiseDOMErrorException();
  }
  result = (DOMXPathResult *)std::__throw_bad_variant_access[abi:sn180100]();
  __break(1u);
  return result;
}

- (BOOL)execCommand:(NSString *)command userInterface:(BOOL)userInterface value:(NSString *)value
{
  StringImpl *v7;
  WTF::StringImpl *v8;
  BOOL v9;
  uint64_t v10;
  _BYTE v12[8];
  int v13;
  WTF::StringImpl *v14;
  _BYTE v15[16];
  unsigned int v16;
  _BYTE v17[87];
  char v18;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v17);
  MEMORY[0x1D82A3998](&v14, command);
  MEMORY[0x1D82A3998](v12, value);
  v13 = 0;
  WebCore::Document::execCommand();
  if (v13 != -1)
    ((void (*)(char *, _BYTE *))off_1E9D6ADB8[v13])(&v18, v12);
  v8 = v14;
  v14 = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 2)
    {
      WTF::StringImpl::destroy(v8, v7);
      v9 = 0;
      v10 = v16;
      if (v16 == -1)
        goto LABEL_12;
      goto LABEL_9;
    }
    *(_DWORD *)v8 -= 2;
  }
  v9 = 0;
  v10 = v16;
  if (v16 == -1)
    goto LABEL_12;
LABEL_9:
  if (!(_DWORD)v10)
    v9 = v15[0] != 0;
  ((void (*)(_BYTE *, _BYTE *))off_1E9D6ADC8[v10])(v12, v15);
LABEL_12:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v17, v7);
  return v9;
}

- (BOOL)execCommand:(NSString *)command userInterface:(BOOL)userInterface
{
  return -[DOMDocument execCommand:userInterface:value:](self, "execCommand:userInterface:value:", command, userInterface, 0);
}

- (BOOL)execCommand:(NSString *)command
{
  return -[DOMDocument execCommand:userInterface:value:](self, "execCommand:userInterface:value:", command, 0, 0);
}

- (BOOL)queryCommandEnabled:(NSString *)command
{
  DOMObjectInternal *internal;
  StringImpl *v6;
  WTF::StringImpl *v7;
  BOOL v8;
  uint64_t v9;
  WTF::StringImpl *v11;
  _BYTE v12[16];
  unsigned int v13;
  _BYTE v14[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v14);
  internal = self->super.super._internal;
  MEMORY[0x1D82A3998](&v11, command);
  WebCore::Document::queryCommandEnabled(internal, (const WTF::String *)&v11);
  v7 = v11;
  v11 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2)
    {
      WTF::StringImpl::destroy(v7, v6);
      v8 = 0;
      v9 = v13;
      if (v13 == -1)
        goto LABEL_10;
      goto LABEL_7;
    }
    *(_DWORD *)v7 -= 2;
  }
  v8 = 0;
  v9 = v13;
  if (v13 == -1)
    goto LABEL_10;
LABEL_7:
  if (!(_DWORD)v9)
    v8 = v12[0] != 0;
  ((void (*)(WTF::StringImpl **, _BYTE *))off_1E9D6ADC8[v9])(&v11, v12);
LABEL_10:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v14, v6);
  return v8;
}

- (BOOL)queryCommandIndeterm:(NSString *)command
{
  DOMObjectInternal *internal;
  StringImpl *v6;
  WTF::StringImpl *v7;
  BOOL v8;
  uint64_t v9;
  WTF::StringImpl *v11;
  _BYTE v12[16];
  unsigned int v13;
  _BYTE v14[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v14);
  internal = self->super.super._internal;
  MEMORY[0x1D82A3998](&v11, command);
  WebCore::Document::queryCommandIndeterm(internal, (const WTF::String *)&v11);
  v7 = v11;
  v11 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2)
    {
      WTF::StringImpl::destroy(v7, v6);
      v8 = 0;
      v9 = v13;
      if (v13 == -1)
        goto LABEL_10;
      goto LABEL_7;
    }
    *(_DWORD *)v7 -= 2;
  }
  v8 = 0;
  v9 = v13;
  if (v13 == -1)
    goto LABEL_10;
LABEL_7:
  if (!(_DWORD)v9)
    v8 = v12[0] != 0;
  ((void (*)(WTF::StringImpl **, _BYTE *))off_1E9D6ADC8[v9])(&v11, v12);
LABEL_10:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v14, v6);
  return v8;
}

- (BOOL)queryCommandState:(NSString *)command
{
  DOMObjectInternal *internal;
  StringImpl *v6;
  WTF::StringImpl *v7;
  BOOL v8;
  uint64_t v9;
  WTF::StringImpl *v11;
  _BYTE v12[16];
  unsigned int v13;
  _BYTE v14[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v14);
  internal = self->super.super._internal;
  MEMORY[0x1D82A3998](&v11, command);
  WebCore::Document::queryCommandState(internal, (const WTF::String *)&v11);
  v7 = v11;
  v11 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2)
    {
      WTF::StringImpl::destroy(v7, v6);
      v8 = 0;
      v9 = v13;
      if (v13 == -1)
        goto LABEL_10;
      goto LABEL_7;
    }
    *(_DWORD *)v7 -= 2;
  }
  v8 = 0;
  v9 = v13;
  if (v13 == -1)
    goto LABEL_10;
LABEL_7:
  if (!(_DWORD)v9)
    v8 = v12[0] != 0;
  ((void (*)(WTF::StringImpl **, _BYTE *))off_1E9D6ADC8[v9])(&v11, v12);
LABEL_10:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v14, v6);
  return v8;
}

- (BOOL)queryCommandSupported:(NSString *)command
{
  DOMObjectInternal *internal;
  StringImpl *v6;
  WTF::StringImpl *v7;
  BOOL v8;
  uint64_t v9;
  WTF::StringImpl *v11;
  _BYTE v12[16];
  unsigned int v13;
  _BYTE v14[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v14);
  internal = self->super.super._internal;
  MEMORY[0x1D82A3998](&v11, command);
  WebCore::Document::queryCommandSupported(internal, (const WTF::String *)&v11);
  v7 = v11;
  v11 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2)
    {
      WTF::StringImpl::destroy(v7, v6);
      v8 = 0;
      v9 = v13;
      if (v13 == -1)
        goto LABEL_10;
      goto LABEL_7;
    }
    *(_DWORD *)v7 -= 2;
  }
  v8 = 0;
  v9 = v13;
  if (v13 == -1)
    goto LABEL_10;
LABEL_7:
  if (!(_DWORD)v9)
    v8 = v12[0] != 0;
  ((void (*)(WTF::StringImpl **, _BYTE *))off_1E9D6ADC8[v9])(&v11, v12);
LABEL_10:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v14, v6);
  return v8;
}

- (NSString)queryCommandValue:(NSString *)command
{
  DOMObjectInternal *internal;
  StringImpl *v6;
  WTF::StringImpl *v7;
  int v8;
  const __CFString *v9;
  WTF::StringImpl *v10;
  WTF::StringImpl *v12;
  WTF::StringImpl *v13;
  int v14;
  _BYTE v15[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15);
  internal = self->super.super._internal;
  MEMORY[0x1D82A3998](&v12, command);
  WebCore::Document::queryCommandValue(internal, (const WTF::String *)&v12);
  v7 = v12;
  v12 = 0;
  if (!v7)
  {
LABEL_4:
    v8 = v14;
    if (v14)
      goto LABEL_5;
    goto LABEL_8;
  }
  if (*(_DWORD *)v7 != 2)
  {
    *(_DWORD *)v7 -= 2;
    goto LABEL_4;
  }
  WTF::StringImpl::destroy(v7, v6);
  v8 = v14;
  if (v14)
  {
LABEL_5:
    v9 = &stru_1E9D6EC48;
    if (v8 == -1)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_8:
  v10 = v13;
  if (!v13)
  {
    v8 = 0;
    v9 = &stru_1E9D6EC48;
    goto LABEL_13;
  }
  *(_DWORD *)v13 += 2;
  v9 = (const __CFString *)WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)v10 != 2)
  {
    *(_DWORD *)v10 -= 2;
    v8 = v14;
    if (v14 == -1)
      goto LABEL_14;
    goto LABEL_13;
  }
  WTF::StringImpl::destroy(v10, v6);
  v8 = v14;
  if (v14 != -1)
LABEL_13:
    ((void (*)(WTF::StringImpl **, WTF::StringImpl **))off_1E9D6AD28[v8])(&v12, &v13);
LABEL_14:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15, v6);
  return &v9->isa;
}

- (DOMNodeList)getElementsByName:(NSString *)elementName
{
  const __CFString *v4;
  StringImpl *v5;
  DOMNodeList *v6;
  WTF::StringImpl *v7;
  WTF::StringImpl *v9;
  DOMObjectInternal *v10;
  _BYTE v11[80];
  WTF::StringImpl *v12;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)elementName, v4);
  v9 = v12;
  WebCore::Document::getElementsByName();
  v6 = (DOMNodeList *)kit(v10);
  if (!v10)
  {
LABEL_4:
    v7 = v9;
    if (!v9)
      goto LABEL_8;
    goto LABEL_5;
  }
  if (*((_DWORD *)v10 + 4) != 1)
  {
    --*((_DWORD *)v10 + 4);
    goto LABEL_4;
  }
  (*(void (**)())(*(_QWORD *)v10 + 8))();
  v7 = v9;
  if (!v9)
    goto LABEL_8;
LABEL_5:
  if (*(_DWORD *)v7 == 2)
    WTF::StringImpl::destroy(v7, v5);
  else
    *(_DWORD *)v7 -= 2;
LABEL_8:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11, v5);
  return v6;
}

- (DOMElement)elementFromPoint:(int)x y:(int)y
{
  void *v4;
  DOMElement *v5;
  WebCore::Node *v7;
  _BYTE v8[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::TreeScope::elementFromPoint();
  v5 = (DOMElement *)kit(v7);
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

- (id)caretRangeFromPoint:(int)a3 y:(int)a4
{
  void *v4;
  DOMObjectInternal *v5;
  WebCore::Range *v7;
  _BYTE v8[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WebCore::Document::caretRangeFromPoint();
  v5 = kit(v7);
  if (v7)
  {
    if (*((_DWORD *)v7 + 2) == 1)
      (*(void (**)())(*(_QWORD *)v7 + 8))();
    else
      --*((_DWORD *)v7 + 2);
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8, v4);
  return v5;
}

- (DOMCSSStyleDeclaration)createCSSStyleDeclaration
{
  void *v3;
  DOMCSSStyleDeclaration *v4;
  DOMObjectInternal *v6;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  WebCore::Document::createCSSStyleDeclaration(self->super.super._internal);
  v4 = (DOMCSSStyleDeclaration *)kit(v6);
  if (v6)
    (*(void (**)())(*(_QWORD *)v6 + 24))();
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v3);
  return v4;
}

- (DOMCSSStyleDeclaration)getComputedStyle:(DOMElement *)element pseudoElement:(NSString *)pseudoElement
{
  StringImpl *v7;
  DOMObjectInternal *v8;
  DOMObjectInternal *internal;
  DOMObjectInternal *v10;
  WTF::StringImpl *v11;
  WTF::StringImpl *v13;
  DOMObjectInternal *v14;
  _BYTE v15[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15);
  if (!element)
    raiseTypeErrorException();
  v8 = (DOMObjectInternal *)*((_QWORD *)self->super.super._internal + 87);
  if (v8)
  {
    internal = element->super.super._internal;
    if ((*((_WORD *)internal + 14) & 8) == 0)
    {
      __break(0xC471u);
      JUMPOUT(0x1D7FF69ACLL);
    }
    MEMORY[0x1D82A3998](&v13, pseudoElement);
    WebCore::LocalDOMWindow::getComputedStyle(v8, internal, (const WTF::String *)&v13);
    v8 = kit(v14);
    v10 = v14;
    v14 = 0;
    if (v10)
      (*(void (**)(DOMObjectInternal *))(*(_QWORD *)v10 + 24))(v10);
    v11 = v13;
    v13 = 0;
    if (v11)
    {
      if (*(_DWORD *)v11 == 2)
        WTF::StringImpl::destroy(v11, v7);
      else
        *(_DWORD *)v11 -= 2;
    }
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v15, v7);
  return (DOMCSSStyleDeclaration *)v8;
}

- (DOMCSSRuleList)getMatchedCSSRules:(DOMElement *)element pseudoElement:(NSString *)pseudoElement
{
  return -[DOMDocument getMatchedCSSRules:pseudoElement:authorOnly:](self, "getMatchedCSSRules:pseudoElement:authorOnly:", element, pseudoElement, 1);
}

- (DOMCSSRuleList)getMatchedCSSRules:(DOMElement *)element pseudoElement:(NSString *)pseudoElement authorOnly:(BOOL)authorOnly
{
  StringImpl *v8;
  WebCore::LocalDOMWindow *v9;
  DOMCSSRuleList *v10;
  DOMObjectInternal *v11;
  WTF::StringImpl *v12;
  DOMCSSRuleList *result;
  WTF::StringImpl *v14;
  DOMObjectInternal *v15;
  _BYTE v16[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v16);
  v9 = (WebCore::LocalDOMWindow *)*((_QWORD *)self->super.super._internal + 87);
  if (!v9)
  {
    v10 = 0;
LABEL_11:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v16, v8);
    return v10;
  }
  if (!element
    || (element = (DOMElement *)element->super.super._internal, (WORD2(element[1].super.super.super.super.isa) & 8) != 0))
  {
    MEMORY[0x1D82A3998](&v14, pseudoElement);
    WebCore::LocalDOMWindow::getMatchedCSSRules(v9, (WebCore::Element *)element, (const WTF::String *)&v14);
    v10 = (DOMCSSRuleList *)kit(v15);
    v11 = v15;
    v15 = 0;
    if (v11)
      (*(void (**)(DOMObjectInternal *))(*(_QWORD *)v11 + 24))(v11);
    v12 = v14;
    v14 = 0;
    if (v12)
    {
      if (*(_DWORD *)v12 == 2)
        WTF::StringImpl::destroy(v12, v8);
      else
        *(_DWORD *)v12 -= 2;
    }
    goto LABEL_11;
  }
  result = (DOMCSSRuleList *)96;
  __break(0xC471u);
  return result;
}

- (DOMNodeList)getElementsByClassName:(NSString *)classNames
{
  const __CFString *v4;
  StringImpl *v5;
  DOMNodeList *v6;
  WTF::StringImpl *v7;
  WTF::StringImpl *v9;
  DOMObjectInternal *v10;
  _BYTE v11[80];
  WTF::StringImpl *v12;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)classNames, v4);
  v9 = v12;
  WebCore::ContainerNode::getElementsByClassName();
  v6 = (DOMNodeList *)kit(v10);
  if (!v10)
  {
LABEL_4:
    v7 = v9;
    if (!v9)
      goto LABEL_8;
    goto LABEL_5;
  }
  if (*((_DWORD *)v10 + 4) != 1)
  {
    --*((_DWORD *)v10 + 4);
    goto LABEL_4;
  }
  (*(void (**)())(*(_QWORD *)v10 + 8))();
  v7 = v9;
  if (!v9)
    goto LABEL_8;
LABEL_5:
  if (*(_DWORD *)v7 == 2)
    WTF::StringImpl::destroy(v7, v5);
  else
    *(_DWORD *)v7 -= 2;
LABEL_8:
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v11, v5);
  return v6;
}

- (BOOL)hasFocus
{
  void *v3;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  LOBYTE(self) = WebCore::Document::hasFocus(self->super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v3);
  return (char)self;
}

- (void)webkitCancelFullScreen
{
  WebCore::FullscreenManager *v3;
  void *v4;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  v3 = (WebCore::FullscreenManager *)*((_QWORD *)self->super.super._internal + 249);
  if (!v3)
    v3 = (WebCore::FullscreenManager *)WebCore::Document::ensureFullscreenManager(self->super.super._internal);
  WebCore::FullscreenManager::cancelFullscreen(v3);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v4);
}

- (void)webkitExitFullscreen
{
  Document *v3;
  void *v4;
  _BYTE v5[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5);
  WebCore::DocumentFullscreen::webkitExitFullscreen(self->super.super._internal, v3);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v5, v4);
}

- (DOMElement)getElementById:(NSString *)elementId
{
  const __CFString *v4;
  StringImpl *v5;
  DOMElement *v6;
  WTF::StringImpl *v8;
  WebCore::Node *v9;
  _BYTE v10[80];
  WTF::StringImpl *v11;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)elementId, v4);
  v8 = v11;
  WebCore::TreeScope::getElementById();
  v6 = (DOMElement *)kit(v9);
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

- (DOMElement)querySelector:(NSString *)selectors
{
  DOMObjectInternal *internal;
  StringImpl *v6;
  DOMElement *v7;
  WTF::StringImpl *v8;
  DOMElement *result;
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
  MEMORY[0x1D82A3998](&v11, selectors);
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
    result = (DOMElement *)std::__throw_bad_variant_access[abi:sn180100]();
    __break(1u);
  }
  else
  {
    v7 = (DOMElement *)kit(v12);
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

- (DOMNodeList)querySelectorAll:(NSString *)selectors
{
  DOMObjectInternal *internal;
  DOMObjectInternal *v6;
  StringImpl *v7;
  DOMNodeList *v8;
  uint64_t v9;
  WTF::StringImpl *v10;
  DOMNodeList *result;
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
  MEMORY[0x1D82A3998](&v13, selectors);
  WebCore::ContainerNode::querySelectorAll(internal, (const WTF::String *)&v13);
  if (!v16)
  {
    v6 = v14;
    v14 = 0;
    v8 = (DOMNodeList *)kit(v6);
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
  result = (DOMNodeList *)std::__throw_bad_variant_access[abi:sn180100]();
  __break(1u);
  return result;
}

- (DOMCSSStyleDeclaration)getOverrideStyle:(DOMElement *)element :(NSString *)pseudoElement
{
  return 0;
}

- (WebFrame)webFrame
{
  uint64_t v2;
  uint64_t v3;
  WebFrame **v4;

  v2 = *((_QWORD *)self->super.super._internal + 66);
  if (v2
    && (v3 = *(_QWORD *)(v2 + 8)) != 0
    && (v4 = *(WebFrame ***)(*(_QWORD *)(v3 + 280) + 16),
        (((uint64_t (*)(WebFrame **, SEL))(*v4)[67].super.isa)(v4, a2) & 1) == 0))
  {
    return v4[2];
  }
  else
  {
    return 0;
  }
}

- (NSURL)URLWithAttributeString:(NSString *)string
{
  StringImpl *v3;
  NSURL *v4;
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *v8;
  WTF::StringImpl *v9;

  MEMORY[0x1D82A3998](&v8, string);
  WebCore::Document::completeURL();
  v4 = (NSURL *)WTF::URL::operator NSURL *();
  v5 = v9;
  v9 = 0;
  if (!v5)
  {
LABEL_4:
    v6 = v8;
    v8 = 0;
    if (!v6)
      return v4;
    goto LABEL_7;
  }
  if (*(_DWORD *)v5 != 2)
  {
    *(_DWORD *)v5 -= 2;
    goto LABEL_4;
  }
  WTF::StringImpl::destroy(v5, v3);
  v6 = v8;
  v8 = 0;
  if (!v6)
    return v4;
LABEL_7:
  if (*(_DWORD *)v6 != 2)
  {
    *(_DWORD *)v6 -= 2;
    return v4;
  }
  WTF::StringImpl::destroy(v6, v3);
  return v4;
}

- (id)_documentRange
{
  DOMRange *v3;
  DOMElement *v4;

  v3 = -[DOMDocument createRange](self, "createRange");
  v4 = -[DOMDocument documentElement](self, "documentElement");
  if (v4)
    -[DOMRange selectNode:](v3, "selectNode:", v4);
  return v3;
}

@end
