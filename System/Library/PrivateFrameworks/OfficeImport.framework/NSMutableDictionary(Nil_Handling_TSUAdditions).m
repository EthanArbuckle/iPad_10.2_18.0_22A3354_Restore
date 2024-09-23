@implementation NSMutableDictionary(Nil_Handling_TSUAdditions)

- (uint64_t)tsu_setNonNilValueForKey:()Nil_Handling_TSUAdditions fromDictionary:
{
  uint64_t result;

  result = objc_msgSend(a4, "objectForKeyedSubscript:");
  if (result)
    return objc_msgSend(a1, "setObject:forKeyedSubscript:", result, a3);
  return result;
}

- (void)tsu_setNonNilObject:()Nil_Handling_TSUAdditions forKey:
{
  if (a3)
    return (void *)objc_msgSend(a1, "setObject:forKeyedSubscript:");
  return a1;
}

@end
