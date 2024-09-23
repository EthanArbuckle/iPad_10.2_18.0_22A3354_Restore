@implementation PXMonthsAssetsSectionHeaderLayoutSpec

- (PXMonthsAssetsSectionHeaderLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 padding:(UIEdgeInsets)a5 variant:(int64_t)a6
{
  double right;
  double bottom;
  double left;
  double top;
  id v13;
  PXMonthsAssetsSectionHeaderLayoutSpec *v14;
  void *v15;
  uint64_t v16;
  _BOOL4 v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  void *v37;
  char v38;
  uint64_t v39;
  void *v40;
  void *v41;
  PXCuratedLibraryChapterHeaderLayoutSpec *v42;
  uint64_t v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  void *v59;
  double v60;
  void *v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  PXMonthsAssetsSectionHeaderLayoutSpec *v70;
  PXMonthsAssetsSectionHeaderLayoutSpec *v71;
  double v73;
  int64_t v74;
  objc_super v75;

  right = a5.right;
  bottom = a5.bottom;
  left = a5.left;
  top = a5.top;
  v13 = a3;
  v75.receiver = self;
  v75.super_class = (Class)PXMonthsAssetsSectionHeaderLayoutSpec;
  v14 = -[PXCuratedLibrarySectionHeaderLayoutSpec initWithExtendedTraitCollection:options:variant:](&v75, sel_initWithExtendedTraitCollection_options_variant_, v13, a4, a6);
  if (!v14)
    goto LABEL_30;
  +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v13, "curatedLibraryLayoutStyle");
  v17 = (a4 & 0x400) == 0;
  v74 = a6;
  -[PXCuratedLibrarySectionHeaderLayoutSpec setEllipsisButtonSpecialTreatment:](v14, "setEllipsisButtonSpecialTreatment:", a6 != 0);
  -[PXCuratedLibrarySectionHeaderLayoutSpec setCanShowEllipsisButton:](v14, "setCanShowEllipsisButton:", v16 != 1);
  -[PXMonthsAssetsSectionHeaderLayoutSpec adjustedContentPadding:](v14, "adjustedContentPadding:", top, left, bottom, right);
  -[PXCuratedLibrarySectionHeaderLayoutSpec setPadding:](v14, "setPadding:");
  LODWORD(v18) = 10.0;
  LODWORD(v19) = 10.0;
  LODWORD(v20) = 0;
  LODWORD(v21) = 0;
  -[PXCuratedLibrarySectionHeaderLayoutSpec setCornerRadius:](v14, "setCornerRadius:", v18, v19, v20, v21);
  objc_msgSend(off_1E50B5C68, "px_headerTitleSubtitleLabelSpecForZoomLevel:featureSpec:", 2, v14);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibrarySectionHeaderLayoutSpec setTitleSubtitleLabelSpec:](v14, "setTitleSubtitleLabelSpec:", v22);

  -[PXCuratedLibrarySectionHeaderLayoutSpec titleSubtitleLabelSpec](v14, "titleSubtitleLabelSpec");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v23, "copy");
  -[PXCuratedLibrarySectionHeaderLayoutSpec setDebugInterestingTitleSubtitleLabelSpec:](v14, "setDebugInterestingTitleSubtitleLabelSpec:", v24);

  objc_msgSend(MEMORY[0x1E0DC3658], "greenColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibrarySectionHeaderLayoutSpec debugInterestingTitleSubtitleLabelSpec](v14, "debugInterestingTitleSubtitleLabelSpec");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "subtitleLabelSpec");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setTextColor:", v25);

  -[PXCuratedLibrarySectionHeaderLayoutSpec titleSubtitleLabelSpec](v14, "titleSubtitleLabelSpec");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v28, "copy");
  -[PXCuratedLibrarySectionHeaderLayoutSpec setDebugNonInterestingTitleSubtitleLabelSpec:](v14, "setDebugNonInterestingTitleSubtitleLabelSpec:", v29);

  objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibrarySectionHeaderLayoutSpec debugNonInterestingTitleSubtitleLabelSpec](v14, "debugNonInterestingTitleSubtitleLabelSpec");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "subtitleLabelSpec");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setTextColor:", v30);

  v33 = PXCuratedLibraryHeaderWantsTitleForZoomLevel(2uLL, v14);
  v34 = PXCuratedLibraryHeaderWantsSubtitleForZoomLevel(2uLL, v14);
  if (v16 == 1)
  {
    v17 = 0;
    +[PXLemonadeSettings sharedInstance](PXLemonadeSettings, "sharedInstance");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "enableMonthLocationTitles");

    if ((v38 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_alloc_init(MEMORY[0x1E0CB3578]);
      objc_msgSend(MEMORY[0x1E0CB3578], "dateFormatFromTemplate:options:locale:", CFSTR("d"), 0, v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setDateFormat:", v41);

      v35 = 0;
      v39 = 0;
      goto LABEL_9;
    }
    v36 = 0;
    v35 = 0;
  }
  else
  {
    v35 = objc_msgSend(v15, "allowsCustomDateTitles");
    v36 = 0;
  }
  v39 = 1;
LABEL_9:
  -[PXCuratedLibrarySectionHeaderLayoutSpec setWantsTitle:](v14, "setWantsTitle:", v33);
  -[PXCuratedLibrarySectionHeaderLayoutSpec setWantsSubtitle:](v14, "setWantsSubtitle:", v34);
  -[PXCuratedLibrarySectionHeaderLayoutSpec setSwapTitleWithSubtitle:](v14, "setSwapTitleWithSubtitle:", v39);
  -[PXCuratedLibrarySectionHeaderLayoutSpec setTitleDateFormatter:](v14, "setTitleDateFormatter:", v36);
  -[PXCuratedLibrarySectionHeaderLayoutSpec setShouldOmitYear:](v14, "setShouldOmitYear:", v35);
  v42 = -[PXCuratedLibraryChapterHeaderLayoutSpec initWithExtendedTraitCollection:options:]([PXCuratedLibraryChapterHeaderLayoutSpec alloc], "initWithExtendedTraitCollection:options:", v13, a4 | 0x800);
  v43 = -[PXCuratedLibraryChapterHeaderLayoutSpec shouldFloat](v42, "shouldFloat");
  -[PXCuratedLibrarySectionHeaderLayoutSpec setShouldTextFadeOutWhenReachingTop:](v14, "setShouldTextFadeOutWhenReachingTop:", v43);
  -[PXCuratedLibrarySectionHeaderLayoutSpec setShouldButtonsFadeOutWhenReachingTop:](v14, "setShouldButtonsFadeOutWhenReachingTop:", v43);
  -[PXCuratedLibraryChapterHeaderLayoutSpec titleHeight](v42, "titleHeight");
  v45 = v44;
  objc_msgSend(v15, "monthsInlineHeadersFadeoutDistance");
  -[PXCuratedLibrarySectionHeaderLayoutSpec setFadeOutDistance:](v14, "setFadeOutDistance:", v45 * v46);
  -[PXCuratedLibraryChapterHeaderLayoutSpec floatingDistanceFromSafeAreaTop](v42, "floatingDistanceFromSafeAreaTop");
  v48 = v47;
  -[PXCuratedLibraryChapterHeaderLayoutSpec titleHeight](v42, "titleHeight");
  v50 = v49;
  objc_msgSend(v15, "monthsInlineHeadersFadeoutOffset");
  v52 = v48 + v50 * (v51 + 1.0);
  -[PXCuratedLibraryChapterHeaderLayoutSpec spacingBetweenTitleBottomAndNextCardTop](v42, "spacingBetweenTitleBottomAndNextCardTop");
  v54 = v53 + v52;
  -[PXCuratedLibrarySectionHeaderLayoutSpec fadeOutDistance](v14, "fadeOutDistance");
  -[PXCuratedLibrarySectionHeaderLayoutSpec setFadeOutDistanceFromSafeAreaTop:](v14, "setFadeOutDistanceFromSafeAreaTop:", v54 - v55);
  objc_msgSend(v15, "monthsInlineHeadersFadeoutMinimumAlpha");
  -[PXCuratedLibrarySectionHeaderLayoutSpec setTextFadeOutMinimumAlpha:](v14, "setTextFadeOutMinimumAlpha:");
  if (-[PXCuratedLibrarySectionHeaderLayoutSpec ellipsisButtonSpecialTreatment](v14, "ellipsisButtonSpecialTreatment"))
    -[PXCuratedLibrarySectionHeaderLayoutSpec setButtonsFadeOutMinimumAlpha:](v14, "setButtonsFadeOutMinimumAlpha:", 0.0);
  v73 = top;
  if (-[PXFeatureSpec sizeClass](v14, "sizeClass") == 1
    && -[PXFeatureSpec layoutOrientation](v14, "layoutOrientation") == 2)
  {
    v56 = bottom;
    v57 = right;
    -[PXCuratedLibrarySectionHeaderLayoutSpec titleSubtitleLabelSpec](v14, "titleSubtitleLabelSpec");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v58;
    v60 = 16.5;
    if (v17)
      v60 = 21.0;
    objc_msgSend(v58, "setDistanceBetweenTitleBaselineAndSubtitleBaseline:", v60);

    -[PXCuratedLibrarySectionHeaderLayoutSpec setButtonHeight:](v14, "setButtonHeight:", 20.0);
  }
  else if (v17)
  {
    if (-[PXFeatureSpec sizeClass](v14, "sizeClass") == 2)
    {
      v56 = bottom;
      v57 = right;
      -[PXFeatureSpec userInterfaceIdiom](v14, "userInterfaceIdiom");
    }
    else
    {
      v56 = bottom;
      v57 = right;
      if (-[PXFeatureSpec sizeClass](v14, "sizeClass") == 1)
        -[PXFeatureSpec sizeSubclass](v14, "sizeSubclass");
    }
  }
  else
  {
    v56 = bottom;
    v57 = right;
    -[PXFeatureSpec userInterfaceIdiom](v14, "userInterfaceIdiom");
    -[PXCuratedLibrarySectionHeaderLayoutSpec titleSubtitleLabelSpec](v14, "titleSubtitleLabelSpec");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setDistanceBetweenTitleBaselineAndSubtitleBaseline:", 19.0);

  }
  PXEdgeInsetsMake();
  v63 = v62;
  v65 = v64;
  v67 = v66;
  v69 = v68;
  if ((a4 & 8) != 0)
    -[PXCuratedLibraryChapterHeaderLayoutSpec titleHeight](v42, "titleHeight");
  -[PXCuratedLibrarySectionHeaderLayoutSpec setContentPadding:](v14, "setContentPadding:", v63, v65, v67, v69);
  PXEdgeInsetsMake();
  -[PXCuratedLibrarySectionHeaderLayoutSpec setTitlePadding:](v14, "setTitlePadding:");
  objc_msgSend(v15, "monthsHeaderGradientAlpha");
  -[PXCuratedLibrarySectionHeaderLayoutSpec setGradientAlpha:](v14, "setGradientAlpha:");
  if (v17)
    objc_msgSend(v15, "monthsHeaderGradientHeight");
  else
    objc_msgSend(v15, "monthsSmallHeaderGradientHeight");
  -[PXCuratedLibrarySectionHeaderLayoutSpec setGradientHeight:](v14, "setGradientHeight:");
  -[PXCuratedLibrarySectionHeaderLayoutSpec setGradientRespectsSafeArea:](v14, "setGradientRespectsSafeArea:", 1);
  if (v17)
  {
    v70 = -[PXMonthsAssetsSectionHeaderLayoutSpec initWithExtendedTraitCollection:options:padding:variant:]([PXMonthsAssetsSectionHeaderLayoutSpec alloc], "initWithExtendedTraitCollection:options:padding:variant:", v13, a4 | 0x400, v74, v73, left, v56, v57);
    -[PXCuratedLibrarySectionHeaderLayoutSpec setSmallVariantSpec:](v14, "setSmallVariantSpec:", v70);

  }
  if ((a4 & 8) == 0)
  {
    v71 = -[PXMonthsAssetsSectionHeaderLayoutSpec initWithExtendedTraitCollection:options:padding:variant:]([PXMonthsAssetsSectionHeaderLayoutSpec alloc], "initWithExtendedTraitCollection:options:padding:variant:", v13, a4 | 8, v74, v73, left, v56, v57);
    -[PXCuratedLibrarySectionHeaderLayoutSpec setFirstCardVariantSpec:](v14, "setFirstCardVariantSpec:", v71);

  }
LABEL_30:

  return v14;
}

- (UIEdgeInsets)adjustedContentPadding:(UIEdgeInsets)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  int64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  objc_super v18;
  UIEdgeInsets result;

  v18.receiver = self;
  v18.super_class = (Class)PXMonthsAssetsSectionHeaderLayoutSpec;
  -[PXCuratedLibrarySectionHeaderLayoutSpec adjustedContentPadding:](&v18, sel_adjustedContentPadding_, a3.top, a3.left, a3.bottom, a3.right);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  if (-[PXCuratedLibrarySectionHeaderLayoutSpec ellipsisButtonSpecialTreatment](self, "ellipsisButtonSpecialTreatment"))
  {
    +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "alignActionButtonsTrailingEdges"))
    {
      v13 = -[PXFeatureSpec layoutOrientation](self, "layoutOrientation");

      if (v13 == 1)
        v11 = v11 + -14.0;
    }
    else
    {

    }
  }
  v14 = v5;
  v15 = v7;
  v16 = v9;
  v17 = v11;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (PXMonthsAssetsSectionHeaderLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4
{
  return -[PXMonthsAssetsSectionHeaderLayoutSpec initWithExtendedTraitCollection:options:padding:variant:](self, "initWithExtendedTraitCollection:options:padding:variant:", a3, a4, 0, *(double *)off_1E50B8020, *((double *)off_1E50B8020 + 1), *((double *)off_1E50B8020 + 2), *((double *)off_1E50B8020 + 3));
}

- (PXMonthsAssetsSectionHeaderLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 variant:(int64_t)a5
{
  return -[PXMonthsAssetsSectionHeaderLayoutSpec initWithExtendedTraitCollection:options:padding:variant:](self, "initWithExtendedTraitCollection:options:padding:variant:", a3, a4, a5, *(double *)off_1E50B8020, *((double *)off_1E50B8020 + 1), *((double *)off_1E50B8020 + 2), *((double *)off_1E50B8020 + 3));
}

- (BOOL)wantsInlineHeader
{
  return 0;
}

- (unint64_t)inlineHeaderStyle
{
  return 0;
}

@end
