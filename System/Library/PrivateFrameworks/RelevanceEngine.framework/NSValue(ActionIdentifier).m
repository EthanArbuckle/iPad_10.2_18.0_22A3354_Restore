@implementation NSValue(ActionIdentifier)

- (uint64_t)re_actionIdentifierHashValue
{
  id v1;
  char *v2;
  NSUInteger v3;
  NSUInteger sizep[2];

  sizep[1] = *MEMORY[0x24BDAC8D0];
  sizep[0] = 0;
  v1 = objc_retainAutorelease(a1);
  NSGetSizeAndAlignment((const char *)objc_msgSend(v1, "objCType"), sizep, 0);
  v2 = (char *)sizep - ((sizep[0] + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sizep[0];
  bzero(v2, sizep[0]);
  objc_msgSend(v1, "getValue:size:", v2, v3);
  return REHashDataUInt64((uint64_t)v2, sizep[0]);
}

@end
