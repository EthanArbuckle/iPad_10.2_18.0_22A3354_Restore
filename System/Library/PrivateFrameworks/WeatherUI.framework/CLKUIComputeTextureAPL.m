@implementation CLKUIComputeTextureAPL

double __CLKUIComputeTextureAPL_block_invoke(uint64_t a1)
{
  return CLKUIGetAPLFromSumBuffer(*(void **)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "width"), objc_msgSend(*(id *)(a1 + 40), "height"));
}

@end
