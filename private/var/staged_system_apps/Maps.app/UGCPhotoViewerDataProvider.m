@implementation UGCPhotoViewerDataProvider

- (NSArray)attributionNames
{
  return (NSArray *)&__NSArray0__struct;
}

- (BOOL)isAllowedToShowAddPhotoCallToAction
{
  return 0;
}

- (BOOL)hasDataToShow
{
  return 0;
}

- (BOOL)hasReachedTotalCount
{
  return 1;
}

- (BOOL)hasPhotosThatShouldBeObfuscatedWhenInFullScreen
{
  return 0;
}

- (unint64_t)totalNumberOfPhotos
{
  return 0;
}

- (NSArray)photoList
{
  return (NSArray *)&__NSArray0__struct;
}

- (UGCPhotoAlbumCategory)albumCategory
{
  return -[UGCPhotoAlbumCategory initWithTitle:categoryType:]([UGCPhotoAlbumCategory alloc], "initWithTitle:categoryType:", &stru_1011EB268, 0);
}

- (unint64_t)indexOfTappedPhoto
{
  return self->indexOfTappedPhoto;
}

- (void)setIndexOfTappedPhoto:(unint64_t)a3
{
  self->indexOfTappedPhoto = a3;
}

- (UGCMorePhotosDataProviderUpdateDelegate)delegate
{
  return (UGCMorePhotosDataProviderUpdateDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
