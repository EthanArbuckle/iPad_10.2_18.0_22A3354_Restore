@implementation PFVideoComplementMetadataRecord

- (BOOL)hasValidPairingIdentifier
{
  return self->_pairingIdentifier != 0;
}

- (BOOL)hasValidVideoDuration
{
  return (self->_videoDuration.flags & 0x1D) == 1;
}

- (BOOL)hasValidImageDisplayTime
{
  return (self->_imageDisplayTime.flags & 0x1D) == 1;
}

- (NSString)pairingIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPairingIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)videoDuration
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_videoDuration, 24, 1, 0);
  return result;
}

- (void)setVideoDuration:(id *)a3
{
  objc_copyStruct(&self->_videoDuration, a3, 24, 1, 0);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)imageDisplayTime
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  objc_copyStruct(retstr, &self->_imageDisplayTime, 24, 1, 0);
  return result;
}

- (void)setImageDisplayTime:(id *)a3
{
  objc_copyStruct(&self->_imageDisplayTime, a3, 24, 1, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairingIdentifier, 0);
}

@end
