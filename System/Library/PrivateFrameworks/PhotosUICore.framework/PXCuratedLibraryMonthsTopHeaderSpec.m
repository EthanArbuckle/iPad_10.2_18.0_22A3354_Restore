@implementation PXCuratedLibraryMonthsTopHeaderSpec

- (PXCuratedLibraryMonthsTopHeaderSpec)initWithExtendedTraitCollection:(id)a3 options:(unint64_t)a4 variant:(int64_t)a5
{
  PXCuratedLibraryMonthsTopHeaderSpec *v6;
  PXCuratedLibraryMonthsTopHeaderSpec *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PXCuratedLibraryMonthsTopHeaderSpec;
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
  v18.super_class = (Class)PXCuratedLibraryMonthsTopHeaderSpec;
  -[PXCuratedLibrarySectionHeaderLayoutSpec adjustedContentPadding:](&v18, sel_adjustedContentPadding_, a3.top, a3.left, a3.bottom, a3.right);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  if (-[PXCuratedLibrarySectionHeaderLayoutSpec ellipsisButtonSpecialTreatment](self, "ellipsisButtonSpecialTreatment"))
  {
    +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "alignActionButtonsTrailingEdges") & 1) != 0)
    {

    }
    else
    {
      v13 = -[PXFeatureSpec layoutOrientation](self, "layoutOrientation");

      if (v13 == 1)
        v11 = v11 + 14.0;
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

@end
