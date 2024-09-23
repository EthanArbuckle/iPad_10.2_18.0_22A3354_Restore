@implementation VKMUIStringForVKRange

void __VKMUIStringForVKRange_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = objc_msgSend(a2, "rangeValue");
  VKMUIStringForRange(v3, v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:", v5);

}

@end
