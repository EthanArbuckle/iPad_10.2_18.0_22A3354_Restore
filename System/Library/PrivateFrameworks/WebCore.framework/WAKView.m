@implementation WAKView

- (BOOL)accessibilityIsIgnored
{
  return 1;
}

- (void)handleEvent:(id)a3
{
  WAKView *v4;

  if (self)
  {
    v4 = self;
    do
    {
      if (-[WAKView _selfHandleEvent:](v4, "_selfHandleEvent:", a3))
        break;
      v4 = -[WAKView superview](v4, "superview");
    }
    while (v4);
  }
}

- (BOOL)_selfHandleEvent:(id)a3
{
  switch(objc_msgSend(a3, "type"))
  {
    case 0u:
      -[WAKResponder mouseDown:](self, "mouseDown:", a3);
      break;
    case 1u:
      -[WAKResponder mouseUp:](self, "mouseUp:", a3);
      break;
    case 2u:
      -[WAKResponder mouseMoved:](self, "mouseMoved:", a3);
      break;
    case 3u:
      -[WAKResponder scrollWheel:](self, "scrollWheel:", a3);
      break;
    case 4u:
      -[WAKResponder keyDown:](self, "keyDown:", a3);
      break;
    case 5u:
      -[WAKResponder keyUp:](self, "keyUp:", a3);
      break;
    case 6u:
    case 7u:
    case 8u:
    case 9u:
      -[WAKResponder touch:](self, "touch:", a3);
      break;
    default:
      return 1;
  }
  return 1;
}

- (BOOL)_handleResponderCall:(int)a3
{
  if (a3 == 2)
    return -[WAKResponder resignFirstResponder](self, "resignFirstResponder");
  if (a3 == 1)
    return -[WAKResponder becomeFirstResponder](self, "becomeFirstResponder");
  if (a3)
    return 0;
  return -[WAKResponder acceptsFirstResponder](self, "acceptsFirstResponder");
}

+ (id)_wrapperForViewRef:(_WKView *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _WKClassInfo *var1;

  var1 = a3->var0.var1;
  if (var1 == (_WKClassInfo *)&WKViewClassInfo)
    return (id)(id)CFMakeCollectable(-[WAKView _initWithViewRef:]([WAKView alloc], "_initWithViewRef:", a3));
  WKReportError("/Library/Caches/com.apple.xbs/Sources/WebCore/Source/WebCore/platform/ios/wak/WAKView.mm", 203, "+[WAKView _wrapperForViewRef:]", "unable to create wrapper for %s\n", v3, v4, v5, v6, *((_QWORD *)var1 + 1));
  return 0;
}

- (id)_initWithViewRef:(_WKView *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WAKView;
  result = -[WAKView init](&v5, sel_init);
  if (result)
  {
    ++a3->var0.var0;
    *((_QWORD *)result + 7) = a3;
    a3->var9 = result;
  }
  return result;
}

- (WAKView)init
{
  return -[WAKView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (WAKView)initWithFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _QWORD *v8;
  _QWORD *v9;
  WAKView *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  WAKView *v15;
  int v16;
  _QWORD *i;
  void (*v18)(_QWORD *);
  char v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = malloc_type_calloc(0x70uLL, 1uLL, 0x2B517A3EuLL);
  v9 = v8;
  if (v8)
  {
    v8[1] = &WKViewClassInfo;
    ++*(_DWORD *)v8;
    *((CGFloat *)v8 + 6) = x;
    *((CGFloat *)v8 + 7) = y;
    *((_OWORD *)v8 + 4) = *MEMORY[0x1E0C9D538];
    *((CGFloat *)v8 + 10) = width;
    *((CGFloat *)v8 + 11) = height;
    v8[2] = &self->viewContext;
    v8[12] = 0x3F80000000000000;
  }
  v10 = -[WAKView _initWithViewRef:](self, "_initWithViewRef:", v8);
  v15 = v10;
  if (v10)
  {
    v10->viewContext.notificationCallback = notificationCallback;
    v10->viewContext.notificationUserInfo = v10;
    v10->viewContext.responderCallback = responderCallback;
    v10->viewContext.responderUserInfo = v10;
    v10->viewContext.willRemoveSubviewCallback = willRemoveSubviewCallback;
    v10->viewContext.invalidateGStateCallback = invalidateGStateCallback;
  }
  if (*(_DWORD *)v9)
  {
    v16 = *(_DWORD *)v9 - 1;
    *(_DWORD *)v9 = v16;
    if (!v16)
    {
      for (i = (_QWORD *)v9[1]; i; i = (_QWORD *)*i)
      {
        v18 = (void (*)(_QWORD *))i[2];
        if (v18)
          v18(v9);
      }
    }
  }
  else
  {
    WKReportError("/Library/Caches/com.apple.xbs/Sources/WebCore/Source/WebCore/platform/ios/wak/WKUtilities.c", 62, "void WAKRelease(const void *)", "attempt to release invalid object", v11, v12, v13, v14, v20);
  }
  return v15;
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _WKView *viewRef;
  _WKView *v9;
  int v10;
  _WKClassInfo *i;
  void (*v12)(_WKView *);
  objc_super v13;

  v3 = (void *)-[NSMutableSet copy](self->subviewReferences, "copy");
  objc_msgSend(v3, "makeObjectsPerformSelector:", sel_removeFromSuperview);
  if (v3)
    CFRelease(v3);
  viewRef = self->viewRef;
  if (viewRef)
  {
    viewRef->var1 = 0;
    self->viewRef->var9 = 0;
    v9 = self->viewRef;
    if (v9->var0.var0)
    {
      v10 = v9->var0.var0 - 1;
      v9->var0.var0 = v10;
      if (!v10)
      {
        for (i = v9->var0.var1; i; i = *(_WKClassInfo **)i)
        {
          v12 = (void (*)(_WKView *))*((_QWORD *)i + 2);
          if (v12)
            v12(v9);
        }
      }
    }
    else
    {
      WKReportError("/Library/Caches/com.apple.xbs/Sources/WebCore/Source/WebCore/platform/ios/wak/WKUtilities.c", 62, "void WAKRelease(const void *)", "attempt to release invalid object", v4, v5, v6, v7, (char)v13.receiver);
    }
  }

  v13.receiver = self;
  v13.super_class = (Class)WAKView;
  -[WAKView dealloc](&v13, sel_dealloc);
}

- (id)window
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _WKView *viewRef;
  char vars0;

  viewRef = self->viewRef;
  if (viewRef)
    return viewRef->var2;
  WKReportError("/Library/Caches/com.apple.xbs/Sources/WebCore/Source/WebCore/platform/ios/wak/WKView.mm", 389, "WAKWindow *WKViewGetWindow(WKViewRef)", "invalid parameter", v2, v3, v4, v5, vars0);
  return 0;
}

- (_WKView)_viewRef
{
  return self->viewRef;
}

- (id)_subviewReferences
{
  id result;

  result = self->subviewReferences;
  if (!result)
  {
    result = objc_alloc_init(MEMORY[0x1E0C99E20]);
    self->subviewReferences = (NSMutableSet *)result;
  }
  return result;
}

- (id)subviews
{
  _WKView *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const __CFArray *var4;
  CFIndex Count;
  CFIndex v9;
  void *v10;
  void *v11;
  char v13;
  CFRange v14;

  v2 = -[WAKView _viewRef](self, "_viewRef");
  if (!v2)
  {
    WKReportError("/Library/Caches/com.apple.xbs/Sources/WebCore/Source/WebCore/platform/ios/wak/WKView.mm", 399, "CFArrayRef WKViewGetSubviews(WKViewRef)", "invalid parameter", v3, v4, v5, v6, v13);
    return (id)MEMORY[0x1E0C9AA60];
  }
  var4 = v2->var4;
  if (!var4)
    return (id)MEMORY[0x1E0C9AA60];
  Count = CFArrayGetCount(v2->var4);
  if (!Count)
    return (id)MEMORY[0x1E0C9AA60];
  v9 = Count;
  v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", Count);
  if (!v10)
    return (id)MEMORY[0x1E0C9AA60];
  v11 = v10;
  v14.location = 0;
  v14.length = v9;
  CFArrayApplyFunction(var4, v14, (CFArrayApplierFunction)_WAKCopyWrapper, v10);
  return v11;
}

- (id)superview
{
  _WKView *var3;
  id result;

  var3 = self->viewRef->var3;
  if (!var3)
    return 0;
  result = var3->var9;
  if (!result)
    return +[WAKView _wrapperForViewRef:](WAKView, "_wrapperForViewRef:");
  return result;
}

- (id)lastScrollableAncestor
{
  id v2;
  uint64_t v3;
  void *v4;
  double v6;
  double v7;
  CGFloat v8;
  CGFloat v9;
  double width;
  double height;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  CGAffineTransform v17;
  CGAffineTransform v18;
  CGAffineTransform v19;
  CGAffineTransform v20;
  CGRect v21;
  CGRect v22;

  v2 = -[WAKView superview](self, "superview");
  if (!v2)
    return 0;
  v3 = (uint64_t)v2;
  while (1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      break;
    v3 = objc_msgSend((id)v3, "superview");
    if (!v3)
      return 0;
  }
  v4 = 0;
  while (1)
  {
    v6 = *(double *)(v3 + 64);
    v7 = *(double *)(v3 + 72);
    v8 = *(double *)(v3 + 80);
    v9 = *(double *)(v3 + 88);
    CGAffineTransformMakeTranslation(&v17, *(CGFloat *)(v3 + 48), *(CGFloat *)(v3 + 56));
    v19 = v17;
    CGAffineTransformScale(&v20, &v19, *(float *)(v3 + 100), *(float *)(v3 + 100));
    v17 = v20;
    v18 = v20;
    CGAffineTransformTranslate(&v20, &v18, -v6, -v7);
    v17 = v20;
    v21.origin.x = v6;
    v21.origin.y = v7;
    v21.size.width = v8;
    v21.size.height = v9;
    v22 = CGRectApplyAffineTransform(v21, &v17);
    width = v22.size.width;
    height = v22.size.height;
    v12 = (void *)objc_msgSend((id)v3, "documentView", v22.origin.x, v22.origin.y);
    v13 = objc_msgSend((id)v3, "superview");
    if (!v13)
      break;
    v3 = v13;
    while (1)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      v3 = objc_msgSend((id)v3, "superview");
      if (!v3)
        return v4;
    }
    objc_msgSend(v12, "frame");
    if (height != v15 || width != v14)
      v4 = v12;
  }
  return v4;
}

- (void)addSubview:(id)a3
{
  _WKView *viewRef;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  BOOL v12;
  __CFArray *var4;
  char v14;

  if (a3)
    CFRetain(a3);
  objc_msgSend(a3, "removeFromSuperview");
  viewRef = self->viewRef;
  v6 = objc_msgSend(a3, "_viewRef");
  v11 = (_QWORD *)v6;
  if (viewRef)
    v12 = v6 == 0;
  else
    v12 = 1;
  if (v12)
  {
    WKReportError("/Library/Caches/com.apple.xbs/Sources/WebCore/Source/WebCore/platform/ios/wak/WKView.mm", 409, "void WKViewAddSubview(WKViewRef, WKViewRef)", "invalid parameter", v7, v8, v9, v10, v14);
  }
  else
  {
    var4 = viewRef->var4;
    if (!var4)
    {
      var4 = CFArrayCreateMutable(0, 0, &WKCollectionArrayCallBacks);
      viewRef->var4 = var4;
    }
    CFArrayAppendValue(var4, v11);
    v11[4] = viewRef;
    _WKViewSetWindow((uint64_t)v11, viewRef->var2);
  }
  objc_msgSend(-[WAKView _subviewReferences](self, "_subviewReferences"), "addObject:", a3);
  if (a3)
    CFRelease(a3);
}

- (void)removeFromSuperview
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  char v12;

  v3 = -[WAKView superview](self, "superview");
  v11 = v3;
  if (v3)
    CFRetain(v3);
  WKViewRemoveFromSuperview(&self->viewRef->var0.var0, v4, v5, v6, v7, v8, v9, v10, v12);
  objc_msgSend((id)objc_msgSend(v11, "_subviewReferences"), "removeObject:", self);
  if (v11)
    CFRelease(v11);
}

- (void)setNeedsDisplay:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _WKView *viewRef;
  double *p_x;
  double *p_y;
  double *p_width;
  double *p_height;
  char v13;

  if (a3)
  {
    viewRef = self->viewRef;
    if (viewRef)
    {
      p_x = &viewRef->var6.origin.x;
      p_y = &viewRef->var6.origin.y;
      p_width = &viewRef->var6.size.width;
      p_height = &viewRef->var6.size.height;
    }
    else
    {
      WKReportError("/Library/Caches/com.apple.xbs/Sources/WebCore/Source/WebCore/platform/ios/wak/WKView.mm", 129, "CGRect WKViewGetBounds(WKViewRef)", "invalid parameter", v3, v4, v5, v6, v13);
      p_x = (double *)MEMORY[0x1E0C9D648];
      p_height = (double *)(MEMORY[0x1E0C9D648] + 24);
      p_y = (double *)(MEMORY[0x1E0C9D648] + 8);
      p_width = (double *)(MEMORY[0x1E0C9D648] + 16);
    }
    -[WAKView setNeedsDisplayInRect:](self, "setNeedsDisplayInRect:", *p_x, *p_y, *p_width, *p_height);
  }
}

- (void)setNeedsDisplayInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v8;
  void *v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  if (!self->_isHidden)
  {
    height = a3.size.height;
    width = a3.size.width;
    y = a3.origin.y;
    x = a3.origin.x;
    v8 = -[WAKView window](self, "window");
    if (v8)
    {
      v9 = v8;
      v25.origin.x = x;
      v25.origin.y = y;
      v25.size.width = width;
      v25.size.height = height;
      if (!CGRectIsEmpty(v25))
      {
        -[WAKView bounds](self, "bounds");
        v28.origin.x = v10;
        v28.origin.y = v11;
        v28.size.width = v12;
        v28.size.height = v13;
        v26.origin.x = x;
        v26.origin.y = y;
        v26.size.width = width;
        v26.size.height = height;
        v27 = CGRectIntersection(v26, v28);
        v14 = v27.origin.x;
        v15 = v27.origin.y;
        v16 = v27.size.width;
        v17 = v27.size.height;
        if (!CGRectIsEmpty(v27))
          objc_msgSend(v9, "setNeedsDisplayInRect:", WKViewConvertRectToBase((uint64_t)self->viewRef, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24));
      }
    }
  }
}

- (BOOL)needsDisplay
{
  return 0;
}

- (void)display
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _WKView *viewRef;
  double *p_x;
  double *p_y;
  double *p_width;
  double *p_height;
  char v12;

  viewRef = self->viewRef;
  if (viewRef)
  {
    p_x = &viewRef->var6.origin.x;
    p_y = &viewRef->var6.origin.y;
    p_width = &viewRef->var6.size.width;
    p_height = &viewRef->var6.size.height;
  }
  else
  {
    WKReportError("/Library/Caches/com.apple.xbs/Sources/WebCore/Source/WebCore/platform/ios/wak/WKView.mm", 129, "CGRect WKViewGetBounds(WKViewRef)", "invalid parameter", v2, v3, v4, v5, v12);
    p_x = (double *)MEMORY[0x1E0C9D648];
    p_height = (double *)(MEMORY[0x1E0C9D648] + 24);
    p_y = (double *)(MEMORY[0x1E0C9D648] + 8);
    p_width = (double *)(MEMORY[0x1E0C9D648] + 16);
  }
  -[WAKView displayRect:](self, "displayRect:", *p_x, *p_y, *p_width, *p_height);
}

- (void)viewWillDraw
{
  objc_msgSend(-[WAKView subviews](self, "subviews"), "makeObjectsPerformSelector:", sel_viewWillDraw);
}

+ (id)focusView
{
  id result;

  if (_MergedGlobals_69 == 1)
    return (id)qword_1EE338430;
  result = 0;
  qword_1EE338430 = 0;
  _MergedGlobals_69 = 1;
  return result;
}

- (CGRect)bounds
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _WKView *viewRef;
  double *p_x;
  double *p_y;
  double *p_width;
  double *p_height;
  double v11;
  double v12;
  double v13;
  double v14;
  char vars0;
  CGRect result;

  viewRef = self->viewRef;
  if (viewRef)
  {
    p_x = &viewRef->var6.origin.x;
    p_y = &viewRef->var6.origin.y;
    p_width = &viewRef->var6.size.width;
    p_height = &viewRef->var6.size.height;
  }
  else
  {
    WKReportError("/Library/Caches/com.apple.xbs/Sources/WebCore/Source/WebCore/platform/ios/wak/WKView.mm", 129, "CGRect WKViewGetBounds(WKViewRef)", "invalid parameter", v2, v3, v4, v5, vars0);
    p_x = (double *)MEMORY[0x1E0C9D648];
    p_height = (double *)(MEMORY[0x1E0C9D648] + 24);
    p_y = (double *)(MEMORY[0x1E0C9D648] + 8);
    p_width = (double *)(MEMORY[0x1E0C9D648] + 16);
  }
  v11 = *p_height;
  v12 = *p_x;
  v13 = *p_y;
  v14 = *p_width;
  result.size.height = v11;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)frame
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect result;

  WKViewGetFrame((uint64_t)self->viewRef, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CGFloat height;
  CGFloat width;
  _WKView *viewRef;
  char v14;
  char v15;

  height = a3.size.height;
  width = a3.size.width;
  viewRef = self->viewRef;
  if (viewRef)
  {
    if (viewRef->var5.x != a3.origin.x || viewRef->var5.y != a3.origin.y)
    {
      viewRef->var5.x = a3.origin.x;
      viewRef->var5.y = a3.origin.y;
      _WKViewRecursivelyInvalidateGState(viewRef, (uint64_t)a2, v3, v4, v5, v6, v7, v8, v14);
    }
  }
  else
  {
    WKReportError("/Library/Caches/com.apple.xbs/Sources/WebCore/Source/WebCore/platform/ios/wak/WKView.mm", 176, "void WKViewSetFrameOrigin(WKViewRef, CGPoint)", "invalid parameter", v5, v6, v7, v8, v14);
  }
  WKViewSetFrameSize(self->viewRef, width, height, (uint64_t)a2, v3, v4, v5, v6, v7, v8, v15);
}

- (void)setFrameOrigin:(CGPoint)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _WKView *viewRef;
  char v11;

  viewRef = self->viewRef;
  if (viewRef)
  {
    if (viewRef->var5.x != a3.x || viewRef->var5.y != a3.y)
    {
      viewRef->var5 = a3;
      _WKViewRecursivelyInvalidateGState(viewRef, (uint64_t)a2, v3, v4, v5, v6, v7, v8, v11);
    }
  }
  else
  {
    WKReportError("/Library/Caches/com.apple.xbs/Sources/WebCore/Source/WebCore/platform/ios/wak/WKView.mm", 176, "void WKViewSetFrameOrigin(WKViewRef, CGPoint)", "invalid parameter", v5, v6, v7, v8, v11);
  }
}

- (void)setFrameSize:(CGSize)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  WKViewSetFrameSize(self->viewRef, a3.width, a3.height, (uint64_t)a2, v3, v4, v5, v6, v7, v8, v9);
}

- (void)setBoundsSize:(CGSize)a3
{
  WKViewSetBoundsSize(self->viewRef, a3.width, a3.height);
}

- (void)setBoundsOrigin:(CGPoint)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _WKView *viewRef;
  char v11;

  viewRef = self->viewRef;
  if (viewRef->var6.origin.x != a3.x || viewRef->var6.origin.y != a3.y)
  {
    viewRef->var6.origin = a3;
    _WKViewRecursivelyInvalidateGState(viewRef, (uint64_t)a2, v3, v4, v5, v6, v7, v8, v11);
  }
}

- (void)_lockFocusViewInContext:(CGContext *)a3
{
  const void *v5;
  id v6;
  _WKView *viewRef;
  CGFloat v8;
  CGFloat v9;
  CGAffineTransform v10;
  CGAffineTransform v11;
  CGAffineTransform v12;
  CGAffineTransform v13;
  CGRect v14;

  if ((_MergedGlobals_69 & 1) != 0)
  {
    if (!self)
      goto LABEL_4;
    goto LABEL_3;
  }
  qword_1EE338430 = 0;
  _MergedGlobals_69 = 1;
  if (self)
LABEL_3:
    CFRetain(self);
LABEL_4:
  v5 = (const void *)qword_1EE338430;
  qword_1EE338430 = (uint64_t)self;
  if (v5)
    CFRelease(v5);
  CGContextSaveGState(a3);
  v6 = -[WAKView superview](self, "superview");
  if (v6)
  {
    objc_msgSend(v6, "bounds");
    CGContextClipToRect(a3, v14);
  }
  viewRef = self->viewRef;
  CGAffineTransformMakeTranslation(&v10, viewRef->var5.x, viewRef->var5.y);
  v12 = v10;
  CGAffineTransformScale(&v13, &v12, viewRef->var8, viewRef->var8);
  v10 = v13;
  *(_OWORD *)&v11.a = *(_OWORD *)&v13.a;
  *(_OWORD *)&v11.c = *(_OWORD *)&v13.c;
  v8 = -viewRef->var6.origin.x;
  v9 = -viewRef->var6.origin.y;
  *(_OWORD *)&v11.tx = *(_OWORD *)&v13.tx;
  CGAffineTransformTranslate(&v13, &v11, v8, v9);
  v10 = v13;
  CGContextConcatCTM(a3, &v10);
}

- (void)_unlockFocusViewInContext:(CGContext *)a3
{
  const void *v3;

  CGContextRestoreGState(a3);
  if ((_MergedGlobals_69 & 1) != 0)
  {
    v3 = (const void *)qword_1EE338430;
    qword_1EE338430 = 0;
    if (v3)
      CFRelease(v3);
  }
  else
  {
    _MergedGlobals_69 = 1;
    qword_1EE338430 = 0;
  }
}

+ (void)_setInterpolationQuality:(int)a3
{
  int v3;

  if ((a3 - 1) > 3u)
    v3 = 0;
  else
    v3 = dword_1968BCF70[(char)(a3 - 1)];
  sInterpolationQuality = v3;
}

- (void)_drawRect:(CGRect)a3 context:(CGContext *)a4 lockFocus:(BOOL)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL4 v9;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _WKView *viewRef;
  CGRect *p_var6;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  v33 = *MEMORY[0x1E0C80C00];
  if (!self->_isHidden)
  {
    v9 = a5;
    height = a3.size.height;
    width = a3.size.width;
    y = a3.origin.y;
    x = a3.origin.x;
    viewRef = self->viewRef;
    if (viewRef)
    {
      p_var6 = &viewRef->var6;
    }
    else
    {
      WKReportError("/Library/Caches/com.apple.xbs/Sources/WebCore/Source/WebCore/platform/ios/wak/WKView.mm", 129, "CGRect WKViewGetBounds(WKViewRef)", "invalid parameter", v5, v6, v7, v8, v28);
      p_var6 = (CGRect *)MEMORY[0x1E0C9D648];
    }
    v38.origin.x = x;
    v38.origin.y = y;
    v38.size.width = width;
    v38.size.height = height;
    v34 = CGRectIntersection(*p_var6, v38);
    v18 = v34.origin.x;
    v19 = v34.origin.y;
    v20 = v34.size.width;
    v21 = v34.size.height;
    if (!CGRectIsEmpty(v34))
    {
      if (v9)
        -[WAKView _lockFocusViewInContext:](self, "_lockFocusViewInContext:", a4);
      if (self->viewRef->var8 != 1.0)
        CGContextSetInterpolationQuality(a4, (CGInterpolationQuality)sInterpolationQuality);
      v35.origin.x = v18;
      v35.origin.y = v19;
      v35.size.width = v20;
      v35.size.height = v21;
      CGContextClipToRect(a4, v35);
      -[WAKView drawRect:](self, "drawRect:", v18, v19, v20, v21);
      if (!self->_drawsOwnDescendants)
      {
        v22 = -[WAKView subviews](self, "subviews");
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        if (v23)
        {
          v24 = v23;
          v25 = *(_QWORD *)v29;
          do
          {
            for (i = 0; i != v24; ++i)
            {
              if (*(_QWORD *)v29 != v25)
                objc_enumerationMutation(v22);
              v27 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
              -[WAKView convertRect:toView:](self, "convertRect:toView:", v27, v18, v19, v20, v21);
              v37 = CGRectIntegral(v36);
              objc_msgSend(v27, "_drawRect:context:lockFocus:", a4, 1, v37.origin.x, v37.origin.y, v37.size.width, v37.size.height);
            }
            v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
          }
          while (v24);
        }
      }
      if (v9)
        -[WAKView _unlockFocusViewInContext:](self, "_unlockFocusViewInContext:", a4);
    }
  }
}

- (void)displayRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = WKGetCurrentGraphicsContext();
  if (v8)
    -[WAKView _drawRect:context:lockFocus:](self, "_drawRect:context:lockFocus:", v8, 1, x, y, width, height);
  else
    WKReportError("/Library/Caches/com.apple.xbs/Sources/WebCore/Source/WebCore/platform/ios/wak/WAKView.mm", 513, "-[WAKView displayRect:]", "unable to get context for view", v9, v10, v11, v12, v13);
}

- (void)displayRectIgnoringOpacity:(CGRect)a3 inContext:(CGContext *)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double height;
  double width;
  double y;
  double x;
  CGContext *v14;
  CGContext *v15;
  unint64_t v16;
  pthread_key_t *v17;
  _QWORD *v18;
  unint64_t v19;
  pthread_key_t *v20;
  _QWORD *v21;
  char v22;
  char **v23;
  char *v24;
  char v25;

  if (a4)
  {
    height = a3.size.height;
    width = a3.size.width;
    y = a3.origin.y;
    x = a3.origin.x;
    v14 = (CGContext *)WKGetCurrentGraphicsContext();
    if (v14 == a4)
    {
      -[WAKView _drawRect:context:lockFocus:](self, "_drawRect:context:lockFocus:", a4, 0, x, y, width, height);
    }
    else
    {
      v15 = v14;
      v16 = atomic_load(&CurrentThreadContext(void)::flag);
      if (v16 != -1)
      {
        v24 = &v22;
        v23 = &v24;
        std::__call_once(&CurrentThreadContext(void)::flag, &v23, (void (__cdecl *)(void *))std::__call_once_proxy[abi:sn180100]<std::tuple<CurrentThreadContext(void)::$_0 &&>>);
      }
      v17 = (pthread_key_t *)threadContext;
      v18 = pthread_getspecific(*(_QWORD *)threadContext);
      if (!v18)
      {
        v18 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
        v18[1] = v17;
        pthread_setspecific(*v17, v18);
        *v18 = 0;
      }
      *v18 = a4;
      -[WAKView _drawRect:context:lockFocus:](self, "_drawRect:context:lockFocus:", a4, 0, x, y, width, height);
      v19 = atomic_load(&CurrentThreadContext(void)::flag);
      if (v19 != -1)
      {
        v24 = &v22;
        v23 = &v24;
        std::__call_once(&CurrentThreadContext(void)::flag, &v23, (void (__cdecl *)(void *))std::__call_once_proxy[abi:sn180100]<std::tuple<CurrentThreadContext(void)::$_0 &&>>);
      }
      v20 = (pthread_key_t *)threadContext;
      v21 = pthread_getspecific(*(_QWORD *)threadContext);
      if (!v21)
      {
        v21 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
        v21[1] = v20;
        pthread_setspecific(*v20, v21);
        *v21 = 0;
      }
      *v21 = v15;
    }
  }
  else
  {
    WKReportError("/Library/Caches/com.apple.xbs/Sources/WebCore/Source/WebCore/platform/ios/wak/WAKView.mm", 528, "-[WAKView displayRectIgnoringOpacity:inContext:]", "invalid parameter: context must not be NULL", v4, v5, v6, v7, v25);
  }
}

- (CGRect)visibleRect
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double VisibleRect;
  double v9;
  double v10;
  double v11;
  CGRect result;

  VisibleRect = WKViewGetVisibleRect((double *)&self->viewRef->var0.var0, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = VisibleRect;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 toView:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  CGPoint result;

  WKViewConvertPointToBase((uint64_t)self->viewRef, a3.x, a3.y, (uint64_t)a2, (uint64_t)a4, v4, v5, v6, v7, v8);
  v12 = v10;
  v13 = v11;
  if (a4)
  {
    v14 = objc_msgSend(a4, "_viewRef");
    WKViewConvertPointFromBase(v14, v15, v16, v17, v18, v19, v20, v21, v12, v13);
  }
  result.y = v11;
  result.x = v10;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)a3 fromView:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CGFloat y;
  CGFloat x;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  if (a4)
  {
    v12 = objc_msgSend(a4, "_viewRef");
    WKViewConvertPointToBase(v12, x, y, v13, v14, v15, v16, v17, v18, v19);
    x = v20;
    y = v21;
  }
  WKViewConvertPointFromBase((uint64_t)self->viewRef, (uint64_t)a2, (uint64_t)a4, v4, v5, v6, v7, v8, x, y);
  result.y = v23;
  result.x = v22;
  return result;
}

- (CGSize)convertSize:(CGSize)a3 toView:(id)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  -[WAKView convertRect:toView:](self, "convertRect:toView:", a4, 0.0, 0.0, a3.width, a3.height);
  v5 = v4;
  v7 = v6;
  result.height = v7;
  result.width = v5;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 fromView:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (a4)
  {
    v14 = objc_msgSend(a4, "_viewRef");
    x = WKViewConvertRectToBase(v14, x, y, width, height, v15, v16, v17, v18, v19, v20, v21);
    y = v22;
    width = v23;
    height = v24;
  }
  WKViewConvertRectFromBase((uint64_t)self->viewRef, (uint64_t)a2, (uint64_t)a4, v4, v5, v6, v7, v8, x, y, width, height);
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 toView:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGRect result;

  v10 = WKViewConvertRectToBase((uint64_t)self->viewRef, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, (uint64_t)a4, v4, v5, v6, v7, v8);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  if (a4)
  {
    v17 = objc_msgSend(a4, "_viewRef");
    WKViewConvertRectFromBase(v17, v18, v19, v20, v21, v22, v23, v24, v10, v12, v14, v16);
    v10 = v25;
    v12 = v26;
    v14 = v27;
    v16 = v28;
  }
  v29 = v10;
  v30 = v12;
  v31 = v14;
  v32 = v16;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

- (void)lockFocus
{
  -[WAKView _lockFocusViewInContext:](self, "_lockFocusViewInContext:", WKGetCurrentGraphicsContext());
}

- (void)unlockFocus
{
  -[WAKView _unlockFocusViewInContext:](self, "_unlockFocusViewInContext:", WKGetCurrentGraphicsContext());
}

- (id)hitTest:(CGPoint)a3
{
  double y;
  double x;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;
  CGPoint v29;
  CGRect v30;

  y = a3.y;
  x = a3.x;
  v5 = (uint64_t *)self;
  v28 = *MEMORY[0x1E0C80C00];
  -[WAKView frame](self, "frame");
  v29.x = x;
  v29.y = y;
  if (!CGRectContainsPoint(v30, v29))
    return 0;
  *(_QWORD *)&v13 = *(_OWORD *)&WKViewConvertPointFromSuperview(v5[7], x, y, v6, v7, v8, v9, v10, v11, v12);
  v15 = v14;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v16 = (void *)objc_msgSend(v5, "subviews", 0);
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v24 != v19)
          objc_enumerationMutation(v16);
        v21 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "hitTest:", v13, v15);
        if (v21)
          return v21;
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v18)
        continue;
      break;
    }
  }
  return v5;
}

- (void)setHidden:(BOOL)a3
{
  if (self->_isHidden != a3)
  {
    if (a3)
    {
      -[WAKView setNeedsDisplay:](self, "setNeedsDisplay:", 1);
      self->_isHidden = a3;
    }
    else
    {
      self->_isHidden = 0;
      -[WAKView setNeedsDisplay:](self, "setNeedsDisplay:", 1);
    }
  }
}

- (BOOL)isDescendantOf:(id)a3
{
  id v5;

  if (a3 == self)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    v5 = -[WAKView superview](self, "superview");
    if (v5)
      LOBYTE(v5) = objc_msgSend(-[WAKView superview](self, "superview"), "isDescendantOf:", a3);
  }
  return (char)v5;
}

- (BOOL)isHiddenOrHasHiddenAncestor
{
  id v2;

  if (self->_isHidden)
  {
    LOBYTE(v2) = 1;
  }
  else
  {
    v2 = -[WAKView superview](self, "superview");
    if (v2)
      LOBYTE(v2) = objc_msgSend(-[WAKView superview](self, "superview"), "isHiddenOrHasHiddenAncestor");
  }
  return (char)v2;
}

- (BOOL)mouse:(CGPoint)a3 inRect:(CGRect)a4
{
  double v4;

  v4 = a4.origin.x + a4.size.width;
  return a3.x >= a4.origin.x && a3.x < v4 && a3.y >= a4.origin.y && a3.y < a4.origin.y + a4.size.height;
}

- (BOOL)needsPanelToBecomeKey
{
  return 1;
}

- (id)previousValidKeyView
{
  return 0;
}

- (id)nextKeyView
{
  return 0;
}

- (id)nextValidKeyView
{
  return 0;
}

- (id)previousKeyView
{
  return 0;
}

- (BOOL)inLiveResize
{
  return 0;
}

- (void)setAutoresizingMask:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _WKView *viewRef;
  char v8;

  viewRef = self->viewRef;
  if (viewRef)
    viewRef->var7 = a3;
  else
    WKReportError("/Library/Caches/com.apple.xbs/Sources/WebCore/Source/WebCore/platform/ios/wak/WKView.mm", 742, "void WKViewSetAutoresizingMask(WKViewRef, unsigned int)", "invalid parameter", v3, v4, v5, v6, v8);
}

- (unsigned)autoresizingMask
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _WKView *viewRef;
  char vars0;

  viewRef = self->viewRef;
  if (viewRef)
    return viewRef->var7;
  WKReportError("/Library/Caches/com.apple.xbs/Sources/WebCore/Source/WebCore/platform/ios/wak/WKView.mm", 733, "unsigned int WKViewGetAutoresizingMask(WKViewRef)", "invalid parameter", v2, v3, v4, v5, vars0);
  return 0;
}

- (void)scrollPoint:(CGPoint)a3
{
  double y;
  double x;
  id v6;
  void *v7;

  y = a3.y;
  x = a3.x;
  v6 = -[WAKView superview](self, "superview");
  if (v6)
  {
    v7 = v6;
    while (1)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      v7 = (void *)objc_msgSend(v7, "superview");
      if (!v7)
        return;
    }
    -[WAKView convertPoint:toView:](self, "convertPoint:toView:", v7, x, y);
    objc_msgSend(v7, "scrollPoint:");
  }
}

- (BOOL)scrollRectToVisible:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  double y;
  double x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGRect v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[WAKView visibleRect](self, "visibleRect");
  v8 = v13.origin.x;
  v9 = v13.origin.y;
  v10 = v13.size.width;
  v11 = v13.size.height;
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  if (!CGRectContainsRect(v13, v15))
  {
    v14.origin.x = x;
    v14.origin.y = y;
    v14.size.width = width;
    v14.size.height = height;
    v16.origin.x = v8;
    v16.origin.y = v9;
    v16.size.width = v10;
    v16.size.height = v11;
    if (!CGRectContainsRect(v14, v16))
      -[WAKView scrollPoint:](self, "scrollPoint:", x, y);
  }
  return 0;
}

- (void)setScale:(float)a3
{
  _WKView *viewRef;
  void (**var1)(void);

  viewRef = self->viewRef;
  if (viewRef->var8 != a3)
  {
    viewRef->var8 = a3;
    var1 = (void (**)(void))viewRef->var1;
    if (var1)
    {
      if (*var1)
        (*var1)();
    }
  }
}

- (float)scale
{
  return self->viewRef->var8;
}

- (void)_setDrawsOwnDescendants:(BOOL)a3
{
  self->_drawsOwnDescendants = a3;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  float v9;
  _WKView *viewRef;
  _QWORD *p_x;
  double *p_y;
  double v13;
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
  double v26;
  double v27;
  double v28;
  double v29;
  double v31;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  LOBYTE(v31) = objc_opt_class();
  v4 = (void *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: WAK: %p (WK: %p); "));
  -[WAKView scale](self, "scale");
  if (v9 != 1.0)
  {
    v31 = v9;
    objc_msgSend(v4, "appendFormat:", CFSTR("scale = %g "));
  }
  viewRef = self->viewRef;
  if (viewRef)
  {
    p_x = (_QWORD *)&viewRef->var5.x;
    p_y = &viewRef->var5.y;
  }
  else
  {
    WKReportError("/Library/Caches/com.apple.xbs/Sources/WebCore/Source/WebCore/platform/ios/wak/WKView.mm", 149, "CGPoint WKViewGetOrigin(WKViewRef)", "invalid parameter", v5, v6, v7, v8, SLOBYTE(v31));
    p_x = (_QWORD *)MEMORY[0x1E0C9D538];
    p_y = (double *)(MEMORY[0x1E0C9D538] + 8);
  }
  v13 = *p_y;
  if (*(double *)p_x != 0.0 || v13 != 0.0)
    objc_msgSend(v4, "appendFormat:", CFSTR("origin = (%g %g) "), *p_x, *(_QWORD *)&v13);
  -[WAKView bounds](self, "bounds");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  -[WAKView frame](self, "frame");
  v26 = v25;
  v27 = v22;
  v28 = v23;
  v29 = v24;
  if (v25 != v15 || v22 != v17 || v23 != v19 || v24 != v21)
    objc_msgSend(v4, "appendFormat:", CFSTR("bounds = (%g %g; %g %g) "),
      *(_QWORD *)&v15,
      *(_QWORD *)&v17,
      *(_QWORD *)&v19,
      *(_QWORD *)&v21);
  objc_msgSend(v4, "appendFormat:", CFSTR("frame = (%g %g; %g %g)>"),
    *(_QWORD *)&v26,
    *(_QWORD *)&v27,
    *(_QWORD *)&v28,
    *(_QWORD *)&v29);
  return v4;
}

- (void)_appendDescriptionToString:(id)a3 atLevel:(int)a4
{
  void *v7;
  int v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x19AEA7E30](self, a2);
  if (objc_msgSend(a3, "length"))
    objc_msgSend(a3, "appendString:", CFSTR("\n"));
  if (a4 >= 1)
  {
    v8 = a4;
    do
    {
      objc_msgSend(a3, "appendString:", CFSTR("   | "));
      --v8;
    }
    while (v8);
  }
  objc_msgSend(a3, "appendString:", -[WAKView description](self, "description"));
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = -[WAKView subviews](self, "subviews", 0);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    v13 = (a4 + 1);
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14++), "_appendDescriptionToString:atLevel:", a3, v13);
      }
      while (v11 != v14);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }
  objc_autoreleasePoolPop(v7);
}

@end
