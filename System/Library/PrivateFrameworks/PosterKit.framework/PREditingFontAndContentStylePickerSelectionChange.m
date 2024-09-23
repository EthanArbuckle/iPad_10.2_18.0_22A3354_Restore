@implementation PREditingFontAndContentStylePickerSelectionChange

- (NSString)timeFontIdentifier
{
  return self->_timeFontIdentifier;
}

- (void)setTimeFontIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_timeFontIdentifier, a3);
}

- (NSNumber)preferredTitleAlignment
{
  return self->_preferredTitleAlignment;
}

- (void)setPreferredTitleAlignment:(id)a3
{
  objc_storeStrong((id *)&self->_preferredTitleAlignment, a3);
}

- (NSNumber)preferredTitleLayout
{
  return self->_preferredTitleLayout;
}

- (void)setPreferredTitleLayout:(id)a3
{
  objc_storeStrong((id *)&self->_preferredTitleLayout, a3);
}

- (NSNumber)fontWeight
{
  return self->_fontWeight;
}

- (void)setFontWeight:(id)a3
{
  objc_storeStrong((id *)&self->_fontWeight, a3);
}

- (NSNumber)isSystemItem
{
  return self->_systemItem;
}

- (void)setSystemItem:(id)a3
{
  objc_storeStrong((id *)&self->_systemItem, a3);
}

- (UIFont)customFont
{
  return self->_customFont;
}

- (void)setCustomFont:(id)a3
{
  objc_storeStrong((id *)&self->_customFont, a3);
}

- (NSString)numberingSystem
{
  return self->_numberingSystem;
}

- (void)setNumberingSystem:(id)a3
{
  objc_storeStrong((id *)&self->_numberingSystem, a3);
}

- (PRPosterContentStyle)contentStyle
{
  return self->_contentStyle;
}

- (void)setContentStyle:(id)a3
{
  objc_storeStrong((id *)&self->_contentStyle, a3);
}

- (NSNumber)isSuggestedContentStyle
{
  return self->_suggestedContentStyle;
}

- (void)setSuggestedContentStyle:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedContentStyle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedContentStyle, 0);
  objc_storeStrong((id *)&self->_contentStyle, 0);
  objc_storeStrong((id *)&self->_numberingSystem, 0);
  objc_storeStrong((id *)&self->_customFont, 0);
  objc_storeStrong((id *)&self->_systemItem, 0);
  objc_storeStrong((id *)&self->_fontWeight, 0);
  objc_storeStrong((id *)&self->_preferredTitleLayout, 0);
  objc_storeStrong((id *)&self->_preferredTitleAlignment, 0);
  objc_storeStrong((id *)&self->_timeFontIdentifier, 0);
}

@end
