@implementation NSMutableString(PhotosUIFoundation)

- (BOOL)px_removePrefix:()PhotosUIFoundation
{
  uint64_t v4;
  uint64_t v5;

  v5 = objc_msgSend(a1, "rangeOfString:options:", a3, 8);
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(a1, "deleteCharactersInRange:", v5, v4);
  return v5 != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)px_removeSuffix:()PhotosUIFoundation
{
  uint64_t v4;
  uint64_t v5;

  v5 = objc_msgSend(a1, "rangeOfString:options:", a3, 12);
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(a1, "deleteCharactersInRange:", v5, v4);
  return v5 != 0x7FFFFFFFFFFFFFFFLL;
}

@end
