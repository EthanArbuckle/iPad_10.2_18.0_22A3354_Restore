@implementation SXMediaViewEvent

- (unint64_t)galleryImageCount
{
  return self->_galleryImageCount;
}

- (void)setGalleryImageCount:(unint64_t)a3
{
  self->_galleryImageCount = a3;
}

- (NSArray)galleryImageIds
{
  return self->_galleryImageIds;
}

- (void)setGalleryImageIds:(id)a3
{
  objc_storeStrong((id *)&self->_galleryImageIds, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_galleryImageIds, 0);
}

@end
