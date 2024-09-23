@implementation TSUColor(TSDMixingAdditions)

- (uint64_t)mixingTypeWithObject:()TSDMixingAdditions
{
  objc_opt_class();
  if (objc_msgSend(a1, "isEqual:", TSUCheckedDynamicCast()))
    return 5;
  else
    return 4;
}

- (uint64_t)mixedObjectWithFraction:()TSDMixingAdditions ofObject:
{
  objc_opt_class();
  return objc_msgSend(a1, "blendedColorWithFraction:ofColor:", TSUCheckedDynamicCast(), a2);
}

@end
