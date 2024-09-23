@implementation PXBoopPhotosFileProviderRegisterConfiguration

uint64_t ___PXBoopPhotosFileProviderRegisterConfiguration_block_invoke()
{
  PXPhotosFileProviderRegisterConfiguration *v0;
  void *v1;

  v0 = -[PXPhotosFileProviderRegisterConfiguration initWithUsage:]([PXPhotosFileProviderRegisterConfiguration alloc], "initWithUsage:", 2);
  v1 = (void *)_PXBoopPhotosFileProviderRegisterConfiguration_configuration;
  _PXBoopPhotosFileProviderRegisterConfiguration_configuration = (uint64_t)v0;

  return objc_msgSend((id)_PXBoopPhotosFileProviderRegisterConfiguration_configuration, "setClientEncodingPolicy:", 1);
}

@end
