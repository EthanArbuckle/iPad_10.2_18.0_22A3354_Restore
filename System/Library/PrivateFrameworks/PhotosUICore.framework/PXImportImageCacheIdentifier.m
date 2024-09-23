@implementation PXImportImageCacheIdentifier

- (NSString)assetUuid
{
  return self->_assetUuid;
}

- (void)setAssetUuid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unint64_t)sizeType
{
  return self->_sizeType;
}

- (void)setSizeType:(unint64_t)a3
{
  self->_sizeType = a3;
}

- (int64_t)cacheIndex
{
  return self->_cacheIndex;
}

- (void)setCacheIndex:(int64_t)a3
{
  self->_cacheIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetUuid, 0);
}

@end
