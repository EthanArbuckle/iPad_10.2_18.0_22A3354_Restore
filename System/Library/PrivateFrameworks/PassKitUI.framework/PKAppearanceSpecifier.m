@implementation PKAppearanceSpecifier

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  objc_msgSend(v4, "setHasDarkAppearance:", self->_hasDarkAppearance);
  objc_msgSend(v4, "setBackgroundColor:", self->_backgroundColor);
  objc_msgSend(v4, "setForegroundColor:", self->_foregroundColor);
  objc_msgSend(v4, "setTintColor:", self->_tintColor);
  objc_msgSend(v4, "setTableViewSeparatorColor:", self->_tableViewSeparatorColor);
  objc_msgSend(v4, "setTableViewCellHighlightColor:", self->_tableViewCellHighlightColor);
  objc_msgSend(v4, "setTableViewCellAccessoryColor:", self->_tableViewCellAccessoryColor);
  objc_msgSend(v4, "setTableViewCellAccessoryHighlightColor:", self->_tableViewCellAccessoryHighlightColor);
  objc_msgSend(v4, "setTextColor:", self->_textColor);
  objc_msgSend(v4, "setAltTextColor:", self->_altTextColor);
  objc_msgSend(v4, "setButtonTextColor:", self->_buttonTextColor);
  objc_msgSend(v4, "setButtonDisabledTextColor:", self->_buttonDisabledTextColor);
  objc_msgSend(v4, "setButtonBackgroundColor:", self->_buttonBackgroundColor);
  objc_msgSend(v4, "setContinueButtonTintColor:", self->_continueButtonTintColor);
  objc_msgSend(v4, "setEditableTextColor:", self->_editableTextColor);
  objc_msgSend(v4, "setEditablePlaceholderTextColor:", self->_editablePlaceholderTextColor);
  objc_msgSend(v4, "setEditableInsertionPointColor:", self->_editableInsertionPointColor);
  objc_msgSend(v4, "setEditableSelectionBarColor:", self->_editableSelectionBarColor);
  objc_msgSend(v4, "setEditableSelectionHighlightColor:", self->_editableSelectionHighlightColor);
  objc_msgSend(v4, "setFooterHyperlinkColor:", self->_footerHyperlinkColor);
  objc_msgSend(v4, "setProgressBarTintColor:", self->_progressBarTintColor);
  objc_msgSend(v4, "setProgressBarTrackTintColor:", self->_progressBarTrackTintColor);
  objc_msgSend(v4, "setCameraCaptureMaskColor:", self->_cameraCaptureMaskColor);
  objc_msgSend(v4, "setCameraCaptureMaskOutlineColor:", self->_cameraCaptureMaskOutlineColor);
  objc_msgSend(v4, "setNavBarPointImage:", self->_navBarPointImage);
  objc_msgSend(v4, "setNavBarShadowPointImage:", self->_navBarShadowPointImage);
  return v4;
}

- (BOOL)hasDarkAppearance
{
  return self->_hasDarkAppearance;
}

- (void)setHasDarkAppearance:(BOOL)a3
{
  self->_hasDarkAppearance = a3;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (UIColor)foregroundColor
{
  return self->_foregroundColor;
}

- (void)setForegroundColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (UIColor)tableViewSeparatorColor
{
  return self->_tableViewSeparatorColor;
}

- (void)setTableViewSeparatorColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (UIColor)tableViewCellHighlightColor
{
  return self->_tableViewCellHighlightColor;
}

- (void)setTableViewCellHighlightColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (UIColor)tableViewCellAccessoryColor
{
  return self->_tableViewCellAccessoryColor;
}

- (void)setTableViewCellAccessoryColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (UIColor)tableViewCellAccessoryHighlightColor
{
  return self->_tableViewCellAccessoryHighlightColor;
}

- (void)setTableViewCellAccessoryHighlightColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (UIColor)altTextColor
{
  return self->_altTextColor;
}

- (void)setAltTextColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (UIColor)buttonTextColor
{
  return self->_buttonTextColor;
}

- (void)setButtonTextColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (UIColor)buttonDisabledTextColor
{
  return self->_buttonDisabledTextColor;
}

- (void)setButtonDisabledTextColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (UIColor)buttonBackgroundColor
{
  return self->_buttonBackgroundColor;
}

- (void)setButtonBackgroundColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (UIColor)continueButtonTintColor
{
  return self->_continueButtonTintColor;
}

- (void)setContinueButtonTintColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (UIColor)editableTextColor
{
  return self->_editableTextColor;
}

- (void)setEditableTextColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (UIColor)editablePlaceholderTextColor
{
  return self->_editablePlaceholderTextColor;
}

- (void)setEditablePlaceholderTextColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (UIColor)editableInsertionPointColor
{
  return self->_editableInsertionPointColor;
}

- (void)setEditableInsertionPointColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (UIColor)editableSelectionBarColor
{
  return self->_editableSelectionBarColor;
}

- (void)setEditableSelectionBarColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (UIColor)editableSelectionHighlightColor
{
  return self->_editableSelectionHighlightColor;
}

- (void)setEditableSelectionHighlightColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (UIColor)footerHyperlinkColor
{
  return self->_footerHyperlinkColor;
}

- (void)setFooterHyperlinkColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (UIColor)progressBarTintColor
{
  return self->_progressBarTintColor;
}

- (void)setProgressBarTintColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (UIColor)progressBarTrackTintColor
{
  return self->_progressBarTrackTintColor;
}

- (void)setProgressBarTrackTintColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (UIColor)searchBarTintcolor
{
  return self->_searchBarTintcolor;
}

- (void)setSearchBarTintcolor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (UIColor)cameraCaptureMaskColor
{
  return self->_cameraCaptureMaskColor;
}

- (void)setCameraCaptureMaskColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (UIColor)cameraCaptureMaskOutlineColor
{
  return self->_cameraCaptureMaskOutlineColor;
}

- (void)setCameraCaptureMaskOutlineColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (UIImage)navBarPointImage
{
  return self->_navBarPointImage;
}

- (void)setNavBarPointImage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (UIImage)navBarShadowPointImage
{
  return self->_navBarShadowPointImage;
}

- (void)setNavBarShadowPointImage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navBarShadowPointImage, 0);
  objc_storeStrong((id *)&self->_navBarPointImage, 0);
  objc_storeStrong((id *)&self->_cameraCaptureMaskOutlineColor, 0);
  objc_storeStrong((id *)&self->_cameraCaptureMaskColor, 0);
  objc_storeStrong((id *)&self->_searchBarTintcolor, 0);
  objc_storeStrong((id *)&self->_progressBarTrackTintColor, 0);
  objc_storeStrong((id *)&self->_progressBarTintColor, 0);
  objc_storeStrong((id *)&self->_footerHyperlinkColor, 0);
  objc_storeStrong((id *)&self->_editableSelectionHighlightColor, 0);
  objc_storeStrong((id *)&self->_editableSelectionBarColor, 0);
  objc_storeStrong((id *)&self->_editableInsertionPointColor, 0);
  objc_storeStrong((id *)&self->_editablePlaceholderTextColor, 0);
  objc_storeStrong((id *)&self->_editableTextColor, 0);
  objc_storeStrong((id *)&self->_continueButtonTintColor, 0);
  objc_storeStrong((id *)&self->_buttonBackgroundColor, 0);
  objc_storeStrong((id *)&self->_buttonDisabledTextColor, 0);
  objc_storeStrong((id *)&self->_buttonTextColor, 0);
  objc_storeStrong((id *)&self->_altTextColor, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_tableViewCellAccessoryHighlightColor, 0);
  objc_storeStrong((id *)&self->_tableViewCellAccessoryColor, 0);
  objc_storeStrong((id *)&self->_tableViewCellHighlightColor, 0);
  objc_storeStrong((id *)&self->_tableViewSeparatorColor, 0);
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_foregroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end
