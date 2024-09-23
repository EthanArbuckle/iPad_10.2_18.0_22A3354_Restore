@implementation UIImageMultiVectorGlyphContent

uint64_t __42___UIImageMultiVectorGlyphContent_CGImage__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;

  v3 = objc_msgSend(a2, "CGContext");
  objc_msgSend(*(id *)(a1 + 32), "_prepareForDrawingWithSize:scale:inContext:", v3, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
  return objc_msgSend(*(id *)(a1 + 32), "_drawWithSize:scale:inContext:effect:", v3, 0, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
}

@end
