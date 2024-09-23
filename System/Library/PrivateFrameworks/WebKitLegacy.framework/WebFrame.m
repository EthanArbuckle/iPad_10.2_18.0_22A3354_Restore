@implementation WebFrame

+ (Ref<WebCore::LocalFrame,)_createFrameWithPage:(void *)a3 frameName:(const void *)a4 frameView:(id)a5 ownerElement:(void *)a6
{
  WebCore::LocalFrame **v6;
  WebCore::LocalFrame **v10;
  id Weak;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  WebCore::Process *IdentifierInternal;
  int v16;
  int v17;
  uint64_t v18;
  double v19;
  Ref<WebCore::LocalFrame, WTF::RawPtrTraits<WebCore::LocalFrame>, WTF::DefaultRefDerefTraits<WebCore::LocalFrame>> v20;
  _QWORD *v21;

  v10 = v6;
  if (((*(uint64_t (**)(_QWORD, SEL))(**(_QWORD **)(*((_QWORD *)a3 + 6) + 16) + 1368))(*(_QWORD *)(*((_QWORD *)a3 + 6) + 16), a2) & 1) != 0)Weak = 0;
  else
    Weak = objc_loadWeak((id *)(*(_QWORD *)(*((_QWORD *)a3 + 6) + 16) + 16));
  v12 = (_QWORD *)objc_msgSend(objc_alloc((Class)a1), "_initWithWebFrameView:webView:", a5, Weak);
  v13 = v12;
  if (v12)
    CFRetain(v12);
  v14 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v14 = &off_1E9D6B958;
  v14[1] = v13;
  v21 = v14;
  if (WTF::ObjectIdentifierGeneric<WebCore::FrameIdentifierType,WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>,unsigned long long>::m_generationProtected)
  {
    v20.var0 = (LocalFrame *)142;
    __break(0xC471u);
  }
  else
  {
    IdentifierInternal = (WebCore::Process *)WTF::ObjectIdentifierMainThreadAccessTraits<unsigned long long>::generateIdentifierInternal();
    WebCore::Process::identifier(IdentifierInternal);
    WebCore::LocalFrame::createSubframe();
    if (v21)
      (*(void (**)(_QWORD *))(*v21 + 8))(v21);
    *(_QWORD *)(v13[1] + 8) = *v10;
    WebCore::FrameTree::setSpecifiedName();
    WebCore::LocalFrame::init(*v10);
    objc_msgSend(Weak, "_realZoomMultiplier");
    v17 = v16;
    v18 = objc_msgSend(Weak, "_realZoomMultiplierIsTextOnly");
    LODWORD(v19) = v17;
    objc_msgSend(Weak, "_setZoomMultiplier:isTextOnly:", v18, v19);
    CFRelease(v13);
  }
  return v20;
}

+ (void)_createMainFrameWithPage:(void *)a3 frameName:(const void *)a4 frameView:(id)a5
{
  id Weak;
  _QWORD *v9;
  const void *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  const void *v14;
  int v15;
  int v16;
  uint64_t v17;
  double v18;

  if (a3
    && ((*(uint64_t (**)(_QWORD, SEL, void *, const void *))(**(_QWORD **)(*((_QWORD *)a3 + 6) + 16) + 1368))(*(_QWORD *)(*((_QWORD *)a3 + 6) + 16), a2, a3, a4) & 1) == 0)
  {
    Weak = objc_loadWeak((id *)(*(_QWORD *)(*((_QWORD *)a3 + 6) + 16) + 16));
  }
  else
  {
    Weak = 0;
  }
  v9 = (_QWORD *)objc_msgSend(objc_alloc((Class)a1), "_initWithWebFrameView:webView:", a5, Weak);
  v10 = v9;
  v11 = *((_QWORD *)a3 + 20);
  if (v11)
    v12 = *(_BYTE *)(v11 + 144) == 0;
  else
    v12 = 0;
  if (v12)
  {
    *(_QWORD *)(v9[1] + 8) = v11;
    v13 = *(_QWORD *)(*(_QWORD *)(v11 + 280) + 16);
    CFRetain(v9);
    v14 = *(const void **)(v13 + 16);
    *(_QWORD *)(v13 + 16) = v10;
    if (v14)
      CFRelease(v14);
    WebCore::FrameTree::setSpecifiedName();
    WebCore::LocalFrame::init((WebCore::LocalFrame *)v11);
    objc_msgSend(Weak, "_realZoomMultiplier");
    v16 = v15;
    v17 = objc_msgSend(Weak, "_realZoomMultiplierIsTextOnly");
    LODWORD(v18) = v16;
    objc_msgSend(Weak, "_setZoomMultiplier:isTextOnly:", v17, v18);
    goto LABEL_14;
  }
  if (v9)
LABEL_14:
    CFRelease(v10);
}

+ (Ref<WebCore::LocalFrame,)_createSubframeWithOwnerElement:(void *)a3 page:(void *)a4 frameName:(const void *)a5 frameView:(id)a6
{
  _QWORD *v6;

  if (a1)
    return (Ref<WebCore::LocalFrame, WTF::RawPtrTraits<WebCore::LocalFrame>, WTF::DefaultRefDerefTraits<WebCore::LocalFrame>>)objc_msgSend(a1, "_createFrameWithPage:frameName:frameView:ownerElement:", a4, a5, a6, a3);
  else
    *v6 = 0;
  return (Ref<WebCore::LocalFrame, WTF::RawPtrTraits<WebCore::LocalFrame>, WTF::DefaultRefDerefTraits<WebCore::LocalFrame>>)a1;
}

- (BOOL)_isIncludedInWebKitStatistics
{
  WebFramePrivate *v2;

  v2 = self->_private;
  return v2 && v2->includedInWebKitStatistics;
}

+ (void)_createMainFrameWithSimpleHTMLDocumentWithPage:(void *)a3 frameView:(id)a4 style:(id)a5
{
  uint64_t v5;
  BOOL v6;
  id Weak;
  _QWORD *v12;
  uint64_t v13;
  const __CFString *v14;
  const void *v15;
  uint64_t UniqueWebDataURL;
  StringImpl *v17;
  WTF::StringImpl *v18;
  WTF::StringImpl *v19;
  WTF::StringImpl *v20;
  WTF::StringImpl *v21;

  v5 = *((_QWORD *)a3 + 20);
  if (v5)
    v6 = *(_BYTE *)(v5 + 144) == 0;
  else
    v6 = 0;
  if (v6)
  {
    if (((*(uint64_t (**)(_QWORD, SEL))(**(_QWORD **)(*((_QWORD *)a3 + 6) + 16) + 1368))(*(_QWORD *)(*((_QWORD *)a3 + 6) + 16), a2) & 1) != 0)Weak = 0;
    else
      Weak = objc_loadWeak((id *)(*(_QWORD *)(*((_QWORD *)a3 + 6) + 16) + 16));
    v12 = (_QWORD *)objc_msgSend(objc_alloc((Class)a1), "_initWithWebFrameView:webView:", a4, Weak);
    *(_QWORD *)(v12[1] + 8) = v5;
    v13 = *(_QWORD *)(*(_QWORD *)(v5 + 280) + 16);
    CFRetain(v12);
    v15 = *(const void **)(v13 + 16);
    *(_QWORD *)(v13 + 16) = v12;
    if (v15)
      CFRelease(v15);
    WTF::AtomStringImpl::add((WTF::AtomStringImpl *)a5, v14);
    v21 = v20;
    UniqueWebDataURL = createUniqueWebDataURL();
    MEMORY[0x1D82A38F0](&v20, UniqueWebDataURL);
    WebCore::LocalFrame::initWithSimpleHTMLDocument();
    v18 = v20;
    v20 = 0;
    if (v18)
    {
      if (*(_DWORD *)v18 == 2)
      {
        WTF::StringImpl::destroy(v18, v17);
        v19 = v21;
        v21 = 0;
        if (!v19)
        {
LABEL_20:
          CFRelease(v12);
          return;
        }
LABEL_17:
        if (*(_DWORD *)v19 == 2)
          WTF::StringImpl::destroy(v19, v17);
        else
          *(_DWORD *)v19 -= 2;
        goto LABEL_20;
      }
      *(_DWORD *)v18 -= 2;
    }
    v19 = v21;
    v21 = 0;
    if (!v19)
      goto LABEL_20;
    goto LABEL_17;
  }
}

- (void)_attachScriptDebugger
{
  WebCore::WindowProxy *v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  _QWORD *v13;
  DOMWrapperWorld *v14;
  uint64_t v15;
  uint64_t v16;
  JSC::Debugger *v17;
  WebFramePrivate *v18;
  WebScriptDebugger *value;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  WTF *v25;
  void *v26;

  v3 = (WebCore::WindowProxy *)*((_QWORD *)self->_private->coreFrame.m_ptr + 14);
  v4 = WebCore::mainThreadNormalWorld((WebCore *)self);
  v5 = **((_QWORD **)v3 + 2);
  if (v5)
  {
    v6 = *(_DWORD *)(v5 - 8);
    v7 = (~(v4 << 32) + v4) ^ ((unint64_t)(~(v4 << 32) + v4) >> 22);
    v8 = 9 * ((v7 + ~(v7 << 13)) ^ ((v7 + ~(v7 << 13)) >> 8));
    v9 = (v8 ^ (v8 >> 15)) + ~((v8 ^ (v8 >> 15)) << 27);
    v10 = v6 & ((v9 >> 31) ^ v9);
    v11 = *(_QWORD *)(v5 + 16 * v10);
    if (v11 == v4)
    {
LABEL_6:
      if (v10 != *(_DWORD *)(v5 - 4))
      {
        v13 = *(_QWORD **)(v5 + 16 * v10 + 8);
        if (v13)
        {
          if (*v13)
          {
            v14 = (DOMWrapperWorld *)WebCore::mainThreadNormalWorld((WebCore *)v4);
            v15 = WebCore::WindowProxy::globalObject(v3, v14);
            if (v15)
            {
              if (!self->_private->scriptDebugger.__ptr_.__value_)
              {
                v16 = v15;
                v17 = (JSC::Debugger *)WTF::fastMalloc((WTF *)0xF8);
                WebScriptDebugger::WebScriptDebugger(v17, v16);
                v18 = self->_private;
                value = v18->scriptDebugger.__ptr_.__value_;
                v18->scriptDebugger.__ptr_.__value_ = (WebScriptDebugger *)v17;
                if (value)
                {
                  v20 = *((_QWORD *)value + 30);
                  if (v20)
                  {
                    v21 = (uint64_t *)(v20 - 16);
                    v22 = *(_QWORD *)(((v20 - 16) & 0xFFFFFFFFFFFFF000) + 0x10);
                    v23 = *(uint64_t **)(v20 - 8);
                    if (v23)
                    {
                      v24 = *v21;
                      *v23 = *v21;
                      *(_QWORD *)(v24 + 8) = v23;
                      *v21 = 0;
                      v21[1] = 0;
                    }
                    *v21 = *(_QWORD *)(v22 + 40);
                    *(_QWORD *)(v22 + 40) = v21;
                    *((_QWORD *)value + 30) = 0;
                  }
                  JSC::Debugger::~Debugger((JSC::Debugger *)value);
                  WTF::fastFree(v25, v26);
                }
              }
            }
          }
        }
      }
    }
    else
    {
      v12 = 1;
      while (v11)
      {
        v10 = ((_DWORD)v10 + v12) & v6;
        v11 = *(_QWORD *)(v5 + 16 * v10);
        ++v12;
        if (v11 == v4)
          goto LABEL_6;
      }
    }
  }
}

- (void)_detachScriptDebugger
{
  WebFramePrivate *v2;
  WebScriptDebugger *value;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  WTF *v9;
  void *v10;

  v2 = self->_private;
  value = v2->scriptDebugger.__ptr_.__value_;
  v2->scriptDebugger.__ptr_.__value_ = 0;
  if (value)
  {
    v4 = *((_QWORD *)value + 30);
    if (v4)
    {
      v5 = (uint64_t *)(v4 - 16);
      v6 = *(_QWORD *)(((v4 - 16) & 0xFFFFFFFFFFFFF000) + 0x10);
      v7 = *(uint64_t **)(v4 - 8);
      if (v7)
      {
        v8 = *v5;
        *v7 = *v5;
        *(_QWORD *)(v8 + 8) = v7;
        *v5 = 0;
        v5[1] = 0;
      }
      *v5 = *(_QWORD *)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;
      *((_QWORD *)value + 30) = 0;
    }
    JSC::Debugger::~Debugger((JSC::Debugger *)value);
    WTF::fastFree(v9, v10);
  }
}

- (id)_initWithWebFrameView:(id)a3 webView:(id)a4
{
  WebFrame *v5;
  int v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WebFrame;
  v5 = -[WebFrame init](&v8, sel_init);
  if (v5)
  {
    v5->_private = objc_alloc_init(WebFramePrivate);
    v6 = objc_msgSend((id)objc_opt_class(), "shouldIncludeInWebKitStatistics");
    v5->_private->includedInWebKitStatistics = v6;
    if (v6)
      ++WebFrameCount;
    if (a3)
    {
      -[WebFramePrivate setWebFrameView:](v5->_private, "setWebFrameView:", a3);
      objc_msgSend(a3, "_setWebFrame:", v5);
    }
    v5->_private->shouldCreateRenderers = 1;
  }
  return v5;
}

- (void)_clearCoreFrame
{
  self->_private->coreFrame.m_ptr = 0;
}

- (id)_webHTMLDocumentView
{
  void *v2;

  v2 = (void *)objc_msgSend(self->_private->webFrameView.m_ptr, "documentView");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v2;
  else
    return 0;
}

- (void)_updateBackgroundAndUpdatesWhileOffscreen
{
  LocalFrame *m_ptr;
  uint64_t v4;
  _QWORD *Weak;
  char v6;
  uint64_t v7;
  WebFramePrivate *v8;
  const WebCore::Frame *v9;
  WebCore *v10;
  uint64_t v11;
  _QWORD *v12;
  void *v13;
  WebCore::LocalFrameView *v14;
  CGColor *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  unsigned int *v19;
  unsigned int v20;
  unsigned int v21;
  uint64_t v22;

  if (!self)
    goto LABEL_6;
  m_ptr = self->_private->coreFrame.m_ptr;
  if (!m_ptr)
    goto LABEL_6;
  v4 = *((_QWORD *)m_ptr + 3);
  if (!v4)
    goto LABEL_6;
  Weak = *(_QWORD **)(v4 + 8);
  if (!Weak)
    goto LABEL_7;
  if (((*(uint64_t (**)(_QWORD, SEL))(**(_QWORD **)(Weak[6] + 16) + 1368))(*(_QWORD *)(Weak[6] + 16), a2) & 1) == 0)Weak = objc_loadWeak((id *)(*(_QWORD *)(Weak[6] + 16) + 16));
  else
LABEL_6:
    Weak = 0;
LABEL_7:
  v6 = objc_msgSend(Weak, "drawsBackground");
  v7 = objc_msgSend(Weak, "backgroundColor");
  v8 = self->_private;
  v9 = (const WebCore::Frame *)v8->coreFrame.m_ptr;
  if (v9)
  {
    v10 = (WebCore *)v7;
    v11 = (uint64_t)v8->coreFrame.m_ptr;
    while (*(_BYTE *)(v11 + 144))
    {
LABEL_9:
      v11 = WebCore::FrameTree::traverseNext((WebCore::FrameTree *)(v11 + 48), v9);
      if (!v11)
        return;
    }
    v12 = *(_QWORD **)(*(_QWORD *)(v11 + 280) + 16);
    if (((*(uint64_t (**)(_QWORD *))(*v12 + 1072))(v12) & 1) != 0)
    {
      v13 = 0;
      if ((v6 & 1) != 0)
      {
LABEL_16:
        v14 = *(WebCore::LocalFrameView **)(v11 + 288);
        if (v14)
        {
          WebCore::LocalFrameView::setTransparent(*(WebCore::LocalFrameView **)(v11 + 288));
          v16 = WebCore::roundAndClampToSRGBALossy(v10, v15);
          v17 = bswap32(v16) | 0x1104000000000000;
          if (!BYTE4(v16))
            v17 = 0;
          v22 = v17;
          WebCore::LocalFrameView::setBaseBackgroundColor();
          objc_msgSend(Weak, "shouldUpdateWhileOffscreen");
          WebCore::LocalFrameView::setShouldUpdateWhileOffscreen(v14);
          if ((v22 & 0x8000000000000) != 0)
          {
            v19 = (unsigned int *)(v22 & 0xFFFFFFFFFFFFLL);
            do
            {
              v20 = __ldaxr(v19);
              v21 = v20 - 1;
            }
            while (__stlxr(v21, v19));
            if (!v21)
            {
              atomic_store(1u, v19);
              WTF::fastFree((WTF *)v19, v18);
            }
          }
        }
        goto LABEL_9;
      }
    }
    else
    {
      v13 = (void *)v12[2];
      if ((v6 & 1) != 0)
        goto LABEL_16;
    }
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v13, "frameView"), "_scrollView"), "setDrawsBackground:", 0);
    goto LABEL_16;
  }
}

- (void)_setInternalLoadDelegate:(id)a3
{
  self->_private->internalLoadDelegate = a3;
}

- (id)_internalLoadDelegate
{
  return self->_private->internalLoadDelegate;
}

- (void)_unmarkAllBadGrammar
{
  LocalFrame *m_ptr;
  uint64_t v3;
  WebCore::Document *v4;

  m_ptr = self->_private->coreFrame.m_ptr;
  if (m_ptr)
  {
    v3 = (uint64_t)self->_private->coreFrame.m_ptr;
    do
    {
      if (!*(_BYTE *)(v3 + 144))
      {
        v4 = *(WebCore::Document **)(v3 + 296);
        if (v4)
        {
          if (!*((_QWORD *)v4 + 187))
            WebCore::Document::ensureMarkers(v4);
          WebCore::DocumentMarkerController::removeMarkers();
        }
      }
      v3 = WebCore::FrameTree::traverseNext((WebCore::FrameTree *)(v3 + 48), (const WebCore::Frame *)m_ptr);
    }
    while (v3);
  }
}

- (BOOL)_hasSelection
{
  void *v3;
  LocalFrame *m_ptr;
  int v5;

  v3 = (void *)objc_msgSend(self->_private->webFrameView.m_ptr, "documentView");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (m_ptr = self->_private->coreFrame.m_ptr) != 0)
  {
    LOBYTE(v5) = *(_BYTE *)(*(_QWORD *)(*((_QWORD *)m_ptr + 37) + 3064) + 153) == 2;
  }
  else
  {
    v5 = objc_msgSend(v3, "conformsToProtocol:", &unk_1F0174AF8);
    if (v5)
      LOBYTE(v5) = objc_msgSend((id)objc_msgSend(v3, "selectedString"), "length") != 0;
  }
  return v5;
}

- (void)_clearSelection
{
  void *v2;

  v2 = (void *)objc_msgSend(self->_private->webFrameView.m_ptr, "documentView");
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1F0174AF8))
    objc_msgSend(v2, "deselectAll");
}

- (id)_findFrameWithSelection
{
  LocalFrame *m_ptr;
  uint64_t v3;
  void *v4;
  _QWORD *v5;

  m_ptr = self->_private->coreFrame.m_ptr;
  if (m_ptr)
  {
    v3 = (uint64_t)self->_private->coreFrame.m_ptr;
    do
    {
      if (!*(_BYTE *)(v3 + 144))
      {
        v5 = *(_QWORD **)(*(_QWORD *)(v3 + 280) + 16);
        if (((*(uint64_t (**)(_QWORD *, SEL))(*v5 + 1072))(v5, a2) & 1) != 0)
        {
          v4 = 0;
          if ((objc_msgSend(0, "_hasSelection") & 1) != 0)
            return v4;
        }
        else
        {
          v4 = (void *)v5[2];
          if ((objc_msgSend(v4, "_hasSelection") & 1) != 0)
            return v4;
        }
      }
      v3 = WebCore::FrameTree::traverseNext((WebCore::FrameTree *)(v3 + 48), (const WebCore::Frame *)m_ptr);
    }
    while (v3);
  }
  return 0;
}

- (void)_clearSelectionInOtherFrames
{
  WebFrame *v2;
  LocalFrame *m_ptr;
  uint64_t v4;
  uint64_t v5;
  WebFrame *v6;

  v2 = self;
  if (self)
  {
    m_ptr = self->_private->coreFrame.m_ptr;
    if (!m_ptr)
      goto LABEL_6;
    v4 = *((_QWORD *)m_ptr + 3);
    if (!v4)
      goto LABEL_6;
    v5 = *(_QWORD *)(v4 + 8);
    if (v5)
    {
      if (((*(uint64_t (**)(_QWORD, SEL))(**(_QWORD **)(*(_QWORD *)(v5 + 48) + 16) + 1368))(*(_QWORD *)(*(_QWORD *)(v5 + 48) + 16), a2) & 1) == 0)
      {
        v6 = (WebFrame *)objc_msgSend((id)objc_msgSend(objc_loadWeak((id *)(*(_QWORD *)(*(_QWORD *)(v5 + 48) + 16) + 16)), "mainFrame"), "_findFrameWithSelection");
        if (v6 == v2)
          return;
        goto LABEL_10;
      }
LABEL_6:
      v6 = (WebFrame *)objc_msgSend((id)objc_msgSend(0, "mainFrame"), "_findFrameWithSelection");
      if (v6 == v2)
        return;
LABEL_10:
      -[WebFrame _clearSelection](v6, "_clearSelection");
      return;
    }
    self = 0;
  }
  v6 = (WebFrame *)objc_msgSend((id)-[WebFrame mainFrame](self, "mainFrame"), "_findFrameWithSelection");
  if (v6 != v2)
    goto LABEL_10;
}

- (id)_dataSource
{
  uint64_t v2;

  v2 = *(_QWORD *)(*((_QWORD *)self->_private->coreFrame.m_ptr + 35) + 88);
  if (v2)
    return *(id *)(v2 + 3560);
  else
    return 0;
}

- (BOOL)_isCommitting
{
  return self->_private->isCommitting;
}

- (void)_setIsCommitting:(BOOL)a3
{
  self->_private->isCommitting = a3;
}

- (id)_selectedString
{
  LocalFrame *m_ptr;
  WebCore::Editor *v3;
  StringImpl *v4;
  const __CFString *v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *v7;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;

  m_ptr = self->_private->coreFrame.m_ptr;
  v3 = (WebCore::Editor *)WebCore::Document::editor(*((WebCore::Document **)m_ptr + 37));
  WebCore::Editor::selectedText(v3);
  WebCore::LocalFrame::displayStringModifiedByEncoding((WebCore::LocalFrame *)m_ptr, (const WTF::String *)&v9);
  if (v10)
  {
    v5 = (const __CFString *)WTF::StringImpl::operator NSString *();
    v6 = v10;
    v10 = 0;
    if (v6)
    {
      if (*(_DWORD *)v6 == 2)
      {
        WTF::StringImpl::destroy(v6, v4);
        v7 = v9;
        v9 = 0;
        if (!v7)
          return (id)v5;
      }
      else
      {
        *(_DWORD *)v6 -= 2;
        v7 = v9;
        v9 = 0;
        if (!v7)
          return (id)v5;
      }
      goto LABEL_8;
    }
  }
  else
  {
    v10 = 0;
    v5 = &stru_1E9D6EC48;
  }
  v7 = v9;
  v9 = 0;
  if (!v7)
    return (id)v5;
LABEL_8:
  if (*(_DWORD *)v7 != 2)
  {
    *(_DWORD *)v7 -= 2;
    return (id)v5;
  }
  WTF::StringImpl::destroy(v7, v4);
  return (id)v5;
}

- (id)_stringForRange:(id)a3
{
  StringImpl *v3;
  const __CFString *v4;
  WebCore::Node *v5;
  WebCore::Node *v7;
  WebCore::Node *v8;
  WTF::StringImpl *v9;

  if (!a3)
    return &stru_1E9D6EC48;
  WebCore::makeSimpleRange();
  WebCore::plainText();
  if (v9)
  {
    v4 = (const __CFString *)WTF::StringImpl::operator NSString *();
    if (*(_DWORD *)v9 != 2)
    {
      *(_DWORD *)v9 -= 2;
      v5 = v8;
      if (!v8)
        goto LABEL_14;
LABEL_9:
      if (*((_DWORD *)v5 + 6) == 2)
      {
        if ((*((_WORD *)v5 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v5);
      }
      else
      {
        *((_DWORD *)v5 + 6) -= 2;
      }
      goto LABEL_14;
    }
    WTF::StringImpl::destroy(v9, v3);
    v5 = v8;
    if (v8)
      goto LABEL_9;
  }
  else
  {
    v4 = &stru_1E9D6EC48;
    v5 = v8;
    if (v8)
      goto LABEL_9;
  }
LABEL_14:
  if (!v7)
    return (id)v4;
  if (*((_DWORD *)v7 + 6) != 2)
  {
    *((_DWORD *)v7 + 6) -= 2;
    return (id)v4;
  }
  if ((*((_WORD *)v7 + 15) & 0x400) != 0)
    return (id)v4;
  WebCore::Node::removedLastRef(v7);
  return (id)v4;
}

- (OptionSet<WebCore::PaintBehavior>)_paintBehaviorForDestinationContext:(CGContext *)a3
{
  id v4;

  if (CGContextGetType() == 4 || CGContextGetType() == 6)
  {
    v4 = -[WebFrame _webHTMLDocumentView](self, "_webHTMLDocumentView");
    if (v4)
    {
      if (objc_msgSend((id)objc_msgSend(v4, "window"), "isInSnapshottingPaint"))
        return (OptionSet<WebCore::PaintBehavior>)0x10000;
      else
        return (OptionSet<WebCore::PaintBehavior>)0;
    }
    else
    {
      return (OptionSet<WebCore::PaintBehavior>)66048;
    }
  }
  else
  {
    return (OptionSet<WebCore::PaintBehavior>)0;
  }
}

- (void)_drawRect:(CGRect)a3 contentsOnly:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v6;
  uint64_t v7;
  const CGRect *v8;
  WebCore::LocalFrameView *v9;
  CGRect v10;
  _BYTE v11[752];
  uint64_t v12;

  v4 = a4;
  v12 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v6 = WKGetCurrentGraphicsContext();
  WebCore::GraphicsContextCG::GraphicsContextCG();
  WebCore::LocalFrameView::paintBehavior(*((WebCore::LocalFrameView **)self->_private->coreFrame.m_ptr + 36));
  v7 = WebCore::FrameTree::parent((WebCore::FrameTree *)((char *)self->_private->coreFrame.m_ptr + 48));
  if (v7 && !*(_BYTE *)(v7 + 144))
  {
    v9 = *(WebCore::LocalFrameView **)(v7 + 288);
    if (v9)
      WebCore::LocalFrameView::paintBehavior(v9);
  }
  else
  {
    -[WebFrame _paintBehaviorForDestinationContext:](self, "_paintBehaviorForDestinationContext:", v6);
  }
  WebCore::LocalFrameView::setPaintBehavior();
  WebCore::enclosingIntRect((WebCore *)&v10, v8);
  if (v4)
    WebCore::LocalFrameView::paintContents();
  else
    WebCore::ScrollView::paint();
  WebCore::LocalFrameView::setPaintBehavior();
  WebCore::GraphicsContextCG::~GraphicsContextCG((WebCore::GraphicsContextCG *)v11);
}

- (BOOL)_getVisibleRect:(CGRect *)a3
{
  WebCore::RenderObject *v4;
  char v5;
  WebCore::RenderObject *v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;

  v4 = (WebCore::RenderObject *)WebCore::Frame::ownerRenderer((WebCore::Frame *)self->_private->coreFrame.m_ptr);
  v6 = v4;
  if (v4)
  {
    if ((*((_BYTE *)v4 + 20) & 0xF8) != 0)
    {
      v5 = 0;
    }
    else
    {
      WebCore::RenderObject::pixelSnappedAbsoluteClippedOverflowRect(v4);
      WebCore::IntRect::operator CGRect();
      a3->origin.x = v7;
      a3->origin.y = v8;
      a3->size.width = v9;
      a3->size.height = v10;
      v5 = 1;
    }
  }
  return (v6 != 0) & v5;
}

- (id)_stringByEvaluatingJavaScriptFromString:(id)a3
{
  return -[WebFrame _stringByEvaluatingJavaScriptFromString:forceUserGesture:](self, "_stringByEvaluatingJavaScriptFromString:forceUserGesture:", a3, 1);
}

- (id)_stringByEvaluatingJavaScriptFromString:(id)a3 forceUserGesture:(BOOL)a4
{
  uint64_t isMainThread;
  WebCore::ScriptController *v7;
  WebCore::DOMWrapperWorld *v8;
  StringImpl *v9;
  unint64_t v10;
  WTF::StringImpl *v11;
  const __CFString *v12;
  StringImpl *v13;
  WTF::StringImpl *v14;
  WTF::StringImpl *v15;
  id result;
  WTF::StringImpl *v17[2];
  _BYTE v18[8];

  if (!a3)
    return &stru_1E9D6EC48;
  isMainThread = WTF::isMainThread((WTF *)self);
  if ((isMainThread & 1) != 0)
  {
    if (self)
      isMainThread = (uint64_t)CFRetain(self);
    v7 = (WebCore::ScriptController *)*((_QWORD *)self->_private->coreFrame.m_ptr + 38);
    v8 = (WebCore::DOMWrapperWorld *)WebCore::mainThreadNormalWorld((WebCore *)isMainThread);
    WebCore::ScriptController::jsWindowProxy(v7, v8);
    JSC::JSLockHolder::JSLockHolder();
    MEMORY[0x1D82A3998](v17, a3);
    v10 = WebCore::ScriptController::executeScriptIgnoringException();
    v17[1] = (WTF::StringImpl *)v10;
    v11 = v17[0];
    v17[0] = 0;
    if (v11)
    {
      if (*(_DWORD *)v11 == 2)
      {
        WTF::StringImpl::destroy(v11, v9);
        v12 = &stru_1E9D6EC48;
        if (!self->_private->coreFrame.m_ptr)
          goto LABEL_28;
        goto LABEL_12;
      }
      *(_DWORD *)v11 -= 2;
    }
    v12 = &stru_1E9D6EC48;
    if (!self->_private->coreFrame.m_ptr)
      goto LABEL_28;
LABEL_12:
    if (v10)
    {
      if ((v10 & 0xFFFFFFFFFFFFFFFELL) == 6)
        goto LABEL_16;
      if ((v10 & 0xFFFE000000000002) == 0)
      {
        if (*(_BYTE *)(v10 + 5) != 2)
          goto LABEL_28;
        v15 = *(WTF::StringImpl **)(v10 + 8);
        if ((v15 & 1) != 0)
          v15 = *(WTF::StringImpl **)JSC::JSRopeString::resolveRope();
        if (v15)
          *(_DWORD *)v15 += 2;
        v17[0] = v15;
        if (!v15)
          goto LABEL_28;
        goto LABEL_17;
      }
      if (v10 >> 49)
      {
LABEL_16:
        JSC::JSValue::toWTFStringSlowCase();
        if (v17[0])
        {
LABEL_17:
          v12 = (const __CFString *)WTF::StringImpl::operator NSString *();
          v14 = v17[0];
          v17[0] = 0;
          if (v14)
          {
            if (*(_DWORD *)v14 == 2)
              WTF::StringImpl::destroy(v14, v13);
            else
              *(_DWORD *)v14 -= 2;
          }
        }
      }
    }
LABEL_28:
    MEMORY[0x1D82A33C8](v18);
    CFRelease(self);
    return (id)v12;
  }
  result = (id)693;
  __break(0xC471u);
  return result;
}

- (CGRect)_caretRectAtPosition:(const void *)a3 affinity:(unint64_t)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  WebCore::Node *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  WebCore::Node *v17;
  CGRect result;

  WebCore::VisiblePosition::VisiblePosition();
  WebCore::VisiblePosition::absoluteCaretBounds((WebCore::VisiblePosition *)&v17, 0);
  WebCore::IntRect::operator CGRect();
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = v17;
  v17 = 0;
  if (v12)
  {
    if (*((_DWORD *)v12 + 6) == 2)
    {
      if ((*((_WORD *)v12 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v12);
    }
    else
    {
      *((_DWORD *)v12 + 6) -= 2;
    }
  }
  v13 = v5;
  v14 = v7;
  v15 = v9;
  v16 = v11;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)_firstRectForDOMRange:(id)a3
{
  WebCore::Editor *v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  WebCore::Node *v13;
  WebCore::Node *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  WebCore::Node *v19;
  WebCore::Node *v20;
  uint64_t RectForRange;
  uint64_t v22;
  CGRect result;

  if (a3)
  {
    v3 = (WebCore::Editor *)WebCore::Document::editor(*((WebCore::Document **)self->_private->coreFrame.m_ptr + 37));
    WebCore::makeSimpleRange();
    RectForRange = WebCore::Editor::firstRectForRange(v3, (const WebCore::SimpleRange *)&v19);
    v22 = v4;
    WebCore::IntRect::operator CGRect();
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v13 = v20;
    v20 = 0;
    if (v13)
    {
      if (*((_DWORD *)v13 + 6) == 2)
      {
        if ((*((_WORD *)v13 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v13);
      }
      else
      {
        *((_DWORD *)v13 + 6) -= 2;
      }
    }
    v14 = v19;
    v19 = 0;
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
  }
  else
  {
    v6 = *MEMORY[0x1E0CB3438];
    v8 = *(double *)(MEMORY[0x1E0CB3438] + 8);
    v10 = *(double *)(MEMORY[0x1E0CB3438] + 16);
    v12 = *(double *)(MEMORY[0x1E0CB3438] + 24);
  }
  v15 = v6;
  v16 = v8;
  v17 = v10;
  v18 = v12;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (void)_scrollDOMRangeToVisible:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  WebCore::RenderObject *v11;
  const CGRect *v12;
  _QWORD v13[4];

  -[WebFrame _firstRectForDOMRange:](self, "_firstRectForDOMRange:");
  v13[0] = v5;
  v13[1] = v6;
  v13[2] = v7;
  v13[3] = v8;
  v9 = objc_msgSend(a3, "startContainer");
  if (v9)
  {
    v10 = *(_QWORD *)(v9 + 16);
    if (v10)
    {
      v11 = (WebCore::RenderObject *)(*(_QWORD *)(v10 + 64) & 0xFFFFFFFFFFFFLL);
      if (v11)
      {
        if (WebCore::RenderObject::enclosingLayer(v11))
        {
          WebCore::enclosingIntRect((WebCore *)v13, v12);
          WebCore::LocalFrameView::scrollRectToVisible();
          *(_BYTE *)(*(_QWORD *)(*((_QWORD *)self->_private->coreFrame.m_ptr + 37) + 3064) + 24) = 1;
          WebCore::FrameSelection::updateAppearance(*(WebCore::FrameSelection **)(*((_QWORD *)self->_private->coreFrame.m_ptr
                                                                                  + 37)
                                                                                + 3064));
        }
      }
    }
  }
}

- (void)_scrollDOMRangeToVisible:(id)a3 withInset:(double)a4
{
  uint64_t v7;
  uint64_t v8;
  WebCore::RenderObject *v9;
  const CGRect *v10;
  LocalFrame *m_ptr;
  WebCore::FrameSelection *v12;
  NSRect v13;
  NSRect v14;

  -[WebFrame _firstRectForDOMRange:](self, "_firstRectForDOMRange:");
  v13 = NSInsetRect(v14, a4, a4);
  v7 = objc_msgSend(a3, "startContainer");
  if (v7)
  {
    v8 = *(_QWORD *)(v7 + 16);
    if (v8)
    {
      v9 = (WebCore::RenderObject *)(*(_QWORD *)(v8 + 64) & 0xFFFFFFFFFFFFLL);
      if (v9)
      {
        if (WebCore::RenderObject::enclosingLayer(v9))
        {
          WebCore::enclosingIntRect((WebCore *)&v13, v10);
          WebCore::LocalFrameView::scrollRectToVisible();
          if (self)
          {
            m_ptr = self->_private->coreFrame.m_ptr;
            if (m_ptr)
            {
              v12 = *(WebCore::FrameSelection **)(*((_QWORD *)m_ptr + 37) + 3064);
              *((_BYTE *)v12 + 24) = 1;
              WebCore::FrameSelection::updateAppearance(v12);
            }
          }
        }
      }
    }
  }
}

- (BOOL)_needsLayout
{
  WebCore::LocalFrameView *v2;

  v2 = (WebCore::LocalFrameView *)*((_QWORD *)self->_private->coreFrame.m_ptr + 36);
  if (v2)
    LOBYTE(v2) = WebCore::LocalFrameView::needsLayout(v2);
  return (char)v2;
}

- (unsigned)_selectionGranularity
{
  return *(_BYTE *)(*(_QWORD *)(*((_QWORD *)self->_private->coreFrame.m_ptr + 37) + 3064) + 184);
}

- (_NSRange)_convertToNSRange:(const void *)a3
{
  LocalFrame *m_ptr;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  WebCore::Node *v8;
  NSUInteger v9;
  NSUInteger v10;
  WebCore::Node *v11;
  Node *var0;
  BoundaryPoint v13;
  WebCore::Node *v14;
  WebCore::Node *v15;
  _NSRange result;

  m_ptr = self->_private->coreFrame.m_ptr;
  if (m_ptr
    && (v5 = WebCore::FrameSelection::rootEditableElementOrDocumentElement(*(WebCore::FrameSelection **)(*((_QWORD *)m_ptr + 37) + 3064))) != 0)
  {
    *(_DWORD *)(v5 + 24) += 2;
    v13.var0.var0 = (Node *)v5;
    v13.var1 = 0;
    WebCore::SimpleRange::SimpleRange((WebCore::SimpleRange *)&v14, &v13, (const BoundaryPoint *)a3);
    v6 = WebCore::characterCount();
    v7 = WebCore::characterCount();
    v8 = v15;
    v15 = 0;
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
    v11 = v14;
    v14 = 0;
    if (v11)
    {
      if (*((_DWORD *)v11 + 6) == 2)
      {
        if ((*((_WORD *)v11 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v11);
      }
      else
      {
        *((_DWORD *)v11 + 6) -= 2;
      }
    }
    var0 = v13.var0.var0;
    v13.var0.var0 = 0;
    if (var0)
    {
      if (*((_DWORD *)var0 + 6) != 2)
      {
        *((_DWORD *)var0 + 6) -= 2;
        v9 = v6;
        v10 = v7;
        goto LABEL_20;
      }
      if ((*((_WORD *)var0 + 15) & 0x400) == 0)
      {
        WebCore::Node::removedLastRef((WebCore::Node *)var0);
        v9 = v6;
        v10 = v7;
        goto LABEL_20;
      }
    }
  }
  else
  {
    v7 = 0;
    v6 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v9 = v6;
  v10 = v7;
LABEL_20:
  result.length = v10;
  result.location = v9;
  return result;
}

- (optional<WebCore::SimpleRange>)_convertToDOMRange:(SEL)a3
{
  if (self)
    return (optional<WebCore::SimpleRange> *)unk_1F0193020(self, "_convertToDOMRange:rangeIsRelativeTo:", a4.location, a4.length, 0);
  *(_QWORD *)&retstr->var1 = 0;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  retstr->var0.var1.var1 = 0u;
  return self;
}

- (optional<WebCore::SimpleRange>)_convertToDOMRange:(SEL)a3 rangeIsRelativeTo:(_NSRange)a4
{
  Node *v6;
  const VisiblePosition *v7;
  Node *v8;
  uint64_t v9;
  __int16 v10;
  unsigned int v11;
  WebCore::Node *v12;
  WebCore::Node *v13;
  char v14;
  WebCore::Node *v15;
  WebCore::Node *v16;
  Node *v17;
  unsigned int v18;
  Node *v19;
  unsigned int v20;

  if (a4.location == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_2;
  if (a5)
  {
    WebCore::VisiblePosition::VisiblePosition();
    WebCore::startOfParagraph();
    WebCore::makeBoundaryPoint((WebCore *)&v17, v7);
    v8 = v17;
    v17 = 0;
    if (v8)
    {
      if (*((_DWORD *)v8 + 6) == 2)
      {
        if ((*((_WORD *)v8 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef((WebCore::Node *)v8);
      }
      else
      {
        *((_DWORD *)v8 + 6) -= 2;
      }
    }
    self = (optional<WebCore::SimpleRange> *)v15;
    if (v15)
    {
      if (*((_DWORD *)v15 + 6) == 2)
      {
        if ((*((_WORD *)v15 + 15) & 0x400) == 0)
          self = (optional<WebCore::SimpleRange> *)WebCore::Node::removedLastRef(v15);
      }
      else
      {
        *((_DWORD *)v15 + 6) -= 2;
      }
    }
    if (!v14)
      goto LABEL_2;
    v9 = **((_QWORD **)v13 + 5);
    *(_DWORD *)(v9 + 24) += 2;
    v17 = (Node *)v9;
    v10 = *(_WORD *)(v9 + 28);
    if ((v10 & 1) == 0 && (v10 & 4) != 0)
    {
      v12 = (WebCore::Node *)v9;
      WebCore::ContainerNode::countChildNodes((WebCore::ContainerNode *)v9);
    }
    else
    {
      v12 = (WebCore::Node *)v9;
    }
    WebCore::SimpleRange::SimpleRange();
    WebCore::resolveCharacterRange();
    retstr->var0.var1.var0.var0.var0 = v17;
    retstr->var0.var1.var0.var1 = v18;
    retstr->var0.var1.var1.var0.var0 = v19;
    retstr->var0.var1.var1.var1 = v20;
    retstr->var1 = 1;
    v19 = 0;
    v17 = 0;
    if (v16)
    {
      if (*((_DWORD *)v16 + 6) == 2)
      {
        if ((*((_WORD *)v16 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v16);
      }
      else
      {
        *((_DWORD *)v16 + 6) -= 2;
      }
    }
    if (v12)
    {
      if (*((_DWORD *)v12 + 6) == 2)
      {
        if ((*((_WORD *)v12 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v12);
      }
      else
      {
        *((_DWORD *)v12 + 6) -= 2;
      }
    }
    self = (optional<WebCore::SimpleRange> *)v13;
    if (v13)
    {
      v11 = *((_DWORD *)v13 + 6) - 2;
      if (*((_DWORD *)v13 + 6) == 2)
      {
        if ((*((_WORD *)v13 + 15) & 0x400) == 0)
          return (optional<WebCore::SimpleRange> *)WebCore::Node::removedLastRef(v13);
        return self;
      }
LABEL_43:
      self->var0.var1.var1.var1 = v11;
    }
  }
  else
  {
    self = (optional<WebCore::SimpleRange> *)WebCore::FrameSelection::rootEditableElementOrDocumentElement(*(WebCore::FrameSelection **)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)&self->var0.var1.var0.var1 + 8) + 296) + 3064));
    if (!self)
    {
LABEL_2:
      retstr->var0.var0 = 0;
      retstr->var1 = 0;
      return self;
    }
    WebCore::makeRangeSelectingNodeContents((WebCore *)self, v6);
    WebCore::resolveCharacterRange();
    retstr->var0.var1.var0.var0.var0 = v17;
    retstr->var0.var1.var0.var1 = v18;
    retstr->var0.var1.var1.var0.var0 = v19;
    retstr->var0.var1.var1.var1 = v20;
    retstr->var1 = 1;
    v19 = 0;
    v17 = 0;
    if (v16)
    {
      if (*((_DWORD *)v16 + 6) == 2)
      {
        if ((*((_WORD *)v16 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v16);
      }
      else
      {
        *((_DWORD *)v16 + 6) -= 2;
      }
    }
    self = (optional<WebCore::SimpleRange> *)v15;
    if (v15)
    {
      v11 = *((_DWORD *)v15 + 6) - 2;
      if (*((_DWORD *)v15 + 6) != 2)
        goto LABEL_43;
      if ((*((_WORD *)v15 + 15) & 0x400) == 0)
        return (optional<WebCore::SimpleRange> *)WebCore::Node::removedLastRef(v15);
    }
  }
  return self;
}

- (id)_convertNSRangeToDOMRange:(_NSRange)a3
{
  DOMObjectInternal *v3;
  uint64_t v5;
  uint64_t v6;
  char v7;

  if (self)
  {
    -[WebFrame _convertToDOMRange:](self, "_convertToDOMRange:", a3.location, a3.length);
  }
  else
  {
    v7 = 0;
    v5 = 0;
    v6 = 0;
  }
  v3 = kit();
  if (!v7)
    return v3;
  if (v6)
  {
    if (*(_DWORD *)(v6 + 24) == 2)
    {
      if ((*(_WORD *)(v6 + 30) & 0x400) == 0)
        WebCore::Node::removedLastRef((WebCore::Node *)v6);
    }
    else
    {
      *(_DWORD *)(v6 + 24) -= 2;
    }
  }
  if (!v5)
    return v3;
  if (*(_DWORD *)(v5 + 24) != 2)
  {
    *(_DWORD *)(v5 + 24) -= 2;
    return v3;
  }
  if ((*(_WORD *)(v5 + 30) & 0x400) != 0)
    return v3;
  WebCore::Node::removedLastRef((WebCore::Node *)v5);
  return v3;
}

- (_NSRange)_convertDOMRangeToNSRange:(id)a3
{
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  WebCore::Node *v7;
  NSUInteger v8;
  NSUInteger v9;
  WebCore::Node *v10;
  WebCore::Node *v11;
  WebCore::Node *v12;
  _NSRange result;

  if (a3)
  {
    WebCore::makeSimpleRange();
    v4 = -[WebFrame _convertToNSRange:](self, "_convertToNSRange:", &v11);
    v6 = v5;
    v7 = v12;
    v12 = 0;
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
    v10 = v11;
    v11 = 0;
    if (v10)
    {
      if (*((_DWORD *)v10 + 6) != 2)
      {
        *((_DWORD *)v10 + 6) -= 2;
        v8 = v4;
        v9 = v6;
        goto LABEL_14;
      }
      if ((*((_WORD *)v10 + 15) & 0x400) == 0)
      {
        WebCore::Node::removedLastRef(v10);
        v8 = v4;
        v9 = v6;
        goto LABEL_14;
      }
    }
  }
  else
  {
    v6 = 0;
    v4 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v8 = v4;
  v9 = v6;
LABEL_14:
  result.length = v9;
  result.location = v8;
  return result;
}

- (id)_markDOMRange
{
  uint64_t v2;
  DOMObjectInternal *v3;
  WebCore::Node *v5;
  WebCore::Node *v6;
  char v7;

  v2 = WebCore::Document::editor(*((WebCore::Document **)self->_private->coreFrame.m_ptr + 37));
  WebCore::VisibleSelection::toNormalizedRange((WebCore::VisibleSelection *)(v2 + 200));
  v3 = kit();
  if (!v7)
    return v3;
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
  if (!v5)
    return v3;
  if (*((_DWORD *)v5 + 6) != 2)
  {
    *((_DWORD *)v5 + 6) -= 2;
    return v3;
  }
  if ((*((_WORD *)v5 + 15) & 0x400) != 0)
    return v3;
  WebCore::Node::removedLastRef(v5);
  return v3;
}

- (id)_documentFragmentWithMarkupString:(id)a3 baseURLString:(id)a4
{
  LocalFrame *m_ptr;
  WebCore::Node *v5;
  StringImpl *v7;
  WebCore::Node *v8;
  WTF::StringImpl *v10;
  WTF::StringImpl *v11;
  WTF::StringImpl *v12;
  WTF::StringImpl *v13;
  WebCore::Node *v14;

  m_ptr = self->_private->coreFrame.m_ptr;
  if (!m_ptr)
    return 0;
  v5 = (WebCore::Node *)*((_QWORD *)m_ptr + 37);
  if (!v5)
    return v5;
  MEMORY[0x1D82A3998](&v13, a3);
  MEMORY[0x1D82A3998](&v12, a4);
  WebCore::createFragmentFromMarkup();
  v5 = kit(v14);
  v8 = v14;
  v14 = 0;
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
  v10 = v12;
  v12 = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 != 2)
    {
      *(_DWORD *)v10 -= 2;
      goto LABEL_13;
    }
    WTF::StringImpl::destroy(v10, v7);
    v11 = v13;
    v13 = 0;
    if (v11)
      goto LABEL_16;
    return v5;
  }
LABEL_13:
  v11 = v13;
  v13 = 0;
  if (!v11)
    return v5;
LABEL_16:
  if (*(_DWORD *)v11 == 2)
    WTF::StringImpl::destroy(v11, v7);
  else
    *(_DWORD *)v11 -= 2;
  return v5;
}

- (id)_documentFragmentWithNodesAsParagraphs:(id)a3
{
  LocalFrame *m_ptr;
  WebCore::Node *v4;
  void *v5;
  WTF *v6;
  unsigned int v7;
  uint64_t v8;
  WebCore::Node *v9;
  _QWORD *v10;
  Document *v11;
  uint64_t v12;
  Node **v13;
  Node *v14;
  StringImpl *v15;
  WTF::StringImpl *v16;
  WTF::StringImpl *v17;
  WebCore::ContainerNode *v18;
  void *v19;
  WebCore::Node *v20;
  WTF::StringImpl *v22;
  char v23;
  WTF::StringImpl *v24;
  char v25;
  WebCore::ContainerNode *v26;
  WebCore::Node *v27;
  WTF *v28;
  uint64_t i;

  m_ptr = self->_private->coreFrame.m_ptr;
  if (!m_ptr)
    return 0;
  v4 = (WebCore::Node *)*((_QWORD *)m_ptr + 37);
  if (v4)
  {
    v5 = (void *)objc_msgSend(a3, "objectEnumerator");
    v6 = 0;
    v7 = 0;
    v28 = 0;
    for (i = 0; ; HIDWORD(i) = v7)
    {
      v8 = objc_msgSend(v5, "nextObject");
      if (!v8)
        break;
      v9 = *(WebCore::Node **)(v8 + 16);
      v27 = v9;
      if (v7 == (_DWORD)i)
      {
        v10 = (_QWORD *)WTF::Vector<WTF::Ref<WebCore::HistoryItem,WTF::RawPtrTraits<WebCore::HistoryItem>,WTF::DefaultRefDerefTraits<WebCore::HistoryItem>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>((uint64_t)&v28, v7 + 1, (unint64_t)&v27);
        v7 = HIDWORD(i);
        v6 = v28;
        *((_QWORD *)v28 + HIDWORD(i)) = *v10;
      }
      else
      {
        *((_QWORD *)v6 + v7) = v9;
      }
      ++v7;
    }
    WebCore::Document::createDocumentFragment(v4);
    if (v7)
    {
      v12 = 8 * v7;
      v13 = (Node **)v6;
      while (1)
      {
        v14 = *v13;
        WebCore::createDefaultParagraphElement(v4, v11);
        WebCore::ContainerNode::appendChild(v26, v14);
        if (v25)
        {
          v16 = v24;
          v24 = 0;
          if (v16)
          {
            if (*(_DWORD *)v16 == 2)
              WTF::StringImpl::destroy(v16, v15);
            else
              *(_DWORD *)v16 -= 2;
          }
        }
        WebCore::ContainerNode::appendChild(v27, (Node *)v26);
        if (!v23)
          goto LABEL_22;
        v17 = v22;
        v22 = 0;
        if (!v17)
          goto LABEL_22;
        if (*(_DWORD *)v17 != 2)
          break;
        WTF::StringImpl::destroy(v17, (StringImpl *)v11);
        v18 = v26;
        v26 = 0;
        if (v18)
        {
LABEL_23:
          if (*((_DWORD *)v18 + 6) == 2)
          {
            if ((*((_WORD *)v18 + 15) & 0x400) == 0)
              WebCore::Node::removedLastRef(v18);
          }
          else
          {
            *((_DWORD *)v18 + 6) -= 2;
          }
        }
LABEL_12:
        ++v13;
        v12 -= 8;
        if (!v12)
          goto LABEL_28;
      }
      *(_DWORD *)v17 -= 2;
LABEL_22:
      v18 = v26;
      v26 = 0;
      if (v18)
        goto LABEL_23;
      goto LABEL_12;
    }
LABEL_28:
    v4 = kit(v27);
    v20 = v27;
    v27 = 0;
    if (v20)
    {
      if (*((_DWORD *)v20 + 6) == 2)
      {
        if ((*((_WORD *)v20 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v20);
      }
      else
      {
        *((_DWORD *)v20 + 6) -= 2;
      }
    }
    if (v6)
    {
      v28 = 0;
      LODWORD(i) = 0;
      WTF::fastFree(v6, v19);
    }
  }
  return v4;
}

- (void)_replaceSelectionWithNode:(id)a3 selectReplacement:(BOOL)a4 smartReplace:(BOOL)a5 matchStyle:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  _BOOL8 v8;
  WebCore::Node *v11;
  WebCore::Node *v12;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  WebCore::Document::createDocumentFragment(*((WebCore::Document **)self->_private->coreFrame.m_ptr + 37));
  v11 = kit(v12);
  if (v12)
  {
    if (*((_DWORD *)v12 + 6) == 2)
    {
      if ((*((_WORD *)v12 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v12);
    }
    else
    {
      *((_DWORD *)v12 + 6) -= 2;
    }
  }
  -[WebCore::Node appendChild:](v11, "appendChild:", a3);
  -[WebFrame _replaceSelectionWithFragment:selectReplacement:smartReplace:matchStyle:](self, "_replaceSelectionWithFragment:selectReplacement:smartReplace:matchStyle:", v11, v8, v7, v6);
}

- (void)_insertParagraphSeparatorInQuotedContent
{
  WebCore::Document *v2;
  WebCore::Editor *v3;

  v2 = (WebCore::Document *)*((_QWORD *)self->_private->coreFrame.m_ptr + 37);
  if (*(_BYTE *)(*((_QWORD *)v2 + 383) + 153))
  {
    v3 = (WebCore::Editor *)WebCore::Document::editor(v2);
    WebCore::Editor::insertParagraphSeparatorInQuotedContent(v3);
  }
}

- (VisiblePosition)_visiblePositionForPoint:(SEL)a3
{
  LocalFrame *m_ptr;
  _BYTE v6[8];
  CGPoint v7;

  v7 = a4;
  m_ptr = self->_private->coreFrame.m_ptr;
  WebCore::IntPoint::IntPoint((WebCore::IntPoint *)v6, &v7);
  return (VisiblePosition *)WebCore::LocalFrame::visiblePositionForPoint((WebCore::LocalFrame *)m_ptr, (const WebCore::IntPoint *)v6);
}

- (id)_characterRangeAtPoint:(CGPoint)a3
{
  LocalFrame *m_ptr;
  DOMObjectInternal *v4;
  WebCore::Node *v5;
  WebCore::Node *v6;
  IntPoint v8;
  WebCore::Node *v9;
  WebCore::Node *v10;
  char v11;
  CGPoint v12;

  v12 = a3;
  m_ptr = self->_private->coreFrame.m_ptr;
  WebCore::IntPoint::IntPoint((WebCore::IntPoint *)&v8, &v12);
  WebCore::LocalFrame::rangeForPoint((WebCore::LocalFrame *)m_ptr, &v8);
  v4 = kit();
  if (!v11)
    return v4;
  v5 = v10;
  v10 = 0;
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
  v6 = v9;
  v9 = 0;
  if (!v6)
    return v4;
  if (*((_DWORD *)v6 + 6) != 2)
  {
    *((_DWORD *)v6 + 6) -= 2;
    return v4;
  }
  if ((*((_WORD *)v6 + 15) & 0x400) != 0)
    return v4;
  WebCore::Node::removedLastRef(v6);
  return v4;
}

- (id)_typingStyle
{
  LocalFrame *m_ptr;
  DOMObjectInternal *v3;
  DOMObjectInternal *v4;
  WTF *v6;
  void *v7;
  WebCore::MutableStyleProperties *v8;

  m_ptr = self->_private->coreFrame.m_ptr;
  if (!m_ptr)
    return 0;
  WebCore::FrameSelection::copyTypingStyle(*(WebCore::FrameSelection **)(*((_QWORD *)m_ptr + 37) + 3064));
  if (!v8)
    return 0;
  v3 = (DOMObjectInternal *)WebCore::MutableStyleProperties::ensureCSSStyleDeclaration(v8);
  v4 = kit(v3);
  if (*(_DWORD *)v8 == 1)
  {
    WebCore::MutableStyleProperties::~MutableStyleProperties(v8);
    WTF::fastFree(v6, v7);
    return v4;
  }
  else
  {
    --*(_DWORD *)v8;
    return v4;
  }
}

- (void)_setTypingStyle:(id)a3 withUndoAction:(unsigned __int8)a4
{
  WebCore::MutableStyleProperties *v5;
  WTF *v6;
  void *v7;
  WebCore::MutableStyleProperties *v8;

  if (a3)
  {
    if (self->_private->coreFrame.m_ptr)
    {
      (*(void (**)(WebCore::MutableStyleProperties **__return_ptr))(**((_QWORD **)a3 + 2) + 160))(&v8);
      WebCore::Document::editor(*((WebCore::Document **)self->_private->coreFrame.m_ptr + 37));
      WebCore::Editor::computeAndSetTypingStyle();
      v5 = v8;
      v8 = 0;
      if (v5)
      {
        if (*(_DWORD *)v5 == 1)
        {
          WebCore::MutableStyleProperties::~MutableStyleProperties(v5);
          WTF::fastFree(v6, v7);
        }
        else
        {
          --*(_DWORD *)v5;
        }
      }
    }
  }
}

- (BOOL)_canProvideDocumentSource
{
  LocalFrame *m_ptr;
  const WTF::String *v3;
  WTF::StringImpl *v4;
  uint64_t v5;
  WebCore::Page *v6;
  uint64_t v7;
  const WTF::String *v8;
  BOOL v9;
  WTF::StringImpl *v10;
  WTF::StringImpl *v12;

  m_ptr = self->_private->coreFrame.m_ptr;
  v4 = *(WTF::StringImpl **)(WebCore::Document::loader(*((WebCore::Document **)m_ptr + 37)) + 120);
  if (v4)
    *(_DWORD *)v4 += 2;
  v12 = v4;
  v5 = *((_QWORD *)m_ptr + 3);
  if (v5 && (v6 = *(WebCore::Page **)(v5 + 8)) != 0)
    v7 = WebCore::Page::pluginData(v6);
  else
    v7 = 0;
  if ((WebCore::MIMETypeRegistry::isTextMIMEType((WebCore::MIMETypeRegistry *)&v12, v3) & 1) != 0
    || (WebCore::Image::supportsType((WebCore::Image *)&v12, v8) & 1) != 0
    || v7
    && ((WebCore::PluginData::supportsWebVisibleMimeType() & 1) != 0
     || (WebCore::PluginData::supportsWebVisibleMimeType() & 1) != 0))
  {
    v9 = 0;
    v10 = v12;
    v12 = 0;
    if (!v10)
      return v9;
  }
  else
  {
    v9 = 1;
    v10 = v12;
    v12 = 0;
    if (!v10)
      return v9;
  }
  if (*(_DWORD *)v10 != 2)
  {
    *(_DWORD *)v10 -= 2;
    return v9;
  }
  WTF::StringImpl::destroy(v10, (StringImpl *)v8);
  return v9;
}

- (void)_commitData:(id)a3
{
  NSData *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  WebCore::Document::setShouldCreateRenderers(*((WebCore::Document **)self->_private->coreFrame.m_ptr + 37));
  WebCore::FragmentedSharedBuffer::create((WebCore::FragmentedSharedBuffer *)a3, v4);
  v5 = WTF::fastMalloc((WTF *)0x38);
  MEMORY[0x1D82A42EC](v5, &v9);
  v8 = v5;
  WTF::Ref<WebCore::FragmentedSharedBuffer,WTF::RawPtrTraits<WebCore::FragmentedSharedBuffer>,WTF::DefaultRefDerefTraits<WebCore::FragmentedSharedBuffer>>::~Ref(&v9, v6);
  WebCore::DocumentLoader::commitData();
  WTF::Ref<WebCore::SharedBuffer,WTF::RawPtrTraits<WebCore::SharedBuffer>,WTF::DefaultRefDerefTraits<WebCore::SharedBuffer>>::~Ref(&v8, v7);
}

- (BOOL)_isDescendantOfFrame:(id)a3
{
  LocalFrame *m_ptr;
  const WebCore::Frame *v4;

  m_ptr = self->_private->coreFrame.m_ptr;
  if (!m_ptr)
    return 0;
  if (a3)
    v4 = *(const WebCore::Frame **)(*((_QWORD *)a3 + 1) + 8);
  else
    v4 = 0;
  return WebCore::FrameTree::isDescendantOf((WebCore::FrameTree *)((char *)m_ptr + 48), v4);
}

- (void)_setShouldCreateRenderers:(BOOL)a3
{
  self->_private->shouldCreateRenderers = a3;
}

- (CGColor)_bodyBackgroundColor
{
  CGColor *result;
  void *v3;
  uint64_t v4;
  unsigned int *v5;
  unsigned int v6;
  unsigned int v7;
  CGColor *v8;
  CGColor *arg;
  uint64_t v10;

  result = (CGColor *)*((_QWORD *)self->_private->coreFrame.m_ptr + 37);
  if (result)
  {
    result = (CGColor *)WebCore::Document::bodyOrFrameset(result);
    if (result)
    {
      if ((*((_QWORD *)result + 8) & 0xFFFFFFFFFFFFLL) == 0)
        return 0;
      if ((*(_BYTE *)((*((_QWORD *)result + 8) & 0xFFFFFFFFFFFFLL) + 0x2D) & 2) != 0)
      {
        result = (CGColor *)105;
        __break(0xC471u);
        return result;
      }
      WebCore::RenderStyle::visitedDependentColorWithColorFilter();
      v4 = v10;
      if ((v10 & 0x4000000000000) == 0)
      {
        result = 0;
        if ((v10 & 0x8000000000000) == 0)
          return result;
        goto LABEL_12;
      }
      WebCore::cachedCGColor();
      result = arg;
      if (arg)
      {
        CFAutorelease(arg);
        result = arg;
      }
      v4 = v10;
      if ((v10 & 0x8000000000000) != 0)
      {
LABEL_12:
        v5 = (unsigned int *)(v4 & 0xFFFFFFFFFFFFLL);
        do
        {
          v6 = __ldaxr(v5);
          v7 = v6 - 1;
        }
        while (__stlxr(v7, v5));
        if (!v7)
        {
          atomic_store(1u, v5);
          v8 = result;
          WTF::fastFree((WTF *)v5, v3);
          return v8;
        }
      }
    }
  }
  return result;
}

- (BOOL)_isFrameSet
{
  uint64_t v2;

  v2 = *((_QWORD *)self->_private->coreFrame.m_ptr + 37);
  if (v2)
    LOBYTE(v2) = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v2 + 392))(v2);
  return v2;
}

- (BOOL)_firstLayoutDone
{
  return WebCore::FrameLoaderStateMachine::firstLayoutDone((WebCore::FrameLoaderStateMachine *)(*((_QWORD *)self->_private->coreFrame.m_ptr
                                                                                                + 35)
                                                                                              + 64));
}

- (BOOL)_isVisuallyNonEmpty
{
  uint64_t v2;

  v2 = *((_QWORD *)self->_private->coreFrame.m_ptr + 36);
  return v2 && v2 != 0 && *(_BYTE *)(v2 + 1375) != 0;
}

- (int)_loadType
{
  unsigned int v2;

  v2 = WebCore::FrameLoader::loadType(*((WebCore::FrameLoader **)self->_private->coreFrame.m_ptr + 35)) - 1;
  if (v2 > 8)
    return 0;
  else
    return dword_1D80FBBC4[(char)v2];
}

- (BOOL)needsLayout
{
  return self->_private->coreFrame.m_ptr && -[WebFrame _needsLayout](self, "_needsLayout");
}

- (void)_setLoadsSynchronously:(BOOL)a3
{
  *(_BYTE *)(*((_QWORD *)self->_private->coreFrame.m_ptr + 35) + 324) = a3;
}

- (BOOL)_loadsSynchronously
{
  return *(_BYTE *)(*((_QWORD *)self->_private->coreFrame.m_ptr + 35) + 324);
}

- (id)_rectsForRange:(id)a3
{
  if (a3)
    return (id)objc_msgSend(a3, "textRects");
  else
    return (id)MEMORY[0x1E0C9AA60];
}

- (id)_selectionRangeForFirstPoint:(CGPoint)a3 secondPoint:(CGPoint)a4
{
  double y;
  double x;
  DOMObjectInternal *v7;
  WebCore::Node *v8;
  WebCore::Node *v9;
  Node *var0;
  Node *v11;
  _BYTE v13[104];
  WebCore::Node *v14;
  WebCore::Node *v15;
  char v16;
  VisiblePosition v17;
  VisiblePosition v18;

  if (self)
  {
    y = a4.y;
    x = a4.x;
    -[WebFrame _visiblePositionForPoint:](self, "_visiblePositionForPoint:", a3.x, a3.y);
    -[WebFrame _visiblePositionForPoint:](self, "_visiblePositionForPoint:", x, y);
  }
  else
  {
    memset(&v18, 0, sizeof(v18));
    memset(&v17, 0, sizeof(v17));
  }
  WebCore::VisibleSelection::VisibleSelection((WebCore::VisibleSelection *)v13, &v18, &v17);
  WebCore::VisibleSelection::toNormalizedRange((WebCore::VisibleSelection *)v13);
  v7 = kit();
  if (v16)
  {
    v8 = v15;
    v15 = 0;
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
    v9 = v14;
    v14 = 0;
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
  }
  WebCore::VisibleSelection::~VisibleSelection((WebCore::VisibleSelection *)v13);
  var0 = v17.var0.var0.var0;
  v17.var0.var0.var0 = 0;
  if (var0)
  {
    if (*((_DWORD *)var0 + 6) == 2)
    {
      if ((*((_WORD *)var0 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef((WebCore::Node *)var0);
    }
    else
    {
      *((_DWORD *)var0 + 6) -= 2;
    }
  }
  v11 = v18.var0.var0.var0;
  v18.var0.var0.var0 = 0;
  if (!v11)
    return v7;
  if (*((_DWORD *)v11 + 6) != 2)
  {
    *((_DWORD *)v11 + 6) -= 2;
    return v7;
  }
  if ((*((_WORD *)v11 + 15) & 0x400) != 0)
    return v7;
  WebCore::Node::removedLastRef((WebCore::Node *)v11);
  return v7;
}

- (id)_selectionRangeForPoint:(CGPoint)a3
{
  DOMObjectInternal *v3;
  uint64_t v4;
  uint64_t v5;
  Node *var0;
  VisiblePosition v8;
  _BYTE v9[104];
  uint64_t v10;
  uint64_t v11;
  char v12;

  if (self)
    -[WebFrame _visiblePositionForPoint:](self, "_visiblePositionForPoint:", a3.x, a3.y);
  else
    memset(&v8, 0, sizeof(v8));
  WebCore::VisibleSelection::VisibleSelection((WebCore::VisibleSelection *)v9, &v8);
  WebCore::VisibleSelection::toNormalizedRange((WebCore::VisibleSelection *)v9);
  v3 = kit();
  if (v12)
  {
    v4 = v11;
    v11 = 0;
    if (v4)
    {
      if (*(_DWORD *)(v4 + 24) == 2)
      {
        if ((*(_WORD *)(v4 + 30) & 0x400) == 0)
          WebCore::Node::removedLastRef((WebCore::Node *)v4);
      }
      else
      {
        *(_DWORD *)(v4 + 24) -= 2;
      }
    }
    v5 = v10;
    v10 = 0;
    if (v5)
    {
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
  }
  WebCore::VisibleSelection::~VisibleSelection((WebCore::VisibleSelection *)v9);
  var0 = v8.var0.var0.var0;
  v8.var0.var0.var0 = 0;
  if (!var0)
    return v3;
  if (*((_DWORD *)var0 + 6) != 2)
  {
    *((_DWORD *)var0 + 6) -= 2;
    return v3;
  }
  if ((*((_WORD *)var0 + 15) & 0x400) != 0)
    return v3;
  WebCore::Node::removedLastRef((WebCore::Node *)var0);
  return v3;
}

- (_NSRange)_selectedNSRange
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  WebCore::Node *v6;
  NSUInteger v7;
  NSUInteger v8;
  WebCore::Node *v9;
  WebCore::Node *v10;
  WebCore::Node *v11;
  char v12;
  _NSRange result;

  WebCore::VisibleSelection::toNormalizedRange((WebCore::VisibleSelection *)(*(_QWORD *)(*((_QWORD *)self->_private->coreFrame.m_ptr
                                                                                         + 37)
                                                                                       + 3064)
                                                                           + 56));
  if (v12)
  {
    v3 = -[WebFrame _convertToNSRange:](self, "_convertToNSRange:", &v10);
    v5 = v4;
    if (v12)
    {
      v6 = v11;
      v11 = 0;
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
      v9 = v10;
      v10 = 0;
      if (v9)
      {
        if (*((_DWORD *)v9 + 6) != 2)
        {
          *((_DWORD *)v9 + 6) -= 2;
          v7 = v3;
          v8 = v5;
          goto LABEL_15;
        }
        if ((*((_WORD *)v9 + 15) & 0x400) == 0)
        {
          WebCore::Node::removedLastRef(v9);
          v7 = v3;
          v8 = v5;
          goto LABEL_15;
        }
      }
    }
  }
  else
  {
    v5 = 0;
    v3 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v7 = v3;
  v8 = v5;
LABEL_15:
  result.length = v8;
  result.location = v7;
  return result;
}

- (void)_selectNSRange:(_NSRange)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  if (self)
  {
    -[WebFrame _convertToDOMRange:](self, "_convertToDOMRange:", a3.location, a3.length);
    if (v8)
    {
      WebCore::VisibleSelection::VisibleSelection();
      WebCore::FrameSelection::setSelection();
      WebCore::VisibleSelection::~VisibleSelection((WebCore::VisibleSelection *)&v5);
      if (v8)
      {
        v3 = v7;
        v7 = 0;
        if (v3)
        {
          if (*(_DWORD *)(v3 + 24) == 2)
          {
            if ((*(_WORD *)(v3 + 30) & 0x400) == 0)
              WebCore::Node::removedLastRef((WebCore::Node *)v3);
          }
          else
          {
            *(_DWORD *)(v3 + 24) -= 2;
          }
        }
        v4 = v6;
        v6 = 0;
        if (v4)
        {
          if (*(_DWORD *)(v4 + 24) == 2)
          {
            if ((*(_WORD *)(v4 + 30) & 0x400) == 0)
              WebCore::Node::removedLastRef((WebCore::Node *)v4);
          }
          else
          {
            *(_DWORD *)(v4 + 24) -= 2;
          }
        }
      }
    }
  }
}

- (BOOL)_isDisplayingStandaloneImage
{
  uint64_t v2;
  _BOOL4 v3;

  v2 = *((_QWORD *)self->_private->coreFrame.m_ptr + 37);
  if (v2)
    return (*(unsigned __int16 *)(v2 + 3358) >> 2) & 1;
  else
    LOBYTE(v3) = 0;
  return v3;
}

- (unsigned)_pendingFrameUnloadEventCount
{
  return WebCore::LocalDOMWindow::pendingUnloadEventListeners(*(WebCore::LocalDOMWindow **)(*((_QWORD *)self->_private->coreFrame.m_ptr
                                                                                            + 37)
                                                                                          + 696));
}

- (void)setTimeoutsPaused:(BOOL)a3
{
  LocalFrame *m_ptr;

  if (-[WebFrame _webHTMLDocumentView](self, "_webHTMLDocumentView"))
  {
    m_ptr = self->_private->coreFrame.m_ptr;
    if (m_ptr)
      WebCore::LocalFrame::setTimersPaused((WebCore::LocalFrame *)m_ptr);
  }
}

- (void)setPluginsPaused:(BOOL)a3
{
  LocalFrame *m_ptr;
  uint64_t v4;
  uint64_t v5;
  _BOOL4 v6;
  id Weak;

  if (self)
  {
    m_ptr = self->_private->coreFrame.m_ptr;
    if (m_ptr)
    {
      v4 = *((_QWORD *)m_ptr + 3);
      if (v4)
      {
        v5 = *(_QWORD *)(v4 + 8);
        if (v5)
        {
          v6 = a3;
          if (((*(uint64_t (**)(_QWORD, SEL))(**(_QWORD **)(*(_QWORD *)(v5 + 48) + 16) + 1368))(*(_QWORD *)(*(_QWORD *)(v5 + 48) + 16), a2) & 1) == 0)
          {
            Weak = objc_loadWeak((id *)(*(_QWORD *)(*(_QWORD *)(v5 + 48) + 16) + 16));
            if (Weak)
            {
              if (v6)
                objc_msgSend(Weak, "_stopAllPlugIns");
              else
                objc_msgSend(Weak, "_startAllPlugIns");
            }
          }
        }
      }
    }
  }
}

- (void)prepareForPause
{
  LocalFrame *m_ptr;

  if (-[WebFrame _webHTMLDocumentView](self, "_webHTMLDocumentView"))
  {
    m_ptr = self->_private->coreFrame.m_ptr;
    if (m_ptr)
      WebCore::LocalFrame::dispatchPageHideEventBeforePause((WebCore::LocalFrame *)m_ptr);
  }
}

- (void)resumeFromPause
{
  LocalFrame *m_ptr;

  if (-[WebFrame _webHTMLDocumentView](self, "_webHTMLDocumentView"))
  {
    m_ptr = self->_private->coreFrame.m_ptr;
    if (m_ptr)
      WebCore::LocalFrame::dispatchPageShowEventBeforeResume((WebCore::LocalFrame *)m_ptr);
  }
}

- (void)selectWithoutClosingTypingNSRange:(_NSRange)a3
{
  WebCore::Editor *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;

  if (self)
  {
    -[WebFrame _convertToDOMRange:](self, "_convertToDOMRange:", a3.location, a3.length);
    if (v10)
    {
      WebCore::VisibleSelection::VisibleSelection();
      WebCore::FrameSelection::setSelection();
      WebCore::VisibleSelection::~VisibleSelection((WebCore::VisibleSelection *)&v7);
      v4 = (WebCore::Editor *)WebCore::Document::editor(*((WebCore::Document **)self->_private->coreFrame.m_ptr + 37));
      WebCore::Editor::ensureLastEditCommandHasCurrentSelectionIfOpenForMoreTyping(v4);
      if (v10)
      {
        v5 = v9;
        v9 = 0;
        if (v5)
        {
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
        v6 = v8;
        v8 = 0;
        if (v6)
        {
          if (*(_DWORD *)(v6 + 24) == 2)
          {
            if ((*(_WORD *)(v6 + 30) & 0x400) == 0)
              WebCore::Node::removedLastRef((WebCore::Node *)v6);
          }
          else
          {
            *(_DWORD *)(v6 + 24) -= 2;
          }
        }
      }
    }
  }
}

- (void)forceLayoutAdjustingViewSize:(BOOL)a3
{
  BOOL v4;

  v4 = !a3;
  WebCore::LocalFrameView::forceLayout(*((WebCore::LocalFrameView **)self->_private->coreFrame.m_ptr + 36));
  if (!v4)
    WebCore::LocalFrameView::adjustViewSize(*((WebCore::LocalFrameView **)self->_private->coreFrame.m_ptr + 36));
}

- (void)_handleKeyEvent:(id)a3
{
  WebCore::EventHandler::keyEvent();
}

- (void)_selectAll
{
  WebCore::FrameSelection::selectAll(*(WebCore::FrameSelection **)(*((_QWORD *)self->_private->coreFrame.m_ptr + 37)
                                                                 + 3064));
}

- (void)_setSelectionFromNone
{
  WebCore::FrameSelection::setSelectionFromNone(*(WebCore::FrameSelection **)(*((_QWORD *)self->_private->coreFrame.m_ptr
                                                                              + 37)
                                                                            + 3064));
}

- (void)_restoreViewState
{
  uint64_t v2;

  v2 = *(_QWORD *)(*((_QWORD *)self->_private->coreFrame.m_ptr + 35) + 16);
  (*(void (**)(uint64_t))(*(_QWORD *)v2 + 728))(v2);
}

- (void)_saveViewState
{
  LocalFrame *m_ptr;

  m_ptr = self->_private->coreFrame.m_ptr;
  if (*(_QWORD *)(*((_QWORD *)m_ptr + 23) + 16))
    (*(void (**)(_QWORD))(**(_QWORD **)(*((_QWORD *)m_ptr + 35) + 16) + 720))(*(_QWORD *)(*((_QWORD *)m_ptr + 35) + 16));
}

- (void)deviceOrientationChanged
{
  WebThreadRun();
}

WebCore::LocalFrame *__48__WebFrame_WebPrivate__deviceOrientationChanged__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *Weak;
  WebCore::LocalFrame *result;
  uint64_t v7;

  v2 = *(_QWORD *)(a1 + 32);
  if (!v2)
    goto LABEL_6;
  v3 = *(_QWORD *)(*(_QWORD *)(v2 + 8) + 8);
  if (!v3)
    goto LABEL_6;
  v4 = *(_QWORD *)(v3 + 24);
  if (!v4)
    goto LABEL_6;
  Weak = *(_QWORD **)(v4 + 8);
  if (!Weak)
    goto LABEL_7;
  if (((*(uint64_t (**)(_QWORD))(**(_QWORD **)(Weak[6] + 16) + 1368))(*(_QWORD *)(Weak[6] + 16)) & 1) == 0)
    Weak = objc_loadWeak((id *)(*(_QWORD *)(Weak[6] + 16) + 16));
  else
LABEL_6:
    Weak = 0;
LABEL_7:
  result = (WebCore::LocalFrame *)objc_msgSend(Weak, "_setDeviceOrientation:", (int)objc_msgSend((id)objc_msgSend(Weak, "_UIKitDelegateForwarder"), "deviceOrientation"));
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
  {
    result = *(WebCore::LocalFrame **)(*(_QWORD *)(v7 + 8) + 8);
    if (result)
      return (WebCore::LocalFrame *)WebCore::LocalFrame::orientationChanged(result);
  }
  return result;
}

- (void)setNeedsLayout
{
  WebCore::LocalFrameView *v2;

  v2 = (WebCore::LocalFrameView *)*((_QWORD *)self->_private->coreFrame.m_ptr + 36);
  if (v2)
    WebCore::LocalFrameView::setNeedsLayoutAfterViewConfigurationChange(v2);
}

- (CGSize)renderedSizeOfNode:(id)a3 constrainedToWidth:(float)a4
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  double v8;
  double v9;
  float v10;
  CGSize result;

  if (a3 && (v5 = *((_QWORD *)a3 + 2)) != 0)
    v6 = *(_QWORD *)(v5 + 64) & 0xFFFFFFFFFFFFLL;
  else
    v6 = 0;
  v7 = (*(uint64_t (**)(uint64_t, SEL))(*(_QWORD *)v6 + 416))(v6, a2);
  v8 = 0.0;
  v9 = 0.0;
  if ((*(_BYTE *)(v6 + 45) & 4) != 0)
  {
    v10 = (float)v7 * 0.015625;
    if (v10 > a4)
      v10 = a4;
    v8 = v10;
    v9 = (double)*(int *)(v6 + 164) * 0.015625;
  }
  result.height = v9;
  result.width = v8;
  return result;
}

- (id)deepestNodeAtViewportLocation:(CGPoint)a3
{
  LocalFrame *m_ptr;
  WebCore::Node *v4;
  _BYTE v6[8];
  CGPoint v7;

  v7 = a3;
  if (self)
    m_ptr = self->_private->coreFrame.m_ptr;
  else
    m_ptr = 0;
  WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v6, &v7);
  v4 = (WebCore::Node *)WebCore::LocalFrame::deepestNodeAtLocation((WebCore::LocalFrame *)m_ptr, (const WebCore::FloatPoint *)v6);
  return kit(v4);
}

- (id)scrollableNodeAtViewportLocation:(CGPoint)a3
{
  LocalFrame *m_ptr;
  WebCore::Node *v4;
  _BYTE v6[8];
  CGPoint v7;

  v7 = a3;
  if (self)
    m_ptr = self->_private->coreFrame.m_ptr;
  else
    m_ptr = 0;
  WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v6, &v7);
  v4 = (WebCore::Node *)WebCore::LocalFrame::nodeRespondingToScrollWheelEvents((WebCore::LocalFrame *)m_ptr, (const WebCore::FloatPoint *)v6);
  return kit(v4);
}

- (id)approximateNodeAtViewportLocation:(CGPoint *)a3
{
  LocalFrame *m_ptr;
  WebCore::Node *v5;
  CGFloat v6;
  CGFloat v7;
  uint64_t v9;
  _BYTE v10[8];

  if (self)
    m_ptr = self->_private->coreFrame.m_ptr;
  else
    m_ptr = 0;
  WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)v10, a3);
  v9 = 0;
  v5 = (WebCore::Node *)WebCore::LocalFrame::approximateNodeAtViewportLocationLegacy((WebCore::LocalFrame *)m_ptr, (const WebCore::FloatPoint *)v10, (WebCore::FloatPoint *)&v9);
  WebCore::FloatPoint::operator CGPoint();
  a3->x = v6;
  a3->y = v7;
  return kit(v5);
}

- (CGRect)renderRectForPoint:(CGPoint)a3 isReplaced:(BOOL *)a4 fontSize:(float *)a5
{
  double v6;
  double v7;
  double v8;
  double v9;
  BOOL v10;
  CGRect result;

  if (self)
    self = (WebFrame *)self->_private->coreFrame.m_ptr;
  v10 = 0;
  WebCore::LocalFrame::renderRectForPoint((WebCore::LocalFrame *)self, a3, &v10, a5);
  *a4 = v10;
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (void)_setProhibitsScrolling:(BOOL)a3
{
  *(_BYTE *)(*((_QWORD *)self->_private->coreFrame.m_ptr + 36) + 315) = a3;
}

- (void)revealSelectionAtExtent:(BOOL)a3
{
  WebCore::FrameSelection::revealSelection();
}

- (void)resetSelection
{
  WebCore::FrameSelection::setSelection();
}

- (BOOL)hasEditableSelection
{
  return WebCore::VisibleSelection::isContentEditable((WebCore::VisibleSelection *)(*(_QWORD *)(*((_QWORD *)self->_private->coreFrame.m_ptr
                                                                                                + 37)
                                                                                              + 3064)
                                                                                  + 56));
}

- (int)preferredHeight
{
  if (self)
    self = (WebFrame *)self->_private->coreFrame.m_ptr;
  return WebCore::LocalFrame::preferredHeight((WebCore::LocalFrame *)self);
}

- (int)innerLineHeight:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  if (a3
    && (v3 = *((_QWORD *)a3 + 2), WebCore::Document::updateLayout(), (v4 = *(_QWORD *)(v3 + 64) & 0xFFFFFFFFFFFFLL) != 0))
  {
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v4 + 304))(v4);
  }
  else
  {
    return 0;
  }
}

- (void)updateLayout
{
  if (self)
    self = (WebFrame *)self->_private->coreFrame.m_ptr;
  WebCore::LocalFrame::updateLayout((WebCore::LocalFrame *)self);
}

- (void)setIsActive:(BOOL)a3
{
  WebCore::FocusController::setActive(*(WebCore::FocusController **)(*(_QWORD *)(*((_QWORD *)self->_private->coreFrame.m_ptr
                                                                                 + 3)
                                                                               + 8)
                                                                   + 72));
}

- (void)setSelectionChangeCallbacksDisabled:(BOOL)a3
{
  if (self)
    self = (WebFrame *)self->_private->coreFrame.m_ptr;
  WebCore::LocalFrame::setSelectionChangeCallbacksDisabled((WebCore::LocalFrame *)self);
}

- (CGRect)caretRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  if (self)
    self = (WebFrame *)self->_private->coreFrame.m_ptr;
  WebCore::LocalFrame::caretRect((WebCore::LocalFrame *)self);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)rectForScrollToVisible
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  if (self)
    self = (WebFrame *)self->_private->coreFrame.m_ptr;
  WebCore::LocalFrame::rectForScrollToVisible((WebCore::LocalFrame *)self);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setCaretColor:(CGColor *)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  unsigned int *v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;

  if (a3)
  {
    v3 = WebCore::roundAndClampToSRGBALossy(a3, (CGColor *)a2);
    v4 = bswap32(v3) | 0x1104000000000000;
    if (!BYTE4(v3))
      v4 = 0;
  }
  else
  {
    v4 = 0x11040000000000FFLL;
  }
  v9 = v4;
  WebCore::FrameSelection::setCaretColor();
  if ((v9 & 0x8000000000000) != 0)
  {
    v6 = (unsigned int *)(v9 & 0xFFFFFFFFFFFFLL);
    do
    {
      v7 = __ldaxr(v6);
      v8 = v7 - 1;
    }
    while (__stlxr(v8, v6));
    if (!v8)
    {
      atomic_store(1u, v6);
      WTF::fastFree((WTF *)v6, v5);
    }
  }
}

- (CGColor)caretColor
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  unsigned int *v9;
  unsigned int v10;
  unsigned int v11;
  CGColor *v12;
  CGColor *arg;
  uint64_t v14;

  if (!self)
    return self;
  v2 = *(_QWORD *)(*((_QWORD *)self + 1) + 8);
  if (!v2)
    return 0;
  v3 = *(_QWORD *)(v2 + 296);
  if (!v3)
    return 0;
  v4 = *(_QWORD *)(v3 + 1248);
  if (!v4)
    return 0;
  v5 = *(_QWORD *)(v4 + 64) & 0xFFFFFFFFFFFFLL;
  if (!v5)
    return 0;
  if ((*(_BYTE *)(v5 + 45) & 2) != 0)
    goto LABEL_22;
  if ((*(_BYTE *)(v5 + 45) & 1) != 0)
  {
    WebCore::CaretBase::computeCaretColor();
    v8 = v14;
    if ((v14 & 0x4000000000000) == 0)
    {
LABEL_11:
      self = 0;
      if ((v8 & 0x8000000000000) == 0)
        return self;
      goto LABEL_18;
    }
    goto LABEL_15;
  }
  v6 = *(_QWORD *)(*(_QWORD *)(v5 + 24) + 8);
  if (v6)
  {
    if ((*(_WORD *)(v6 + 28) & 8) == 0)
    {
LABEL_22:
      __break(0xC471u);
      JUMPOUT(0x1D804CDA8);
    }
  }
  WebCore::CaretBase::computeCaretColor();
  v8 = v14;
  if ((v14 & 0x4000000000000) == 0)
    goto LABEL_11;
LABEL_15:
  WebCore::cachedCGColor();
  self = arg;
  if (arg)
  {
    CFAutorelease(arg);
    self = arg;
  }
  v8 = v14;
  if ((v14 & 0x8000000000000) != 0)
  {
LABEL_18:
    v9 = (unsigned int *)(v8 & 0xFFFFFFFFFFFFLL);
    do
    {
      v10 = __ldaxr(v9);
      v11 = v10 - 1;
    }
    while (__stlxr(v11, v9));
    if (!v11)
    {
      atomic_store(1u, v9);
      v12 = self;
      WTF::fastFree((WTF *)v9, v7);
      return v12;
    }
  }
  return self;
}

- (id)documentView
{
  LocalFrame *m_ptr;
  id *v3;
  WebFrameView *v4;

  if (self)
  {
    m_ptr = self->_private->coreFrame.m_ptr;
    if (!m_ptr)
    {
      v4 = (WebFrameView *)objc_msgSend(0, "frameView");
      return -[WebFrameView documentView](v4, "documentView");
    }
    v3 = *(id **)(*((_QWORD *)m_ptr + 35) + 16);
    if (((*((uint64_t (**)(id *, SEL))*v3 + 134))(v3, a2) & 1) == 0)
    {
      v4 = (WebFrameView *)objc_msgSend(v3[2], "frameView");
      return -[WebFrameView documentView](v4, "documentView");
    }
    self = 0;
  }
  v4 = -[WebFrame frameView](self, "frameView");
  return -[WebFrameView documentView](v4, "documentView");
}

- (int)layoutCount
{
  LocalFrame *m_ptr;
  uint64_t v3;

  if (self)
  {
    m_ptr = self->_private->coreFrame.m_ptr;
    if (m_ptr && (v3 = *((_QWORD *)m_ptr + 36)) != 0)
      LODWORD(self) = *(_DWORD *)(v3 + 484);
    else
      LODWORD(self) = 0;
  }
  return (int)self;
}

- (BOOL)isTelephoneNumberParsingAllowed
{
  LocalFrame *m_ptr;
  WebCore::Document *v3;

  if (self
    && (m_ptr = self->_private->coreFrame.m_ptr) != 0
    && (v3 = (WebCore::Document *)*((_QWORD *)m_ptr + 37)) != 0)
  {
    return WebCore::Document::isTelephoneNumberParsingAllowed(v3);
  }
  else
  {
    return 0;
  }
}

- (BOOL)isTelephoneNumberParsingEnabled
{
  LocalFrame *m_ptr;
  WebCore::Document *v3;

  if (self
    && (m_ptr = self->_private->coreFrame.m_ptr) != 0
    && (v3 = (WebCore::Document *)*((_QWORD *)m_ptr + 37)) != 0)
  {
    return WebCore::Document::isTelephoneNumberParsingEnabled(v3);
  }
  else
  {
    return 0;
  }
}

- (id)selectedDOMRange
{
  DOMObjectInternal *v2;
  WebCore::Node *v4;
  WebCore::Node *v5;
  char v6;

  WebCore::VisibleSelection::toNormalizedRange((WebCore::VisibleSelection *)(*(_QWORD *)(*((_QWORD *)self->_private->coreFrame.m_ptr
                                                                                         + 37)
                                                                                       + 3064)
                                                                           + 56));
  v2 = kit();
  if (!v6)
    return v2;
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

- (void)setSelectedDOMRange:(id)a3 affinity:(unint64_t)a4 closeTyping:(BOOL)a5
{
  -[WebFrame setSelectedDOMRange:affinity:closeTyping:userTriggered:](self, "setSelectedDOMRange:affinity:closeTyping:userTriggered:", a3, a4, a5, 0);
}

- (void)setSelectedDOMRange:(id)a3 affinity:(unint64_t)a4 closeTyping:(BOOL)a5 userTriggered:(BOOL)a6
{
  LocalFrame *m_ptr;
  uint64_t v8;
  WAKView *v9;
  WebCore::Editor *v10;
  WebCore::Node *v11;
  WebCore::Node *v12;
  char v13;

  if (self)
  {
    m_ptr = self->_private->coreFrame.m_ptr;
    v8 = *((_QWORD *)m_ptr + 3);
    if (!v8)
      return;
  }
  else
  {
    m_ptr = 0;
    v8 = MEMORY[0x18];
    if (!MEMORY[0x18])
      return;
  }
  if (*(_QWORD *)(v8 + 8))
  {
    v9 = (WAKView *)WebCore::ScrollView::documentView(*((WebCore::ScrollView **)m_ptr + 36));
    if (v9)
      WebCore::Chrome::focusNSView(*(WebCore::Chrome **)(*(_QWORD *)(*((_QWORD *)m_ptr + 3) + 8) + 48), v9);
    WebCore::makeSimpleRange();
    WebCore::FrameSelection::setSelectedRange();
    if (v13)
    {
      if (v12)
      {
        if (*((_DWORD *)v12 + 6) == 2)
        {
          if ((*((_WORD *)v12 + 15) & 0x400) == 0)
            WebCore::Node::removedLastRef(v12);
        }
        else
        {
          *((_DWORD *)v12 + 6) -= 2;
        }
      }
      if (v11)
      {
        if (*((_DWORD *)v11 + 6) == 2)
        {
          if ((*((_WORD *)v11 + 15) & 0x400) == 0)
            WebCore::Node::removedLastRef(v11);
        }
        else
        {
          *((_DWORD *)v11 + 6) -= 2;
        }
      }
    }
    if (!a5)
    {
      v10 = (WebCore::Editor *)WebCore::Document::editor(*((WebCore::Document **)m_ptr + 37));
      WebCore::Editor::ensureLastEditCommandHasCurrentSelectionIfOpenForMoreTyping(v10);
    }
  }
}

- (unint64_t)selectionAffinity
{
  return *(unsigned __int8 *)(*(_QWORD *)(*((_QWORD *)self->_private->coreFrame.m_ptr + 37) + 3064) + 152);
}

- (void)expandSelectionToElementContainingCaretSelection
{
  WebCore::FrameSelection::expandSelectionToElementContainingCaretSelection(*(WebCore::FrameSelection **)(*((_QWORD *)self->_private->coreFrame.m_ptr + 37) + 3064));
}

- (id)elementRangeContainingCaretSelection
{
  DOMObjectInternal *v2;
  WebCore::Node *v4;
  WebCore::Node *v5;
  char v6;

  WebCore::FrameSelection::elementRangeContainingCaretSelection(*(WebCore::FrameSelection **)(*((_QWORD *)self->_private->coreFrame.m_ptr
                                                                                              + 37)
                                                                                            + 3064));
  v2 = kit();
  if (!v6)
    return v2;
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

- (void)expandSelectionToWordContainingCaretSelection
{
  WebCore::FrameSelection::expandSelectionToWordContainingCaretSelection(*(WebCore::FrameSelection **)(*((_QWORD *)self->_private->coreFrame.m_ptr + 37) + 3064));
}

- (void)expandSelectionToStartOfWordContainingCaretSelection
{
  WebCore::FrameSelection::expandSelectionToStartOfWordContainingCaretSelection(*(WebCore::FrameSelection **)(*((_QWORD *)self->_private->coreFrame.m_ptr + 37) + 3064));
}

- (unsigned)characterInRelationToCaretSelection:(int)a3
{
  return WebCore::FrameSelection::characterInRelationToCaretSelection(*(WebCore::FrameSelection **)(*((_QWORD *)self->_private->coreFrame.m_ptr + 37)
                                                                                                  + 3064));
}

- (unsigned)characterBeforeCaretSelection
{
  LocalFrame *m_ptr;
  WebCore::Node *v4;
  WebCore::Node *v5;
  WebCore::Node *v6;

  if (!self)
  {
    LOWORD(m_ptr) = 0;
    return (unsigned __int16)m_ptr;
  }
  m_ptr = self->_private->coreFrame.m_ptr;
  if (!m_ptr)
    return (unsigned __int16)m_ptr;
  WebCore::Document::updateLayout();
  WebCore::VisiblePosition::VisiblePosition();
  WebCore::VisiblePosition::previous();
  LOWORD(m_ptr) = WebCore::VisiblePosition::characterAfter((WebCore::VisiblePosition *)&v6);
  v4 = v6;
  v6 = 0;
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
  if (!v5)
    return (unsigned __int16)m_ptr;
  if (*((_DWORD *)v5 + 6) != 2)
  {
    *((_DWORD *)v5 + 6) -= 2;
    return (unsigned __int16)m_ptr;
  }
  if ((*((_WORD *)v5 + 15) & 0x400) != 0)
    return (unsigned __int16)m_ptr;
  WebCore::Node::removedLastRef(v5);
  return (unsigned __int16)m_ptr;
}

- (unsigned)characterAfterCaretSelection
{
  LocalFrame *m_ptr;
  WebCore::Node *v4;
  WebCore::Node *v5;

  if (!self)
  {
    LOWORD(m_ptr) = 0;
    return (unsigned __int16)m_ptr;
  }
  m_ptr = self->_private->coreFrame.m_ptr;
  if (!m_ptr)
    return (unsigned __int16)m_ptr;
  WebCore::Document::updateLayout();
  WebCore::VisiblePosition::VisiblePosition();
  LOWORD(m_ptr) = WebCore::VisiblePosition::characterAfter((WebCore::VisiblePosition *)&v5);
  v4 = v5;
  v5 = 0;
  if (!v4)
    return (unsigned __int16)m_ptr;
  if (*((_DWORD *)v4 + 6) != 2)
  {
    *((_DWORD *)v4 + 6) -= 2;
    return (unsigned __int16)m_ptr;
  }
  if ((*((_WORD *)v4 + 15) & 0x400) != 0)
    return (unsigned __int16)m_ptr;
  WebCore::Node::removedLastRef(v4);
  return (unsigned __int16)m_ptr;
}

- (id)wordRangeContainingCaretSelection
{
  DOMObjectInternal *v2;
  WebCore::Node *v4;
  WebCore::Node *v5;
  char v6;

  WebCore::FrameSelection::wordRangeContainingCaretSelection(*(WebCore::FrameSelection **)(*((_QWORD *)self->_private->coreFrame.m_ptr
                                                                                           + 37)
                                                                                         + 3064));
  v2 = kit();
  if (!v6)
    return v2;
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

- (id)wordInRange:(id)a3
{
  if (a3)
    return -[WebFrame _stringForRange:](self, "_stringForRange:");
  else
    return 0;
}

- (int)wordOffsetInRange:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  int v14;
  int v15;
  uint64_t v16;
  int v17;
  char v18;
  uint64_t v19;
  int v20;
  char v21;
  uint64_t v22;
  int v23;
  char v24;
  uint64_t v25;
  int v26;
  char v27;
  uint64_t v28;
  int v29;
  char v30;
  uint64_t v31;
  int v32;
  char v33;
  __int16 v34;
  char v35;

  if (!a3)
    return -1;
  v4 = *(_QWORD *)(*((_QWORD *)self->_private->coreFrame.m_ptr + 37) + 3064);
  v5 = *(_QWORD *)(v4 + 56);
  if (v5)
    *(_DWORD *)(v5 + 24) += 2;
  v16 = v5;
  v17 = *(_DWORD *)(v4 + 64);
  v18 = *(_BYTE *)(v4 + 68);
  v6 = *(_QWORD *)(v4 + 72);
  if (v6)
    *(_DWORD *)(v6 + 24) += 2;
  v19 = v6;
  v20 = *(_DWORD *)(v4 + 80);
  v21 = *(_BYTE *)(v4 + 84);
  v7 = *(_QWORD *)(v4 + 88);
  if (v7)
    *(_DWORD *)(v7 + 24) += 2;
  v22 = v7;
  v23 = *(_DWORD *)(v4 + 96);
  v24 = *(_BYTE *)(v4 + 100);
  v8 = *(_QWORD *)(v4 + 104);
  if (v8)
    *(_DWORD *)(v8 + 24) += 2;
  v25 = v8;
  v26 = *(_DWORD *)(v4 + 112);
  v27 = *(_BYTE *)(v4 + 116);
  v9 = *(_QWORD *)(v4 + 120);
  if (v9)
    *(_DWORD *)(v9 + 24) += 2;
  v28 = v9;
  v29 = *(_DWORD *)(v4 + 128);
  v30 = *(_BYTE *)(v4 + 132);
  v10 = *(_QWORD *)(v4 + 136);
  if (v10)
    *(_DWORD *)(v10 + 24) += 2;
  v31 = v10;
  v32 = *(_DWORD *)(v4 + 144);
  v33 = *(_BYTE *)(v4 + 148);
  v34 = *(_WORD *)(v4 + 152);
  v35 = *(_BYTE *)(v4 + 154);
  if (HIBYTE(v34) == 1)
  {
    if ((v30 & 8) == 0 && ((v11 = v30 & 7, v11 == 2) || v11 == 4))
      v12 = WebCore::Position::offsetForPositionAfterAnchor((WebCore::Position *)&v28);
    else
      v12 = v29;
    v15 = v12 - *(_DWORD *)(*((_QWORD *)a3 + 2) + 40);
    v14 = v15 & ~(v15 >> 31);
  }
  else
  {
    v14 = -1;
  }
  WebCore::VisibleSelection::~VisibleSelection((WebCore::VisibleSelection *)&v16);
  return v14;
}

- (BOOL)spaceFollowsWordInRange:(id)a3
{
  BOOL result;
  const BoundaryPoint *v4;
  WebCore::VisiblePosition *v5;
  unsigned __int16 v6;
  int v7;
  BOOL v8;
  BOOL v9;
  uint64_t v10;
  WebCore::Node *v11;
  WebCore::Node *v12;
  WebCore::Node *v13;
  WebCore::Node *v14;
  char v15;
  WebCore::Node *v16;
  uint64_t v17;

  if (!a3)
    return 0;
  result = WebCore::makeSimpleRange();
  if (v15)
  {
    WebCore::makeDeprecatedLegacyPosition((WebCore *)&v14, v4);
    v5 = (WebCore::VisiblePosition *)WebCore::VisiblePosition::VisiblePosition();
    v6 = WebCore::VisiblePosition::characterAfter(v5);
    v7 = v6;
    if (v6 > 0xFFu)
    {
      v9 = MEMORY[0x1D82A9080]() == 9;
    }
    else
    {
      v8 = (v6 < 0x21u) & (0x100003600uLL >> v6);
      v9 = v7 == 11 || v8;
    }
    v10 = v17;
    v17 = 0;
    if (v10)
    {
      if (*(_DWORD *)(v10 + 24) == 2)
      {
        if ((*(_WORD *)(v10 + 30) & 0x400) == 0)
          WebCore::Node::removedLastRef((WebCore::Node *)v10);
      }
      else
      {
        *(_DWORD *)(v10 + 24) -= 2;
      }
    }
    v11 = v16;
    v16 = 0;
    if (v11)
    {
      if (*((_DWORD *)v11 + 6) == 2)
      {
        if ((*((_WORD *)v11 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v11);
      }
      else
      {
        *((_DWORD *)v11 + 6) -= 2;
      }
    }
    if (v15)
    {
      v12 = v14;
      v14 = 0;
      if (v12)
      {
        if (*((_DWORD *)v12 + 6) == 2)
        {
          if ((*((_WORD *)v12 + 15) & 0x400) == 0)
            WebCore::Node::removedLastRef(v12);
        }
        else
        {
          *((_DWORD *)v12 + 6) -= 2;
        }
      }
      if (v13)
      {
        if (*((_DWORD *)v13 + 6) != 2)
        {
          *((_DWORD *)v13 + 6) -= 2;
          return v9;
        }
        if ((*((_WORD *)v13 + 15) & 0x400) == 0)
        {
          WebCore::Node::removedLastRef(v13);
          return v9;
        }
      }
    }
    return v9;
  }
  __break(1u);
  return result;
}

- (id)wordsInCurrentParagraph
{
  if (self)
    self = (WebFrame *)self->_private->coreFrame.m_ptr;
  return (id)WebCore::LocalFrame::wordsInCurrentParagraph((WebCore::LocalFrame *)self);
}

- (BOOL)selectionAtDocumentStart
{
  LocalFrame *m_ptr;
  const VisiblePosition *v4;
  WebCore::Node *v5;
  WebCore::Node *v6;

  if (!self)
  {
    LOBYTE(m_ptr) = 0;
    return (char)m_ptr;
  }
  m_ptr = self->_private->coreFrame.m_ptr;
  if (!m_ptr)
    return (char)m_ptr;
  WebCore::Document::updateLayout();
  WebCore::VisiblePosition::VisiblePosition();
  LOBYTE(m_ptr) = WebCore::isStartOfDocument((WebCore *)&v6, v4);
  v5 = v6;
  v6 = 0;
  if (!v5)
    return (char)m_ptr;
  if (*((_DWORD *)v5 + 6) != 2)
  {
    *((_DWORD *)v5 + 6) -= 2;
    return (char)m_ptr;
  }
  if ((*((_WORD *)v5 + 15) & 0x400) != 0)
    return (char)m_ptr;
  WebCore::Node::removedLastRef(v5);
  return (char)m_ptr;
}

- (BOOL)selectionAtSentenceStart
{
  LocalFrame *m_ptr;

  if (self)
  {
    m_ptr = self->_private->coreFrame.m_ptr;
    if (*(_BYTE *)(*(_QWORD *)(*((_QWORD *)m_ptr + 37) + 3064) + 153))
    {
LABEL_3:
      WebCore::Document::updateLayout();
      return WebCore::FrameSelection::selectionAtSentenceStart(*(WebCore::FrameSelection **)(*((_QWORD *)m_ptr + 37)
                                                                                           + 3064));
    }
  }
  else
  {
    m_ptr = 0;
    if (*(_BYTE *)(*(_QWORD *)(MEMORY[0x128] + 3064) + 153))
      goto LABEL_3;
  }
  return 0;
}

- (BOOL)selectionAtWordStart
{
  LocalFrame *m_ptr;

  if (self)
  {
    m_ptr = self->_private->coreFrame.m_ptr;
    if (*(_BYTE *)(*(_QWORD *)(*((_QWORD *)m_ptr + 37) + 3064) + 153))
    {
LABEL_3:
      WebCore::Document::updateLayout();
      return WebCore::FrameSelection::selectionAtWordStart(*(WebCore::FrameSelection **)(*((_QWORD *)m_ptr + 37) + 3064));
    }
  }
  else
  {
    m_ptr = 0;
    if (*(_BYTE *)(*(_QWORD *)(MEMORY[0x128] + 3064) + 153))
      goto LABEL_3;
  }
  return 0;
}

- (id)rangeByMovingCurrentSelection:(int)a3
{
  DOMObjectInternal *v3;
  WebCore::Node *v5;
  WebCore::Node *v6;
  char v7;

  WebCore::FrameSelection::rangeByMovingCurrentSelection(*(WebCore::FrameSelection **)(*((_QWORD *)self->_private->coreFrame.m_ptr
                                                                                       + 37)
                                                                                     + 3064));
  v3 = kit();
  if (!v7)
    return v3;
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
  if (!v5)
    return v3;
  if (*((_DWORD *)v5 + 6) != 2)
  {
    *((_DWORD *)v5 + 6) -= 2;
    return v3;
  }
  if ((*((_WORD *)v5 + 15) & 0x400) != 0)
    return v3;
  WebCore::Node::removedLastRef(v5);
  return v3;
}

- (id)rangeByExtendingCurrentSelection:(int)a3
{
  DOMObjectInternal *v3;
  WebCore::Node *v5;
  WebCore::Node *v6;
  char v7;

  WebCore::FrameSelection::rangeByExtendingCurrentSelection(*(WebCore::FrameSelection **)(*((_QWORD *)self->_private->coreFrame.m_ptr
                                                                                          + 37)
                                                                                        + 3064));
  v3 = kit();
  if (!v7)
    return v3;
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
  if (!v5)
    return v3;
  if (*((_DWORD *)v5 + 6) != 2)
  {
    *((_DWORD *)v5 + 6) -= 2;
    return v3;
  }
  if ((*((_WORD *)v5 + 15) & 0x400) != 0)
    return v3;
  WebCore::Node::removedLastRef(v5);
  return v3;
}

- (void)selectNSRange:(_NSRange)a3 onElement:(id)a4
{
  WebCore::Node *v4;
  WebCore::Node *v5;
  WebCore::Node *v6;
  _BYTE v7[104];

  if (self && a4 && self->_private->coreFrame.m_ptr)
  {
    v4 = (WebCore::Node *)core((uint64_t)a4);
    *((_DWORD *)v4 + 6) += 4;
    WebCore::SimpleRange::SimpleRange();
    WebCore::VisibleSelection::VisibleSelection();
    WebCore::FrameSelection::setSelection();
    WebCore::VisibleSelection::~VisibleSelection((WebCore::VisibleSelection *)v7);
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
  }
}

- (id)markedTextDOMRange
{
  LocalFrame *m_ptr;
  WebCore::Editor *v3;
  DOMObjectInternal *v4;
  WebCore::Node *v6;
  WebCore::Node *v7;
  char v8;

  if (!self)
    return 0;
  m_ptr = self->_private->coreFrame.m_ptr;
  if (!m_ptr)
    return 0;
  v3 = (WebCore::Editor *)WebCore::Document::editor(*((WebCore::Document **)m_ptr + 37));
  WebCore::Editor::compositionRange(v3);
  v4 = kit();
  if (!v8)
    return v4;
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
  if (!v6)
    return v4;
  if (*((_DWORD *)v6 + 6) != 2)
  {
    *((_DWORD *)v6 + 6) -= 2;
    return v4;
  }
  if ((*((_WORD *)v6 + 15) & 0x400) != 0)
    return v4;
  WebCore::Node::removedLastRef(v6);
  return v4;
}

- (void)setMarkedText:(id)a3 selectedRange:(_NSRange)a4
{
  LocalFrame *m_ptr;
  uint64_t v6;
  StringImpl *v7;
  WTF::StringImpl *v8;
  uint64_t v9;
  void *v10;
  WTF *v11;
  WTF *v12;
  uint64_t v13;
  unsigned int *v14;
  unsigned int v15;
  unsigned int v16;
  WTF::StringImpl *v17;
  WTF *v18;
  uint64_t v19;

  if (self)
  {
    m_ptr = self->_private->coreFrame.m_ptr;
    if (m_ptr)
    {
      v18 = 0;
      v19 = 0;
      v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)m_ptr + 3) + 8) + 48) + 16);
      (*(void (**)(uint64_t, SEL))(*(_QWORD *)v6 + 688))(v6, a2);
      WebCore::Document::editor(*((WebCore::Document **)m_ptr + 37));
      MEMORY[0x1D82A3998](&v17, a3);
      WebCore::Editor::setComposition();
      v8 = v17;
      v17 = 0;
      if (v8)
      {
        if (*(_DWORD *)v8 == 2)
          WTF::StringImpl::destroy(v8, v7);
        else
          *(_DWORD *)v8 -= 2;
      }
      v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)m_ptr + 3) + 8) + 48) + 16);
      (*(void (**)(uint64_t))(*(_QWORD *)v9 + 696))(v9);
      v11 = v18;
      if (HIDWORD(v19))
      {
        v12 = (WTF *)((char *)v18 + 32 * HIDWORD(v19));
        do
        {
          v13 = *((_QWORD *)v11 + 2);
          if ((v13 & 0x8000000000000) != 0)
          {
            v14 = (unsigned int *)(v13 & 0xFFFFFFFFFFFFLL);
            do
            {
              v15 = __ldaxr(v14);
              v16 = v15 - 1;
            }
            while (__stlxr(v16, v14));
            if (!v16)
            {
              atomic_store(1u, v14);
              WTF::fastFree((WTF *)v14, v10);
            }
          }
          v11 = (WTF *)((char *)v11 + 32);
        }
        while (v11 != v12);
        v11 = v18;
      }
      if (v11)
      {
        v18 = 0;
        LODWORD(v19) = 0;
        WTF::fastFree(v11, v10);
      }
    }
  }
}

- (void)setMarkedText:(id)a3 forCandidates:(BOOL)a4
{
  LocalFrame *m_ptr;
  StringImpl *v6;
  WTF::StringImpl *v7;
  uint64_t v8;
  WTF *v9;
  WTF *v10;
  uint64_t v11;
  unsigned int *v12;
  unsigned int v13;
  unsigned int v14;
  WTF::StringImpl *v15;
  WTF *v16;
  uint64_t v17;

  if (!self)
    return;
  m_ptr = self->_private->coreFrame.m_ptr;
  if (!m_ptr)
    return;
  v16 = 0;
  v17 = 0;
  WebCore::Document::editor(*((WebCore::Document **)m_ptr + 37));
  MEMORY[0x1D82A3998](&v15, a3);
  objc_msgSend(a3, "length");
  WebCore::Editor::setComposition();
  v7 = v15;
  v15 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2)
    {
      WTF::StringImpl::destroy(v7, v6);
      v8 = HIDWORD(v17);
      v9 = v16;
      if (!HIDWORD(v17))
      {
LABEL_7:
        if (!v9)
          return;
        goto LABEL_8;
      }
      goto LABEL_11;
    }
    *(_DWORD *)v7 -= 2;
  }
  v8 = HIDWORD(v17);
  v9 = v16;
  if (!HIDWORD(v17))
    goto LABEL_7;
LABEL_11:
  v10 = (WTF *)((char *)v9 + 32 * v8);
  do
  {
    v11 = *((_QWORD *)v9 + 2);
    if ((v11 & 0x8000000000000) != 0)
    {
      v12 = (unsigned int *)(v11 & 0xFFFFFFFFFFFFLL);
      do
      {
        v13 = __ldaxr(v12);
        v14 = v13 - 1;
      }
      while (__stlxr(v14, v12));
      if (!v14)
      {
        atomic_store(1u, v12);
        WTF::fastFree((WTF *)v12, v6);
      }
    }
    v9 = (WTF *)((char *)v9 + 32);
  }
  while (v9 != v10);
  v9 = v16;
  if (v16)
  {
LABEL_8:
    v16 = 0;
    LODWORD(v17) = 0;
    WTF::fastFree(v9, v6);
  }
}

- (void)confirmMarkedText:(id)a3
{
  LocalFrame *m_ptr;
  WebCore::Editor *v5;
  uint64_t v6;
  WebCore::Editor *v7;
  WebCore::Editor *v8;
  StringImpl *v9;
  WTF::StringImpl *v10;
  uint64_t v11;
  WTF::StringImpl *v12;

  if (self)
  {
    m_ptr = self->_private->coreFrame.m_ptr;
    if (m_ptr)
    {
      v5 = (WebCore::Editor *)WebCore::Document::editor(*((WebCore::Document **)m_ptr + 37));
      if (WebCore::Editor::client(v5))
      {
        v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)m_ptr + 3) + 8) + 48) + 16);
        (*(void (**)(uint64_t))(*(_QWORD *)v6 + 688))(v6);
        v7 = (WebCore::Editor *)WebCore::Document::editor(*((WebCore::Document **)m_ptr + 37));
        v8 = v7;
        if (a3)
        {
          MEMORY[0x1D82A3998](&v12, a3);
          WebCore::Editor::confirmComposition(v8, (const WTF::String *)&v12);
          v10 = v12;
          v12 = 0;
          if (v10)
          {
            if (*(_DWORD *)v10 == 2)
              WTF::StringImpl::destroy(v10, v9);
            else
              *(_DWORD *)v10 -= 2;
          }
        }
        else
        {
          WebCore::Editor::confirmMarkedText(v7);
        }
        v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)m_ptr + 3) + 8) + 48) + 16);
        (*(void (**)(uint64_t))(*(_QWORD *)v11 + 696))(v11);
      }
    }
  }
}

- (void)setText:(id)a3 asChildOfElement:(id)a4
{
  LocalFrame *m_ptr;
  WebCore::Document *v6;
  StringImpl *v8;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;

  if (self)
  {
    if (a4)
    {
      m_ptr = self->_private->coreFrame.m_ptr;
      if (m_ptr)
      {
        v6 = (WebCore::Document *)*((_QWORD *)m_ptr + 37);
        if (v6)
        {
          WebCore::Document::editor(v6);
          MEMORY[0x1D82A3998](&v10, a3);
          core((uint64_t)a4);
          WebCore::Editor::setTextAsChildOfElement();
          v9 = v10;
          v10 = 0;
          if (v9)
          {
            if (*(_DWORD *)v9 == 2)
              WTF::StringImpl::destroy(v9, v8);
            else
              *(_DWORD *)v9 -= 2;
          }
        }
      }
    }
  }
}

- (void)setDictationPhrases:(id)a3 metadata:(id)a4 asChildOfElement:(id)a5
{
  LocalFrame *m_ptr;
  StringImpl *v8;
  WTF *v9;
  WTF *v10;
  uint64_t v11;
  WTF::StringImpl **v12;
  uint64_t v13;
  WTF::StringImpl *v14;
  WTF *v15;
  WTF *v16;
  int v17;
  unsigned int v18;

  if (self)
  {
    if (a5)
    {
      m_ptr = self->_private->coreFrame.m_ptr;
      if (m_ptr)
      {
        WebCore::Document::editor(*((WebCore::Document **)m_ptr + 37));
        vectorForDictationPhrasesArray((NSArray *)a3, (unsigned int *)&v16);
        core((uint64_t)a5);
        WebCore::Editor::setDictationPhrasesAsChildOfElement();
        v9 = v16;
        if (v18)
        {
          v10 = (WTF *)((char *)v16 + 16 * v18);
          do
          {
            v11 = *((unsigned int *)v9 + 3);
            if ((_DWORD)v11)
            {
              v12 = *(WTF::StringImpl ***)v9;
              v13 = 8 * v11;
              do
              {
                v14 = *v12;
                *v12 = 0;
                if (v14)
                {
                  if (*(_DWORD *)v14 == 2)
                    WTF::StringImpl::destroy(v14, v8);
                  else
                    *(_DWORD *)v14 -= 2;
                }
                ++v12;
                v13 -= 8;
              }
              while (v13);
            }
            v15 = *(WTF **)v9;
            if (*(_QWORD *)v9)
            {
              *(_QWORD *)v9 = 0;
              *((_DWORD *)v9 + 2) = 0;
              WTF::fastFree(v15, v8);
            }
            v9 = (WTF *)((char *)v9 + 16);
          }
          while (v9 != v10);
          v9 = v16;
        }
        if (v9)
        {
          v16 = 0;
          v17 = 0;
          WTF::fastFree(v9, v8);
        }
      }
    }
  }
}

- (id)interpretationsForCurrentRoot
{
  if (self)
    self = (WebFrame *)self->_private->coreFrame.m_ptr;
  return (id)WebCore::LocalFrame::interpretationsForCurrentRoot((WebCore::LocalFrame *)self);
}

- (void)getDictationResultRanges:(id *)a3 andMetadatas:(id *)a4
{
  void *v6;
  void *v7;
  WebCore::Document *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  DOMObjectInternal *v12;
  uint64_t AncestorSibling;
  uint64_t v14;
  WTF *v15;
  uint64_t v16;
  uint64_t v17;
  DOMObjectInternal *v18;
  unsigned int **v19;
  unsigned int **v20;
  unsigned int *v21;
  unsigned int v22;
  unsigned int v23;
  id *v24;
  WebCore::Document *v26;
  WebCore::Node *v27;
  WebCore::Node *v28;
  WTF *v29;
  unsigned int v30;

  if (!a3)
    return;
  *a3 = 0;
  if (!a4)
    return;
  *a4 = 0;
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (WebCore::Document *)*((_QWORD *)self->_private->coreFrame.m_ptr + 37);
  v9 = *((_QWORD *)v8 + 383);
  if (*(_BYTE *)(v9 + 153))
  {
    v10 = WebCore::VisibleSelection::rootEditableElement((WebCore::VisibleSelection *)(v9 + 56));
    if (v10)
      goto LABEL_5;
LABEL_51:
    *a3 = v6;
    *a4 = v7;
    return;
  }
  v10 = WebCore::Document::bodyOrFrameset(*((WebCore::Document **)self->_private->coreFrame.m_ptr + 37));
  if (!v10)
    goto LABEL_51;
LABEL_5:
  v24 = a4;
  v11 = 0;
  v12 = 0;
  v26 = v8;
  do
  {
    if (!*((_QWORD *)v8 + 187))
      WebCore::Document::ensureMarkers(v8);
    WebCore::DocumentMarkerController::markersFor();
    v15 = v29;
    if (v30)
    {
      v16 = 8 * v30;
      do
      {
        if (*(_QWORD *)v15)
        {
          v14 = *(_QWORD *)(*(_QWORD *)v15 + 8);
          if (*(_DWORD *)(v14 + 8) == 4096)
          {
            if (*(_DWORD *)(v14 + 96) != 3)
            {
              std::__throw_bad_variant_access[abi:sn180100]();
              __break(1u);
              return;
            }
            v17 = *(_QWORD *)(v14 + 32);
            if (v17)
            {
              WebCore::makeSimpleRange();
              v18 = kit();
              if (v28)
              {
                if (*((_DWORD *)v28 + 6) == 2)
                {
                  if ((*((_WORD *)v28 + 15) & 0x400) == 0)
                    WebCore::Node::removedLastRef(v28);
                }
                else
                {
                  *((_DWORD *)v28 + 6) -= 2;
                }
              }
              if (v27)
              {
                if (*((_DWORD *)v27 + 6) == 2)
                {
                  if ((*((_WORD *)v27 + 15) & 0x400) == 0)
                    WebCore::Node::removedLastRef(v27);
                }
                else
                {
                  *((_DWORD *)v27 + 6) -= 2;
                }
              }
              v28 = 0;
              v27 = 0;
              if (v17 == v11)
              {
                objc_msgSend(v6, "removeLastObject");
                -[DOMObjectInternal setEnd:offset:](v12, "setEnd:offset:", -[DOMObjectInternal startContainer](v18, "startContainer"), -[DOMObjectInternal startOffset](v18, "startOffset"));
                objc_msgSend(v6, "addObject:", v12);
              }
              else
              {
                objc_msgSend(v7, "addObject:", v17);
                objc_msgSend(v6, "addObject:", v18);
                if (v18)
                  CFRetain(v18);
                if (v12)
                  CFRelease(v12);
                v12 = v18;
                v11 = v17;
              }
            }
          }
        }
        v15 = (WTF *)((char *)v15 + 8);
        v16 -= 8;
      }
      while (v16);
      v19 = (unsigned int **)v29;
      v20 = (unsigned int **)((char *)v29 + 8 * v30);
      do
      {
        while (1)
        {
          v21 = *v19;
          *v19 = 0;
          if (v21)
          {
            do
            {
              v22 = __ldaxr(v21);
              v23 = v22 - 1;
            }
            while (__stlxr(v23, v21));
            if (!v23)
              break;
          }
          if (++v19 == v20)
            goto LABEL_42;
        }
        atomic_store(1u, v21);
        WTF::fastFree((WTF *)v21, (void *)v14);
        ++v19;
      }
      while (v19 != v20);
LABEL_42:
      v15 = v29;
      v8 = v26;
    }
    if (v15)
    {
      v29 = 0;
      WTF::fastFree(v15, (void *)v14);
    }
    if ((*(_WORD *)(v10 + 28) & 4) == 0 || (AncestorSibling = *(_QWORD *)(v10 + 80)) == 0)
    {
      AncestorSibling = *(_QWORD *)(v10 + 56);
      if (!AncestorSibling)
        AncestorSibling = WebCore::NodeTraversal::nextAncestorSibling((WebCore::NodeTraversal *)v10, (const Node *)v14);
    }
    v10 = AncestorSibling;
  }
  while (AncestorSibling);
  *a3 = v6;
  *v24 = v7;
  if (v12)
    CFRelease(v12);
}

- (id)dictationResultMetadataForRange:(id)a3
{
  id v3;
  WebCore::Document *v4;
  void *v5;
  WTF *v6;
  uint64_t v7;
  WTF *v8;
  unsigned int *v9;
  unsigned int v10;
  unsigned int v11;
  id result;
  WebCore::Node *v13;
  WebCore::Node *v14;
  WTF *v15;
  unsigned int v16;

  v3 = a3;
  if (!a3)
    return v3;
  v4 = (WebCore::Document *)*((_QWORD *)self->_private->coreFrame.m_ptr + 37);
  if (!*((_QWORD *)v4 + 187))
    WebCore::Document::ensureMarkers(v4);
  WebCore::makeSimpleRange();
  WebCore::DocumentMarkerController::markersInRange();
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
  if (v13)
  {
    if (*((_DWORD *)v13 + 6) == 2)
    {
      if ((*((_WORD *)v13 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v13);
    }
    else
    {
      *((_DWORD *)v13 + 6) -= 2;
    }
  }
  v6 = v15;
  if (!v16)
  {
    v3 = 0;
    if (!v15)
      return v3;
    goto LABEL_24;
  }
  v7 = *(_QWORD *)(*(_QWORD *)v15 + 8);
  if (*(_DWORD *)(v7 + 96) == 3)
  {
    v3 = *(id *)(v7 + 32);
    v8 = (WTF *)((char *)v15 + 8 * v16);
    do
    {
      while (1)
      {
        v9 = *(unsigned int **)v6;
        *(_QWORD *)v6 = 0;
        if (v9)
        {
          do
          {
            v10 = __ldaxr(v9);
            v11 = v10 - 1;
          }
          while (__stlxr(v11, v9));
          if (!v11)
            break;
        }
        v6 = (WTF *)((char *)v6 + 8);
        if (v6 == v8)
          goto LABEL_23;
      }
      atomic_store(1u, v9);
      WTF::fastFree((WTF *)v9, v5);
      v6 = (WTF *)((char *)v6 + 8);
    }
    while (v6 != v8);
LABEL_23:
    v6 = v15;
    if (!v15)
      return v3;
LABEL_24:
    WTF::fastFree(v6, v5);
    return v3;
  }
  result = (id)std::__throw_bad_variant_access[abi:sn180100]();
  __break(1u);
  return result;
}

- (void)recursiveSetUpdateAppearanceEnabled:(BOOL)a3
{
  LocalFrame *m_ptr;

  if (self)
  {
    m_ptr = self->_private->coreFrame.m_ptr;
    if (m_ptr)
      WebCore::LocalFrame::recursiveSetUpdateAppearanceEnabled((WebCore::LocalFrame *)m_ptr);
  }
}

+ (id)stringWithData:(id)a3 textEncodingName:(id)a4
{
  StringImpl *v5;
  WTF::StringImpl *v6;
  uint64_t v7;
  __int16 v8;
  StringImpl *v9;
  void *v10;
  WTF::StringImpl *v11;
  WTF::StringImpl *v13;
  _BYTE v14[8];
  __int128 v15;
  __int16 v16;
  char v17;

  MEMORY[0x1D82A3998](&v13, a4);
  PAL::TextEncoding::TextEncoding((PAL::TextEncoding *)v14, (const WTF::String *)&v13);
  v6 = v13;
  v13 = 0;
  if (!v6)
  {
LABEL_4:
    if (*((_QWORD *)&v15 + 1))
      goto LABEL_5;
    goto LABEL_8;
  }
  if (*(_DWORD *)v6 != 2)
  {
    *(_DWORD *)v6 -= 2;
    goto LABEL_4;
  }
  v6 = (WTF::StringImpl *)WTF::StringImpl::destroy(v6, v5);
  if (*((_QWORD *)&v15 + 1))
  {
LABEL_5:
    if (!a3)
      goto LABEL_9;
    goto LABEL_6;
  }
LABEL_8:
  v7 = PAL::WindowsLatin1Encoding(v6);
  v8 = *(_WORD *)(v7 + 24);
  v15 = *(_OWORD *)(v7 + 8);
  v16 = v8;
  if (a3)
  {
LABEL_6:
    objc_msgSend(a3, "bytes", v13);
    objc_msgSend(a3, "length");
  }
LABEL_9:
  v17 = 0;
  PAL::TextEncoding::decode();
  if (!v13)
    return &stru_1E9D6EC48;
  v10 = (void *)WTF::StringImpl::operator NSString *();
  v11 = v13;
  v13 = 0;
  if (!v11)
    return v10;
  if (*(_DWORD *)v11 != 2)
  {
    *(_DWORD *)v11 -= 2;
    return v10;
  }
  WTF::StringImpl::destroy(v11, v9);
  return v10;
}

- (CGRect)caretRectAtNode:(id)a3 offset:(int)a4 affinity:(unint64_t)a5
{
  WebCore::Node *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  WebCore::Node *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  WebCore::Node *v21;
  WebCore::Node *v22;
  CGRect result;

  if (a3)
  {
    v7 = (WebCore::Node *)*((_QWORD *)a3 + 2);
    if (v7)
      *((_DWORD *)v7 + 6) += 2;
  }
  else
  {
    v7 = 0;
  }
  v21 = v7;
  WebCore::Position::Position();
  -[WebFrame _caretRectAtPosition:affinity:](self, "_caretRectAtPosition:affinity:", &v22, a5);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = v22;
  v22 = 0;
  if (v16)
  {
    if (*((_DWORD *)v16 + 6) == 2)
    {
      if ((*((_WORD *)v16 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v16);
    }
    else
    {
      *((_DWORD *)v16 + 6) -= 2;
    }
  }
  if (v21)
  {
    if (*((_DWORD *)v21 + 6) == 2)
    {
      if ((*((_WORD *)v21 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v21);
    }
    else
    {
      *((_DWORD *)v21 + 6) -= 2;
    }
  }
  v17 = v9;
  v18 = v11;
  v19 = v13;
  v20 = v15;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (__CTFont)fontForSelection:(BOOL *)a3
{
  LocalFrame *m_ptr;
  WebCore::Editor *v5;
  __CTFont *v6;
  WTF *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;

  v11 = 0;
  m_ptr = self->_private->coreFrame.m_ptr;
  if (m_ptr)
  {
    v5 = (WebCore::Editor *)WebCore::Document::editor(*((WebCore::Document **)m_ptr + 37));
    WebCore::Editor::fontForSelection(v5, &v11);
    if (v10)
    {
      v6 = *(__CTFont **)(v10 + 88);
      if (*(_DWORD *)v10 == 1)
      {
        v8 = (WTF *)MEMORY[0x1D82A62D8]();
        WTF::fastFree(v8, v9);
        if (!a3)
          return v6;
      }
      else
      {
        --*(_DWORD *)v10;
        if (!a3)
          return v6;
      }
      goto LABEL_7;
    }
  }
  v6 = 0;
  if (a3)
LABEL_7:
    *a3 = v11;
  return v6;
}

- (void)sendScrollEvent
{
  WebCore::EventHandler::scheduleScrollEvent(*((WebCore::EventHandler **)self->_private->coreFrame.m_ptr + 80));
}

- (void)_userScrolled
{
  WebCore::LocalFrameView *v2;

  v2 = (WebCore::LocalFrameView *)*((_QWORD *)self->_private->coreFrame.m_ptr + 36);
  if (v2)
    WebCore::LocalFrameView::setWasScrolledByUser(v2);
}

- (void)_replaceSelectionWithText:(id)a3 selectReplacement:(BOOL)a4 smartReplace:(BOOL)a5 matchStyle:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  _BOOL8 v8;
  const WTF::String *v11;
  StringImpl *v12;
  WebCore::Node *v13;
  WebCore::Node *v14;
  WTF::StringImpl *v15;
  WebCore::Node *v16;
  WebCore::Node *v17;
  WTF::StringImpl *v18;
  WebCore::Node *v19;
  WebCore::Node *v20;
  WebCore::Node *v21;
  char v22;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  WebCore::VisibleSelection::toNormalizedRange((WebCore::VisibleSelection *)(*(_QWORD *)(*((_QWORD *)self->_private->coreFrame.m_ptr
                                                                                         + 37)
                                                                                       + 3064)
                                                                           + 56));
  if (v22)
  {
    MEMORY[0x1D82A3998](&v18, a3);
    WebCore::createFragmentFromText((WebCore *)&v20, (const WebCore::SimpleRange *)&v18, v11);
    v13 = kit(v19);
    v14 = v19;
    v19 = 0;
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
    v15 = v18;
    v18 = 0;
    if (v15)
    {
      if (*(_DWORD *)v15 == 2)
        WTF::StringImpl::destroy(v15, v12);
      else
        *(_DWORD *)v15 -= 2;
    }
  }
  else
  {
    v13 = 0;
  }
  -[WebFrame _replaceSelectionWithFragment:selectReplacement:smartReplace:matchStyle:](self, "_replaceSelectionWithFragment:selectReplacement:smartReplace:matchStyle:", v13, v8, v7, v6);
  if (v22)
  {
    v16 = v21;
    v21 = 0;
    if (v16)
    {
      if (*((_DWORD *)v16 + 6) == 2)
      {
        if ((*((_WORD *)v16 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v16);
      }
      else
      {
        *((_DWORD *)v16 + 6) -= 2;
      }
    }
    v17 = v20;
    v20 = 0;
    if (v17)
    {
      if (*((_DWORD *)v17 + 6) == 2)
      {
        if ((*((_WORD *)v17 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v17);
      }
      else
      {
        *((_DWORD *)v17 + 6) -= 2;
      }
    }
  }
}

- (void)_replaceSelectionWithWebArchive:(id)a3 selectReplacement:(BOOL)a4 smartReplace:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v5 = a5;
  v6 = a4;
  v20 = *MEMORY[0x1E0C80C00];
  v9 = (void *)objc_msgSend(a3, "subresources");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        while (1)
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v13);
          if (!-[WebDataSource subresourceForURL:](-[WebFrame dataSource](self, "dataSource"), "subresourceForURL:", objc_msgSend(v14, "URL")))break;
          if (v11 == ++v13)
            goto LABEL_3;
        }
        -[WebDataSource addSubresource:](-[WebFrame dataSource](self, "dataSource"), "addSubresource:", v14);
        ++v13;
      }
      while (v11 != v13);
LABEL_3:
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }
  -[WebFrame _replaceSelectionWithFragment:selectReplacement:smartReplace:matchStyle:](self, "_replaceSelectionWithFragment:selectReplacement:smartReplace:matchStyle:", -[WebDataSource _documentFragmentWithArchive:](-[WebFrame dataSource](self, "dataSource"), "_documentFragmentWithArchive:", a3), v6, v5, 0);
}

- (void)resetTextAutosizingBeforeLayout
{
  id v3;
  WebFramePrivate *v4;
  const WebCore::Frame *m_ptr;
  uint64_t v6;
  uint64_t v7;
  WebCore::RenderElement *v8;

  v3 = -[WebFrame _webHTMLDocumentView](self, "_webHTMLDocumentView");
  if (self)
  {
    if (v3)
    {
      v4 = self->_private;
      m_ptr = (const WebCore::Frame *)v4->coreFrame.m_ptr;
      if (m_ptr)
      {
        v6 = (uint64_t)v4->coreFrame.m_ptr;
        do
        {
          if (!*(_BYTE *)(v6 + 144))
          {
            v7 = *(_QWORD *)(v6 + 296);
            if (v7)
            {
              v8 = *(WebCore::RenderElement **)(v7 + 1944);
              if (v8)
                WebCore::RenderElement::resetTextAutosizing(v8);
            }
          }
          v6 = WebCore::FrameTree::traverseNext((WebCore::FrameTree *)(v6 + 48), m_ptr);
        }
        while (v6);
      }
    }
  }
}

- (void)_setTextAutosizingWidth:(double)a3
{
  uint64_t v3;
  uint64_t v4;
  float v5;

  v3 = *((_QWORD *)self->_private->coreFrame.m_ptr + 3);
  if (v3)
  {
    v4 = *(_QWORD *)(v3 + 8);
    if (v4)
    {
      v5 = a3;
      *(float *)(v4 + 456) = v5;
    }
  }
}

- (void)_createCaptionPreferencesTestingModeToken
{
  uint64_t v2;
  WebCore::Page *v4;
  WebCore::PageGroup *v5;
  WebCore::CaptionUserPreferences *v6;
  void *v7;
  WebFramePrivate *v8;
  WTF *value;
  uint64_t v10;
  uint64_t v11;
  int v12;
  unsigned int v13;
  unsigned int v14;
  WTF *v15;
  WTF *v16;

  v2 = *((_QWORD *)self->_private->coreFrame.m_ptr + 3);
  if (v2)
  {
    v4 = *(WebCore::Page **)(v2 + 8);
    if (v4)
    {
      v5 = (WebCore::PageGroup *)WebCore::Page::group(v4);
      v6 = (WebCore::CaptionUserPreferences *)WebCore::PageGroup::ensureCaptionPreferences(v5);
      WebCore::CaptionUserPreferences::createTestingModeToken(v6);
      v8 = self->_private;
      value = (WTF *)v8->captionPreferencesTestingModeToken.__ptr_.__value_;
      v8->captionPreferencesTestingModeToken.__ptr_.__value_ = (CaptionUserPreferencesTestingModeToken *)v16;
      if (value)
      {
        v10 = *(_QWORD *)value;
        if (*(_QWORD *)value)
        {
          v11 = *(_QWORD *)(v10 + 8);
          if (v11)
          {
            v12 = *(_DWORD *)(v11 + 136);
            if (v12)
              *(_DWORD *)(v11 + 136) = v12 - 1;
          }
          *(_QWORD *)value = 0;
          do
          {
            v13 = __ldaxr((unsigned int *)v10);
            v14 = v13 - 1;
          }
          while (__stlxr(v14, (unsigned int *)v10));
          if (!v14)
          {
            atomic_store(1u, (unsigned int *)v10);
            v15 = value;
            WTF::fastFree((WTF *)v10, v7);
            value = v15;
          }
        }
        else
        {
          *(_QWORD *)value = 0;
        }
        WTF::fastFree(value, v7);
      }
    }
  }
}

- (void)_setCaptionDisplayMode:(id)a3
{
  uint64_t v3;
  WebCore::Page *v4;
  WebCore::PageGroup *v6;
  uint64_t v7;
  StringImpl *v8;
  WTF::StringImpl *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  WTF::StringImpl *v17;

  v3 = *((_QWORD *)self->_private->coreFrame.m_ptr + 3);
  if (!v3)
    return;
  v4 = *(WebCore::Page **)(v3 + 8);
  if (!v4)
    return;
  v6 = (WebCore::PageGroup *)WebCore::Page::group(v4);
  v7 = WebCore::PageGroup::ensureCaptionPreferences(v6);
  MEMORY[0x1D82A3998](&v17, a3);
  v9 = v17;
  if (!v17)
    return;
  v10 = 0;
  v11 = 1;
  switch(*((_DWORD *)v17 + 1))
  {
    case 6:
      v12 = *((_QWORD *)v17 + 1);
      if ((*((_BYTE *)v17 + 16) & 4) == 0)
      {
        if ((*(_WORD *)v12 & 0xFFDF) != 0x4D
          || (*(_WORD *)(v12 + 2) & 0xFFDF) != 0x41
          || (*(_WORD *)(v12 + 4) & 0xFFDF) != 0x4E
          || (*(_WORD *)(v12 + 6) & 0xFFDF) != 0x55
          || (*(_WORD *)(v12 + 8) & 0xFFDF) != 0x41
          || (*(_WORD *)(v12 + 10) & 0xFFDF) != 0x4C)
        {
          goto LABEL_82;
        }
LABEL_51:
        v10 = 3;
        goto LABEL_71;
      }
      if ((*(_BYTE *)v12 & 0xDF) == 0x4D
        && (*(_BYTE *)(v12 + 1) & 0xDF) == 0x41
        && (*(_BYTE *)(v12 + 2) & 0xDF) == 0x4E
        && (*(_BYTE *)(v12 + 3) & 0xDF) == 0x55
        && (*(_BYTE *)(v12 + 4) & 0xDF) == 0x41
        && (*(_BYTE *)(v12 + 5) & 0xDF) == 0x4C)
      {
        goto LABEL_51;
      }
      goto LABEL_82;
    case 8:
      v13 = *((_QWORD *)v17 + 1);
      if ((*((_BYTE *)v17 + 16) & 4) == 0)
      {
        if ((*(_WORD *)v13 & 0xFFDF) != 0x41
          || (*(_WORD *)(v13 + 2) & 0xFFDF) != 0x4C
          || (*(_WORD *)(v13 + 4) & 0xFFDF) != 0x57
          || (*(_WORD *)(v13 + 6) & 0xFFDF) != 0x41
          || (*(_WORD *)(v13 + 8) & 0xFFDF) != 0x59
          || (*(_WORD *)(v13 + 10) & 0xFFDF) != 0x53
          || (*(_WORD *)(v13 + 12) & 0xFFDF) != 0x4F
          || (*(_WORD *)(v13 + 14) & 0xFFDF) != 0x4E)
        {
          goto LABEL_82;
        }
LABEL_60:
        v10 = 2;
        goto LABEL_71;
      }
      if ((*(_BYTE *)v13 & 0xDF) == 0x41
        && (*(_BYTE *)(v13 + 1) & 0xDF) == 0x4C
        && (*(_BYTE *)(v13 + 2) & 0xDF) == 0x57
        && (*(_BYTE *)(v13 + 3) & 0xDF) == 0x41
        && (*(_BYTE *)(v13 + 4) & 0xDF) == 0x59
        && (*(_BYTE *)(v13 + 5) & 0xDF) == 0x53
        && (*(_BYTE *)(v13 + 6) & 0xDF) == 0x4F
        && (*(_BYTE *)(v13 + 7) & 0xDF) == 0x4E)
      {
        goto LABEL_60;
      }
      goto LABEL_82;
    case 9:
      v14 = *((_QWORD *)v17 + 1);
      if ((*((_BYTE *)v17 + 16) & 4) != 0)
      {
        if ((*(_BYTE *)v14 & 0xDF) != 0x41
          || (*(_BYTE *)(v14 + 1) & 0xDF) != 0x55
          || (*(_BYTE *)(v14 + 2) & 0xDF) != 0x54
          || (*(_BYTE *)(v14 + 3) & 0xDF) != 0x4F
          || (*(_BYTE *)(v14 + 4) & 0xDF) != 0x4D
          || (*(_BYTE *)(v14 + 5) & 0xDF) != 0x41
          || (*(_BYTE *)(v14 + 6) & 0xDF) != 0x54
          || (*(_BYTE *)(v14 + 7) & 0xDF) != 0x49)
        {
          goto LABEL_82;
        }
        v10 = 0;
        v15 = *(unsigned __int8 *)(v14 + 8);
      }
      else
      {
        if ((*(_WORD *)v14 & 0xFFDF) != 0x41
          || (*(_WORD *)(v14 + 2) & 0xFFDF) != 0x55
          || (*(_WORD *)(v14 + 4) & 0xFFDF) != 0x54
          || (*(_WORD *)(v14 + 6) & 0xFFDF) != 0x4F
          || (*(_WORD *)(v14 + 8) & 0xFFDF) != 0x4D
          || (*(_WORD *)(v14 + 10) & 0xFFDF) != 0x41
          || (*(_WORD *)(v14 + 12) & 0xFFDF) != 0x54
          || (*(_WORD *)(v14 + 14) & 0xFFDF) != 0x49)
        {
          goto LABEL_82;
        }
        v10 = 0;
        v15 = *(unsigned __int16 *)(v14 + 16);
      }
      if ((v15 & 0xFFFFFFDF) != 0x43)
        goto LABEL_83;
      goto LABEL_71;
    case 0xA:
      v16 = *((_QWORD *)v17 + 1);
      if ((*((_BYTE *)v17 + 16) & 4) == 0)
      {
        if ((*(_WORD *)v16 & 0xFFDF) != 0x46)
          goto LABEL_82;
        if ((*(_WORD *)(v16 + 2) & 0xFFDF) != 0x4F)
          goto LABEL_82;
        if ((*(_WORD *)(v16 + 4) & 0xFFDF) != 0x52)
          goto LABEL_82;
        if ((*(_WORD *)(v16 + 6) & 0xFFDF) != 0x43)
          goto LABEL_82;
        if ((*(_WORD *)(v16 + 8) & 0xFFDF) != 0x45)
          goto LABEL_82;
        if ((*(_WORD *)(v16 + 10) & 0xFFDF) != 0x44)
          goto LABEL_82;
        if ((*(_WORD *)(v16 + 12) & 0xFFDF) != 0x4F)
          goto LABEL_82;
        if ((*(_WORD *)(v16 + 14) & 0xFFDF) != 0x4E)
          goto LABEL_82;
        if ((*(_WORD *)(v16 + 16) & 0xFFDF) != 0x4C)
          goto LABEL_82;
        v10 = 1;
        if ((*(_WORD *)(v16 + 18) & 0xFFDF) != 0x59)
          goto LABEL_82;
LABEL_71:
        v11 = 0;
        goto LABEL_83;
      }
      if ((*(_BYTE *)v16 & 0xDF) == 0x46
        && (*(_BYTE *)(v16 + 1) & 0xDF) == 0x4F
        && (*(_BYTE *)(v16 + 2) & 0xDF) == 0x52
        && (*(_BYTE *)(v16 + 3) & 0xDF) == 0x43
        && (*(_BYTE *)(v16 + 4) & 0xDF) == 0x45
        && (*(_BYTE *)(v16 + 5) & 0xDF) == 0x44
        && (*(_BYTE *)(v16 + 6) & 0xDF) == 0x4F
        && (*(_BYTE *)(v16 + 7) & 0xDF) == 0x4E
        && (*(_BYTE *)(v16 + 8) & 0xDF) == 0x4C)
      {
        v10 = 1;
        if ((*(_BYTE *)(v16 + 9) & 0xDF) == 0x59)
          goto LABEL_71;
      }
LABEL_82:
      v10 = 0;
LABEL_83:
      v17 = 0;
      if (*(_DWORD *)v9 == 2)
      {
        WTF::StringImpl::destroy(v9, v8);
        if ((v11 & 1) != 0)
          return;
      }
      else
      {
        *(_DWORD *)v9 -= 2;
        if ((v11 & 1) != 0)
          return;
      }
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v7 + 24))(v7, v10);
      return;
    default:
      goto LABEL_83;
  }
}

- (void)_replaceSelectionWithFragment:(id)a3 selectReplacement:(BOOL)a4 smartReplace:(BOOL)a5 matchStyle:(BOOL)a6
{
  WebCore::Document *v6;

  if (a3)
  {
    v6 = (WebCore::Document *)*((_QWORD *)self->_private->coreFrame.m_ptr + 37);
    if (*(_BYTE *)(*((_QWORD *)v6 + 383) + 153))
    {
      WebCore::Document::editor(v6);
      WebCore::Editor::replaceSelectionWithFragment();
    }
  }
}

- (void)removeUnchangeableStyles
{
  WebCore::Editor *v2;

  v2 = (WebCore::Editor *)WebCore::Document::editor(*((WebCore::Document **)self->_private->coreFrame.m_ptr + 37));
  WebCore::Editor::removeUnchangeableStyles(v2);
}

- (BOOL)hasRichlyEditableSelection
{
  return WebCore::VisibleSelection::isContentRichlyEditable((WebCore::VisibleSelection *)(*(_QWORD *)(*((_QWORD *)self->_private->coreFrame.m_ptr + 37) + 3064)
                                                                                        + 56));
}

- (void)_replaceSelectionWithText:(id)a3 selectReplacement:(BOOL)a4 smartReplace:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  const WTF::String *v9;
  StringImpl *v10;
  WebCore::Node *v11;
  WebCore::Node *v12;
  WTF::StringImpl *v13;
  WebCore::Node *v14;
  WebCore::Node *v15;
  WTF::StringImpl *v16;
  WebCore::Node *v17;
  WebCore::Node *v18;
  WebCore::Node *v19;
  char v20;

  v5 = a5;
  v6 = a4;
  WebCore::VisibleSelection::toNormalizedRange((WebCore::VisibleSelection *)(*(_QWORD *)(*((_QWORD *)self->_private->coreFrame.m_ptr
                                                                                         + 37)
                                                                                       + 3064)
                                                                           + 56));
  if (v20)
  {
    MEMORY[0x1D82A3998](&v16, a3);
    WebCore::createFragmentFromText((WebCore *)&v18, (const WebCore::SimpleRange *)&v16, v9);
    v11 = kit(v17);
    v12 = v17;
    v17 = 0;
    if (v12)
    {
      if (*((_DWORD *)v12 + 6) == 2)
      {
        if ((*((_WORD *)v12 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v12);
      }
      else
      {
        *((_DWORD *)v12 + 6) -= 2;
      }
    }
    v13 = v16;
    v16 = 0;
    if (v13)
    {
      if (*(_DWORD *)v13 == 2)
        WTF::StringImpl::destroy(v13, v10);
      else
        *(_DWORD *)v13 -= 2;
    }
  }
  else
  {
    v11 = 0;
  }
  -[WebFrame _replaceSelectionWithFragment:selectReplacement:smartReplace:matchStyle:](self, "_replaceSelectionWithFragment:selectReplacement:smartReplace:matchStyle:", v11, v6, v5, 1);
  if (v20)
  {
    v14 = v19;
    v19 = 0;
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
    v15 = v18;
    v18 = 0;
    if (v15)
    {
      if (*((_DWORD *)v15 + 6) == 2)
      {
        if ((*((_WORD *)v15 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v15);
      }
      else
      {
        *((_DWORD *)v15 + 6) -= 2;
      }
    }
  }
}

- (void)_replaceSelectionWithMarkupString:(id)a3 baseURLString:(id)a4 selectReplacement:(BOOL)a5 smartReplace:(BOOL)a6
{
  -[WebFrame _replaceSelectionWithFragment:selectReplacement:smartReplace:matchStyle:](self, "_replaceSelectionWithFragment:selectReplacement:smartReplace:matchStyle:", -[WebFrame _documentFragmentWithMarkupString:baseURLString:](self, "_documentFragmentWithMarkupString:baseURLString:", a3, a4), a5, a6, 0);
}

- (id)_cacheabilityDictionary
{
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  WebCore::ThreadGlobalData *v9;
  Document *v10;
  WebCore::DatabaseManager *v11;

  v3 = (_QWORD *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = v3;
  v5 = *((_QWORD *)self->_private->coreFrame.m_ptr + 35);
  v6 = *(_QWORD *)(v5 + 88);
  if (v6 && *(_BYTE *)(v6 + 1588))
    v3 = (_QWORD *)objc_msgSend(v3, "setObject:forKey:", MEMORY[0x1D82A7BC8](v6 + 1528), WebFrameMainDocumentError);
  if (**(_BYTE **)(v5 + 56))
    v3 = (_QWORD *)objc_msgSend(v4, "setObject:forKey:", MEMORY[0x1E0C9AAB0], WebFrameHasPlugins);
  v7 = *(_QWORD *)(*((_QWORD *)self->_private->coreFrame.m_ptr + 37) + 696);
  if (v7)
  {
    v8 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 736);
    if (v8 && (v9 = *(WebCore::ThreadGlobalData **)(v8 + 96)) != 0)
    {
      if (*((_QWORD *)v9 + 5))
        goto LABEL_10;
    }
    else
    {
      v3 = (_QWORD *)WebCore::threadGlobalDataSlow((WebCore *)v3);
      v9 = (WebCore::ThreadGlobalData *)v3;
      if (v3[5])
      {
LABEL_10:
        if ((*(_QWORD *)(v7 + 16) & 0x1000000000000) == 0)
          goto LABEL_13;
        goto LABEL_11;
      }
    }
    v3 = (_QWORD *)WebCore::ThreadGlobalData::initializeEventNames(v9);
    if ((*(_QWORD *)(v7 + 16) & 0x1000000000000) == 0)
      goto LABEL_13;
LABEL_11:
    v3 = (_QWORD *)WebCore::EventListenerMap::find();
    if (v3)
      v3 = (_QWORD *)objc_msgSend(v4, "setObject:forKey:", MEMORY[0x1E0C9AAB0], WebFrameHasUnloadListener);
  }
LABEL_13:
  v10 = (Document *)*((_QWORD *)self->_private->coreFrame.m_ptr + 37);
  if (v10)
  {
    v11 = (WebCore::DatabaseManager *)WebCore::DatabaseManager::singleton((WebCore::DatabaseManager *)v3);
    if (WebCore::DatabaseManager::hasOpenDatabases(v11, v10))
      objc_msgSend(v4, "setObject:forKey:", MEMORY[0x1E0C9AAB0], WebFrameUsesDatabases);
  }
  return v4;
}

- (BOOL)_allowsFollowingLink:(id)a3
{
  LocalFrame *m_ptr;
  WebCore::OriginAccessPatternsForWebProcess *v5;
  StringImpl *v6;
  char canDisplay;
  WTF::StringImpl *v8;
  WTF::StringImpl *v10;

  m_ptr = self->_private->coreFrame.m_ptr;
  if (!m_ptr)
    return 1;
  WebCore::SecurityContext::securityOrigin((WebCore::SecurityContext *)(*((_QWORD *)m_ptr + 37) + 192));
  v5 = (WebCore::OriginAccessPatternsForWebProcess *)MEMORY[0x1D82A38F0](&v10, a3);
  WebCore::OriginAccessPatternsForWebProcess::singleton(v5);
  canDisplay = WebCore::SecurityOrigin::canDisplay();
  v8 = v10;
  v10 = 0;
  if (!v8)
    return canDisplay;
  if (*(_DWORD *)v8 != 2)
  {
    *(_DWORD *)v8 -= 2;
    return canDisplay;
  }
  WTF::StringImpl::destroy(v8, v6);
  return canDisplay;
}

- (id)_stringByEvaluatingJavaScriptFromString:(id)a3 withGlobalObject:(OpaqueJSValue *)a4 inScriptWorld:(id)a5
{
  const __CFString *v5;
  WebCore::ScriptController *v9;
  WebCore::DOMWrapperWorld *v10;
  WebCore::JSDOMWindowBase *v11;
  uint64_t v12;
  _BOOL4 v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  char v21;
  WebCore::ScriptController *v22;
  WebCore::DOMWrapperWorld *v23;
  StringImpl *v24;
  unint64_t v25;
  WTF::StringImpl *v26;
  WTF::StringImpl *v27;
  StringImpl *v28;
  WTF::StringImpl *v30;
  WTF::StringImpl *v31[2];

  v5 = &stru_1E9D6EC48;
  if (!a3 || !a5)
    return (id)v5;
  v9 = (WebCore::ScriptController *)*((_QWORD *)self->_private->coreFrame.m_ptr + 38);
  v10 = (WebCore::DOMWrapperWorld *)WebCore::mainThreadNormalWorld((WebCore *)self);
  v11 = *(WebCore::JSDOMWindowBase **)(WebCore::ScriptController::jsWindowProxy(v9, v10) + 16);
  if (!strcmp(*(const char **)(16 * *(unsigned int *)(16 * (*(_DWORD *)a4 & 0xFFFFFFFE) + 0x4C)), "JSWindowProxy"))
  {
    v11 = (WebCore::JSDOMWindowBase *)*((_QWORD *)a4 + 2);
    v12 = *(unsigned int *)(16 * (*(_DWORD *)v11 & 0xFFFFFFFE) + 0x4C);
    v13 = *(_DWORD *)(16 * (*(_DWORD *)v11 & 0xFFFFFFFE) + 0x4C) != 0;
    v14 = 16 * v12;
    if ((_DWORD)v12)
      v15 = v14 == MEMORY[0x1E0DCEC78];
    else
      v15 = 1;
    if (!v15)
    {
      do
      {
        v14 = *(_QWORD *)(v14 + 16);
        v13 = v14 != 0;
      }
      while (v14 != MEMORY[0x1E0DCEC78] && v14 != 0);
    }
    if (!v13)
      return &stru_1E9D6EC48;
  }
  if (!v11)
    return &stru_1E9D6EC48;
  v17 = WebCore::JSDOMWindowBase::wrapped(v11);
  v18 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v17 + 104))(v17);
  v19 = *(_QWORD **)(*(_QWORD *)(v18 + 280) + 16);
  if (((*(uint64_t (**)(_QWORD *))(*v19 + 1072))(v19) & 1) != 0)
  {
    v20 = 0;
  }
  else
  {
    v20 = (_QWORD *)v19[2];
    if (v20)
    {
      CFRetain(v20);
      v21 = 0;
      goto LABEL_21;
    }
  }
  v21 = 1;
LABEL_21:
  v22 = *(WebCore::ScriptController **)(v18 + 304);
  v23 = *(WebCore::DOMWrapperWorld **)(*((_QWORD *)a5 + 1) + 8);
  MEMORY[0x1D82A3998](v31, a3);
  v25 = WebCore::ScriptController::executeUserAgentScriptInWorldIgnoringException(v22, v23, (const WTF::String *)v31);
  v31[1] = (WTF::StringImpl *)v25;
  v26 = v31[0];
  v31[0] = 0;
  if (v26)
  {
    if (*(_DWORD *)v26 == 2)
    {
      WTF::StringImpl::destroy(v26, v24);
      v5 = &stru_1E9D6EC48;
      if (!*(_QWORD *)(v20[1] + 8))
        goto LABEL_47;
      goto LABEL_27;
    }
    *(_DWORD *)v26 -= 2;
  }
  v5 = &stru_1E9D6EC48;
  if (!*(_QWORD *)(v20[1] + 8))
    goto LABEL_47;
LABEL_27:
  if (!v25)
    goto LABEL_47;
  if ((v25 & 0xFFFFFFFFFFFFFFFELL) == 6)
    goto LABEL_33;
  if ((v25 & 0xFFFE000000000002) == 0)
  {
    if (*(_BYTE *)(v25 + 5) != 2)
      goto LABEL_47;
LABEL_33:
    JSC::JSLockHolder::JSLockHolder();
    if ((v25 & 0xFFFE000000000002) != 0 || *(_BYTE *)(v25 + 5) != 2)
    {
      JSC::JSValue::toWTFStringSlowCase();
      v27 = v30;
    }
    else
    {
      v27 = *(WTF::StringImpl **)(v25 + 8);
      if ((v27 & 1) != 0)
        v27 = *(WTF::StringImpl **)JSC::JSRopeString::resolveRope();
      if (v27)
        *(_DWORD *)v27 += 2;
      v30 = v27;
    }
    if (v27)
    {
      v5 = (const __CFString *)WTF::StringImpl::operator NSString *();
      if (v30)
      {
        if (*(_DWORD *)v30 == 2)
          WTF::StringImpl::destroy(v30, v28);
        else
          *(_DWORD *)v30 -= 2;
      }
    }
    MEMORY[0x1D82A33C8](v31);
    goto LABEL_47;
  }
  if (v25 >> 49)
    goto LABEL_33;
LABEL_47:
  if ((v21 & 1) == 0)
    CFRelease(v20);
  return (id)v5;
}

- (OpaqueJSContext)_globalContextForScriptWorld:(id)a3
{
  OpaqueJSContext *result;
  LocalFrame *m_ptr;
  WebCore::DOMWrapperWorld *v6;

  result = 0;
  if (a3)
  {
    m_ptr = self->_private->coreFrame.m_ptr;
    if (m_ptr)
    {
      v6 = *(WebCore::DOMWrapperWorld **)(*((_QWORD *)a3 + 1) + 8);
      if (v6)
        return *(OpaqueJSContext **)(WebCore::ScriptController::jsWindowProxy(*((WebCore::ScriptController **)m_ptr + 38), v6)+ 16);
      else
        return 0;
    }
  }
  return result;
}

- (id)_javaScriptContextForScriptWorld:(id)a3
{
  id result;

  result = -[WebFrame _globalContextForScriptWorld:](self, "_globalContextForScriptWorld:", a3);
  if (result)
    return (id)objc_msgSend(MEMORY[0x1E0CBE0F0], "contextWithJSGlobalContextRef:", result);
  return result;
}

- (void)setAccessibleName:(id)a3
{
  unsigned __int8 v3;
  LocalFrame *m_ptr;
  WebCore::Document *v5;
  WebCore::AXObjectCache *v7;
  uint64_t v8;
  const __CFString *v9;
  uint64_t v10;
  StringImpl *v11;
  WTF::StringImpl *v12;
  WTF::StringImpl *v13;

  v3 = atomic_load(MEMORY[0x1E0DCF730]);
  if ((v3 & 1) != 0)
  {
    m_ptr = self->_private->coreFrame.m_ptr;
    if (m_ptr)
    {
      v5 = (WebCore::Document *)*((_QWORD *)m_ptr + 37);
      if (v5)
      {
        v7 = (WebCore::AXObjectCache *)WebCore::Document::axObjectCache(v5);
        v8 = WebCore::AXObjectCache::rootObject(v7);
        if (v8)
        {
          v10 = v8;
          WTF::AtomStringImpl::add((WTF::AtomStringImpl *)a3, v9);
          (*(void (**)(uint64_t, WTF::StringImpl **))(*(_QWORD *)v10 + 1352))(v10, &v13);
          v12 = v13;
          v13 = 0;
          if (v12)
          {
            if (*(_DWORD *)v12 == 2)
              WTF::StringImpl::destroy(v12, v11);
            else
              *(_DWORD *)v12 -= 2;
          }
        }
      }
    }
  }
}

- (void)setEnhancedAccessibility:(BOOL)a3
{
  WebCore::AXObjectCache::setEnhancedUserInterfaceAccessibility((WebCore::AXObjectCache *)a3);
}

- (id)_layerTreeAsText
{
  LocalFrame *m_ptr;
  WebCore::RenderView *v3;
  StringImpl *v4;
  void *v5;
  WTF::StringImpl *v7;

  m_ptr = self->_private->coreFrame.m_ptr;
  if (!m_ptr)
    return &stru_1E9D6EC48;
  v3 = (WebCore::RenderView *)WebCore::LocalFrame::contentRenderer((WebCore::LocalFrame *)m_ptr);
  WebCore::RenderView::compositor(v3);
  WebCore::RenderLayerCompositor::layerTreeAsText();
  if (!v7)
    return &stru_1E9D6EC48;
  v5 = (void *)WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)v7 == 2)
  {
    WTF::StringImpl::destroy(v7, v4);
    return v5;
  }
  else
  {
    *(_DWORD *)v7 -= 2;
    return v5;
  }
}

- (id)accessibilityRoot
{
  unsigned __int8 v3;
  LocalFrame *m_ptr;
  WebCore::Document *v5;
  id result;
  WebCore::AXObjectCache *v7;
  id *v8;

  v3 = atomic_load(MEMORY[0x1E0DCF730]);
  if ((v3 & 1) == 0)
    atomic_store(1u, MEMORY[0x1E0DCF730]);
  m_ptr = self->_private->coreFrame.m_ptr;
  if (!m_ptr)
    return 0;
  v5 = (WebCore::Document *)*((_QWORD *)m_ptr + 37);
  if (!v5)
    return 0;
  result = (id)WebCore::Document::axObjectCache(*((WebCore::Document **)m_ptr + 37));
  if (result)
  {
    v7 = (WebCore::AXObjectCache *)WebCore::Document::axObjectCache(v5);
    result = (id)WebCore::AXObjectCache::rootObjectForFrame(v7, (WebCore::LocalFrame *)self->_private->coreFrame.m_ptr);
    if (result)
    {
      v8 = (id *)result;
      if ((*(unsigned int (**)(id))(*(_QWORD *)result + 128))(result))
      {
        if ((*((uint64_t (**)(id *))*v8 + 364))(v8))
          v8 = (id *)(*((uint64_t (**)(id *))*v8 + 364))(v8);
      }
      return v8[3];
    }
  }
  return result;
}

- (void)_clearOpener
{
  if (self->_private->coreFrame.m_ptr)
    WebCore::Frame::setOpener();
}

- (BOOL)hasRichlyEditableDragCaret
{
  uint64_t v2;
  uint64_t v3;

  v2 = *((_QWORD *)self->_private->coreFrame.m_ptr + 3);
  if (v2 && (v3 = *(_QWORD *)(v2 + 8)) != 0)
    return WebCore::DragCaretController::isContentRichlyEditable(*(WebCore::DragCaretController **)(v3 + 56));
  else
    return 0;
}

- (id)_computePageRectsWithPrintScaleFactor:(float)a3 pageSize:(CGSize)a4
{
  LocalFrame *m_ptr;
  WebCore::ScrollView *v6;
  double height;
  double width;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  float v14;
  float v15;
  float v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t NSArrayElement;
  CFTypeRef v22;
  FloatSize v24;
  _BYTE v25[24];
  uint64_t v26;
  unsigned int v27;

  if (a3 <= 0.0)
    return (id)MEMORY[0x1E0C9AA60];
  m_ptr = self->_private->coreFrame.m_ptr;
  if (!m_ptr)
    return (id)MEMORY[0x1E0C9AA60];
  if (!*((_QWORD *)m_ptr + 37))
    return (id)MEMORY[0x1E0C9AA60];
  v6 = (WebCore::ScrollView *)*((_QWORD *)m_ptr + 36);
  if (!v6)
    return (id)MEMORY[0x1E0C9AA60];
  height = a4.height;
  width = a4.width;
  if (!WebCore::ScrollView::documentView(v6))
    return (id)MEMORY[0x1E0C9AA60];
  v10 = *((_QWORD *)self->_private->coreFrame.m_ptr + 37);
  v11 = *(_QWORD *)(v10 + 1944);
  if (!v11)
    return (id)MEMORY[0x1E0C9AA60];
  WebCore::RenderView::documentRect(*(WebCore::RenderView **)(v10 + 1944));
  v14 = height;
  if (((*(_DWORD *)(v11 + 124) >> 13) & 6u) - 2 >= 4)
    v15 = (float)v12 / a3;
  else
    v15 = width;
  if (((*(_DWORD *)(v11 + 124) >> 13) & 6u) - 2 >= 4)
    v16 = v14;
  else
    v16 = (float)v13 / a3;
  WebCore::PrintContext::PrintContext((WebCore::PrintContext *)v25, (WebCore::LocalFrame *)self->_private->coreFrame.m_ptr);
  v24.var0 = v15;
  v24.var1 = v16;
  WebCore::PrintContext::computePageRectsWithPageSize((WebCore::PrintContext *)v25, &v24);
  v17 = objc_alloc(MEMORY[0x1E0C99DE8]);
  v18 = (void *)objc_msgSend(v17, "initWithCapacity:", v27);
  if (v27)
  {
    v19 = v26;
    v20 = 16 * v27;
    do
    {
      NSArrayElement = WebCore::makeNSArrayElement();
      if (NSArrayElement)
        objc_msgSend(v18, "addObject:", NSArrayElement);
      v19 += 16;
      v20 -= 16;
    }
    while (v20);
  }
  v22 = (id)CFMakeCollectable(v18);
  MEMORY[0x1D82A425C](v25);
  return (id)v22;
}

- (id)_documentFragmentForText:(id)a3
{
  const WTF::String *v4;
  StringImpl *v5;
  WebCore::Node *v6;
  WebCore::Node *v7;
  WTF::StringImpl *v9;
  WebCore::Node *v10;
  WebCore::Node *v11;
  WTF::StringImpl *v12;
  WebCore::Node *v13;
  WebCore::Node *v14;
  WebCore::Node *v15;
  char v16;

  WebCore::VisibleSelection::toNormalizedRange((WebCore::VisibleSelection *)(*(_QWORD *)(*((_QWORD *)self->_private->coreFrame.m_ptr
                                                                                         + 37)
                                                                                       + 3064)
                                                                           + 56));
  if (!v16)
    return 0;
  MEMORY[0x1D82A3998](&v12, a3);
  WebCore::createFragmentFromText((WebCore *)&v14, (const WebCore::SimpleRange *)&v12, v4);
  v6 = kit(v13);
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
  v9 = v12;
  v12 = 0;
  if (!v9)
    goto LABEL_12;
  if (*(_DWORD *)v9 != 2)
  {
    *(_DWORD *)v9 -= 2;
LABEL_12:
    if (!v16)
      return v6;
    goto LABEL_15;
  }
  WTF::StringImpl::destroy(v9, v5);
  if (!v16)
    return v6;
LABEL_15:
  v10 = v15;
  v15 = 0;
  if (v10)
  {
    if (*((_DWORD *)v10 + 6) == 2)
    {
      if ((*((_WORD *)v10 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v10);
    }
    else
    {
      *((_DWORD *)v10 + 6) -= 2;
    }
  }
  v11 = v14;
  v14 = 0;
  if (!v11)
    return v6;
  if (*((_DWORD *)v11 + 6) != 2)
  {
    *((_DWORD *)v11 + 6) -= 2;
    return v6;
  }
  if ((*((_WORD *)v11 + 15) & 0x400) != 0)
    return v6;
  WebCore::Node::removedLastRef(v11);
  return v6;
}

- (id)_documentFragmentForWebArchive:(id)a3
{
  return -[WebDataSource _documentFragmentWithArchive:](-[WebFrame dataSource](self, "dataSource"), "_documentFragmentWithArchive:", a3);
}

- (id)_documentFragmentForImageData:(id)a3 withRelativeURLPart:(id)a4 andMIMEType:(id)a5
{
  WebResource *v9;
  StringImpl *v10;
  WebResource *v11;
  WTF::StringImpl *v12;
  WTF::StringImpl *v13;
  void *v14;
  WTF::StringImpl *v16;
  WTF::StringImpl *v17;

  v9 = [WebResource alloc];
  MEMORY[0x1D82A3998](&v16, a4);
  WTF::URL::fakeURLWithRelativePart();
  v11 = -[WebResource initWithData:URL:MIMEType:textEncodingName:frameName:](v9, "initWithData:URL:MIMEType:textEncodingName:frameName:", a3, WTF::URL::operator NSURL *(), a5, 0, 0);
  v12 = v17;
  v17 = 0;
  if (!v12)
  {
LABEL_4:
    v13 = v16;
    v16 = 0;
    if (!v13)
      goto LABEL_10;
    goto LABEL_7;
  }
  if (*(_DWORD *)v12 != 2)
  {
    *(_DWORD *)v12 -= 2;
    goto LABEL_4;
  }
  WTF::StringImpl::destroy(v12, v10);
  v13 = v16;
  v16 = 0;
  if (!v13)
    goto LABEL_10;
LABEL_7:
  if (*(_DWORD *)v13 == 2)
    WTF::StringImpl::destroy(v13, v10);
  else
    *(_DWORD *)v13 -= 2;
LABEL_10:
  v14 = (void *)objc_msgSend(-[WebFrame _dataSource](self, "_dataSource", v16, v17), "_documentFragmentWithImageResource:", v11);
  if (v11)
    CFRelease(v11);
  return v14;
}

- (BOOL)focusedNodeHasContent
{
  LocalFrame *m_ptr;
  WebCore::Document *v3;
  uint64_t v4;
  WebCore::VisibleSelection *v5;
  uint64_t v6;
  WebCore::Node *v8;
  BOOL v9;
  WebCore::Node *v10;
  uint64_t v11;
  WebCore::Node *v12;
  _QWORD v13[3];

  m_ptr = self->_private->coreFrame.m_ptr;
  v3 = (WebCore::Document *)*((_QWORD *)m_ptr + 37);
  v4 = *((_QWORD *)v3 + 383);
  if (!*(_BYTE *)(v4 + 153))
  {
LABEL_6:
    v6 = WebCore::Document::bodyOrFrameset(v3);
    if (!v6)
      return v6;
    goto LABEL_7;
  }
  v5 = (WebCore::VisibleSelection *)(v4 + 56);
  if ((WebCore::VisibleSelection::isContentEditable((WebCore::VisibleSelection *)(v4 + 56)) & 1) == 0)
  {
    v3 = (WebCore::Document *)*((_QWORD *)m_ptr + 37);
    goto LABEL_6;
  }
  v6 = WebCore::VisibleSelection::rootEditableElement(v5);
  if (!v6)
    return v6;
LABEL_7:
  if (!*(_QWORD *)(v6 + 80))
    return 0;
  *(_DWORD *)(v6 + 24) += 2;
  WebCore::Position::Position();
  WebCore::VisiblePosition::VisiblePosition();
  v8 = v12;
  v12 = 0;
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
  if (*(_DWORD *)(v6 + 24) == 2)
  {
    if ((*(_WORD *)(v6 + 30) & 0x400) == 0)
      WebCore::Node::removedLastRef((WebCore::Node *)v6);
  }
  else
  {
    *(_DWORD *)(v6 + 24) -= 2;
  }
  *(_DWORD *)(v6 + 24) += 2;
  WebCore::ContainerNode::countChildNodes((WebCore::ContainerNode *)v6);
  WebCore::Position::Position();
  WebCore::VisiblePosition::VisiblePosition();
  if (*(_DWORD *)(v6 + 24) == 2)
  {
    if ((*(_WORD *)(v6 + 30) & 0x400) == 0)
      WebCore::Node::removedLastRef((WebCore::Node *)v6);
  }
  else
  {
    *(_DWORD *)(v6 + 24) -= 2;
  }
  v9 = WebCore::operator==((uint64_t)v13, (uint64_t)&v12);
  v10 = v12;
  v12 = 0;
  if (v10)
  {
    if (*((_DWORD *)v10 + 6) == 2)
    {
      if ((*((_WORD *)v10 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v10);
    }
    else
    {
      *((_DWORD *)v10 + 6) -= 2;
    }
  }
  LOBYTE(v6) = !v9;
  v11 = v13[0];
  v13[0] = 0;
  if (!v11)
    return v6;
  if (*(_DWORD *)(v11 + 24) == 2)
  {
    if ((*(_WORD *)(v11 + 30) & 0x400) != 0)
      return v6;
    WebCore::Node::removedLastRef((WebCore::Node *)v11);
    return v6;
  }
  else
  {
    *(_DWORD *)(v11 + 24) -= 2;
    return v6;
  }
}

- (void)_dispatchDidReceiveTitle:(id)a3
{
  LocalFrame *m_ptr;
  uint64_t v4;
  StringImpl *v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *v7;
  char v8;

  m_ptr = self->_private->coreFrame.m_ptr;
  if (m_ptr)
  {
    v4 = *(_QWORD *)(*((_QWORD *)m_ptr + 35) + 16);
    MEMORY[0x1D82A3998](&v7, a3);
    v8 = 0;
    (*(void (**)(uint64_t, WTF::StringImpl **))(*(_QWORD *)v4 + 296))(v4, &v7);
    v6 = v7;
    v7 = 0;
    if (v6)
    {
      if (*(_DWORD *)v6 == 2)
        WTF::StringImpl::destroy(v6, v5);
      else
        *(_DWORD *)v6 -= 2;
    }
  }
}

- (OpaqueJSValue)jsWrapperForNode:(id)a3 inScriptWorld:(id)a4
{
  OpaqueJSValue *v4;
  LocalFrame *m_ptr;
  uint64_t v7;
  uint64_t v8;
  _BYTE v10[8];

  v4 = 0;
  if (a4)
  {
    m_ptr = self->_private->coreFrame.m_ptr;
    if (m_ptr)
    {
      v7 = *(_QWORD *)(WebCore::ScriptController::jsWindowProxy(*((WebCore::ScriptController **)m_ptr + 38), *(WebCore::DOMWrapperWorld **)(*((_QWORD *)a4 + 1) + 8))+ 16);
      JSC::JSLockHolder::JSLockHolder();
      if (a3)
        v8 = *((_QWORD *)a3 + 2);
      else
        v8 = 0;
      v4 = (OpaqueJSValue *)WebCore::toJS(v7, v7, v8);
      MEMORY[0x1D82A33C8](v10);
    }
  }
  return v4;
}

- (id)elementAtPoint:(CGPoint)a3
{
  WebElementDictionary *v3;
  int8x8_t v4;
  CFTypeRef v5;
  int32x2_t v7[2];
  _BYTE v8[136];
  CGPoint v9;

  v9 = a3;
  if (!self->_private->coreFrame.m_ptr)
    return 0;
  v3 = [WebElementDictionary alloc];
  WebCore::IntPoint::IntPoint((WebCore::IntPoint *)v7, &v9);
  v4 = (int8x8_t)vcgt_s32(v7[0], (int32x2_t)0xFE000000FE000000);
  v7[1] = (int32x2_t)vorr_s8((int8x8_t)(*(_QWORD *)&v4 & 0x7FFFFFFF7FFFFFFFLL), vbic_s8(vbsl_s8((int8x8_t)vcgt_s32((int32x2_t)0xFE000000FE000000, v7[0]), (int8x8_t)0x8000000080000000, (int8x8_t)vshl_n_s32(v7[0], 6uLL)), v4));
  WebCore::EventHandler::hitTestResultAtPoint();
  v5 = (id)CFMakeCollectable(-[WebElementDictionary initWithHitTestResult:](v3, "initWithHitTestResult:", v8));
  MEMORY[0x1D82A4430](v8);
  return (id)v5;
}

- (id)_unreachableURL
{
  return (id)objc_msgSend(-[WebFrame _dataSource](self, "_dataSource"), "unreachableURL");
}

- (void)_generateTestReport:(id)a3 withGroup:(id)a4
{
  LocalFrame *m_ptr;
  uint64_t v5;
  StringImpl *v8;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;
  int v11;
  WTF::StringImpl *v12;
  WTF::StringImpl *v13;

  m_ptr = self->_private->coreFrame.m_ptr;
  if (m_ptr)
  {
    v5 = *((_QWORD *)m_ptr + 37);
    if (v5)
    {
      *(_DWORD *)(v5 + 24) += 2;
      if (!*(_QWORD *)(v5 + 3184))
        WebCore::Document::ensureReportingScope((WebCore::Document *)v5);
      MEMORY[0x1D82A3998](&v13, a3);
      MEMORY[0x1D82A3998](&v12, a4);
      WebCore::ReportingScope::generateTestReport();
      v9 = v12;
      v12 = 0;
      if (v9)
      {
        if (*(_DWORD *)v9 == 2)
        {
          WTF::StringImpl::destroy(v9, v8);
          v10 = v13;
          v13 = 0;
          if (!v10)
            goto LABEL_13;
LABEL_11:
          if (*(_DWORD *)v10 == 2)
          {
            WTF::StringImpl::destroy(v10, v8);
            v11 = *(_DWORD *)(v5 + 24) - 2;
            if (*(_DWORD *)(v5 + 24) != 2)
              goto LABEL_14;
LABEL_17:
            if ((*(_WORD *)(v5 + 30) & 0x400) == 0)
              WebCore::Node::removedLastRef((WebCore::Node *)v5);
            return;
          }
          *(_DWORD *)v10 -= 2;
LABEL_13:
          v11 = *(_DWORD *)(v5 + 24) - 2;
          if (*(_DWORD *)(v5 + 24) != 2)
          {
LABEL_14:
            *(_DWORD *)(v5 + 24) = v11;
            return;
          }
          goto LABEL_17;
        }
        *(_DWORD *)v9 -= 2;
      }
      v10 = v13;
      v13 = 0;
      if (!v10)
        goto LABEL_13;
      goto LABEL_11;
    }
  }
}

- (WebFrame)init
{
  return 0;
}

- (WebFrame)initWithName:(NSString *)name webFrameView:(WebFrameView *)view webView:(WebView *)webView
{
  return 0;
}

- (void)dealloc
{
  WebFramePrivate *v3;
  objc_super v4;

  v3 = self->_private;
  if (v3 && v3->includedInWebKitStatistics)
    --WebFrameCount;

  v4.receiver = self;
  v4.super_class = (Class)WebFrame;
  -[WebFrame dealloc](&v4, sel_dealloc);
}

- (NSString)name
{
  LocalFrame *m_ptr;
  StringImpl *v3;
  NSString *v4;
  WTF::StringImpl *v6;

  m_ptr = self->_private->coreFrame.m_ptr;
  if (!m_ptr)
    return 0;
  WebCore::FrameTree::uniqueName((WebCore::FrameTree *)((char *)m_ptr + 48));
  if (!v6)
    return (NSString *)&stru_1E9D6EC48;
  v4 = (NSString *)WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)v6 == 2)
  {
    WTF::StringImpl::destroy(v6, v3);
    return v4;
  }
  else
  {
    *(_DWORD *)v6 -= 2;
    return v4;
  }
}

- (WebFrameView)frameView
{
  return (WebFrameView *)self->_private->webFrameView.m_ptr;
}

- (WebView)webView
{
  LocalFrame *m_ptr;
  uint64_t v3;
  uint64_t v4;

  if (self
    && (m_ptr = self->_private->coreFrame.m_ptr) != 0
    && (v3 = *((_QWORD *)m_ptr + 3)) != 0
    && (v4 = *(_QWORD *)(v3 + 8)) != 0
    && ((*(uint64_t (**)(_QWORD, SEL))(**(_QWORD **)(*(_QWORD *)(v4 + 48) + 16) + 1368))(*(_QWORD *)(*(_QWORD *)(v4 + 48) + 16), a2) & 1) == 0)
  {
    return (WebView *)objc_loadWeak((id *)(*(_QWORD *)(*(_QWORD *)(v4 + 48) + 16) + 16));
  }
  else
  {
    return 0;
  }
}

- (DOMDocument)DOMDocument
{
  LocalFrame *m_ptr;
  WebCore::Node *v3;

  m_ptr = self->_private->coreFrame.m_ptr;
  if (m_ptr
    && objc_msgSend(-[WebFrame _dataSource](self, "_dataSource"), "_isDocumentHTML")
    && ((v3 = (WebCore::Node *)*((_QWORD *)m_ptr + 37)) == 0 || (*((_WORD *)v3 + 1679) & 0xC) == 0))
  {
    return (DOMDocument *)kit(v3);
  }
  else
  {
    return 0;
  }
}

- (DOMHTMLElement)frameElement
{
  LocalFrame *m_ptr;
  uint64_t v3;

  m_ptr = self->_private->coreFrame.m_ptr;
  if (!m_ptr)
    return 0;
  v3 = *((_QWORD *)m_ptr + 15);
  if (v3)
    return (DOMHTMLElement *)kit(*(WebCore::Node **)(v3 + 8));
  else
    return (DOMHTMLElement *)kit(0);
}

- (WebDataSource)provisionalDataSource
{
  LocalFrame *m_ptr;
  uint64_t v3;

  m_ptr = self->_private->coreFrame.m_ptr;
  if (m_ptr && (v3 = *(_QWORD *)(*((_QWORD *)m_ptr + 35) + 96)) != 0)
    return *(WebDataSource **)(v3 + 3560);
  else
    return 0;
}

- (WebDataSource)dataSource
{
  LocalFrame *m_ptr;

  m_ptr = self->_private->coreFrame.m_ptr;
  if (m_ptr && WebCore::FrameLoader::frameHasLoaded(*((WebCore::FrameLoader **)m_ptr + 35)))
    return (WebDataSource *)-[WebFrame _dataSource](self, "_dataSource");
  else
    return 0;
}

- (void)loadRequest:(NSURLRequest *)request
{
  LocalFrame *m_ptr;
  WebCore::ResourceRequestBase *v5;
  uint64_t v6;
  StringImpl *v7;
  WTF::StringImpl *v8;
  StringImpl *v9;
  StringImpl *v10;
  _OWORD v11[19];
  uint64_t v12;
  WTF::StringImpl *v13[73];
  _BYTE v14[200];

  m_ptr = self->_private->coreFrame.m_ptr;
  if (m_ptr)
  {
    v5 = (WebCore::ResourceRequestBase *)MEMORY[0x1D82A4D48](v14, request);
    if ((*(_BYTE *)(WebCore::ResourceRequestBase::url(v5) + 8) & 1) == 0)
    {
      v6 = *(_QWORD *)WebCore::ResourceRequestBase::url((WebCore::ResourceRequestBase *)v14);
      if (v6)
      {
        if (*(_DWORD *)(v6 + 4))
        {
          MEMORY[0x1D82A38F0](v13, objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", objc_msgSend(CFSTR("file:"), "stringByAppendingString:", -[NSURL absoluteString](-[NSURLRequest URL](request, "URL"), "absoluteString"))));
          WebCore::ResourceRequestBase::setURL((WebCore::ResourceRequestBase *)v14, (const WTF::URL *)v13);
          v8 = v13[0];
          v13[0] = 0;
          if (v8)
          {
            if (*(_DWORD *)v8 == 2)
              WTF::StringImpl::destroy(v8, v7);
            else
              *(_DWORD *)v8 -= 2;
          }
        }
      }
    }
    v12 = 0;
    memset(v11, 0, sizeof(v11));
    WebCore::SubstituteData::SubstituteData((WebCore::SubstituteData *)v11);
    MEMORY[0x1D82A4FE8](v13, m_ptr, v14, v11);
    WebCore::FrameLoader::load();
    MEMORY[0x1D82A4FF4](v13);
    WebCore::SubstituteData::~SubstituteData((WebCore::SubstituteData *)v11, v9);
    WebCore::ResourceRequest::~ResourceRequest((WebCore::ResourceRequest *)v14, v10);
  }
}

- (void)_loadData:(id)a3 MIMEType:(id)a4 textEncodingName:(id)a5 baseURL:(id)a6 unreachableURL:(id)a7
{
  uint64_t v12;
  uint64_t UniqueWebDataURL;
  const WTF::String *v14;
  const WTF::String *v15;
  StringImpl *v16;
  NSData *v17;
  int v18;
  WTF::StringImpl *v19;
  WebCore *v20;
  LocalFrame *m_ptr;
  StringImpl *v22;
  StringImpl *v23;
  CFTypeRef v24;
  StringImpl *v25;
  _DWORD *v26;
  WTF::StringImpl *v27;
  uint64_t v28;
  StringImpl *v29;
  WTF::StringImpl *v30;
  WTF::StringImpl *v31;
  WTF::StringImpl *v32;
  WTF::StringImpl *v33;
  void *v34;
  WTF::StringImpl *v35;
  StringImpl *v36;
  WTF::StringImpl *v37;
  _DWORD *v38;
  _DWORD *v39;
  _DWORD *v40;
  _DWORD *v41;
  _DWORD *v42;
  unsigned int v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _DWORD *v47;
  unsigned int v48;
  _QWORD *v49;
  uint64_t v50;
  uint64_t v51;
  _DWORD *v52;
  _DWORD *v53;
  unsigned int *v54;
  unsigned int v55;
  WTF::StringImpl *v56;
  StringImpl *v57;
  StringImpl *v58;
  CFTypeRef v59;
  StringImpl *v60;
  WTF::StringImpl *v61;
  _DWORD *v62;
  __int128 v63;
  __int128 v64;
  _DWORD *v65;
  uint64_t v66;
  _DWORD *v67;
  _DWORD *v68;
  _DWORD *v69;
  uint64_t v70;
  unsigned int v71;
  uint64_t v72;
  unsigned int v73;
  unsigned int *v74;
  CFTypeRef v75;
  char v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _BYTE v82[19];
  CFTypeRef v83;
  char v84;
  CFTypeRef cf[18];
  char v86;
  uint64_t v87;
  _DWORD *v88;
  uint64_t v89;
  char v90;
  char v91;
  char v92;
  uint64_t v93;
  WTF::StringImpl *v94[2];
  __int128 v95;
  __int128 v96;
  _OWORD v97[3];
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  _OWORD v103[7];
  __int128 v104;
  uint64_t v105;
  WTF::StringImpl *v106;
  __int128 v107;
  __int128 v108;

  if (a6)
  {
    v12 = objc_msgSend(a6, "absoluteURL");
    UniqueWebDataURL = 0;
  }
  else
  {
    WTF::aboutBlankURL((WTF *)self);
    v12 = WTF::URL::operator NSURL *();
    UniqueWebDataURL = createUniqueWebDataURL();
  }
  MEMORY[0x1D82A3998](&v106, a4);
  if (((WebCore::MIMETypeRegistry::isSupportedNonImageMIMEType((WebCore::MIMETypeRegistry *)&v106, v14) & 1) != 0
     || (WebCore::MIMETypeRegistry::isSupportedImageMIMEType((WebCore::MIMETypeRegistry *)&v106, v15) & 1) != 0
     || (MEMORY[0x1D82A392C](v106, "text/css", 8) & 1) != 0
     || MEMORY[0x1D82A392C](v106, "application/pdf", 15))
    && (MEMORY[0x1D82A392C](v106, "text/plain", 10) & 1) == 0
    && (MEMORY[0x1D82A392C](v106, "text/xml", 8) & 1) == 0)
  {
    v18 = MEMORY[0x1D82A392C](v106, "application/xml", 15);
    v19 = v106;
    v106 = 0;
    if (!v19)
      goto LABEL_15;
  }
  else
  {
    v18 = 1;
    v19 = v106;
    v106 = 0;
    if (!v19)
      goto LABEL_15;
  }
  if (*(_DWORD *)v19 == 2)
  {
    WTF::StringImpl::destroy(v19, v16);
    if (!v18)
      goto LABEL_24;
    goto LABEL_18;
  }
  *(_DWORD *)v19 -= 2;
LABEL_15:
  if (!v18)
    goto LABEL_24;
LABEL_18:
  if (UniqueWebDataURL)
    v20 = (WebCore *)UniqueWebDataURL;
  else
    v20 = (WebCore *)v12;
  WebCore::registerQLPreviewConverterIfNeeded(v20, (NSURL *)a4, (NSString *)a3, v17);
  if (!cf[0])
  {
LABEL_24:
    MEMORY[0x1D82A38F0](&v106, v12);
    WebCore::ResourceRequestBase::RequestData::RequestData((uint64_t)cf, (uint64_t)&v106, 0);
    v87 = 0;
    v26 = (_DWORD *)*MEMORY[0x1E0CBF738];
    if (*MEMORY[0x1E0CBF738])
      *v26 += 2;
    v88 = v26;
    v89 = 0;
    v90 = 0;
    v91 = 0;
    v92 = v92 & 0xE0 | 5;
    v86 |= 2u;
    v93 = 0;
    v27 = v106;
    v106 = 0;
    if (v27)
    {
      if (*(_DWORD *)v27 == 2)
        WTF::StringImpl::destroy(v27, v25);
      else
        *(_DWORD *)v27 -= 2;
    }
    MEMORY[0x1D82A38F0](&v106, UniqueWebDataURL);
    MEMORY[0x1D82A3998](v94, a4);
    v28 = objc_msgSend(a3, "length");
    MEMORY[0x1D82A3998](&v61, a5);
    WebCore::ResourceResponseBase::ResourceResponseBase((WebCore::ResourceResponseBase *)&v62, (const WTF::URL *)&v106, (const WTF::String *)v94, v28, (const WTF::String *)&v61);
    v83 = 0;
    v84 = 0;
    BYTE2(v77) = BYTE2(v77) & 0xF1 | 4;
    v30 = v61;
    v61 = 0;
    if (v30)
    {
      if (*(_DWORD *)v30 == 2)
      {
        WTF::StringImpl::destroy(v30, v29);
        v31 = v94[0];
        v94[0] = 0;
        if (!v31)
          goto LABEL_38;
LABEL_36:
        if (*(_DWORD *)v31 == 2)
        {
          WTF::StringImpl::destroy(v31, v29);
          v32 = v106;
          v106 = 0;
          if (!v32)
            goto LABEL_44;
LABEL_41:
          if (*(_DWORD *)v32 == 2)
            WTF::StringImpl::destroy(v32, v29);
          else
            *(_DWORD *)v32 -= 2;
LABEL_44:
          WebCore::FragmentedSharedBuffer::create((WebCore::FragmentedSharedBuffer *)a3, (NSData *)v29);
          v33 = (WTF::StringImpl *)WTF::fastMalloc((WTF *)0x38);
          MEMORY[0x1D82A42EC](v33, &v106);
          v61 = v33;
          WTF::Ref<WebCore::FragmentedSharedBuffer,WTF::RawPtrTraits<WebCore::FragmentedSharedBuffer>,WTF::DefaultRefDerefTraits<WebCore::FragmentedSharedBuffer>>::~Ref(&v106, v34);
          v35 = v61;
          MEMORY[0x1D82A38F0](&v106, objc_msgSend(a7, "absoluteURL", 0));
          v94[0] = v35;
          v37 = v106;
          if (v106)
            *(_DWORD *)v106 += 2;
          v94[1] = v37;
          v95 = v107;
          v96 = v108;
          v38 = v62;
          if (v62)
            *v62 += 2;
          *(_QWORD *)&v97[0] = v38;
          *(_OWORD *)((char *)v97 + 8) = v63;
          *(_OWORD *)((char *)&v97[1] + 8) = v64;
          v39 = v65;
          if (v65)
            *v65 += 2;
          v40 = v67;
          *((_QWORD *)&v97[2] + 1) = v39;
          *(_QWORD *)&v98 = v66;
          if (v67)
            *v67 += 2;
          *((_QWORD *)&v98 + 1) = v40;
          v41 = v68;
          if (v68)
            *v68 += 2;
          *(_QWORD *)&v99 = v41;
          v42 = v69;
          if (v69)
            *v69 += 2;
          v43 = v71;
          DWORD2(v100) = 0;
          *((_QWORD *)&v99 + 1) = v42;
          *(_QWORD *)&v100 = 0;
          HIDWORD(v100) = v71;
          if (v71)
          {
            if (v71 >> 28)
              goto LABEL_88;
            v44 = WTF::fastMalloc((WTF *)(16 * v71));
            DWORD2(v100) = v43;
            *(_QWORD *)&v100 = v44;
            if (v71)
            {
              v45 = v70;
              v46 = v70 + 16 * v71;
              do
              {
                *(_WORD *)v44 = *(_WORD *)v45;
                v47 = *(_DWORD **)(v45 + 8);
                if (v47)
                  *v47 += 2;
                *(_QWORD *)(v44 + 8) = v47;
                v45 += 16;
                v44 += 16;
              }
              while (v45 != v46);
            }
          }
          v48 = v73;
          DWORD2(v101) = 0;
          *(_QWORD *)&v101 = 0;
          HIDWORD(v101) = v73;
          if (!v73)
          {
LABEL_72:
            v54 = v74;
            if (v74)
            {
              do
                v55 = __ldaxr(v54);
              while (__stlxr(v55 + 1, v54));
            }
            *(_QWORD *)&v102 = v54;
            BYTE8(v102) = 0;
            LOBYTE(v103[0]) = 0;
            if (v76)
            {
              *((_QWORD *)&v102 + 1) = v75;
              if (v75)
                CFRetain(v75);
              LOBYTE(v103[0]) = 1;
            }
            *(_OWORD *)((char *)&v103[5] + 8) = *(_OWORD *)v82;
            *(_DWORD *)((char *)&v103[6] + 7) = *(_DWORD *)&v82[15];
            *(_OWORD *)((char *)&v103[3] + 8) = v80;
            *(_OWORD *)((char *)&v103[4] + 8) = v81;
            *(_OWORD *)((char *)v103 + 8) = v77;
            *(_OWORD *)((char *)&v103[1] + 8) = v78;
            *(_OWORD *)((char *)&v103[2] + 8) = v79;
            *(_QWORD *)&v104 = v83;
            if (v83)
              CFRetain(v83);
            BYTE8(v104) = v84;
            LOBYTE(v105) = 1;
            v56 = v106;
            v106 = 0;
            if (v56)
            {
              if (*(_DWORD *)v56 == 2)
                WTF::StringImpl::destroy(v56, v36);
              else
                *(_DWORD *)v56 -= 2;
            }
            WTF::Ref<WebCore::SharedBuffer,WTF::RawPtrTraits<WebCore::SharedBuffer>,WTF::DefaultRefDerefTraits<WebCore::SharedBuffer>>::~Ref(&v61, v36);
            MEMORY[0x1D82A4FE8](&v106);
            WebCore::FrameLoader::load();
            MEMORY[0x1D82A4FF4](&v106);
            WebCore::SubstituteData::~SubstituteData((WebCore::SubstituteData *)v94, v57);
            v59 = v83;
            v83 = 0;
            if (v59)
              CFRelease(v59);
            WebCore::ResourceResponseBase::~ResourceResponseBase((WebCore::ResourceResponseBase *)&v62, v58);
            WebCore::ResourceRequest::~ResourceRequest((WebCore::ResourceRequest *)cf, v60);
            return;
          }
          if (!(v73 >> 28))
          {
            v49 = (_QWORD *)WTF::fastMalloc((WTF *)(16 * v73));
            DWORD2(v101) = v48;
            *(_QWORD *)&v101 = v49;
            if (v73)
            {
              v50 = v72;
              v51 = v72 + 16 * v73;
              do
              {
                v52 = *(_DWORD **)v50;
                if (*(_QWORD *)v50)
                  *v52 += 2;
                *v49 = v52;
                v53 = *(_DWORD **)(v50 + 8);
                if (v53)
                  *v53 += 2;
                v49[1] = v53;
                v50 += 16;
                v49 += 2;
              }
              while (v50 != v51);
            }
            goto LABEL_72;
          }
LABEL_88:
          __break(0xC471u);
          JUMPOUT(0x1D8052290);
        }
        *(_DWORD *)v31 -= 2;
LABEL_38:
        v32 = v106;
        v106 = 0;
        if (!v32)
          goto LABEL_44;
        goto LABEL_41;
      }
      *(_DWORD *)v30 -= 2;
    }
    v31 = v94[0];
    v94[0] = 0;
    if (!v31)
      goto LABEL_38;
    goto LABEL_36;
  }
  m_ptr = self->_private->coreFrame.m_ptr;
  MEMORY[0x1D82A4D48](&v62);
  v105 = 0;
  v104 = 0u;
  memset(v103, 0, sizeof(v103));
  v101 = 0u;
  v102 = 0u;
  v99 = 0u;
  v100 = 0u;
  v98 = 0u;
  memset(v97, 0, sizeof(v97));
  v95 = 0u;
  v96 = 0u;
  *(_OWORD *)v94 = 0u;
  WebCore::SubstituteData::SubstituteData((WebCore::SubstituteData *)v94);
  MEMORY[0x1D82A4FE8](&v106, m_ptr, &v62, v94);
  WebCore::FrameLoader::load();
  MEMORY[0x1D82A4FF4](&v106);
  WebCore::SubstituteData::~SubstituteData((WebCore::SubstituteData *)v94, v22);
  WebCore::ResourceRequest::~ResourceRequest((WebCore::ResourceRequest *)&v62, v23);
  v24 = cf[0];
  cf[0] = 0;
  if (v24)
    CFRelease(v24);
}

- (void)loadData:(NSData *)data MIMEType:(NSString *)MIMEType textEncodingName:(NSString *)encodingName baseURL:(NSURL *)URL
{
  const __CFString *v6;

  if (MIMEType)
    v6 = (const __CFString *)MIMEType;
  else
    v6 = CFSTR("text/html");
  -[WebFrame _loadData:MIMEType:textEncodingName:baseURL:unreachableURL:](self, "_loadData:MIMEType:textEncodingName:baseURL:unreachableURL:", data, v6, encodingName, -[NSURL _webkit_URLFromURLOrSchemelessFileURL](URL, "_webkit_URLFromURLOrSchemelessFileURL"), 0);
}

- (void)_loadHTMLString:(id)a3 baseURL:(id)a4 unreachableURL:(id)a5
{
  -[WebFrame _loadData:MIMEType:textEncodingName:baseURL:unreachableURL:](self, "_loadData:MIMEType:textEncodingName:baseURL:unreachableURL:", objc_msgSend(a3, "dataUsingEncoding:", 4), CFSTR("text/html"), CFSTR("UTF-8"), a4, a5);
}

- (void)loadHTMLString:(NSString *)string baseURL:(NSURL *)URL
{
  -[WebFrame _loadHTMLString:baseURL:unreachableURL:](self, "_loadHTMLString:baseURL:unreachableURL:", string, -[NSURL _webkit_URLFromURLOrSchemelessFileURL](URL, "_webkit_URLFromURLOrSchemelessFileURL"), 0);
}

- (void)loadAlternateHTMLString:(NSString *)string baseURL:(NSURL *)baseURL forUnreachableURL:(NSURL *)unreachableURL
{
  -[WebFrame _loadHTMLString:baseURL:unreachableURL:](self, "_loadHTMLString:baseURL:unreachableURL:", string, -[NSURL _webkit_URLFromURLOrSchemelessFileURL](baseURL, "_webkit_URLFromURLOrSchemelessFileURL"), -[NSURL _webkit_URLFromURLOrSchemelessFileURL](unreachableURL, "_webkit_URLFromURLOrSchemelessFileURL"));
}

- (void)loadArchive:(WebArchive *)archive
{
  _DWORD *v3;
  _DWORD *v4;

  v3 = -[WebArchive _coreLegacyWebArchive](archive, "_coreLegacyWebArchive");
  if (v3)
  {
    ++v3[2];
    v4 = v3;
    WebCore::FrameLoader::loadArchive();
    if (v4[2] == 1)
      (*(void (**)(_DWORD *))(*(_QWORD *)v4 + 8))(v4);
    else
      --v4[2];
  }
}

- (void)stopLoading
{
  LocalFrame *m_ptr;

  m_ptr = self->_private->coreFrame.m_ptr;
  if (m_ptr)
    WebCore::FrameLoader::stopForUserCancel(*((WebCore::FrameLoader **)m_ptr + 35));
}

- (void)reload
{
  WebCore::FrameLoader::reload();
}

- (void)reloadFromOrigin
{
  WebCore::FrameLoader::reload();
}

- (WebFrame)findFrameNamed:(NSString *)name
{
  LocalFrame *m_ptr;
  uint64_t v4;
  StringImpl *v5;
  _QWORD *v6;
  WTF::StringImpl *v7;
  WTF::StringImpl *v9;

  m_ptr = self->_private->coreFrame.m_ptr;
  if (!m_ptr)
    return (WebFrame *)m_ptr;
  WTF::AtomStringImpl::add((WTF::AtomStringImpl *)name, (const __CFString *)a2);
  v4 = WebCore::FrameTree::findByUniqueName();
  if (!v4
    || *(_BYTE *)(v4 + 144)
    || (v6 = *(_QWORD **)(*(_QWORD *)(v4 + 280) + 16),
        ((*(uint64_t (**)(_QWORD *))(*v6 + 1072))(v6) & 1) != 0))
  {
    m_ptr = 0;
    v7 = v9;
    if (!v9)
      return (WebFrame *)m_ptr;
  }
  else
  {
    m_ptr = (LocalFrame *)v6[2];
    v7 = v9;
    if (!v9)
      return (WebFrame *)m_ptr;
  }
  if (*(_DWORD *)v7 != 2)
  {
    *(_DWORD *)v7 -= 2;
    return (WebFrame *)m_ptr;
  }
  WTF::StringImpl::destroy(v7, v5);
  return (WebFrame *)m_ptr;
}

- (WebFrame)parentFrame
{
  LocalFrame *m_ptr;
  uint64_t v3;
  const void *v4;
  void *v5;
  _QWORD *v6;

  m_ptr = self->_private->coreFrame.m_ptr;
  if (m_ptr)
  {
    v3 = WebCore::FrameTree::parent((WebCore::FrameTree *)((char *)m_ptr + 48));
    if (v3)
    {
      if (*(_BYTE *)(v3 + 144))
      {
        v4 = 0;
LABEL_5:
        v5 = (void *)CFMakeCollectable(v4);
        return (WebFrame *)v5;
      }
      v6 = *(_QWORD **)(*(_QWORD *)(v3 + 280) + 16);
      if (((*(uint64_t (**)(_QWORD *))(*v6 + 1072))(v6) & 1) == 0)
      {
        v4 = (const void *)v6[2];
        if (v4)
        {
          CFRetain(v4);
          v5 = (void *)CFMakeCollectable(v4);
          return (WebFrame *)v5;
        }
        goto LABEL_5;
      }
    }
    v5 = (void *)CFMakeCollectable(0);
    return (WebFrame *)v5;
  }
  return 0;
}

- (NSArray)childFrames
{
  LocalFrame *m_ptr;
  NSArray *v3;
  uint64_t i;
  _QWORD *v5;

  m_ptr = self->_private->coreFrame.m_ptr;
  if (!m_ptr)
    return (NSArray *)MEMORY[0x1E0C9AA60];
  v3 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", WebCore::FrameTree::childCount((WebCore::FrameTree *)((char *)m_ptr + 48)));
  for (i = *((_QWORD *)m_ptr + 11); i; i = *(_QWORD *)(i + 72))
  {
    while (1)
    {
      if (!*(_BYTE *)(i + 144))
      {
        v5 = *(_QWORD **)(*(_QWORD *)(i + 280) + 16);
        if (((*(uint64_t (**)(_QWORD *))(*v5 + 1072))(v5) & 1) == 0)
          break;
      }
      -[NSArray addObject:](v3, "addObject:", 0);
      i = *(_QWORD *)(i + 72);
      if (!i)
        return v3;
    }
    -[NSArray addObject:](v3, "addObject:", v5[2]);
  }
  return v3;
}

- (WebScriptObject)windowObject
{
  LocalFrame *m_ptr;

  m_ptr = self->_private->coreFrame.m_ptr;
  if (m_ptr)
    return (WebScriptObject *)WebCore::ScriptController::windowScriptObject(*((WebCore::ScriptController **)m_ptr + 38));
  else
    return 0;
}

- (JSGlobalContextRef)globalContext
{
  LocalFrame *m_ptr;
  WebCore::ScriptController *v3;
  WebCore::DOMWrapperWorld *v4;

  m_ptr = self->_private->coreFrame.m_ptr;
  if (!m_ptr)
    return 0;
  v3 = (WebCore::ScriptController *)*((_QWORD *)m_ptr + 38);
  v4 = (WebCore::DOMWrapperWorld *)WebCore::mainThreadNormalWorld((WebCore *)self);
  return *(JSGlobalContextRef *)(WebCore::ScriptController::jsWindowProxy(v3, v4) + 16);
}

- (JSContext)javaScriptContext
{
  LocalFrame *m_ptr;

  m_ptr = self->_private->coreFrame.m_ptr;
  if (m_ptr)
    return (JSContext *)WebCore::ScriptController::javaScriptContext(*((WebCore::ScriptController **)m_ptr + 38));
  else
    return 0;
}

- (id)renderTreeAsExternalRepresentationForPrinting
{
  StringImpl *v2;
  void *v3;
  WTF::StringImpl *v5;

  WebCore::externalRepresentation();
  if (!v5)
    return &stru_1E9D6EC48;
  v3 = (void *)WTF::StringImpl::operator NSString *();
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

- (id)renderTreeAsExternalRepresentationWithOptions:(unint64_t)a3
{
  StringImpl *v3;
  void *v4;
  WTF::StringImpl *v6;

  WebCore::externalRepresentation();
  if (!v6)
    return &stru_1E9D6EC48;
  v4 = (void *)WTF::StringImpl::operator NSString *();
  if (*(_DWORD *)v6 == 2)
  {
    WTF::StringImpl::destroy(v6, v3);
    return v4;
  }
  else
  {
    *(_DWORD *)v6 -= 2;
    return v4;
  }
}

- (int)numberOfPagesWithPageWidth:(float)a3 pageHeight:(float)a4
{
  const FloatSize *v4;
  LocalFrame *m_ptr;
  _DWORD v7[2];

  m_ptr = self->_private->coreFrame.m_ptr;
  if (!m_ptr)
    return -1;
  *(float *)v7 = a3;
  *(float *)&v7[1] = a4;
  return WebCore::PrintContext::numberOfPages((WebCore::PrintContext *)m_ptr, (WebCore::LocalFrame *)v7, v4);
}

- (void)printToCGContext:(CGContext *)a3 pageWidth:(float)a4 pageHeight:(float)a5
{
  _BYTE v5[752];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (self->_private->coreFrame.m_ptr)
  {
    WebCore::GraphicsContextCG::GraphicsContextCG();
    WebCore::PrintContext::spoolAllPagesWithBoundaries();
    WebCore::GraphicsContextCG::~GraphicsContextCG((WebCore::GraphicsContextCG *)v5);
  }
}

- (void)coreFrame
{
  return self->_private->coreFrame.m_ptr;
}

- (VisiblePosition)visiblePositionForPoint:(SEL)a3
{
  if (self)
    return (VisiblePosition *)-[VisiblePosition _visiblePositionForPoint:](self, "_visiblePositionForPoint:", a4.x, a4.y);
  retstr->var0.var0.var0 = 0;
  *(_QWORD *)&retstr->var0.var1 = 0;
  *(_QWORD *)&retstr->var1 = 0;
  return self;
}

- (VisiblePosition)closestWordBoundary:(SEL)a3
{
  Node *var0;
  int v7;
  BOOL v8;
  int v9;
  WebCore::Node *v10;
  int v11;
  int v12;
  WebCore::Node *v13;
  WebCore::Node *v14;
  int v15;
  int v16;
  Node *v17;
  int v18;
  int v19;
  int v20;
  int v21;
  WebCore::Node *v22;
  unsigned int *v23;
  VisiblePosition *result;
  WebCore::Node *v25;
  WebCore::Node *v26;
  BOOL *v27;
  WebCore::Node *v28;
  unsigned int v29;
  char v30;
  WebCore::Node *v31;
  unsigned int var1;
  char v33;
  WebCore::Node *v34;
  unsigned int v35;
  char v36;
  uint64_t v37;
  WebCore::Node *v38;
  unsigned int v39;
  char v40;
  uint64_t v41;

  WebCore::startOfWord();
  WebCore::endOfWord();
  var0 = a4->var0.var0.var0;
  if (a4->var0.var0.var0)
    *((_DWORD *)var0 + 6) += 2;
  v31 = (WebCore::Node *)var0;
  var1 = a4->var0.var1;
  v33 = *((_BYTE *)&a4->var0 + 12);
  if ((v33 & 8) == 0 && ((v7 = v33 & 7, v7 != 2) ? (v8 = v7 == 4) : (v8 = 1), v8))
    v9 = WebCore::Position::offsetForPositionAfterAnchor((WebCore::Position *)&v31);
  else
    v9 = var1;
  v10 = v38;
  if (v38)
    *((_DWORD *)v38 + 6) += 2;
  v28 = v10;
  v29 = v39;
  v30 = v40;
  if ((v40 & 8) == 0 && ((v11 = v40 & 7, v11 == 2) || v11 == 4))
  {
    v12 = WebCore::Position::offsetForPositionAfterAnchor((WebCore::Position *)&v28);
    v10 = v28;
  }
  else
  {
    v12 = v29;
  }
  v28 = 0;
  if (v10)
  {
    if (*((_DWORD *)v10 + 6) == 2)
    {
      if ((*((_WORD *)v10 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v10);
    }
    else
    {
      *((_DWORD *)v10 + 6) -= 2;
    }
  }
  v13 = v31;
  v31 = 0;
  if (v13)
  {
    if (*((_DWORD *)v13 + 6) == 2)
    {
      if ((*((_WORD *)v13 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v13);
    }
    else
    {
      *((_DWORD *)v13 + 6) -= 2;
    }
  }
  v14 = v34;
  if (v34)
    *((_DWORD *)v34 + 6) += 2;
  v31 = v14;
  var1 = v35;
  v33 = v36;
  if ((v36 & 8) == 0 && ((v15 = v36 & 7, v15 == 2) || v15 == 4))
    v16 = WebCore::Position::offsetForPositionAfterAnchor((WebCore::Position *)&v31);
  else
    v16 = var1;
  v17 = a4->var0.var0.var0;
  if (a4->var0.var0.var0)
    *((_DWORD *)v17 + 6) += 2;
  v28 = (WebCore::Node *)v17;
  v29 = a4->var0.var1;
  v30 = *((_BYTE *)&a4->var0 + 12);
  if ((v30 & 8) == 0 && ((v18 = v30 & 7, v18 == 2) || v18 == 4))
  {
    v19 = WebCore::Position::offsetForPositionAfterAnchor((WebCore::Position *)&v28);
    v17 = (Node *)v28;
  }
  else
  {
    v19 = v29;
  }
  v28 = 0;
  if (v17)
  {
    if (*((_DWORD *)v17 + 6) == 2)
    {
      if ((*((_WORD *)v17 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef((WebCore::Node *)v17);
    }
    else
    {
      *((_DWORD *)v17 + 6) -= 2;
    }
  }
  v20 = v9 - v12;
  v21 = v16 - v19;
  v22 = v31;
  v31 = 0;
  if (v22)
  {
    if (*((_DWORD *)v22 + 6) == 2)
    {
      if ((*((_WORD *)v22 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v22);
    }
    else
    {
      *((_DWORD *)v22 + 6) -= 2;
    }
  }
  v23 = &v39;
  result = (VisiblePosition *)v38;
  v25 = v34;
  if (v20 >= v21)
    v26 = v34;
  else
    v26 = v38;
  if (v26)
    *((_DWORD *)v26 + 6) += 2;
  retstr->var0.var0.var0 = (Node *)v26;
  if (v20 >= v21)
    v23 = &v35;
  retstr->var0.var1 = *v23;
  *((_BYTE *)&retstr->var0 + 12) = *((_BYTE *)v23 + 4);
  v27 = (BOOL *)&v41;
  if (v20 >= v21)
    v27 = (BOOL *)&v37;
  retstr->var1 = *v27;
  v34 = 0;
  if (v25)
  {
    if (*((_DWORD *)v25 + 6) == 2)
    {
      if ((*((_WORD *)v25 + 15) & 0x400) == 0)
      {
        WebCore::Node::removedLastRef(v25);
        result = (VisiblePosition *)v38;
      }
    }
    else
    {
      *((_DWORD *)v25 + 6) -= 2;
    }
  }
  v38 = 0;
  if (result)
  {
    if (LODWORD(result[1].var0.var0.var0) == 2)
    {
      if ((HIWORD(result[1].var0.var0.var0) & 0x400) == 0)
        return (VisiblePosition *)WebCore::Node::removedLastRef((WebCore::Node *)result);
    }
    else
    {
      LODWORD(result[1].var0.var0.var0) -= 2;
    }
  }
  return result;
}

- (void)clearSelection
{
  _QWORD *v2;

  v2 = -[WebFrame coreFrame](self, "coreFrame");
  if (v2)
    WebCore::FrameSelection::clearCurrentSelection(*(WebCore::FrameSelection **)(v2[37] + 3064));
}

- (int)selectionState
{
  int v2;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(-[WebFrame coreFrame](self, "coreFrame") + 296) + 3064) + 153);
  if (v2 == 1)
    return 1;
  else
    return 2 * (v2 == 2);
}

- (BOOL)hasSelection
{
  return -[WebFrame selectionState](self, "selectionState") - 1 < 2;
}

- (CGRect)caretRectForPosition:(id)a3
{
  WebCore::Node *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  WebCore::Node *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  WebCore::Node *v17[5];
  CGRect result;

  if (a3)
  {
    objc_msgSend(a3, "_visiblePosition");
    v17[3] = (WebCore::Node *)WebCore::VisiblePosition::absoluteCaretBounds((WebCore::VisiblePosition *)v17, 0);
    v17[4] = v3;
    WebCore::IntRect::operator CGRect();
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v12 = v17[0];
    v17[0] = 0;
    if (v12)
    {
      if (*((_DWORD *)v12 + 6) == 2)
      {
        if ((*((_WORD *)v12 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v12);
      }
      else
      {
        *((_DWORD *)v12 + 6) -= 2;
      }
    }
  }
  else
  {
    v5 = *MEMORY[0x1E0C9D648];
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  v13 = v5;
  v14 = v7;
  v15 = v9;
  v16 = v11;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (CGRect)closestCaretRectInMarkedTextRangeForPoint:(CGPoint)a3
{
  double y;
  double x;
  _QWORD *v6;
  double v7;
  _QWORD *v8;
  double v9;
  double v10;
  double v11;
  WebCore::Editor *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  Node *v22;
  const VisiblePosition *v23;
  const VisiblePosition *v24;
  int v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  WebCore::Node *v31;
  Node *var0;
  Node *v33;
  WTF *v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  double v38;
  double v39;
  double v40;
  char v41;
  WebCore::Node *v42;
  uint64_t v43;
  char v44;
  WebCore::Node *v45;
  int v46;
  char v47;
  char v48;
  VisiblePosition v49;
  WTF *v50;
  int v51;
  int v52;
  VisiblePosition v53;
  _BYTE v54[104];
  uint64_t v55;
  uint64_t v56;
  char v57;
  CGRect result;

  y = a3.y;
  x = a3.x;
  v6 = -[WebFrame coreFrame](self, "coreFrame");
  v7 = 0.0;
  if (!v6)
  {
    v9 = 0.0;
    v10 = 0.0;
    v11 = 0.0;
    goto LABEL_65;
  }
  v8 = v6;
  v9 = 0.0;
  v10 = 0.0;
  v11 = 0.0;
  if (v6[37])
  {
    WebCore::Document::updateLayout();
    v12 = (WebCore::Editor *)WebCore::Document::editor((WebCore::Document *)v8[37]);
    WebCore::Editor::compositionRange(v12);
    if (v57)
      WebCore::VisibleSelection::VisibleSelection();
    else
      WebCore::VisibleSelection::VisibleSelection((WebCore::VisibleSelection *)v54);
    if (v54[97] == 2)
    {
      if (v57)
      {
        WebCore::RenderObject::absoluteTextRects();
        if (v52)
        {
          WebCore::IntRect::operator CGRect();
          v14 = v13;
          WebCore::IntRect::operator CGRect();
          v16 = v15;
          WebCore::VisiblePosition::VisiblePosition();
          WebCore::VisiblePosition::VisiblePosition();
          v45 = 0;
          v46 = 0;
          v47 &= 0xF0u;
          v48 = 1;
          if (y >= v14)
          {
            if (y >= v16)
            {
              if (self)
              {
                -[WebFrame visiblePositionForPoint:](self, "visiblePositionForPoint:", x, v16);
                v45 = v42;
              }
              else
              {
                v43 = 0;
                v45 = 0;
              }
              v46 = v43;
              v47 = BYTE4(v43);
              v41 = 1;
            }
            else
            {
              if (self)
              {
                -[WebFrame visiblePositionForPoint:](self, "visiblePositionForPoint:", x, y);
                v45 = v42;
                v41 = v44;
              }
              else
              {
                v41 = 0;
                v43 = 0;
                v45 = 0;
              }
              v46 = v43;
              v47 = BYTE4(v43);
            }
            v48 = v41;
          }
          else
          {
            if (self)
            {
              -[WebFrame visiblePositionForPoint:](self, "visiblePositionForPoint:", x, v14);
              v45 = v42;
            }
            else
            {
              v43 = 0;
              v45 = 0;
            }
            v46 = v43;
            v47 = BYTE4(v43);
            v48 = 0;
          }
          if (WebCore::operator==((uint64_t)&v45, (uint64_t)&v53)
            || (v25 = (char)WebCore::documentOrder((WebCore *)&v45, &v53, v23), v25 != -127) && v25 < 0)
          {
            v53.var1 = 0;
            WebCore::VisiblePosition::absoluteCaretBounds((WebCore::VisiblePosition *)&v53, 0);
            WebCore::IntRect::operator CGRect();
          }
          else
          {
            if ((char)WebCore::documentOrder((WebCore *)&v45, &v49, v24) < 1)
            {
              WebCore::VisiblePosition::absoluteCaretBounds((WebCore::VisiblePosition *)&v45, 0);
            }
            else
            {
              v49.var1 = 1;
              WebCore::VisiblePosition::absoluteCaretBounds((WebCore::VisiblePosition *)&v49, 0);
            }
            WebCore::IntRect::operator CGRect();
          }
          v11 = v27;
          v10 = v28;
          v9 = v29;
          v7 = v30;
          v31 = v45;
          v45 = 0;
          if (v31)
          {
            if (*((_DWORD *)v31 + 6) == 2)
            {
              if ((*((_WORD *)v31 + 15) & 0x400) == 0)
                WebCore::Node::removedLastRef(v31);
            }
            else
            {
              *((_DWORD *)v31 + 6) -= 2;
            }
          }
          var0 = v49.var0.var0.var0;
          v49.var0.var0.var0 = 0;
          if (var0)
          {
            if (*((_DWORD *)var0 + 6) == 2)
            {
              if ((*((_WORD *)var0 + 15) & 0x400) == 0)
                WebCore::Node::removedLastRef((WebCore::Node *)var0);
            }
            else
            {
              *((_DWORD *)var0 + 6) -= 2;
            }
          }
          v33 = v53.var0.var0.var0;
          v53.var0.var0.var0 = 0;
          if (v33)
          {
            if (*((_DWORD *)v33 + 6) == 2)
            {
              if ((*((_WORD *)v33 + 15) & 0x400) == 0)
                WebCore::Node::removedLastRef((WebCore::Node *)v33);
            }
            else
            {
              *((_DWORD *)v33 + 6) -= 2;
            }
          }
          v34 = v50;
          if (v50)
          {
            v50 = 0;
            v51 = 0;
            WTF::fastFree(v34, v26);
          }
LABEL_54:
          WebCore::VisibleSelection::~VisibleSelection((WebCore::VisibleSelection *)v54);
          if (v57)
          {
            v35 = v56;
            v56 = 0;
            if (v35)
            {
              if (*(_DWORD *)(v35 + 24) == 2)
              {
                if ((*(_WORD *)(v35 + 30) & 0x400) == 0)
                  WebCore::Node::removedLastRef((WebCore::Node *)v35);
              }
              else
              {
                *(_DWORD *)(v35 + 24) -= 2;
              }
            }
            v36 = v55;
            v55 = 0;
            if (v36)
            {
              if (*(_DWORD *)(v36 + 24) == 2)
              {
                if ((*(_WORD *)(v36 + 30) & 0x400) == 0)
                  WebCore::Node::removedLastRef((WebCore::Node *)v36);
              }
              else
              {
                *(_DWORD *)(v36 + 24) -= 2;
              }
            }
          }
          goto LABEL_65;
        }
      }
      else
      {
        __break(1u);
      }
      __break(0xC471u);
      JUMPOUT(0x1D80A65C8);
    }
    if (self)
      -[WebFrame visiblePositionForPoint:](self, "visiblePositionForPoint:", x, y);
    else
      memset(&v53, 0, sizeof(v53));
    v49.var0.var0.var0 = (Node *)WebCore::VisiblePosition::absoluteCaretBounds((WebCore::VisiblePosition *)&v53, 0);
    *(_QWORD *)&v49.var0.var1 = v17;
    WebCore::IntRect::operator CGRect();
    v11 = v18;
    v10 = v19;
    v9 = v20;
    v7 = v21;
    v22 = v53.var0.var0.var0;
    v53.var0.var0.var0 = 0;
    if (v22)
    {
      if (*((_DWORD *)v22 + 6) == 2)
      {
        if ((*((_WORD *)v22 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef((WebCore::Node *)v22);
      }
      else
      {
        *((_DWORD *)v22 + 6) -= 2;
      }
    }
    goto LABEL_54;
  }
LABEL_65:
  v37 = v11;
  v38 = v10;
  v39 = v9;
  v40 = v7;
  result.size.height = v40;
  result.size.width = v39;
  result.origin.y = v38;
  result.origin.x = v37;
  return result;
}

- (void)collapseSelection
{
  WebCore::Node *v3;

  if (-[WebFrame selectionState](self, "selectionState") == 2)
  {
    -[WebFrame coreFrame](self, "coreFrame");
    WebCore::VisiblePosition::VisiblePosition();
    WebCore::FrameSelection::moveTo();
    if (v3)
    {
      if (*((_DWORD *)v3 + 6) == 2)
      {
        if ((*((_WORD *)v3 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v3);
      }
      else
      {
        *((_DWORD *)v3 + 6) -= 2;
      }
    }
  }
}

- (void)extendSelection:(BOOL)a3
{
  _BOOL4 v3;
  WebCore::Node *v5;
  int v6;
  WebCore::Node *v7;
  WebCore::Node *v8;

  v3 = a3;
  if (-[WebFrame selectionState](self, "selectionState") == 2)
  {
    -[WebFrame coreFrame](self, "coreFrame");
    if (v3)
    {
      WebCore::VisiblePosition::VisiblePosition();
      WebCore::startOfWord();
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
      WebCore::VisiblePosition::VisiblePosition();
      WebCore::FrameSelection::moveTo();
      v5 = v8;
      if (v8)
      {
        v6 = *((_DWORD *)v8 + 6) - 2;
        if (*((_DWORD *)v8 + 6) == 2)
        {
          if ((*((_WORD *)v8 + 15) & 0x400) != 0)
            return;
LABEL_23:
          WebCore::Node::removedLastRef(v5);
          return;
        }
        goto LABEL_21;
      }
    }
    else
    {
      WebCore::VisiblePosition::VisiblePosition();
      WebCore::endOfWord();
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
      WebCore::VisiblePosition::VisiblePosition();
      WebCore::FrameSelection::moveTo();
      v5 = v8;
      if (v8)
      {
        v6 = *((_DWORD *)v8 + 6) - 2;
        if (*((_DWORD *)v8 + 6) == 2)
        {
          if ((*((_WORD *)v8 + 15) & 0x400) != 0)
            return;
          goto LABEL_23;
        }
LABEL_21:
        *((_DWORD *)v5 + 6) = v6;
      }
    }
  }
}

- (id)selectionRectsForCoreRange:(const void *)a3
{
  void *v3;
  unsigned __int8 *v4;
  id v5;
  void *v6;
  CFTypeRef v7;
  WTF *v9;
  unsigned int v10;

  WebCore::RenderObject::collectSelectionGeometries((WebCore::RenderObject *)a3, (const WebCore::SimpleRange *)a2);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v10);
  if (v10)
  {
    v4 = (unsigned __int8 *)v9;
    do
    {
      v5 = +[WebSelectionRect selectionRect](WebSelectionRect, "selectionRect");
      WebCore::SelectionGeometry::rect((WebCore::SelectionGeometry *)v4);
      WebCore::IntRect::operator CGRect();
      objc_msgSend(v5, "setRect:");
      objc_msgSend(v5, "setWritingDirection:", v4[33]);
      objc_msgSend(v5, "setIsLineBreak:", v4[52]);
      objc_msgSend(v5, "setIsFirstOnLine:", v4[53]);
      objc_msgSend(v5, "setIsLastOnLine:", v4[54]);
      objc_msgSend(v5, "setContainsStart:", v4[55]);
      objc_msgSend(v5, "setContainsEnd:", v4[56]);
      objc_msgSend(v5, "setIsInFixedPosition:", v4[58]);
      objc_msgSend(v5, "setIsHorizontal:", v4[57]);
      if (v5)
        objc_msgSend(v3, "addObject:", v5);
      v4 += 84;
    }
    while (v4 != (unsigned __int8 *)((char *)v9 + 84 * v10));
  }
  v7 = (id)CFMakeCollectable(v3);
  if (v9)
    WTF::fastFree(v9, v6);
  return (id)v7;
}

- (id)selectionRectsForRange:(id)a3
{
  id v4;
  WebCore::Node *v5;
  WebCore::Node *v7;
  WebCore::Node *v8;
  WebCore::Node *v9;
  char v10;

  if (a3)
  {
    WebCore::makeSimpleRange();
    if (v10)
      goto LABEL_3;
    return 0;
  }
  WebCore::makeSimpleRange();
  if (!v10)
    return 0;
LABEL_3:
  v4 = -[WebFrame selectionRectsForCoreRange:](self, "selectionRectsForCoreRange:", &v8);
  if (!v10)
    return v4;
  v5 = v9;
  v9 = 0;
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
  v7 = v8;
  v8 = 0;
  if (!v7)
    return v4;
  if (*((_DWORD *)v7 + 6) != 2)
  {
    *((_DWORD *)v7 + 6) -= 2;
    return v4;
  }
  if ((*((_WORD *)v7 + 15) & 0x400) != 0)
    return v4;
  WebCore::Node::removedLastRef(v7);
  return v4;
}

- (id)selectionRects
{
  id v3;
  WebCore::Node *v4;
  WebCore::Node *v6;
  WebCore::Node *v7;
  WebCore::Node *v8;
  char v9;

  WebCore::VisibleSelection::toNormalizedRange((WebCore::VisibleSelection *)(*(_QWORD *)(*(_QWORD *)(-[WebFrame coreFrame](self, "coreFrame") + 296)
                                                                                       + 3064)
                                                                           + 56));
  if (!v9)
    return 0;
  v3 = -[WebFrame selectionRectsForCoreRange:](self, "selectionRectsForCoreRange:", &v7);
  if (!v9)
    return v3;
  v4 = v8;
  v8 = 0;
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
  v6 = v7;
  v7 = 0;
  if (!v6)
    return v3;
  if (*((_DWORD *)v6 + 6) != 2)
  {
    *((_DWORD *)v6 + 6) -= 2;
    return v3;
  }
  if ((*((_WORD *)v6 + 15) & 0x400) != 0)
    return v3;
  WebCore::Node::removedLastRef(v6);
  return v3;
}

- (id)wordAtPoint:(CGPoint)a3
{
  DOMObjectInternal *v3;
  DOMObjectInternal *v4;
  WebCore::Node *v5;
  WebCore::Node *v6;
  Node *var0;
  WebCore::Node *v8;
  uint64_t v9;
  VisiblePosition v11;
  WebCore::Node *v12;
  WebCore::Node *v13;
  WebCore::Node *v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  DOMObjectInternal *v19;

  if (self)
  {
    -[WebFrame visiblePositionForPoint:](self, "visiblePositionForPoint:", a3.x, a3.y);
  }
  else
  {
    v16 = 0;
    v17 = 0;
    v18 = 0;
  }
  WebCore::startOfWord();
  WebCore::endOfWord();
  WebCore::makeSimpleRange<WebCore::VisiblePosition,WebCore::VisiblePosition>((WebCore *)&v12, &v11, (uint64_t)&v13);
  WebCore::createLiveRange();
  v3 = kit(v19);
  v4 = v19;
  v19 = 0;
  if (!v4)
  {
LABEL_7:
    if (!v15)
      goto LABEL_20;
    goto LABEL_10;
  }
  if (*((_DWORD *)v4 + 2) != 1)
  {
    --*((_DWORD *)v4 + 2);
    goto LABEL_7;
  }
  (*(void (**)(DOMObjectInternal *))(*(_QWORD *)v4 + 8))(v4);
  if (!v15)
    goto LABEL_20;
LABEL_10:
  v5 = v14;
  v14 = 0;
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
  v6 = v13;
  v13 = 0;
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
LABEL_20:
  var0 = v11.var0.var0.var0;
  v11.var0.var0.var0 = 0;
  if (var0)
  {
    if (*((_DWORD *)var0 + 6) == 2)
    {
      if ((*((_WORD *)var0 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef((WebCore::Node *)var0);
    }
    else
    {
      *((_DWORD *)var0 + 6) -= 2;
    }
  }
  v8 = v12;
  v12 = 0;
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
  v9 = v16;
  v16 = 0;
  if (!v9)
    return v3;
  if (*(_DWORD *)(v9 + 24) != 2)
  {
    *(_DWORD *)(v9 + 24) -= 2;
    return v3;
  }
  if ((*(_WORD *)(v9 + 30) & 0x400) != 0)
    return v3;
  WebCore::Node::removedLastRef((WebCore::Node *)v9);
  return v3;
}

- (id)webVisiblePositionForPoint:(CGPoint)a3
{
  id v3;
  WebCore::Node *v4;
  WebCore::Node *v6[3];

  if (self)
    -[WebFrame visiblePositionForPoint:](self, "visiblePositionForPoint:", a3.x, a3.y);
  else
    memset(v6, 0, sizeof(v6));
  v3 = +[WebVisiblePosition _wrapVisiblePosition:](WebVisiblePosition, "_wrapVisiblePosition:", v6);
  v4 = v6[0];
  v6[0] = 0;
  if (!v4)
    return v3;
  if (*((_DWORD *)v4 + 6) != 2)
  {
    *((_DWORD *)v4 + 6) -= 2;
    return v3;
  }
  if ((*((_WORD *)v4 + 15) & 0x400) != 0)
    return v3;
  WebCore::Node::removedLastRef(v4);
  return v3;
}

- (void)setRangedSelectionBaseToCurrentSelection
{
  WebCore::LocalFrame::setRangedSelectionBaseToCurrentSelection((WebCore::LocalFrame *)-[WebFrame coreFrame](self, "coreFrame"));
}

- (void)setRangedSelectionBaseToCurrentSelectionStart
{
  WebCore::LocalFrame::setRangedSelectionBaseToCurrentSelectionStart((WebCore::LocalFrame *)-[WebFrame coreFrame](self, "coreFrame"));
}

- (void)setRangedSelectionBaseToCurrentSelectionEnd
{
  WebCore::LocalFrame::setRangedSelectionBaseToCurrentSelectionEnd((WebCore::LocalFrame *)-[WebFrame coreFrame](self, "coreFrame"));
}

- (void)clearRangedSelectionInitialExtent
{
  WebCore::LocalFrame::clearRangedSelectionInitialExtent((WebCore::LocalFrame *)-[WebFrame coreFrame](self, "coreFrame"));
}

- (void)setRangedSelectionInitialExtentToCurrentSelectionStart
{
  WebCore::LocalFrame::setRangedSelectionInitialExtentToCurrentSelectionStart((WebCore::LocalFrame *)-[WebFrame coreFrame](self, "coreFrame"));
}

- (void)setRangedSelectionInitialExtentToCurrentSelectionEnd
{
  WebCore::LocalFrame::setRangedSelectionInitialExtentToCurrentSelectionEnd((WebCore::LocalFrame *)-[WebFrame coreFrame](self, "coreFrame"));
}

- (void)setRangedSelectionWithExtentPoint:(CGPoint)a3
{
  double y;
  double x;
  WebCore::LocalFrame *v6;
  const VisiblePosition *v7;
  const VisiblePosition *v8;
  int v9;
  Node *var0;
  Node *v11;
  uint64_t v12;
  VisiblePosition v13;
  VisiblePosition v14;
  _BYTE v15[104];
  _QWORD v16[3];

  y = a3.y;
  x = a3.x;
  v6 = -[WebFrame coreFrame](self, "coreFrame");
  if (self)
    -[WebFrame visiblePositionForPoint:](self, "visiblePositionForPoint:", x, y);
  else
    memset(v16, 0, sizeof(v16));
  WebCore::LocalFrame::rangedSelectionBase(v6);
  if (v16[0] && v15[97] == 2)
  {
    WebCore::VisiblePosition::VisiblePosition();
    WebCore::VisiblePosition::VisiblePosition();
    v9 = (char)WebCore::documentOrder((WebCore *)v16, &v14, v7);
    if (v9 == -127 || (v9 & 0x80000000) == 0)
      WebCore::documentOrder((WebCore *)v16, &v13, v8);
    WebCore::FrameSelection::moveTo();
    var0 = v13.var0.var0.var0;
    v13.var0.var0.var0 = 0;
    if (var0)
    {
      if (*((_DWORD *)var0 + 6) == 2)
      {
        if ((*((_WORD *)var0 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef((WebCore::Node *)var0);
      }
      else
      {
        *((_DWORD *)var0 + 6) -= 2;
      }
    }
    v11 = v14.var0.var0.var0;
    v14.var0.var0.var0 = 0;
    if (v11)
    {
      if (*((_DWORD *)v11 + 6) == 2)
      {
        if ((*((_WORD *)v11 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef((WebCore::Node *)v11);
      }
      else
      {
        *((_DWORD *)v11 + 6) -= 2;
      }
    }
  }
  WebCore::VisibleSelection::~VisibleSelection((WebCore::VisibleSelection *)v15);
  v12 = v16[0];
  v16[0] = 0;
  if (v12)
  {
    if (*(_DWORD *)(v12 + 24) == 2)
    {
      if ((*(_WORD *)(v12 + 30) & 0x400) == 0)
        WebCore::Node::removedLastRef((WebCore::Node *)v12);
    }
    else
    {
      *(_DWORD *)(v12 + 24) -= 2;
    }
  }
}

- (BOOL)setRangedSelectionExtentPoint:(CGPoint)a3 baseIsStart:(BOOL)a4 allowFlipping:(BOOL)a5
{
  _BOOL4 v5;
  int v6;
  double y;
  double x;
  const VisiblePosition *v10;
  Node *v11;
  BOOL var1;
  Node *var0;
  const VisiblePosition *v14;
  int v15;
  int v16;
  WebCore::VisiblePosition *v17;
  uint64_t v18;
  const VisiblePosition *v19;
  double v20;
  double v21;
  BOOL v22;
  Node *v23;
  int v24;
  BOOL v25;
  char v26;
  char v27;
  char v28;
  Node *v29;
  int v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  double v35;
  double v36;
  const VisiblePosition *v37;
  uint64_t (*v38)();
  uint64_t v39;
  uint64_t v40;
  double v42;
  double v43;
  const VisiblePosition *v44;
  uint64_t (*v45)();
  int v46;
  Node *v47;
  Node *v48;
  Node *v49;
  Node *v50;
  Node *v51;
  Node *v52;
  BOOL v53;
  BOOL v54;
  WebCore::Node *v55;
  Node *v56;
  Node *v57;
  int v58;
  WebCore::Node *v59;
  int v60;
  WebCore::Node *v61;
  Node *v62;
  Node *v63;
  Node *v64;
  Node *v65;
  WebCore::Node *v66;
  Node *v68;
  unsigned int v69;
  char v70;
  BOOL v71;
  WebCore::Node *v72;
  uint64_t v73;
  _BOOL8 v74;
  VisiblePosition v75;
  VisiblePosition v76;
  VisiblePosition v77;
  WebCore::Node *v78;
  unsigned int v79;
  char v80;
  BOOL v81;
  _BYTE v82[96];
  char v83;

  v5 = a5;
  v6 = a4;
  y = a3.y;
  x = a3.x;
  WebCore::LocalFrame::rangedSelectionBase((WebCore::LocalFrame *)-[WebFrame coreFrame](self, "coreFrame"));
  WebCore::VisiblePosition::VisiblePosition();
  v77.var0.var0.var0 = 0;
  v77.var0.var1 = 0;
  *((_BYTE *)&v77.var0 + 12) = 0;
  v77.var1 = 1;
  if (!v83)
    goto LABEL_135;
  if (v83 == 1)
  {
    v11 = (Node *)v78;
    if (v78)
      *((_DWORD *)v78 + 6) += 2;
    v77.var0.var0.var0 = v11;
    v77.var0.var1 = v79;
    *((_BYTE *)&v77.var0 + 12) = v80;
    var1 = v81;
  }
  else
  {
    WebCore::VisiblePosition::VisiblePosition();
    var0 = v76.var0.var0.var0;
    v76.var0.var0.var0 = 0;
    v77.var0.var0.var0 = var0;
    v77.var0.var1 = v76.var0.var1;
    *((_BYTE *)&v77.var0 + 12) = *((_BYTE *)&v76.var0 + 12);
    var1 = v76.var1;
  }
  v77.var1 = var1;
  if (self)
  {
    -[WebFrame visiblePositionForPoint:](self, "visiblePositionForPoint:", x, y);
    if (v83 != 2)
    {
LABEL_16:
      if (v6)
        v17 = (WebCore::VisiblePosition *)&v78;
      else
        v17 = (WebCore::VisiblePosition *)&v77;
      v75.var0.var0.var0 = (Node *)WebCore::VisiblePosition::absoluteCaretBounds(v17, 0);
      *(_QWORD *)&v75.var0.var1 = v18;
      WebCore::IntRect::operator CGRect();
      if (v5)
      {
        if (vabdd_f64(v20, x) <= 30.0)
        {
          v22 = vabdd_f64(v21, y) > 30.0;
          if (!v6)
            goto LABEL_38;
        }
        else
        {
          v22 = 1;
          if (!v6)
          {
LABEL_38:
            v29 = v77.var0.var0.var0;
            if (v77.var0.var0.var0)
              *((_DWORD *)v77.var0.var0.var0 + 6) += 2;
            v75.var0.var0.var0 = v29;
            v75.var0.var1 = v77.var0.var1;
            *((_BYTE *)&v75.var0 + 12) = *((_BYTE *)&v77.var0 + 12);
            v75.var1 = v77.var1;
            v30 = (char)WebCore::documentOrder((WebCore *)&v76, &v75, v19);
            v28 = v30 > 0;
            v31 = v30 < 1 || v22;
            if ((v31 & 1) != 0)
            {
LABEL_115:
              if (!WebCore::operator==((uint64_t)&v75, (uint64_t)&v76))
                goto LABEL_120;
              WebCore::VisiblePosition::previous();
              v62 = (Node *)v72;
              v72 = 0;
              v57 = v76.var0.var0.var0;
              v76.var0.var0.var0 = v62;
              if (!v57)
                goto LABEL_119;
              v58 = *((_DWORD *)v57 + 6) - 2;
              if (*((_DWORD *)v57 + 6) != 2)
              {
LABEL_118:
                *((_DWORD *)v57 + 6) = v58;
                goto LABEL_119;
              }
              if ((*((_WORD *)v57 + 15) & 0x400) != 0)
                goto LABEL_119;
              WebCore::Node::removedLastRef((WebCore::Node *)v57);
              v59 = v72;
              v76.var0.var1 = v73;
              *((_BYTE *)&v76.var0 + 12) = BYTE4(v73);
              v76.var1 = v74;
              v72 = 0;
              if (!v59)
              {
LABEL_120:
                WebCore::FrameSelection::moveTo();
                LOBYTE(v6) = v28 ^ v6;
                v63 = v75.var0.var0.var0;
                v75.var0.var0.var0 = 0;
                if (v63)
                {
                  if (*((_DWORD *)v63 + 6) == 2)
                  {
                    if ((*((_WORD *)v63 + 15) & 0x400) == 0)
                      WebCore::Node::removedLastRef((WebCore::Node *)v63);
                  }
                  else
                  {
                    *((_DWORD *)v63 + 6) -= 2;
                  }
                }
                goto LABEL_125;
              }
              v60 = *((_DWORD *)v59 + 6) - 2;
              if (*((_DWORD *)v59 + 6) != 2)
              {
LABEL_144:
                *((_DWORD *)v59 + 6) = v60;
                goto LABEL_120;
              }
LABEL_103:
              if ((*((_WORD *)v59 + 15) & 0x400) == 0)
                WebCore::Node::removedLastRef(v59);
              goto LABEL_120;
            }
            v72 = (WebCore::Node *)WebCore::VisiblePosition::absoluteCaretBounds((WebCore::VisiblePosition *)&v75, 0);
            v73 = v32;
            WebCore::IntRect::operator CGRect();
            if (v36 <= v35)
            {
              x = CGRectGetMidX(*(CGRect *)&v33);
              if (self)
              {
LABEL_46:
                -[WebFrame visiblePositionForPoint:](self, "visiblePositionForPoint:", x, y);
                if (v72)
                  v38 = WTF::RefPtr<WebCore::Node,WTF::RawPtrTraits<WebCore::Node>,WTF::DefaultRefDerefTraits<WebCore::Node>>::unspecifiedBoolTypeInstance;
                else
                  v38 = 0;
                if (v38)
                {
                  v46 = (char)WebCore::documentOrder((WebCore *)&v72, &v75, v37);
                  if (v46 != -127 && v46 < 0)
                  {
                    v47 = (Node *)v72;
                    if (v72)
                      *((_DWORD *)v72 + 6) += 2;
                    v48 = v76.var0.var0.var0;
                    v76.var0.var0.var0 = v47;
                    if (v48)
                    {
                      if (*((_DWORD *)v48 + 6) == 2)
                      {
                        if ((*((_WORD *)v48 + 15) & 0x400) == 0)
                          WebCore::Node::removedLastRef((WebCore::Node *)v48);
                      }
                      else
                      {
                        *((_DWORD *)v48 + 6) -= 2;
                      }
                    }
                    v76.var0.var1 = v73;
                    *((_BYTE *)&v76.var0 + 12) = BYTE4(v73);
                    v53 = v74;
                    goto LABEL_108;
                  }
                }
LABEL_67:
                WebCore::VisiblePosition::previous();
                v49 = v76.var0.var0.var0;
                v76.var0.var0.var0 = v68;
                if (v49)
                {
                  if (*((_DWORD *)v49 + 6) == 2)
                  {
                    if ((*((_WORD *)v49 + 15) & 0x400) == 0)
                    {
                      WebCore::Node::removedLastRef((WebCore::Node *)v49);
                      v76.var0.var1 = v69;
                      *((_BYTE *)&v76.var0 + 12) = v70;
                      v76.var1 = v71;
LABEL_109:
                      v61 = v72;
                      v72 = 0;
                      if (v61)
                      {
                        if (*((_DWORD *)v61 + 6) == 2)
                        {
                          if ((*((_WORD *)v61 + 15) & 0x400) == 0)
                            WebCore::Node::removedLastRef(v61);
                        }
                        else
                        {
                          *((_DWORD *)v61 + 6) -= 2;
                        }
                      }
                      v28 = 0;
                      goto LABEL_115;
                    }
                  }
                  else
                  {
                    *((_DWORD *)v49 + 6) -= 2;
                  }
                }
                v76.var0.var1 = v69;
                *((_BYTE *)&v76.var0 + 12) = v70;
                v53 = v71;
LABEL_108:
                v76.var1 = v53;
                goto LABEL_109;
              }
            }
            else
            {
              y = CGRectGetMidY(*(CGRect *)&v33);
              if (self)
                goto LABEL_46;
            }
            v72 = 0;
            v73 = 0;
            v74 = 0;
            goto LABEL_67;
          }
        }
      }
      else
      {
        v22 = 0;
        if (!v6)
          goto LABEL_38;
      }
      v23 = (Node *)v78;
      if (v78)
        *((_DWORD *)v78 + 6) += 2;
      v75.var0.var0.var0 = v23;
      v75.var0.var1 = v79;
      *((_BYTE *)&v75.var0 + 12) = v80;
      v75.var1 = v81;
      v24 = (char)WebCore::documentOrder((WebCore *)&v76, &v75, v19);
      v25 = v24 != -127 && v24 < 0;
      v26 = !v25;
      v27 = !v25 || v22;
      if ((v27 & 1) != 0)
      {
        v28 = v26 ^ 1;
        goto LABEL_97;
      }
      v72 = (WebCore::Node *)WebCore::VisiblePosition::absoluteCaretBounds((WebCore::VisiblePosition *)&v75, 0);
      v73 = v39;
      WebCore::IntRect::operator CGRect();
      if (v43 <= v42)
      {
        x = CGRectGetMidX(*(CGRect *)&v40);
        if (self)
        {
LABEL_53:
          -[WebFrame visiblePositionForPoint:](self, "visiblePositionForPoint:", x, y);
          if (v72)
            v45 = WTF::RefPtr<WebCore::Node,WTF::RawPtrTraits<WebCore::Node>,WTF::DefaultRefDerefTraits<WebCore::Node>>::unspecifiedBoolTypeInstance;
          else
            v45 = 0;
          if (v45 && (char)WebCore::documentOrder((WebCore *)&v72, &v75, v44) >= 1)
          {
            v50 = (Node *)v72;
            if (v72)
              *((_DWORD *)v72 + 6) += 2;
            v51 = v76.var0.var0.var0;
            v76.var0.var0.var0 = v50;
            if (v51)
            {
              if (*((_DWORD *)v51 + 6) == 2)
              {
                if ((*((_WORD *)v51 + 15) & 0x400) == 0)
                  WebCore::Node::removedLastRef((WebCore::Node *)v51);
              }
              else
              {
                *((_DWORD *)v51 + 6) -= 2;
              }
            }
            v76.var0.var1 = v73;
            *((_BYTE *)&v76.var0 + 12) = BYTE4(v73);
            v54 = v74;
            goto LABEL_90;
          }
LABEL_78:
          WebCore::VisiblePosition::next();
          v52 = v76.var0.var0.var0;
          v76.var0.var0.var0 = v68;
          if (v52)
          {
            if (*((_DWORD *)v52 + 6) == 2)
            {
              if ((*((_WORD *)v52 + 15) & 0x400) == 0)
              {
                WebCore::Node::removedLastRef((WebCore::Node *)v52);
                v76.var0.var1 = v69;
                *((_BYTE *)&v76.var0 + 12) = v70;
                v76.var1 = v71;
LABEL_91:
                v55 = v72;
                v72 = 0;
                if (v55)
                {
                  if (*((_DWORD *)v55 + 6) == 2)
                  {
                    if ((*((_WORD *)v55 + 15) & 0x400) == 0)
                      WebCore::Node::removedLastRef(v55);
                  }
                  else
                  {
                    *((_DWORD *)v55 + 6) -= 2;
                  }
                }
                v28 = 0;
LABEL_97:
                if (!WebCore::operator==((uint64_t)&v75, (uint64_t)&v76))
                  goto LABEL_120;
                WebCore::VisiblePosition::next();
                v56 = (Node *)v72;
                v72 = 0;
                v57 = v76.var0.var0.var0;
                v76.var0.var0.var0 = v56;
                if (!v57)
                  goto LABEL_119;
                v58 = *((_DWORD *)v57 + 6) - 2;
                if (*((_DWORD *)v57 + 6) != 2)
                  goto LABEL_118;
                if ((*((_WORD *)v57 + 15) & 0x400) != 0)
                {
LABEL_119:
                  v76.var0.var1 = v73;
                  *((_BYTE *)&v76.var0 + 12) = BYTE4(v73);
                  v76.var1 = v74;
                  goto LABEL_120;
                }
                WebCore::Node::removedLastRef((WebCore::Node *)v57);
                v59 = v72;
                v76.var0.var1 = v73;
                *((_BYTE *)&v76.var0 + 12) = BYTE4(v73);
                v76.var1 = v74;
                v72 = 0;
                if (!v59)
                  goto LABEL_120;
                v60 = *((_DWORD *)v59 + 6) - 2;
                if (*((_DWORD *)v59 + 6) != 2)
                  goto LABEL_144;
                goto LABEL_103;
              }
            }
            else
            {
              *((_DWORD *)v52 + 6) -= 2;
            }
          }
          v76.var0.var1 = v69;
          *((_BYTE *)&v76.var0 + 12) = v70;
          v54 = v71;
LABEL_90:
          v76.var1 = v54;
          goto LABEL_91;
        }
      }
      else
      {
        y = CGRectGetMidY(*(CGRect *)&v40);
        if (self)
          goto LABEL_53;
      }
      v72 = 0;
      v73 = 0;
      v74 = 0;
      goto LABEL_78;
    }
  }
  else
  {
    memset(&v76, 0, sizeof(v76));
    if (v83 != 2)
      goto LABEL_16;
  }
  v15 = (char)WebCore::documentOrder((WebCore *)&v78, &v76, v10);
  if (v15 == -127)
    goto LABEL_16;
  if ((v15 & 0x80000000) == 0)
    goto LABEL_16;
  v16 = (char)WebCore::documentOrder((WebCore *)&v76, &v77, v14);
  if (v16 == -127 || (v16 & 0x80000000) == 0)
    goto LABEL_16;
  WebCore::FrameSelection::moveTo();
  LOBYTE(v6) = 0;
LABEL_125:
  v64 = v76.var0.var0.var0;
  v76.var0.var0.var0 = 0;
  if (v64)
  {
    if (*((_DWORD *)v64 + 6) == 2)
    {
      if ((*((_WORD *)v64 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef((WebCore::Node *)v64);
    }
    else
    {
      *((_DWORD *)v64 + 6) -= 2;
    }
  }
  v65 = v77.var0.var0.var0;
  v77.var0.var0.var0 = 0;
  if (v65)
  {
    if (*((_DWORD *)v65 + 6) == 2)
    {
      if ((*((_WORD *)v65 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef((WebCore::Node *)v65);
    }
    else
    {
      *((_DWORD *)v65 + 6) -= 2;
    }
  }
LABEL_135:
  v66 = v78;
  v78 = 0;
  if (v66)
  {
    if (*((_DWORD *)v66 + 6) == 2)
    {
      if ((*((_WORD *)v66 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v66);
    }
    else
    {
      *((_DWORD *)v66 + 6) -= 2;
    }
  }
  WebCore::VisibleSelection::~VisibleSelection((WebCore::VisibleSelection *)v82);
  return v6;
}

- (BOOL)setSelectionWithBasePoint:(CGPoint)a3 extentPoint:(CGPoint)a4 baseIsStart:(BOOL)a5 allowFlipping:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  double y;
  double x;
  double v10;
  double v11;
  BOOL v13;
  BOOL v14;
  char v15;
  const VisiblePosition *v16;
  int v17;
  BOOL v18;
  char v19;
  char v20;
  char v21;
  int v22;
  char v23;
  WebCore::Node *v24;
  WebCore::Node *v25;
  Node *var0;
  WebCore::Node *v28;
  int v29;
  char v30;
  char v31;
  WebCore::Node *v32;
  uint64_t v33;
  uint64_t v34;
  VisiblePosition v35;

  v6 = a6;
  v7 = a5;
  y = a4.y;
  x = a4.x;
  v10 = a3.y;
  v11 = a3.x;
  -[WebFrame coreFrame](self, "coreFrame");
  if (self)
  {
    -[WebFrame visiblePositionForPoint:](self, "visiblePositionForPoint:", v11, v10);
    -[WebFrame visiblePositionForPoint:](self, "visiblePositionForPoint:", x, y);
  }
  else
  {
    memset(&v35, 0, sizeof(v35));
    v32 = 0;
    v33 = 0;
    v34 = 0;
  }
  v13 = x >= v11 + 30.0;
  if (y >= v10 + 30.0)
    v13 = 1;
  v14 = x <= v11 + -30.0;
  if (y <= v10 + -30.0)
    v14 = 1;
  if (v7)
    v13 = v14;
  v15 = v6 && v13;
  if (WebCore::operator==((uint64_t)&v32, (uint64_t)&v35))
  {
    if (v7)
    {
LABEL_34:
      WebCore::VisiblePosition::next();
LABEL_35:
      v24 = v32;
      v32 = v28;
      if (v24)
      {
        if (*((_DWORD *)v24 + 6) == 2)
        {
          if ((*((_WORD *)v24 + 15) & 0x400) == 0)
          {
            WebCore::Node::removedLastRef(v24);
            LODWORD(v33) = v29;
            BYTE4(v33) = v30;
            LOBYTE(v34) = v31;
LABEL_41:
            v21 = 0;
            goto LABEL_42;
          }
        }
        else
        {
          *((_DWORD *)v24 + 6) -= 2;
        }
      }
      LODWORD(v33) = v29;
      BYTE4(v33) = v30;
      LOBYTE(v34) = v31;
      goto LABEL_41;
    }
    goto LABEL_33;
  }
  if (v7)
  {
    v17 = (char)WebCore::documentOrder((WebCore *)&v32, &v35, v16);
    v18 = v17 != -127 && v17 < 0;
    v19 = !v18;
    if (v18)
      v20 = v15;
    else
      v20 = 1;
    if ((v20 & 1) != 0)
    {
      v21 = v19 ^ 1;
      goto LABEL_42;
    }
    goto LABEL_34;
  }
  v22 = (char)WebCore::documentOrder((WebCore *)&v32, &v35, v16);
  v21 = v22 > 0;
  if (v22 < 1)
    v23 = 1;
  else
    v23 = v15;
  if ((v23 & 1) == 0)
  {
LABEL_33:
    WebCore::VisiblePosition::previous();
    goto LABEL_35;
  }
LABEL_42:
  WebCore::FrameSelection::moveTo();
  v25 = v32;
  v32 = 0;
  if (v25)
  {
    if (*((_DWORD *)v25 + 6) == 2)
    {
      if ((*((_WORD *)v25 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v25);
    }
    else
    {
      *((_DWORD *)v25 + 6) -= 2;
    }
  }
  var0 = v35.var0.var0.var0;
  v35.var0.var0.var0 = 0;
  if (var0)
  {
    if (*((_DWORD *)var0 + 6) == 2)
    {
      if ((*((_WORD *)var0 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef((WebCore::Node *)var0);
    }
    else
    {
      *((_DWORD *)var0 + 6) -= 2;
    }
  }
  return v21 ^ v7;
}

- (BOOL)setSelectionWithBasePoint:(CGPoint)a3 extentPoint:(CGPoint)a4 baseIsStart:(BOOL)a5
{
  return -[WebFrame setSelectionWithBasePoint:extentPoint:baseIsStart:allowFlipping:](self, "setSelectionWithBasePoint:extentPoint:baseIsStart:allowFlipping:", a5, 1, a3.x, a3.y, a4.x, a4.y);
}

- (void)setSelectionWithFirstPoint:(CGPoint)a3 secondPoint:(CGPoint)a4
{
  double y;
  double x;
  WebCore::Node *v7;
  WebCore::Node *v8;
  uint64_t v9;
  uint64_t v10;
  WebCore::Node *v11;

  if (self)
  {
    y = a4.y;
    x = a4.x;
    -[WebFrame visiblePositionForPoint:](self, "visiblePositionForPoint:", a3.x, a3.y);
    -[WebFrame visiblePositionForPoint:](self, "visiblePositionForPoint:", x, y);
  }
  else
  {
    v11 = 0;
    v7 = 0;
    v9 = 0;
    v10 = 0;
  }
  -[WebFrame coreFrame](self, "coreFrame", v7, v9, v10);
  WebCore::FrameSelection::moveTo();
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
  if (v11)
  {
    if (*((_DWORD *)v11 + 6) == 2)
    {
      if ((*((_WORD *)v11 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v11);
    }
    else
    {
      *((_DWORD *)v11 + 6) -= 2;
    }
  }
}

- (void)ensureRangedSelectionContainsInitialStartPoint:(CGPoint)a3 initialEndPoint:(CGPoint)a4
{
  double y;
  double x;
  double v6;
  double v7;
  uint64_t v9;
  WebCore::Node *v10;
  int v11;
  WebCore::Node *v12;
  int v13;
  int v14;
  WebCore::Node *v15;
  int v16;
  WebCore::Node *v17;
  WebCore::Node *v18;
  WebCore::Node *v19;
  WebCore::Node *v20;
  int v21;
  char v22;
  WebCore::Node *v23;
  uint64_t v24;
  uint64_t v25;
  WebCore::Node *v26;
  int v27;
  char v28;

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  v9 = *(_QWORD *)(*(_QWORD *)(-[WebFrame coreFrame](self, "coreFrame") + 296) + 3064);
  if (!self)
  {
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v23 = 0;
    v28 = 0;
    v24 = 0;
LABEL_6:
    v20 = 0;
    v21 = v24;
    v22 = BYTE4(v24);
    goto LABEL_14;
  }
  -[WebFrame visiblePositionForPoint:](self, "visiblePositionForPoint:", v7, v6);
  v10 = v23;
  if (v23)
  {
    v11 = *((_DWORD *)v23 + 6);
    *((_DWORD *)v23 + 6) = v11 + 2;
    v26 = v10;
    v27 = v24;
    v28 = BYTE4(v24);
    v23 = 0;
    if (v11)
    {
      *((_DWORD *)v10 + 6) = v11;
    }
    else if ((*((_WORD *)v10 + 15) & 0x400) == 0)
    {
      WebCore::Node::removedLastRef(v10);
    }
  }
  else
  {
    v26 = 0;
    v27 = v24;
    v28 = BYTE4(v24);
  }
  -[WebFrame visiblePositionForPoint:](self, "visiblePositionForPoint:", x, y);
  v12 = v23;
  if (!v23)
    goto LABEL_6;
  v13 = *((_DWORD *)v23 + 6);
  *((_DWORD *)v23 + 6) = v13 + 2;
  v20 = v12;
  v21 = v24;
  v22 = BYTE4(v24);
  v23 = 0;
  if (v13)
  {
    *((_DWORD *)v12 + 6) = v13;
  }
  else if ((*((_WORD *)v12 + 15) & 0x400) == 0)
  {
    WebCore::Node::removedLastRef(v12);
  }
LABEL_14:
  if ((char)MEMORY[0x1D82A4550](v9 + 120, &v26) < 1)
  {
    v14 = (char)MEMORY[0x1D82A4550](v9 + 136, &v20);
    if (v14 != -127 && v14 < 0)
    {
      WebCore::VisiblePosition::VisiblePosition();
      WebCore::VisiblePosition::VisiblePosition();
      WebCore::FrameSelection::moveTo();
      if (v19)
      {
        if (*((_DWORD *)v19 + 6) == 2)
        {
          if ((*((_WORD *)v19 + 15) & 0x400) == 0)
            WebCore::Node::removedLastRef(v19);
        }
        else
        {
          *((_DWORD *)v19 + 6) -= 2;
        }
      }
      v15 = v23;
      v23 = 0;
      if (v15)
      {
        v16 = *((_DWORD *)v15 + 6) - 2;
        if (*((_DWORD *)v15 + 6) != 2)
          goto LABEL_27;
LABEL_32:
        if ((*((_WORD *)v15 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v15);
      }
    }
  }
  else
  {
    WebCore::VisiblePosition::VisiblePosition();
    WebCore::VisiblePosition::VisiblePosition();
    WebCore::FrameSelection::moveTo();
    if (v19)
    {
      if (*((_DWORD *)v19 + 6) == 2)
      {
        if ((*((_WORD *)v19 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v19);
      }
      else
      {
        *((_DWORD *)v19 + 6) -= 2;
      }
    }
    v15 = v23;
    v23 = 0;
    if (v15)
    {
      v16 = *((_DWORD *)v15 + 6) - 2;
      if (*((_DWORD *)v15 + 6) != 2)
      {
LABEL_27:
        *((_DWORD *)v15 + 6) = v16;
        goto LABEL_34;
      }
      goto LABEL_32;
    }
  }
LABEL_34:
  v17 = v20;
  v20 = 0;
  if (v17)
  {
    if (*((_DWORD *)v17 + 6) == 2)
    {
      if ((*((_WORD *)v17 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v17);
    }
    else
    {
      *((_DWORD *)v17 + 6) -= 2;
    }
  }
  v18 = v26;
  v26 = 0;
  if (v18)
  {
    if (*((_DWORD *)v18 + 6) == 2)
    {
      if ((*((_WORD *)v18 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v18);
    }
    else
    {
      *((_DWORD *)v18 + 6) -= 2;
    }
  }
}

- (void)aggressivelyExpandSelectionToWordContainingCaretSelection
{
  uint64_t v3;
  const VisiblePosition *v4;
  const VisiblePosition *v5;
  const VisiblePosition *v6;
  _BOOL4 v7;
  WebCore::Node *v8;
  WebCore::Node *v9;
  WebCore::Node *v10;
  WebCore::Node *v11;
  WebCore::Node *v12;
  WebCore::Node *v13;
  const VisiblePosition *v14;
  const VisiblePosition *v15;
  WebCore::Node *v16;
  uint64_t (*v17)();
  uint64_t (*v18)();
  BOOL v19;
  WebCore::Node *v20;
  WebCore::Node *v21;
  WebCore::Node *v22;
  int v23;
  WebCore::Node *v24;
  WebCore::Node *v25;
  WebCore::Node *v26;
  WebCore::Node *v27;
  int v28;
  char v29;
  char v30;
  WebCore::Node *v31[3];
  WebCore::Node *v32;
  int v33;
  char v34;
  char v35;
  WebCore::Node *v36[3];

  v3 = *(_QWORD *)(*(_QWORD *)(-[WebFrame coreFrame](self, "coreFrame") + 296) + 3064);
  WebCore::VisiblePosition::VisiblePosition();
  WebCore::endOfDocument((WebCore *)v36, v4);
  if (WebCore::operator==((uint64_t)v36, (uint64_t)&v32))
  {
    WebCore::startOfDocument((WebCore *)v36, v5);
    if (WebCore::operator==((uint64_t)v36, (uint64_t)v31))
    {
      v7 = 0;
    }
    else
    {
      WebCore::startOfLine((WebCore *)v36, v6);
      v7 = WebCore::operator==((uint64_t)v36, (uint64_t)&v27);
      v8 = v27;
      v27 = 0;
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
    }
    v9 = v31[0];
    v31[0] = 0;
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
  }
  else
  {
    v7 = 0;
  }
  v10 = v32;
  v32 = 0;
  if (v10)
  {
    if (*((_DWORD *)v10 + 6) == 2)
    {
      if ((*((_WORD *)v10 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v10);
    }
    else
    {
      *((_DWORD *)v10 + 6) -= 2;
    }
  }
  if (v7)
  {
    WebCore::VisiblePosition::previous();
    WebCore::FrameSelection::moveTo();
    v11 = v32;
    v32 = 0;
    if (v11)
    {
      if (*((_DWORD *)v11 + 6) == 2)
      {
        if ((*((_WORD *)v11 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v11);
      }
      else
      {
        *((_DWORD *)v11 + 6) -= 2;
      }
    }
  }
  -[WebFrame expandSelectionToWordContainingCaretSelection](self, "expandSelectionToWordContainingCaretSelection", v27);
  if (*(_BYTE *)(v3 + 184) == 1)
  {
    WebCore::VisiblePosition::VisiblePosition();
    WebCore::VisiblePosition::VisiblePosition();
    WebCore::FrameSelection::moveTo();
    v12 = v31[0];
    v31[0] = 0;
    if (v12)
    {
      if (*((_DWORD *)v12 + 6) == 2)
      {
        if ((*((_WORD *)v12 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v12);
      }
      else
      {
        *((_DWORD *)v12 + 6) -= 2;
      }
    }
    v13 = v32;
    v32 = 0;
    if (v13)
    {
      if (*((_DWORD *)v13 + 6) == 2)
      {
        if ((*((_WORD *)v13 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v13);
      }
      else
      {
        *((_DWORD *)v13 + 6) -= 2;
      }
    }
  }
  if (*(_BYTE *)(v3 + 153) != 1)
    goto LABEL_78;
  WebCore::VisiblePosition::VisiblePosition();
  if (!WebCore::isStartOfLine((WebCore *)&v32, v14)
    || !WebCore::isEndOfLine((WebCore *)&v32, v15))
  {
    while (1)
    {
      if (v32)
        v18 = WTF::RefPtr<WebCore::Node,WTF::RawPtrTraits<WebCore::Node>,WTF::DefaultRefDerefTraits<WebCore::Node>>::unspecifiedBoolTypeInstance;
      else
        v18 = 0;
      if (!v18)
        goto LABEL_73;
      WebCore::startOfWord();
      v19 = WebCore::operator==((uint64_t)v31, (uint64_t)&v32);
      if (v19)
      {
        WebCore::VisiblePosition::previous();
        v20 = v27;
        v27 = 0;
        v21 = v32;
        v32 = v20;
        if (!v21)
          goto LABEL_66;
        if (*((_DWORD *)v21 + 6) != 2)
        {
          *((_DWORD *)v21 + 6) -= 2;
LABEL_66:
          v33 = v28;
          v34 = v29;
          v35 = v30;
          goto LABEL_67;
        }
        if ((*((_WORD *)v21 + 15) & 0x400) != 0)
          goto LABEL_66;
        WebCore::Node::removedLastRef(v21);
        v22 = v27;
        v33 = v28;
        v34 = v29;
        v35 = v30;
        v27 = 0;
        if (v22)
        {
          v23 = *((_DWORD *)v22 + 6) - 2;
          if (*((_DWORD *)v22 + 6) == 2)
          {
LABEL_64:
            if ((*((_WORD *)v22 + 15) & 0x400) == 0)
              WebCore::Node::removedLastRef(v22);
            goto LABEL_67;
          }
          goto LABEL_60;
        }
      }
      else
      {
        WebCore::VisiblePosition::VisiblePosition();
        WebCore::FrameSelection::moveTo();
        v22 = v27;
        v27 = 0;
        if (v22)
        {
          v23 = *((_DWORD *)v22 + 6) - 2;
          if (*((_DWORD *)v22 + 6) == 2)
            goto LABEL_64;
LABEL_60:
          *((_DWORD *)v22 + 6) = v23;
        }
      }
LABEL_67:
      v24 = v31[0];
      v31[0] = 0;
      if (v24)
      {
        if (*((_DWORD *)v24 + 6) == 2)
        {
          if ((*((_WORD *)v24 + 15) & 0x400) == 0)
            WebCore::Node::removedLastRef(v24);
        }
        else
        {
          *((_DWORD *)v24 + 6) -= 2;
        }
      }
      if (!v19)
        goto LABEL_73;
    }
  }
  WebCore::VisiblePosition::next();
  v16 = v31[0];
  v17 = WTF::RefPtr<WebCore::Node,WTF::RawPtrTraits<WebCore::Node>,WTF::DefaultRefDerefTraits<WebCore::Node>>::unspecifiedBoolTypeInstance;
  if (!v31[0])
    v17 = 0;
  if (v17)
  {
    WebCore::FrameSelection::moveTo();
    v16 = v31[0];
  }
  v31[0] = 0;
  if (v16)
  {
    if (*((_DWORD *)v16 + 6) == 2)
    {
      if ((*((_WORD *)v16 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v16);
    }
    else
    {
      *((_DWORD *)v16 + 6) -= 2;
    }
  }
LABEL_73:
  v25 = v32;
  v32 = 0;
  if (v25)
  {
    if (*((_DWORD *)v25 + 6) == 2)
    {
      if ((*((_WORD *)v25 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v25);
    }
    else
    {
      *((_DWORD *)v25 + 6) -= 2;
    }
  }
LABEL_78:
  v26 = v36[0];
  v36[0] = 0;
  if (v26)
  {
    if (*((_DWORD *)v26 + 6) == 2)
    {
      if ((*((_WORD *)v26 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v26);
    }
    else
    {
      *((_DWORD *)v26 + 6) -= 2;
    }
  }
}

- (void)expandSelectionToSentence
{
  WebCore *v2;
  const VisiblePosition *v3;
  const VisiblePosition *v4;
  uint64_t v5;
  WebCore::Node *v6;
  WebCore::Node *v7;
  _QWORD v8[3];

  -[WebFrame coreFrame](self, "coreFrame");
  v2 = (WebCore *)WebCore::VisiblePosition::VisiblePosition();
  WebCore::startOfSentence(v2, v3);
  WebCore::endOfSentence((WebCore *)v8, v4);
  WebCore::FrameSelection::moveTo();
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
  v5 = v8[0];
  v8[0] = 0;
  if (v5)
  {
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
}

- (int)selectionBaseWritingDirection
{
  WebCore::Editor *v2;

  v2 = (WebCore::Editor *)WebCore::Document::editor(*(WebCore::Document **)(-[WebFrame coreFrame](self, "coreFrame")
                                                                          + 296));
  return WebCore::Editor::baseWritingDirectionForSelectionStart(v2) == 2;
}

- (void)toggleBaseWritingDirection
{
  -[WebFrame setBaseWritingDirection:](self, "setBaseWritingDirection:", -[WebFrame selectionBaseWritingDirection](self, "selectionBaseWritingDirection") != 1);
}

- (void)setBaseWritingDirection:(int)a3
{
  int v4;
  WebCore::Document **v5;

  v4 = -[WebFrame selectionBaseWritingDirection](self, "selectionBaseWritingDirection");
  v5 = -[WebFrame coreFrame](self, "coreFrame");
  if (WebCore::VisibleSelection::isContentEditable((WebCore::VisibleSelection *)(*((_QWORD *)v5[37] + 383)
                                                                                              + 56)))
  {
    WebCore::Document::editor(v5[37]);
    WebCore::Editor::setBaseWritingDirection();
    if (v4 != -[WebFrame selectionBaseWritingDirection](self, "selectionBaseWritingDirection"))
    {
      WebCore::Document::editor(v5[37]);
      WebCore::Editor::setTextAlignmentForChangedBaseWritingDirection();
    }
  }
}

- (void)moveSelectionToStart
{
  WebCore **v2;
  const Node *v3;
  WebCore::Node *v4;

  v2 = -[WebFrame coreFrame](self, "coreFrame");
  WebCore::startOfDocument(v2[37], v3);
  WebCore::FrameSelection::moveTo();
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
}

- (void)moveSelectionToEnd
{
  WebCore **v2;
  const Node *v3;
  WebCore::Node *v4;

  v2 = -[WebFrame coreFrame](self, "coreFrame");
  WebCore::endOfDocument(v2[37], v3);
  WebCore::FrameSelection::moveTo();
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
}

- (void)moveSelectionToPoint:(CGPoint)a3
{
  double y;
  double x;
  WebCore::Node *v6;

  y = a3.y;
  x = a3.x;
  -[WebFrame coreFrame](self, "coreFrame");
  if (self)
    -[WebFrame _visiblePositionForPoint:](self, "_visiblePositionForPoint:", x, y);
  else
    v6 = 0;
  WebCore::FrameSelection::moveTo();
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
}

- (void)setSelectionGranularity:(int)a3
{
  WebCore::FrameSelection::setSelection();
}

- (void)smartExtendRangedSelection:(int)a3
{
  WebCore::LocalFrame *v5;
  UChar32 v6;
  unsigned int IntPropertyValue;
  WebCore::Node *v8;
  uint64_t v9;
  WebCore::Node *v10;
  WebCore::Node *v11;
  UChar32 v12;
  WebCore::Node *v13;
  unsigned int v14;
  WebCore::Node *v15;
  WebCore::Node *v16;
  WebCore::Node *v17;
  WebCore::Node *v18;
  WebCore::Node *v19;
  WebCore::Node *v20;
  WebCore::Node *v21;
  WebCore::Node *v22;
  char v23;
  UniChar v24;
  WebCore::Node *v25;
  WebCore::Node *v26;
  WebCore::Node *v27;
  UniChar v28;
  WebCore::Node *v29;
  UniChar v30;
  const __CFCharacterSet *Predefined;
  const __CFCharacterSet *v32;
  const __CFCharacterSet *v33;
  const __CFCharacterSet *v34;
  WebCore::Node *v35;
  WebCore::Node *v36;
  UniChar v37;
  const __CFCharacterSet *v38;
  const __CFCharacterSet *v39;
  const __CFCharacterSet *v40;
  const __CFCharacterSet *v41;
  WebCore::Node *v42;
  WebCore::Node *v43;
  WebCore::Node *v44;
  const VisiblePosition *v45;
  WebCore::Node *v46;
  WebCore::Node *v47;
  uint64_t (*v48)();
  const VisiblePosition *v49;
  UniChar v50;
  const __CFCharacterSet *v51;
  WebCore::Node *v52;
  WebCore::Node *v53;
  WebCore::Node *v54;
  uint64_t (*v55)();
  WebCore::Node *v56;
  WebCore::Node *v57;
  WebCore::Node *v58;
  WebCore::Node *v59;
  WebCore::Node *v60;
  WebCore::Node *v61;
  WebCore::Node *v62;
  int v63;
  WebCore::Node *v64;
  UniChar v65;
  WebCore::Node *v66;
  const __CFCharacterSet *v67;
  const VisiblePosition *v68;
  WebCore::Node *v69;
  WebCore::Node *v70;
  uint64_t (*v71)();
  const VisiblePosition *v72;
  UniChar v73;
  WebCore::Node *v74;
  const __CFCharacterSet *v75;
  WebCore::Node *v76;
  WebCore::Node *v77;
  WebCore::Node *v78;
  uint64_t (*v79)();
  WebCore::Node *v80;
  WebCore::Node *v81;
  WebCore::Node *v82;
  WebCore::Node *v83;
  WebCore::Node *v84;
  WebCore::Node *v85;
  uint64_t (*v86)();
  WebCore::Node *v87;
  int v88;
  char v89;
  WebCore::Node *v90;
  int v91;
  char v92;
  char v93;
  WebCore::Node *v94;
  int v95;
  char v96;
  char v97;
  WebCore::Node *v98[3];
  WebCore::Node *v99[12];
  char v100;
  _QWORD v101[3];
  WebCore::Node *v102;
  int v103;
  char v104;
  char v105;
  WebCore::Node *v106;
  int v107;
  char v108;
  char v109;
  WebCore::Node *v110;
  int v111;
  char v112;
  char v113;
  WebCore::Node *v114;
  int v115;
  char v116;
  char v117;
  WebCore::Node *v118;
  int v119;
  char v120;
  char v121;
  WebCore::Node *v122;
  int v123;
  char v124;
  char v125;

  if (-[WebFrame selectionState](self, "selectionState") != 2)
    return;
  v5 = -[WebFrame coreFrame](self, "coreFrame");
  WebCore::VisiblePosition::VisiblePosition();
  WebCore::VisiblePosition::VisiblePosition();
  WebCore::LocalFrame::rangedSelectionBase(v5);
  WebCore::VisiblePosition::VisiblePosition();
  WebCore::VisibleSelection::~VisibleSelection((WebCore::VisibleSelection *)v99);
  if (WebCore::operator==((uint64_t)v101, (uint64_t)&v106) || WebCore::operator==((uint64_t)v101, (uint64_t)&v102))
  {
    WebCore::VisiblePosition::VisiblePosition();
    v6 = WebCore::VisiblePosition::characterAfter((WebCore::VisiblePosition *)v98);
    IntPropertyValue = u_getIntPropertyValue(v6, UCHAR_LINE_BREAK);
    if (IntPropertyValue <= 0x25 && ((1 << IntPropertyValue) & 0x2001004000) != 0)
      goto LABEL_6;
    WebCore::VisiblePosition::previous();
    v12 = WebCore::VisiblePosition::characterAfter((WebCore::VisiblePosition *)v99);
    v13 = v99[0];
    v99[0] = 0;
    if (v13)
    {
      if (*((_DWORD *)v13 + 6) == 2)
      {
        if ((*((_WORD *)v13 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v13);
      }
      else
      {
        *((_DWORD *)v13 + 6) -= 2;
      }
    }
    v14 = u_getIntPropertyValue(v12, UCHAR_LINE_BREAK);
    if (v14 <= 0x25 && ((1 << v14) & 0x2001004000) != 0)
      goto LABEL_6;
    WebCore::VisibleSelection::VisibleSelection((WebCore::VisibleSelection *)v99);
    if (a3)
    {
      WebCore::LocalFrame::rangedSelectionInitialExtent(v5);
      WebCore::VisibleSelection::operator=((uint64_t *)v99, (uint64_t *)&v94);
      WebCore::VisibleSelection::~VisibleSelection((WebCore::VisibleSelection *)&v94);
    }
    v90 = 0;
    v91 = 0;
    v92 &= 0xF0u;
    v93 = 1;
    if (WebCore::operator==((uint64_t)v101, (uint64_t)&v102))
    {
      v15 = v106;
      if (v106)
        *((_DWORD *)v106 + 6) += 2;
      v122 = v15;
      v123 = v107;
      v124 = v108;
      v125 = v109;
      v118 = 0;
      v119 = 0;
      v120 = 0;
      v121 = 1;
      if (v100)
      {
        WebCore::VisiblePosition::VisiblePosition();
        v16 = v94;
        v94 = 0;
        v17 = v118;
        v118 = v16;
        if (!v17)
        {
LABEL_53:
          v119 = v95;
          v120 = v96;
          v121 = v97;
          goto LABEL_54;
        }
        if (*((_DWORD *)v17 + 6) != 2)
        {
          *((_DWORD *)v17 + 6) -= 2;
          goto LABEL_53;
        }
        if ((*((_WORD *)v17 + 15) & 0x400) != 0)
          goto LABEL_53;
        WebCore::Node::removedLastRef(v17);
        v21 = v94;
        v119 = v95;
        v120 = v96;
        v121 = v97;
        v94 = 0;
        if (v21)
        {
          if (*((_DWORD *)v21 + 6) == 2)
          {
            if ((*((_WORD *)v21 + 15) & 0x400) == 0)
              WebCore::Node::removedLastRef(v21);
          }
          else
          {
            *((_DWORD *)v21 + 6) -= 2;
          }
        }
      }
LABEL_54:
      if (WebCore::operator==((uint64_t)&v118, (uint64_t)&v106))
        goto LABEL_55;
      WebCore::VisiblePosition::previous();
      v24 = WebCore::VisiblePosition::characterAfter((WebCore::VisiblePosition *)&v94);
      v25 = v94;
      v94 = 0;
      if (v25)
      {
        if (*((_DWORD *)v25 + 6) == 2)
        {
          if ((*((_WORD *)v25 + 15) & 0x400) == 0)
            WebCore::Node::removedLastRef(v25);
        }
        else
        {
          *((_DWORD *)v25 + 6) -= 2;
        }
      }
      v30 = WebCore::VisiblePosition::characterAfter((WebCore::VisiblePosition *)&v122);
      if (_MergedGlobals_15 == 1)
      {
        Predefined = (const __CFCharacterSet *)qword_1ECEC9878;
      }
      else
      {
        Predefined = CFCharacterSetGetPredefined(kCFCharacterSetAlphaNumeric);
        qword_1ECEC9878 = (uint64_t)Predefined;
        _MergedGlobals_15 = 1;
      }
      if (CFCharacterSetIsCharacterMember(Predefined, v30))
      {
        if (_MergedGlobals_15 == 1)
        {
          v32 = (const __CFCharacterSet *)qword_1ECEC9878;
        }
        else
        {
          v32 = CFCharacterSetGetPredefined(kCFCharacterSetAlphaNumeric);
          qword_1ECEC9878 = (uint64_t)v32;
          _MergedGlobals_15 = 1;
        }
        if (!CFCharacterSetIsCharacterMember(v32, v24))
        {
LABEL_55:
          v22 = v122;
          v122 = 0;
          v88 = v123;
          v89 = v124;
          v23 = v125;
          goto LABEL_167;
        }
      }
      if (_MergedGlobals_15 == 1)
      {
        v33 = (const __CFCharacterSet *)qword_1ECEC9878;
      }
      else
      {
        v33 = CFCharacterSetGetPredefined(kCFCharacterSetAlphaNumeric);
        qword_1ECEC9878 = (uint64_t)v33;
        _MergedGlobals_15 = 1;
      }
      if (CFCharacterSetIsCharacterMember(v33, v24))
      {
        if (_MergedGlobals_15 == 1)
        {
          v34 = (const __CFCharacterSet *)qword_1ECEC9878;
        }
        else
        {
          v34 = CFCharacterSetGetPredefined(kCFCharacterSetAlphaNumeric);
          qword_1ECEC9878 = (uint64_t)v34;
          _MergedGlobals_15 = 1;
        }
        if (!CFCharacterSetIsCharacterMember(v34, v30))
        {
          WebCore::VisiblePosition::next();
          v35 = v94;
          v94 = 0;
          v36 = v122;
          v122 = v35;
          if (!v36)
          {
LABEL_111:
            v123 = v95;
            v124 = v96;
            v125 = v97;
            goto LABEL_112;
          }
          if (*((_DWORD *)v36 + 6) != 2)
          {
            *((_DWORD *)v36 + 6) -= 2;
            goto LABEL_111;
          }
          if ((*((_WORD *)v36 + 15) & 0x400) != 0)
            goto LABEL_111;
          WebCore::Node::removedLastRef(v36);
          v44 = v94;
          v123 = v95;
          v124 = v96;
          v125 = v97;
          v94 = 0;
          if (v44)
          {
            if (*((_DWORD *)v44 + 6) == 2)
            {
              if ((*((_WORD *)v44 + 15) & 0x400) == 0)
                WebCore::Node::removedLastRef(v44);
            }
            else
            {
              *((_DWORD *)v44 + 6) -= 2;
            }
          }
        }
      }
LABEL_112:
      WebCore::startOfWord();
      if (WebCore::operator==((uint64_t)&v94, (uint64_t)&v118))
      {
        WebCore::endOfWord();
        v46 = v114;
        if (v114)
          *((_DWORD *)v114 + 6) += 2;
        v47 = v122;
        v122 = v46;
        if (v47)
        {
          if (*((_DWORD *)v47 + 6) == 2)
          {
            if ((*((_WORD *)v47 + 15) & 0x400) == 0)
            {
              WebCore::Node::removedLastRef(v47);
              v46 = v122;
            }
          }
          else
          {
            *((_DWORD *)v47 + 6) -= 2;
          }
        }
        v123 = v115;
        v124 = v116;
        v125 = v117;
        if (v46)
          v48 = WTF::RefPtr<WebCore::Node,WTF::RawPtrTraits<WebCore::Node>,WTF::DefaultRefDerefTraits<WebCore::Node>>::unspecifiedBoolTypeInstance;
        else
          v48 = 0;
        if (v48)
        {
          do
          {
            if ((WebCore::isStartOfLine((WebCore *)&v122, v45) & 1) != 0
              || (WebCore::isEndOfLine((WebCore *)&v122, v49) & 1) != 0
              || WebCore::operator==((uint64_t)&v122, (uint64_t)&v102))
            {
              break;
            }
            v50 = WebCore::VisiblePosition::characterAfter((WebCore::VisiblePosition *)&v122);
            if (_MergedGlobals_15 == 1)
            {
              v51 = (const __CFCharacterSet *)qword_1ECEC9878;
            }
            else
            {
              v51 = CFCharacterSetGetPredefined(kCFCharacterSetAlphaNumeric);
              qword_1ECEC9878 = (uint64_t)v51;
              _MergedGlobals_15 = 1;
            }
            if (CFCharacterSetIsCharacterMember(v51, v50))
              break;
            WebCore::VisiblePosition::next();
            v52 = v110;
            v110 = 0;
            v53 = v122;
            v122 = v52;
            if (v53)
            {
              if (*((_DWORD *)v53 + 6) == 2)
              {
                if ((*((_WORD *)v53 + 15) & 0x400) == 0)
                {
                  WebCore::Node::removedLastRef(v53);
                  v54 = v110;
                  v123 = v111;
                  v124 = v112;
                  v125 = v113;
                  v110 = 0;
                  if (v54)
                  {
                    if (*((_DWORD *)v54 + 6) == 2)
                    {
                      if ((*((_WORD *)v54 + 15) & 0x400) == 0)
                        WebCore::Node::removedLastRef(v54);
                    }
                    else
                    {
                      *((_DWORD *)v54 + 6) -= 2;
                    }
                  }
                  goto LABEL_139;
                }
              }
              else
              {
                *((_DWORD *)v53 + 6) -= 2;
              }
            }
            v123 = v111;
            v124 = v112;
            v125 = v113;
LABEL_139:
            if (v122)
              v55 = WTF::RefPtr<WebCore::Node,WTF::RawPtrTraits<WebCore::Node>,WTF::DefaultRefDerefTraits<WebCore::Node>>::unspecifiedBoolTypeInstance;
            else
              v55 = 0;
          }
          while (v55);
        }
        if (WebCore::operator==((uint64_t)&v122, (uint64_t)&v102))
        {
          v56 = v94;
          if (v94)
            *((_DWORD *)v94 + 6) += 2;
          v57 = v122;
          v122 = v56;
          if (v57)
          {
            if (*((_DWORD *)v57 + 6) == 2)
            {
              if ((*((_WORD *)v57 + 15) & 0x400) == 0)
                WebCore::Node::removedLastRef(v57);
            }
            else
            {
              *((_DWORD *)v57 + 6) -= 2;
            }
          }
          v123 = v95;
          v124 = v96;
          v23 = v97;
          v125 = v97;
        }
        else
        {
          v23 = v125;
        }
        v22 = v122;
        v122 = 0;
        v88 = v123;
        v89 = v124;
        v58 = v114;
        v114 = 0;
        if (v58)
        {
          if (*((_DWORD *)v58 + 6) == 2)
          {
            if ((*((_WORD *)v58 + 15) & 0x400) == 0)
              WebCore::Node::removedLastRef(v58);
          }
          else
          {
            *((_DWORD *)v58 + 6) -= 2;
          }
        }
        v59 = v94;
        v94 = 0;
        if (v59)
        {
          if (*((_DWORD *)v59 + 6) == 2)
          {
            if ((*((_WORD *)v59 + 15) & 0x400) == 0)
              WebCore::Node::removedLastRef(v59);
          }
          else
          {
            *((_DWORD *)v59 + 6) -= 2;
          }
        }
      }
      else
      {
        v22 = v94;
        v88 = v95;
        v89 = v96;
        v23 = v97;
      }
LABEL_167:
      v60 = v118;
      v118 = 0;
      if (v60)
      {
        if (*((_DWORD *)v60 + 6) == 2)
        {
          if ((*((_WORD *)v60 + 15) & 0x400) == 0)
            WebCore::Node::removedLastRef(v60);
        }
        else
        {
          *((_DWORD *)v60 + 6) -= 2;
        }
      }
      v61 = v122;
      v122 = 0;
      if (v61)
      {
        if (*((_DWORD *)v61 + 6) == 2)
        {
          if ((*((_WORD *)v61 + 15) & 0x400) == 0)
            WebCore::Node::removedLastRef(v61);
        }
        else
        {
          *((_DWORD *)v61 + 6) -= 2;
        }
      }
      v62 = v90;
      v90 = v22;
      if (!v62)
        goto LABEL_267;
      v63 = *((_DWORD *)v62 + 6) - 2;
      if (*((_DWORD *)v62 + 6) != 2)
        goto LABEL_179;
      goto LABEL_265;
    }
    v18 = v102;
    if (v102)
      *((_DWORD *)v102 + 6) += 2;
    v122 = v18;
    v123 = v103;
    v124 = v104;
    v125 = v105;
    v118 = 0;
    v119 = 0;
    v120 = 0;
    v121 = 1;
    if (v100)
    {
      WebCore::VisiblePosition::VisiblePosition();
      v19 = v94;
      v94 = 0;
      v20 = v118;
      v118 = v19;
      if (!v20)
      {
LABEL_63:
        v119 = v95;
        v120 = v96;
        v121 = v97;
        goto LABEL_64;
      }
      if (*((_DWORD *)v20 + 6) != 2)
      {
        *((_DWORD *)v20 + 6) -= 2;
        goto LABEL_63;
      }
      if ((*((_WORD *)v20 + 15) & 0x400) != 0)
        goto LABEL_63;
      WebCore::Node::removedLastRef(v20);
      v26 = v94;
      v119 = v95;
      v120 = v96;
      v121 = v97;
      v94 = 0;
      if (v26)
      {
        if (*((_DWORD *)v26 + 6) == 2)
        {
          if ((*((_WORD *)v26 + 15) & 0x400) == 0)
            WebCore::Node::removedLastRef(v26);
        }
        else
        {
          *((_DWORD *)v26 + 6) -= 2;
        }
      }
    }
LABEL_64:
    if (WebCore::operator==((uint64_t)&v118, (uint64_t)&v102))
      goto LABEL_65;
    WebCore::VisiblePosition::previous();
    v28 = WebCore::VisiblePosition::characterAfter((WebCore::VisiblePosition *)&v94);
    v29 = v94;
    v94 = 0;
    if (v29)
    {
      if (*((_DWORD *)v29 + 6) == 2)
      {
        if ((*((_WORD *)v29 + 15) & 0x400) == 0)
          WebCore::Node::removedLastRef(v29);
      }
      else
      {
        *((_DWORD *)v29 + 6) -= 2;
      }
    }
    v37 = WebCore::VisiblePosition::characterAfter((WebCore::VisiblePosition *)&v122);
    if (_MergedGlobals_15 == 1)
    {
      v38 = (const __CFCharacterSet *)qword_1ECEC9878;
    }
    else
    {
      v38 = CFCharacterSetGetPredefined(kCFCharacterSetAlphaNumeric);
      qword_1ECEC9878 = (uint64_t)v38;
      _MergedGlobals_15 = 1;
    }
    if (CFCharacterSetIsCharacterMember(v38, v28))
    {
      if (_MergedGlobals_15 == 1)
      {
        v39 = (const __CFCharacterSet *)qword_1ECEC9878;
      }
      else
      {
        v39 = CFCharacterSetGetPredefined(kCFCharacterSetAlphaNumeric);
        qword_1ECEC9878 = (uint64_t)v39;
        _MergedGlobals_15 = 1;
      }
      if (!CFCharacterSetIsCharacterMember(v39, v37))
      {
LABEL_65:
        v27 = v122;
        v122 = 0;
        v88 = v123;
        v89 = v124;
        v23 = v125;
        goto LABEL_253;
      }
    }
    if (_MergedGlobals_15 == 1)
    {
      v40 = (const __CFCharacterSet *)qword_1ECEC9878;
    }
    else
    {
      v40 = CFCharacterSetGetPredefined(kCFCharacterSetAlphaNumeric);
      qword_1ECEC9878 = (uint64_t)v40;
      _MergedGlobals_15 = 1;
    }
    if (CFCharacterSetIsCharacterMember(v40, v28))
      goto LABEL_185;
    if (_MergedGlobals_15 == 1)
    {
      v41 = (const __CFCharacterSet *)qword_1ECEC9878;
    }
    else
    {
      v41 = CFCharacterSetGetPredefined(kCFCharacterSetAlphaNumeric);
      qword_1ECEC9878 = (uint64_t)v41;
      _MergedGlobals_15 = 1;
    }
    if (!CFCharacterSetIsCharacterMember(v41, v37))
      goto LABEL_185;
    WebCore::VisiblePosition::previous();
    v42 = v94;
    v94 = 0;
    v43 = v122;
    v122 = v42;
    if (v43)
    {
      if (*((_DWORD *)v43 + 6) == 2)
      {
        if ((*((_WORD *)v43 + 15) & 0x400) == 0)
        {
          WebCore::Node::removedLastRef(v43);
          v64 = v94;
          v123 = v95;
          v124 = v96;
          v125 = v97;
          v94 = 0;
          if (v64)
          {
            if (*((_DWORD *)v64 + 6) == 2)
            {
              if ((*((_WORD *)v64 + 15) & 0x400) == 0)
                WebCore::Node::removedLastRef(v64);
            }
            else
            {
              *((_DWORD *)v64 + 6) -= 2;
            }
          }
          goto LABEL_185;
        }
      }
      else
      {
        *((_DWORD *)v43 + 6) -= 2;
      }
    }
    v123 = v95;
    v124 = v96;
    v125 = v97;
LABEL_185:
    WebCore::endOfWord();
    if (!WebCore::operator==((uint64_t)&v114, (uint64_t)&v118))
    {
      WebCore::VisiblePosition::previous();
      v65 = WebCore::VisiblePosition::characterAfter((WebCore::VisiblePosition *)&v94);
      v66 = v94;
      v94 = 0;
      if (v66)
      {
        if (*((_DWORD *)v66 + 6) == 2)
        {
          if ((*((_WORD *)v66 + 15) & 0x400) == 0)
            WebCore::Node::removedLastRef(v66);
        }
        else
        {
          *((_DWORD *)v66 + 6) -= 2;
        }
      }
      if (_MergedGlobals_15 == 1)
      {
        v67 = (const __CFCharacterSet *)qword_1ECEC9878;
      }
      else
      {
        v67 = CFCharacterSetGetPredefined(kCFCharacterSetAlphaNumeric);
        qword_1ECEC9878 = (uint64_t)v67;
        _MergedGlobals_15 = 1;
      }
      if (CFCharacterSetIsCharacterMember(v67, v65))
      {
        v27 = v114;
        v88 = v115;
        v89 = v116;
        v23 = v117;
        goto LABEL_253;
      }
    }
    WebCore::startOfWord();
    v69 = v110;
    if (v110)
      *((_DWORD *)v110 + 6) += 2;
    v70 = v122;
    v122 = v69;
    if (v70)
    {
      if (*((_DWORD *)v70 + 6) == 2)
      {
        if ((*((_WORD *)v70 + 15) & 0x400) == 0)
        {
          WebCore::Node::removedLastRef(v70);
          v69 = v122;
        }
      }
      else
      {
        *((_DWORD *)v70 + 6) -= 2;
      }
    }
    v123 = v111;
    v124 = v112;
    v125 = v113;
    if (v69)
      v71 = WTF::RefPtr<WebCore::Node,WTF::RawPtrTraits<WebCore::Node>,WTF::DefaultRefDerefTraits<WebCore::Node>>::unspecifiedBoolTypeInstance;
    else
      v71 = 0;
    if (!v71)
    {
LABEL_233:
      if (WebCore::operator==((uint64_t)&v122, (uint64_t)&v106))
      {
        v80 = v114;
        if (v114)
          *((_DWORD *)v114 + 6) += 2;
        v81 = v122;
        v122 = v80;
        if (v81)
        {
          if (*((_DWORD *)v81 + 6) == 2)
          {
            if ((*((_WORD *)v81 + 15) & 0x400) == 0)
              WebCore::Node::removedLastRef(v81);
          }
          else
          {
            *((_DWORD *)v81 + 6) -= 2;
          }
        }
        v123 = v115;
        v124 = v116;
        v23 = v117;
        v125 = v117;
      }
      else
      {
        v23 = v125;
      }
      v27 = v122;
      v122 = 0;
      v88 = v123;
      v89 = v124;
      v82 = v110;
      v110 = 0;
      if (v82)
      {
        if (*((_DWORD *)v82 + 6) == 2)
        {
          if ((*((_WORD *)v82 + 15) & 0x400) == 0)
            WebCore::Node::removedLastRef(v82);
        }
        else
        {
          *((_DWORD *)v82 + 6) -= 2;
        }
      }
      v83 = v114;
      v114 = 0;
      if (v83)
      {
        if (*((_DWORD *)v83 + 6) == 2)
        {
          if ((*((_WORD *)v83 + 15) & 0x400) == 0)
            WebCore::Node::removedLastRef(v83);
        }
        else
        {
          *((_DWORD *)v83 + 6) -= 2;
        }
      }
LABEL_253:
      v84 = v118;
      v118 = 0;
      if (v84)
      {
        if (*((_DWORD *)v84 + 6) == 2)
        {
          if ((*((_WORD *)v84 + 15) & 0x400) == 0)
            WebCore::Node::removedLastRef(v84);
        }
        else
        {
          *((_DWORD *)v84 + 6) -= 2;
        }
      }
      v85 = v122;
      v122 = 0;
      if (v85)
      {
        if (*((_DWORD *)v85 + 6) == 2)
        {
          if ((*((_WORD *)v85 + 15) & 0x400) == 0)
            WebCore::Node::removedLastRef(v85);
        }
        else
        {
          *((_DWORD *)v85 + 6) -= 2;
        }
      }
      v62 = v90;
      v90 = v27;
      if (!v62)
        goto LABEL_267;
      v63 = *((_DWORD *)v62 + 6) - 2;
      if (*((_DWORD *)v62 + 6) != 2)
      {
LABEL_179:
        *((_DWORD *)v62 + 6) = v63;
LABEL_267:
        v91 = v88;
        v92 = v89;
        v93 = v23;
        if (v90)
          v86 = WTF::RefPtr<WebCore::Node,WTF::RawPtrTraits<WebCore::Node>,WTF::DefaultRefDerefTraits<WebCore::Node>>::unspecifiedBoolTypeInstance;
        else
          v86 = 0;
        if (v86 && !WebCore::operator==((uint64_t)&v90, (uint64_t)v98))
          WebCore::FrameSelection::moveTo();
        v87 = v90;
        v90 = 0;
        if (v87)
        {
          if (*((_DWORD *)v87 + 6) == 2)
          {
            if ((*((_WORD *)v87 + 15) & 0x400) == 0)
              WebCore::Node::removedLastRef(v87);
          }
          else
          {
            *((_DWORD *)v87 + 6) -= 2;
          }
        }
        WebCore::VisibleSelection::~VisibleSelection((WebCore::VisibleSelection *)v99);
LABEL_6:
        v8 = v98[0];
        v98[0] = 0;
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
        goto LABEL_11;
      }
LABEL_265:
      if ((*((_WORD *)v62 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v62);
      goto LABEL_267;
    }
    while (1)
    {
      if ((WebCore::isStartOfLine((WebCore *)&v122, v68) & 1) != 0
        || (WebCore::isEndOfLine((WebCore *)&v122, v72) & 1) != 0
        || WebCore::operator==((uint64_t)&v122, (uint64_t)&v106))
      {
        goto LABEL_233;
      }
      WebCore::VisiblePosition::previous();
      v73 = WebCore::VisiblePosition::characterAfter((WebCore::VisiblePosition *)&v94);
      v74 = v94;
      v94 = 0;
      if (v74)
      {
        if (*((_DWORD *)v74 + 6) == 2)
        {
          if ((*((_WORD *)v74 + 15) & 0x400) == 0)
            WebCore::Node::removedLastRef(v74);
        }
        else
        {
          *((_DWORD *)v74 + 6) -= 2;
        }
      }
      if (_MergedGlobals_15 == 1)
      {
        v75 = (const __CFCharacterSet *)qword_1ECEC9878;
      }
      else
      {
        v75 = CFCharacterSetGetPredefined(kCFCharacterSetAlphaNumeric);
        qword_1ECEC9878 = (uint64_t)v75;
        _MergedGlobals_15 = 1;
      }
      if (CFCharacterSetIsCharacterMember(v75, v73))
        goto LABEL_233;
      WebCore::VisiblePosition::previous();
      v76 = v94;
      v94 = 0;
      v77 = v122;
      v122 = v76;
      if (v77)
      {
        if (*((_DWORD *)v77 + 6) == 2)
        {
          if ((*((_WORD *)v77 + 15) & 0x400) == 0)
          {
            WebCore::Node::removedLastRef(v77);
            v78 = v94;
            v123 = v95;
            v124 = v96;
            v125 = v97;
            v94 = 0;
            if (v78)
            {
              if (*((_DWORD *)v78 + 6) == 2)
              {
                if ((*((_WORD *)v78 + 15) & 0x400) == 0)
                  WebCore::Node::removedLastRef(v78);
              }
              else
              {
                *((_DWORD *)v78 + 6) -= 2;
              }
            }
            goto LABEL_225;
          }
        }
        else
        {
          *((_DWORD *)v77 + 6) -= 2;
        }
      }
      v123 = v95;
      v124 = v96;
      v125 = v97;
LABEL_225:
      if (v122)
        v79 = WTF::RefPtr<WebCore::Node,WTF::RawPtrTraits<WebCore::Node>,WTF::DefaultRefDerefTraits<WebCore::Node>>::unspecifiedBoolTypeInstance;
      else
        v79 = 0;
      if (!v79)
        goto LABEL_233;
    }
  }
LABEL_11:
  v9 = v101[0];
  v101[0] = 0;
  if (v9)
  {
    if (*(_DWORD *)(v9 + 24) == 2)
    {
      if ((*(_WORD *)(v9 + 30) & 0x400) == 0)
        WebCore::Node::removedLastRef((WebCore::Node *)v9);
    }
    else
    {
      *(_DWORD *)(v9 + 24) -= 2;
    }
  }
  v10 = v102;
  v102 = 0;
  if (v10)
  {
    if (*((_DWORD *)v10 + 6) == 2)
    {
      if ((*((_WORD *)v10 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v10);
    }
    else
    {
      *((_DWORD *)v10 + 6) -= 2;
    }
  }
  v11 = v106;
  v106 = 0;
  if (v11)
  {
    if (*((_DWORD *)v11 + 6) == 2)
    {
      if ((*((_WORD *)v11 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v11);
    }
    else
    {
      *((_DWORD *)v11 + 6) -= 2;
    }
  }
}

- (id)startPosition
{
  WebCore **v2;
  const Node *v3;
  id v4;
  WebCore::Node *v5;
  WebCore::Node *v7;

  v2 = -[WebFrame coreFrame](self, "coreFrame");
  WebCore::startOfDocument(v2[37], v3);
  v4 = +[WebVisiblePosition _wrapVisiblePosition:](WebVisiblePosition, "_wrapVisiblePosition:", &v7);
  v5 = v7;
  v7 = 0;
  if (!v5)
    return v4;
  if (*((_DWORD *)v5 + 6) != 2)
  {
    *((_DWORD *)v5 + 6) -= 2;
    return v4;
  }
  if ((*((_WORD *)v5 + 15) & 0x400) != 0)
    return v4;
  WebCore::Node::removedLastRef(v5);
  return v4;
}

- (id)endPosition
{
  WebCore **v2;
  const Node *v3;
  id v4;
  WebCore::Node *v5;
  WebCore::Node *v7;

  v2 = -[WebFrame coreFrame](self, "coreFrame");
  WebCore::endOfDocument(v2[37], v3);
  v4 = +[WebVisiblePosition _wrapVisiblePosition:](WebVisiblePosition, "_wrapVisiblePosition:", &v7);
  v5 = v7;
  v7 = 0;
  if (!v5)
    return v4;
  if (*((_DWORD *)v5 + 6) != 2)
  {
    *((_DWORD *)v5 + 6) -= 2;
    return v4;
  }
  if ((*((_WORD *)v5 + 15) & 0x400) != 0)
    return v4;
  WebCore::Node::removedLastRef(v5);
  return v4;
}

- (BOOL)renderedCharactersExceed:(unint64_t)a3
{
  return WebCore::LocalFrameView::renderedCharactersExceed(*(WebCore::LocalFrameView **)(-[WebFrame coreFrame](self, "coreFrame")+ 288));
}

- (CGRect)elementRectAtPoint:(CGPoint)a3
{
  WebCore::ScrollView *v3;
  float v4;
  uint64_t v5;
  uint64_t v6;
  float v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  int8x8_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[9];
  uint64_t v29;
  CGPoint v30;
  CGRect result;

  v30 = a3;
  v3 = *(WebCore::ScrollView **)(-[WebFrame coreFrame](self, "coreFrame") + 288);
  WebCore::FloatPoint::FloatPoint((WebCore::FloatPoint *)&v26, &v30);
  v4 = roundf(*(float *)&v26);
  v5 = 0x7FFFFFFFLL;
  v6 = (int)v4;
  if (v4 <= -2147500000.0)
    v6 = 0x80000000;
  if (v4 < 2147500000.0)
    v5 = v6;
  v7 = roundf(*((float *)&v26 + 1));
  v8 = 0x7FFFFFFF00000000;
  v9 = 0x8000000000000000;
  if (v7 > -2147500000.0)
    v9 = (unint64_t)(int)v7 << 32;
  if (v7 < 2147500000.0)
    v8 = v9;
  v28[0] = v8 | v5;
  v10 = WebCore::ScrollView::windowToContents(v3, (const WebCore::IntPoint *)v28);
  v11 = (int8x8_t)vcgt_s32((int32x2_t)v10, (int32x2_t)0xFE000000FE000000);
  v26 = (uint64_t)vorr_s8((int8x8_t)(*(_QWORD *)&v11 & 0x7FFFFFFF7FFFFFFFLL), vbic_s8(vbsl_s8((int8x8_t)vcgt_s32((int32x2_t)0xFE000000FE000000, (int32x2_t)v10), (int8x8_t)0x8000000080000000, (int8x8_t)vshl_n_s32((int32x2_t)v10, 6uLL)), v11));
  WebCore::EventHandler::hitTestResultAtPoint();
  v12 = v29;
  if (v29 && (*(_QWORD *)(v29 + 64) & 0xFFFFFFFFFFFFLL) != 0)
  {
    WebCore::HitTestResult::innerNodeFrame((WebCore::HitTestResult *)v28);
    WebCore::RenderObject::absoluteBoundingBoxRect((WebCore::RenderObject *)(*(_QWORD *)(v12 + 64) & 0xFFFFFFFFFFFFLL), 1, 0);
    v26 = WebCore::ScrollView::contentsToWindow();
    v27 = v13;
    WebCore::IntRect::operator CGRect();
  }
  else
  {
    v26 = 0;
    v27 = 0;
    WebCore::IntRect::operator CGRect();
  }
  v18 = v14;
  v19 = v15;
  v20 = v16;
  v21 = v17;
  MEMORY[0x1D82A4430](v28);
  v22 = v18;
  v23 = v19;
  v24 = v20;
  v25 = v21;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

@end
