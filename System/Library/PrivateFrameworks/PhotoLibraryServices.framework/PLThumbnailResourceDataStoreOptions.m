@implementation PLThumbnailResourceDataStoreOptions

- (NSNumber)overridingThumbnailIndex
{
  return self->_overridingThumbnailIndex;
}

- (void)setOverridingThumbnailIndex:(id)a3
{
  objc_storeStrong((id *)&self->_overridingThumbnailIndex, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overridingThumbnailIndex, 0);
}

@end
