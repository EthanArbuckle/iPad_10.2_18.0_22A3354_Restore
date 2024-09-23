@implementation UIView

void __71__UIView_PLScrollViewDelegateAdditions__pl_isScrollViewDelegateMethod___block_invoke()
{
  id v0;
  objc_method_description *v1;
  objc_method_description *v2;
  unsigned int v3;
  unsigned int v4;
  objc_method_description *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  unsigned int outCount;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  outCount = 0;
  v1 = protocol_copyMethodDescriptionList((Protocol *)&unk_1EFC6A978, 1, 1, &outCount);
  v8 = 0;
  v2 = protocol_copyMethodDescriptionList((Protocol *)&unk_1EFC6A978, 0, 1, &v8);
  v3 = outCount;
  if (v8 + outCount)
  {
    v4 = 0;
    do
    {
      if (v4 >= v3)
      {
        v5 = v2;
      }
      else
      {
        v3 = 0;
        v5 = v1;
      }
      NSStringFromSelector(v5[v4 - v3].name);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v0, "addObject:", v6);

      ++v4;
      v3 = outCount;
    }
    while (v4 < v8 + outCount);
  }
  free(v1);
  free(v2);
  v7 = (void *)pl_isScrollViewDelegateMethod____scrollViewDelegateSelectors;
  pl_isScrollViewDelegateMethod____scrollViewDelegateSelectors = (uint64_t)v0;

}

@end
