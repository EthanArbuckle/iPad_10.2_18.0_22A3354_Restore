@implementation PLValidatedSavedAssetTypeForEnabledTypesExecuteBlock

uint64_t __PLValidatedSavedAssetTypeForEnabledTypesExecuteBlock_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = PLValidatedSavedAssetTypeApplies(*(unsigned __int16 *)(a1 + 40), a2);
  if ((_DWORD)result)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return result;
}

@end
