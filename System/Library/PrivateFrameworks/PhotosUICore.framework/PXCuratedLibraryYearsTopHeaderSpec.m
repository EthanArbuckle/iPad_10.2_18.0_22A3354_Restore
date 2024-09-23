@implementation PXCuratedLibraryYearsTopHeaderSpec

- (PXCuratedLibraryYearsTopHeaderSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 variant:(int64_t)a5
{
  PXCuratedLibraryYearsTopHeaderSpec *v6;
  PXCuratedLibraryYearsTopHeaderSpec *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PXCuratedLibraryYearsTopHeaderSpec;
  v6 = -[PXCuratedLibrarySectionHeaderLayoutSpec initWithExtendedTraitCollection:options:variant:](&v10, sel_initWithExtendedTraitCollection_options_variant_, a3, a4);
  v7 = v6;
  if (v6)
  {
    -[PXCuratedLibrarySectionHeaderLayoutSpec setIsFloating:](v6, "setIsFloating:", 1);
    -[PXCuratedLibrarySectionHeaderLayoutSpec setEllipsisButtonSpecialTreatment:](v7, "setEllipsisButtonSpecialTreatment:", a5 != 0);
    -[PXCuratedLibrarySectionHeaderLayoutSpec curatedLibraryEdgeToEdgeContentDefaultPadding](v7, "curatedLibraryEdgeToEdgeContentDefaultPadding");
    -[PXCuratedLibrarySectionHeaderLayoutSpec setPadding:](v7, "setPadding:");
    -[PXCuratedLibrarySectionHeaderLayoutSpec padding](v7, "padding");
    PXEdgeInsetsForEdges();
    -[PXCuratedLibrarySectionHeaderLayoutSpec setContentPadding:](v7, "setContentPadding:");
    -[PXCuratedLibrarySectionHeaderLayoutSpec setWantsTitle:](v7, "setWantsTitle:", 0);
    -[PXCuratedLibrarySectionHeaderLayoutSpec setWantsSubtitle:](v7, "setWantsSubtitle:", 0);
    -[PXCuratedLibrarySectionHeaderLayoutSpec setCanShowAspectFitButtons:](v7, "setCanShowAspectFitButtons:", 0);
    -[PXCuratedLibrarySectionHeaderLayoutSpec setCanShowZoomButtons:](v7, "setCanShowZoomButtons:", 0);
    -[PXCuratedLibrarySectionHeaderLayoutSpec setGradientAlpha:](v7, "setGradientAlpha:", 0.0);
    objc_msgSend(off_1E50B5C68, "px_headerTitleSubtitleLabelSpecForZoomLevel:featureSpec:", 4, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibrarySectionHeaderLayoutSpec setTitleSubtitleLabelSpec:](v7, "setTitleSubtitleLabelSpec:", v8);

  }
  return v7;
}

@end
