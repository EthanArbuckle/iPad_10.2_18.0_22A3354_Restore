@implementation PTRow

uint64_t __36__PTRow_PhotosPlayer__is_increment___block_invoke(uint64_t a1, void *a2)
{
  double v3;

  objc_msgSend(a2, "doubleValue");
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32) * round(v3 / *(double *)(a1 + 32)));
}

@end
