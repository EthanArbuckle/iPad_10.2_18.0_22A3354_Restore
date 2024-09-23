@implementation PUICreateIOSurfaceForImage

uint64_t __PUICreateIOSurfaceForImage_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawAtPoint:", *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
}

@end
