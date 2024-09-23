@implementation NSString(PVAdditions)

- (uint64_t)pv_isRightToLeft
{
  void *v1;
  uint64_t v2;

  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", a1);
  v2 = objc_msgSend(v1, "pv_isRightToLeft");

  return v2;
}

@end
