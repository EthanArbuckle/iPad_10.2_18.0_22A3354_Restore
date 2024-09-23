@implementation PXCuratedLibraryChapterHeaderLayoutSpec

- (double)titleHeight
{
  return self->_titleHeight;
}

- (PXCuratedLibraryChapterHeaderLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  id v6;
  PXCuratedLibraryChapterHeaderLayoutSpec *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL4 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  UIFont *titleFont;
  void *v18;
  uint64_t v19;
  UIColor *floatingTitleEmphasizedColor;
  void *v21;
  double v22;
  void *v23;
  id *p_floatingTitleDeemphasizedColor;
  UIColor *v25;
  UIColor *titleDeemphasizedColor;
  uint64_t v27;
  UIColor *titleEmphasizedColor;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t v35;
  PXExtendedImageConfiguration *chevronImageConfiguration;
  double v37;
  double v38;
  double v39;
  double v40;
  char v41;
  double v42;
  double titleHeight;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  PXMonthsAssetsSectionHeaderLayoutSpec *v50;
  double v51;
  double v52;
  double v53;
  int v55;
  _BOOL4 v56;
  objc_super v57;
  uint64_t v58;
  _QWORD v59[2];
  CGRect v60;

  v59[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v57.receiver = self;
  v57.super_class = (Class)PXCuratedLibraryChapterHeaderLayoutSpec;
  v7 = -[PXFeatureSpec initWithExtendedTraitCollection:options:](&v57, sel_initWithExtendedTraitCollection_options_, v6, a4);
  if (v7)
  {
    +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PXFeatureSpec sizeClass](v7, "sizeClass") == 1)
    {
      v9 = -[PXFeatureSpec layoutOrientation](v7, "layoutOrientation");
      v10 = objc_msgSend(v6, "curatedLibraryLayoutStyle");
      v11 = v10 != 1;
      v12 = 2;
      if (v10 == 1)
        v12 = 3;
      v56 = v9 == 2;
      if (v9 == 2)
        v13 = 4;
      else
        v13 = v12;
    }
    else
    {
      v14 = objc_msgSend(v6, "curatedLibraryLayoutStyle");
      v56 = 0;
      v11 = v14 != 1;
      if (v14 == 1)
        v13 = 3;
      else
        v13 = 2;
    }
    if ((unint64_t)(-[PXFeatureSpec contentSizeCategory](v7, "contentSizeCategory") - 8) >= 5)
      v15 = 5;
    else
      v15 = 7;
    MEMORY[0x1A85CC970](v13, 32770, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    titleFont = v7->_titleFont;
    v7->_titleFont = (UIFont *)v16;

    v58 = *MEMORY[0x1E0DC1138];
    v59[0] = v7->_titleFont;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, &v58, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("Hg"), "boundingRectWithSize:options:attributes:context:", 0, v18, 0, 1.79769313e308, 1.79769313e308);
    v7->_titleHeight = CGRectGetHeight(v60);

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v19 = objc_claimAutoreleasedReturnValue();
    floatingTitleEmphasizedColor = v7->_floatingTitleEmphasizedColor;
    v7->_floatingTitleEmphasizedColor = (UIColor *)v19;

    if (v11)
    {
      v21 = (void *)MEMORY[0x1E0DC3658];
      objc_msgSend(v8, "monthsFloatingHeadersSubtitleAlpha");
      objc_msgSend(v21, "colorWithWhite:alpha:", 1.0, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = v7->_floatingTitleEmphasizedColor;
    }
    objc_storeStrong((id *)&v7->_floatingTitleDeemphasizedColor, v23);
    if (v11 && (v23, objc_msgSend(v6, "userInterfaceStyle") != 2))
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v27 = objc_claimAutoreleasedReturnValue();
      titleEmphasizedColor = v7->_titleEmphasizedColor;
      v7->_titleEmphasizedColor = (UIColor *)v27;

      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.55, 1.0);
      v29 = objc_claimAutoreleasedReturnValue();
      titleDeemphasizedColor = v7->_titleDeemphasizedColor;
      v7->_titleDeemphasizedColor = (UIColor *)v29;
    }
    else
    {
      objc_storeStrong((id *)&v7->_titleEmphasizedColor, v7->_floatingTitleEmphasizedColor);
      if (v11)
        p_floatingTitleDeemphasizedColor = (id *)&v7->_floatingTitleDeemphasizedColor;
      else
        p_floatingTitleDeemphasizedColor = (id *)&v7->_titleEmphasizedColor;
      v25 = (UIColor *)*p_floatingTitleDeemphasizedColor;
      titleDeemphasizedColor = v7->_titleDeemphasizedColor;
      v7->_titleDeemphasizedColor = v25;
    }

    v30 = (void *)MEMORY[0x1E0DC3888];
    -[UIFont pointSize](v7->_titleFont, "pointSize");
    objc_msgSend(v30, "configurationWithPointSize:weight:scale:", 7, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_alloc((Class)off_1E50B2470);
    PXLocalizedStringFromTable(CFSTR("PXLeadingChevronAXLabel"), CFSTR("PhotosUICore"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v32, "initWithImageName:isSystemImage:accessibilityLabel:tintColor:imageConfiguration:inBundle:", CFSTR("chevron.forward"), 1, v33, v34, v31, 0);
    chevronImageConfiguration = v7->_chevronImageConfiguration;
    v7->_chevronImageConfiguration = (PXExtendedImageConfiguration *)v35;

    v7->_wantsChevron = v11;
    if (v56)
    {
      v7->_contentInset.width = 14.0;
      v7->_contentInset.height = v7->_contentInset.height + -2.0;
      v7->_spacingBetweenTitleAndChevron = 2.0;
      v7->_spacingBetweenTitleTopAndPreviousCardBottom = 20.0;
      v37 = 0.0;
    }
    else
    {
      v38 = 0.0;
      if (v11)
        v38 = 2.0;
      v7->_contentInset.width = v38;
      v7->_spacingBetweenTitleAndChevron = 8.0;
      v7->_spacingBetweenTitleTopAndPreviousCardBottom = 32.0;
      v37 = 10.0;
      if (v11)
        v37 = 14.0;
    }
    v7->_spacingBetweenTitleBottomAndNextCardTop = v37;
    v7->_shouldFloat = objc_msgSend(v8, "allowsModularLayoutForZoomLevel:sizeClass:orientation:layoutStyle:", 2, -[PXFeatureSpec sizeClass](v7, "sizeClass", 360), -[PXFeatureSpec layoutOrientation](v7, "layoutOrientation"), objc_msgSend(v6, "curatedLibraryLayoutStyle")) ^ 1;
    v7->_shouldAlwaysShowFloatingVersion = 0;
    if (objc_msgSend(v6, "userInterfaceIdiom") == 5)
    {
      v39 = 24.0;
      v40 = 20.0;
      if (!v11)
        v40 = 24.0;
      v7->_spacingBetweenTitleTopAndPreviousCardBottom = v40;
      if (v11)
        v39 = 2.0;
      v7->_spacingBetweenTitleBottomAndNextCardTop = v39;
      v7->_shouldFloat = v11;
      v7->_shouldAlwaysShowFloatingVersion = 1;
    }
    if (v56 || !v11)
      v41 = objc_msgSend(v8, "allowsCustomDateTitles");
    else
      v41 = 0;
    v7->_shouldAbbreviateMonth = v41;
    objc_msgSend(v8, "monthsFloatingHeadersDistanceFromSafeAreaTop");
    v7->_floatingDistanceFromSafeAreaTop = v42;
    titleHeight = v7->_titleHeight;
    objc_msgSend(v8, "monthsFloatingHeadersAppearanceCrossfadeStartDistance");
    v7->_floatingAppearanceCrossfadeStartDistance = titleHeight * v44;
    v45 = v7->_titleHeight;
    objc_msgSend(v8, "monthsFloatingHeadersAppearanceCrossfadeDistance");
    v7->_floatingAppearanceCrossfadeDistance = v45 * v46;
    objc_msgSend(v8, "floatingHeadersAppearanceCrossfadeDuration");
    v7->_floatingAppearanceCrossfadeDuration = v47;
    v48 = v7->_titleHeight;
    objc_msgSend(v8, "monthsFloatingHeadersFadeoutDistance");
    v7->_floatingFadeOutDistance = v48 * v49;
    if ((a4 & 0x800) == 0 && v7->_shouldFloat)
    {
      v50 = -[PXMonthsAssetsSectionHeaderLayoutSpec initWithExtendedTraitCollection:options:]([PXMonthsAssetsSectionHeaderLayoutSpec alloc], "initWithExtendedTraitCollection:options:", v6, a4);
      -[PXCuratedLibrarySectionHeaderLayoutSpec contentPadding](v50, "contentPadding");
      v52 = v51;
      -[PXCuratedLibrarySectionHeaderLayoutSpec titlePadding](v50, "titlePadding");
      *(double *)((char *)&v7->super.super.isa + v55) = v52 + v53;

    }
  }

  return v7;
}

- (double)spacingBetweenTitleBottomAndNextCardTop
{
  return self->_spacingBetweenTitleBottomAndNextCardTop;
}

- (BOOL)shouldFloat
{
  return self->_shouldFloat;
}

- (double)floatingDistanceFromSafeAreaTop
{
  return self->_floatingDistanceFromSafeAreaTop;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chevronImageConfiguration, 0);
  objc_storeStrong((id *)&self->_floatingTitleDeemphasizedColor, 0);
  objc_storeStrong((id *)&self->_titleDeemphasizedColor, 0);
  objc_storeStrong((id *)&self->_floatingTitleEmphasizedColor, 0);
  objc_storeStrong((id *)&self->_titleEmphasizedColor, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
}

- (double)spacingBetweenTitleTopAndPreviousCardBottom
{
  return self->_spacingBetweenTitleTopAndPreviousCardBottom;
}

- (CGSize)contentInset
{
  double width;
  double height;
  CGSize result;

  width = self->_contentInset.width;
  height = self->_contentInset.height;
  result.height = height;
  result.width = width;
  return result;
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (UIColor)titleEmphasizedColor
{
  return self->_titleEmphasizedColor;
}

- (UIColor)floatingTitleEmphasizedColor
{
  return self->_floatingTitleEmphasizedColor;
}

- (UIColor)titleDeemphasizedColor
{
  return self->_titleDeemphasizedColor;
}

- (UIColor)floatingTitleDeemphasizedColor
{
  return self->_floatingTitleDeemphasizedColor;
}

- (PXExtendedImageConfiguration)chevronImageConfiguration
{
  return self->_chevronImageConfiguration;
}

- (BOOL)wantsChevron
{
  return self->_wantsChevron;
}

- (double)spacingBetweenTitleAndChevron
{
  return self->_spacingBetweenTitleAndChevron;
}

- (BOOL)shouldAbbreviateMonth
{
  return self->_shouldAbbreviateMonth;
}

- (double)floatingAppearanceCrossfadeStartDistance
{
  return self->_floatingAppearanceCrossfadeStartDistance;
}

- (double)floatingAppearanceCrossfadeDistance
{
  return self->_floatingAppearanceCrossfadeDistance;
}

- (double)floatingAppearanceCrossfadeDuration
{
  return self->_floatingAppearanceCrossfadeDuration;
}

- (double)floatingFadeOutDistance
{
  return self->_floatingFadeOutDistance;
}

- (BOOL)shouldAlwaysShowFloatingVersion
{
  return self->_shouldAlwaysShowFloatingVersion;
}

@end
