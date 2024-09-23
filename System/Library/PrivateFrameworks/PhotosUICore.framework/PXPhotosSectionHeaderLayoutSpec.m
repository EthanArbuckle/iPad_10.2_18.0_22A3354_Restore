@implementation PXPhotosSectionHeaderLayoutSpec

- (PXPhotosSectionHeaderLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  id v6;
  char *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  BOOL v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  PXCuratedLibrarySectionHeaderLayoutSpec *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  objc_super v63;

  v6 = a3;
  v63.receiver = self;
  v63.super_class = (Class)PXPhotosSectionHeaderLayoutSpec;
  v7 = -[PXFeatureSpec initWithExtendedTraitCollection:options:](&v63, sel_initWithExtendedTraitCollection_options_, v6, a4);
  if (v7)
  {
    PXSystemFontOfSizeAndWeight();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)*((_QWORD *)v7 + 36);
    *((_QWORD *)v7 + 36) = v8;

    PXSystemFontOfSizeAndWeight();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)*((_QWORD *)v7 + 37);
    *((_QWORD *)v7 + 37) = v10;

    PXSystemFontOfSizeAndWeight();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)*((_QWORD *)v7 + 38);
    *((_QWORD *)v7 + 38) = v12;

    PXSystemFontOfSizeAndWeight();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)*((_QWORD *)v7 + 39);
    *((_QWORD *)v7 + 39) = v14;

    v16 = 32.0;
    if ((a4 & 4) == 0)
      v16 = 26.0;
    *((double *)v7 + 40) = v16;
    v17 = 35.0;
    if ((a4 & 4) == 0)
      v17 = 11.0;
    *((double *)v7 + 41) = v17;
    *((_QWORD *)v7 + 42) = 0x4014000000000000;
    v18 = (a4 & 4) == 0;
    *((_QWORD *)v7 + 43) = 0x4034000000000000;
    *((_QWORD *)v7 + 44) = 0x4014000000000000;
    *(_OWORD *)(v7 + 424) = xmmword_1A7C0C960;
    *((_QWORD *)v7 + 46) = 0x401C000000000000;
    +[PXPhotosGridSettings sharedInstance](PXPhotosGridSettings, "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "sectionHeaderGradientAlpha");
    *((_QWORD *)v7 + 49) = v20;

    +[PXPhotosGridSettings sharedInstance](PXPhotosGridSettings, "sharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "sectionHeaderGradientOverhang");
    *((_QWORD *)v7 + 50) = v22;

    v7[232] = v18;
    v7[233] = (a4 & 4) >> 2;
    v7[235] = (a4 & 4) >> 2;
    v7[234] = v18;
    objc_msgSend(v6, "traitCollection");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "quaternaryLabelColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v23)
    {
      objc_msgSend(v24, "resolvedColorWithTraitCollection:", v23);
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = (void *)*((_QWORD *)v7 + 30);
      *((_QWORD *)v7 + 30) = v26;

      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "resolvedColorWithTraitCollection:", v23);
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = (void *)*((_QWORD *)v7 + 31);
      *((_QWORD *)v7 + 31) = v29;

      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "resolvedColorWithTraitCollection:", v23);
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = (void *)*((_QWORD *)v7 + 33);
      *((_QWORD *)v7 + 33) = v32;

    }
    else
    {
      v34 = (void *)*((_QWORD *)v7 + 30);
      *((_QWORD *)v7 + 30) = v24;

      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v35 = objc_claimAutoreleasedReturnValue();
      v36 = (void *)*((_QWORD *)v7 + 31);
      *((_QWORD *)v7 + 31) = v35;

      objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      v37 = objc_claimAutoreleasedReturnValue();
      v31 = (void *)*((_QWORD *)v7 + 33);
      *((_QWORD *)v7 + 33) = v37;
    }

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.2, 0.47, 0.96, 1.0);
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = (void *)*((_QWORD *)v7 + 34);
    *((_QWORD *)v7 + 34) = v38;

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.2, 0.47, 0.96, 1.0);
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = (void *)*((_QWORD *)v7 + 35);
    *((_QWORD *)v7 + 35) = v40;

    if ((a4 & 4) != 0)
      objc_msgSend(v6, "userInterfaceIdiom");
    PXEdgeInsetsMake();
    *((_QWORD *)v7 + 55) = v42;
    *((_QWORD *)v7 + 56) = v43;
    *((_QWORD *)v7 + 57) = v44;
    *((_QWORD *)v7 + 58) = v45;
    v46 = objc_msgSend(v6, "userInterfaceStyle");
    v47 = objc_alloc((Class)off_1E50B2470);
    if (v46 == 2)
    {
      v48 = objc_msgSend(v47, "initWithImageName:", CFSTR("PXLeadingChevronWhite"));
      v49 = (void *)*((_QWORD *)v7 + 47);
      *((_QWORD *)v7 + 47) = v48;
      v50 = 0x3FEB333333333333;
    }
    else
    {
      v51 = objc_msgSend(v47, "initWithImageName:", CFSTR("PXLeadingChevron"));
      v49 = (void *)*((_QWORD *)v7 + 47);
      *((_QWORD *)v7 + 47) = v51;
      v50 = 0x3FE199999999999ALL;
    }

    *((_QWORD *)v7 + 45) = v50;
    v52 = objc_msgSend(objc_alloc((Class)off_1E50B2470), "initWithImageName:", CFSTR("PXHeaderGradient"));
    v53 = (void *)*((_QWORD *)v7 + 48);
    *((_QWORD *)v7 + 48) = v52;

    v54 = -[PXCuratedLibrarySectionHeaderLayoutSpec initWithExtendedTraitCollection:options:]([PXCuratedLibrarySectionHeaderLayoutSpec alloc], "initWithExtendedTraitCollection:options:", v6, a4);
    v55 = (void *)*((_QWORD *)v7 + 51);
    *((_QWORD *)v7 + 51) = v54;

    if ((a4 & 4) != 0)
    {
      objc_msgSend(MEMORY[0x1E0DC3520], "grayButtonConfiguration");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      +[PXCuratedLibraryOverlayButtonConfiguration configurationWithSystemImageName:spec:](PXCuratedLibraryOverlayButtonConfiguration, "configurationWithSystemImageName:spec:", CFSTR("arrow.up.arrow.down"), *((_QWORD *)v7 + 51));
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      +[PXCuratedLibraryOverlayButton iconImageSymbolConfigurationFromConfiguration:](PXCuratedLibraryOverlayButton, "iconImageSymbolConfigurationFromConfiguration:", v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("arrow.up.arrow.down"), v58);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "setImage:", v59);

      objc_msgSend(MEMORY[0x1E0DC34D8], "clearConfiguration");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "setBackground:", v60);

      objc_msgSend(v56, "setCornerStyle:", 4);
      objc_msgSend(v56, "setButtonSize:", 2);
      v61 = (void *)*((_QWORD *)v7 + 52);
      *((_QWORD *)v7 + 52) = v56;

    }
  }

  return (PXPhotosSectionHeaderLayoutSpec *)v7;
}

- (UIColor)dividerColor
{
  return self->_dividerColor;
}

- (UIColor)titleColor
{
  return self->_titleColor;
}

- (UIColor)gradientTitleColor
{
  return self->_gradientTitleColor;
}

- (UIColor)subtitleColor
{
  return self->_subtitleColor;
}

- (UIColor)badgeColor
{
  return self->_badgeColor;
}

- (UIColor)buttonColor
{
  return self->_buttonColor;
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (UIFont)subtitleFont
{
  return self->_subtitleFont;
}

- (UIFont)badgeFont
{
  return self->_badgeFont;
}

- (UIFont)buttonFont
{
  return self->_buttonFont;
}

- (double)minimumHeaderContentHeight
{
  return self->_minimumHeaderContentHeight;
}

- (double)titleHorizontalInset
{
  return self->_titleHorizontalInset;
}

- (double)titleSubtitleHorizontalSpacing
{
  return self->_titleSubtitleHorizontalSpacing;
}

- (double)dividerBaselineToTextBaselineSpacing
{
  return self->_dividerBaselineToTextBaselineSpacing;
}

- (double)chevronSpacing
{
  return self->_chevronSpacing;
}

- (CGSize)chevronSize
{
  double width;
  double height;
  CGSize result;

  width = self->_chevronSize.width;
  height = self->_chevronSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)chevronAlpha
{
  return self->_chevronAlpha;
}

- (double)buttonSpacing
{
  return self->_buttonSpacing;
}

- (PXExtendedImageConfiguration)chevronImageConfiguration
{
  return self->_chevronImageConfiguration;
}

- (PXExtendedImageConfiguration)legibilityGradientImageConfiguration
{
  return self->_legibilityGradientImageConfiguration;
}

- (UIEdgeInsets)padding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_padding.top;
  left = self->_padding.left;
  bottom = self->_padding.bottom;
  right = self->_padding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (double)gradientAlpha
{
  return self->_gradientAlpha;
}

- (double)gradientOverhang
{
  return self->_gradientOverhang;
}

- (BOOL)dividerLineVisible
{
  return self->_dividerLineVisible;
}

- (BOOL)minimizeTitleBottomPadding
{
  return self->_minimizeTitleBottomPadding;
}

- (BOOL)titleShouldFadeOnScroll
{
  return self->_titleShouldFadeOnScroll;
}

- (BOOL)filterButtonLayoutForSearch
{
  return self->_filterButtonLayoutForSearch;
}

- (PXCuratedLibrarySectionHeaderLayoutSpec)curatedLibraryHeaderSpec
{
  return self->_curatedLibraryHeaderSpec;
}

- (UIButtonConfiguration)filterButtonConfiguration
{
  return self->_filterButtonConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterButtonConfiguration, 0);
  objc_storeStrong((id *)&self->_curatedLibraryHeaderSpec, 0);
  objc_storeStrong((id *)&self->_legibilityGradientImageConfiguration, 0);
  objc_storeStrong((id *)&self->_chevronImageConfiguration, 0);
  objc_storeStrong((id *)&self->_buttonFont, 0);
  objc_storeStrong((id *)&self->_badgeFont, 0);
  objc_storeStrong((id *)&self->_subtitleFont, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_buttonColor, 0);
  objc_storeStrong((id *)&self->_badgeColor, 0);
  objc_storeStrong((id *)&self->_subtitleColor, 0);
  objc_storeStrong((id *)&self->_gradientTitleColor, 0);
  objc_storeStrong((id *)&self->_titleColor, 0);
  objc_storeStrong((id *)&self->_dividerColor, 0);
}

@end
