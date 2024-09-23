@implementation PXYearAssetsSectionHeaderLayoutSpec

- (PXYearAssetsSectionHeaderLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 padding:(UIEdgeInsets)a5 variant:(int64_t)a6
{
  double right;
  double bottom;
  double left;
  double top;
  id v13;
  PXYearAssetsSectionHeaderLayoutSpec *v14;
  void *v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  id v22;
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
  void *v33;
  _BOOL8 v34;
  objc_super v36;

  right = a5.right;
  bottom = a5.bottom;
  left = a5.left;
  top = a5.top;
  v13 = a3;
  v36.receiver = self;
  v36.super_class = (Class)PXYearAssetsSectionHeaderLayoutSpec;
  v14 = -[PXCuratedLibrarySectionHeaderLayoutSpec initWithExtendedTraitCollection:options:variant:](&v36, sel_initWithExtendedTraitCollection_options_variant_, v13, a4, a6);
  if (v14)
  {
    +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v13, "curatedLibraryLayoutStyle");
    -[PXCuratedLibrarySectionHeaderLayoutSpec setEllipsisButtonSpecialTreatment:](v14, "setEllipsisButtonSpecialTreatment:", a6 != 0);
    -[PXYearAssetsSectionHeaderLayoutSpec setPadding:](v14, "setPadding:", top, left, bottom, right);
    objc_msgSend(v15, "cornerRadiusForYears");
    *(float *)&v17 = v17;
    LODWORD(v18) = 0;
    LODWORD(v19) = 0;
    LODWORD(v20) = LODWORD(v17);
    -[PXCuratedLibrarySectionHeaderLayoutSpec setCornerRadius:](v14, "setCornerRadius:", v17, v20, v18, v19);
    objc_msgSend(off_1E50B31F8, "px_headerTitleLabelSpecForZoomLevel:featureSpec:", 1, v14);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_alloc_init((Class)off_1E50B5C68);
    -[PXCuratedLibrarySectionHeaderLayoutSpec setTitleSubtitleLabelSpec:](v14, "setTitleSubtitleLabelSpec:", v22);

    -[PXCuratedLibrarySectionHeaderLayoutSpec titleSubtitleLabelSpec](v14, "titleSubtitleLabelSpec");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setTitleLabelSpec:", v21);

    -[PXCuratedLibrarySectionHeaderLayoutSpec titleSubtitleLabelSpec](v14, "titleSubtitleLabelSpec");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v24, "copy");
    -[PXCuratedLibrarySectionHeaderLayoutSpec setDebugInterestingTitleSubtitleLabelSpec:](v14, "setDebugInterestingTitleSubtitleLabelSpec:", v25);

    objc_msgSend(MEMORY[0x1E0DC3658], "greenColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibrarySectionHeaderLayoutSpec debugInterestingTitleSubtitleLabelSpec](v14, "debugInterestingTitleSubtitleLabelSpec");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "subtitleLabelSpec");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setTextColor:", v26);

    -[PXCuratedLibrarySectionHeaderLayoutSpec titleSubtitleLabelSpec](v14, "titleSubtitleLabelSpec");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v29, "copy");
    -[PXCuratedLibrarySectionHeaderLayoutSpec setDebugNonInterestingTitleSubtitleLabelSpec:](v14, "setDebugNonInterestingTitleSubtitleLabelSpec:", v30);

    objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibrarySectionHeaderLayoutSpec debugNonInterestingTitleSubtitleLabelSpec](v14, "debugNonInterestingTitleSubtitleLabelSpec");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "subtitleLabelSpec");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setTextColor:", v31);

    -[PXCuratedLibrarySectionHeaderLayoutSpec setWantsTitle:](v14, "setWantsTitle:", 1);
    -[PXCuratedLibrarySectionHeaderLayoutSpec setWantsSubtitle:](v14, "setWantsSubtitle:", 0);
    if (-[PXFeatureSpec sizeClass](v14, "sizeClass") == 2)
    {
      -[PXFeatureSpec userInterfaceIdiom](v14, "userInterfaceIdiom");
    }
    else if (-[PXFeatureSpec layoutOrientation](v14, "layoutOrientation") == 2)
    {
      -[PXCuratedLibrarySectionHeaderLayoutSpec setButtonHeight:](v14, "setButtonHeight:", 20.0);
    }
    else
    {
      -[PXFeatureSpec sizeSubclass](v14, "sizeSubclass");
    }
    PXEdgeInsetsMake();
    -[PXCuratedLibrarySectionHeaderLayoutSpec setContentPadding:](v14, "setContentPadding:");
    PXEdgeInsetsMake();
    -[PXCuratedLibrarySectionHeaderLayoutSpec setTitlePadding:](v14, "setTitlePadding:");
    objc_msgSend(v15, "yearsHeaderGradientAlpha");
    -[PXCuratedLibrarySectionHeaderLayoutSpec setGradientAlpha:](v14, "setGradientAlpha:");
    objc_msgSend(v15, "yearsHeaderGradientHeight");
    -[PXCuratedLibrarySectionHeaderLayoutSpec setGradientHeight:](v14, "setGradientHeight:");
    -[PXCuratedLibrarySectionHeaderLayoutSpec setGradientRespectsSafeArea:](v14, "setGradientRespectsSafeArea:", 1);
    v34 = v16 != 1
       && -[PXFeatureSpec sizeClass](v14, "sizeClass") == 1
       && -[PXFeatureSpec layoutOrientation](v14, "layoutOrientation") == 1;
    -[PXCuratedLibrarySectionHeaderLayoutSpec setShouldTextFadeOutWhenReachingTop:](v14, "setShouldTextFadeOutWhenReachingTop:", v34);
    objc_msgSend(v15, "yearsHeadersFadeoutDistance");
    -[PXCuratedLibrarySectionHeaderLayoutSpec setFadeOutDistance:](v14, "setFadeOutDistance:");
    objc_msgSend(v15, "yearsHeadersFadeoutOffset");
    -[PXCuratedLibrarySectionHeaderLayoutSpec setFadeOutDistanceFromSafeAreaTop:](v14, "setFadeOutDistanceFromSafeAreaTop:");
    objc_msgSend(v15, "yearsHeadersFadeoutMinimumAlpha");
    -[PXCuratedLibrarySectionHeaderLayoutSpec setTextFadeOutMinimumAlpha:](v14, "setTextFadeOutMinimumAlpha:");

  }
  return v14;
}

- (void)setPadding:(UIEdgeInsets)a3
{
  self->padding = a3;
}

- (PXYearAssetsSectionHeaderLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 variant:(int64_t)a5
{
  return -[PXYearAssetsSectionHeaderLayoutSpec initWithExtendedTraitCollection:options:padding:variant:](self, "initWithExtendedTraitCollection:options:padding:variant:", a3, a4, a5, *(double *)off_1E50B8020, *((double *)off_1E50B8020 + 1), *((double *)off_1E50B8020 + 2), *((double *)off_1E50B8020 + 3));
}

- (UIEdgeInsets)padding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->padding.top;
  left = self->padding.left;
  bottom = self->padding.bottom;
  right = self->padding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

@end
