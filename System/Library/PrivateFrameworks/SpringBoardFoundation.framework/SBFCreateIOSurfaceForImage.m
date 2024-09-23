@implementation SBFCreateIOSurfaceForImage

uint64_t __SBFCreateIOSurfaceForImage_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawAtPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
}

@end
