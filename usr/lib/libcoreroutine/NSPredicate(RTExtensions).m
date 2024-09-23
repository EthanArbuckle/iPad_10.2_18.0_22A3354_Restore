@implementation NSPredicate(RTExtensions)

+ (uint64_t)truePredicate
{
  return objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("TRUEPREDICATE"));
}

+ (uint64_t)falsePredicate
{
  return objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("FALSEPREDICATE"));
}

@end
