@implementation NSObject(PLValue)

- (int64_t)plCompare:()PLValue
{
  return +[PLValueUtilties compare:with:](PLValueUtilties, "compare:with:", a1, a3);
}

- (BOOL)isNil
{
  return +[PLValueUtilties isNil:](PLValueUtilties, "isNil:", a1);
}

@end
