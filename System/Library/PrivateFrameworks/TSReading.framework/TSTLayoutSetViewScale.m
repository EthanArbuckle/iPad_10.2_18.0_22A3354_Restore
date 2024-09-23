@implementation TSTLayoutSetViewScale

uint64_t __TSTLayoutSetViewScale_block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "setViewScale:", *(double *)(a1 + 32));
  return 0;
}

@end
