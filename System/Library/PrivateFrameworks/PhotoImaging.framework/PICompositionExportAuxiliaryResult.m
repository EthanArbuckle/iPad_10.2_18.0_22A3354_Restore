@implementation PICompositionExportAuxiliaryResult

- (NSData)companionImageData
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCompanionImageData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSURL)companionVideoURL
{
  return (NSURL *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCompanionVideoURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSDictionary)auxiliaryImages
{
  return (NSDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setAuxiliaryImages:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (BOOL)canPropagateOriginalAuxiliaryData
{
  return self->_canPropagateOriginalAuxiliaryData;
}

- (void)setCanPropagateOriginalAuxiliaryData:(BOOL)a3
{
  self->_canPropagateOriginalAuxiliaryData = a3;
}

- (NUImageProperties)properties
{
  return (NUImageProperties *)objc_getProperty(self, a2, 80, 1);
}

- (void)setProperties:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_auxiliaryImages, 0);
  objc_storeStrong((id *)&self->_companionVideoURL, 0);
  objc_storeStrong((id *)&self->_companionImageData, 0);
}

@end
