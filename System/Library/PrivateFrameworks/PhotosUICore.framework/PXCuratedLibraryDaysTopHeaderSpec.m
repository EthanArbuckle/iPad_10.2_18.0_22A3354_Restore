@implementation PXCuratedLibraryDaysTopHeaderSpec

- (PXCuratedLibraryDaysTopHeaderSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 variant:(int64_t)a5
{
  PXCuratedLibraryDaysTopHeaderSpec *v6;
  void *v7;
  void *v8;
  double v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PXCuratedLibraryDaysTopHeaderSpec;
  v6 = -[PXCuratedLibrarySectionHeaderLayoutSpec initWithExtendedTraitCollection:options:variant:](&v11, sel_initWithExtendedTraitCollection_options_variant_, a3, a4);
  if (v6)
  {
    +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibrarySectionHeaderLayoutSpec setIsFloating:](v6, "setIsFloating:", 1);
    -[PXCuratedLibrarySectionHeaderLayoutSpec setEllipsisButtonSpecialTreatment:](v6, "setEllipsisButtonSpecialTreatment:", a5 != 0);
    -[PXCuratedLibrarySectionHeaderLayoutSpec curatedLibraryEdgeToEdgeContentDefaultPadding](v6, "curatedLibraryEdgeToEdgeContentDefaultPadding");
    -[PXCuratedLibrarySectionHeaderLayoutSpec setPadding:](v6, "setPadding:");
    -[PXCuratedLibrarySectionHeaderLayoutSpec padding](v6, "padding");
    PXEdgeInsetsForEdges();
    -[PXCuratedLibrarySectionHeaderLayoutSpec setContentPadding:](v6, "setContentPadding:");
    -[PXCuratedLibrarySectionHeaderLayoutSpec setWantsTitle:](v6, "setWantsTitle:", 0);
    -[PXCuratedLibrarySectionHeaderLayoutSpec setWantsSubtitle:](v6, "setWantsSubtitle:", 0);
    -[PXCuratedLibrarySectionHeaderLayoutSpec setCanShowAspectFitButtons:](v6, "setCanShowAspectFitButtons:", 0);
    -[PXCuratedLibrarySectionHeaderLayoutSpec setCanShowZoomButtons:](v6, "setCanShowZoomButtons:", 0);
    objc_msgSend(off_1E50B5C68, "px_headerTitleSubtitleLabelSpecForZoomLevel:featureSpec:", 4, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibrarySectionHeaderLayoutSpec setTitleSubtitleLabelSpec:](v6, "setTitleSubtitleLabelSpec:", v8);

    objc_msgSend(v7, "daysHeaderGradientAlpha");
    -[PXCuratedLibrarySectionHeaderLayoutSpec setGradientAlpha:](v6, "setGradientAlpha:");
    -[PXCuratedLibrarySectionHeaderLayoutSpec maximumTitleSubtitleHeight](v6, "maximumTitleSubtitleHeight");
    -[PXCuratedLibrarySectionHeaderLayoutSpec setGradientHeight:](v6, "setGradientHeight:", v9 + 23.0);

  }
  return v6;
}

@end
