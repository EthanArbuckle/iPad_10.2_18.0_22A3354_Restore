@implementation PXTitleSubtitleLabelSpec(CuratedLibrary)

+ (id)px_headerTitleSubtitleLabelSpecForZoomLevel:()CuratedLibrary featureSpec:
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = objc_alloc_init((Class)off_1E50B5C68);
  if (PXCuratedLibraryHeaderWantsTitleForZoomLevel(a3, v5))
  {
    objc_msgSend(off_1E50B31F8, "px_headerTitleLabelSpecForZoomLevel:featureSpec:", a3, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTitleLabelSpec:", v7);

  }
  if (PXCuratedLibraryHeaderWantsSubtitleForZoomLevel(a3, v5))
  {
    objc_msgSend(off_1E50B31F8, "px_headerSubtitleLabelSpecForZoomLevel:featureSpec:", a3, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSubtitleLabelSpec:", v8);

  }
  _DistanceBetweenTitleAndSubtitleForZoomLevelFeatureSpec(a3, v5);
  objc_msgSend(v5, "contentSizeCategory");
  PXScaledValueForTextStyleWithMaxContentSizeCategoryAndSymbolicTraits();
  objc_msgSend(v6, "setDistanceBetweenTitleBaselineAndSubtitleBaseline:");

  return v6;
}

@end
