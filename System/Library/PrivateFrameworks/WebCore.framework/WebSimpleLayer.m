@implementation WebSimpleLayer

- (void)renderInContext:(CGContext *)a3
{
  BOOL isRenderingInContext;
  objc_super v5;

  isRenderingInContext = self->_isRenderingInContext;
  self->_isRenderingInContext = 1;
  v5.receiver = self;
  v5.super_class = (Class)WebSimpleLayer;
  -[WebSimpleLayer renderInContext:](&v5, sel_renderInContext_, a3);
  self->_isRenderingInContext = isRenderingInContext;
}

- (id)actionForKey:(id)a3
{
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("onOrderIn")))
    -[WebSimpleLayer reloadValueForKeyPath:](self, "reloadValueForKeyPath:", CFSTR("contents"));
  return 0;
}

- (void)setNeedsDisplay
{
  uint64_t v3;
  uint64_t v4;
  unsigned int *v5;
  unsigned int v6;
  unsigned int v7;
  _QWORD *v8;
  _QWORD *v9;
  objc_super v10;
  uint64_t v11;
  _QWORD *v12;

  WebCore::PlatformCALayer::platformCALayerForLayer((uint64_t)self, (void *)a2, &v11);
  v3 = v11;
  if (v11)
  {
    v4 = *(_QWORD *)(v11 + 48);
    if (v4
      && (((*(uint64_t (**)(uint64_t))(*(_QWORD *)v4 + 104))(v4) & 1) != 0
       || (*(unsigned int (**)(_QWORD, uint64_t))(**(_QWORD **)(v3 + 48) + 112))(*(_QWORD *)(v3 + 48), v3)))
    {
      v10.receiver = self;
      v10.super_class = (Class)WebSimpleLayer;
      -[WebSimpleLayer setNeedsDisplay](&v10, sel_setNeedsDisplay);
    }
    v11 = 0;
    v5 = (unsigned int *)(v3 + 8);
    do
    {
      v6 = __ldaxr(v5);
      v7 = v6 - 1;
    }
    while (__stlxr(v7, v5));
    if (!v7)
    {
      atomic_store(1u, v5);
      v8 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
      *v8 = off_1E334ED68;
      v8[1] = v5;
      v12 = v8;
      WTF::ensureOnMainThread();
      v9 = v12;
      v12 = 0;
      if (v9)
        (*(void (**)(_QWORD *))(*v9 + 8))(v9);
    }
  }
}

- (void)setNeedsDisplayInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v8;
  uint64_t v9;
  unsigned int *v10;
  unsigned int v11;
  unsigned int v12;
  _QWORD *v13;
  _QWORD *v14;
  objc_super v15;
  objc_super v16;
  objc_super v17;
  uint64_t v18;
  _QWORD *v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  WebCore::PlatformCALayer::platformCALayerForLayer((uint64_t)self, (void *)a2, &v18);
  v8 = v18;
  if (v18)
  {
    v9 = *(_QWORD *)(v18 + 48);
    if (v9
      && (((*(uint64_t (**)(_QWORD))(*(_QWORD *)v9 + 104))(*(_QWORD *)(v18 + 48)) & 1) != 0
       || (*(unsigned int (**)(uint64_t, uint64_t))(*(_QWORD *)v9 + 112))(v9, v8)))
    {
      v16.receiver = self;
      v16.super_class = (Class)WebSimpleLayer;
      -[WebSimpleLayer setNeedsDisplayInRect:](&v16, sel_setNeedsDisplayInRect_, x, y, width, height);
      if ((*(unsigned int (**)(uint64_t, uint64_t))(*(_QWORD *)v9 + 72))(v9, v8))
      {
        -[WebSimpleLayer bounds](self, "bounds");
        v15.receiver = self;
        v15.super_class = (Class)WebSimpleLayer;
        -[WebSimpleLayer setNeedsDisplayInRect:](&v15, sel_setNeedsDisplayInRect_);
      }
    }
    v18 = 0;
    v10 = (unsigned int *)(v8 + 8);
    do
    {
      v11 = __ldaxr(v10);
      v12 = v11 - 1;
    }
    while (__stlxr(v12, v10));
    if (!v12)
    {
      atomic_store(1u, v10);
      v13 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
      *v13 = off_1E334ED68;
      v13[1] = v10;
      v19 = v13;
      WTF::ensureOnMainThread();
      v14 = v19;
      v19 = 0;
      if (v14)
        (*(void (**)(_QWORD *))(*v14 + 8))(v14);
    }
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)WebSimpleLayer;
    -[WebSimpleLayer setNeedsDisplayInRect:](&v17, sel_setNeedsDisplayInRect_, x, y, width, height);
  }
}

- (void)display
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  unsigned int *v7;
  unsigned int v8;
  unsigned int v9;
  _QWORD *v10;
  _QWORD *v11;
  objc_super v12;
  uint64_t v13;
  _QWORD *v14;

  if (pthread_main_np())
    WebThreadLock();
  WebCore::PlatformCALayer::platformCALayerForLayer((uint64_t)self, v3, &v13);
  v4 = v13;
  if (!v13)
  {
    v5 = 0;
    goto LABEL_8;
  }
  v5 = *(_QWORD *)(v13 + 48);
  if (!v5)
  {
LABEL_8:
    v6 = 1;
    goto LABEL_10;
  }
  if ((*(unsigned int (**)(_QWORD, uint64_t))(*(_QWORD *)v5 + 112))(*(_QWORD *)(v13 + 48), v13))
  {
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v5 + 120))(v5, v4);
LABEL_11:
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v5 + 128))(v5, v4);
    v4 = v13;
    goto LABEL_12;
  }
  v6 = 0;
LABEL_10:
  v12.receiver = self;
  v12.super_class = (Class)WebSimpleLayer;
  -[WebSimpleLayer display](&v12, sel_display);
  if ((v6 & 1) == 0)
    goto LABEL_11;
LABEL_12:
  v13 = 0;
  if (v4)
  {
    v7 = (unsigned int *)(v4 + 8);
    do
    {
      v8 = __ldaxr(v7);
      v9 = v8 - 1;
    }
    while (__stlxr(v9, v7));
    if (!v9)
    {
      atomic_store(1u, v7);
      v10 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
      *v10 = off_1E334ED68;
      v10[1] = v7;
      v14 = v10;
      WTF::ensureOnMainThread();
      v11 = v14;
      v14 = 0;
      if (v11)
        (*(void (**)(_QWORD *))(*v11 + 8))(v11);
    }
  }
}

- (void)drawInContext:(CGContext *)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  unsigned int *v9;
  unsigned int v10;
  unsigned int v11;
  _QWORD *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  _QWORD v16[95];
  CGRect ClipBoundingBox;

  v16[94] = *MEMORY[0x1E0C80C00];
  if (pthread_main_np())
    WebThreadLock();
  WebCore::PlatformCALayer::platformCALayerForLayer((uint64_t)self, v5, &v15);
  v6 = v15;
  if (v15)
  {
    if (*(_QWORD *)(v15 + 48))
    {
      WebCore::GraphicsContextCG::GraphicsContextCG((uint64_t)v16, a3, 1, 0);
      ClipBoundingBox = CGContextGetClipBoundingBox(a3);
      *(float *)&ClipBoundingBox.origin.x = ClipBoundingBox.origin.x;
      *(float *)&ClipBoundingBox.origin.y = ClipBoundingBox.origin.y;
      v14 = __PAIR64__(LODWORD(ClipBoundingBox.origin.y), LODWORD(ClipBoundingBox.origin.x));
      *(float *)&ClipBoundingBox.origin.x = ClipBoundingBox.size.width;
      *(float *)&ClipBoundingBox.origin.y = ClipBoundingBox.size.height;
      if (-[WebSimpleLayer isRenderingInContext](self, "isRenderingInContext", v14, __PAIR64__(LODWORD(ClipBoundingBox.origin.y), LODWORD(ClipBoundingBox.origin.x))))
      {
        v7 = 2;
      }
      else
      {
        v7 = 0;
      }
      (*(void (**)(_QWORD, uint64_t, _QWORD *, unint64_t *, uint64_t))(**(_QWORD **)(v6 + 48) + 56))(*(_QWORD *)(v6 + 48), v6, v16, &v14, v7);
      WebCore::GraphicsContextCG::~GraphicsContextCG((WebCore::GraphicsContextCG *)v16, v8);
    }
    v15 = 0;
    v9 = (unsigned int *)(v6 + 8);
    do
    {
      v10 = __ldaxr(v9);
      v11 = v10 - 1;
    }
    while (__stlxr(v11, v9));
    if (!v11)
    {
      atomic_store(1u, v9);
      v12 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
      *v12 = off_1E334ED68;
      v12[1] = v9;
      v16[0] = v12;
      WTF::ensureOnMainThread();
      v13 = v16[0];
      v16[0] = 0;
      if (v13)
        (*(void (**)(uint64_t))(*(_QWORD *)v13 + 8))(v13);
    }
  }
}

- (BOOL)isRenderingInContext
{
  return self->_isRenderingInContext;
}

@end
