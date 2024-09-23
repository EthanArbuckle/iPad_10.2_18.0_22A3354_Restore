@implementation NSNumber(_PASAdditions)

- (float)_pas_intBackedFloatValue
{
  float result;

  LODWORD(result) = objc_msgSend(a1, "unsignedIntegerValue");
  return result;
}

+ (uint64_t)_pas_intBackedFloatNumber:()_PASAdditions
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", LODWORD(a1));
}

@end
