@implementation PLPTPLegacyConversionSupport

- (PLPTPLegacyConversionSupport)init
{
  PLPTPLegacyConversionSupport *v2;
  uint64_t v3;
  PHMediaFormatConversionManager *mediaFormatConversionManager;
  uint64_t v5;
  PFMediaCapabilities *peerMediaCapabilities;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PLPTPLegacyConversionSupport;
  v2 = -[PLPTPLegacyConversionSupport init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    mediaFormatConversionManager = v2->_mediaFormatConversionManager;
    v2->_mediaFormatConversionManager = (PHMediaFormatConversionManager *)v3;

    objc_msgSend(MEMORY[0x1E0D75128], "legacyCapabilities");
    v5 = objc_claimAutoreleasedReturnValue();
    peerMediaCapabilities = v2->_peerMediaCapabilities;
    v2->_peerMediaCapabilities = (PFMediaCapabilities *)v5;

  }
  return v2;
}

- (BOOL)penultimateIsPublic
{
  return 0;
}

- (BOOL)peerSupportsTranscodeChoice
{
  return -[PFMediaCapabilities supportsTranscodeChoice](self->_peerMediaCapabilities, "supportsTranscodeChoice");
}

- (id)conversionResultForAsset:(id)a3 sourceHints:(id)a4 forceLegacyConversion:(BOOL)a5 assetTypeLabel:(id)a6
{
  return +[PLPTPConversionHelper conversionResultForAsset:sourceHints:withConversionManager:peerCapabilities:](PLPTPConversionHelper, "conversionResultForAsset:sourceHints:withConversionManager:peerCapabilities:", a3, a4, self->_mediaFormatConversionManager, self->_peerMediaCapabilities);
}

- (BOOL)peerSupportsAdjustmentBaseResources
{
  return -[PFMediaCapabilities supportForAdjustmentBaseResources](self->_peerMediaCapabilities, "supportForAdjustmentBaseResources") == 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerMediaCapabilities, 0);
  objc_storeStrong((id *)&self->_mediaFormatConversionManager, 0);
}

@end
