@implementation UIDragPreviewBlockProvider

void __52___UIDragPreviewBlockProvider__createImageComponent__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;

  v3 = a2;
  CGContextTranslateCTM((CGContextRef)objc_msgSend(v3, "CGContext"), -*(double *)(a1 + 40), -*(double *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "layer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "CGContext");

  objc_msgSend(v5, "renderInContext:", v4);
}

@end
