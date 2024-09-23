@implementation PLDemoContentResults

- (NSArray)assetIDsToDelete
{
  return self->_assetIDsToDelete;
}

- (void)setAssetIDsToDelete:(id)a3
{
  objc_storeStrong((id *)&self->_assetIDsToDelete, a3);
}

- (NSArray)assetsToRevert
{
  return self->_assetsToRevert;
}

- (void)setAssetsToRevert:(id)a3
{
  objc_storeStrong((id *)&self->_assetsToRevert, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsToRevert, 0);
  objc_storeStrong((id *)&self->_assetIDsToDelete, 0);
}

@end
