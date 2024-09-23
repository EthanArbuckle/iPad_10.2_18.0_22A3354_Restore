@implementation PKEditPassesResizedPlaceholderImage

uint64_t __PKEditPassesResizedPlaceholderImage_block_invoke(uint64_t a1, void *a2)
{
  CGContext *v3;

  v3 = (CGContext *)objc_msgSend(a2, "CGContext");
  CGContextScaleCTM(v3, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 40));
  CGContextSetInterpolationQuality(v3, kCGInterpolationHigh);
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:inContext:", v3, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), *(double *)(a1 + 48), *(double *)(a1 + 56));
}

uint64_t __PKEditPassesResizedPlaceholderImage_block_invoke_2(uint64_t a1, void *a2)
{
  CGContextSetInterpolationQuality((CGContextRef)objc_msgSend(a2, "CGContext"), kCGInterpolationHigh);
  return objc_msgSend(*(id *)(a1 + 32), "drawInRect:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), *(double *)(a1 + 40), *(double *)(a1 + 48));
}

@end
