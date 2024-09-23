@implementation NSDictionary(TSUAdditions)

- (uint64_t)tsu_BOOLValueForKey:()TSUAdditions
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(a1, "objectForKey:");
  if (v1 && (v2 = (void *)v1, (objc_opt_respondsToSelector() & 1) != 0))
    return objc_msgSend(v2, "BOOLValue");
  else
    return 0;
}

- (uint64_t)tsu_objectOfClass:()TSUAdditions forKey:
{
  uint64_t result;

  result = objc_msgSend(a1, "objectForKey:", a4);
  if (result)
    return TSUDynamicCast(a3, result);
  return result;
}

+ (uint64_t)tsu_dictionaryByInvertingDictionary:()TSUAdditions
{
  return objc_msgSend(MEMORY[0x24BDBCED8], "tsu_dictionaryByInvertingDictionary:");
}

@end
