@implementation TSDMetalLayer

- (TSDMetalLayer)initWithFrame:(CGRect)a3 isOpaque:(BOOL)a4 isWideGamut:(BOOL)a5 delegate:(id)a6 metalDevice:(id)a7
{
  _BOOL4 v8;
  double height;
  double width;
  double y;
  double x;
  id v14;
  id v15;
  TSDMetalLayer *v16;
  TSDMetalLayer *v17;
  objc_super v19;

  v8 = a5;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v14 = a6;
  v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)TSDMetalLayer;
  v16 = -[CAMetalLayer init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeWeak((id *)&v16->_delegate, v14);
    -[TSDMetalLayer setFrame:](v17, "setFrame:", x, y, width, height);
    -[TSDMetalLayer setMasksToBounds:](v17, "setMasksToBounds:", 0);
    -[TSDMetalLayer setOpaque:](v17, "setOpaque:", 0);
    -[CAMetalLayer setFramebufferOnly:](v17, "setFramebufferOnly:", 1);
    -[CAMetalLayer setPixelFormat:](v17, "setPixelFormat:", 80);
    if (v8)
      -[CAMetalLayer setPixelFormat:](v17, "setPixelFormat:", 552);
    -[TSDMetalLayer setDevice:](v17, "setDevice:", v15);
  }

  return v17;
}

- (void)setDevice:(id)a3
{
  id v4;
  MTLCommandQueue *v5;
  MTLCommandQueue *commandQueue;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TSDMetalLayer;
  -[CAMetalLayer setDevice:](&v10, sel_setDevice_, v4);
  if (v4)
  {
    v5 = (MTLCommandQueue *)objc_msgSend(v4, "newCommandQueue");
    commandQueue = self->_commandQueue;
    self->_commandQueue = v5;

    if (!self->_commandQueue)
    {
      objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDMetalLayer setDevice:]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/Metal/TSDMetalLayer.m");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, v9, 92, CFSTR("invalid nil value for '%s'"), "_commandQueue");

    }
  }

}

- (id)device
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDMetalLayer;
  -[CAMetalLayer device](&v3, sel_device);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)p_drawFrameAtLayerTime:(double)a3
{
  TSDMetalLayerDelegate **p_delegate;
  id WeakRetained;
  int v6;
  id v7;

  if (!self->_isAnimationStopping)
  {
    p_delegate = &self->_delegate;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v6 = objc_msgSend(WeakRetained, "shouldDrawFrameAtLayerTime:", a3);

    if (v6)
    {
      v7 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v7, "drawFrameAtLayerTime:", a3);

    }
  }
}

- (void)p_drawFrameFromDisplayLink:(id)a3
{
  -[CADisplayLink targetTimestamp](self->_displayLink, "targetTimestamp", a3);
  -[TSDMetalLayer p_drawFrameAtLayerTime:](self, "p_drawFrameAtLayerTime:");
}

- (void)startAnimation
{
  CADisplayLink *v3;
  CADisplayLink *displayLink;
  CADisplayLink *v5;
  void *v6;

  if (!self->_displayLink)
  {
    objc_msgSend(MEMORY[0x24BDE5670], "displayLinkWithTarget:selector:", self, sel_p_drawFrameFromDisplayLink_);
    v3 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
    displayLink = self->_displayLink;
    self->_displayLink = v3;

    v5 = self->_displayLink;
    objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADisplayLink addToRunLoop:forMode:](v5, "addToRunLoop:forMode:", v6, *MEMORY[0x24BDBCA90]);

  }
  self->_isAnimationStopping = 0;
}

- (void)p_performWorkOnMainThread:(id)a3
{
  void *v3;
  void (**block)(void);

  v3 = (void *)MEMORY[0x24BDD17F0];
  block = (void (**)(void))a3;
  if (objc_msgSend(v3, "isMainThread"))
    block[2]();
  else
    dispatch_async(MEMORY[0x24BDAC9B8], block);

}

- (void)stopAnimation
{
  _QWORD v2[5];

  self->_isAnimationStopping = 1;
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __30__TSDMetalLayer_stopAnimation__block_invoke;
  v2[3] = &unk_24D82A4D8;
  v2[4] = self;
  -[TSDMetalLayer p_performWorkOnMainThread:](self, "p_performWorkOnMainThread:", v2);
}

void __30__TSDMetalLayer_stopAnimation__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 48);
  if (v3)
  {
    objc_msgSend(v3, "invalidate");
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 48);
    *(_QWORD *)(v4 + 48) = 0;

    v2 = *(_QWORD *)(a1 + 32);
  }
  *(_BYTE *)(v2 + 56) = 0;
}

- (void)pauseAnimation
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __31__TSDMetalLayer_pauseAnimation__block_invoke;
  v2[3] = &unk_24D82A4D8;
  v2[4] = self;
  -[TSDMetalLayer p_performWorkOnMainThread:](self, "p_performWorkOnMainThread:", v2);
}

void *__31__TSDMetalLayer_pauseAnimation__block_invoke(uint64_t a1)
{
  void *result;

  result = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  if (result)
    return (void *)objc_msgSend(result, "setPaused:", 1);
  return result;
}

- (void)resumeAnimation
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __32__TSDMetalLayer_resumeAnimation__block_invoke;
  v2[3] = &unk_24D82A4D8;
  v2[4] = self;
  -[TSDMetalLayer p_performWorkOnMainThread:](self, "p_performWorkOnMainThread:", v2);
}

void *__32__TSDMetalLayer_resumeAnimation__block_invoke(uint64_t a1)
{
  void *result;

  result = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  if (result)
    return (void *)objc_msgSend(result, "setPaused:", 0);
  return result;
}

- (void)displayAtCurrentLayerTime
{
  self->_isAnimationStopping = 0;
  if (!self->_displayLink)
    -[TSDMetalLayer p_drawFrameAtLayerTime:](self, "p_drawFrameAtLayerTime:", CACurrentMediaTime());
}

- (TSDMetalLayerDelegate)delegate
{
  return (TSDMetalLayerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MTLCommandQueue)commandQueue
{
  return self->_commandQueue;
}

- (BOOL)shouldSkipNextDisplayLink
{
  return self->_shouldSkipNextDisplayLink;
}

- (void)setShouldSkipNextDisplayLink:(BOOL)a3
{
  self->_shouldSkipNextDisplayLink = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_displayLink, 0);
}

@end
