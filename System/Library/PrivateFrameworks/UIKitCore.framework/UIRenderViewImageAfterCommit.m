@implementation UIRenderViewImageAfterCommit

uint64_t ___UIRenderViewImageAfterCommit_block_invoke_71(uint64_t a1)
{
  __IOSurface *v2;
  __IOSurface *v3;
  uint64_t CGImage;
  CGImage *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v2 = _UIRenderView(*(void **)(a1 + 32), *(void **)(a1 + 40), &__block_literal_global_453);
  if (v2)
  {
    v3 = v2;
    CGImage = _UIRenderingBufferCreateCGImage(v2, *(void **)(a1 + 40));
    if (CGImage)
    {
      v5 = (CGImage *)CGImage;
      +[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", CGImage, 0, _UIRenderingBufferGetScale(v3));
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

      CGImageRelease(v5);
    }
    CFRelease(v3);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

@end
