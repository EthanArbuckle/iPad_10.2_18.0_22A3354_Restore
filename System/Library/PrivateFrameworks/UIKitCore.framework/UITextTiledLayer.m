@implementation UITextTiledLayer

void __65___UITextTiledLayer__preparedTileForFrame_mask_opacity_deferred___block_invoke(uint64_t a1, void *a2)
{
  unsigned __int8 *v2;
  uint64_t v3;
  __CFRunLoop *Current;
  const void *v5;
  unsigned __int8 *v6;
  _QWORD v7[4];
  unsigned __int8 *v8;
  uint64_t v9;

  v2 = a2;
  v3 = _UIQOSProcessingBegin("UITextTiledLayerDefer", 0, 0, 0);
  atomic_store(1u, v2 + 40);
  Current = CFRunLoopGetCurrent();
  v5 = (const void *)*MEMORY[0x1E0C9B270];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65___UITextTiledLayer__preparedTileForFrame_mask_opacity_deferred___block_invoke_2;
  v7[3] = &unk_1E16B1888;
  v8 = v2;
  v9 = v3;
  v6 = v2;
  CFRunLoopPerformBlock(Current, v5, v7);
  CFRunLoopWakeUp(Current);

}

void __65___UITextTiledLayer__preparedTileForFrame_mask_opacity_deferred___block_invoke_2(uint64_t a1)
{
  unsigned __int8 v1;

  v1 = atomic_load((unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 40));
  if ((v1 & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "setNeedsDisplay");
  _UIQOSProcessingEnd();
}

uint64_t __65___UITextTiledLayer__preparedTileForFrame_mask_opacity_deferred___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setNeedsDisplay");
}

@end
