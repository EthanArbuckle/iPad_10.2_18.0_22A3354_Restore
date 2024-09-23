@implementation DOMHTMLDocument

- (DOMDocumentFragment)createDocumentFragmentWithMarkupString:(NSString *)markupString baseURL:(NSURL *)baseURL
{
  StringImpl *v5;
  DOMDocumentFragment *v6;
  WebCore::Node *v7;
  WTF::StringImpl *v8;
  WTF::StringImpl *v9;
  WTF::StringImpl *v11;
  WTF::StringImpl *v12;
  WebCore::Node *v13;

  MEMORY[0x1D82A3998](&v12, markupString);
  MEMORY[0x1D82A3998](&v11, -[NSURL absoluteString](baseURL, "absoluteString"));
  WebCore::createFragmentFromMarkup();
  v6 = (DOMDocumentFragment *)kit(v13);
  v7 = v13;
  v13 = 0;
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
  v8 = v11;
  v11 = 0;
  if (!v8)
  {
LABEL_9:
    v9 = v12;
    v12 = 0;
    if (!v9)
      return v6;
    goto LABEL_12;
  }
  if (*(_DWORD *)v8 != 2)
  {
    *(_DWORD *)v8 -= 2;
    goto LABEL_9;
  }
  WTF::StringImpl::destroy(v8, v5);
  v9 = v12;
  v12 = 0;
  if (!v9)
    return v6;
LABEL_12:
  if (*(_DWORD *)v9 != 2)
  {
    *(_DWORD *)v9 -= 2;
    return v6;
  }
  WTF::StringImpl::destroy(v9, v5);
  return v6;
}

- (DOMDocumentFragment)createDocumentFragmentWithText:(NSString *)text
{
  const WTF::String *v4;
  StringImpl *v5;
  DOMDocumentFragment *v6;
  WebCore::Node *v7;
  WTF::StringImpl *v8;
  WebCore::Node *v9;
  WebCore::Node *v10;
  WTF::StringImpl *v12;
  WebCore::Node *v13;
  WebCore::Node *v14;
  WebCore::Node *v15;

  WebCore::makeRangeSelectingNodeContents(self->super.super.super._internal, (Node *)a2);
  MEMORY[0x1D82A3998](&v12, text);
  WebCore::createFragmentFromText((WebCore *)&v13, (const WebCore::SimpleRange *)&v12, v4);
  v6 = (DOMDocumentFragment *)kit(v15);
  v7 = v15;
  v15 = 0;
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
  v8 = v12;
  v12 = 0;
  if (!v8)
  {
LABEL_9:
    v9 = v14;
    v14 = 0;
    if (!v9)
      goto LABEL_16;
    goto LABEL_12;
  }
  if (*(_DWORD *)v8 != 2)
  {
    *(_DWORD *)v8 -= 2;
    goto LABEL_9;
  }
  WTF::StringImpl::destroy(v8, v5);
  v9 = v14;
  v14 = 0;
  if (!v9)
    goto LABEL_16;
LABEL_12:
  if (*((_DWORD *)v9 + 6) == 2)
  {
    if ((*((_WORD *)v9 + 15) & 0x400) == 0)
      WebCore::Node::removedLastRef(v9);
  }
  else
  {
    *((_DWORD *)v9 + 6) -= 2;
  }
LABEL_16:
  v10 = v13;
  v13 = 0;
  if (!v10)
    return v6;
  if (*((_DWORD *)v10 + 6) != 2)
  {
    *((_DWORD *)v10 + 6) -= 2;
    return v6;
  }
  if ((*((_WORD *)v10 + 15) & 0x400) != 0)
    return v6;
  WebCore::Node::removedLastRef(v10);
  return v6;
}

- (id)_createDocumentFragmentWithMarkupString:(id)a3 baseURLString:(id)a4
{
  StringImpl *v6;
  uint64_t v7;
  WTF::StringImpl *v8;
  WTF::StringImpl *v9;
  WTF::StringImpl *v11;
  WTF::StringImpl *v12;

  MEMORY[0x1D82A3998](&v11, a4);
  WebCore::Document::completeURL();
  v7 = WTF::URL::operator NSURL *();
  v8 = v12;
  v12 = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 2)
    {
      WTF::StringImpl::destroy(v8, v6);
      v9 = v11;
      v11 = 0;
      if (!v9)
        return -[DOMHTMLDocument createDocumentFragmentWithMarkupString:baseURL:](self, "createDocumentFragmentWithMarkupString:baseURL:", a3, v7, v11, v12);
      goto LABEL_7;
    }
    *(_DWORD *)v8 -= 2;
  }
  v9 = v11;
  v11 = 0;
  if (!v9)
    return -[DOMHTMLDocument createDocumentFragmentWithMarkupString:baseURL:](self, "createDocumentFragmentWithMarkupString:baseURL:", a3, v7, v11, v12);
LABEL_7:
  if (*(_DWORD *)v9 == 2)
    WTF::StringImpl::destroy(v9, v6);
  else
    *(_DWORD *)v9 -= 2;
  return -[DOMHTMLDocument createDocumentFragmentWithMarkupString:baseURL:](self, "createDocumentFragmentWithMarkupString:baseURL:", a3, v7, v11, v12);
}

- (DOMHTMLCollection)embeds
{
  void *v3;
  DOMHTMLCollection *v4;
  DOMObjectInternal *v5;
  DOMObjectInternal *v7;
  _BYTE v8[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  MEMORY[0x1D82A6DAC](&v7, self->super.super.super._internal);
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

- (DOMHTMLCollection)plugins
{
  void *v3;
  DOMHTMLCollection *v4;
  DOMObjectInternal *v5;
  DOMObjectInternal *v7;
  _BYTE v8[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  MEMORY[0x1D82A6DAC](&v7, self->super.super.super._internal);
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

- (DOMHTMLCollection)scripts
{
  void *v3;
  DOMHTMLCollection *v4;
  DOMObjectInternal *v5;
  DOMObjectInternal *v7;
  _BYTE v8[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  MEMORY[0x1D82A6DE8](&v7, self->super.super.super._internal);
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

- (int)width
{
  return 0;
}

- (int)height
{
  return 0;
}

- (NSString)dir
{
  void *v3;
  const __CFString *v4;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  if (*(_QWORD *)WebCore::Document::dir(self->super.super.super._internal))
    v4 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v4 = &stru_1E9D6EC48;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v3);
  return &v4->isa;
}

- (void)setDir:(NSString *)dir
{
  const __CFString *v4;
  StringImpl *v5;
  void *v6;
  WTF::StringImpl *v7;
  _BYTE v8[80];
  WTF::StringImpl *v9;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)dir, v4);
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

- (NSString)designMode
{
  StringImpl *v3;
  const __CFString *v4;
  WTF::StringImpl *v6;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  WebCore::Document::designMode(self->super.super.super._internal);
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

- (void)setDesignMode:(NSString *)designMode
{
  DOMObjectInternal *internal;
  StringImpl *v6;
  WTF::StringImpl *v7;
  void *v8;
  WTF::StringImpl *v9;
  _BYTE v10[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v10);
  internal = self->super.super.super._internal;
  MEMORY[0x1D82A3998](&v9, designMode);
  WebCore::Document::setDesignMode(internal, (const WTF::String *)&v9);
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

- (NSString)compatMode
{
  StringImpl *v3;
  const __CFString *v4;
  WTF::StringImpl *v6;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  WebCore::Document::compatMode(self->super.super.super._internal);
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

- (NSString)bgColor
{
  void *v3;
  const __CFString *v4;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  if (*(_QWORD *)WebCore::Document::bgColor(self->super.super.super._internal))
    v4 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v4 = &stru_1E9D6EC48;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v3);
  return &v4->isa;
}

- (void)setBgColor:(NSString *)bgColor
{
  const __CFString *v4;
  StringImpl *v5;
  void *v6;
  WTF::StringImpl *v7;
  _BYTE v8[80];
  WTF::StringImpl *v9;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)bgColor, v4);
  v7 = v9;
  WebCore::Document::setBgColor();
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

- (NSString)fgColor
{
  void *v3;
  const __CFString *v4;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  if (*(_QWORD *)WebCore::Document::fgColor(self->super.super.super._internal))
    v4 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v4 = &stru_1E9D6EC48;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v3);
  return &v4->isa;
}

- (void)setFgColor:(NSString *)fgColor
{
  const __CFString *v4;
  StringImpl *v5;
  void *v6;
  WTF::StringImpl *v7;
  _BYTE v8[80];
  WTF::StringImpl *v9;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)fgColor, v4);
  v7 = v9;
  WebCore::Document::setFgColor();
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

- (NSString)alinkColor
{
  void *v3;
  const __CFString *v4;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  if (*(_QWORD *)WebCore::Document::alinkColor(self->super.super.super._internal))
    v4 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v4 = &stru_1E9D6EC48;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v3);
  return &v4->isa;
}

- (void)setAlinkColor:(NSString *)alinkColor
{
  const __CFString *v4;
  StringImpl *v5;
  void *v6;
  WTF::StringImpl *v7;
  _BYTE v8[80];
  WTF::StringImpl *v9;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)alinkColor, v4);
  v7 = v9;
  WebCore::Document::setAlinkColor();
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

- (NSString)linkColor
{
  void *v3;
  const __CFString *v4;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  if (*(_QWORD *)WebCore::Document::linkColorForBindings(self->super.super.super._internal))
    v4 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v4 = &stru_1E9D6EC48;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v3);
  return &v4->isa;
}

- (void)setLinkColor:(NSString *)linkColor
{
  const __CFString *v4;
  StringImpl *v5;
  void *v6;
  WTF::StringImpl *v7;
  _BYTE v8[80];
  WTF::StringImpl *v9;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)linkColor, v4);
  v7 = v9;
  WebCore::Document::setLinkColorForBindings();
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

- (NSString)vlinkColor
{
  void *v3;
  const __CFString *v4;
  _BYTE v6[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6);
  if (*(_QWORD *)WebCore::Document::vlinkColor(self->super.super.super._internal))
    v4 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v4 = &stru_1E9D6EC48;
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v6, v3);
  return &v4->isa;
}

- (void)setVlinkColor:(NSString *)vlinkColor
{
  const __CFString *v4;
  StringImpl *v5;
  void *v6;
  WTF::StringImpl *v7;
  _BYTE v8[80];
  WTF::StringImpl *v9;

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v8);
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)vlinkColor, v4);
  v7 = v9;
  WebCore::Document::setVlinkColor();
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

- (void)open
{
  StringImpl *v3;
  void *v4;
  WTF::StringImpl *v5;
  char v6;
  _BYTE v7[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7);
  WebCore::Document::open(self->super.super.super._internal, 0);
  if (!v6 || !v5)
    goto LABEL_5;
  if (*(_DWORD *)v5 != 2)
  {
    *(_DWORD *)v5 -= 2;
LABEL_5:
    WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v3);
    return;
  }
  WTF::StringImpl::destroy(v5, v3);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v7, v4);
}

- (void)close
{
  void *v3;
  _BYTE v4[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4);
  WebCore::Document::close(self->super.super.super._internal);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v4, v3);
}

- (void)write:(NSString *)text
{
  uint64_t v4;
  uint64_t v5;
  StringImpl *v6;
  WTF *v7;
  uint64_t v8;
  WTF::StringImpl **v9;
  uint64_t v10;
  WTF::StringImpl *v11;
  WTF::StringImpl *v12;
  WTF *v13;
  WTF::StringImpl *v14;
  char v15;
  _BYTE v16[80];
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v16);
  MEMORY[0x1D82A3998](v17, text);
  v4 = WTF::fastMalloc((WTF *)0x10);
  *(_DWORD *)v4 = 1;
  *(_QWORD *)(v4 + 8) = 0;
  v13 = (WTF *)v4;
  v5 = v17[0];
  if (v17[0])
    *(_DWORD *)v17[0] += 2;
  *(_QWORD *)(v4 + 8) = v5;
  WebCore::Document::write();
  if (v15 && v14)
  {
    if (*(_DWORD *)v14 == 2)
    {
      WTF::StringImpl::destroy(v14, v6);
      v7 = v13;
      if (!v13)
        goto LABEL_16;
      goto LABEL_8;
    }
    *(_DWORD *)v14 -= 2;
  }
  v7 = v13;
  if (!v13)
    goto LABEL_16;
LABEL_8:
  v9 = (WTF::StringImpl **)((char *)v7 + 8);
  v8 = *(unsigned int *)v7;
  if ((_DWORD)v8)
  {
    v10 = 8 * v8;
    do
    {
      v11 = *v9;
      *v9 = 0;
      if (v11)
      {
        if (*(_DWORD *)v11 == 2)
          WTF::StringImpl::destroy(v11, v6);
        else
          *(_DWORD *)v11 -= 2;
      }
      ++v9;
      v10 -= 8;
    }
    while (v10);
  }
  WTF::fastFree(v7, v6);
LABEL_16:
  v12 = (WTF::StringImpl *)v17[0];
  v17[0] = 0;
  if (v12)
  {
    if (*(_DWORD *)v12 == 2)
      WTF::StringImpl::destroy(v12, v6);
    else
      *(_DWORD *)v12 -= 2;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v16, v6);
}

- (void)writeln:(NSString *)text
{
  uint64_t v4;
  uint64_t v5;
  StringImpl *v6;
  WTF *v7;
  uint64_t v8;
  WTF::StringImpl **v9;
  uint64_t v10;
  WTF::StringImpl *v11;
  WTF::StringImpl *v12;
  WTF *v13;
  WTF::StringImpl *v14;
  char v15;
  _BYTE v16[80];
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v16);
  MEMORY[0x1D82A3998](v17, text);
  v4 = WTF::fastMalloc((WTF *)0x10);
  *(_DWORD *)v4 = 1;
  *(_QWORD *)(v4 + 8) = 0;
  v13 = (WTF *)v4;
  v5 = v17[0];
  if (v17[0])
    *(_DWORD *)v17[0] += 2;
  *(_QWORD *)(v4 + 8) = v5;
  WebCore::Document::writeln();
  if (v15 && v14)
  {
    if (*(_DWORD *)v14 == 2)
    {
      WTF::StringImpl::destroy(v14, v6);
      v7 = v13;
      if (!v13)
        goto LABEL_16;
      goto LABEL_8;
    }
    *(_DWORD *)v14 -= 2;
  }
  v7 = v13;
  if (!v13)
    goto LABEL_16;
LABEL_8:
  v9 = (WTF::StringImpl **)((char *)v7 + 8);
  v8 = *(unsigned int *)v7;
  if ((_DWORD)v8)
  {
    v10 = 8 * v8;
    do
    {
      v11 = *v9;
      *v9 = 0;
      if (v11)
      {
        if (*(_DWORD *)v11 == 2)
          WTF::StringImpl::destroy(v11, v6);
        else
          *(_DWORD *)v11 -= 2;
      }
      ++v9;
      v10 -= 8;
    }
    while (v10);
  }
  WTF::fastFree(v7, v6);
LABEL_16:
  v12 = (WTF::StringImpl *)v17[0];
  v17[0] = 0;
  if (v12)
  {
    if (*(_DWORD *)v12 == 2)
      WTF::StringImpl::destroy(v12, v6);
    else
      *(_DWORD *)v12 -= 2;
  }
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v16, v6);
}

- (void)clear
{
  void *v2;
  _BYTE v3[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v3);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v3, v2);
}

- (void)captureEvents
{
  void *v2;
  _BYTE v3[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v3);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v3, v2);
}

- (void)releaseEvents
{
  void *v2;
  _BYTE v3[80];

  WebCore::JSMainThreadNullState::JSMainThreadNullState((WebCore::JSMainThreadNullState *)v3);
  WebCore::JSMainThreadNullState::~JSMainThreadNullState((WebCore::JSMainThreadNullState *)v3, v2);
}

@end
