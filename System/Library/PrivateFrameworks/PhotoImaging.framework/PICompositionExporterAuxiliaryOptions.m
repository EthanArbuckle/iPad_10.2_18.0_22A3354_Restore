@implementation PICompositionExporterAuxiliaryOptions

- (PICompositionExporterAuxiliaryOptions)init
{
  PICompositionExporterAuxiliaryOptions *v2;
  uint64_t v3;
  NSArray *auxiliaryImageTypes;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PICompositionExporterAuxiliaryOptions;
  v2 = -[PICompositionExporterOptions init](&v6, sel_init);
  objc_msgSend(MEMORY[0x1E0D52160], "defaultAuxiliaryImageTypes");
  v3 = objc_claimAutoreleasedReturnValue();
  auxiliaryImageTypes = v2->_auxiliaryImageTypes;
  v2->_auxiliaryImageTypes = (NSArray *)v3;

  return v2;
}

- (NSURL)primaryURL
{
  return (NSURL *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPrimaryURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSURL)videoComplementURL
{
  return (NSURL *)objc_getProperty(self, a2, 56, 1);
}

- (void)setVideoComplementURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSURL)videoPosterFrameURL
{
  return (NSURL *)objc_getProperty(self, a2, 64, 1);
}

- (void)setVideoPosterFrameURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSString)videoCodecType
{
  return self->_videoCodecType;
}

- (void)setVideoCodecType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NUImageExportFormat)imageExportFormat
{
  return (NUImageExportFormat *)objc_getProperty(self, a2, 80, 1);
}

- (void)setImageExportFormat:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (BOOL)applyImageOrientationAsMetadata
{
  return self->_applyImageOrientationAsMetadata;
}

- (void)setApplyImageOrientationAsMetadata:(BOOL)a3
{
  self->_applyImageOrientationAsMetadata = a3;
}

- (BOOL)applyVideoOrientationAsMetadata
{
  return self->_applyVideoOrientationAsMetadata;
}

- (void)setApplyVideoOrientationAsMetadata:(BOOL)a3
{
  self->_applyVideoOrientationAsMetadata = a3;
}

- (BOOL)optimizeForBackgroundProcessing
{
  return self->_optimizeForBackgroundProcessing;
}

- (void)setOptimizeForBackgroundProcessing:(BOOL)a3
{
  self->_optimizeForBackgroundProcessing = a3;
}

- (NSArray)auxiliaryImageTypes
{
  return self->_auxiliaryImageTypes;
}

- (void)setAuxiliaryImageTypes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auxiliaryImageTypes, 0);
  objc_storeStrong((id *)&self->_imageExportFormat, 0);
  objc_storeStrong((id *)&self->_videoCodecType, 0);
  objc_storeStrong((id *)&self->_videoPosterFrameURL, 0);
  objc_storeStrong((id *)&self->_videoComplementURL, 0);
  objc_storeStrong((id *)&self->_primaryURL, 0);
}

@end
