@implementation UIKBGetFlickDirection

uint64_t __UIKBGetFlickDirection_block_invoke(uint64_t a1, uint64_t a2, double a3)
{
  if (*(double *)(a1 + 32) >= a3)
    return a2;
  else
    return -3;
}

@end
