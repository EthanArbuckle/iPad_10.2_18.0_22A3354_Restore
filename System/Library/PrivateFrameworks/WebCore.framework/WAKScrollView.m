@implementation WAKScrollView

- (WAKScrollView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _WKViewContext *p_viewContext;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  WAKScrollView *v15;
  int v16;
  _QWORD *i;
  void (*v18)(_QWORD *);
  WAKClipView *v19;
  objc_super v21;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_viewContext = &self->super.viewContext;
  v9 = malloc_type_calloc(0x70uLL, 1uLL, 0x2B517A3EuLL);
  v10 = v9;
  if (v9)
  {
    v9[1] = &WKViewClassInfo;
    ++*(_DWORD *)v9;
    *((double *)v9 + 6) = x;
    *((double *)v9 + 7) = y;
    *((_OWORD *)v9 + 4) = *MEMORY[0x1E0C9D538];
    *((double *)v9 + 10) = width;
    *((double *)v9 + 11) = height;
    v9[2] = p_viewContext;
    v9[12] = 0x3F80000000000000;
  }
  p_viewContext->notificationCallback = _notificationCallback;
  p_viewContext->notificationUserInfo = self;
  v21.receiver = self;
  v21.super_class = (Class)WAKScrollView;
  v15 = -[WAKView _initWithViewRef:](&v21, sel__initWithViewRef_, v9);
  if (*(_DWORD *)v10)
  {
    v16 = *(_DWORD *)v10 - 1;
    *(_DWORD *)v10 = v16;
    if (!v16)
    {
      for (i = (_QWORD *)v10[1]; i; i = (_QWORD *)*i)
      {
        v18 = (void (*)(_QWORD *))i[2];
        if (v18)
          v18(v10);
      }
    }
  }
  else
  {
    WKReportError("/Library/Caches/com.apple.xbs/Sources/WebCore/Source/WebCore/platform/ios/wak/WKUtilities.c", 62, "void WAKRelease(const void *)", "attempt to release invalid object", v11, v12, v13, v14, (char)v21.receiver);
  }
  v19 = -[WAKClipView initWithFrame:]([WAKClipView alloc], "initWithFrame:", x, y, width, height);
  v15->_contentView = v19;
  -[WAKView addSubview:](v15, "addSubview:", v19);
  return v15;
}

- (void)dealloc
{
  WAKView *v3;
  objc_super v4;

  v3 = self->_documentView;

  v4.receiver = self;
  v4.super_class = (Class)WAKScrollView;
  -[WAKView dealloc](&v4, sel_dealloc);
}

- (BOOL)_selfHandleEvent:(id)a3
{
  int v5;

  v5 = objc_msgSend(a3, "type");
  if (v5 == 3)
    -[WAKScrollView scrollWheel:](self, "scrollWheel:", a3);
  return v5 == 3;
}

- (BOOL)hasVerticalScroller
{
  return 0;
}

- (BOOL)hasHorizontalScroller
{
  return 0;
}

- (CGRect)documentVisibleRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[WAKClipView documentVisibleRect](self->_contentView, "documentVisibleRect");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setDocumentView:(id)a3
{
  WAKView *documentView;

  documentView = self->_documentView;
  if (documentView != a3)
  {

    self->_documentView = (WAKView *)a3;
    -[WAKClipView _setDocumentView:](self->_contentView, "_setDocumentView:", a3);
  }
}

- (id)documentView
{
  return self->_documentView;
}

- (id)contentView
{
  return self->_contentView;
}

- (BOOL)drawsBackground
{
  return 0;
}

- (float)verticalLineScroll
{
  return 0.0;
}

- (float)horizontalLineScroll
{
  return 0.0;
}

- (unsigned)horizontalScrollingMode
{
  return 0;
}

- (unsigned)verticalScrollingMode
{
  return 0;
}

- (void)setScrollOrigin:(CGPoint)a3 updatePositionAtAll:(BOOL)a4 immediately:(BOOL)a5
{
  self->_scrollOrigin = a3;
  -[WAKView setBoundsOrigin:](self->_documentView, "setBoundsOrigin:", a4, a5, -a3.x, -a3.y);
}

- (CGPoint)scrollOrigin
{
  double x;
  double y;
  CGPoint result;

  x = self->_scrollOrigin.x;
  y = self->_scrollOrigin.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)scrollWheel:(id)a3
{
  WAKView *documentView;
  double v6;
  double v7;
  double v8;
  double v9;
  float v10;
  float v11;
  CGFloat v12;
  float v13;
  float v14;
  CGPoint v15;

  documentView = self->_documentView;
  if (!documentView)
    goto LABEL_3;
  -[WAKView frame](documentView, "frame");
  v7 = v6;
  v9 = -v8;
  objc_msgSend(a3, "deltaX");
  v11 = v9 - v10;
  v12 = roundf(v11);
  objc_msgSend(a3, "deltaY");
  v14 = -v7 - v13;
  v15.y = roundf(v14);
  v15.x = v12;
  if ((scrollViewToPoint(self, v15) & 1) == 0)
LABEL_3:
    objc_msgSend(-[WAKView nextResponder](self, "nextResponder"), "scrollWheel:", a3);
}

- (CGRect)unobscuredContentRect
{
  WAKScrollView *v3;
  uint64_t v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect v10;
  CGRect v11;
  CGRect result;

  v3 = self;
  while (1)
  {
    v4 = -[WAKView superview](v3, "superview");
    if (!v4)
      break;
    v3 = (WAKScrollView *)v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_7;
  }
  v5 = -[WAKView window](self, "window");
  if (v5)
  {
    objc_msgSend(v5, "exposedScrollViewRect");
    v11 = CGRectIntegral(v10);
    -[WAKView convertRect:fromView:](self->_documentView, "convertRect:fromView:", 0, v11.origin.x, v11.origin.y, v11.size.width, v11.size.height);
    goto LABEL_8;
  }
LABEL_7:
  -[WAKScrollView documentVisibleRect](self, "documentVisibleRect");
LABEL_8:
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (CGRect)exposedContentRect
{
  WAKScrollView *v3;
  uint64_t v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect v10;
  CGRect v11;
  CGRect result;

  v3 = self;
  while (1)
  {
    v4 = -[WAKView superview](v3, "superview");
    if (!v4)
      break;
    v3 = (WAKScrollView *)v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_7;
  }
  v5 = -[WAKView window](self, "window");
  if (v5)
  {
    objc_msgSend(v5, "extendedVisibleRect");
    v11 = CGRectIntegral(v10);
    -[WAKView convertRect:fromView:](self->_documentView, "convertRect:fromView:", 0, v11.origin.x, v11.origin.y, v11.size.width, v11.size.height);
    goto LABEL_8;
  }
LABEL_7:
  -[WAKScrollView documentVisibleRect](self, "documentVisibleRect");
LABEL_8:
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (void)setActualScrollPosition:(CGPoint)a3
{
  double y;
  double x;
  WAKScrollView *v6;
  uint64_t v7;
  WAKScrollView *v8;
  double v9;
  double v10;
  WAKView *documentView;

  y = a3.y;
  x = a3.x;
  v6 = self;
  while (1)
  {
    v7 = -[WAKView superview](v6, "superview");
    if (!v7)
      break;
    v6 = (WAKScrollView *)v7;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = self;
      v9 = x;
      v10 = y;
      goto LABEL_7;
    }
  }
  documentView = self->_documentView;
  if (!documentView)
    return;
  -[WAKView convertPoint:toView:](documentView, "convertPoint:toView:", 0, x, y);
  v8 = self;
LABEL_7:
  -[WAKScrollView scrollPoint:](v8, "scrollPoint:", v9, v10);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)WAKScrollView;
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: ; "),
                 -[WAKView description](&v13, sel_description));
  objc_msgSend(v3, "appendFormat:", CFSTR("documentView: WAK: %p; "), self->_documentView);
  -[WAKScrollView documentVisibleRect](self, "documentVisibleRect");
  objc_msgSend(v3, "appendFormat:", CFSTR("documentVisible = (%g %g; %g %g); "), v4, v5, v6, v7);
  -[WAKScrollView unobscuredContentRect](self, "unobscuredContentRect");
  objc_msgSend(v3, "appendFormat:", CFSTR("actualDocumentVisible = (%g %g; %g %g)>"), v8, v9, v10, v11);
  return v3;
}

- (BOOL)inProgrammaticScroll
{
  return 0;
}

- (void)_adjustScrollers
{
  WAKClipView *contentView;
  double v4;
  double v5;
  WAKView *documentView;
  double v7;
  double v8;
  double v9;
  double v10;
  WAKView *v11;
  double v12;
  double v13;
  void (**v15)(void);

  contentView = self->_contentView;
  -[WAKView bounds](self, "bounds");
  -[WAKView setFrameSize:](contentView, "setFrameSize:", v4, v5);
  documentView = self->_documentView;
  if (documentView)
  {
    -[WAKView frame](documentView, "frame");
    v8 = v7;
    v10 = v9;
    v11 = self->_documentView;
    -[WAKView frame](v11, "frame");
    if (v13 != v8 || v12 != v10)
    {
      -[WAKView setFrameOrigin:](v11, "setFrameOrigin:", v8, v10);
      -[WAKView setNeedsDisplay:](self, "setNeedsDisplay:", 1);
      v15 = (void (**)(void))-[WAKView _viewRef](v11, "_viewRef")[16];
      if (v15)
      {
        if (*v15)
          (*v15)();
      }
    }
  }
}

- (id)delegate
{
  return objc_loadWeak(&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->delegate);
}

@end
