@implementation PUOneUpPhotosSharingTransitionContext

- (id)keyAssetIndexPath
{
  void *v2;
  void *v3;

  -[PUOneUpPhotosSharingTransitionContext currentAssetReference](self, "currentAssetReference");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "indexPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (PUAssetReference)currentAssetReference
{
  return self->_currentAssetReference;
}

- (void)setCurrentAssetReference:(id)a3
{
  objc_storeStrong((id *)&self->_currentAssetReference, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentAssetReference, 0);
}

@end
