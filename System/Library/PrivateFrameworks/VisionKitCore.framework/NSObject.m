@implementation NSObject

void __67__NSObject_VKLoggable__vk_loggingDescriptionFromLoggable_isPretty___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  if (*(_BYTE *)(a1 + 48)
    && (v6 = objc_opt_class(), VKDynamicCast(v6, (uint64_t)v5), (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v8 = v7;
    v9 = *(void **)(a1 + 32);
    objc_msgSend(v7, "vk_prettyDescriptionWithTabLevel:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "appendFormat:", CFSTR("\t%@ = %@\n"), v11, v10);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", *(_QWORD *)(a1 + 40), v11, v5);
  }

}

@end
