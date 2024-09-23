@implementation ZN2md14HardwareScaler8instanceENS

unsigned int *___ZN2md14HardwareScaler8instanceENS_23HardwareScalerOperationENS_24HardwareScalerFilterTypeE_block_invoke_2(uint64_t a1)
{
  unsigned int *v2;
  unsigned int *result;

  v2 = (unsigned int *)operator new();
  result = md::HardwareScaler::HardwareScaler(v2, *(_DWORD *)(a1 + 32), *(_DWORD *)(a1 + 36));
  md::HardwareScaler::instance(md::HardwareScalerOperation,md::HardwareScalerFilterType)::scaler = (uint64_t)v2;
  return result;
}

unsigned int *___ZN2md14HardwareScaler8instanceENS_23HardwareScalerOperationENS_24HardwareScalerFilterTypeE_block_invoke_3(uint64_t a1)
{
  unsigned int *v2;
  unsigned int *result;

  v2 = (unsigned int *)operator new();
  result = md::HardwareScaler::HardwareScaler(v2, *(_DWORD *)(a1 + 32), *(_DWORD *)(a1 + 36));
  md::HardwareScaler::instance(md::HardwareScalerOperation,md::HardwareScalerFilterType)::scaler = (uint64_t)v2;
  return result;
}

int *___ZN2md14HardwareScaler8instanceENS_23HardwareScalerOperationENS_24HardwareScalerFilterTypeE_block_invoke()
{
  int *result;
  int *v1;

  result = (int *)dlopen((const char *)objc_msgSend(CFSTR("/System/Library/Frameworks/IOKit.framework/IOKit"), "fileSystemRepresentation"), 4);
  if (result)
  {
    v1 = result;
    result = (int *)dlsym(v1, "kIOMasterPortDefault");
  }
  return result;
}

@end
