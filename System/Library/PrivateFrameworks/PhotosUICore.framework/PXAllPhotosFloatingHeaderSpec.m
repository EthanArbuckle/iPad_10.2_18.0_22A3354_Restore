@implementation PXAllPhotosFloatingHeaderSpec

- (PXAllPhotosFloatingHeaderSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 variant:(int64_t)a5
{
  id v8;
  PXAllPhotosFloatingHeaderSpec *v9;
  unint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
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
  PXAllPhotosFloatingHeaderSpec *v27;
  PXAllPhotosFloatingHeaderSpec *v28;
  _BOOL8 v30;
  void *v31;
  objc_super v33;

  v8 = a3;
  v33.receiver = self;
  v33.super_class = (Class)PXAllPhotosFloatingHeaderSpec;
  v9 = -[PXCuratedLibrarySectionHeaderLayoutSpec initWithExtendedTraitCollection:options:variant:](&v33, sel_initWithExtendedTraitCollection_options_variant_, v8, a4, a5);
  if (v9)
  {
    v10 = objc_msgSend(v8, "contentSizeCategory") - 8;
    v11 = objc_msgSend(v8, "layoutSizeClass");
    -[PXCuratedLibrarySectionHeaderLayoutSpec setIsFloating:](v9, "setIsFloating:", 1);
    -[PXCuratedLibrarySectionHeaderLayoutSpec setEllipsisButtonSpecialTreatment:](v9, "setEllipsisButtonSpecialTreatment:", a5 != 0);
    -[PXCuratedLibrarySectionHeaderLayoutSpec setPadding:](v9, "setPadding:", *(double *)off_1E50B8020, *((double *)off_1E50B8020 + 1), *((double *)off_1E50B8020 + 2), *((double *)off_1E50B8020 + 3));
    LODWORD(v12) = *(_DWORD *)off_1E50B8248;
    LODWORD(v13) = *((_DWORD *)off_1E50B8248 + 1);
    LODWORD(v14) = *((_DWORD *)off_1E50B8248 + 2);
    LODWORD(v15) = *((_DWORD *)off_1E50B8248 + 3);
    -[PXCuratedLibrarySectionHeaderLayoutSpec setCornerRadius:](v9, "setCornerRadius:", v12, v13, v14, v15);
    -[PXCuratedLibrarySectionHeaderLayoutSpec setCanShowZoomButtons:](v9, "setCanShowZoomButtons:", 1);
    -[PXCuratedLibrarySectionHeaderLayoutSpec setCanShowAspectFitButtons:](v9, "setCanShowAspectFitButtons:", objc_msgSend(v8, "userInterfaceIdiom") != 1);
    objc_msgSend(off_1E50B5C68, "px_headerTitleSubtitleLabelSpecForZoomLevel:featureSpec:", 4, v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibrarySectionHeaderLayoutSpec setTitleSubtitleLabelSpec:](v9, "setTitleSubtitleLabelSpec:", v16);

    -[PXCuratedLibrarySectionHeaderLayoutSpec titleSubtitleLabelSpec](v9, "titleSubtitleLabelSpec");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "copy");
    -[PXCuratedLibrarySectionHeaderLayoutSpec setDebugInterestingTitleSubtitleLabelSpec:](v9, "setDebugInterestingTitleSubtitleLabelSpec:", v18);

    objc_msgSend(MEMORY[0x1E0DC3658], "greenColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibrarySectionHeaderLayoutSpec debugInterestingTitleSubtitleLabelSpec](v9, "debugInterestingTitleSubtitleLabelSpec");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "subtitleLabelSpec");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setTextColor:", v19);

    -[PXCuratedLibrarySectionHeaderLayoutSpec titleSubtitleLabelSpec](v9, "titleSubtitleLabelSpec");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v22, "copy");
    -[PXCuratedLibrarySectionHeaderLayoutSpec setDebugNonInterestingTitleSubtitleLabelSpec:](v9, "setDebugNonInterestingTitleSubtitleLabelSpec:", v23);

    objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibrarySectionHeaderLayoutSpec debugNonInterestingTitleSubtitleLabelSpec](v9, "debugNonInterestingTitleSubtitleLabelSpec");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "subtitleLabelSpec");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setTextColor:", v24);

    v27 = v9;
    -[PXCuratedLibrarySectionHeaderLayoutSpec setWantsTitle:](v27, "setWantsTitle:", 1);
    v28 = v27;

    -[PXCuratedLibrarySectionHeaderLayoutSpec setWantsSubtitle:](v28, "setWantsSubtitle:", 1);
    -[PXCuratedLibrarySectionHeaderLayoutSpec setShouldAvoidOverlapWithSecondaryToolbar:](v28, "setShouldAvoidOverlapWithSecondaryToolbar:", 1);
    -[PXCuratedLibrarySectionHeaderLayoutSpec curatedLibraryEdgeToEdgeContentDefaultPadding](v28, "curatedLibraryEdgeToEdgeContentDefaultPadding");
    -[PXCuratedLibrarySectionHeaderLayoutSpec setContentPadding:](v28, "setContentPadding:");
    -[PXCuratedLibrarySectionHeaderLayoutSpec setWantsInlineHeader:](v28, "setWantsInlineHeader:", 0);
    -[PXCuratedLibrarySectionHeaderLayoutSpec setRequiresTitleRenderedAsView:](v28, "setRequiresTitleRenderedAsView:", -[PXFeatureSpec userInterfaceIdiom](v28, "userInterfaceIdiom") == 4);
    v30 = v10 < 5 && v11 == 1;
    -[PXCuratedLibrarySectionHeaderLayoutSpec setInlineHeaderStyle:](v28, "setInlineHeaderStyle:", v30);
    -[PXCuratedLibrarySectionHeaderLayoutSpec setShouldAccommodateLeadingButtonsLayout:](v28, "setShouldAccommodateLeadingButtonsLayout:", 1);
    +[PXPhotosGridSettings sharedInstance](PXPhotosGridSettings, "sharedInstance");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "headerGradientAlpha");
    -[PXCuratedLibrarySectionHeaderLayoutSpec setGradientAlpha:](v28, "setGradientAlpha:");
    objc_msgSend(v31, "headerGradientHeight");
    -[PXCuratedLibrarySectionHeaderLayoutSpec setGradientHeight:](v28, "setGradientHeight:");
    -[PXCuratedLibrarySectionHeaderLayoutSpec setGradientRespectsSafeArea:](v28, "setGradientRespectsSafeArea:", 0);

  }
  return v9;
}

- (BOOL)showMainEllipsisButtonWhenSecondaryEllipsisButtonIsShown:(BOOL)a3 selectButtonIsShown:(BOOL)a4
{
  return a4;
}

@end
