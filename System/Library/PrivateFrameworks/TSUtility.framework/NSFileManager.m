@implementation NSFileManager

uint64_t __110__NSFileManager_SFUtilityAdditions___changeFileProtectionAtURL_fromProtection_toProtection_recursively_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;

  v3 = (void *)objc_msgSend(a2, "objectForKey:", *MEMORY[0x24BDD0CF0]);
  if ((objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32)) & 1) != 0)
    return 0;
  if (*(_QWORD *)(a1 + 40))
    return objc_msgSend(v3, "isEqualToString:");
  return 1;
}

uint64_t __80__NSFileManager_SFUtilityAdditions__hasAtLeastFileProtection_atURL_recursively___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fileProtection:isGreaterThan:", *(_QWORD *)(a1 + 40), a2) ^ 1;
}

uint64_t __79__NSFileManager_SFUtilityAdditions__hasAtMostFileProtection_atURL_recursively___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fileProtection:isGreaterThan:", a2, *(_QWORD *)(a1 + 40)) ^ 1;
}

@end
