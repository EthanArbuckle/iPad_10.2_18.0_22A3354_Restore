@implementation CLKUIMetalQuadView

- (CLKUIMetalQuadView)initWithFrame:(CGRect)a3 identifier:(id)a4 options:(unint64_t)a5 colorSpace:(int64_t)a6
{
  return -[CLKUIMetalQuadView initWithFrame:identifier:options:colorSpace:asyncRenderQueue:](self, "initWithFrame:identifier:options:colorSpace:asyncRenderQueue:", a4, a5, a6, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CLKUIMetalQuadView)initWithFrame:(CGRect)a3 identifier:(id)a4 options:(unint64_t)a5 colorSpace:(int64_t)a6 asyncRenderQueue:(id)a7
{
  unsigned __int8 v8;
  CLKUIMetalQuadView *v9;
  CLKUIMetalQuadView *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  MTLDepthStencilState *depthStencilState;
  CAMetalLayer *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  CAMetalLayer *metalLayer;
  CAMetalLayer *v26;
  CAMetalLayer *v27;
  void *v28;
  uint64_t v29;
  MTLCommandQueue *commandQueue;
  uint64_t v31;
  MTLRenderPassDescriptor *renderPassDescriptor;
  id v33;
  uint64_t v34;
  UIImageView *snapshotView;
  objc_super v37;

  v8 = a5;
  v37.receiver = self;
  v37.super_class = (Class)CLKUIMetalQuadView;
  v9 = -[CLKUIQuadView initWithFrame:identifier:options:asyncRenderQueue:](&v37, sel_initWithFrame_identifier_options_asyncRenderQueue_, a4, a5, a7, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v10 = v9;
  if (v9)
  {
    if ((unint64_t)(a6 - 1) > 2)
      v11 = 81;
    else
      v11 = qword_1B000CAF0[a6 - 1];
    v9->_colorPixelFormat = v11;
    v9->_maxAPL = 1.0;
    v9->_aplFilterAmount = 0.0;
    if ((v8 & 8) != 0)
      v12 = -[CLKUIMetalQuadView _msaaCount](v9, "_msaaCount");
    else
      v12 = 1;
    v10->_msaaCount = v12;
    *((_BYTE *)v10 + 560) = *((_BYTE *)v10 + 560) & 0xFE | v8 & 1;
    *((_BYTE *)v10 + 560) = *((_BYTE *)v10 + 560) & 0xF7 | (v8 >> 2) & 8;
    *((_BYTE *)v10 + 560) = *((_BYTE *)v10 + 560) & 0xDF | (v8 >> 1) & 0x20;
    *((_BYTE *)v10 + 560) = *((_BYTE *)v10 + 560) & 0xBF | (v8 >> 1) & 0x40;
    *((_BYTE *)v10 + 560) = *((_BYTE *)v10 + 560) & 0xFD | v8 & 2;
    *((_BYTE *)v10 + 560) = *((_BYTE *)v10 + 560) & 0xFB | (v8 >> 2) & 4;
    if ((*((_BYTE *)v10 + 560) & 1) != 0)
    {
      v13 = (void *)objc_opt_new();
      objc_msgSend(v13, "setDepthCompareFunction:", 3);
      objc_msgSend(v13, "setDepthWriteEnabled:", 1);
      +[CLKUIMetalResourceManager sharedDevice](CLKUIMetalResourceManager, "sharedDevice");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "newDepthStencilStateWithDescriptor:", v13);
      depthStencilState = v10->_depthStencilState;
      v10->_depthStencilState = (MTLDepthStencilState *)v15;

    }
    v17 = (CAMetalLayer *)objc_alloc_init(MEMORY[0x1E0CD27E0]);
    if ((*((_BYTE *)v10 + 560) & 4) != 0)
    {
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "scale");
      v21 = v22;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "device");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "screenScale");
      v21 = v20;

    }
    -[CAMetalLayer setContentsScale:](v17, "setContentsScale:", v21);
    +[CLKUIMetalResourceManager sharedDevice](CLKUIMetalResourceManager, "sharedDevice");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMetalLayer setDevice:](v17, "setDevice:", v23);

    -[CAMetalLayer setPixelFormat:](v17, "setPixelFormat:", v10->_colorPixelFormat);
    -[CAMetalLayer setFramebufferOnly:](v17, "setFramebufferOnly:", (*((_BYTE *)v10 + 560) & 0x20) == 0);
    -[CAMetalLayer setFenceEnabled:](v17, "setFenceEnabled:", 1);
    -[CAMetalLayer setPresentsWithTransaction:](v17, "setPresentsWithTransaction:", (*((unsigned __int8 *)v10 + 560) >> 1) & 1);
    if ((*((_BYTE *)v10 + 560) & 0x40) != 0)
      v24 = 2;
    else
      v24 = 3;
    -[CAMetalLayer setMaximumDrawableCount:](v17, "setMaximumDrawableCount:", v24);
    -[CAMetalLayer setDrawsAsynchronously:](v17, "setDrawsAsynchronously:", 1);
    -[CAMetalLayer setAllowsDisplayCompositing:](v17, "setAllowsDisplayCompositing:", 0);
    -[CAMetalLayer setOpaque:](v17, "setOpaque:", 1);
    metalLayer = v10->_metalLayer;
    v10->_metalLayer = v17;
    v26 = v17;

    v27 = v10->_metalLayer;
    -[CLKUIMetalQuadView bounds](v10, "bounds");
    -[CAMetalLayer setFrame:](v27, "setFrame:");
    -[CLKUIMetalQuadView layer](v10, "layer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addSublayer:", v26);

    +[CLKUIMetalResourceManager sharedCommandQueue](CLKUIMetalResourceManager, "sharedCommandQueue");
    v29 = objc_claimAutoreleasedReturnValue();
    commandQueue = v10->_commandQueue;
    v10->_commandQueue = (MTLCommandQueue *)v29;

    v31 = -[CLKUIMetalQuadView _newRenderPassDescriptor](v10, "_newRenderPassDescriptor");
    renderPassDescriptor = v10->_renderPassDescriptor;
    v10->_renderPassDescriptor = (MTLRenderPassDescriptor *)v31;

    *((_BYTE *)v10 + 560) |= 0x10u;
    v33 = objc_alloc(MEMORY[0x1E0DC3890]);
    -[CLKUIMetalQuadView bounds](v10, "bounds");
    v34 = objc_msgSend(v33, "initWithFrame:");
    snapshotView = v10->_snapshotView;
    v10->_snapshotView = (UIImageView *)v34;

    -[CLKUIMetalQuadView addSubview:](v10, "addSubview:", v10->_snapshotView);
    -[UIImageView setHidden:](v10->_snapshotView, "setHidden:", 1);

  }
  return v10;
}

+ (id)allocateDepthTextureWithWidth:(unint64_t)a3 height:(unint64_t)a4 sampleCount:(unint64_t)a5
{
  void *v5;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v5 = 0;
  if (a3 && a4)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0CC6BB0]);
    v10 = v9;
    if (a5 >= 2)
      v11 = 4;
    else
      v11 = 2;
    objc_msgSend(v9, "setTextureType:", v11);
    objc_msgSend(v10, "setPixelFormat:", 252);
    objc_msgSend(v10, "setWidth:", a3);
    objc_msgSend(v10, "setHeight:", a4);
    objc_msgSend(v10, "setSampleCount:", a5);
    objc_msgSend(v10, "setUsage:", 4);
    objc_msgSend(v10, "setStorageMode:", 3);
    +[CLKUIMetalResourceManager sharedDevice](CLKUIMetalResourceManager, "sharedDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v12, "newTextureWithDescriptor:", v10);

  }
  return v5;
}

+ (id)allocateMsaaTextureWithWidth:(unint64_t)a3 height:(unint64_t)a4 pixelFormat:(unint64_t)a5 sampleCount:(unint64_t)a6
{
  void *v6;
  id v11;
  void *v12;

  v6 = 0;
  if (a4 && a3 && a6 >= 2)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0CC6BB0]);
    objc_msgSend(v11, "setTextureType:", 4);
    objc_msgSend(v11, "setPixelFormat:", a5);
    objc_msgSend(v11, "setWidth:", a3);
    objc_msgSend(v11, "setHeight:", a4);
    objc_msgSend(v11, "setStorageMode:", 3);
    objc_msgSend(v11, "setUsage:", 4);
    objc_msgSend(v11, "setSampleCount:", a6);
    objc_msgSend(v11, "setMipmapLevelCount:", 1);
    +[CLKUIMetalResourceManager sharedDevice](CLKUIMetalResourceManager, "sharedDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v12, "newTextureWithDescriptor:", v11);

  }
  return v6;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  -[CLKUIMetalQuadView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CAMetalLayer frame](self->_metalLayer, "frame");
  self->_quadSize.width = (int)v8;
  self->_quadSize.height = (int)v10;
  if (v8 != v12 || v10 != v11)
  {
    *((_BYTE *)self + 560) |= 0x10u;
    -[CAMetalLayer setFrame:](self->_metalLayer, "setFrame:", v4, v6, v8, v10);
  }
  -[CLKUIMetalQuadView bounds](self, "bounds");
  -[UIImageView setFrame:](self->_snapshotView, "setFrame:");
}

- (void)setOpaque:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CLKUIMetalQuadView;
  if (-[CLKUIMetalQuadView isOpaque](&v6, sel_isOpaque) != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)CLKUIMetalQuadView;
    -[CLKUIMetalQuadView setOpaque:](&v5, sel_setOpaque_, v3);
    -[CAMetalLayer setOpaque:](self->_metalLayer, "setOpaque:", v3);
  }
}

- (void)setClearColor:(id)a3
{
  double var3;
  double var2;
  double var1;
  double var0;
  void *v7;
  id v8;

  var3 = a3.var3;
  var2 = a3.var2;
  var1 = a3.var1;
  var0 = a3.var0;
  -[MTLRenderPassDescriptor colorAttachments](self->_renderPassDescriptor, "colorAttachments");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setClearColor:", var0, var1, var2, var3);

}

- ($01BB1521EC52D44A8E7628F5261DCEC8)clearColor
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  $01BB1521EC52D44A8E7628F5261DCEC8 result;

  -[MTLRenderPassDescriptor colorAttachments](self->_renderPassDescriptor, "colorAttachments");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clearColor");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.var3 = v15;
  result.var2 = v14;
  result.var1 = v13;
  result.var0 = v12;
  return result;
}

- (void)_handleQuadArrayChange:(id)a3
{
  NSArray *v4;
  NSArray *quads;
  objc_super v6;

  v4 = (NSArray *)a3;
  v6.receiver = self;
  v6.super_class = (Class)CLKUIMetalQuadView;
  -[CLKUIQuadView _handleQuadArrayChange:](&v6, sel__handleQuadArrayChange_, v4);
  quads = self->_quads;
  self->_quads = v4;

}

- (void)snapshotAndFreeze
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  id v13;

  -[CLKUIMetalQuadView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "screenScale");
  -[CLKUIMetalQuadView snapshotInRect:scale:time:](self, "snapshotInRect:scale:time:", v4, v6, v8, v10, v12, CACurrentMediaTime());
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[UIImageView setImage:](self->_snapshotView, "setImage:", v13);
  -[UIImageView setHidden:](self->_snapshotView, "setHidden:", 0);

}

- (void)setSingleBufferMode:(BOOL)a3
{
  _BOOL4 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)CLKUIMetalQuadView;
  -[CLKUIQuadView setSingleBufferMode:](&v5, sel_setSingleBufferMode_);
  if (v3)
    -[CAMetalLayer removeBackBuffers](self->_metalLayer, "removeBackBuffers");
}

- (id)snapshotInRect:(CGRect)a3 scale:(double)a4 time:(double)a5
{
  id v5;
  _QWORD v7[6];
  CGRect v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__CLKUIMetalQuadView_snapshotInRect_scale_time___block_invoke;
  v7[3] = &unk_1E6075BA8;
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v7[4] = self;
  v7[5] = &v11;
  -[CLKUIQuadView _runOnRenderQueueIfNeeded:](self, "_runOnRenderQueueIfNeeded:", v7);
  v5 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v5;
}

void __48__CLKUIMetalQuadView_snapshotInRect_scale_time___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *, void *);
  void *v17;
  uint64_t v18;
  id v19;

  v2 = (void *)MEMORY[0x1B5E036CC]();
  v3 = *(_QWORD *)(a1 + 32);
  if ((*(_QWORD *)(v3 + 640) | 2) == 0x22B)
  {
    objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 71, (unint64_t)(*(double *)(a1 + 64) * *(double *)(a1 + 80)), (unint64_t)(*(double *)(a1 + 80) * *(double *)(a1 + 72)), 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setUsage:", 3);
    +[CLKUIMetalResourceManager sharedDevice](CLKUIMetalResourceManager, "sharedDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "newTextureWithDescriptor:", v4);

    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __48__CLKUIMetalQuadView_snapshotInRect_scale_time___block_invoke_2;
    v17 = &unk_1E6075B80;
    v18 = *(_QWORD *)(a1 + 32);
    v7 = v6;
    v19 = v7;
    v8 = _Block_copy(&v14);

    v3 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v7 = 0;
    v8 = 0;
  }
  *(_BYTE *)(v3 + 624) = 1;
  objc_msgSend(*(id *)(a1 + 32), "_snapshotTextureInRect:scale:time:withAdditionalPasses:", v8, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), v14, v15, v16, v17, v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 624) = 0;
  if (v7)
    v10 = v7;
  else
    v10 = v9;
  objc_msgSend(*(id *)(a1 + 32), "_textureToImage:scale:", v10, *(double *)(a1 + 80));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  objc_autoreleasePoolPop(v2);
}

void __48__CLKUIMetalQuadView_snapshotInRect_scale_time___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;

  v6 = *(void **)(a1 + 40);
  v11 = *(id *)(*(_QWORD *)(a1 + 32) + 576);
  v7 = v11;
  CLKUIConvertTextureFromXRSRGBtoP3(a3, v6, a2, &v11);
  v8 = v11;

  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 576);
  *(_QWORD *)(v9 + 576) = v8;

}

- (id)snapshotTextureInRect:(CGRect)a3 scale:(double)a4 time:(double)a5
{
  id v5;
  _QWORD v7[6];
  CGRect v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__CLKUIMetalQuadView_snapshotTextureInRect_scale_time___block_invoke;
  v7[3] = &unk_1E6075BD0;
  v7[4] = self;
  v7[5] = &v11;
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[CLKUIQuadView _runOnRenderQueueIfNeeded:](self, "_runOnRenderQueueIfNeeded:", v7);
  v5 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v5;
}

void __55__CLKUIMetalQuadView_snapshotTextureInRect_scale_time___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_snapshotTextureInRect:scale:time:withAdditionalPasses:", 0, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_snapshotTextureInRect:(CGRect)a3 scale:(double)a4 time:(double)a5 withAdditionalPasses:(id)a6
{
  double height;
  double width;
  void (**v11)(id, void *, id);
  void *v12;
  void *v13;
  double v14;
  void *v15;
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  unint64_t msaaCount;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v39;
  unint64_t v40;
  unint64_t v41;
  void *context;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  height = a3.size.height;
  width = a3.size.width;
  v54 = *MEMORY[0x1E0C80C00];
  v11 = (void (**)(id, void *, id))a6;
  context = (void *)MEMORY[0x1B5E036CC](-[CLKUIQuadView _prerenderForTime:](self, "_prerenderForTime:", a5));
  v40 = (unint64_t)(height * a4);
  v41 = (unint64_t)(width * a4);
  objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", self->_colorPixelFormat);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setUsage:", 5);
  +[CLKUIMetalResourceManager sharedDevice](CLKUIMetalResourceManager, "sharedDevice");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (id)objc_msgSend(v13, "newTextureWithDescriptor:", v12);

  v14 = CACurrentMediaTime();
  v15 = (void *)objc_opt_new();
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v16 = self->_quads;
  v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v49 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        if (objc_msgSend(v21, "prepareForTime:", v14))
          objc_msgSend(v15, "addObject:", v21);
      }
      v18 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    }
    while (v18);
  }

  if (objc_msgSend(v15, "count"))
  {
    -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)MEMORY[0x1E0CB3940];
    -[CLKUIQuadView debugIdentifier](self, "debugIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringWithFormat:", CFSTR("FaceSnapshot-%@"), v24);
    v25 = objc_claimAutoreleasedReturnValue();

    v39 = (void *)v25;
    +[CLKUIMetalResourceManager addCompletedErrorCheckToCommandBuffer:forCase:](CLKUIMetalResourceManager, "addCompletedErrorCheckToCommandBuffer:forCase:", v22, v25);
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v26 = v15;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v45;
      do
      {
        for (j = 0; j != v28; ++j)
        {
          if (*(_QWORD *)v45 != v29)
            objc_enumerationMutation(v26);
          objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * j), "performOffscreenPassesWithCommandBuffer:", v22);
        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
      }
      while (v28);
    }

    msaaCount = self->_msaaCount;
    -[MTLRenderPassDescriptor colorAttachments](self->_renderPassDescriptor, "colorAttachments");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "objectAtIndexedSubscript:", 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v33;
    if (msaaCount < 2)
    {
      objc_msgSend(v33, "setTexture:", v43);
    }
    else
    {
      +[CLKUIMetalQuadView allocateMsaaTextureWithWidth:height:pixelFormat:sampleCount:](CLKUIMetalQuadView, "allocateMsaaTextureWithWidth:height:pixelFormat:sampleCount:", v41, v40, -[CLKUIMetalQuadView colorPixelFormat](self, "colorPixelFormat"), self->_msaaCount);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setTexture:", v35);

      -[MTLRenderPassDescriptor colorAttachments](self->_renderPassDescriptor, "colorAttachments");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "objectAtIndexedSubscript:", 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setResolveTexture:", v43);
    }

    if ((*((_BYTE *)self + 560) & 1) != 0)
    {
      -[MTLRenderPassDescriptor depthAttachment](self->_renderPassDescriptor, "depthAttachment");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      +[CLKUIMetalQuadView allocateDepthTextureWithWidth:height:sampleCount:](CLKUIMetalQuadView, "allocateDepthTextureWithWidth:height:sampleCount:", v41, v40, self->_msaaCount);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setTexture:", v37);

    }
    -[CLKUIMetalQuadView _renderQuads:toScreenWithCommandBuffer:passDescriptor:](self, "_renderQuads:toScreenWithCommandBuffer:passDescriptor:", v26, v22, self->_renderPassDescriptor);
    if (v11)
      v11[2](v11, v22, v43);
    objc_msgSend(v22, "commit");
    objc_msgSend(v22, "waitUntilCompleted");

  }
  objc_autoreleasePoolPop(context);

  return v43;
}

- (BOOL)prewarmWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__CLKUIMetalQuadView_prewarmWithCompletion___block_invoke;
  v7[3] = &unk_1E6075C20;
  v7[4] = self;
  v5 = v4;
  v8 = v5;
  v9 = &v10;
  -[CLKUIQuadView _runOnRenderQueueIfNeeded:](self, "_runOnRenderQueueIfNeeded:", v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

void __44__CLKUIMetalQuadView_prewarmWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *context;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[4];
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1B5E036CC]();
  v3 = CACurrentMediaTime();
  v4 = (void *)objc_opt_new();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v5 = *(id *)(*(_QWORD *)(a1 + 32) + 536);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v41 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        if (objc_msgSend(v10, "prepareForTime:", v3))
          objc_msgSend(v4, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v4, "count"))
  {
    context = v2;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 504), "commandBuffer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(a1 + 32), "debugIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("FacePrewarm-%@"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    +[CLKUIMetalResourceManager addCompletedErrorCheckToCommandBuffer:forCase:](CLKUIMetalResourceManager, "addCompletedErrorCheckToCommandBuffer:forCase:", v11, v14);
    v15 = *(void **)(a1 + 40);
    if (v15)
    {
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __44__CLKUIMetalQuadView_prewarmWithCompletion___block_invoke_2;
      v38[3] = &unk_1E6075BF8;
      v39 = v15;
      objc_msgSend(v11, "addCompletedHandler:", v38);

    }
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v16 = v4;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v35;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v35 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * j), "performOffscreenPassesWithCommandBuffer:", v11);
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
      }
      while (v18);
    }

    v21 = *(_QWORD *)(a1 + 32);
    if ((*(_BYTE *)(v21 + 560) & 1) != 0)
    {
      objc_msgSend(*(id *)(v21 + 512), "depthAttachment");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "texture");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = *(void **)(*(_QWORD *)(a1 + 32) + 544);

      v21 = *(_QWORD *)(a1 + 32);
      if (v23 != v24)
      {
        objc_msgSend(*(id *)(v21 + 512), "depthAttachment");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setTexture:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 544));

        v21 = *(_QWORD *)(a1 + 32);
      }
    }
    if (!*(_QWORD *)(v21 + 608))
    {
      objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", *(_QWORD *)(v21 + 640), 32, 32, 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setUsage:", 5);
      +[CLKUIMetalResourceManager sharedDevice](CLKUIMetalResourceManager, "sharedDevice");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "newTextureWithDescriptor:", v26);
      v29 = *(_QWORD *)(a1 + 32);
      v30 = *(void **)(v29 + 608);
      *(_QWORD *)(v29 + 608) = v28;

      v21 = *(_QWORD *)(a1 + 32);
    }
    objc_msgSend(*(id *)(v21 + 512), "colorAttachments");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "objectAtIndexedSubscript:", 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setTexture:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 608));

    objc_msgSend(*(id *)(a1 + 32), "_renderQuads:toScreenWithCommandBuffer:passDescriptor:", v16, v11, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 512));
    objc_msgSend(v11, "commit");

    objc_autoreleasePoolPop(context);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;

    objc_autoreleasePoolPop(v2);
  }
}

uint64_t __44__CLKUIMetalQuadView_prewarmWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_textureToImage:(id)a3 scale:(double)a4
{
  return CLKUIConvertMTLTextureToUIImage(a3, self->_colorPixelFormat, a4);
}

- (void)_renderQuads:(id)a3 toScreenWithCommandBuffer:(id)a4 passDescriptor:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((*((_BYTE *)self + 560) & 8) != 0)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v18 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v27;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v27 != v20)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v21++), "renderWithCommandBuffer:passDescriptor:", v9, v10);
        }
        while (v19 != v21);
        v19 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v19);
    }
  }
  else
  {
    objc_msgSend(v9, "renderCommandEncoderWithDescriptor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if ((*((_BYTE *)self + 560) & 1) != 0)
      objc_msgSend(v11, "setDepthStencilState:", self->_depthStencilState);
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v13 = v8;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v23;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v23 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v17++), "renderForDisplayWithEncoder:", v12, (_QWORD)v22);
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      }
      while (v15);
    }

    objc_msgSend(v12, "endEncoding");
  }

}

- (BOOL)_displayAndCheckForDrawable:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL4 v4;
  double v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  id v20;
  void *v21;
  id v22;
  void *v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t m;
  void *v28;
  MTLTexture *v29;
  BOOL v30;
  MTLComputePipelineState *v31;
  void *v32;
  MTLComputePipelineState *v33;
  MTLComputePipelineState *aplPipelineState;
  MTLComputePipelineState *v35;
  void *v36;
  float aplFilterAmount;
  void *v38;
  double v39;
  int v40;
  int v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  void *v45;
  unint64_t v46;
  void *v47;
  void *v48;
  id v49;
  void (**v50)(_QWORD);
  int v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t k;
  unsigned int v56;
  unint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *context;
  void *v63;
  void (**v64)(void);
  _QWORD aBlock[4];
  id v66;
  id v67;
  _QWORD v68[3];
  _QWORD v69[3];
  id location[2];
  __int128 v71;
  __int128 v72;
  __n128 v73;
  __int128 v74;
  MTLComputePipelineState *v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _QWORD v88[4];
  id v89;
  _QWORD v90[4];
  void (**v91)(void);
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  _BYTE v96[128];
  _BYTE v97[128];
  _BYTE v98[128];
  _BYTE v99[128];
  uint64_t v100;

  v4 = a3;
  v100 = *MEMORY[0x1E0C80C00];
  v64 = (void (**)(void))a4;
  context = (void *)MEMORY[0x1B5E036CC]();
  -[CLKUIMetalQuadView _updateDrawableSizeIfNecessary](self, "_updateDrawableSizeIfNecessary");
  v6 = CACurrentMediaTime();
  v7 = (void *)objc_opt_new();
  v92 = 0u;
  v93 = 0u;
  v94 = 0u;
  v95 = 0u;
  v8 = self->_quads;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v92, v99, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v93;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v93 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * i);
        if (objc_msgSend(v12, "prepareForTime:", v6))
          objc_msgSend(v7, "addObject:", v12);
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v92, v99, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v7, "count"))
  {
    -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0CB3940];
    -[CLKUIQuadView debugIdentifier](self, "debugIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("FaceDisplay-%@"), v15);
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    +[CLKUIMetalResourceManager addCompletedErrorCheckToCommandBuffer:forCase:](CLKUIMetalResourceManager, "addCompletedErrorCheckToCommandBuffer:forCase:", v13, v61);
    -[UIImageView setHidden:](self->_snapshotView, "setHidden:", 1);
    -[UIImageView setImage:](self->_snapshotView, "setImage:", 0);
    if (v64)
    {
      v90[0] = MEMORY[0x1E0C809B0];
      v90[1] = 3221225472;
      v90[2] = __65__CLKUIMetalQuadView__displayAndCheckForDrawable_withCompletion___block_invoke;
      v90[3] = &unk_1E6075BF8;
      v91 = v64;
      objc_msgSend(v13, "addScheduledHandler:", v90);

    }
    if (-[CLKUIQuadView singleBufferMode](self, "singleBufferMode"))
    {
      objc_initWeak(location, self);
      v88[0] = MEMORY[0x1E0C809B0];
      v88[1] = 3221225472;
      v88[2] = __65__CLKUIMetalQuadView__displayAndCheckForDrawable_withCompletion___block_invoke_2;
      v88[3] = &unk_1E6075C48;
      objc_copyWeak(&v89, location);
      objc_msgSend(v13, "addCompletedHandler:", v88);
      objc_destroyWeak(&v89);
      objc_destroyWeak(location);
    }
    v86 = 0u;
    v87 = 0u;
    v84 = 0u;
    v85 = 0u;
    v16 = v7;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v84, v98, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v85;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v85 != v18)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v84 + 1) + 8 * j), "performOffscreenPassesWithCommandBuffer:", v13);
        }
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v84, v98, 16);
      }
      while (v17);
    }

    if (v4
      && (*((_BYTE *)self + 560) & 2) == 0
      && (-[CAMetalLayer isDrawableAvailable](self->_metalLayer, "isDrawableAvailable") & 1) == 0)
    {
      objc_msgSend(v13, "commit");
      v82 = 0u;
      v83 = 0u;
      v80 = 0u;
      v81 = 0u;
      v20 = v16;
      v52 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v80, v97, 16);
      if (v52)
      {
        v53 = *(_QWORD *)v81;
        do
        {
          for (k = 0; k != v52; ++k)
          {
            if (*(_QWORD *)v81 != v53)
              objc_enumerationMutation(v20);
            objc_msgSend(*(id *)(*((_QWORD *)&v80 + 1) + 8 * k), "renderFailedForReason:", 0);
          }
          v52 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v80, v97, 16);
        }
        while (v52);
      }
      v24 = 1;
      goto LABEL_64;
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    -[CAMetalLayer nextDrawable](self->_metalLayer, "nextDrawable");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "timeIntervalSinceDate:", v20);
    if (!v63)
    {
      objc_msgSend(v13, "commit");
      v78 = 0u;
      v79 = 0u;
      v76 = 0u;
      v77 = 0u;
      v22 = v16;
      v25 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v76, v96, 16);
      if (v25)
      {
        v26 = *(_QWORD *)v77;
        do
        {
          for (m = 0; m != v25; ++m)
          {
            if (*(_QWORD *)v77 != v26)
              objc_enumerationMutation(v22);
            objc_msgSend(*(id *)(*((_QWORD *)&v76 + 1) + 8 * m), "renderFailedForReason:", 1);
          }
          v25 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v76, v96, 16);
        }
        while (v25);
      }
      v24 = 1;
      goto LABEL_63;
    }
    -[MTLRenderPassDescriptor colorAttachments](self->_renderPassDescriptor, "colorAttachments");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
    v22 = (id)objc_claimAutoreleasedReturnValue();

    if (self->_msaaCount < 2)
    {
      objc_msgSend(v63, "texture");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setTexture:", v23);
    }
    else
    {
      objc_msgSend(v22, "setTexture:", self->_msaaTexture);
      objc_msgSend(v63, "texture");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setResolveTexture:", v23);
    }

    if ((*((_BYTE *)self + 560) & 1) != 0)
    {
      -[MTLRenderPassDescriptor depthAttachment](self->_renderPassDescriptor, "depthAttachment");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "texture");
      v29 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
      v30 = v29 == self->_depthTexture;

      if (!v30)
        objc_msgSend(v28, "setTexture:", self->_depthTexture);

    }
    -[CLKUIMetalQuadView _renderQuads:toScreenWithCommandBuffer:passDescriptor:](self, "_renderQuads:toScreenWithCommandBuffer:passDescriptor:", v16, v13, self->_renderPassDescriptor);
    if (-[CLKUIMetalQuadView _shouldApplyAPLFilter](self, "_shouldApplyAPLFilter"))
    {
      v31 = self->_aplPipelineState;
      objc_msgSend(v63, "texture");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = v31;
      _CLKUIComputeTextureAPL(v32, v13, (id *)&v75);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v75;

      aplPipelineState = self->_aplPipelineState;
      self->_aplPipelineState = v33;
      v35 = v33;

      -[CLKUIMetalQuadView _getDimmingPipelineState](self, "_getDimmingPipelineState");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "computeCommandEncoder");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setComputePipelineState:", v59);
      v73 = 0u;
      v74 = 0u;
      v71 = 0u;
      v72 = 0u;
      *(_OWORD *)location = 0u;
      aplFilterAmount = self->_aplFilterAmount;
      *(float *)&v74 = self->_maxAPL;
      *((float *)&v74 + 1) = aplFilterAmount;
      objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = CLKUINativeToAPLCoeff(v38);

      v39 = sRGBtoNative();
      LODWORD(location[1]) = v40;
      DWORD2(v71) = v41;
      location[0] = *(id *)&v39;
      *(_QWORD *)&v71 = v42;
      DWORD2(v72) = v43;
      *(_QWORD *)&v72 = v44;
      objc_msgSend(v36, "setBytes:length:atIndex:", location, 80, 2);
      objc_msgSend(v36, "setBuffer:offset:atIndex:", v58, 0, 1);
      objc_msgSend(v63, "texture");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setTexture:atIndex:", v45, 0);

      v46 = objc_msgSend(v59, "threadExecutionWidth");
      v57 = objc_msgSend(v59, "maxTotalThreadsPerThreadgroup");
      objc_msgSend(v63, "texture");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v47, "width");
      objc_msgSend(v63, "texture");
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      LODWORD(v35) = objc_msgSend(v48, "height");
      v69[0] = (v46 + v56 - 1) / v46;
      v69[1] = (v57 / v46 + v35 - 1) / (v57 / v46);
      v69[2] = 1;
      v68[0] = v46;
      v68[1] = v57 / v46;
      v68[2] = 1;
      objc_msgSend(v36, "dispatchThreadgroups:threadsPerThreadgroup:", v69, v68);
      objc_msgSend(v36, "endEncoding");

    }
    if ((*((_BYTE *)self + 560) & 2) == 0)
    {
      objc_msgSend(v13, "presentDrawable:", v63);
      objc_msgSend(v13, "commit");
LABEL_62:
      v24 = 0;
LABEL_63:

LABEL_64:
      goto LABEL_65;
    }
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __65__CLKUIMetalQuadView__displayAndCheckForDrawable_withCompletion___block_invoke_3;
    aBlock[3] = &unk_1E6075C70;
    v49 = v13;
    v66 = v49;
    v67 = v63;
    v50 = (void (**)(_QWORD))_Block_copy(aBlock);
    objc_msgSend(v49, "commit");
    v51 = objc_msgSend(MEMORY[0x1E0CD28B0], "currentPhase");
    if (v51)
    {
      if (v51 == 1)
      {
        v50[2](v50);
LABEL_61:

        goto LABEL_62;
      }
      if (!objc_msgSend(MEMORY[0x1E0CD28B0], "currentState"))
        objc_msgSend(MEMORY[0x1E0CD28B0], "activate");
    }
    objc_msgSend(MEMORY[0x1E0CD28B0], "addCommitHandler:forPhase:", v50, 1);
    goto LABEL_61;
  }
  v64[2]();
  v24 = 1;
LABEL_65:

  objc_autoreleasePoolPop(context);
  return v24 == 0;
}

uint64_t __65__CLKUIMetalQuadView__displayAndCheckForDrawable_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __65__CLKUIMetalQuadView__displayAndCheckForDrawable_withCompletion___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  int v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v3 = objc_msgSend(WeakRetained, "singleBufferMode");
    v2 = v4;
    if (v3)
    {
      objc_msgSend(v4[66], "removeBackBuffers");
      v2 = v4;
    }
  }

}

uint64_t __65__CLKUIMetalQuadView__displayAndCheckForDrawable_withCompletion___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "waitUntilScheduled");
  return objc_msgSend(*(id *)(a1 + 40), "present");
}

- (void)_updateFramebufferOnly
{
  CAMetalLayer *metalLayer;
  uint64_t v3;

  metalLayer = self->_metalLayer;
  if ((*((_BYTE *)self + 560) & 0x20) != 0)
    v3 = 0;
  else
    v3 = -[CLKUIMetalQuadView _shouldApplyAPLFilter](self, "_shouldApplyAPLFilter") ^ 1;
  -[CAMetalLayer setFramebufferOnly:](metalLayer, "setFramebufferOnly:", v3);
}

- (BOOL)_shouldApplyAPLFilter
{
  return self->_maxAPL < 1.0 && self->_aplFilterAmount > 0.0;
}

- (void)setMaxAPL:(float)a3
{
  self->_maxAPL = a3;
  -[CLKUIMetalQuadView _updateFramebufferOnly](self, "_updateFramebufferOnly");
}

- (void)setAplFilterAmount:(float)a3
{
  self->_aplFilterAmount = a3;
  -[CLKUIMetalQuadView _updateFramebufferOnly](self, "_updateFramebufferOnly");
}

- (float)computeAPL
{
  float result;

  -[CLKUIMetalQuadView computeAPLAndSnapshot:](self, "computeAPLAndSnapshot:", 0);
  return result;
}

- (float)computeAPLAndSnapshot:(id *)a3
{
  float v5;
  _QWORD v7[9];
  _QWORD v8[5];
  MTLComputePipelineState *v9;
  _QWORD v10[5];
  id v11;
  uint64_t v12;
  float *v13;
  uint64_t v14;
  int v15;

  v12 = 0;
  v13 = (float *)&v12;
  v14 = 0x2020000000;
  v15 = 0;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = __Block_byref_object_copy__28;
  v10[4] = __Block_byref_object_dispose__29;
  v11 = 0;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3032000000;
  v8[3] = __Block_byref_object_copy_;
  v8[4] = __Block_byref_object_dispose_;
  v9 = self->_aplPipelineState;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__CLKUIMetalQuadView_computeAPLAndSnapshot___block_invoke;
  v7[3] = &unk_1E6075CC0;
  v7[4] = self;
  v7[5] = v10;
  v7[7] = &v12;
  v7[8] = a3;
  v7[6] = v8;
  -[CLKUIQuadView _runOnRenderQueueIfNeeded:](self, "_runOnRenderQueueIfNeeded:", v7);
  v5 = v13[6];
  _Block_object_dispose(v8, 8);

  _Block_object_dispose(v10, 8);
  _Block_object_dispose(&v12, 8);
  return v5;
}

void __44__CLKUIMetalQuadView_computeAPLAndSnapshot___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  __int128 v17;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "screenScale");
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __44__CLKUIMetalQuadView_computeAPLAndSnapshot___block_invoke_2;
  v16[3] = &unk_1E6075C98;
  v17 = *(_OWORD *)(a1 + 40);
  objc_msgSend(v2, "_snapshotTextureInRect:scale:time:withAdditionalPasses:", v16, v4, v6, v8, v10, v12, 0.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 568), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  if (*(_QWORD *)(a1 + 64))
  {
    v14 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "screenScale");
    objc_msgSend(v14, "_textureToImage:scale:", v13);
    **(_QWORD **)(a1 + 64) = (id)objc_claimAutoreleasedReturnValue();

  }
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = (*(float (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                                              + 40)
                                                                                  + 16))();

}

void __44__CLKUIMetalQuadView_computeAPLAndSnapshot___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj;

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v4 + 40);
  CLKUIComputeTextureAPL(a3, a2, &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (id)_getDimmingPipelineState
{
  MTLComputePipelineState *dimmingPipelineState;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  MTLComputePipelineState *v9;
  id v10;
  MTLComputePipelineState *v11;
  id v13;
  id v14;

  dimmingPipelineState = self->_dimmingPipelineState;
  if (!dimmingPipelineState)
  {
    +[CLKUIMetalResourceManager sharedDevice](CLKUIMetalResourceManager, "sharedDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    v6 = (void *)objc_msgSend(v4, "newDefaultLibraryWithBundle:error:", v5, &v14);
    v7 = v14;

    v8 = (void *)objc_msgSend(v6, "newFunctionWithName:", CFSTR("compute_apply_dimming"));
    v13 = v7;
    v9 = (MTLComputePipelineState *)objc_msgSend(v4, "newComputePipelineStateWithFunction:error:", v8, &v13);
    v10 = v13;

    v11 = self->_dimmingPipelineState;
    self->_dimmingPipelineState = v9;

    dimmingPipelineState = self->_dimmingPipelineState;
  }
  return dimmingPipelineState;
}

- (unint64_t)_msaaCount
{
  return 4;
}

- (void)discardContents
{
  -[CAMetalLayer discardContents](self->_metalLayer, "discardContents");
}

- (id)metalLayer
{
  return self->_metalLayer;
}

- (id)_newRenderPassDescriptor
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CC6B50], "renderPassDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "colorAttachments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setLoadAction:", 2);
  objc_msgSend(v5, "setClearColor:", 0.0, 0.0, 0.0, 0.0);
  if (self->_msaaCount <= 1)
    v6 = 1;
  else
    v6 = 2;
  objc_msgSend(v5, "setStoreAction:", v6);
  if ((*((_BYTE *)self + 560) & 1) != 0)
  {
    objc_msgSend(v3, "depthAttachment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLoadAction:", 2);
    objc_msgSend(v7, "setClearDepth:", 1.0);
    objc_msgSend(v7, "setStoreAction:", 0);

  }
  return v3;
}

- (CGSize)drawableSize
{
  double v2;
  double v3;
  CGSize result;

  -[CAMetalLayer drawableSize](self->_metalLayer, "drawableSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_updateDrawableSizeIfNecessary
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  MTLTexture *msaaTexture;
  MTLTexture *v13;
  MTLTexture *v14;
  MTLTexture *depthTexture;
  MTLTexture *v16;
  MTLTexture *v17;
  CAMetalLayer *v18;

  if ((*((_BYTE *)self + 560) & 0x10) != 0)
  {
    v18 = self->_metalLayer;
    if ((*((_BYTE *)self + 560) & 4) != 0)
    {
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "scale");
      v6 = v7;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "device");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "screenScale");
      v6 = v5;

    }
    -[CAMetalLayer bounds](v18, "bounds");
    v9 = v6 * v8;
    v11 = v6 * v10;
    self->_quadSize.width = (int)v9;
    self->_quadSize.height = (int)v11;
    -[CAMetalLayer setDrawableSize:](v18, "setDrawableSize:", v9, v11);
    if (self->_msaaCount >= 2)
    {
      msaaTexture = self->_msaaTexture;
      if (!msaaTexture
        || v9 != (double)(unint64_t)-[MTLTexture width](msaaTexture, "width")
        || v11 != (double)(unint64_t)-[MTLTexture height](self->_msaaTexture, "height"))
      {
        +[CLKUIMetalQuadView allocateMsaaTextureWithWidth:height:pixelFormat:sampleCount:](CLKUIMetalQuadView, "allocateMsaaTextureWithWidth:height:pixelFormat:sampleCount:", (unint64_t)v9, (unint64_t)v11, -[CLKUIMetalQuadView colorPixelFormat](self, "colorPixelFormat"), self->_msaaCount);
        v13 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
        v14 = self->_msaaTexture;
        self->_msaaTexture = v13;

      }
    }
    if ((*((_BYTE *)self + 560) & 1) != 0)
    {
      depthTexture = self->_depthTexture;
      if (!depthTexture
        || v9 != (double)(unint64_t)-[MTLTexture width](depthTexture, "width")
        || v11 != (double)(unint64_t)-[MTLTexture height](self->_depthTexture, "height"))
      {
        +[CLKUIMetalQuadView allocateDepthTextureWithWidth:height:sampleCount:](CLKUIMetalQuadView, "allocateDepthTextureWithWidth:height:sampleCount:", (unint64_t)v9, (unint64_t)v11, self->_msaaCount);
        v16 = (MTLTexture *)objc_claimAutoreleasedReturnValue();
        v17 = self->_depthTexture;
        self->_depthTexture = v16;

      }
    }
    *((_BYTE *)self + 560) &= ~0x10u;

  }
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CLKUIMetalQuadView;
  -[CLKUIQuadView dealloc](&v2, sel_dealloc);
}

- (unint64_t)colorPixelFormat
{
  return self->_colorPixelFormat;
}

- (BOOL)isSnapshotting
{
  return self->_isSnapshotting;
}

- (float)maxAPL
{
  return self->_maxAPL;
}

- (float)aplFilterAmount
{
  return self->_aplFilterAmount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotView, 0);
  objc_storeStrong((id *)&self->_textureForPrewarming, 0);
  objc_storeStrong((id *)&self->_msaaTexture, 0);
  objc_storeStrong((id *)&self->_dimmingPipelineState, 0);
  objc_storeStrong((id *)&self->_colorConversionPipelineState, 0);
  objc_storeStrong((id *)&self->_aplPipelineState, 0);
  objc_storeStrong((id *)&self->_depthStencilState, 0);
  objc_storeStrong((id *)&self->_depthTexture, 0);
  objc_storeStrong((id *)&self->_quads, 0);
  objc_storeStrong((id *)&self->_metalLayer, 0);
  objc_storeStrong((id *)&self->_renderPassDescriptor, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
}

@end
