@implementation TSDBackgroundLayoutAndRenderState

- (TSDBackgroundLayoutAndRenderState)initWithDelegate:(id)a3
{
  void *v5;
  uint64_t v6;
  TSDBackgroundLayoutAndRenderState *result;
  objc_super v8;

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDBackgroundLayoutAndRenderState initWithDelegate:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 175, CFSTR("This operation must only be performed on the main thread."));
  }
  v8.receiver = self;
  v8.super_class = (Class)TSDBackgroundLayoutAndRenderState;
  result = -[TSDBackgroundLayoutAndRenderState init](&v8, sel_init);
  if (result)
    result->mDelegate = (TSDBackgroundLayoutAndRenderStateDelegate *)a3;
  return result;
}

- (void)clearDelegate
{
  self->mDelegate = 0;
}

- (void)setNeedsLayoutAndRender
{
  void *v3;
  uint64_t v4;

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDBackgroundLayoutAndRenderState setNeedsLayoutAndRender]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 191, CFSTR("This operation must only be performed on the main thread."));
  }
  objc_sync_enter(self);
  if (!self->mNeedsLayoutAndRender)
  {
    self->mNeedsLayoutAndRender = 1;
    -[TSDBackgroundLayoutAndRenderState setNeedsLayoutForTilingLayers](self, "setNeedsLayoutForTilingLayers");
  }
  objc_sync_exit(self);
}

- (void)setNeedsLayoutForTilingLayers
{
  void *v3;
  uint64_t v4;
  _QWORD v5[5];

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDBackgroundLayoutAndRenderState setNeedsLayoutForTilingLayers]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInteractiveCanvasController.m"), 203, CFSTR("This operation must only be performed on the main thread."));
  }
  objc_sync_enter(self);
  if (self->mNeedsLayoutForTilingLayers)
  {
    objc_sync_exit(self);
  }
  else
  {
    self->mNeedsLayoutForTilingLayers = 1;
    objc_sync_exit(self);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __66__TSDBackgroundLayoutAndRenderState_setNeedsLayoutForTilingLayers__block_invoke;
    v5[3] = &unk_24D829278;
    v5[4] = self;
    if (-[TSDBackgroundLayoutAndRenderStateDelegate backgroundLayoutAndRenderState:shouldDispatchBackgroundWork:](self->mDelegate, "backgroundLayoutAndRenderState:shouldDispatchBackgroundWork:", self, v5))-[TSKThreadDispatcher dispatch:](+[TSKThreadDispatcher sharedInstance](TSKThreadDispatcher, "sharedInstance"), "dispatch:", v5);
  }
}

uint64_t __66__TSDBackgroundLayoutAndRenderState_setNeedsLayoutForTilingLayers__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _BOOL8 v4;

  v2 = *(void **)(a1 + 32);
  objc_sync_enter(v2);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_BYTE *)(v3 + 16) == 0;
  *(_BYTE *)(v3 + 16) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 17) = 0;
  objc_sync_exit(v2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "backgroundLayoutAndRenderState:performWorkInBackgroundTilingOnly:", *(_QWORD *)(a1 + 32), v4);
  return objc_msgSend(*(id *)(a1 + 32), "performSelectorOnMainThread:withObject:waitUntilDone:", sel_p_didBackgroundLayoutAndRender, 0, 0);
}

- (void)p_didBackgroundLayoutAndRender
{
  -[TSDBackgroundLayoutAndRenderStateDelegate backgroundLayoutAndRenderStateDidPerformBackgroundWork:](self->mDelegate, "backgroundLayoutAndRenderStateDidPerformBackgroundWork:", self);
}

@end
