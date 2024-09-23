@implementation UIOldCGImageDecompressor

void __89___UIOldCGImageDecompressor_initWithData_immediateLoadWithMaxSize_renderingIntent_cache___block_invoke_2(uint64_t a1)
{
  -[_UIOldCGImageDecompressor _decompressEagerly:](*(_QWORD *)(a1 + 32), 1);
}

void __89___UIOldCGImageDecompressor_initWithData_immediateLoadWithMaxSize_renderingIntent_cache___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.UIKit.UIOldCGImageDecompressor queue", 0);
  v1 = (void *)_MergedGlobals_3_26;
  _MergedGlobals_3_26 = (uint64_t)v0;

}

intptr_t __48___UIOldCGImageDecompressor__decompressEagerly___block_invoke_3(uint64_t a1, int a2, int a3, int a4, CGImageRef image)
{
  uint64_t v7;
  CGImageRef v8;

  if ((a4 + 16075) <= 3 && a4 != -16074)
  {
    v7 = a1 + 32;
LABEL_8:
    *(_BYTE *)(*(_QWORD *)v7 + 64) |= 0x10u;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
  if (!a4)
  {
    v8 = CGImageRetain(image);
    v7 = a1 + 32;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = v8;
    goto LABEL_8;
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t __48___UIOldCGImageDecompressor__decompressEagerly___block_invoke_2()
{
  uint64_t result;

  result = CMPhotoJPEGDecodeSessionCreate();
  atomic_store(0, &jpegDecodeSessionRef);
  return result;
}

void __48___UIOldCGImageDecompressor__decompressEagerly___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[_UIOldCGImageDecompressor _waitForMetadata]((uint64_t)WeakRetained);

}

@end
