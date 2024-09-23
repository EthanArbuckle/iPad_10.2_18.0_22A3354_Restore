@implementation PXDayAssetsSectionHeaderLayoutSpec

- (PXDayAssetsSectionHeaderLayoutSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 variant:(int64_t)a5
{
  PXDayAssetsSectionHeaderLayoutSpec *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  PXDayAssetsSectionHeaderLayoutSpec *v27;
  PXDayAssetsSectionHeaderLayoutSpec *v28;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)PXDayAssetsSectionHeaderLayoutSpec;
  v6 = -[PXCuratedLibrarySectionHeaderLayoutSpec initWithExtendedTraitCollection:options:variant:](&v30, sel_initWithExtendedTraitCollection_options_variant_, a3, a4);
  if (v6)
  {
    +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibrarySectionHeaderLayoutSpec setEllipsisButtonSpecialTreatment:](v6, "setEllipsisButtonSpecialTreatment:", a5 != 0);
    -[PXCuratedLibrarySectionHeaderLayoutSpec setPadding:](v6, "setPadding:", *(double *)off_1E50B8020, *((double *)off_1E50B8020 + 1), *((double *)off_1E50B8020 + 2), *((double *)off_1E50B8020 + 3));
    LODWORD(v8) = *(_DWORD *)off_1E50B8248;
    LODWORD(v9) = *((_DWORD *)off_1E50B8248 + 1);
    LODWORD(v10) = *((_DWORD *)off_1E50B8248 + 2);
    LODWORD(v11) = *((_DWORD *)off_1E50B8248 + 3);
    -[PXCuratedLibrarySectionHeaderLayoutSpec setCornerRadius:](v6, "setCornerRadius:", v8, v9, v10, v11);
    objc_msgSend(off_1E50B5C68, "px_headerTitleSubtitleLabelSpecForZoomLevel:featureSpec:", 3, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibrarySectionHeaderLayoutSpec setTitleSubtitleLabelSpec:](v6, "setTitleSubtitleLabelSpec:", v12);

    -[PXCuratedLibrarySectionHeaderLayoutSpec titleSubtitleLabelSpec](v6, "titleSubtitleLabelSpec");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");
    -[PXCuratedLibrarySectionHeaderLayoutSpec setDebugInterestingTitleSubtitleLabelSpec:](v6, "setDebugInterestingTitleSubtitleLabelSpec:", v14);

    objc_msgSend(MEMORY[0x1E0DC3658], "greenColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibrarySectionHeaderLayoutSpec debugInterestingTitleSubtitleLabelSpec](v6, "debugInterestingTitleSubtitleLabelSpec");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "subtitleLabelSpec");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTextColor:", v15);

    -[PXCuratedLibrarySectionHeaderLayoutSpec debugInterestingTitleSubtitleLabelSpec](v6, "debugInterestingTitleSubtitleLabelSpec");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "subtitleLabelSpec");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setNumberOfLines:", 3);

    -[PXCuratedLibrarySectionHeaderLayoutSpec titleSubtitleLabelSpec](v6, "titleSubtitleLabelSpec");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v20, "copy");
    -[PXCuratedLibrarySectionHeaderLayoutSpec setDebugNonInterestingTitleSubtitleLabelSpec:](v6, "setDebugNonInterestingTitleSubtitleLabelSpec:", v21);

    objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibrarySectionHeaderLayoutSpec debugNonInterestingTitleSubtitleLabelSpec](v6, "debugNonInterestingTitleSubtitleLabelSpec");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "subtitleLabelSpec");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setTextColor:", v22);

    -[PXCuratedLibrarySectionHeaderLayoutSpec debugNonInterestingTitleSubtitleLabelSpec](v6, "debugNonInterestingTitleSubtitleLabelSpec");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "subtitleLabelSpec");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setNumberOfLines:", 3);

    v27 = v6;
    -[PXCuratedLibrarySectionHeaderLayoutSpec setWantsTitle:](v27, "setWantsTitle:", 1);
    v28 = v27;

    -[PXCuratedLibrarySectionHeaderLayoutSpec setWantsSubtitle:](v28, "setWantsSubtitle:", 1);
    -[PXCuratedLibrarySectionHeaderLayoutSpec setShouldAvoidOverlapWithSecondaryToolbar:](v28, "setShouldAvoidOverlapWithSecondaryToolbar:", 1);
    -[PXCuratedLibrarySectionHeaderLayoutSpec curatedLibraryEdgeToEdgeContentDefaultPadding](v28, "curatedLibraryEdgeToEdgeContentDefaultPadding");
    -[PXCuratedLibrarySectionHeaderLayoutSpec setContentPadding:](v28, "setContentPadding:");
    -[PXCuratedLibrarySectionHeaderLayoutSpec setShouldAccommodateLeadingButtonsLayout:](v28, "setShouldAccommodateLeadingButtonsLayout:", 1);
    objc_msgSend(v7, "daysHeaderGradientAlpha");
    -[PXCuratedLibrarySectionHeaderLayoutSpec setGradientAlpha:](v28, "setGradientAlpha:");
    objc_msgSend(v7, "daysHeaderGradientHeight");
    -[PXCuratedLibrarySectionHeaderLayoutSpec setGradientHeight:](v28, "setGradientHeight:");
    -[PXCuratedLibrarySectionHeaderLayoutSpec setGradientRespectsSafeArea:](v28, "setGradientRespectsSafeArea:", 0);
    if (-[PXCuratedLibrarySectionHeaderLayoutSpec ellipsisButtonSpecialTreatment](v28, "ellipsisButtonSpecialTreatment"))
    {
      -[PXCuratedLibrarySectionHeaderLayoutSpec setShouldButtonsFadeOutWhenReachingTop:](v28, "setShouldButtonsFadeOutWhenReachingTop:", 1);
      -[PXCuratedLibrarySectionHeaderLayoutSpec setFadeOutDistance:](v28, "setFadeOutDistance:", 10.0);
      -[PXCuratedLibrarySectionHeaderLayoutSpec setFadeOutDistanceFromSafeAreaTop:](v28, "setFadeOutDistanceFromSafeAreaTop:", 10.0);
      -[PXCuratedLibrarySectionHeaderLayoutSpec setButtonsFadeOutMinimumAlpha:](v28, "setButtonsFadeOutMinimumAlpha:", 0.0);
    }

  }
  return v6;
}

@end
