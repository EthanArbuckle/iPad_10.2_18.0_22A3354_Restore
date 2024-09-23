@implementation TVTintedImageDecorator

uint64_t __51___TVTintedImageDecorator_drawInContext_imageRect___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = objc_msgSend(a2, "doubleValue");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8 * a3) = v6;
  return result;
}

@end
