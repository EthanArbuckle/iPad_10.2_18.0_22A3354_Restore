@implementation TIAssetManagerMock

- (void)requestAssetDownloadForLanguage:(id)a3 completion:(id)a4
{
  if (a4)
    (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

- (id)enabledInputModes
{
  return 0;
}

- (id)ddsAssetContentItemsWithContentType:(id)a3 inputMode:(id)a4 filteredWithRegion:(BOOL)a5
{
  return (id)MEMORY[0x24BDBD1A8];
}

- (void)ddsAssetContentItemsWithContentType:(id)a3 inputMode:(id)a4 filteredWithRegion:(BOOL)a5 completion:(id)a6
{
  if (a6)
    (*((void (**)(id, _QWORD))a6 + 2))(a6, MEMORY[0x24BDBD1A8]);
}

- (void)ddsAssetsForInputMode:(id)a3 cachedOnly:(BOOL)a4 completion:(id)a5
{
  if (a5)
    (*((void (**)(id, _QWORD))a5 + 2))(a5, MEMORY[0x24BDBD1A8]);
}

- (id)topActiveRegions
{
  return (id)MEMORY[0x24BDBD1A8];
}

- (id)enabledInputModeIdentifiersProviderBlock
{
  return self->enabledInputModeIdentifiersProviderBlock;
}

- (void)setEnabledInputModeIdentifiersProviderBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)preferencesProviderBlock
{
  return self->preferencesProviderBlock;
}

- (void)setPreferencesProviderBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->preferencesProviderBlock, 0);
  objc_storeStrong(&self->enabledInputModeIdentifiersProviderBlock, 0);
}

@end
