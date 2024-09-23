@implementation PXCMMImageViewModel

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXCMMImageViewModel;
  -[PXCMMImageViewModel performChanges:](&v3, sel_performChanges_, a3);
}

- (void)setAsset:(id)a3
{
  PXDisplayAsset *v5;
  PXDisplayAsset *v6;

  v5 = (PXDisplayAsset *)a3;
  if (self->_asset != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_asset, a3);
    -[PXCMMImageViewModel signalChange:](self, "signalChange:", 1);
    v5 = v6;
  }

}

- (void)setMediaProvider:(id)a3
{
  PXUIImageProvider *v5;
  PXUIImageProvider *v6;

  v5 = (PXUIImageProvider *)a3;
  if (self->_mediaProvider != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_mediaProvider, a3);
    -[PXCMMImageViewModel signalChange:](self, "signalChange:", 2);
    v5 = v6;
  }

}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    -[PXCMMImageViewModel signalChange:](self, "signalChange:", 4);
  }
}

- (PXDisplayAsset)asset
{
  return self->_asset;
}

- (PXUIImageProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

@end
