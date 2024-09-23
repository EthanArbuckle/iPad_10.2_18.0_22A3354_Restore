@implementation PKUIPeerPaymentTopUpIconImage

uint64_t __PKUIPeerPaymentTopUpIconImage_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  CGContext *v4;
  id v5;

  v3 = a2;
  v4 = (CGContext *)objc_msgSend(v3, "CGContext");
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(v4, (CGColorRef)objc_msgSend(v5, "CGColor"));

  objc_msgSend(v3, "fillRect:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:withAttributes:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
}

@end
