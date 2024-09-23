@implementation PLThumbnailMigratorWorkItem

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (PLManagedAsset)asset
{
  return self->_asset;
}

- (void)setAsset:(id)a3
{
  objc_storeStrong((id *)&self->_asset, a3);
}

- (NSString)masterThumbFilePath
{
  return self->_masterThumbFilePath;
}

- (void)setMasterThumbFilePath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)destinationThumbnailIndex
{
  return self->_destinationThumbnailIndex;
}

- (void)setDestinationThumbnailIndex:(unint64_t)a3
{
  self->_destinationThumbnailIndex = a3;
}

- (BOOL)succeeded
{
  return self->_succeeded;
}

- (void)setSucceeded:(BOOL)a3
{
  self->_succeeded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_masterThumbFilePath, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
