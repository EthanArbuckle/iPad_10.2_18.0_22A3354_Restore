@implementation WebViewVisualIdentificationOverlay

+ (void)installForWebViewIfNeeded:(id)a3 kind:(id)a4 deprecated:(BOOL)a5
{
  _BOOL8 v5;
  WebViewVisualIdentificationOverlay *v9;

  v5 = a5;
  if (objc_msgSend(a1, "shouldIdentifyWebViews"))
  {
    v9 = -[WebViewVisualIdentificationOverlay initWithWebView:kind:deprecated:]([WebViewVisualIdentificationOverlay alloc], "initWithWebView:kind:deprecated:", a3, a4, v5);
    objc_setAssociatedObject(a1, &webViewVisualIdentificationOverlayKey, v9, (void *)1);
    if (v9)
      CFRelease(v9);
  }
}

+ (BOOL)shouldIdentifyWebViews
{
  __int16 v2;

  if (HIBYTE(+[WebViewVisualIdentificationOverlay shouldIdentifyWebViews]::shouldIdentifyWebViews))
  {
    LOBYTE(v2) = (_BYTE)+[WebViewVisualIdentificationOverlay shouldIdentifyWebViews]::shouldIdentifyWebViews != 0;
  }
  else
  {
    v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults"), "BOOLForKey:", CFSTR("WebKitDebugIdentifyWebViews"));
    +[WebViewVisualIdentificationOverlay shouldIdentifyWebViews]::shouldIdentifyWebViews = v2 | 0x100;
  }
  return v2;
}

- (WebViewVisualIdentificationOverlay)initWithWebView:(id)a3 kind:(id)a4 deprecated:(BOOL)a5
{
  _BOOL4 v5;
  WebViewVisualIdentificationOverlay *v8;
  void *m_ptr;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  const WebCore::Color *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  CFTypeRef v22;
  void *v23;
  unsigned int *v25;
  unsigned int v26;
  unsigned int v27;
  uint64_t v28;
  CFTypeRef cf;
  objc_super v30;

  v5 = a5;
  v30.receiver = self;
  v30.super_class = (Class)WebViewVisualIdentificationOverlay;
  v8 = -[WebViewVisualIdentificationOverlay init](&v30, sel_init);
  if (v8)
  {
    if (a4)
      CFRetain(a4);
    m_ptr = v8->_kind.m_ptr;
    v8->_kind.m_ptr = a4;
    if (m_ptr)
      CFRelease(m_ptr);
    v10 = objc_alloc((Class)PAL::getUIViewClass[0]((PAL *)m_ptr));
    objc_msgSend(a3, "bounds");
    v11 = (void *)objc_msgSend(v10, "initWithFrame:");
    v12 = v8->_view.m_ptr;
    v8->_view.m_ptr = v11;
    if (v12)
    {
      CFRelease(v12);
      v11 = v8->_view.m_ptr;
    }
    objc_msgSend(v11, "setUserInteractionEnabled:", 0);
    objc_msgSend(v8->_view.m_ptr, "setAutoresizingMask:", 18);
    objc_msgSend(a3, "addSubview:", v8->_view.m_ptr);
    v13 = objc_alloc_init(MEMORY[0x1E0CD28A8]);
    v14 = v8->_layer.m_ptr;
    v8->_layer.m_ptr = v13;
    if (v14)
    {
      CFRelease(v14);
      v13 = v8->_layer.m_ptr;
    }
    objc_msgSend(v13, "setName:", CFSTR("WebViewVisualIdentificationOverlay"));
    v15 = v8->_layer.m_ptr;
    objc_msgSend(v8->_view.m_ptr, "bounds");
    v17 = v16;
    objc_msgSend(v8->_view.m_ptr, "bounds");
    objc_msgSend(v15, "setFrame:", 0.0, 0.0, v17);
    if (v5)
      v19 = 838861055;
    else
      v19 = 553582592;
    v20 = v8->_layer.m_ptr;
    v28 = bswap32(v19) | 0x1104000000000000;
    WebCore::cachedCGColor((WebCore *)&v28, v18, &cf);
    objc_msgSend(v20, "setBackgroundColor:", cf);
    v22 = cf;
    cf = 0;
    if (v22)
      CFRelease(v22);
    if ((v28 & 0x8000000000000) != 0)
    {
      v25 = (unsigned int *)(v28 & 0xFFFFFFFFFFFFLL);
      do
      {
        v26 = __ldaxr(v25);
        v27 = v26 - 1;
      }
      while (__stlxr(v27, v25));
      if (!v27)
      {
        atomic_store(1u, v25);
        WTF::fastFree((WTF *)v25, v21);
      }
    }
    objc_msgSend(v8->_layer.m_ptr, "setZPosition:", 999.0);
    objc_msgSend(v8->_layer.m_ptr, "setDelegate:", v8);
    objc_msgSend(v8->_layer.m_ptr, "web_disableAllActions");
    objc_msgSend((id)objc_msgSend(v8->_view.m_ptr, "layer"), "addSublayer:", v8->_layer.m_ptr);
    v23 = (void *)objc_msgSend(v8->_view.m_ptr, "layer");
    objc_msgSend(v23, "addObserver:forKeyPath:options:context:", v8, CFSTR("bounds"), 0, boundsObservationContext);
  }
  return v8;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_msgSend(self->_view.m_ptr, "layer");
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("bounds"), boundsObservationContext);
  v4.receiver = self;
  v4.super_class = (Class)WebViewVisualIdentificationOverlay;
  -[WebViewVisualIdentificationOverlay dealloc](&v4, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *m_ptr;
  double v8;
  double v9;

  if ((void *)boundsObservationContext == a6)
  {
    m_ptr = self->_layer.m_ptr;
    objc_msgSend(self->_view.m_ptr, "bounds", a3, a4, a5);
    v9 = v8;
    objc_msgSend(self->_view.m_ptr, "bounds");
    objc_msgSend(m_ptr, "setFrame:", 0.0, 0.0, v9);
    objc_msgSend(self->_layer.m_ptr, "setNeedsDisplay");
  }
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  CGColorSpace *Pattern;
  void *m_ptr;
  __int128 v9;
  CTFontRef v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  CGPattern *v23;
  CGAffineTransform v24;
  CGPatternCallbacks callbacks;
  CGAffineTransform matrix;
  uint64_t v27;
  _QWORD v28[2];
  CGRect v29;
  CGRect v30;

  v28[1] = *MEMORY[0x1E0C80C00];
  *(_OWORD *)&callbacks.version = xmmword_1E335CF20;
  callbacks.releaseInfo = 0;
  Pattern = CGColorSpaceCreatePattern(0);
  CGContextSetFillColorSpace(a4, Pattern);
  m_ptr = self->_kind.m_ptr;
  v27 = *MEMORY[0x1E0CA8188];
  v9 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&matrix.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&matrix.c = v9;
  *(_OWORD *)&matrix.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v10 = CTFontCreateWithName(CFSTR("Helvetica"), 20.0, &matrix);
  v28[0] = v10;
  objc_msgSend(m_ptr, "sizeWithAttributes:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1));
  v12 = v11;
  v14 = v13;
  if (v10)
    CFRelease(v10);
  objc_msgSend(a3, "bounds");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  CGAffineTransformMakeRotation(&v24, 0.785398163);
  v29.origin.x = v16;
  v29.origin.y = v18;
  v29.size.width = v20;
  v29.size.height = v22;
  v23 = CGPatternCreate(self, v29, &v24, v12 + 15.0, v14 + 5.0 + v14 + 5.0, kCGPatternTilingNoDistortion, 1, &callbacks);
  matrix.a = 0.5;
  CGContextSetFillPattern(a4, v23, &matrix.a);
  objc_msgSend(a3, "bounds");
  CGContextFillRect(a4, v30);
  if (v23)
    CFRelease(v23);
  if (Pattern)
    CFRelease(Pattern);
}

- (void).cxx_destruct
{
  void *m_ptr;
  void *v4;
  void *v5;

  m_ptr = self->_kind.m_ptr;
  self->_kind.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v4 = self->_layer.m_ptr;
  self->_layer.m_ptr = 0;
  if (v4)
    CFRelease(v4);
  v5 = self->_view.m_ptr;
  self->_view.m_ptr = 0;
  if (v5)
    CFRelease(v5);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
