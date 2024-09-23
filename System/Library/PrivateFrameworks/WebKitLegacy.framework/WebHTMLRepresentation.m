@implementation WebHTMLRepresentation

+ (id)supportedMIMETypes
{
  const void *v3;

  if ((_MergedGlobals_19 & 1) != 0)
    return (id)qword_1ECEC98C8;
  v3 = (const void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "supportedNonImageMIMETypes"), "arrayByAddingObjectsFromArray:", objc_msgSend(a1, "supportedImageMIMETypes")), "arrayByAddingObjectsFromArray:", objc_msgSend(a1, "supportedMediaMIMETypes"));
  qword_1ECEC98C8 = (uint64_t)v3;
  if (v3)
    CFRetain(v3);
  _MergedGlobals_19 = 1;
  return (id)qword_1ECEC98C8;
}

+ (id)supportedMediaMIMETypes
{
  id result;
  WTF **v3;
  void *v4;

  if (byte_1ECEC98C1 == 1)
    return (id)qword_1ECEC98D0;
  v3 = (WTF **)WebCore::MIMETypeRegistry::supportedMediaMIMETypes((WebCore::MIMETypeRegistry *)a1);
  WTF::createNSArray<WTF::HashSet<WTF::String,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTableTraits> const&>(&v4, v3);
  result = v4;
  qword_1ECEC98D0 = (uint64_t)v4;
  byte_1ECEC98C1 = 1;
  return result;
}

+ (id)supportedNonImageMIMETypes
{
  id result;
  WTF **v3;
  void *v4;

  if (byte_1ECEC98C2 == 1)
    return (id)qword_1ECEC98D8;
  v3 = (WTF **)WebCore::MIMETypeRegistry::supportedNonImageMIMETypes((WebCore::MIMETypeRegistry *)a1);
  WTF::createNSArray<WTF::HashSet<WTF::String,WTF::ASCIICaseInsensitiveHash,WTF::HashTraits<WTF::String>,WTF::HashTableTraits> &>(&v4, v3);
  result = v4;
  qword_1ECEC98D8 = (uint64_t)v4;
  byte_1ECEC98C2 = 1;
  return result;
}

+ (id)supportedImageMIMETypes
{
  void *v3;
  WTF *v4;
  WTF *v5;
  WTF::StringImpl *v6;

  if ((byte_1ECEC98C3 & 1) != 0)
    return (id)qword_1ECEC98E0;
  WebCore::MIMETypeRegistry::supportedImageMIMETypes((WebCore::MIMETypeRegistry *)a1);
  WTF::createNSArray<WTF::FixedVector<WTF::ASCIILiteral>>(&v6, (unsigned int **)&v5);
  v4 = v5;
  qword_1ECEC98E0 = (uint64_t)v6;
  v5 = 0;
  if (v4)
    WTF::fastFree(v4, v3);
  byte_1ECEC98C3 = 1;
  return (id)qword_1ECEC98E0;
}

+ (id)unsupportedTextMIMETypes
{
  void *v3;
  WTF *v4;
  WTF *v5;
  WTF::StringImpl *v6;

  if ((byte_1ECEC98C4 & 1) != 0)
    return (id)qword_1ECEC98E8;
  WebCore::MIMETypeRegistry::unsupportedTextMIMETypes((WebCore::MIMETypeRegistry *)a1);
  WTF::createNSArray<WTF::FixedVector<WTF::ASCIILiteral>>(&v6, (unsigned int **)&v5);
  v4 = v5;
  qword_1ECEC98E8 = (uint64_t)v6;
  v5 = 0;
  if (v4)
    WTF::fastFree(v4, v3);
  byte_1ECEC98C4 = 1;
  return (id)qword_1ECEC98E8;
}

- (WebHTMLRepresentation)init
{
  WebHTMLRepresentation *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WebHTMLRepresentation;
  v2 = -[WebHTMLRepresentation init](&v4, sel_init);
  if (v2)
    v2->_private = objc_alloc_init(WebHTMLRepresentationPrivate);
  return v2;
}

- (void)dealloc
{
  WebHTMLRepresentationPrivate *v3;
  objc_super v4;

  v3 = self->_private;
  if (v3 && v3->includedInWebKitStatistics)
    --WebHTMLRepresentationCount;

  v4.receiver = self;
  v4.super_class = (Class)WebHTMLRepresentation;
  -[WebHTMLRepresentation dealloc](&v4, sel_dealloc);
}

- (void)_redirectDataToManualLoader:(id)a3 forPluginView:(id)a4
{
  self->_private->manualLoader = (WebPluginManualLoader *)a3;
  self->_private->pluginView = (WAKView *)a4;
}

- (void)setDataSource:(id)a3
{
  self->_private->dataSource = (WebDataSource *)a3;
  if (!self->_private->includedInWebKitStatistics)
  {
    if (objc_msgSend((id)objc_msgSend(a3, "webFrame"), "_isIncludedInWebKitStatistics"))
    {
      self->_private->includedInWebKitStatistics = 1;
      ++WebHTMLRepresentationCount;
    }
  }
}

- (BOOL)_isDisplayingWebArchive
{
  return objc_msgSend(-[WebDataSource _responseMIMEType](self->_private->dataSource, "_responseMIMEType"), "_webkit_isCaseInsensitiveEqualToString:", CFSTR("application/x-webarchive"));
}

- (void)receivedData:(id)a3 withDataSource:(id)a4
{
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  StringImpl *v12;
  CFTypeRef v13;
  WTF::StringImpl *v14;
  WTF::StringImpl *v15;
  WTF::StringImpl *v16;
  WebHTMLRepresentationPrivate *v17;
  WAKView *pluginView;
  WTF::StringImpl *v19;
  WTF::StringImpl *v20;
  WTF::StringImpl *v21;
  CFTypeRef cf;

  if (self)
    CFRetain(self);
  v7 = (_QWORD *)objc_msgSend(a4, "webFrame");
  v8 = v7;
  if (v7)
  {
    if (!self->_private->pluginView)
      objc_msgSend(v7, "_commitData:", a3);
    v9 = *(_QWORD *)(v8[1] + 8);
    if ((*(_WORD *)(*(_QWORD *)(v9 + 296) + 3358) & 0x10) == 0)
      goto LABEL_25;
    v10 = *(_QWORD *)(v9 + 280);
    v11 = *(_QWORD *)(v10 + 88);
    if (!v11)
      goto LABEL_25;
    (*(void (**)(WTF::StringImpl **__return_ptr, _QWORD, uint64_t))(**(_QWORD **)(v10 + 16) + 648))(&v19, *(_QWORD *)(v10 + 16), v11 + 1272);
    WebCore::DocumentLoader::cancelMainResourceLoad();
    v13 = cf;
    cf = 0;
    if (v13)
      CFRelease(v13);
    v14 = v21;
    v21 = 0;
    if (v14)
    {
      if (*(_DWORD *)v14 == 2)
      {
        WTF::StringImpl::destroy(v14, v12);
        v15 = v20;
        v20 = 0;
        if (!v15)
          goto LABEL_20;
LABEL_18:
        if (*(_DWORD *)v15 == 2)
        {
          WTF::StringImpl::destroy(v15, v12);
          v16 = v19;
          v19 = 0;
          if (!v16)
            goto LABEL_25;
LABEL_23:
          if (*(_DWORD *)v16 == 2)
          {
            WTF::StringImpl::destroy(v16, v12);
            v17 = self->_private;
            pluginView = v17->pluginView;
            if (pluginView)
              goto LABEL_26;
            goto LABEL_29;
          }
          *(_DWORD *)v16 -= 2;
LABEL_25:
          v17 = self->_private;
          pluginView = v17->pluginView;
          if (pluginView)
          {
LABEL_26:
            if (!v17->hasSentResponseToPlugin)
            {
              -[WebPluginManualLoader pluginView:receivedResponse:](v17->manualLoader, "pluginView:receivedResponse:", pluginView, objc_msgSend(a4, "response"));
              self->_private->hasSentResponseToPlugin = 1;
              v17 = self->_private;
              pluginView = v17->pluginView;
            }
            -[WebPluginManualLoader pluginView:receivedData:](v17->manualLoader, "pluginView:receivedData:", pluginView, a3, v19, v20);
          }
LABEL_29:
          CFRelease(self);
          return;
        }
        *(_DWORD *)v15 -= 2;
LABEL_20:
        v16 = v19;
        v19 = 0;
        if (!v16)
          goto LABEL_25;
        goto LABEL_23;
      }
      *(_DWORD *)v14 -= 2;
    }
    v15 = v20;
    v20 = 0;
    if (!v15)
      goto LABEL_20;
    goto LABEL_18;
  }
  if (self)
    goto LABEL_29;
}

- (void)receivedError:(id)a3 withDataSource:(id)a4
{
  WebHTMLRepresentationPrivate *v5;
  WAKView *pluginView;

  v5 = self->_private;
  pluginView = v5->pluginView;
  if (pluginView)
    -[WebPluginManualLoader pluginView:receivedError:](v5->manualLoader, "pluginView:receivedError:", pluginView, a3);
}

- (void)finishedLoadingWithDataSource:(id)a3
{
  _QWORD *v4;
  WebHTMLRepresentationPrivate *v5;
  _QWORD *v6;
  void *v7;
  WebCore::Editor *v8;

  v4 = (_QWORD *)objc_msgSend(a3, "webFrame");
  v5 = self->_private;
  if (v5->pluginView)
  {
    -[WebPluginManualLoader pluginViewFinishedLoading:](v5->manualLoader, "pluginViewFinishedLoading:");
  }
  else
  {
    v6 = v4;
    if (v4)
    {
      v7 = (void *)objc_msgSend(v4, "webView");
      if ((_QWORD *)objc_msgSend(v7, "mainFrame") == v6)
      {
        if (objc_msgSend(v7, "isEditable"))
        {
          v8 = (WebCore::Editor *)WebCore::Document::editor(*(WebCore::Document **)(*(_QWORD *)(v6[1] + 8) + 296));
          WebCore::Editor::applyEditingStyleToBodyElement(v8);
        }
      }
    }
  }
}

- (BOOL)canProvideDocumentSource
{
  return -[WebFrame _canProvideDocumentSource](-[WebDataSource webFrame](self->_private->dataSource, "webFrame"), "_canProvideDocumentSource");
}

- (BOOL)canSaveAsWebArchive
{
  return -[WebFrame _canSaveAsWebArchive](-[WebDataSource webFrame](self->_private->dataSource, "webFrame"), "_canSaveAsWebArchive");
}

- (id)documentSource
{
  void *dataSource;
  WebFrame *v4;
  LocalFrame *m_ptr;
  uint64_t v6;
  CFTypeRef v7;
  NSData *v8;
  NSData *v9;
  StringImpl *v10;
  void *v11;
  WTF::StringImpl *v12;
  WebCore::SharedBuffer *v14;
  id v15;
  CFTypeRef v16;
  CFTypeRef v17;
  CFTypeRef cf;
  char v19;

  if (-[WebHTMLRepresentation _isDisplayingWebArchive](self, "_isDisplayingWebArchive"))
  {
    dataSource = self->_private->dataSource;
    if (dataSource)
    {
      objc_msgSend(dataSource, "_documentLoader");
      dataSource = (void *)cf;
    }
    else
    {
      cf = 0;
    }
    v14 = (WebCore::SharedBuffer *)WebCore::DocumentLoader::parsedArchiveData((WebCore::DocumentLoader *)dataSource);
    v15 = objc_alloc(MEMORY[0x1E0CB3940]);
    if (v14)
    {
      WebCore::SharedBuffer::createNSData(v14);
      v16 = cf;
    }
    else
    {
      v16 = 0;
    }
    v7 = (id)CFMakeCollectable((CFTypeRef)objc_msgSend(v15, "initWithData:encoding:", v16, 4, cf));
    if (v14)
    {
      v17 = cf;
      cf = 0;
      if (v17)
      {
        CFRelease(v17);
        return (id)v7;
      }
    }
    return (id)v7;
  }
  v4 = -[WebDataSource webFrame](self->_private->dataSource, "webFrame");
  if (!v4)
    return 0;
  m_ptr = v4->_private->coreFrame.m_ptr;
  if (!m_ptr)
    return 0;
  v6 = *((_QWORD *)m_ptr + 37);
  if (!v6)
    return 0;
  v7 = *(CFTypeRef *)(v6 + 1744);
  if (!v7)
    return (id)v7;
  v8 = -[WebDataSource data](self->_private->dataSource, "data");
  if (!v8)
    return 0;
  v9 = v8;
  -[NSData bytes](v8, "bytes");
  -[NSData length](v9, "length");
  v19 = 0;
  PAL::TextEncoding::decode();
  if (!cf)
    return &stru_1E9D6EC48;
  v11 = (void *)WTF::StringImpl::operator NSString *();
  v12 = (WTF::StringImpl *)cf;
  cf = 0;
  if (*(_DWORD *)v12 == 2)
    WTF::StringImpl::destroy(v12, v10);
  else
    *(_DWORD *)v12 -= 2;
  return v11;
}

- (id)title
{
  id result;
  uint64_t v3;

  -[WebDataSource _documentLoader](self->_private->dataSource, "_documentLoader");
  result = *(id *)(v3 + 1608);
  if (result)
  {
    if (*((_DWORD *)result + 1))
      return (id)WTF::StringImpl::operator NSString *();
    else
      return 0;
  }
  return result;
}

- (id)DOMDocument
{
  return -[WebFrame DOMDocument](-[WebDataSource webFrame](self->_private->dataSource, "webFrame"), "DOMDocument");
}

- (id)elementWithName:(id)a3 inForm:(id)a4
{
  uint64_t v5;
  const __CFString *v6;
  WebCore::HTMLFormElement *v7;
  _DWORD *v8;
  uint64_t v9;
  StringImpl *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  WebCore::Node *v14;
  uint64_t v15;
  WebCore::Node *v16;
  WTF::StringImpl *v18;

  v5 = core((uint64_t)a4);
  if (!v5)
    return 0;
  v7 = (WebCore::HTMLFormElement *)v5;
  if ((*(_WORD *)(v5 + 28) & 0x10) == 0
    || *(_QWORD *)(*(_QWORD *)(v5 + 96) + 24) != *(_QWORD *)(*MEMORY[0x1E0DD6008] + 24))
  {
    return 0;
  }
  v8 = (_DWORD *)MEMORY[0x1E0DD2760];
  ++*MEMORY[0x1E0DD2760];
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)a3, v6);
  v9 = WebCore::HTMLFormElement::unsafeListedElements(v7);
  v11 = *(unsigned int *)(v9 + 12);
  if (!(_DWORD)v11)
  {
LABEL_16:
    v16 = 0;
    goto LABEL_21;
  }
  v12 = *(_QWORD *)v9;
  v13 = 8 * v11;
  while (1)
  {
    if (*(_QWORD *)v12)
    {
      v14 = *(WebCore::Node **)(*(_QWORD *)v12 + 8);
      if (v14)
        break;
    }
LABEL_7:
    v12 += 8;
    v13 -= 8;
    if (!v13)
      goto LABEL_16;
  }
  *((_DWORD *)v14 + 6) += 2;
  v15 = (*(uint64_t (**)(WebCore::Node *))(*(_QWORD *)v14 + 456))(v14);
  if (*(WTF::StringImpl **)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v15 + 128))(v15) != v18)
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
    goto LABEL_7;
  }
  v16 = kit(v14);
  if (*((_DWORD *)v14 + 6) == 2)
  {
    if ((*((_WORD *)v14 + 15) & 0x400) == 0)
      WebCore::Node::removedLastRef(v14);
  }
  else
  {
    *((_DWORD *)v14 + 6) -= 2;
  }
LABEL_21:
  if (v18)
  {
    if (*(_DWORD *)v18 == 2)
      WTF::StringImpl::destroy(v18, v10);
    else
      *(_DWORD *)v18 -= 2;
  }
  --*v8;
  return v16;
}

- (BOOL)elementDoesAutoComplete:(id)a3
{
  uint64_t v3;
  WebCore::HTMLInputElement *v4;

  v3 = core((uint64_t)a3);
  if (v3
    && (v4 = (WebCore::HTMLInputElement *)v3, (*(_WORD *)(v3 + 28) & 0x10) != 0)
    && *(_QWORD *)(*(_QWORD *)(v3 + 96) + 24) == *(_QWORD *)(*MEMORY[0x1E0DD60B8] + 24)
    && WebCore::HTMLInputElement::isTextField((WebCore::HTMLInputElement *)v3)
    && (WebCore::HTMLInputElement::isPasswordField(v4) & 1) == 0)
  {
    return WebCore::HTMLInputElement::shouldAutocomplete(v4);
  }
  else
  {
    return 0;
  }
}

- (BOOL)elementIsPassword:(id)a3
{
  uint64_t v3;

  v3 = core((uint64_t)a3);
  if (v3
    && (*(_WORD *)(v3 + 28) & 0x10) != 0
    && *(_QWORD *)(*(_QWORD *)(v3 + 96) + 24) == *(_QWORD *)(*MEMORY[0x1E0DD60B8] + 24))
  {
    return WebCore::HTMLInputElement::isPasswordField((WebCore::HTMLInputElement *)v3);
  }
  else
  {
    return 0;
  }
}

- (id)formForElement:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = core((uint64_t)a3);
  if (!v3
    || (*(_WORD *)(v3 + 28) & 0x10) == 0
    || *(_QWORD *)(*(_QWORD *)(v3 + 96) + 24) != *(_QWORD *)(*MEMORY[0x1E0DD60B8] + 24))
  {
    return 0;
  }
  v4 = *(_QWORD *)(v3 + 120);
  if (v4)
    return kit(*(WebCore::Node **)(v4 + 8));
  else
    return kit(0);
}

- (id)currentForm
{
  WebCore::Node *v2;
  WebCore::Node *v4;

  WebCore::FrameSelection::currentForm(*(WebCore::FrameSelection **)(*(_QWORD *)(*(_QWORD *)((_QWORD)-[WebDataSource webFrame](self->_private->dataSource, "webFrame")[8]
                                                                                           + 8)
                                                                               + 296)
                                                                   + 3064));
  v2 = kit(v4);
  if (!v4)
    return v2;
  if (*((_DWORD *)v4 + 6) != 2)
  {
    *((_DWORD *)v4 + 6) -= 2;
    return v2;
  }
  if ((*((_WORD *)v4 + 15) & 0x400) != 0)
    return v2;
  WebCore::Node::removedLastRef(v4);
  return v2;
}

- (id)controlsInForm:(id)a3
{
  id result;
  _DWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  WebCore::Node *v10;
  uint64_t v11;
  WebCore::Node *v12;
  int v13;

  result = (id)core((uint64_t)a3);
  if (result)
  {
    if ((*((_WORD *)result + 14) & 0x10) == 0)
      return 0;
    if (*(_QWORD *)(*((_QWORD *)result + 12) + 24) != *(_QWORD *)(*MEMORY[0x1E0DD6008] + 24))
      return 0;
    v4 = (_DWORD *)MEMORY[0x1E0DD2760];
    ++*MEMORY[0x1E0DD2760];
    v5 = WebCore::HTMLFormElement::unsafeListedElements((WebCore::HTMLFormElement *)result);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(unsigned int *)(v5 + 12));
    v7 = *(unsigned int *)(v5 + 12);
    if ((_DWORD)v7)
    {
      v8 = *(_QWORD *)v5;
      v9 = 8 * v7;
      while (1)
      {
        if (*(_QWORD *)v8)
        {
          v10 = *(WebCore::Node **)(*(_QWORD *)v8 + 8);
          if (v10)
            break;
        }
LABEL_8:
        v8 += 8;
        v9 -= 8;
        if (!v9)
          goto LABEL_20;
      }
      *((_DWORD *)v10 + 6) += 2;
      v11 = (*(uint64_t (**)(WebCore::Node *))(*(_QWORD *)v10 + 456))(v10);
      if (((*(uint64_t (**)(uint64_t))(*(_QWORD *)v11 + 120))(v11) & 1) != 0)
      {
        v12 = kit(v10);
        v13 = *((_DWORD *)v10 + 6) - 2;
        if (*((_DWORD *)v10 + 6) == 2)
          goto LABEL_13;
      }
      else
      {
        v12 = 0;
        v13 = *((_DWORD *)v10 + 6) - 2;
        if (*((_DWORD *)v10 + 6) == 2)
        {
LABEL_13:
          if ((*((_WORD *)v10 + 15) & 0x400) == 0)
            WebCore::Node::removedLastRef(v10);
          goto LABEL_17;
        }
      }
      *((_DWORD *)v10 + 6) = v13;
LABEL_17:
      if (v12)
        objc_msgSend(v6, "addObject:", v12);
      goto LABEL_8;
    }
LABEL_20:
    if (objc_msgSend(v6, "count"))
    {
      result = (id)CFMakeCollectable(v6);
    }
    else
    {
      if (v6)
        CFRelease(v6);
      result = 0;
    }
    --*v4;
  }
  return result;
}

- (id)searchForLabels:(id)a3 beforeElement:(id)a4
{
  return -[WebHTMLRepresentation searchForLabels:beforeElement:resultDistance:resultIsInCellAbove:](self, "searchForLabels:beforeElement:resultDistance:resultIsInCellAbove:", a3, a4, 0, 0);
}

- (id)searchForLabels:(id)a3 beforeElement:(id)a4 resultDistance:(unint64_t *)a5 resultIsInCellAbove:(BOOL *)a6
{
  uint64_t v10;
  Node *v11;
  JSC::Yarr::RegularExpression *v12;
  WebCore::NodeTraversal *v13;
  uint64_t Child;
  unsigned int v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v24;
  WTF::StringImpl *v25;
  int v26;
  StringImpl *v27;
  int v28;
  WTF::StringImpl *v29;
  int v30;
  StringImpl *v31;
  __CFString *v32;
  WTF::StringImpl *v33;
  int v34;
  unsigned int v35;
  WTF::StringImpl *v36;
  WTF::StringImpl *v37;
  int v38;
  WebCore::NodeTraversal *v39;
  StringImpl *v40;
  WTF::StringImpl *v41;
  unint64_t v42;
  const __CFString *v44;
  unint64_t *v45;
  BOOL *v46;
  uint64_t v47;
  WTF::StringImpl *v48;
  WTF::StringImpl *v49;

  -[WebDataSource webFrame](self->_private->dataSource, "webFrame");
  v10 = core((uint64_t)a4);
  v12 = (JSC::Yarr::RegularExpression *)regExpForLabels((NSArray *)a3);
  v47 = -1;
  v13 = (WebCore::NodeTraversal *)(*(_QWORD *)(v10 + 48) & 0xFFFFFFFFFFFFLL);
  if (v13)
  {
    Child = WebCore::NodeTraversal::deepLastChild(v13, v11);
    if (!Child)
    {
LABEL_78:
      v16 = 0;
      v32 = 0;
      if (a5)
      {
LABEL_79:
        v42 = v47;
        if (v47 == -1)
          v42 = 0x7FFFFFFFFFFFFFFFLL;
        *a5 = v42;
      }
      goto LABEL_82;
    }
  }
  else
  {
    Child = *(_QWORD *)(v10 + 32);
    if (!Child)
      goto LABEL_78;
  }
  v45 = a5;
  v46 = a6;
  v15 = 0;
  v16 = 0;
  v17 = 0;
  v18 = MEMORY[0x1E0DD5F60];
  v19 = MEMORY[0x1E0DD6008];
  while (1)
  {
    v20 = *(_WORD *)(Child + 28);
    if ((v20 & 0x10) != 0 && *(_QWORD *)(*(_QWORD *)(Child + 96) + 24) == *(_QWORD *)(*(_QWORD *)v19 + 24))
    {
LABEL_72:
      a5 = v45;
      a6 = v46;
      if (!v17 || v16)
        goto LABEL_78;
      WebCore::LocalFrame::searchForLabelsAboveCell();
      if (v49)
      {
        v32 = (__CFString *)WTF::StringImpl::operator NSString *();
        v41 = v49;
        v49 = 0;
        if (v41)
        {
          if (*(_DWORD *)v41 == 2)
          {
            WTF::StringImpl::destroy(v41, v40);
            if (!-[__CFString length](v32, "length"))
              goto LABEL_78;
          }
          else
          {
            *(_DWORD *)v41 -= 2;
            if (!-[__CFString length](v32, "length"))
              goto LABEL_78;
          }
          goto LABEL_87;
        }
      }
      else
      {
        v32 = &stru_1E9D6EC48;
      }
      if (!-[__CFString length](v32, "length", v44))
        goto LABEL_78;
LABEL_87:
      v16 = 1;
      if (v45)
        goto LABEL_79;
      goto LABEL_82;
    }
    if ((v20 & 8) != 0)
    {
      if (((*(uint64_t (**)(uint64_t))(*(_QWORD *)Child + 848))(Child) & 1) != 0)
        goto LABEL_72;
      v20 = *(_WORD *)(Child + 28);
    }
    if ((v20 & 0x10) == 0)
      break;
    v21 = *(_QWORD *)(*(_QWORD *)(Child + 96) + 24);
    if (v21 == *(_QWORD *)(*(_QWORD *)v18 + 24) && v17 == 0)
    {
      v17 = Child;
      goto LABEL_70;
    }
    if (v21 != *(_QWORD *)(*MEMORY[0x1E0DD5F70] + 24) || v17 == 0)
      break;
    WebCore::LocalFrame::searchForLabelsAboveCell();
    if (!v49)
    {
      v32 = &stru_1E9D6EC48;
LABEL_42:
      v16 = 1;
      if (-[__CFString length](v32, "length", v44))
        goto LABEL_92;
      goto LABEL_70;
    }
    v32 = (__CFString *)WTF::StringImpl::operator NSString *();
    v33 = v49;
    v49 = 0;
    if (!v33)
      goto LABEL_42;
    if (*(_DWORD *)v33 == 2)
    {
      WTF::StringImpl::destroy(v33, v31);
      v16 = 1;
      if (-[__CFString length](v32, "length"))
        goto LABEL_92;
    }
    else
    {
      *(_DWORD *)v33 -= 2;
      v16 = 1;
      if (-[__CFString length](v32, "length"))
        goto LABEL_92;
    }
LABEL_70:
    v39 = (WebCore::NodeTraversal *)(*(_QWORD *)(Child + 48) & 0xFFFFFFFFFFFFLL);
    if (v39)
    {
      Child = WebCore::NodeTraversal::deepLastChild(v39, v11);
      if (!Child)
        goto LABEL_72;
    }
    else
    {
      Child = *(_QWORD *)(Child + 32);
      if (!Child)
        goto LABEL_72;
    }
    if (v15 >= 0x1F4)
      goto LABEL_72;
  }
  if ((v20 & 2) == 0)
    goto LABEL_70;
  v24 = *(_QWORD *)(Child + 64) & 0xFFFFFFFFFFFFLL;
  if (!v24)
    goto LABEL_70;
  if ((*(_BYTE *)((*(_QWORD *)(Child + 64) & 0xFFFFFFFFFFFFLL) + 0x2D) & 2) != 0)
  {
    v24 = *(_QWORD *)((*(_QWORD *)(Child + 64) & 0xFFFFFFFFFFFFLL) + 0x20);
    if (v24)
      v24 = *(_QWORD *)(v24 + 8);
  }
  if ((*(_BYTE *)(*(_QWORD *)(v24 + 104) + 239) & 4) != 0 || (*(_BYTE *)(v24 + 120) & 0x30) != 0)
    goto LABEL_70;
  (*(void (**)(WTF::StringImpl **__return_ptr, uint64_t))(*(_QWORD *)Child + 112))(&v48, Child);
  v25 = v48;
  if (v48)
  {
    v26 = *((_DWORD *)v48 + 1);
    if (v26 + v15 >= 0x259)
    {
      v27 = (StringImpl *)(v26 - (500 - v15));
      if (v26 == 500 - v15)
      {
        v28 = *(_DWORD *)v48 + 2;
        *(_DWORD *)v48 = v28;
        v29 = v25;
        v30 = v28 - 2;
        if (v30)
          goto LABEL_34;
LABEL_48:
        WTF::StringImpl::destroy(v29, v27);
      }
      else
      {
        WTF::StringImpl::substring(v48);
        v29 = v48;
        v48 = v49;
        if (v29)
        {
          v30 = *(_DWORD *)v29 - 2;
          if (*(_DWORD *)v29 == 2)
            goto LABEL_48;
LABEL_34:
          *(_DWORD *)v29 = v30;
        }
      }
    }
  }
  v34 = JSC::Yarr::RegularExpression::searchRev();
  if (v34 < 0)
  {
    v38 = (int)v48;
    if (v48)
      v38 = *((_DWORD *)v48 + 1);
    v15 += v38;
    v37 = v48;
    v48 = 0;
    if (v37)
      goto LABEL_65;
    goto LABEL_67;
  }
  v47 = v15;
  v35 = JSC::Yarr::RegularExpression::matchedLength(v12);
  v36 = v48;
  if (!v48)
  {
    v16 = 0;
    v32 = &stru_1E9D6EC48;
    a5 = v45;
    a6 = v46;
    if (v45)
      goto LABEL_79;
    goto LABEL_82;
  }
  if (!v34 && *((_DWORD *)v48 + 1) <= v35)
  {
    *(_DWORD *)v48 += 2;
    goto LABEL_61;
  }
  WTF::StringImpl::substring(v48);
  v36 = v49;
  if (v49)
  {
LABEL_61:
    v44 = (const __CFString *)WTF::StringImpl::operator NSString *();
    if (*(_DWORD *)v36 == 2)
    {
      WTF::StringImpl::destroy(v36, (StringImpl *)v11);
      v37 = v48;
      v48 = 0;
      if (!v37)
        goto LABEL_67;
      goto LABEL_65;
    }
    *(_DWORD *)v36 -= 2;
    v37 = v48;
    v48 = 0;
    if (v37)
      goto LABEL_65;
LABEL_67:
    if ((v34 & 0x80000000) == 0)
      goto LABEL_91;
    goto LABEL_70;
  }
  v44 = &stru_1E9D6EC48;
  v37 = v48;
  v48 = 0;
  if (!v37)
    goto LABEL_67;
LABEL_65:
  if (*(_DWORD *)v37 != 2)
  {
    *(_DWORD *)v37 -= 2;
    goto LABEL_67;
  }
  WTF::StringImpl::destroy(v37, (StringImpl *)v11);
  if (v34 < 0)
    goto LABEL_70;
LABEL_91:
  v16 = 0;
  v32 = (__CFString *)v44;
LABEL_92:
  a5 = v45;
  a6 = v46;
  if (v45)
    goto LABEL_79;
LABEL_82:
  if (a6)
    *a6 = v16;
  return v32;
}

- (id)matchLabels:(id)a3 againstElement:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const WTF::String **v12;
  uint64_t v13;
  __CFString *matched;
  uint64_t v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const WTF::String **i;
  uint64_t v22;

  v5 = core((uint64_t)a4);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)(v5 + 104);
  if (v7)
  {
    v8 = *(_DWORD *)(v7 + 4);
    if ((v8 & 1) != 0)
    {
      v9 = *(_QWORD *)(v7 + 40);
      LODWORD(v10) = *(_DWORD *)(v7 + 52);
      if ((_DWORD)v10)
      {
LABEL_5:
        v11 = *MEMORY[0x1E0DD60E0];
        v10 = v10;
        v12 = (const WTF::String **)(v9 + 8);
        while (1)
        {
          v13 = (uint64_t)*(v12 - 1);
          if (v13 == v11
            || *(_QWORD *)(v13 + 24) == *(_QWORD *)(v11 + 24) && *(_QWORD *)(v13 + 32) == *(_QWORD *)(v11 + 32))
          {
            break;
          }
          v12 += 2;
          if (!--v10)
          {
            matched = (__CFString *)matchLabelsAgainstString((NSArray *)a3, (const WTF::String *)*MEMORY[0x1E0CBF2F8]);
            if (-[__CFString length](matched, "length"))
              return matched;
            goto LABEL_19;
          }
        }
LABEL_16:
        matched = (__CFString *)matchLabelsAgainstString((NSArray *)a3, *v12);
        if (-[__CFString length](matched, "length"))
          return matched;
        goto LABEL_19;
      }
    }
    else
    {
      v9 = v7 + 32;
      LODWORD(v10) = v8 >> 5;
      if ((_DWORD)v10)
        goto LABEL_5;
    }
    v12 = (const WTF::String **)MEMORY[0x1E0CBF2F8];
    goto LABEL_16;
  }
  matched = (__CFString *)matchLabelsAgainstString((NSArray *)a3, (const WTF::String *)*MEMORY[0x1E0CBF2F8]);
  if (-[__CFString length](matched, "length"))
    return matched;
LABEL_19:
  v16 = *(_QWORD *)(v6 + 104);
  if (!v16)
  {
    i = (const WTF::String **)MEMORY[0x1E0CBF2F8];
    return (id)matchLabelsAgainstString((NSArray *)a3, *i);
  }
  v17 = *(_DWORD *)(v16 + 4);
  if ((v17 & 1) != 0)
  {
    v18 = *(_QWORD *)(v16 + 40);
    LODWORD(v19) = *(_DWORD *)(v16 + 52);
    if ((_DWORD)v19)
    {
LABEL_22:
      v20 = *MEMORY[0x1E0DD5FA8];
      v19 = v19;
      for (i = (const WTF::String **)(v18 + 8); ; i += 2)
      {
        v22 = (uint64_t)*(i - 1);
        if (v22 == v20
          || *(_QWORD *)(v22 + 24) == *(_QWORD *)(v20 + 24) && *(_QWORD *)(v22 + 32) == *(_QWORD *)(v20 + 32))
        {
          break;
        }
        if (!--v19)
          return (id)matchLabelsAgainstString((NSArray *)a3, (const WTF::String *)*MEMORY[0x1E0CBF2F8]);
      }
      return (id)matchLabelsAgainstString((NSArray *)a3, *i);
    }
  }
  else
  {
    v18 = v16 + 32;
    LODWORD(v19) = v17 >> 5;
    if ((_DWORD)v19)
      goto LABEL_22;
  }
  return (id)matchLabelsAgainstString((NSArray *)a3, (const WTF::String *)*MEMORY[0x1E0CBF2F8]);
}

@end
