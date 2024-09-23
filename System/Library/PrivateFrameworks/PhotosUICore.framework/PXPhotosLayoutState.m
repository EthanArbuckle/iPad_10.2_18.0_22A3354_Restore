@implementation PXPhotosLayoutState

- (id)copyWithZone:(_NSZone *)a3
{
  PXPhotosLayoutState *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = objc_alloc_init(PXPhotosLayoutState);
  -[PXPhotosLayoutState lens](self, "lens");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosLayoutState setLens:](v4, "setLens:", v5);

  -[PXPhotosLayoutState bodyProvider](self, "bodyProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosLayoutState setBodyProvider:](v4, "setBodyProvider:", v6);

  -[PXPhotosLayoutState headerProvider](self, "headerProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosLayoutState setHeaderProvider:](v4, "setHeaderProvider:", v7);

  -[PXPhotosLayoutState anchorAssetReference](self, "anchorAssetReference");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosLayoutState setAnchorAssetReference:](v4, "setAnchorAssetReference:", v8);

  return v4;
}

- (PXPhotosViewLens)lens
{
  return self->_lens;
}

- (void)setLens:(id)a3
{
  objc_storeStrong((id *)&self->_lens, a3);
}

- (PXPhotosSectionBodyLayoutProvider)bodyProvider
{
  return self->_bodyProvider;
}

- (void)setBodyProvider:(id)a3
{
  objc_storeStrong((id *)&self->_bodyProvider, a3);
}

- (PXPhotosSectionHeaderLayoutProvider)headerProvider
{
  return self->_headerProvider;
}

- (void)setHeaderProvider:(id)a3
{
  objc_storeStrong((id *)&self->_headerProvider, a3);
}

- (PXAssetReference)anchorAssetReference
{
  return self->_anchorAssetReference;
}

- (void)setAnchorAssetReference:(id)a3
{
  objc_storeStrong((id *)&self->_anchorAssetReference, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchorAssetReference, 0);
  objc_storeStrong((id *)&self->_headerProvider, 0);
  objc_storeStrong((id *)&self->_bodyProvider, 0);
  objc_storeStrong((id *)&self->_lens, 0);
}

@end
