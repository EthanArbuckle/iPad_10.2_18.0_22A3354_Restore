@implementation UGCGlyphButtonAppearance

+ (id)_sharedThumbButtonConfig
{
  UGCGlyphButtonAppearance *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v2 = objc_alloc_init(UGCGlyphButtonAppearance);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MapsTheme ugcGlyphButtonViewMutedBackgroundColor](MapsTheme, "ugcGlyphButtonViewMutedBackgroundColor"));
  -[UGCGlyphButtonAppearance setMutedBackgroundColor:](v2, "setMutedBackgroundColor:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MapsTheme ugcGlyphButtonViewMutedGlyphColor](MapsTheme, "ugcGlyphButtonViewMutedGlyphColor"));
  -[UGCGlyphButtonAppearance setMutedGlyphColor:](v2, "setMutedGlyphColor:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MapsTheme ugcGlyphButtonViewUnselectedBackgroundColor](MapsTheme, "ugcGlyphButtonViewUnselectedBackgroundColor"));
  -[UGCGlyphButtonAppearance setUnselectedBackgroundColor:](v2, "setUnselectedBackgroundColor:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MapsTheme ugcGlyphButtonViewUnselectedGlyphColor](MapsTheme, "ugcGlyphButtonViewUnselectedGlyphColor"));
  -[UGCGlyphButtonAppearance setUnselectedGlyphColor:](v2, "setUnselectedGlyphColor:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MapsTheme ugcGlyphButtonViewSelectedGlyphColor](MapsTheme, "ugcGlyphButtonViewSelectedGlyphColor"));
  -[UGCGlyphButtonAppearance setSelectedGlyphColor:](v2, "setSelectedGlyphColor:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MapsTheme ugcGlyphButtonViewSelectedBackgroundColor](MapsTheme, "ugcGlyphButtonViewSelectedBackgroundColor"));
  -[UGCGlyphButtonAppearance setSelectedBackgroundColor:](v2, "setSelectedBackgroundColor:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UGCFontManager ratingGlyphButtonFont](UGCFontManager, "ratingGlyphButtonFont"));
  -[UGCGlyphButtonAppearance setSelectedGlyphFontSize:](v2, "setSelectedGlyphFontSize:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UGCFontManager ratingGlyphButtonFont](UGCFontManager, "ratingGlyphButtonFont"));
  -[UGCGlyphButtonAppearance setUnselectedGlyphFontSize:](v2, "setUnselectedGlyphFontSize:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UGCFontManager ratingGlyphButtonFont](UGCFontManager, "ratingGlyphButtonFont"));
  -[UGCGlyphButtonAppearance setMutedGlyphFontSize:](v2, "setMutedGlyphFontSize:", v11);

  return v2;
}

+ (id)thumbsUpButtonAppearance
{
  void *v2;
  void *v3;
  id v4;
  const __CFString *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_sharedThumbButtonConfig"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == (id)5)
    v5 = CFSTR("hand.thumbsup");
  else
    v5 = CFSTR("hand.thumbsup.fill");
  objc_msgSend(v2, "setMutedGlyphName:", v5);
  objc_msgSend(v2, "setUnselectedGlyphName:", v5);
  objc_msgSend(v2, "setSelectedGlyphName:", CFSTR("hand.thumbsup.fill"));
  return v2;
}

+ (id)thumbsDownButtonAppearance
{
  void *v2;
  void *v3;
  id v4;
  const __CFString *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_sharedThumbButtonConfig"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == (id)5)
    v5 = CFSTR("hand.thumbsdown");
  else
    v5 = CFSTR("hand.thumbsdown.fill");
  objc_msgSend(v2, "setMutedGlyphName:", v5);
  objc_msgSend(v2, "setUnselectedGlyphName:", v5);
  objc_msgSend(v2, "setSelectedGlyphName:", CFSTR("hand.thumbsdown.fill"));
  return v2;
}

- (NSString)mutedGlyphName
{
  return self->_mutedGlyphName;
}

- (void)setMutedGlyphName:(id)a3
{
  objc_storeStrong((id *)&self->_mutedGlyphName, a3);
}

- (UIColor)mutedBackgroundColor
{
  return self->_mutedBackgroundColor;
}

- (void)setMutedBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_mutedBackgroundColor, a3);
}

- (UIColor)mutedGlyphColor
{
  return self->_mutedGlyphColor;
}

- (void)setMutedGlyphColor:(id)a3
{
  objc_storeStrong((id *)&self->_mutedGlyphColor, a3);
}

- (NSString)unselectedGlyphName
{
  return self->_unselectedGlyphName;
}

- (void)setUnselectedGlyphName:(id)a3
{
  objc_storeStrong((id *)&self->_unselectedGlyphName, a3);
}

- (UIColor)unselectedBackgroundColor
{
  return self->_unselectedBackgroundColor;
}

- (void)setUnselectedBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_unselectedBackgroundColor, a3);
}

- (UIColor)unselectedGlyphColor
{
  return self->_unselectedGlyphColor;
}

- (void)setUnselectedGlyphColor:(id)a3
{
  objc_storeStrong((id *)&self->_unselectedGlyphColor, a3);
}

- (NSString)selectedGlyphName
{
  return self->_selectedGlyphName;
}

- (void)setSelectedGlyphName:(id)a3
{
  objc_storeStrong((id *)&self->_selectedGlyphName, a3);
}

- (UIColor)selectedBackgroundColor
{
  return self->_selectedBackgroundColor;
}

- (void)setSelectedBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_selectedBackgroundColor, a3);
}

- (UIColor)selectedGlyphColor
{
  return self->_selectedGlyphColor;
}

- (void)setSelectedGlyphColor:(id)a3
{
  objc_storeStrong((id *)&self->_selectedGlyphColor, a3);
}

- (UIFont)selectedGlyphFontSize
{
  return self->_selectedGlyphFontSize;
}

- (void)setSelectedGlyphFontSize:(id)a3
{
  objc_storeStrong((id *)&self->_selectedGlyphFontSize, a3);
}

- (UIFont)unselectedGlyphFontSize
{
  return self->_unselectedGlyphFontSize;
}

- (void)setUnselectedGlyphFontSize:(id)a3
{
  objc_storeStrong((id *)&self->_unselectedGlyphFontSize, a3);
}

- (UIFont)mutedGlyphFontSize
{
  return self->_mutedGlyphFontSize;
}

- (void)setMutedGlyphFontSize:(id)a3
{
  objc_storeStrong((id *)&self->_mutedGlyphFontSize, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutedGlyphFontSize, 0);
  objc_storeStrong((id *)&self->_unselectedGlyphFontSize, 0);
  objc_storeStrong((id *)&self->_selectedGlyphFontSize, 0);
  objc_storeStrong((id *)&self->_selectedGlyphColor, 0);
  objc_storeStrong((id *)&self->_selectedBackgroundColor, 0);
  objc_storeStrong((id *)&self->_selectedGlyphName, 0);
  objc_storeStrong((id *)&self->_unselectedGlyphColor, 0);
  objc_storeStrong((id *)&self->_unselectedBackgroundColor, 0);
  objc_storeStrong((id *)&self->_unselectedGlyphName, 0);
  objc_storeStrong((id *)&self->_mutedGlyphColor, 0);
  objc_storeStrong((id *)&self->_mutedBackgroundColor, 0);
  objc_storeStrong((id *)&self->_mutedGlyphName, 0);
}

@end
