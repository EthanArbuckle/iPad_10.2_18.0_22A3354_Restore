@implementation PRAllNumberingSystems

uint64_t __PRAllNumberingSystems_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  PRNumberingSystemDisplayNameForType(objc_msgSend(a2, "integerValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "integerValue");

  PRNumberingSystemDisplayNameForType(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "localizedCompare:", v7);

  return v8;
}

@end
