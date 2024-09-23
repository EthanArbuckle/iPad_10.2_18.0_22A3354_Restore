@implementation PASGetNameCharacterSet

void ___PASGetNameCharacterSet_block_invoke()
{
  const __CFCharacterSet *Predefined;
  __CFCharacterSet *MutableCopy;
  __CFCharacterSet *v2;
  CFRange v3;
  CFRange v4;
  CFRange v5;

  Predefined = CFCharacterSetGetPredefined(kCFCharacterSetAlphaNumeric);
  MutableCopy = CFCharacterSetCreateMutableCopy(0, Predefined);
  if (!MutableCopy)
    __assert_rtn("_PASGetNameCharacterSet_block_invoke", "_PASStringUtil.m", 264, "cs");
  v2 = MutableCopy;
  v3.location = 39;
  v3.length = 1;
  CFCharacterSetAddCharactersInRange(MutableCopy, v3);
  v4.location = 8217;
  v4.length = 1;
  CFCharacterSetAddCharactersInRange(v2, v4);
  v5.location = 45;
  v5.length = 1;
  CFCharacterSetAddCharactersInRange(v2, v5);
  _PASGetNameCharacterSet_charset = (uint64_t)CFCharacterSetCreateCopy(0, v2);
  CFRelease(v2);
}

@end
