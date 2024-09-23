@implementation CRLiOSPresetCollectionView

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRLiOSPresetCollectionView;
  -[CRLiOSPresetCollectionView layoutSubviews](&v4, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionView presetCollectionViewDelegate](self, "presetCollectionViewDelegate"));
  objc_msgSend(v3, "presetCollectionViewDidLayoutSubviews:", self);

}

- (CRLiOSPresetCollectionViewDelegate)presetCollectionViewDelegate
{
  return (CRLiOSPresetCollectionViewDelegate *)objc_loadWeakRetained((id *)&self->_presetCollectionViewDelegate);
}

- (void)setPresetCollectionViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_presetCollectionViewDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presetCollectionViewDelegate);
}

@end
