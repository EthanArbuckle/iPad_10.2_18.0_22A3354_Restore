@implementation TSDTileProvider

- (TSDTileProvider)initWithTarget:(id)a3 queue:(id)a4 storage:(id)a5 accessController:(id)a6
{
  TSDTileProvider *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)TSDTileProvider;
  v10 = -[TSDTileProvider init](&v16, sel_init);
  if (v10)
  {
    v10->mTarget = a3;
    if (!a4)
    {
      v11 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDTileProvider initWithTarget:queue:storage:accessController:]");
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTileProvider.m"), 36, CFSTR("invalid nil value for '%s'"), "queue");
    }
    v10->mQueue = (OS_dispatch_queue *)a4;
    v10->mTileStorage = (TSDTileStorage *)a5;
    if (!a6)
    {
      v13 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v14 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDTileProvider initWithTarget:queue:storage:accessController:]");
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTileProvider.m"), 41, CFSTR("invalid nil value for '%s'"), "accessController");
    }
    v10->mAccessController = (TSKAccessController *)a6;
  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[TSDTileProvider removeStoredImages](self, "removeStoredImages");

  v3.receiver = self;
  v3.super_class = (Class)TSDTileProvider;
  -[TSDTileProvider dealloc](&v3, sel_dealloc);
}

- (void)provideContentsInRect:(CGRect)a3 contentsScale:(double)a4 forTile:(id)a5 atLocation:(id)a6 inGroup:(id)a7 limitedBySemaphore:(id)a8 takingReadLock:(BOOL)a9 startBlock:(id)a10 completionBlock:(id)a11
{
  unint64_t var1;
  unint64_t var0;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  NSObject *mQueue;
  _QWORD block[16];
  BOOL v25;

  var1 = a6.var1;
  var0 = a6.var0;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  dispatch_retain((dispatch_object_t)a8);
  mQueue = self->mQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __143__TSDTileProvider_provideContentsInRect_contentsScale_forTile_atLocation_inGroup_limitedBySemaphore_takingReadLock_startBlock_completionBlock___block_invoke;
  block[3] = &unk_24D82CA38;
  block[4] = a8;
  block[5] = self;
  *(CGFloat *)&block[9] = x;
  *(CGFloat *)&block[10] = y;
  *(CGFloat *)&block[11] = width;
  *(CGFloat *)&block[12] = height;
  *(double *)&block[13] = a4;
  block[6] = a5;
  block[7] = a10;
  block[14] = var0;
  block[15] = var1;
  v25 = a9;
  block[8] = a11;
  dispatch_group_async((dispatch_group_t)a7, mQueue, block);
}

void __143__TSDTileProvider_provideContentsInRect_contentsScale_forTile_atLocation_inGroup_limitedBySemaphore_takingReadLock_startBlock_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL);
  v2 = *(_QWORD *)(a1 + 56);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  v3 = objc_msgSend(*(id *)(a1 + 40), "contentsInRect:contentsScale:forTile:atLocation:takingReadLock:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(unsigned __int8 *)(a1 + 128), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  if (v3)
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
}

- (id)contentsInRect:(CGRect)a3 contentsScale:(double)a4 forTile:(id)a5 atLocation:(id)a6 takingReadLock:(BOOL)a7
{
  _BOOL4 v7;
  unint64_t var1;
  unint64_t var0;
  double height;
  double width;
  double y;
  double x;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  id v24;
  id v25;
  id v26;
  double v27;
  double v28;
  TSKAccessController *mAccessController;
  _QWORD v31[5];
  __int128 v32;
  __int128 v33;

  v7 = a7;
  var1 = a6.var1;
  var0 = a6.var0;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (self)
  {
    -[TSDTileProvider visibleTileRect](self, "visibleTileRect");
    v18 = *((_QWORD *)&v32 + 1);
    v17 = v32;
    v19 = *((_QWORD *)&v33 + 1);
    v20 = v33;
  }
  else
  {
    v19 = 0;
    v18 = 0;
    v20 = 0;
    v17 = 0;
    v32 = 0u;
    v33 = 0u;
  }
  if (v17 > var0 || var0 > v20 || v18 > var1 || var1 > v19)
    return 0;
  v25 = -[TSDTileProvider p_bucketKey](self, "p_bucketKey");
  v26 = -[TSDTileStorage contentsInRect:contentsScale:forTileAtLocation:inBucket:](self->mTileStorage, "contentsInRect:contentsScale:forTileAtLocation:inBucket:", var0, var1, v25, x, y, width, height, a4);
  v24 = v26;
  if (!v26)
  {
    objc_msgSend(MEMORY[0x24BDE57D8], "begin");
    if (a5)
    {
      objc_msgSend(a5, "setNeedsDisplay");
      v24 = a5;
    }
    else
    {
      v24 = (id)objc_msgSend(MEMORY[0x24BDE56D0], "layer");
    }
    objc_msgSend(v24, "setDelegate:", self);
    objc_msgSend(v24, "setBounds:", x, y, width, height);
    v27 = *MEMORY[0x24BDBEFB0];
    v28 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    objc_msgSend(v24, "setPosition:", *MEMORY[0x24BDBEFB0], v28);
    objc_msgSend(v24, "setAnchorPoint:", v27, v28);
    objc_msgSend(v24, "setOpaque:", -[TSDTileProvider isTargetOpaque](self, "isTargetOpaque"));
    objc_msgSend(v24, "setContentsScale:", a4);
    if (v7)
    {
      mAccessController = self->mAccessController;
      v31[0] = MEMORY[0x24BDAC760];
      v31[1] = 3221225472;
      v31[2] = __82__TSDTileProvider_contentsInRect_contentsScale_forTile_atLocation_takingReadLock___block_invoke;
      v31[3] = &unk_24D829278;
      v31[4] = v24;
      -[TSKAccessController performRead:](mAccessController, "performRead:", v31);
    }
    else
    {
      objc_msgSend(v24, "display");
    }
    objc_msgSend(v24, "setDelegate:", 0);
    objc_msgSend(MEMORY[0x24BDE57D8], "commit");
    -[TSDTileStorage storeContents:inRect:contentsScale:forTileAtLocation:inBucket:](self->mTileStorage, "storeContents:inRect:contentsScale:forTileAtLocation:inBucket:", v24, var0, var1, v25, x, y, width, height, a4);
  }
  return v24;
}

uint64_t __82__TSDTileProvider_contentsInRect_contentsScale_forTile_atLocation_takingReadLock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "display");
}

- (void)flush
{
  dispatch_barrier_sync((dispatch_queue_t)self->mQueue, &__block_literal_global_50);
}

- (void)removeStoredImages
{
  -[TSDTileStorage removeImagesInBucket:](self->mTileStorage, "removeImagesInBucket:", -[TSDTileProvider p_bucketKey](self, "p_bucketKey"));
}

- (BOOL)isTargetOpaque
{
  return 0;
}

- (BOOL)canTargetDrawInParallel
{
  return 0;
}

- (void)drawLayer:(id)a3 inContext:(CGContext *)a4
{
  void *v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGAffineTransform v12;

  v7 = (void *)MEMORY[0x219A15874](self, a2);
  if ((objc_msgSend(a3, "contentsAreFlipped") & 1) == 0)
  {
    objc_msgSend(a3, "bounds");
    TSDAffineTransformForFlips(0, 1, (uint64_t)&v12, v8, v9, v10, v11);
    CGContextConcatCTM(a4, &v12);
  }
  -[TSDTileProvider drawTargetInLayer:context:](self, "drawTargetInLayer:context:", a3, a4);
  objc_autoreleasePoolPop(v7);
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null", a3, a4);
}

- (id)p_bucketKey
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%p"), self);
}

- ($E59C7DEBCD57E98EE3F0104B12BEB13C)visibleTileRect
{
  $E59C7DEBCD57E98EE3F0104B12BEB13C *result;

  objc_copyStruct(retstr, &self->mVisibleTileRect, 32, 1, 0);
  return result;
}

- (void)setVisibleTileRect:(id *)a3
{
  objc_copyStruct(&self->mVisibleTileRect, a3, 32, 1, 0);
}

@end
