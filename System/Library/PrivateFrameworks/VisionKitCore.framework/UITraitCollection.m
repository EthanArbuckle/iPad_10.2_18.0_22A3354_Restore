@implementation UITraitCollection

uint64_t __59__UITraitCollection_VK__vk_traitCollectionWithContentSize___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPreferredContentSizeCategory:", *(_QWORD *)(a1 + 32));
}

uint64_t __55__UITraitCollection_Utilities__appearanceClassForType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDisplayScale:", *(double *)(a1 + 32));
}

uint64_t __79__UITraitCollection_VK__vk_traitCollectionClampedToNonaccessibilityContentSize__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPreferredContentSizeCategory:", *MEMORY[0x1E0CEB400]);
}

@end
