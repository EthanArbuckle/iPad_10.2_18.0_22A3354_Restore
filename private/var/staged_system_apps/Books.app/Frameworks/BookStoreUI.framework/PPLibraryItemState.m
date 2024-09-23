@implementation PPLibraryItemState

- (id)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
  objc_storeStrong(&self->_itemIdentifier, a3);
}

- (unint64_t)library
{
  return self->_library;
}

- (void)setLibrary:(unint64_t)a3
{
  self->_library = a3;
}

- (unint64_t)download
{
  return self->_download;
}

- (void)setDownload:(unint64_t)a3
{
  self->_download = a3;
}

- (BOOL)isInSamples
{
  return self->_isInSamples;
}

- (void)setIsInSamples:(BOOL)a3
{
  self->_isInSamples = a3;
}

- (BOOL)isSample
{
  return self->_isSample;
}

- (void)setIsSample:(BOOL)a3
{
  self->_isSample = a3;
}

- (NSString)readingProgress
{
  return self->_readingProgress;
}

- (void)setReadingProgress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (double)readingProgressValue
{
  return self->_readingProgressValue;
}

- (void)setReadingProgressValue:(double)a3
{
  self->_readingProgressValue = a3;
}

- (BOOL)wantToRead
{
  return self->_wantToRead;
}

- (void)setWantToRead:(BOOL)a3
{
  self->_wantToRead = a3;
}

- (BOOL)isStreamable
{
  return self->_streamable;
}

- (void)setStreamable:(BOOL)a3
{
  self->_streamable = a3;
}

- (BOOL)isUpdateAvailable
{
  return self->_updateAvailable;
}

- (void)setUpdateAvailable:(BOOL)a3
{
  self->_updateAvailable = a3;
}

- (unint64_t)play
{
  return self->_play;
}

- (void)setPlay:(unint64_t)a3
{
  self->_play = a3;
}

- (unint64_t)seriesType
{
  return self->_seriesType;
}

- (void)setSeriesType:(unint64_t)a3
{
  self->_seriesType = a3;
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (BOOL)hasSpecifiedFinishedDate
{
  return self->_hasSpecifiedFinishedDate;
}

- (void)setHasSpecifiedFinishedDate:(BOOL)a3
{
  self->_hasSpecifiedFinishedDate = a3;
}

- (BOOL)isTrackedAsRecent
{
  return self->_trackedAsRecent;
}

- (void)setTrackedAsRecent:(BOOL)a3
{
  self->_trackedAsRecent = a3;
}

- (BOOL)isPurchased
{
  return self->_isPurchased;
}

- (void)setIsPurchased:(BOOL)a3
{
  self->_isPurchased = a3;
}

- (BOOL)assetIsPreorderable
{
  return self->_assetIsPreorderable;
}

- (void)setAssetIsPreorderable:(BOOL)a3
{
  self->_assetIsPreorderable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readingProgress, 0);
  objc_storeStrong(&self->_itemIdentifier, 0);
}

@end
