@implementation TSDCGContextSetBitmapQualityInfo

uint64_t __TSDCGContextSetBitmapQualityInfo_block_invoke(uint64_t a1, void *a2)
{
  void *v4;

  objc_opt_class();
  objc_msgSend(a2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v4 = (void *)TSUDynamicCast();
  if (!v4)
    v4 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 1);
  objc_msgSend(v4, "setValue:forKey:", *(_QWORD *)(a1 + 32), CFSTR("TSDCGContextInfoDictionaryKeyBitmapQualityInfo"));
  return objc_msgSend(a2, "setObject:forKey:", v4, *(_QWORD *)(a1 + 40));
}

@end
