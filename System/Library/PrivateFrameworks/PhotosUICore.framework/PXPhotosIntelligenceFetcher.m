@implementation PXPhotosIntelligenceFetcher

+ (id)fetchFeaturedPhotoSuggestionsInPhotoLibrary:(id)a3 currentlyFeaturedOnly:(BOOL)a4
{
  return +[PXPhotosIntelligenceBridge fetchFeaturedPhotoSuggestionsWithPhotoLibrary:sharingFilter:fetchLimit:currentlyFeaturedOnly:](PXPhotosIntelligenceBridge, "fetchFeaturedPhotoSuggestionsWithPhotoLibrary:sharingFilter:fetchLimit:currentlyFeaturedOnly:", a3, 2, 0, a4);
}

+ (id)fetchFeaturedPhotoAssetsInPhotoLibrary:(id)a3 currentlyFeaturedOnly:(BOOL)a4
{
  return +[PXPhotosIntelligenceBridge fetchFeaturedPhotoAssetsWithPhotoLibrary:sharingFilter:currentlyFeaturedOnly:](PXPhotosIntelligenceBridge, "fetchFeaturedPhotoAssetsWithPhotoLibrary:sharingFilter:currentlyFeaturedOnly:", a3, 2, a4);
}

@end
