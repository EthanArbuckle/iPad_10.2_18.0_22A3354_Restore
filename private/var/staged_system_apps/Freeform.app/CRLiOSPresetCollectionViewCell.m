@implementation CRLiOSPresetCollectionViewCell

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRLiOSPresetCollectionViewCell;
  -[CRLiOSPresetCollectionViewCell prepareForReuse](&v4, "prepareForReuse");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSPresetCollectionViewCell presetButton](self, "presetButton"));
  objc_msgSend(v3, "setImage:forState:", 0, 0);

}

- (UIButton)presetButton
{
  return (UIButton *)objc_loadWeakRetained((id *)&self->_presetButton);
}

- (void)setPresetButton:(id)a3
{
  objc_storeWeak((id *)&self->_presetButton, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presetButton);
}

@end
