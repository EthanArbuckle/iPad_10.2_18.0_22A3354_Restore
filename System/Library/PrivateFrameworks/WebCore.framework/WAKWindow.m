@implementation WAKWindow

- (WAKWindow)initWithLayer:(id)a3
{
  char *v4;
  id v5;
  PAL *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  WebCore::LegacyTileCache *v12;
  _OWORD *v13;
  __int128 v14;
  __int128 v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)WAKWindow;
  v4 = -[WAKWindow init](&v17, sel_init);
  if (v4)
  {
    v5 = a3;
    *((_QWORD *)v4 + 1) = v5;
    v6 = (PAL *)objc_msgSend(v5, "frame");
    *((_QWORD *)v4 + 13) = v7;
    *((_QWORD *)v4 + 14) = v8;
    *((_QWORD *)v4 + 15) = v9;
    *((_QWORD *)v4 + 16) = v10;
    objc_msgSend((id)objc_msgSend((id)PAL::getUIScreenClass(v6), "mainScreen"), "scale");
    *(float *)&v11 = v11;
    *((double *)v4 + 12) = *(float *)&v11;
    v12 = (WebCore::LegacyTileCache *)operator new();
    WebCore::LegacyTileCache::LegacyTileCache(v12, (WAKWindow *)v4);
    *((_QWORD *)v4 + 2) = v12;
    v13 = (_OWORD *)MEMORY[0x1E0C9D628];
    v14 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    *(_OWORD *)(v4 + 24) = *MEMORY[0x1E0C9D628];
    *(_OWORD *)(v4 + 40) = v14;
    v15 = v13[1];
    *(_OWORD *)(v4 + 168) = *v13;
    *(_OWORD *)(v4 + 184) = v15;
  }
  return (WAKWindow *)v4;
}

- (WAKWindow)initWithFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  WAKWindow *v7;
  WAKWindow *v8;
  double v9;
  CGSize v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12.receiver = self;
  v12.super_class = (Class)WAKWindow;
  v7 = -[WAKWindow init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_frame.origin.x = x;
    v7->_frame.origin.y = y;
    v7->_frame.size.width = width;
    v7->_frame.size.height = height;
    objc_msgSend((id)objc_msgSend((id)PAL::getUIScreenClass((PAL *)v7), "mainScreen"), "scale");
    *(float *)&v9 = v9;
    v8->_screenScale = *(float *)&v9;
    v10 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    v8->_exposedScrollViewRect.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    v8->_exposedScrollViewRect.size = v10;
  }
  return v8;
}

- (void)dealloc
{
  id *tileCache;
  objc_super v4;

  tileCache = (id *)self->_tileCache;
  if (tileCache)
  {
    WebCore::LegacyTileCache::~LegacyTileCache(tileCache);
    MEMORY[0x19AEA7644]();
  }

  v4.receiver = self;
  v4.super_class = (Class)WAKWindow;
  -[WAKWindow dealloc](&v4, sel_dealloc);
}

- (void)setContentView:(id)a3
{
  id v5;

  v5 = a3;

  if (a3)
    _WKViewSetWindow(objc_msgSend(a3, "_viewRef"), self);
  self->_contentView = (WAKView *)a3;
}

- (id)contentView
{
  return self->_contentView;
}

- (void)close
{
  WAKView *contentView;

  contentView = self->_contentView;
  if (contentView)
  {
    _WKViewSetWindow((uint64_t)-[WAKView _viewRef](contentView, "_viewRef"), 0);

    self->_contentView = 0;
  }

  self->_responderView = 0;
}

- (id)firstResponder
{
  return self->_responderView;
}

- (id)_newFirstResponderAfterResigning
{
  return self->_nextResponder;
}

- (CGPoint)convertBaseToScreen:(CGPoint)a3
{
  double y;
  double x;
  CALayer *hostLayer;
  CALayer *i;
  double v8;
  double v9;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  hostLayer = self->_hostLayer;
  for (i = hostLayer; -[CALayer superlayer](i, "superlayer"); hostLayer = i)
    i = -[CALayer superlayer](hostLayer, "superlayer");
  -[CALayer convertPoint:toLayer:](self->_hostLayer, "convertPoint:toLayer:", hostLayer, x, y);
  result.y = v9;
  result.x = v8;
  return result;
}

- (CGPoint)convertScreenToBase:(CGPoint)a3
{
  double y;
  double x;
  CALayer *hostLayer;
  CALayer *i;
  double v8;
  double v9;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  hostLayer = self->_hostLayer;
  for (i = hostLayer; -[CALayer superlayer](i, "superlayer"); hostLayer = i)
    i = -[CALayer superlayer](hostLayer, "superlayer");
  -[CALayer convertPoint:fromLayer:](self->_hostLayer, "convertPoint:fromLayer:", hostLayer, x, y);
  result.y = v9;
  result.x = v8;
  return result;
}

- (CGRect)convertRectToScreen:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CALayer *hostLayer;
  CALayer *i;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  hostLayer = self->_hostLayer;
  for (i = hostLayer; -[CALayer superlayer](i, "superlayer"); hostLayer = i)
    i = -[CALayer superlayer](hostLayer, "superlayer");
  -[CALayer convertRect:toLayer:](self->_hostLayer, "convertRect:toLayer:", hostLayer, x, y, width, height);
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (CGRect)convertRectFromScreen:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CALayer *hostLayer;
  CALayer *i;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  hostLayer = self->_hostLayer;
  for (i = hostLayer; -[CALayer superlayer](i, "superlayer"); hostLayer = i)
    i = -[CALayer superlayer](hostLayer, "superlayer");
  -[CALayer convertRect:fromLayer:](self->_hostLayer, "convertRect:fromLayer:", hostLayer, x, y, width, height);
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (BOOL)isKeyWindow
{
  return 1;
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  void (*v3[5])(_QWORD);

  if (self->_visible != a3)
  {
    self->_visible = a3;
    v3[0] = (void (*)(_QWORD))MEMORY[0x1E0C809B0];
    v3[1] = (void (*)(_QWORD))3221225472;
    v3[2] = (void (*)(_QWORD))__24__WAKWindow_setVisible___block_invoke;
    v3[3] = (void (*)(_QWORD))&unk_1E3203658;
    v3[4] = (void (*)(_QWORD))self;
    WebThreadRun(v3);
  }
}

uint64_t __24__WAKWindow_setVisible___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("WAKWindowVisibilityDidChangeNotification"), *(_QWORD *)(a1 + 32), 0);
}

- (unint64_t)keyViewSelectionDirection
{
  return 0;
}

- (BOOL)resignFirstResponder
{
  WAKView *responderView;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(void);
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WAKWindow;
  LODWORD(responderView) = -[WAKResponder resignFirstResponder](&v8, sel_resignFirstResponder);
  if ((_DWORD)responderView)
  {
    responderView = self->_responderView;
    if (responderView)
    {
      v4 = -[WAKView _viewRef](responderView, "_viewRef");
      if (!v4
        || (v5 = *(_QWORD *)(v4 + 16)) == 0
        || (v6 = *(uint64_t (**)(void))(v5 + 16)) == 0
        || (LODWORD(responderView) = v6(), (_DWORD)responderView))
      {
        self->_nextResponder = 0;

        self->_responderView = 0;
        LOBYTE(responderView) = 1;
      }
    }
  }
  return (char)responderView;
}

- (BOOL)makeFirstResponder:(id)a3
{
  WAKView *responderView;
  uint64_t v6;
  uint64_t v7;
  unsigned int (*v8)(void);
  _WKView *v9;
  _WKViewContext *var1;
  unsigned int (*responderCallback)(void);
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(void);
  int v15;
  char v16;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    LOBYTE(v15) = 0;
    return v15;
  }
  responderView = self->_responderView;
  if (responderView == a3)
    goto LABEL_21;
  if (a3)
  {
    v6 = objc_msgSend(a3, "_viewRef");
    if (v6)
    {
      v7 = *(_QWORD *)(v6 + 16);
      if (v7)
      {
        v8 = *(unsigned int (**)(void))(v7 + 16);
        if (v8)
        {
          if (!v8())
          {
            v16 = 1;
            goto LABEL_26;
          }
        }
      }
    }
    responderView = self->_responderView;
  }
  if (responderView)
  {
    self->_nextResponder = (WAKView *)a3;
    v9 = -[WAKView _viewRef](self->_responderView, "_viewRef");
    if (!v9
      || (var1 = v9->var1) == 0
      || (responderCallback = (unsigned int (*)(void))var1->responderCallback) == 0
      || responderCallback())
    {
      self->_nextResponder = 0;

      self->_responderView = 0;
      goto LABEL_15;
    }
    v16 = 0;
    self->_nextResponder = 0;
LABEL_26:
    if (a3)
      LOBYTE(v15) = 0;
    else
      LOBYTE(v15) = v16;
    return v15;
  }
LABEL_15:
  if (!a3)
  {
LABEL_21:
    LOBYTE(v15) = 1;
    return v15;
  }
  v12 = objc_msgSend(a3, "_viewRef");
  if (!v12
    || (v13 = *(_QWORD *)(v12 + 16)) == 0
    || (v14 = *(uint64_t (**)(void))(v13 + 16)) == 0
    || (v15 = v14()) != 0)
  {
    self->_responderView = (WAKView *)a3;
    goto LABEL_21;
  }
  return v15;
}

- (void)setFrame:(CGRect)a3 display:(BOOL)a4
{
  self->_frame = a3;
}

- (CGRect)frame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frame.origin.x;
  y = self->_frame.origin.y;
  width = self->_frame.size.width;
  height = self->_frame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setContentRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_frame;
  WebCore::LegacyTileCache *tileCache;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_frame = &self->_frame;
  if (!CGRectEqualToRect(a3, self->_frame))
  {
    p_frame->origin.x = x;
    p_frame->origin.y = y;
    p_frame->size.width = width;
    p_frame->size.height = height;
    tileCache = (WebCore::LegacyTileCache *)self->_tileCache;
    if (tileCache)
      WebCore::LegacyTileCache::hostLayerSizeChanged(tileCache);
  }
}

- (void)setScreenSize:(CGSize)a3
{
  self->_screenSize = a3;
}

- (CGSize)screenSize
{
  double width;
  double height;
  CGSize result;

  width = self->_screenSize.width;
  height = self->_screenSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setAvailableScreenSize:(CGSize)a3
{
  self->_availableScreenSize = a3;
}

- (CGSize)availableScreenSize
{
  double width;
  double height;
  CGSize result;

  width = self->_availableScreenSize.width;
  height = self->_availableScreenSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setScreenScale:(double)a3
{
  void (*v3[5])(_QWORD);

  self->_screenScale = a3;
  v3[0] = (void (*)(_QWORD))MEMORY[0x1E0C809B0];
  v3[1] = (void (*)(_QWORD))3221225472;
  v3[2] = (void (*)(_QWORD))__28__WAKWindow_setScreenScale___block_invoke;
  v3[3] = (void (*)(_QWORD))&unk_1E3203658;
  v3[4] = (void (*)(_QWORD))self;
  WebThreadRun(v3);
}

uint64_t __28__WAKWindow_setScreenScale___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("WAKWindowScreenScaleDidChangeNotification"), *(_QWORD *)(a1 + 32), 0);
}

- (double)screenScale
{
  return self->_screenScale;
}

- (void)setRootLayer:(id)a3
{
  self->_rootLayer = (CALayer *)a3;
}

- (id)rootLayer
{
  return self->_rootLayer;
}

- (void)sendEvent:(id)a3
{
  void (*v3[6])(_QWORD);

  v3[0] = (void (*)(_QWORD))MEMORY[0x1E0C809B0];
  v3[1] = (void (*)(_QWORD))3221225472;
  v3[2] = (void (*)(_QWORD))__23__WAKWindow_sendEvent___block_invoke;
  v3[3] = (void (*)(_QWORD))&unk_1E33557F0;
  v3[4] = (void (*)(_QWORD))self;
  v3[5] = (void (*)(_QWORD))a3;
  WebThreadRun(v3);
}

uint64_t __23__WAKWindow_sendEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sendEventSynchronously:", *(_QWORD *)(a1 + 40));
}

- (void)sendEventSynchronously:(id)a3
{
  uint64_t v5;
  const void *v6;
  unsigned int v7;
  WAKView *contentView;
  id v9;
  WAKView *v10;
  id v11;
  const void *v12;

  if ((byte_1EE337829 & 1) != 0)
  {
    v5 = qword_1EE337840;
  }
  else
  {
    v5 = 0;
    qword_1EE337840 = 0;
    byte_1EE337829 = 1;
  }
  qword_1EE337840 = 0;
  if (a3)
  {
    CFRetain(a3);
    v6 = (const void *)qword_1EE337840;
    qword_1EE337840 = (uint64_t)a3;
    if (v6)
      CFRelease(v6);
  }
  v7 = objc_msgSend(a3, "type");
  if (v7 <= 9)
  {
    if (((1 << v7) & 0xB2) != 0)
    {
      -[WAKView handleEvent:](self->_responderView, "handleEvent:", a3);
    }
    else if (((1 << v7) & 0x341) != 0)
    {
      contentView = self->_contentView;
      objc_msgSend(a3, "locationInWindow");
      v9 = -[WAKView hitTest:](contentView, "hitTest:");
      if (v9)
      {
        -[WAKWindow makeFirstResponder:](self, "makeFirstResponder:", v9);
        objc_msgSend(v9, "handleEvent:", a3);
      }
    }
    else
    {
      v10 = self->_contentView;
      objc_msgSend(a3, "locationInWindow");
      v11 = -[WAKView hitTest:](v10, "hitTest:");
      if (v11)
        objc_msgSend(v11, "handleEvent:", a3);
    }
  }
  if ((byte_1EE337829 & 1) != 0)
  {
    v12 = (const void *)qword_1EE337840;
    qword_1EE337840 = v5;
    if (v12)
      CFRelease(v12);
  }
  else
  {
    byte_1EE337829 = 1;
    qword_1EE337840 = v5;
  }
}

- (void)sendMouseMoveEvent:(id)a3 contentChange:(int *)a4
{
  void (*v4[7])(_QWORD);

  v4[0] = (void (*)(_QWORD))MEMORY[0x1E0C809B0];
  v4[1] = (void (*)(_QWORD))3221225472;
  v4[2] = (void (*)(_QWORD))__46__WAKWindow_sendMouseMoveEvent_contentChange___block_invoke;
  v4[3] = (void (*)(_QWORD))&unk_1E3355E00;
  v4[4] = (void (*)(_QWORD))self;
  v4[5] = (void (*)(_QWORD))a3;
  v4[6] = (void (*)(_QWORD))a4;
  WebThreadRun(v4);
}

uint64_t __46__WAKWindow_sendMouseMoveEvent_contentChange___block_invoke(uint64_t a1)
{
  uint64_t result;
  _DWORD *v3;

  result = objc_msgSend(*(id *)(a1 + 32), "sendEvent:", *(_QWORD *)(a1 + 40));
  v3 = *(_DWORD **)(a1 + 48);
  if (v3)
    *v3 = 1;
  return result;
}

- (void)setExposedScrollViewRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  Lock *p_exposedScrollViewRectLock;
  int v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_exposedScrollViewRectLock = &self->_exposedScrollViewRectLock;
  if (__ldaxr(&self->_exposedScrollViewRectLock.m_byte.value.__a_.__a_value))
  {
    __clrex();
  }
  else if (!__stxr(1u, &p_exposedScrollViewRectLock->m_byte.value.__a_.__a_value))
  {
    goto LABEL_5;
  }
  MEMORY[0x19AEA534C](&self->_exposedScrollViewRectLock, a2);
LABEL_5:
  self->_exposedScrollViewRect.origin.x = x;
  self->_exposedScrollViewRect.origin.y = y;
  self->_exposedScrollViewRect.size.width = width;
  self->_exposedScrollViewRect.size.height = height;
  v10 = __ldxr(&p_exposedScrollViewRectLock->m_byte.value.__a_.__a_value);
  if (v10 != 1)
  {
    __clrex();
    goto LABEL_9;
  }
  if (__stlxr(0, &p_exposedScrollViewRectLock->m_byte.value.__a_.__a_value))
LABEL_9:
    WTF::Lock::unlockSlow((WTF::Lock *)p_exposedScrollViewRectLock);
}

- (CGRect)exposedScrollViewRect
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  Lock *p_exposedScrollViewRectLock;
  _BOOL4 IsNull;
  _BOOL4 v10;
  int v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  p_exposedScrollViewRectLock = &self->_exposedScrollViewRectLock;
  if (__ldaxr(&self->_exposedScrollViewRectLock.m_byte.value.__a_.__a_value))
  {
    __clrex();
  }
  else if (!__stxr(1u, &p_exposedScrollViewRectLock->m_byte.value.__a_.__a_value))
  {
    goto LABEL_5;
  }
  MEMORY[0x19AEA534C](&self->_exposedScrollViewRectLock, a2);
LABEL_5:
  IsNull = CGRectIsNull(self->_exposedScrollViewRect);
  v10 = IsNull;
  if (!IsNull)
  {
    x = self->_exposedScrollViewRect.origin.x;
    y = self->_exposedScrollViewRect.origin.y;
    width = self->_exposedScrollViewRect.size.width;
    height = self->_exposedScrollViewRect.size.height;
  }
  v11 = __ldxr(&p_exposedScrollViewRectLock->m_byte.value.__a_.__a_value);
  if (v11 != 1)
  {
    __clrex();
LABEL_13:
    WTF::Lock::unlockSlow((WTF::Lock *)p_exposedScrollViewRectLock);
    if (!v10)
      goto LABEL_11;
    goto LABEL_10;
  }
  if (__stlxr(0, &p_exposedScrollViewRectLock->m_byte.value.__a_.__a_value))
    goto LABEL_13;
  if (IsNull)
  {
LABEL_10:
    -[WAKWindow visibleRect](self, "visibleRect");
    x = v12;
    y = v13;
    width = v14;
    height = v15;
  }
LABEL_11:
  v16 = x;
  v17 = y;
  v18 = width;
  v19 = height;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (void)layoutTiles
{
  _BYTE *tileCache;
  void (*v3)(_QWORD);
  void (*v4[6])(_QWORD);

  tileCache = self->_tileCache;
  if (tileCache)
  {
    if (!tileCache[61])
    {
      tileCache[61] = 1;
      v3 = (void (*)(_QWORD))*((_QWORD *)tileCache + 2);
      v4[0] = (void (*)(_QWORD))MEMORY[0x1E0C809B0];
      v4[1] = (void (*)(_QWORD))3221225472;
      v4[2] = (void (*)(_QWORD))___ZN7WebCore15LegacyTileCache11layoutTilesEv_block_invoke;
      v4[3] = (void (*)(_QWORD))&unk_1E3353458;
      v4[4] = v3;
      v4[5] = (void (*)(_QWORD))tileCache;
      WebThreadRun(v4);
    }
  }
}

- (void)layoutTilesNow
{
  void *tileCache;

  tileCache = self->_tileCache;
  if (tileCache)
    WebCore::LegacyTileCache::layoutTilesNow((uint64_t)tileCache);
}

- (void)layoutTilesNowForRect:(CGRect)a3
{
  uint64_t v3;
  uint64_t v4;
  char *tileCache;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  float v10;
  float v11;
  CGFloat v12;
  float MaxX;
  unsigned int v14;
  float MaxY;
  unsigned __int8 *v16;
  uint64_t v18;
  int v19;
  uint64_t v20;
  int v21;
  int v22;
  CGRect v23;

  tileCache = (char *)self->_tileCache;
  if (tileCache)
  {
    height = a3.size.height;
    width = a3.size.width;
    y = a3.origin.y;
    x = a3.origin.x;
    v10 = a3.origin.x;
    LODWORD(v3) = vcvtms_s32_f32(v10);
    v11 = a3.origin.y;
    LODWORD(v4) = vcvtms_s32_f32(v11);
    v12 = x;
    MaxX = CGRectGetMaxX(a3);
    v14 = vcvtps_s32_f32(MaxX);
    v23.origin.x = x;
    v23.origin.y = y;
    v23.size.width = width;
    v23.size.height = height;
    MaxY = CGRectGetMaxY(v23);
    v20 = v3 | (v4 << 32);
    v21 = v14 - v3;
    v22 = vcvtps_s32_f32(MaxY) - v4;
    v16 = (unsigned __int8 *)(tileCache + 172);
    if (__ldaxr((unsigned __int8 *)tileCache + 172))
    {
      __clrex();
    }
    else if (!__stxr(1u, v16))
    {
LABEL_6:
      if (!tileCache[60]
        || *((_DWORD *)tileCache + 13) == 3
        || (v18 = *((_QWORD *)tileCache + 10)) == 0
        || *((float *)tileCache + 40) != *(float *)(v18 + 32))
      {
        v18 = *((_QWORD *)tileCache + 9);
      }
      WebCore::LegacyTileGrid::addTilesCoveringRect((id *)v18, (const WebCore::IntRect *)&v20);
      v19 = __ldxr(v16);
      if (v19 == 1)
      {
        if (!__stlxr(0, v16))
          return;
      }
      else
      {
        __clrex();
      }
      WTF::Lock::unlockSlow((WTF::Lock *)(tileCache + 172));
      return;
    }
    MEMORY[0x19AEA534C](tileCache + 172);
    goto LABEL_6;
  }
}

- (void)setNeedsDisplay
{
  WebCore::LegacyTileCache *tileCache;
  __int128 v3;

  tileCache = (WebCore::LegacyTileCache *)self->_tileCache;
  if (tileCache)
  {
    v3 = xmmword_1968DDAD0;
    WebCore::LegacyTileCache::setNeedsDisplayInRect(tileCache, (const WebCore::IntRect *)&v3);
  }
}

- (void)setNeedsDisplayInRect:(CGRect)a3
{
  uint64_t v3;
  uint64_t v4;
  WebCore::LegacyTileCache *tileCache;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  float v10;
  float v11;
  CGFloat v12;
  float MaxX;
  unsigned int v14;
  float MaxY;
  uint64_t v16;
  int v17;
  int v18;
  CGRect v19;

  tileCache = (WebCore::LegacyTileCache *)self->_tileCache;
  if (tileCache)
  {
    height = a3.size.height;
    width = a3.size.width;
    y = a3.origin.y;
    x = a3.origin.x;
    v10 = a3.origin.x;
    LODWORD(v3) = vcvtms_s32_f32(v10);
    v11 = a3.origin.y;
    LODWORD(v4) = vcvtms_s32_f32(v11);
    v12 = x;
    MaxX = CGRectGetMaxX(a3);
    v14 = vcvtps_s32_f32(MaxX);
    v19.origin.x = x;
    v19.origin.y = y;
    v19.size.width = width;
    v19.size.height = height;
    MaxY = CGRectGetMaxY(v19);
    v16 = v3 | (v4 << 32);
    v17 = v14 - v3;
    v18 = vcvtps_s32_f32(MaxY) - v4;
    WebCore::LegacyTileCache::setNeedsDisplayInRect(tileCache, (const WebCore::IntRect *)&v16);
  }
}

- (BOOL)tilesOpaque
{
  _BYTE *tileCache;

  tileCache = self->_tileCache;
  return tileCache && tileCache[63] != 0;
}

- (void)setTilesOpaque:(BOOL)a3
{
  void *tileCache;

  tileCache = self->_tileCache;
  if (tileCache)
    WebCore::LegacyTileCache::setTilesOpaque((uint64_t)tileCache, a3);
}

- (void)setIsInSnapshottingPaint:(BOOL)a3
{
  self->_isInSnapshottingPaint = a3;
}

- (BOOL)isInSnapshottingPaint
{
  return self->_isInSnapshottingPaint;
}

- (void)setEntireWindowVisibleForTesting:(BOOL)a3
{
  self->_entireWindowVisibleForTesting = a3;
}

- (CGRect)_visibleRectRespectingMasksToBounds:(BOOL)a3
{
  _BOOL4 v3;
  CGRect *p_frozenVisibleRect;
  CALayer *hostLayer;
  double v7;
  CGFloat x;
  double v9;
  CGFloat y;
  double v11;
  CGFloat width;
  double v13;
  CGFloat height;
  uint64_t v15;
  int v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CALayer *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  Class v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect result;
  CGRect v43;
  CGRect v44;
  CGRect v45;

  v3 = a3;
  p_frozenVisibleRect = &self->_frozenVisibleRect;
  if (!CGRectIsNull(self->_frozenVisibleRect))
  {
    x = p_frozenVisibleRect->origin.x;
    y = p_frozenVisibleRect->origin.y;
    width = p_frozenVisibleRect->size.width;
    height = p_frozenVisibleRect->size.height;
    goto LABEL_20;
  }
  hostLayer = self->_hostLayer;
  -[CALayer bounds](hostLayer, "bounds");
  x = v7;
  y = v9;
  width = v11;
  height = v13;
  if (!self->_entireWindowVisibleForTesting)
  {
    v15 = -[CALayer superlayer](hostLayer, "superlayer");
    if ((_MergedGlobals_85 & 1) != 0)
    {
      if (v15)
        goto LABEL_5;
    }
    else
    {
      v26 = v15;
      v27 = NSClassFromString(CFSTR("UIWindow"));
      v15 = v26;
      qword_1EE337838 = (uint64_t)v27;
      _MergedGlobals_85 = 1;
      if (v26)
      {
LABEL_5:
        v16 = !v3;
        v17 = height;
        v18 = width;
        v19 = y;
        v20 = x;
        while (hostLayer != self->_rootLayer)
        {
          v21 = (CALayer *)v15;
          if (-[CALayer delegate](hostLayer, "delegate"))
          {
            -[CALayer delegate](hostLayer, "delegate");
            if ((objc_opt_isKindOfClass() & 1) != 0)
              break;
          }
          -[CALayer convertRect:fromLayer:](v21, "convertRect:fromLayer:", hostLayer, v20, v19, v18, v17);
          v20 = v22;
          v19 = v23;
          v18 = v24;
          v17 = v25;
          if ((-[CALayer masksToBounds](v21, "masksToBounds") | v16) == 1)
          {
            -[CALayer bounds](v21, "bounds");
            v43.origin.x = v20;
            v43.origin.y = v19;
            v43.size.width = v18;
            v43.size.height = v17;
            v37 = CGRectIntersection(v36, v43);
            v20 = v37.origin.x;
            v19 = v37.origin.y;
            v18 = v37.size.width;
            v17 = v37.size.height;
          }
          v15 = -[CALayer superlayer](v21, "superlayer");
          hostLayer = v21;
          if (!v15)
            goto LABEL_17;
        }
        goto LABEL_16;
      }
    }
    v20 = x;
    v19 = y;
    v18 = width;
    v17 = height;
LABEL_16:
    v21 = hostLayer;
LABEL_17:
    if (v21 != self->_hostLayer)
    {
      -[CALayer bounds](v21, "bounds");
      v44.origin.x = v20;
      v44.origin.y = v19;
      v44.size.width = v18;
      v44.size.height = v17;
      v39 = CGRectIntersection(v38, v44);
      -[CALayer convertRect:fromLayer:](self->_hostLayer, "convertRect:fromLayer:", v21, v39.origin.x, v39.origin.y, v39.size.width, v39.size.height);
      v20 = v28;
      v19 = v29;
      v18 = v30;
      v17 = v31;
    }
    v40.origin.x = x;
    v40.origin.y = y;
    v40.size.width = width;
    v40.size.height = height;
    v45.origin.x = v20;
    v45.origin.y = v19;
    v45.size.width = v18;
    v45.size.height = v17;
    v41 = CGRectIntersection(v40, v45);
    x = v41.origin.x;
    y = v41.origin.y;
    width = v41.size.width;
    height = v41.size.height;
  }
LABEL_20:
  v32 = x;
  v33 = y;
  v34 = width;
  v35 = height;
  result.size.height = v35;
  result.size.width = v34;
  result.origin.y = v33;
  result.origin.x = v32;
  return result;
}

- (CGRect)visibleRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[WAKWindow _visibleRectRespectingMasksToBounds:](self, "_visibleRectRespectingMasksToBounds:", 0);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)extendedVisibleRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[WAKWindow _visibleRectRespectingMasksToBounds:](self, "_visibleRectRespectingMasksToBounds:", 1);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)removeAllNonVisibleTiles
{
  unsigned __int8 *tileCache;
  unsigned __int8 *v3;
  int v5;

  tileCache = (unsigned __int8 *)self->_tileCache;
  if (tileCache)
  {
    v3 = tileCache + 172;
    if (__ldaxr(tileCache + 172))
    {
      __clrex();
    }
    else if (!__stxr(1u, v3))
    {
      goto LABEL_6;
    }
    MEMORY[0x19AEA534C](tileCache + 172, a2);
LABEL_6:
    WebCore::LegacyTileCache::removeAllNonVisibleTilesInternal((WebCore::LegacyTileCache *)tileCache, (void *)a2);
    v5 = __ldxr(v3);
    if (v5 == 1)
    {
      if (!__stlxr(0, v3))
        return;
    }
    else
    {
      __clrex();
    }
    WTF::Lock::unlockSlow((WTF::Lock *)(tileCache + 172));
  }
}

- (void)removeAllTiles
{
  void *tileCache;

  tileCache = self->_tileCache;
  if (tileCache)
    WebCore::LegacyTileCache::removeAllTiles((uint64_t)tileCache, (void *)a2);
}

- (void)removeForegroundTiles
{
  void *tileCache;

  tileCache = self->_tileCache;
  if (tileCache)
    WebCore::LegacyTileCache::removeForegroundTiles((uint64_t)tileCache, (void *)a2);
}

- (void)setTilingMode:(int)a3
{
  WebCore::LegacyTileCache *tileCache;

  tileCache = (WebCore::LegacyTileCache *)self->_tileCache;
  if (tileCache)
    WebCore::LegacyTileCache::setTilingMode(tileCache, a3);
}

- (int)tilingMode
{
  _DWORD *tileCache;

  tileCache = self->_tileCache;
  if (tileCache)
    return tileCache[13];
  else
    return 4;
}

- (void)setTilingDirection:(int)a3
{
  _DWORD *tileCache;

  tileCache = self->_tileCache;
  if (tileCache)
    tileCache[14] = a3;
}

- (int)tilingDirection
{
  _DWORD *tileCache;

  tileCache = self->_tileCache;
  if (tileCache)
    return tileCache[14];
  else
    return 1;
}

- (void)setZoomedOutTileScale:(float)a3
{
  float *tileCache;

  tileCache = (float *)self->_tileCache;
  if (tileCache)
  {
    if (*(float *)(*((_QWORD *)tileCache + 9) + 32) == a3)
    {
      tileCache[42] = 0.0;
    }
    else
    {
      tileCache[42] = a3;
      if (*((_DWORD *)tileCache + 13) != 4)
        WebCore::LegacyTileCache::commitScaleChange((WebCore::LegacyTileCache *)tileCache);
    }
  }
}

- (float)zoomedOutTileScale
{
  _QWORD *tileCache;

  tileCache = self->_tileCache;
  if (tileCache)
    return *(float *)(tileCache[9] + 32);
  else
    return 1.0;
}

- (void)setCurrentTileScale:(float)a3
{
  WebCore::LegacyTileCache *tileCache;

  tileCache = (WebCore::LegacyTileCache *)self->_tileCache;
  if (tileCache)
    WebCore::LegacyTileCache::setCurrentScale(tileCache, a3);
}

- (float)currentTileScale
{
  float *tileCache;

  tileCache = (float *)self->_tileCache;
  if (tileCache)
    return tileCache[40];
  else
    return 1.0;
}

- (void)setKeepsZoomedOutTiles:(BOOL)a3
{
  _BYTE *tileCache;

  tileCache = self->_tileCache;
  if (tileCache)
    tileCache[60] = a3;
}

- (BOOL)keepsZoomedOutTiles
{
  _BYTE *tileCache;

  tileCache = self->_tileCache;
  return tileCache && tileCache[60] != 0;
}

- (void)tileCache
{
  return self->_tileCache;
}

- (void)setContentReplacementImage:(CGImage *)a3
{
  char *tileCache;
  unsigned __int8 *v4;
  int v6;
  CFTypeRef v7;
  CFTypeRef cf;

  tileCache = (char *)self->_tileCache;
  if (tileCache)
  {
    cf = a3;
    if (a3)
      CFRetain(a3);
    v4 = (unsigned __int8 *)(tileCache + 174);
    if (__ldaxr((unsigned __int8 *)tileCache + 174))
    {
      __clrex();
    }
    else if (!__stxr(1u, v4))
    {
      goto LABEL_8;
    }
    MEMORY[0x19AEA534C](tileCache + 174, a2);
LABEL_8:
    WTF::RetainPtr<CGColorSpace *>::operator=((const void **)tileCache + 1, &cf);
    v6 = __ldxr(v4);
    if (v6 == 1)
    {
      if (!__stlxr(0, v4))
      {
LABEL_13:
        v7 = cf;
        cf = 0;
        if (v7)
          CFRelease(v7);
        return;
      }
    }
    else
    {
      __clrex();
    }
    WTF::Lock::unlockSlow((WTF::Lock *)(tileCache + 174));
    goto LABEL_13;
  }
}

- (CGImage)contentReplacementImage
{
  unsigned __int8 *tileCache;
  unsigned __int8 *v3;
  int v5;

  tileCache = (unsigned __int8 *)self->_tileCache;
  if (!tileCache)
    return (CGImage *)tileCache;
  v3 = tileCache + 174;
  if (__ldaxr(tileCache + 174))
  {
    __clrex();
  }
  else if (!__stxr(1u, v3))
  {
    goto LABEL_6;
  }
  MEMORY[0x19AEA534C](tileCache + 174, a2);
LABEL_6:
  tileCache = (unsigned __int8 *)*((_QWORD *)tileCache + 1);
  if (tileCache)
    CFRetain(tileCache);
  v5 = __ldxr(v3);
  if (v5 != 1)
  {
    __clrex();
LABEL_14:
    WTF::Lock::unlockSlow((WTF::Lock *)v3);
    if (!tileCache)
      return (CGImage *)tileCache;
    goto LABEL_11;
  }
  if (__stlxr(0, v3))
    goto LABEL_14;
  if (tileCache)
LABEL_11:
    CFRelease(tileCache);
  return (CGImage *)tileCache;
}

- (void)displayRect:(CGRect)a3
{
  objc_msgSend(-[WAKWindow contentView](self, "contentView"), "displayRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)willRotate
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;

  -[WAKWindow visibleRect](self, "visibleRect");
  self->_frozenVisibleRect.origin.x = v3;
  self->_frozenVisibleRect.origin.y = v4;
  self->_frozenVisibleRect.size.width = v5;
  self->_frozenVisibleRect.size.height = v6;
}

- (void)didRotate
{
  CGSize v2;

  v2 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
  self->_frozenVisibleRect.origin = (CGPoint)*MEMORY[0x1E0C9D628];
  self->_frozenVisibleRect.size = v2;
}

+ (void)setOrientationProvider:(id)a3
{
  const void *v4;

  if ((byte_1EE33782A & 1) != 0)
  {
    if (!a3)
      goto LABEL_4;
    goto LABEL_3;
  }
  qword_1EE337848 = 0;
  byte_1EE33782A = 1;
  if (a3)
LABEL_3:
    CFRetain(a3);
LABEL_4:
  v4 = (const void *)qword_1EE337848;
  qword_1EE337848 = (uint64_t)a3;
  if (v4)
    CFRelease(v4);
}

+ (BOOL)hasLandscapeOrientation
{
  void *v2;

  if (byte_1EE33782A == 1)
  {
    v2 = (void *)qword_1EE337848;
  }
  else
  {
    v2 = 0;
    qword_1EE337848 = 0;
    byte_1EE33782A = 1;
  }
  return objc_msgSend(v2, "hasLandscapeOrientation");
}

- (id)hostLayer
{
  return self->_hostLayer;
}

- (void)dumpTiles
{
  CGRect *p_frozenVisibleRect;
  CGSize v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CGRect frozenVisibleRect;

  p_frozenVisibleRect = &self->_frozenVisibleRect;
  frozenVisibleRect = self->_frozenVisibleRect;
  NSLog(CFSTR("================="), a2);
  if (!CGRectIsNull(*p_frozenVisibleRect))
  {
    NSLog(CFSTR("Visibility::Visible RECT IS CACHED: [%6.1f %6.1f %6.1f %6.1f]"), *(_QWORD *)&p_frozenVisibleRect->origin.x, *(_QWORD *)&p_frozenVisibleRect->origin.y, *(_QWORD *)&p_frozenVisibleRect->size.width, *(_QWORD *)&p_frozenVisibleRect->size.height);
    v4 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    p_frozenVisibleRect->origin = (CGPoint)*MEMORY[0x1E0C9D628];
    p_frozenVisibleRect->size = v4;
  }
  -[WAKWindow visibleRect](self, "visibleRect");
  NSLog(CFSTR("visibleRect = [%6.1f %6.1f %6.1f %6.1f]"), v5, v6, v7, v8);
  *p_frozenVisibleRect = frozenVisibleRect;
  WebCore::LegacyTileCache::dumpTiles((WebCore::LegacyTileCache *)self->_tileCache);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: WAK: %p; "), objc_opt_class(), self);
  -[WAKWindow frame](self, "frame");
  objc_msgSend(v3, "appendFormat:", CFSTR("frame = (%g %g; %g %g); "), v4, v5, v6, v7);
  objc_msgSend(v3, "appendFormat:", CFSTR("first responder = WK %p; "), self->_responderView);
  objc_msgSend(v3, "appendFormat:", CFSTR("next responder = WK %p; "), self->_nextResponder);
  objc_msgSend(v3, "appendFormat:", CFSTR("layer = %@>"), -[CALayer description](self->_hostLayer, "description"));
  return v3;
}

+ (id)currentEvent
{
  id result;

  if (byte_1EE337829 == 1)
    return (id)qword_1EE337840;
  result = 0;
  qword_1EE337840 = 0;
  byte_1EE337829 = 1;
  return result;
}

- (id)recursiveDescription
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  objc_msgSend(v3, "appendString:", -[WAKWindow description](self, "description"));
  objc_msgSend(-[WAKWindow contentView](self, "contentView"), "_appendDescriptionToString:atLevel:", v3, 1);
  return v3;
}

- (BOOL)useOrientationDependentFontAntialiasing
{
  return self->_useOrientationDependentFontAntialiasing;
}

- (void)setUseOrientationDependentFontAntialiasing:(BOOL)a3
{
  self->_useOrientationDependentFontAntialiasing = a3;
}

- (id).cxx_construct
{
  *((_BYTE *)self + 164) = 0;
  return self;
}

@end
