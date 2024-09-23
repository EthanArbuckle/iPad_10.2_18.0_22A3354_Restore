@implementation PXSymbolNameForTransientCollectionIdentifier

void __PXSymbolNameForTransientCollectionIdentifier_block_invoke()
{
  _BOOL4 v0;
  __CFString *v1;
  void *v2;
  __CFString *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[25];
  _QWORD v7[26];

  v7[25] = *MEMORY[0x1E0C80C00];
  v0 = +[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled");
  v6[0] = CFSTR("PXMomentsVirtualCollection");
  v6[1] = CFSTR("PXPhotosVirtualCollection");
  v1 = CFSTR("photos");
  if (!v0)
    v1 = CFSTR("rectangle.stack");
  v7[0] = v1;
  v7[1] = CFSTR("photo.on.rectangle");
  v6[2] = CFSTR("PXPeopleVirtualCollection");
  v6[3] = CFSTR("PXTransientCollectionIdentifierFeatured");
  v7[2] = CFSTR("person.crop.circle");
  v7[3] = CFSTR("party.popper");
  v6[4] = CFSTR("PXTransientCollectionIdentifierEvents");
  v6[5] = CFSTR("PXTransientCollectionIdentifierTrips");
  v7[4] = CFSTR("clock");
  v7[5] = CFSTR("suitcase");
  v6[6] = CFSTR("PXTransientCollectionIdentifierDocuments");
  v6[7] = CFSTR("PXTransientCollectionIdentifierUtilities");
  v7[6] = CFSTR("doc.text");
  v7[7] = CFSTR("wrench.and.screwdriver");
  v6[8] = CFSTR("PXTransientCollectionIdentifierWallpaperSuggestions");
  v6[9] = CFSTR("PXTransientCollectionIdentifierBookmarks");
  v7[8] = CFSTR("ipad.landscape");
  v7[9] = CFSTR("pin.fill");
  v6[10] = CFSTR("PXRecentlySharedVirtualCollection");
  v6[11] = CFSTR("PXRecentlyEditedVirtualCollection");
  v7[10] = CFSTR("square.and.arrow.up.circle");
  v7[11] = CFSTR("slider.horizontal.2.square");
  v6[12] = CFSTR("PXRecentlyViewedVirtualCollection");
  v6[13] = CFSTR("PXMemoriesVirtualCollection");
  v7[12] = CFSTR("eye.circle");
  v7[13] = CFSTR("memories");
  v6[14] = CFSTR("PXCompleteMyMomentVirtualCollection");
  v6[15] = CFSTR("PXSharedActivityVirtualCollection");
  v7[14] = CFSTR("link.icloud");
  v7[15] = CFSTR("bubble.left.and.bubble.right");
  v6[16] = CFSTR("PXImportHistoryVirtualCollection");
  v6[17] = CFSTR("PXContentSyndicationVirtualCollection");
  v7[16] = CFSTR("square.and.arrow.down");
  v7[17] = CFSTR("shared.with.you");
  v6[18] = CFSTR("PXContentSyndicationAllPhotosAssetCollection");
  v6[19] = CFSTR("PXTransientCollectionIdentifierFeaturedPeople");
  v7[18] = CFSTR("rectangle.stack");
  v7[19] = CFSTR("person.fill");
  v6[20] = CFSTR("PXTransientCollectionIdentifierFeaturedTrips");
  v6[21] = CFSTR("PXTransientCollectionIdentifierFeaturedEvents");
  v7[20] = CFSTR("briefcase.fill");
  v7[21] = CFSTR("memories");
  v6[22] = CFSTR("PXTransientCollectionIdentifierFeaturedMemories");
  v6[23] = CFSTR("PXFeaturedPhotosVirtualCollection");
  v7[22] = CFSTR("memories");
  v7[23] = CFSTR("photo.fill");
  v6[24] = CFSTR("PXTransientCollectionIdentifierMap");
  v7[24] = CFSTR("map");
  v2 = (void *)MEMORY[0x1E0C99D80];
  v3 = v1;
  objc_msgSend(v2, "dictionaryWithObjects:forKeys:count:", v7, v6, 25);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)PXSymbolNameForTransientCollectionIdentifier_symbolNames;
  PXSymbolNameForTransientCollectionIdentifier_symbolNames = v4;

}

@end
