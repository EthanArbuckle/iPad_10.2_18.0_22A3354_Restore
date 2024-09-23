@implementation BCAnnotationSyncManagerGlobalAnnotationUpdate

- (NSString)assetID
{
  return self->_assetID;
}

- (void)setAssetID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)readingPositionCFIString
{
  return self->_readingPositionCFIString;
}

- (void)setReadingPositionCFIString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)readingPositionPhysicalPageNumber
{
  return self->_readingPositionPhysicalPageNumber;
}

- (void)setReadingPositionPhysicalPageNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)readingPositionAnnotationVersion
{
  return self->_readingPositionAnnotationVersion;
}

- (void)setReadingPositionAnnotationVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)readingPositionAssetVersion
{
  return self->_readingPositionAssetVersion;
}

- (void)setReadingPositionAssetVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (float)readingProgress
{
  return self->_readingProgress;
}

- (void)setReadingProgress:(float)a3
{
  self->_readingProgress = a3;
}

- (float)readingProgressHighWaterMark
{
  return self->_readingProgressHighWaterMark;
}

- (void)setReadingProgressHighWaterMark:(float)a3
{
  self->_readingProgressHighWaterMark = a3;
}

- (NSData)readingPositionUserData
{
  return self->_readingPositionUserData;
}

- (void)setReadingPositionUserData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (int)readingPositionLocationRangeStart
{
  return self->_readingPositionLocationRangeStart;
}

- (void)setReadingPositionLocationRangeStart:(int)a3
{
  self->_readingPositionLocationRangeStart = a3;
}

- (int)readingPositionLocationRangeEnd
{
  return self->_readingPositionLocationRangeEnd;
}

- (void)setReadingPositionLocationRangeEnd:(int)a3
{
  self->_readingPositionLocationRangeEnd = a3;
}

- (int)readingPositionAbsolutePhysicalLocation
{
  return self->_readingPositionAbsolutePhysicalLocation;
}

- (void)setReadingPositionAbsolutePhysicalLocation:(int)a3
{
  self->_readingPositionAbsolutePhysicalLocation = a3;
}

- (NSString)readingPositionStorageUUID
{
  return self->_readingPositionStorageUUID;
}

- (void)setReadingPositionStorageUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSDate)readingPositionUserUpdatedDate
{
  return self->_readingPositionUserUpdatedDate;
}

- (void)setReadingPositionUserUpdatedDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readingPositionUserUpdatedDate, 0);
  objc_storeStrong((id *)&self->_readingPositionStorageUUID, 0);
  objc_storeStrong((id *)&self->_readingPositionUserData, 0);
  objc_storeStrong((id *)&self->_readingPositionAssetVersion, 0);
  objc_storeStrong((id *)&self->_readingPositionAnnotationVersion, 0);
  objc_storeStrong((id *)&self->_readingPositionPhysicalPageNumber, 0);
  objc_storeStrong((id *)&self->_readingPositionCFIString, 0);
  objc_storeStrong((id *)&self->_assetID, 0);
}

@end
