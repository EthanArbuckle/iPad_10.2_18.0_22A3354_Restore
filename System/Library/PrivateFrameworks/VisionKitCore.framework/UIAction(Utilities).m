@implementation UIAction(Utilities)

+ (uint64_t)vk_itemWithTitle:()Utilities
{
  return objc_msgSend(a1, "vk_itemWithTitle:subtitle:", a3, 0);
}

+ (id)vk_itemWithTitle:()Utilities subtitle:
{
  __CFString *v5;
  __CFString *v6;
  id v7;
  void *v8;

  v5 = &stru_1E94661A8;
  if (a3)
    v5 = a3;
  v6 = v5;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CEA2A8], "actionWithTitle:image:identifier:handler:", v6, 0, 0, &__block_literal_global_19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setDiscoverabilityTitle:", v7);
  return v8;
}

@end
