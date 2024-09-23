@implementation WebFrameView

- (float)_verticalKeyboardScrollDistance
{
  float result;

  objc_msgSend(-[WebFrameView _scrollView](self, "_scrollView"), "verticalLineScroll");
  return result;
}

- (NakedPtr<WebCore::LocalFrame>)_web_frame
{
  WebFrame **v2;
  WebFrame *webFrame;

  webFrame = self->_private->webFrame;
  if (webFrame)
    webFrame = (WebFrame *)webFrame->_private->coreFrame.m_ptr;
  *v2 = webFrame;
  return (NakedPtr<WebCore::LocalFrame>)self;
}

- (id)_webView
{
  return -[WebFrame webView](self->_private->webFrame, "webView");
}

- (void)_setDocumentView:(id)a3
{
  id v5;
  LocalFrame *m_ptr;
  uint64_t v7;

  v5 = -[WebFrameView _scrollView](self, "_scrollView");
  objc_msgSend(-[WebFrameView _webView](self, "_webView"), "page");
  *(_BYTE *)(*(_QWORD *)(v7 + 64) + 47) = 0;
  objc_msgSend(v5, "setDocumentView:", a3);
  m_ptr = self->_private->webFrame->_private->coreFrame.m_ptr;
  if (m_ptr == *(LocalFrame **)(*(_QWORD *)(*((_QWORD *)m_ptr + 3) + 8) + 160))
    objc_msgSend((id)-[WebFrameView window](self, "window"), "makeFirstResponder:", -[WebFrameView documentView](self, "documentView"));
}

- (id)_makeDocumentViewForDataSource:(id)a3
{
  uint64_t v5;
  const __CFString *v6;
  objc_class *v7;
  objc_class *v8;
  uint64_t v9;
  id v10;

  v5 = objc_msgSend(a3, "_responseMIMEType");
  if (v5)
    v6 = (const __CFString *)v5;
  else
    v6 = CFSTR("text/html");
  v7 = -[WebFrameView _viewClassForMIMEType:](self, "_viewClassForMIMEType:", v6);
  if (v7)
  {
    v8 = v7;
    v9 = objc_msgSend(a3, "representation");
    if (v9 && (v10 = (id)v9, (objc_class *)objc_opt_class() == v8))
      CFRetain(v10);
    else
      v10 = objc_alloc_init(v8);
  }
  else
  {
    v10 = 0;
  }
  -[WebFrameView _setDocumentView:](self, "_setDocumentView:", v10);
  return (id)(id)CFMakeCollectable(v10);
}

- (void)_setWebFrame:(id)a3
{
  NSView *v5;

  if (!a3)
  {
    v5 = -[WebFrameView documentView](self, "documentView");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[NSView performSelector:](v5, "performSelector:", sel_close);
  }
  self->_private->webFrame = (WebFrame *)a3;
  if (!self->_private->includedInWebKitStatistics)
  {
    if (objc_msgSend(a3, "_isIncludedInWebKitStatistics"))
    {
      self->_private->includedInWebKitStatistics = 1;
      ++WebFrameViewCount;
    }
  }
}

- (id)_scrollView
{
  WebFrameViewPrivate *v2;

  v2 = self->_private;
  if (v2)
    return v2->frameScrollView.m_ptr;
  else
    return 0;
}

- (float)_verticalPageScrollDistance
{
  WebCore::Scrollbar *v2;
  double v3;
  float v4;
  float result;

  v2 = (WebCore::Scrollbar *)objc_msgSend(-[WebFrameView _contentView](self, "_contentView"), "bounds");
  v4 = v3;
  result = v4 - (float)(int)WebCore::Scrollbar::maxOverlapBetweenPages(v2);
  if ((float)(v4 * 0.8) >= result)
    return v4 * 0.8;
  return result;
}

+ (id)_viewTypesAllowImageTypeOmission:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  if (byte_1ECEC9792 == 1)
  {
    v4 = (void *)qword_1ECEC97A0;
    if ((byte_1ECEC9793 & 1) != 0)
      return v4;
  }
  else
  {
    +[WebFrameView(WebInternal) _viewTypesAllowImageTypeOmission:]::$_6::operator()(&v10);
    v4 = (void *)v10;
    qword_1ECEC97A0 = v10;
    byte_1ECEC9792 = 1;
    if ((byte_1ECEC9793 & 1) != 0)
      return v4;
  }
  if (!a3)
  {
    v5 = objc_opt_class();
    v6 = (void *)objc_msgSend(+[WebHTMLView supportedImageMIMETypes](WebHTMLView, "supportedImageMIMETypes"), "objectEnumerator");
    v7 = objc_msgSend(v6, "nextObject");
    if (v7)
    {
      v8 = v7;
      do
      {
        if (!objc_msgSend(v4, "objectForKey:", v8))
          objc_msgSend(v4, "setObject:forKey:", v5, v8);
        v8 = objc_msgSend(v6, "nextObject");
      }
      while (v8);
    }
    byte_1ECEC9793 = 1;
    return (id)qword_1ECEC97A0;
  }
  return v4;
}

+ (BOOL)_canShowMIMETypeAsHTML:(id)a3
{
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "_viewTypesAllowImageTypeOmission:", 1), "_webkit_objectForMIMEType:", a3), "isSubclassOfClass:", objc_opt_class());
}

+ (Class)_viewClassForMIMEType:(id)a3 allowingPlugins:(BOOL)a4
{
  objc_class *v5;

  v5 = 0;
  if (+[WebView _viewClass:andRepresentationClass:forMIMEType:allowingPlugins:](WebView, "_viewClass:andRepresentationClass:forMIMEType:allowingPlugins:", &v5, 0, a3, a4))
  {
    return v5;
  }
  else
  {
    return 0;
  }
}

- (Class)_viewClassForMIMEType:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "_viewClassForMIMEType:allowingPlugins:", a3, 0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (Class)objc_msgSend(v4, "_representationClassForWebFrame:", -[WebFrameView webFrame](self, "webFrame"));
  else
    return (Class)v4;
}

- (void)_install
{
  WebFrameViewPrivate *v2;
  LocalFrame *m_ptr;
  WebCore::Widget *v4;

  v2 = self->_private;
  m_ptr = v2->webFrame->_private->coreFrame.m_ptr;
  v4 = (WebCore::Widget *)*((_QWORD *)m_ptr + 36);
  WebCore::Widget::setPlatformWidget(v4, (WAKView *)v2->frameScrollView.m_ptr);
  if (!WebCore::Frame::ownerRenderer((WebCore::Frame *)m_ptr))
    goto LABEL_7;
  if (v4)
    ++*((_DWORD *)v4 + 2);
  WebCore::RenderWidget::setWidget();
  if (!v4)
    goto LABEL_7;
  if (*((_DWORD *)v4 + 2) != 1)
  {
    --*((_DWORD *)v4 + 2);
LABEL_7:
    WebCore::LocalFrameView::updateCanHaveScrollbars(v4);
    return;
  }
  (*(void (**)(WebCore::Widget *))(*(_QWORD *)v4 + 8))(v4);
  WebCore::LocalFrameView::updateCanHaveScrollbars(v4);
}

- (void)_frameSizeChanged
{
  uint64_t v3;

  if (-[WebView drawsBackground](-[WebFrame webView](-[WebFrameView webFrame](self, "webFrame"), "webView"), "drawsBackground"))
  {
    objc_msgSend(-[WebFrameView _scrollView](self, "_scrollView"), "setDrawsBackground:", 1);
  }
  if (self)
  {
    -[WebFrameView _web_frame](self, "_web_frame");
    if (v3)
    {
      if (*(_QWORD *)(v3 + 288))
        WebCore::LocalFrameView::availableContentSizeChanged();
    }
  }
}

- (WebFrameView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  WebFrameView *v5;
  void *v6;
  void *v7;
  WebFrameViewPrivate *v8;
  void *m_ptr;
  double v10;
  objc_super v12;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  v13.receiver = self;
  v13.super_class = (Class)WebFrameView;
  v5 = -[WebFrameView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  if (v5)
  {
    if ((-[WebFrameView initWithFrame:]::didFirstTimeInitialization & 1) == 0)
      -[WebFrameView initWithFrame:]::didFirstTimeInitialization = 1;
    v5->_private = objc_alloc_init(WebFrameViewPrivate);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DCDD60]), "initWithFrame:", 0.0, 0.0, width, height);
    v7 = v6;
    v8 = v5->_private;
    if (v6)
      CFRetain(v6);
    m_ptr = v8->frameScrollView.m_ptr;
    v8->frameScrollView.m_ptr = v7;
    if (m_ptr)
      CFRelease(m_ptr);
    objc_msgSend(v7, "setDelegate:", v5);
    objc_msgSend(v7, "setDrawsBackground:", 0);
    objc_msgSend(v7, "setHasVerticalScroller:", 0);
    objc_msgSend(v7, "setHasHorizontalScroller:", 0);
    objc_msgSend(v7, "setAutoresizingMask:", 18);
    LODWORD(v10) = 1109393408;
    objc_msgSend(v7, "setLineScroll:", v10);
    -[WebFrameView addSubview:](v5, "addSubview:", v7);
    v12.receiver = v5;
    v12.super_class = (Class)WebFrameView;
    -[WebFrameView setNextKeyView:](&v12, sel_setNextKeyView_, v7);
    if (v7)
      CFRelease(v7);
  }
  return v5;
}

- (void)dealloc
{
  WebFrameViewPrivate *v3;
  objc_super v4;

  v3 = self->_private;
  if (v3 && v3->includedInWebKitStatistics)
    --WebFrameViewCount;

  self->_private = 0;
  v4.receiver = self;
  v4.super_class = (Class)WebFrameView;
  -[WebFrameView dealloc](&v4, sel_dealloc);
}

- (BOOL)scrollView:(id)a3 shouldScrollToPoint:(CGPoint)a4
{
  double y;
  double x;
  id v7;

  y = a4.y;
  x = a4.x;
  v7 = -[WebFrameView _webView](self, "_webView", a3);
  return objc_msgSend((id)objc_msgSend(v7, "_UIKitDelegateForwarder"), "webView:shouldScrollToPoint:forFrame:", v7, self->_private->webFrame, x, y);
}

- (WebFrame)webFrame
{
  WebFrameViewPrivate *v2;

  v2 = self->_private;
  if (v2)
    return v2->webFrame;
  else
    return 0;
}

- (void)setAllowsScrolling:(BOOL)allowsScrolling
{
  WebFrame *v3;
  LocalFrame *m_ptr;
  WebCore::LocalFrameView *v5;

  v3 = -[WebFrameView webFrame](self, "webFrame");
  if (v3)
  {
    m_ptr = v3->_private->coreFrame.m_ptr;
    if (m_ptr)
    {
      v5 = (WebCore::LocalFrameView *)*((_QWORD *)m_ptr + 36);
      if (v5)
        WebCore::LocalFrameView::setCanHaveScrollbars(v5);
    }
  }
}

- (BOOL)allowsScrolling
{
  WebFrame *v2;
  LocalFrame *m_ptr;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  BOOL result;

  v2 = -[WebFrameView webFrame](self, "webFrame");
  result = !v2
        || (m_ptr = v2->_private->coreFrame.m_ptr) == 0
        || (v4 = *((_QWORD *)m_ptr + 36)) == 0
        || (v6 = *(_QWORD *)(v4 + 64), v5 = v4 + 64, (*(unsigned int (**)(uint64_t))(v6 + 144))(v5) != 1)
        || (*(unsigned int (**)(uint64_t))(*(_QWORD *)v5 + 152))(v5) != 1;
  return result;
}

- (NSView)documentView
{
  return (NSView *)objc_msgSend(-[WebFrameView _scrollView](self, "_scrollView"), "documentView");
}

- (BOOL)acceptsFirstResponder
{
  return 1;
}

- (BOOL)becomeFirstResponder
{
  void *v3;
  WebFrameView *v4;
  WebFrameView *v5;
  WebFrameView *v6;

  v3 = (void *)-[WebFrameView window](self, "window");
  if (objc_msgSend(v3, "keyViewSelectionDirection") == 2)
  {
    v4 = (WebFrameView *)-[WebFrameView previousValidKeyView](self, "previousValidKeyView");
    if (v4)
    {
      v5 = v4;
      if (v4 != self)
        goto LABEL_8;
    }
    v6 = -[WebView previousValidKeyView](-[WebFrame webView](-[WebFrameView webFrame](self, "webFrame"), "webView"), "previousValidKeyView");
LABEL_7:
    v5 = v6;
LABEL_8:
    objc_msgSend(v3, "makeFirstResponder:", v5);
    return 1;
  }
  if (objc_msgSend(-[WebFrameView _scrollView](self, "_scrollView"), "acceptsFirstResponder"))
  {
    v6 = -[WebFrameView _scrollView](self, "_scrollView");
    goto LABEL_7;
  }
  return 1;
}

- (void)setNextKeyView:(id)a3
{
  objc_super v5;

  if (-[WebFrameView _scrollView](self, "_scrollView"))
  {
    objc_msgSend(-[WebFrameView _scrollView](self, "_scrollView"), "setNextKeyView:", a3);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)WebFrameView;
    -[WebFrameView setNextKeyView:](&v5, sel_setNextKeyView_, a3);
  }
}

- (BOOL)isOpaque
{
  return objc_msgSend(-[WebFrameView _webView](self, "_webView"), "drawsBackground");
}

- (void)drawRect:(CGRect)a3
{
  double v4;
  CGContext *v5;
  CGColor *color;

  if (!-[WebFrameView documentView](self, "documentView")
    || (-[NSView frame](-[WebFrameView documentView](self, "documentView"), "frame"), v4 == 0.0)
    || -[WebFrame _isCommitting](-[WebFrameView webFrame](self, "webFrame"), "_isCommitting"))
  {
    if (objc_msgSend(-[WebFrameView _webView](self, "_webView"), "drawsBackground"))
    {
      v5 = (CGContext *)WKGetCurrentGraphicsContext();
      WebCore::cachedCGColor();
      CGContextSetFillColorWithColor(v5, color);
      if (color)
        CFRelease(color);
      WKRectFill();
    }
  }
}

- (CGRect)visibleRect
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  objc_super v15;
  objc_super v16;
  NSRect v17;
  objc_super v18;
  NSRect v19;
  NSRect v20;
  CGRect result;
  NSRect v22;

  if (self->_private)
  {
    if (-[WebFrame _getVisibleRect:](-[WebFrameView webFrame](self, "webFrame"), "_getVisibleRect:", &v17))
    {
      if (NSIsEmptyRect(v17)
        || (v15.receiver = self,
            v15.super_class = (Class)WebFrameView,
            -[WebFrameView visibleRect](&v15, sel_visibleRect),
            x = v19.origin.x,
            y = v19.origin.y,
            width = v19.size.width,
            height = v19.size.height,
            NSIsEmptyRect(v19)))
      {
        v7 = *MEMORY[0x1E0CB3438];
        v8 = *(double *)(MEMORY[0x1E0CB3438] + 8);
        v9 = *(double *)(MEMORY[0x1E0CB3438] + 16);
        v10 = *(double *)(MEMORY[0x1E0CB3438] + 24);
      }
      else
      {
        -[WebFrameView frame](self, "frame");
        v20.origin.x = v17.origin.x - v11;
        v14 = v12 + v13;
        v20.size.width = v17.size.width;
        v20.size.height = v17.size.height;
        v20.origin.y = v14 - (v17.origin.y + v17.size.height);
        v17.origin.x = v20.origin.x;
        v17.origin.y = v20.origin.y;
        v22.origin.x = x;
        v22.origin.y = y;
        v22.size.width = width;
        v22.size.height = height;
        *(NSRect *)&v7 = NSIntersectionRect(v20, v22);
      }
    }
    else
    {
      v16.receiver = self;
      v16.super_class = (Class)WebFrameView;
      -[WebFrameView visibleRect](&v16, sel_visibleRect);
    }
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)WebFrameView;
    -[WebFrameView visibleRect](&v18, sel_visibleRect);
  }
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (void)setFrameSize:(CGSize)a3
{
  double height;
  double width;
  objc_super v6;
  NSSize v7;
  NSSize v8;

  height = a3.height;
  width = a3.width;
  -[WebFrameView frame](self, "frame");
  v7.width = width;
  v7.height = height;
  if (!NSEqualSizes(v7, v8))
    -[WebFrameView _frameSizeChanged](self, "_frameSizeChanged");
  v6.receiver = self;
  v6.super_class = (Class)WebFrameView;
  -[WebFrameView setFrameSize:](&v6, sel_setFrameSize_, width, height);
}

- (void)viewDidMoveToWindow
{
  objc_super v3;

  if (self->_private
    && -[WebView drawsBackground](-[WebFrame webView](-[WebFrameView webFrame](self, "webFrame"), "webView"), "drawsBackground"))
  {
    objc_msgSend(-[WebFrameView _scrollView](self, "_scrollView"), "setDrawsBackground:", 1);
  }
  v3.receiver = self;
  v3.super_class = (Class)WebFrameView;
  -[WebFrameView viewDidMoveToWindow](&v3, sel_viewDidMoveToWindow);
}

- (BOOL)_scrollOverflowInDirection:(unsigned __int8)a3 granularity:(unsigned __int8)a4
{
  WebFrame *v5;

  -[WebFrameView documentView](self, "documentView");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v5 = -[WebFrameView webFrame](self, "webFrame")) != 0
    && v5->_private->coreFrame.m_ptr)
  {
    return WebCore::EventHandler::scrollOverflow();
  }
  else
  {
    return 0;
  }
}

- (BOOL)_isVerticalDocument
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  char v5;
  BOOL result;
  uint64_t v7;

  if (!self)
    return 1;
  -[WebFrameView _web_frame](self, "_web_frame");
  if (!v7)
    return 1;
  v2 = *(_QWORD *)(v7 + 296);
  if (!v2)
    return 1;
  v3 = *(_QWORD *)(v2 + 1944);
  if (!v3)
    return 1;
  v4 = (unsigned __int16)*(_DWORD *)(v3 + 124) >> 13;
  v5 = 2;
  switch(v4)
  {
    case 1:
    case 2:
      goto LABEL_10;
    case 3:
    case 5:
      LOBYTE(v4) = 3;
      goto LABEL_10;
    case 4:
      goto LABEL_11;
    default:
      LOBYTE(v4) = 0;
LABEL_10:
      v5 = v4;
LABEL_11:
      result = (v5 & 6) != 2;
      break;
  }
  return result;
}

- (BOOL)_isFlippedDocument
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  int v5;
  uint64_t v7;

  if (self)
  {
    -[WebFrameView _web_frame](self, "_web_frame");
    if (v7 && (v2 = *(_QWORD *)(v7 + 296)) != 0 && (v3 = *(_QWORD *)(v2 + 1944)) != 0)
    {
      v4 = (unsigned __int16)*(_DWORD *)(v3 + 124) >> 13;
      v5 = 2;
      switch(v4)
      {
        case 1:
        case 2:
          goto LABEL_9;
        case 3:
        case 5:
          v4 = 3;
          goto LABEL_9;
        case 4:
          goto LABEL_10;
        default:
          v4 = 0;
LABEL_9:
          v5 = v4;
LABEL_10:
          LOBYTE(self) = (v5 & 0xFFFFFFFD) == 1;
          break;
      }
    }
    else
    {
      LOBYTE(self) = 0;
    }
  }
  return (char)self;
}

- (BOOL)_scrollToBeginningOfDocument
{
  int v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  _QWORD v11[2];

  if (-[WebFrameView _scrollOverflowInDirection:granularity:](self, "_scrollOverflowInDirection:granularity:", 0, 2))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    v3 = -[WebFrameView _isScrollable](self, "_isScrollable");
    if (v3)
    {
      objc_msgSend((id)objc_msgSend(-[WebFrameView _scrollView](self, "_scrollView"), "documentView"), "frame");
      v5 = v4;
      v7 = v6;
      objc_msgSend(-[WebFrameView _scrollView](self, "_scrollView"), "scrollOrigin");
      objc_msgSend(-[WebFrameView _scrollView](self, "_scrollView", v5 + v8), "scrollOrigin");
      *(double *)&v11[1] = v7 + v9;
      LOBYTE(v3) = objc_msgSend(-[WebFrameView _contentView](self, "_contentView"), "_scrollTo:animate:", v11, 1);
    }
  }
  return v3;
}

- (BOOL)_scrollToEndOfDocument
{
  BOOL v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _BOOL4 v12;
  _BOOL4 v13;
  double v14;
  double v15;
  double v16;
  double v18;
  double v19;

  v3 = 1;
  if (!-[WebFrameView _scrollOverflowInDirection:granularity:](self, "_scrollOverflowInDirection:granularity:", 1, 2))
  {
    if (-[WebFrameView _isScrollable](self, "_isScrollable"))
    {
      objc_msgSend((id)objc_msgSend(-[WebFrameView _scrollView](self, "_scrollView"), "documentView"), "frame");
      v5 = v4;
      v7 = v6;
      v9 = v8;
      v11 = v10;
      v12 = -[WebFrameView _isVerticalDocument](self, "_isVerticalDocument");
      v13 = -[WebFrameView _isFlippedDocument](self, "_isFlippedDocument");
      v14 = -0.0;
      if (v12)
      {
        if (!v13)
          v14 = v11;
        v19 = v7 + v14;
        objc_msgSend(-[WebFrameView _scrollView](self, "_scrollView"), "scrollOrigin");
        v18 = v5 + v15;
      }
      else
      {
        if (!v13)
          v14 = v9;
        objc_msgSend(-[WebFrameView _scrollView](self, "_scrollView", v5 + v14), "scrollOrigin");
        v19 = v7 + v16;
      }
      return objc_msgSend(-[WebFrameView _contentView](self, "_contentView", *(_QWORD *)&v18, *(_QWORD *)&v19), "_scrollTo:animate:", &v18, 1);
    }
    else
    {
      return 0;
    }
  }
  return v3;
}

- (void)scrollToBeginningOfDocument:(id)a3
{
  id v5;

  if (!-[WebFrameView _scrollToBeginningOfDocument](self, "_scrollToBeginningOfDocument"))
  {
    v5 = -[WebFrameView _largestScrollableChild](self, "_largestScrollableChild");
    if (!v5 || (objc_msgSend(v5, "_scrollToBeginningOfDocument") & 1) == 0)
      objc_msgSend(-[WAKResponder nextResponder](self, "nextResponder"), "tryToPerform:with:", sel_scrollToBeginningOfDocument_, a3);
  }
}

- (void)scrollToEndOfDocument:(id)a3
{
  id v5;

  if (!-[WebFrameView _scrollToEndOfDocument](self, "_scrollToEndOfDocument"))
  {
    v5 = -[WebFrameView _largestScrollableChild](self, "_largestScrollableChild");
    if (!v5 || (objc_msgSend(v5, "_scrollToEndOfDocument") & 1) == 0)
      objc_msgSend(-[WAKResponder nextResponder](self, "nextResponder"), "tryToPerform:with:", sel_scrollToEndOfDocument_, a3);
  }
}

- (void)_goBack
{
  objc_msgSend(-[WebFrameView _webView](self, "_webView"), "goBack");
}

- (void)_goForward
{
  objc_msgSend(-[WebFrameView _webView](self, "_webView"), "goForward");
}

- (BOOL)_scrollVerticallyBy:(float)a3
{
  double v5;
  uint64_t v6;
  uint64_t v8;

  objc_msgSend(-[WebFrameView _contentView](self, "_contentView"), "bounds");
  return objc_msgSend(-[WebFrameView _contentView](self, "_contentView", v6, v5 + a3), "_scrollTo:animate:", &v8, 1);
}

- (BOOL)_scrollHorizontallyBy:(float)a3
{
  double v5;
  uint64_t v6;
  uint64_t v8;

  objc_msgSend(-[WebFrameView _contentView](self, "_contentView"), "bounds");
  return objc_msgSend(-[WebFrameView _contentView](self, "_contentView", v5 + a3, v6), "_scrollTo:animate:", &v8, 1);
}

- (float)_horizontalKeyboardScrollDistance
{
  float result;

  objc_msgSend(-[WebFrameView _scrollView](self, "_scrollView"), "horizontalLineScroll");
  return result;
}

- (float)_horizontalPageScrollDistance
{
  WebCore::Scrollbar *v2;
  double v3;
  float v4;
  float result;

  v2 = (WebCore::Scrollbar *)objc_msgSend(-[WebFrameView _contentView](self, "_contentView"), "bounds");
  v4 = v3;
  result = v4 - (float)(int)WebCore::Scrollbar::maxOverlapBetweenPages(v2);
  if ((float)(v4 * 0.8) >= result)
    return v4 * 0.8;
  return result;
}

- (BOOL)_pageVertically:(BOOL)a3
{
  _BOOL8 v3;
  double v6;

  v3 = a3;
  if (-[WebFrameView _scrollOverflowInDirection:granularity:](self, "_scrollOverflowInDirection:granularity:", !a3, 1))
  {
    return 1;
  }
  if (!-[WebFrameView _isScrollable](self, "_isScrollable"))
    return objc_msgSend(-[WebFrameView _largestScrollableChild](self, "_largestScrollableChild"), "_pageVertically:", v3);
  -[WebFrameView _verticalPageScrollDistance](self, "_verticalPageScrollDistance");
  if (v3)
    *(float *)&v6 = -*(float *)&v6;
  return -[WebFrameView _scrollVerticallyBy:](self, "_scrollVerticallyBy:", v6);
}

- (BOOL)_pageHorizontally:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  double v7;

  v3 = a3;
  if (a3)
    v5 = 2;
  else
    v5 = 3;
  if (-[WebFrameView _scrollOverflowInDirection:granularity:](self, "_scrollOverflowInDirection:granularity:", v5, 1))
    return 1;
  if (!-[WebFrameView _isScrollable](self, "_isScrollable"))
    return objc_msgSend(-[WebFrameView _largestScrollableChild](self, "_largestScrollableChild"), "_pageHorizontally:", v3);
  -[WebFrameView _horizontalPageScrollDistance](self, "_horizontalPageScrollDistance");
  if (v3)
    *(float *)&v7 = -*(float *)&v7;
  return -[WebFrameView _scrollHorizontallyBy:](self, "_scrollHorizontallyBy:", v7);
}

- (BOOL)_pageInBlockProgressionDirection:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;
  uint64_t v6;

  v3 = a3;
  v5 = -[WebFrameView _isVerticalDocument](self, "_isVerticalDocument");
  v6 = -[WebFrameView _isFlippedDocument](self, "_isFlippedDocument") ^ v3;
  if (v5)
    return -[WebFrameView _pageVertically:](self, "_pageVertically:", v6);
  else
    return -[WebFrameView _pageHorizontally:](self, "_pageHorizontally:", v6);
}

- (BOOL)_scrollLineVertically:(BOOL)a3
{
  _BOOL8 v3;
  double v6;

  v3 = a3;
  if (-[WebFrameView _scrollOverflowInDirection:granularity:](self, "_scrollOverflowInDirection:granularity:", !a3, 0))
  {
    return 1;
  }
  if (!-[WebFrameView _isScrollable](self, "_isScrollable"))
    return objc_msgSend(-[WebFrameView _largestScrollableChild](self, "_largestScrollableChild"), "_scrollLineVertically:", v3);
  -[WebFrameView _verticalKeyboardScrollDistance](self, "_verticalKeyboardScrollDistance");
  if (v3)
    *(float *)&v6 = -*(float *)&v6;
  return -[WebFrameView _scrollVerticallyBy:](self, "_scrollVerticallyBy:", v6);
}

- (BOOL)_scrollLineHorizontally:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  double v7;

  v3 = a3;
  if (a3)
    v5 = 2;
  else
    v5 = 3;
  if (-[WebFrameView _scrollOverflowInDirection:granularity:](self, "_scrollOverflowInDirection:granularity:", v5, 0))
    return 1;
  if (!-[WebFrameView _isScrollable](self, "_isScrollable"))
    return objc_msgSend(-[WebFrameView _largestScrollableChild](self, "_largestScrollableChild"), "_scrollLineHorizontally:", v3);
  -[WebFrameView _horizontalKeyboardScrollDistance](self, "_horizontalKeyboardScrollDistance");
  if (v3)
    *(float *)&v7 = -*(float *)&v7;
  return -[WebFrameView _scrollHorizontallyBy:](self, "_scrollHorizontallyBy:", v7);
}

- (void)scrollPageUp:(id)a3
{
  if (!-[WebFrameView _pageInBlockProgressionDirection:](self, "_pageInBlockProgressionDirection:", 1))
    objc_msgSend(-[WAKResponder nextResponder](self, "nextResponder"), "tryToPerform:with:", sel_scrollPageUp_, a3);
}

- (void)scrollPageDown:(id)a3
{
  if (!-[WebFrameView _pageInBlockProgressionDirection:](self, "_pageInBlockProgressionDirection:", 0))
    objc_msgSend(-[WAKResponder nextResponder](self, "nextResponder"), "tryToPerform:with:", sel_scrollPageDown_, a3);
}

- (void)scrollLineUp:(id)a3
{
  if (!-[WebFrameView _scrollLineVertically:](self, "_scrollLineVertically:", 1))
    objc_msgSend(-[WAKResponder nextResponder](self, "nextResponder"), "tryToPerform:with:", sel_scrollLineUp_, a3);
}

- (void)scrollLineDown:(id)a3
{
  if (!-[WebFrameView _scrollLineVertically:](self, "_scrollLineVertically:", 0))
    objc_msgSend(-[WAKResponder nextResponder](self, "nextResponder"), "tryToPerform:with:", sel_scrollLineDown_, a3);
}

- (BOOL)_firstResponderIsFormControl
{
  return 0;
}

- (void)_forwardMouseEvent:(id)a3
{
  void *v5;
  id v6;

  v5 = (void *)-[WebFrameView superview](self, "superview");
  if (objc_msgSend(v5, "conformsToProtocol:", &unk_1F0174D30))
    v6 = (id)objc_msgSend((id)objc_msgSend(v5, "_web_parentWebFrameView"), "_scrollView");
  else
    v6 = -[WAKResponder nextResponder](self, "nextResponder");
  objc_msgSend(v6, "handleEvent:", a3);
}

- (void)keyDown:(id)a3
{
  void *v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  int v12;
  WebFrameView *v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v16;
  uint64_t v17;

  v5 = (void *)objc_msgSend(a3, "characters");
  v6 = objc_msgSend(a3, "modifierFlags");
  if (!self)
  {
    HIDWORD(v15) = 0;
    v17 = 0;
    v7 = objc_msgSend(v5, "length");
    if (v7 < 1)
      goto LABEL_63;
    goto LABEL_8;
  }
  -[WebFrameView _web_frame](self, "_web_frame");
  if (v17)
  {
    HIDWORD(v15) = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v17 + 24) + 8) + 136) + 16)
                                      + 65) != 0;
    v7 = objc_msgSend(v5, "length");
    if (v7 < 1)
      goto LABEL_63;
LABEL_8:
    v8 = 0;
    LODWORD(v15) = v6;
    v9 = v6 & 0x60000;
    v10 = v7;
    v11 = 1;
    while (2)
    {
      v12 = objc_msgSend(v5, "characterAtIndex:", v8, v15);
      switch(v12)
      {
        case 63232:
          if (v9)
            goto LABEL_10;
          if ((v6 & 0x100000) != 0)
            goto LABEL_56;
          if ((v6 & 0x80000) != 0)
            goto LABEL_55;
          -[WebFrameView scrollLineUp:](self, "scrollLineUp:", 0);
          goto LABEL_57;
        case 63233:
          if (v9)
            goto LABEL_10;
          if ((v6 & 0x100000) != 0)
          {
LABEL_40:
            -[WebFrameView scrollToEndOfDocument:](self, "scrollToEndOfDocument:", 0);
          }
          else
          {
            if ((v6 & 0x80000) != 0)
              goto LABEL_51;
            -[WebFrameView scrollLineDown:](self, "scrollLineDown:", 0);
          }
          goto LABEL_57;
        case 63234:
          if (v9)
            goto LABEL_10;
          if ((v6 & 0x100000) != 0)
          {
            if (!HIDWORD(v15))
              goto LABEL_10;
            goto LABEL_59;
          }
          if (!-[WebFrameView allowsScrolling](self, "allowsScrolling")
            && !-[WebFrameView _largestScrollableChild](self, "_largestScrollableChild"))
          {
            goto LABEL_10;
          }
          v13 = self;
          v14 = 1;
          if ((v6 & 0x80000) != 0)
            goto LABEL_34;
          goto LABEL_28;
        case 63235:
          if (v9)
            goto LABEL_10;
          if ((v6 & 0x100000) != 0)
          {
            if (!HIDWORD(v15))
              goto LABEL_10;
            goto LABEL_61;
          }
          if (!-[WebFrameView allowsScrolling](self, "allowsScrolling")
            && !-[WebFrameView _largestScrollableChild](self, "_largestScrollableChild"))
          {
            goto LABEL_10;
          }
          v13 = self;
          v14 = 0;
          if ((v6 & 0x80000) != 0)
LABEL_34:
            -[WebFrameView _pageHorizontally:](v13, "_pageHorizontally:", v14);
          else
LABEL_28:
            -[WebFrameView _scrollLineHorizontally:](v13, "_scrollLineHorizontally:", v14);
          goto LABEL_57;
        case 63236:
        case 63237:
        case 63238:
        case 63239:
        case 63240:
        case 63241:
        case 63242:
        case 63243:
        case 63244:
        case 63245:
        case 63246:
        case 63247:
        case 63248:
        case 63249:
        case 63250:
        case 63251:
        case 63252:
        case 63253:
        case 63254:
        case 63255:
        case 63256:
        case 63257:
        case 63258:
        case 63259:
        case 63260:
        case 63261:
        case 63262:
        case 63263:
        case 63264:
        case 63265:
        case 63266:
        case 63267:
        case 63268:
        case 63269:
        case 63270:
        case 63271:
        case 63272:
        case 63274:
          goto LABEL_11;
        case 63273:
          if (!-[WebFrameView allowsScrolling](self, "allowsScrolling")
            && !-[WebFrameView _largestScrollableChild](self, "_largestScrollableChild"))
          {
            goto LABEL_10;
          }
LABEL_56:
          -[WebFrameView scrollToBeginningOfDocument:](self, "scrollToBeginningOfDocument:", 0);
          goto LABEL_57;
        case 63275:
          if (-[WebFrameView allowsScrolling](self, "allowsScrolling")
            || -[WebFrameView _largestScrollableChild](self, "_largestScrollableChild"))
          {
            goto LABEL_40;
          }
          goto LABEL_10;
        case 63276:
          if (!-[WebFrameView allowsScrolling](self, "allowsScrolling")
            && !-[WebFrameView _largestScrollableChild](self, "_largestScrollableChild"))
          {
            goto LABEL_10;
          }
          goto LABEL_55;
        case 63277:
          if (!-[WebFrameView allowsScrolling](self, "allowsScrolling")
            && !-[WebFrameView _largestScrollableChild](self, "_largestScrollableChild"))
          {
            goto LABEL_10;
          }
          goto LABEL_51;
        default:
          if (v12 == 32)
          {
            if (!-[WebFrameView allowsScrolling](self, "allowsScrolling")
              && !-[WebFrameView _largestScrollableChild](self, "_largestScrollableChild")
              || -[WebFrameView _firstResponderIsFormControl](self, "_firstResponderIsFormControl"))
            {
LABEL_10:
              v11 = 1;
              goto LABEL_11;
            }
            if ((v15 & 0x20000) != 0)
LABEL_55:
              -[WebFrameView scrollPageUp:](self, "scrollPageUp:", 0);
            else
LABEL_51:
              -[WebFrameView scrollPageDown:](self, "scrollPageDown:", 0);
          }
          else
          {
            if (v12 != 127)
              goto LABEL_11;
            if (!HIDWORD(v15)
              || !objc_msgSend((id)objc_msgSend(-[WebFrameView _webView](self, "_webView"), "preferences"), "backspaceKeyNavigationEnabled"))
            {
              goto LABEL_10;
            }
            if ((v15 & 0x20000) != 0)
LABEL_61:
              -[WebFrameView _goForward](self, "_goForward");
            else
LABEL_59:
              -[WebFrameView _goBack](self, "_goBack");
          }
LABEL_57:
          v11 = 0;
LABEL_11:
          if (v10 != ++v8)
            continue;
          if ((v11 & 1) != 0)
            goto LABEL_63;
          return;
      }
    }
  }
  HIDWORD(v15) = 0;
  v7 = objc_msgSend(v5, "length");
  if (v7 >= 1)
    goto LABEL_8;
LABEL_63:
  v16.receiver = self;
  v16.super_class = (Class)WebFrameView;
  -[WAKResponder keyDown:](&v16, sel_keyDown_, a3);
}

- (id)_webcore_effectiveFirstResponder
{
  NSView *v3;
  objc_super v5;

  v3 = -[WebFrameView documentView](self, "documentView");
  if (v3)
    return (id)-[NSView _webcore_effectiveFirstResponder](v3, "_webcore_effectiveFirstResponder");
  v5.receiver = self;
  v5.super_class = (Class)WebFrameView;
  return -[WebFrameView _webcore_effectiveFirstResponder](&v5, sel__webcore_effectiveFirstResponder);
}

- (BOOL)documentViewShouldHandlePrint
{
  uint64_t v2;
  void *v3;

  v2 = objc_msgSend(-[WebFrameView _scrollView](self, "_scrollView"), "documentView");
  if (v2 && (v3 = (void *)v2, (objc_opt_respondsToSelector() & 1) != 0))
    return objc_msgSend(v3, "documentViewShouldHandlePrint");
  else
    return 0;
}

- (void)printDocumentView
{
  uint64_t v2;
  void *v3;

  v2 = objc_msgSend(-[WebFrameView _scrollView](self, "_scrollView"), "documentView");
  if (v2)
  {
    v3 = (void *)v2;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v3, "printDocumentView");
  }
}

- (float)_area
{
  double v2;
  double v3;

  -[WebFrameView frame](self, "frame");
  return v3 * v2;
}

- (id)_largestScrollableChild
{
  NSArray *v2;
  unint64_t v3;
  void *v4;
  unsigned int v5;
  void *v6;
  float v7;
  float v8;
  float v9;

  v2 = -[WebFrame childFrames](-[WebFrameView webFrame](self, "webFrame"), "childFrames");
  if (!-[NSArray count](v2, "count"))
    return 0;
  v3 = 0;
  v4 = 0;
  v5 = 1;
  do
  {
    v6 = (void *)objc_msgSend(-[NSArray objectAtIndex:](v2, "objectAtIndex:", v3), "frameView");
    if ((objc_msgSend(v6, "_isScrollable") & 1) == 0)
      v6 = (void *)objc_msgSend(v6, "_largestScrollableChild");
    if (v6)
    {
      objc_msgSend(v6, "_area");
      if (v7 >= 1.0)
      {
        if (!v4 || (v8 = v7, objc_msgSend(v4, "_area"), v8 > v9))
          v4 = v6;
      }
    }
    v3 = v5++;
  }
  while (-[NSArray count](v2, "count") > v3);
  return v4;
}

- (BOOL)_hasScrollBars
{
  id v2;

  v2 = -[WebFrameView _scrollView](self, "_scrollView");
  if ((objc_msgSend(v2, "hasHorizontalScroller") & 1) != 0)
    return 1;
  else
    return objc_msgSend(v2, "hasVerticalScroller");
}

- (id)_largestChildWithScrollBars
{
  NSArray *v2;
  unint64_t v3;
  void *v4;
  unsigned int v5;
  void *v6;
  float v7;
  float v8;
  float v9;

  v2 = -[WebFrame childFrames](-[WebFrameView webFrame](self, "webFrame"), "childFrames");
  if (!-[NSArray count](v2, "count"))
    return 0;
  v3 = 0;
  v4 = 0;
  v5 = 1;
  do
  {
    v6 = (void *)objc_msgSend(-[NSArray objectAtIndex:](v2, "objectAtIndex:", v3), "frameView");
    if ((objc_msgSend(v6, "_hasScrollBars") & 1) == 0)
      v6 = (void *)objc_msgSend(v6, "_largestChildWithScrollBars");
    if (v6)
    {
      objc_msgSend(v6, "_area");
      if (v7 >= 1.0)
      {
        if (!v4 || (v8 = v7, objc_msgSend(v4, "_area"), v8 > v9))
          v4 = v6;
      }
    }
    v3 = v5++;
  }
  while (-[NSArray count](v2, "count") > v3);
  return v4;
}

- (id)_contentView
{
  return (id)objc_msgSend(-[WebFrameView _scrollView](self, "_scrollView"), "contentView");
}

- (Class)_customScrollViewClass
{
  uint64_t v2;

  v2 = objc_opt_class();
  if (v2 == objc_opt_class())
    return 0;
  else
    return (Class)objc_opt_class();
}

- (void)frameSizeChanged
{
  objc_super v3;

  if ((objc_msgSend(-[WebFrameView _webView](self, "_webView"), "_useFixedLayout") & 1) == 0)
    -[WebFrameView _frameSizeChanged](self, "_frameSizeChanged");
  v3.receiver = self;
  v3.super_class = (Class)WebFrameView;
  -[WebFrameView frameSizeChanged](&v3, sel_frameSizeChanged);
}

@end
