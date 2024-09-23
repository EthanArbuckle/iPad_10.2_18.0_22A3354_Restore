@implementation PLiCPLTransferProgress

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("notUploadedPhotosCount: %llu notUploadedVideosCount: %llu notUploadedItemsCount %llu"), self->_notUploadedPhotosCount, self->_notUploadedVideosCount, self->_notUploadedItemsCount);
}

- (unint64_t)notUploadedPhotosCount
{
  return self->_notUploadedPhotosCount;
}

- (void)setNotUploadedPhotosCount:(unint64_t)a3
{
  self->_notUploadedPhotosCount = a3;
}

- (unint64_t)notUploadedVideosCount
{
  return self->_notUploadedVideosCount;
}

- (void)setNotUploadedVideosCount:(unint64_t)a3
{
  self->_notUploadedVideosCount = a3;
}

- (unint64_t)notUploadedItemsCount
{
  return self->_notUploadedItemsCount;
}

- (void)setNotUploadedItemsCount:(unint64_t)a3
{
  self->_notUploadedItemsCount = a3;
}

@end
