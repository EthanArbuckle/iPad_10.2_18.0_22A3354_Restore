@implementation SABinaryCreateLoadInfoArrayFromDyldImageInfos

uint64_t ___SABinaryCreateLoadInfoArrayFromDyldImageInfos_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "loadAddress");
  if (v6 >= objc_msgSend(v5, "loadAddress"))
  {
    v8 = objc_msgSend(v4, "loadAddress");
    v7 = v8 > objc_msgSend(v5, "loadAddress");
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

@end
