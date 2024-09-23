@implementation ImageOfSizeAndColor

void __ImageOfSizeAndColor_block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  CGContextSetFillColorWithColor((CGContextRef)objc_msgSend(v3, "CGContext"), (CGColorRef)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "CGColor"));
  objc_msgSend(v3, "fillRect:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));

}

@end
