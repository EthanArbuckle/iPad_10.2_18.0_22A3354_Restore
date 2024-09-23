@implementation NSArray(WAAccessibility)

+ (id)waaxArrayByIgnoringNilElementsWithCount:()WAAccessibility
{
  uint64_t v9;
  void *v10;
  uint64_t *v11;
  void *v12;
  uint64_t *i;

  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", a3);
  for (i = &a9; v9; --v9)
  {
    v11 = i++;
    if (*v11)
      objc_msgSend(v10, "addObject:");
  }
  v12 = (void *)objc_msgSend(v10, "copy");

  return v12;
}

@end
