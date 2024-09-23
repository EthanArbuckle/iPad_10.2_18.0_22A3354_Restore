@implementation PBFFocusPosterConfigurationMetadata

- (BOOL)isChecked
{
  return self->_checked;
}

- (void)setChecked:(BOOL)a3
{
  self->_checked = a3;
}

- (UIImage)cachedSnapshot
{
  return self->_cachedSnapshot;
}

- (void)setCachedSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_cachedSnapshot, a3);
}

- (PBFPosterPreview)posterPreview
{
  return self->_posterPreview;
}

- (void)setPosterPreview:(id)a3
{
  objc_storeStrong((id *)&self->_posterPreview, a3);
}

- (NSString)otherFocusSymbolImageName
{
  return self->_otherFocusSymbolImageName;
}

- (void)setOtherFocusSymbolImageName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)otherFocusDisplayName
{
  return self->_otherFocusDisplayName;
}

- (void)setOtherFocusDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherFocusDisplayName, 0);
  objc_storeStrong((id *)&self->_otherFocusSymbolImageName, 0);
  objc_storeStrong((id *)&self->_posterPreview, 0);
  objc_storeStrong((id *)&self->_cachedSnapshot, 0);
}

@end
