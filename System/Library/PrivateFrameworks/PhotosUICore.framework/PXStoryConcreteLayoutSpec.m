@implementation PXStoryConcreteLayoutSpec

- (PXStoryConcreteLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 storyConfigurationOptions:(unint64_t)a5
{
  __int16 v5;
  id v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  PXExploreLayoutMetrics *v19;
  void *v20;
  PXStoryChromeButtonSpec *v21;
  void *v22;
  PXStoryDetailsViewButtonSpec *v23;
  void *v24;
  id v25;
  PXStoryMemoryFeedPlayButtonSpec *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  BOOL v35;
  char v42;
  BOOL v43;
  PXStoryChromeButtonSpec *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  double *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  double *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  double *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  BOOL v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  void *v80;
  double v81;
  double v82;
  void *v83;
  double v84;
  uint64_t v85;
  char v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  void *v95;
  double v96;
  double v97;
  double v98;
  double v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  double *v103;
  double v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  double v111;
  double v112;
  double v113;
  double v114;
  void *v115;
  void *v116;
  void *v117;
  uint64_t v118;
  void *v119;
  uint64_t v120;
  uint64_t v122;
  char v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  void *v127;
  unint64_t v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  __int16 v132;
  void *v133;
  objc_super v134;
  _QWORD v135[3];
  _QWORD v136[5];

  v5 = a5;
  v136[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v134.receiver = self;
  v134.super_class = (Class)PXStoryConcreteLayoutSpec;
  v9 = -[PXFeatureSpec initWithExtendedTraitCollection:options:](&v134, sel_initWithExtendedTraitCollection_options_, v8, a4);
  if (!v9)
    goto LABEL_73;
  v10 = objc_msgSend(v8, "layoutOrientation");
  v11 = objc_msgSend(v8, "layoutOrientation");
  v12 = objc_msgSend(v8, "contentSizeCategory");
  v13 = v5 & 0x81;
  v14 = objc_msgSend(v8, "userInterfaceIdiom");
  v15 = objc_msgSend(v8, "userInterfaceIdiom");
  v16 = objc_msgSend(v8, "layoutSizeClass");
  v130 = objc_msgSend(v8, "userInterfaceIdiom");
  objc_msgSend(v8, "storyChromeLayoutSpec");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v131, "minimumMargins");
  v18 = v17;
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v132 = v5;
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 & 0x2081) == 0)
  {
    v124 = v11;
    v129 = v16;
    v125 = v5 & 0x81;
    *((_QWORD *)v9 + 32) = 0x4034000000000000;
    *((_QWORD *)v9 + 33) = 1;
    *((_QWORD *)v9 + 34) = 0;
    v19 = -[PXExploreLayoutMetrics initWithExtendedTraitCollection:]([PXExploreLayoutMetrics alloc], "initWithExtendedTraitCollection:", v8);
    v20 = (void *)*((_QWORD *)v9 + 35);
    *((_QWORD *)v9 + 35) = v19;

    objc_msgSend(*((id *)v9 + 35), "setInteritemSpacing:", 10.0);
    objc_msgSend(*((id *)v9 + 35), "setAllowHeaders:", 0);
    objc_msgSend(*((id *)v9 + 35), "setBuildingBlockAspectRatio:", 0.666666667);
    objc_msgSend(v8, "safeAreaInsets");
    objc_msgSend(*((id *)v9 + 35), "setSafeAreaInsets:");
    *((_QWORD *)v9 + 36) = 0x4024000000000000;
    v9[237] = 1;
    v21 = -[PXStoryChromeButtonSpec initWithExtendedTraitCollection:]([PXStoryChromeButtonSpec alloc], "initWithExtendedTraitCollection:", v8);
    v22 = (void *)*((_QWORD *)v9 + 40);
    *((_QWORD *)v9 + 40) = v21;

    v23 = -[PXStoryChromeButtonSpec initWithExtendedTraitCollection:]([PXStoryDetailsViewButtonSpec alloc], "initWithExtendedTraitCollection:", v8);
    v24 = (void *)*((_QWORD *)v9 + 42);
    *((_QWORD *)v9 + 42) = v23;

    *((_OWORD *)v9 + 29) = xmmword_1A7C0C260;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = v8;
      v9[232] = objc_msgSend(v25, "isFullscreen");
      if (objc_msgSend(v25, "isFullscreen"))
      {
        v9[237] = 0;
        v26 = -[PXStoryChromeButtonSpec initWithExtendedTraitCollection:]([PXStoryMemoryFeedPlayButtonSpec alloc], "initWithExtendedTraitCollection:", v25);
        v27 = (void *)*((_QWORD *)v9 + 41);
        *((_QWORD *)v9 + 41) = v26;

        *((_OWORD *)v9 + 28) = xmmword_1A7BC0FE0;
        objc_msgSend(v25, "bottomTitleContentOffset");
        v29 = v28 + *((double *)v9 + 57) * 2.0;
        objc_msgSend(*((id *)v9 + 40), "defaultImageSize");
        *((double *)v9 + 53) = v29 + v30;
      }

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v31 = v8;
      objc_msgSend(v31, "viewportCornerRadius");
      *((_QWORD *)v9 + 37) = v32;
      objc_msgSend(v31, "viewportShadow");
      v33 = objc_claimAutoreleasedReturnValue();

      v34 = (void *)*((_QWORD *)v9 + 38);
      *((_QWORD *)v9 + 38) = v33;

    }
    else
    {
      *((_QWORD *)v9 + 37) = 0x402E000000000000;
    }
    v35 = v15 != 4;
    __asm { FMOV            V0.2D, #12.0 }
    *((_OWORD *)v9 + 27) = _Q0;
    *((_QWORD *)v9 + 39) = 0x4028000000000000;
    __asm { FMOV            V1.2D, #-10.0 }
    *((float64x2_t *)v9 + 27) = vaddq_f64(*((float64x2_t *)v9 + 27), _Q1);
    *((double *)v9 + 39) = *((double *)v9 + 39) + -21.0;
    if (_ZF)
      v42 = 0;
    else
      v42 = 1;
    if (_ZF)
      v35 = 0;
    v9[233] = v35;
    v9[234] = objc_msgSend(v133, "wantsFullscreenFeedExperience") ^ 1;
    v9[236] = v42;
    v123 = v42;
    v43 = v15 == 4 || v9[234] == 0;
    v128 = v12 - 8;
    v9[235] = v43;
    v44 = -[PXStoryChromeButtonSpec initWithExtendedTraitCollection:]([PXStoryChromeButtonSpec alloc], "initWithExtendedTraitCollection:", v8);
    v45 = (void *)*((_QWORD *)v9 + 44);
    *((_QWORD *)v9 + 44) = v44;

    PXFontWithTextStyleAndWeight();
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    PXFontWithTextStyleAndWeight();
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = (void *)MEMORY[0x1E0DC1290];
    v48 = v46;
    objc_msgSend(v47, "defaultParagraphStyle");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = (void *)objc_msgSend(v49, "mutableCopy");

    objc_msgSend(v50, "setAlignment:", 1);
    objc_msgSend(v50, "setLineBreakMode:", 0);
    v135[0] = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v136[0] = v51;
    v135[1] = *MEMORY[0x1E0DC1178];
    v52 = (void *)objc_msgSend(v50, "copy");
    v135[2] = *MEMORY[0x1E0DC1138];
    v136[1] = v52;
    v136[2] = v48;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v136, v135, 3);
    v53 = objc_claimAutoreleasedReturnValue();
    v126 = v48;

    v54 = (void *)*((_QWORD *)v9 + 46);
    *((_QWORD *)v9 + 46) = v53;

    *((_QWORD *)v9 + 48) = objc_msgSend(v8, "layoutDirection");
    v9[240] = (v132 & 0x10) == 0;
    v55 = (double *)(v9 + 512);
    PXEdgeInsetsMake();
    *((_QWORD *)v9 + 64) = v56;
    *((_QWORD *)v9 + 65) = v57;
    *((_QWORD *)v9 + 66) = v58;
    *((_QWORD *)v9 + 67) = v59;
    v60 = (double *)(v9 + 544);
    PXEdgeInsetsMake();
    *((_QWORD *)v9 + 68) = v61;
    *((_QWORD *)v9 + 69) = v62;
    *((_QWORD *)v9 + 70) = v63;
    v64 = (double *)(v9 + 560);
    *((_QWORD *)v9 + 71) = v65;
    PXEdgeInsetsMake();
    *((_QWORD *)v9 + 72) = v69;
    *((_QWORD *)v9 + 73) = v70;
    v71 = v129 == 1 && v10 == 2;
    *((_QWORD *)v9 + 74) = v67;
    *((_QWORD *)v9 + 75) = v68;
    if (v71 || v130 == 5)
    {
      v88 = 24.0;
      if (v130 != 5)
        v88 = 28.0;
      objc_msgSend(v8, "safeAreaInsets", *(_QWORD *)&v88, v66);
      *v55 = *v55 + *(double *)&v122 + v89;
      *((double *)v9 + 67) = *(double *)&v122 + *((double *)v9 + 67);
      *(float64x2_t *)(v9 + 520) = vaddq_f64((float64x2_t)vdupq_lane_s64(v122, 0), *(float64x2_t *)(v9 + 520));
      *((double *)v9 + 74) = *((double *)v9 + 74) + 14.0;
      v85 = v15;
      v86 = v123;
      if ((v132 & 0x10) == 0)
        goto LABEL_32;
      objc_msgSend(v8, "safeAreaInsets");
    }
    else
    {
      objc_msgSend(v8, "safeAreaInsets");
      *v55 = *v55 + v72 + 8.0;
      objc_msgSend(v8, "safeAreaInsets");
      *((double *)v9 + 66) = *((double *)v9 + 66) + v73;
      objc_msgSend(v8, "safeAreaInsets");
      *v60 = *v60 + v74;
      if (v9[240])
      {
        objc_msgSend(v48, "lineHeight");
        v76 = v75 + 8.0;
        objc_msgSend(v127, "lineHeight");
        *v60 = *v60 + v76 + v77;
      }
      objc_msgSend(v8, "safeAreaInsets");
      v79 = v78 + 12.0;
      PXCappedFontWithTextStyleAndWeight();
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "lineHeight");
      v82 = v79 + v81;
      PXCappedFontWithTextStyleAndWeight();
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "lineHeight");
      *v64 = *v64 + v82 + v84 * 2.0;

      *((double *)v9 + 74) = *((double *)v9 + 74) + 8.0;
      v85 = v15;
      v86 = v123;
      if (v128 >= 5)
        goto LABEL_32;
      v87 = 60.0;
      v60 = (double *)(v9 + 560);
    }
    *v60 = *v60 + v87;
LABEL_32:
    v90 = *((double *)v9 + 66);
    if (v90 < 24.0)
    {
      v91 = 24.0 - v90;
      *v64 = v91 + *v64;
      *((double *)v9 + 66) = v91 + *((double *)v9 + 66);
    }
    v9[238] = (v132 & 0x10) == 0;
    v9[239] = v86;
    v92 = 0.0;
    if (v130 != 5)
      v92 = 12.0;
    v16 = v129;
    if (v10 == 2)
    {
      v93 = *((double *)v9 + 65);
      v94 = 10.0;
    }
    else
    {
      v93 = 16.0;
      if (v129 != 1)
        v93 = 20.0;
      v94 = 8.0;
    }
    *((double *)v9 + 43) = v93 - v92;
    *((double *)v9 + 45) = v94;
    *((_QWORD *)v9 + 47) = 0x403C000000000000;
    objc_msgSend(v133, "scrubberLayoutSettings");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v124;
    v96 = 40.0;
    if (v124 != 1)
      v96 = 26.0;
    if (v85 == 4)
      v97 = 20.0;
    else
      v97 = v96;
    if (v128 > 4)
    {
      v99 = 44.0;
    }
    else
    {
      PXSizeScale();
      PXSizeRound();
      v99 = v98;
    }
    if (v14 == 3)
    {
      objc_msgSend(v95, "scrubberHeightPortrait");
      v101 = v100;
      objc_msgSend(v95, "defaultAssetWidthPortrait");
      *((_QWORD *)v9 + 60) = v102;
      *((_QWORD *)v9 + 61) = v101;
      v103 = (double *)(v9 + 392);
      *((double *)v9 + 49) = fmax(v18, 122.0);
      v104 = 66.0;
    }
    else
    {
      if (v124 != 1 || v85 == 4)
      {
        objc_msgSend(v95, "scrubberHeightLandscape");
        v109 = v108;
        objc_msgSend(v95, "currentAssetWidthLandscape");
        *((_QWORD *)v9 + 60) = v110;
        *((_QWORD *)v9 + 61) = v109;
      }
      else
      {
        objc_msgSend(v95, "scrubberHeightPortrait");
        v106 = v105;
        objc_msgSend(v95, "currentAssetWidthPortrait");
        *((_QWORD *)v9 + 60) = v107;
        *((_QWORD *)v9 + 61) = v106;
        v97 = v97 + v99 + 27.0;
      }
      v103 = (double *)(v9 + 392);
      if (v97 >= v18)
        v111 = v97;
      else
        v111 = v18;
      *v103 = v111;
      v104 = *((double *)v9 + 61);
      v16 = v129;
    }
    *((double *)v9 + 62) = v104;
    *((double *)v9 + 63) = v104;
    *((double *)v9 + 50) = *v103 + v104 * 0.5;

    v13 = v125;
  }
  if (v16 == 1)
    v112 = dbl_1A7C0C270[v11 == 1];
  else
    v112 = 0.14;
  objc_msgSend(v8, "layoutReferenceSize");
  v114 = round(v112 * v113);
  *((double *)v9 + 51) = v114;
  if (!v13)
    v114 = *((double *)v9 + 49) + *((double *)v9 + 61) + 20.0;
  *((double *)v9 + 52) = v114;
  if ((v132 & 0x10) != 0
    && (objc_msgSend(v8, "traitCollection"), v115 = (void *)objc_claimAutoreleasedReturnValue(),
                                             v115,
                                             v115))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "traitCollection");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "resolvedColorWithTraitCollection:", v117);
    v118 = objc_claimAutoreleasedReturnValue();
    v119 = (void *)*((_QWORD *)v9 + 31);
    *((_QWORD *)v9 + 31) = v118;

  }
  else
  {
    if ((v132 & 0x4000) != 0)
      objc_msgSend(MEMORY[0x1E0DC3658], "px_placeholderBackgroundColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v120 = objc_claimAutoreleasedReturnValue();
    v116 = (void *)*((_QWORD *)v9 + 31);
    *((_QWORD *)v9 + 31) = v120;
  }

LABEL_73:
  return (PXStoryConcreteLayoutSpec *)v9;
}

- (PXStoryConcreteLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  return -[PXStoryConcreteLayoutSpec initWithExtendedTraitCollection:options:storyConfigurationOptions:](self, "initWithExtendedTraitCollection:options:storyConfigurationOptions:", a3, a4, 0);
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (double)interpageSpacing
{
  return self->_interpageSpacing;
}

- (int64_t)scrollDecelerationRate
{
  return self->_scrollDecelerationRate;
}

- (int64_t)browserGridScrollDecelerationRate
{
  return self->_browserGridScrollDecelerationRate;
}

- (PXExploreLayoutMetrics)browserGridLayoutMetrics
{
  return self->_browserGridLayoutMetrics;
}

- (double)browserGridCellCornersRadius
{
  return self->_browserGridCellCornersRadius;
}

- (double)thumbnailCornerRadius
{
  return self->_thumbnailCornerRadius;
}

- (NSShadow)thumbnailShadow
{
  return self->_thumbnailShadow;
}

- (CGSize)thumbnailChromePadding
{
  double width;
  double height;
  CGSize result;

  width = self->_thumbnailChromePadding.width;
  height = self->_thumbnailChromePadding.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)thumbnailChromeButtonSpacing
{
  return self->_thumbnailChromeButtonSpacing;
}

- (PXStoryChromeButtonSpec)thumbnailChromeButtonSpec
{
  return self->_thumbnailChromeButtonSpec;
}

- (PXStoryChromeButtonSpec)thumbnailChromePlayButtonSpec
{
  return self->_thumbnailChromePlayButtonSpec;
}

- (BOOL)thumbnailChromeShowsPlayButton
{
  return self->_thumbnailChromeShowsPlayButton;
}

- (CGSize)thumbnailPlayButtonPadding
{
  double width;
  double height;
  CGSize result;

  width = self->_thumbnailPlayButtonPadding.width;
  height = self->_thumbnailPlayButtonPadding.height;
  result.height = height;
  result.width = width;
  return result;
}

- (PXStoryDetailsViewButtonSpec)thumbnailChromeDetailsViewButtonSpec
{
  return self->_thumbnailChromeDetailsViewButtonSpec;
}

- (CGSize)thumbnailChromeDetailsViewButtonPadding
{
  double width;
  double height;
  CGSize result;

  width = self->_thumbnailChromeDetailsViewButtonPadding.width;
  height = self->_thumbnailChromeDetailsViewButtonPadding.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)thumbnailChromeShowsActionMenuButton
{
  return self->_thumbnailChromeShowsActionMenuButton;
}

- (BOOL)thumbnailChromeShowsFavoriteButton
{
  return self->_thumbnailChromeShowsFavoriteButton;
}

- (BOOL)thumbnailMenuIncludesFavoriteAction
{
  return self->_thumbnailMenuIncludesFavoriteAction;
}

- (BOOL)thumbnailMenuIncludesFeatureLessAction
{
  return self->_thumbnailMenuIncludesFeatureLessAction;
}

- (BOOL)canScaleWhenPressed
{
  return self->_canScaleWhenPressed;
}

- (BOOL)styleSwitcherShowsRestartButton
{
  return self->_styleSwitcherShowsRestartButton;
}

- (BOOL)styleSwitcherWantsChromeButtonsTitleCenterAligned
{
  return self->_styleSwitcherWantsChromeButtonsTitleCenterAligned;
}

- (double)styleSwitcherChromeButtonHorizontalMargin
{
  return self->_styleSwitcherChromeButtonHorizontalMargin;
}

- (PXStoryChromeButtonSpec)styleSwitcherChromeButtonSpec
{
  return self->_styleSwitcherChromeButtonSpec;
}

- (UIEdgeInsets)styleSwitcherChromeInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_styleSwitcherChromeInset.top;
  left = self->_styleSwitcherChromeInset.left;
  bottom = self->_styleSwitcherChromeInset.bottom;
  right = self->_styleSwitcherChromeInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIEdgeInsets)styleSwitcherViewportInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_styleSwitcherViewportInset.top;
  left = self->_styleSwitcherViewportInset.left;
  bottom = self->_styleSwitcherViewportInset.bottom;
  right = self->_styleSwitcherViewportInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (double)styleSwitcherViewportSpacing
{
  return self->_styleSwitcherViewportSpacing;
}

- (NSDictionary)styleSwitcherTitleAttributes
{
  return self->_styleSwitcherTitleAttributes;
}

- (BOOL)styleSwitcherShowsTitle
{
  return self->_styleSwitcherShowsTitle;
}

- (double)styleSwitcherPageControlHeight
{
  return self->_styleSwitcherPageControlHeight;
}

- (UIEdgeInsets)styleSwitcherPageControlInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_styleSwitcherPageControlInset.top;
  left = self->_styleSwitcherPageControlInset.left;
  bottom = self->_styleSwitcherPageControlInset.bottom;
  right = self->_styleSwitcherPageControlInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (int64_t)styleSwitcherLayoutDirection
{
  return self->_styleSwitcherLayoutDirection;
}

- (CGSize)scrubberCurrentAssetSize
{
  double width;
  double height;
  CGSize result;

  width = self->_scrubberCurrentAssetSize.width;
  height = self->_scrubberCurrentAssetSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)scrubberVerticalPadding
{
  return self->_scrubberVerticalPadding;
}

- (CGSize)bufferingIndicatorSize
{
  double width;
  double height;
  CGSize result;

  width = self->_bufferingIndicatorSize.width;
  height = self->_bufferingIndicatorSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)distanceBetweenBufferingIndicatorCenterAndBottom
{
  return self->_distanceBetweenBufferingIndicatorCenterAndBottom;
}

- (double)distanceBetweenChapterTitleBaselineAndBottomWithoutChrome
{
  return self->_distanceBetweenChapterTitleBaselineAndBottomWithoutChrome;
}

- (double)distanceBetweenChapterTitleBaselineAndBottomWithChrome
{
  return self->_distanceBetweenChapterTitleBaselineAndBottomWithChrome;
}

- (double)bottomTitleContentOffset
{
  return self->_bottomTitleContentOffset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_styleSwitcherTitleAttributes, 0);
  objc_storeStrong((id *)&self->_styleSwitcherChromeButtonSpec, 0);
  objc_storeStrong((id *)&self->_thumbnailChromeDetailsViewButtonSpec, 0);
  objc_storeStrong((id *)&self->_thumbnailChromePlayButtonSpec, 0);
  objc_storeStrong((id *)&self->_thumbnailChromeButtonSpec, 0);
  objc_storeStrong((id *)&self->_thumbnailShadow, 0);
  objc_storeStrong((id *)&self->_browserGridLayoutMetrics, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end
