@implementation NSObject(_TVMonogramLoader)

- (uint64_t)tv_generatorType
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, sel_tv_generatorType);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "unsignedIntegerValue");

  return v2;
}

- (void)tv_setGeneratorType:()_TVMonogramLoader
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, sel_tv_generatorType, v2, (void *)1);

}

@end
