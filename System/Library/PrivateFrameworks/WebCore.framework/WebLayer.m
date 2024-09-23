@implementation WebLayer

- (void)drawInContext:(CGContext *)a3
{
  WebCore::GraphicsContext *v5;
  unsigned __int8 v6;
  void *v7;
  WTF *v8;
  unsigned int *v9;
  unsigned int v10;
  unsigned int v11;
  _QWORD *v12;
  uint64_t v13;
  WTF *v14;
  int v15;
  uint64_t v16;
  WebCore::GraphicsContext *v17;
  _QWORD v18[95];

  v18[94] = *MEMORY[0x1E0C80C00];
  WebCore::PlatformCALayer::platformCALayerForLayer((uint64_t)self, (void *)a2, (uint64_t *)&v17);
  v5 = v17;
  if (v17)
  {
    WebCore::GraphicsContextCG::GraphicsContextCG((uint64_t)v18, a3, 1, 0);
    WebCore::PlatformCALayer::collectRectsToPaint((WebCore::PlatformCALayer *)v18, v5, (uint64_t)&v14);
    if (-[WebSimpleLayer isRenderingInContext](self, "isRenderingInContext"))
      v6 = 2;
    else
      v6 = 0;
    WebCore::PlatformCALayer::drawLayerContents((WTF::StringImpl *)v18, v5, (uint64_t *)&v14, v6);
    v8 = v14;
    if (&v16 != (uint64_t *)v14 && v14)
    {
      v14 = 0;
      v15 = 0;
      WTF::fastFree(v8, v7);
    }
    WebCore::GraphicsContextCG::~GraphicsContextCG((WebCore::GraphicsContextCG *)v18, v7);
    v17 = 0;
    v9 = (unsigned int *)((char *)v5 + 8);
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
      v18[0] = v12;
      WTF::ensureOnMainThread();
      v13 = v18[0];
      v18[0] = 0;
      if (v13)
        (*(void (**)(uint64_t))(*(_QWORD *)v13 + 8))(v13);
    }
  }
}

@end
