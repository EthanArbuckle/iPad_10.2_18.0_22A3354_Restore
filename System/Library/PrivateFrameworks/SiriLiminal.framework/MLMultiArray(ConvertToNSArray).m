@implementation MLMultiArray(ConvertToNSArray)

- (id)convert1dMLMultiArrayToNSArray
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t i;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "shape");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntegerValue");

  if (v5)
  {
    for (i = 0; i != v5; ++i)
    {
      objc_msgSend(a1, "objectAtIndexedSubscript:", i);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v7);

    }
  }
  return v2;
}

@end
