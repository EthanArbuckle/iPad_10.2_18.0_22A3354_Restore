@implementation PXMockDisplayAssetCollection

- (PXMockDisplayAssetCollection)initWithTitle:(id)a3 subtitle:(id)a4 type:(int64_t)a5 subtype:(int64_t)a6 startDate:(id)a7 endDate:(id)a8 isPrivacySensitiveAlbum:(BOOL)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  PXMockDisplayAssetCollection *v19;
  uint64_t v20;
  NSString *localizedTitle;
  uint64_t v22;
  NSString *localizedSubtitle;
  objc_super v25;

  v15 = a3;
  v16 = a4;
  v17 = a7;
  v18 = a8;
  v25.receiver = self;
  v25.super_class = (Class)PXMockDisplayAssetCollection;
  v19 = -[PXMockDisplayAssetCollection init](&v25, sel_init);
  if (v19)
  {
    v20 = objc_msgSend(v15, "copy");
    localizedTitle = v19->_localizedTitle;
    v19->_localizedTitle = (NSString *)v20;

    v22 = objc_msgSend(v16, "copy");
    localizedSubtitle = v19->_localizedSubtitle;
    v19->_localizedSubtitle = (NSString *)v22;

    v19->_type = a5;
    v19->_subtype = a6;
    objc_storeStrong((id *)&v19->_startDate, a7);
    objc_storeStrong((id *)&v19->_endDate, a8);
    v19->_isPrivacySensitiveAlbum = a9;
  }

  return v19;
}

- (PXMockDisplayAssetCollection)initWithTitle:(id)a3 subtitle:(id)a4 type:(int64_t)a5 subtype:(int64_t)a6 startDate:(id)a7 endDate:(id)a8
{
  uint64_t v9;

  LOBYTE(v9) = 0;
  return -[PXMockDisplayAssetCollection initWithTitle:subtitle:type:subtype:startDate:endDate:isPrivacySensitiveAlbum:](self, "initWithTitle:subtitle:type:subtype:startDate:endDate:isPrivacySensitiveAlbum:", a3, a4, a5, a6, a7, a8, v9);
}

- (PXMockDisplayAssetCollection)initWithTitle:(id)a3 subtitle:(id)a4 type:(int64_t)a5 subtype:(int64_t)a6
{
  return -[PXMockDisplayAssetCollection initWithTitle:subtitle:type:subtype:startDate:endDate:](self, "initWithTitle:subtitle:type:subtype:startDate:endDate:", a3, a4, a5, a6, 0, 0);
}

- (PXMockDisplayAssetCollection)init
{
  return -[PXMockDisplayAssetCollection initWithTitle:subtitle:type:subtype:startDate:endDate:](self, "initWithTitle:subtitle:type:subtype:startDate:endDate:", 0, 0, 0, 0, 0, 0);
}

- (BOOL)canContainAssets
{
  return 1;
}

- (BOOL)canContainCollections
{
  return 0;
}

- (NSString)px_symbolImageName
{
  return (NSString *)CFSTR("rectangle.stack");
}

- (BOOL)px_allowsKeyAssetDisplay
{
  return 0;
}

- (BOOL)px_allowsImplicitSelectionForProjectOrSharingAction
{
  return 0;
}

- (BOOL)px_canDeleteContent
{
  return 0;
}

- (BOOL)px_canRemoveContent
{
  return 0;
}

- (BOOL)px_canAddContent
{
  return 0;
}

- (BOOL)px_canCreateContent
{
  return 0;
}

- (BOOL)px_canRearrangeContent
{
  return 0;
}

- (BOOL)px_isDeletable
{
  return 0;
}

- (BOOL)px_isRenamable
{
  return 0;
}

- (BOOL)px_allowsMoveToSharedLibrary
{
  return 0;
}

- (BOOL)px_allowsMoveToPersonalLibrary
{
  return 0;
}

- (BOOL)px_shouldUseFacesRectForSmartCropping
{
  return 0;
}

- (BOOL)px_supportsFastCuration
{
  return 0;
}

- (BOOL)px_wantsCurationByDefault
{
  return 0;
}

- (BOOL)px_isUserCreated
{
  return -[PXMockDisplayAssetCollection px_isRegularAlbum](self, "px_isRegularAlbum")
      || -[PXMockDisplayAssetCollection px_isRegularFolder](self, "px_isRegularFolder")
      || -[PXMockDisplayAssetCollection px_isUserSmartAlbum](self, "px_isUserSmartAlbum")
      || -[PXMockDisplayAssetCollection px_isProject](self, "px_isProject");
}

- (BOOL)px_isRegularAlbum
{
  return -[PXMockDisplayAssetCollection subtype](self, "subtype") == 2;
}

- (BOOL)px_isImportedAlbum
{
  return -[PXMockDisplayAssetCollection subtype](self, "subtype") == 6;
}

- (BOOL)px_isMyPhotoStreamAlbum
{
  return -[PXMockDisplayAssetCollection subtype](self, "subtype") == 100;
}

- (BOOL)px_isUserSmartAlbum
{
  return -[PXMockDisplayAssetCollection subtype](self, "subtype") == 1000000204;
}

- (BOOL)px_isSmartAlbum
{
  return -[PXMockDisplayAssetCollection type](self, "type") == 2;
}

- (BOOL)px_isRootSmartAlbum
{
  _BOOL4 v3;

  v3 = -[PXMockDisplayAssetCollection px_isSmartAlbum](self, "px_isSmartAlbum");
  if (v3)
  {
    if (-[PXMockDisplayAssetCollection px_isUserSmartAlbum](self, "px_isUserSmartAlbum"))
      LOBYTE(v3) = 0;
    else
      LOBYTE(v3) = !-[PXMockDisplayAssetCollection px_isMediaTypeSmartAlbum](self, "px_isMediaTypeSmartAlbum");
  }
  return v3;
}

- (BOOL)px_isMediaTypeSmartAlbum
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0CD13B8], "px_mediaTypeSmartAlbumSubtypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PXMockDisplayAssetCollection subtype](self, "subtype"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "containsObject:", v4);

  return v5;
}

- (BOOL)px_isLemonadeUtilitiesAlbum
{
  return 0;
}

- (BOOL)px_isAllPhotosSmartAlbum
{
  return -[PXMockDisplayAssetCollection subtype](self, "subtype") == 1000000205;
}

- (BOOL)px_isFavoritesSmartAlbum
{
  return -[PXMockDisplayAssetCollection subtype](self, "subtype") == 203;
}

- (BOOL)px_isPlacesSmartAlbum
{
  return -[PXMockDisplayAssetCollection subtype](self, "subtype") == 1000000203;
}

- (BOOL)px_isHiddenSmartAlbum
{
  return -[PXMockDisplayAssetCollection subtype](self, "subtype") == 205;
}

- (BOOL)px_isRecentlyAddedSmartAlbum
{
  return -[PXMockDisplayAssetCollection subtype](self, "subtype") == 206;
}

- (BOOL)px_isRecentlyDeletedSmartAlbum
{
  return -[PXMockDisplayAssetCollection subtype](self, "subtype") == 1000000201;
}

- (BOOL)px_isRecentsSmartAlbum
{
  return -[PXMockDisplayAssetCollection subtype](self, "subtype") == 209;
}

- (BOOL)px_isRecentlyEditedSmartAlbum
{
  return -[PXMockDisplayAssetCollection subtype](self, "subtype") == 1000000206;
}

- (BOOL)px_isScreenRecordingsSmartAlbum
{
  return -[PXMockDisplayAssetCollection subtype](self, "subtype") == 1000000207;
}

- (BOOL)px_isVideosSmartAlbum
{
  return -[PXMockDisplayAssetCollection subtype](self, "subtype") == 202;
}

- (BOOL)px_isTimelapsesSmartAlbum
{
  return -[PXMockDisplayAssetCollection subtype](self, "subtype") == 204;
}

- (BOOL)px_isBurstsSmartAlbum
{
  return -[PXMockDisplayAssetCollection subtype](self, "subtype") == 207;
}

- (BOOL)px_isSlomoVideosSmartAlbum
{
  return -[PXMockDisplayAssetCollection subtype](self, "subtype") == 208;
}

- (BOOL)px_isSelfPortraitsSmartAlbum
{
  return -[PXMockDisplayAssetCollection subtype](self, "subtype") == 210;
}

- (BOOL)px_isScreenshotsSmartAlbum
{
  return -[PXMockDisplayAssetCollection subtype](self, "subtype") == 211;
}

- (BOOL)px_isDepthEffectSmartAlbum
{
  return -[PXMockDisplayAssetCollection subtype](self, "subtype") == 212;
}

- (BOOL)px_isLivePhotosSmartAlbum
{
  return -[PXMockDisplayAssetCollection subtype](self, "subtype") == 213;
}

- (BOOL)px_isAnimatedSmartAlbum
{
  return -[PXMockDisplayAssetCollection subtype](self, "subtype") == 214;
}

- (BOOL)px_isLongExposuresSmartAlbum
{
  return -[PXMockDisplayAssetCollection subtype](self, "subtype") == 215;
}

- (BOOL)px_isRAWSmartAlbum
{
  return -[PXMockDisplayAssetCollection subtype](self, "subtype") == 217;
}

- (BOOL)px_isCinematicSmartAlbum
{
  return -[PXMockDisplayAssetCollection subtype](self, "subtype") == 218;
}

- (BOOL)px_isProResSmartAlbum
{
  return -[PXMockDisplayAssetCollection subtype](self, "subtype") == 219;
}

- (BOOL)px_isUtilityCollection
{
  return 0;
}

- (BOOL)px_isRecentsCollection
{
  return 0;
}

- (BOOL)px_isDuplicatesAlbum
{
  return 0;
}

- (BOOL)px_isUnableToUploadSmartAlbum
{
  return -[PXMockDisplayAssetCollection subtype](self, "subtype") == 216;
}

- (BOOL)px_isPanoramasSmartAlbum
{
  return -[PXMockDisplayAssetCollection subtype](self, "subtype") == 201;
}

- (BOOL)px_isSpatialSmartAlbum
{
  return -[PXMockDisplayAssetCollection subtype](self, "subtype") == 221;
}

- (BOOL)px_isAllLibraryDuplicatesSmartAlbum
{
  return 0;
}

- (BOOL)px_isRecoveredSmartAlbum
{
  return 0;
}

- (BOOL)px_isPrivacySensitiveAlbum
{
  return self->_isPrivacySensitiveAlbum;
}

- (BOOL)px_containsPrivateContent
{
  return 0;
}

- (BOOL)px_isSharedAlbum
{
  return -[PXMockDisplayAssetCollection subtype](self, "subtype") == 101;
}

- (BOOL)px_isOwnedSharedAlbum
{
  return 0;
}

- (BOOL)px_isCloudMultipleContributorsEnabled
{
  return 0;
}

- (BOOL)px_isInReadWriteCloudLibrary
{
  return 0;
}

- (BOOL)px_isMoment
{
  return -[PXMockDisplayAssetCollection type](self, "type") == 3;
}

- (BOOL)px_isMemory
{
  return -[PXMockDisplayAssetCollection type](self, "type") == 4;
}

- (BOOL)px_isHighlight
{
  return -[PXMockDisplayAssetCollection type](self, "type") == 6;
}

- (BOOL)px_isHighlightEnrichedWithAssetMetadataAndScenesProcessed
{
  _BOOL4 v3;

  v3 = -[PXMockDisplayAssetCollection px_isHighlight](self, "px_isHighlight");
  if (v3)
    LOBYTE(v3) = -[PXMockDisplayAssetCollection px_highlightEnrichmentState](self, "px_highlightEnrichmentState") > 2;
  return v3;
}

- (BOOL)px_isDayGroupHighlight
{
  return 0;
}

- (BOOL)px_isDayHighlight
{
  return 0;
}

- (BOOL)px_isMonthHighlight
{
  return 0;
}

- (BOOL)px_isEvent
{
  return 0;
}

- (BOOL)px_isTrip
{
  return 0;
}

- (BOOL)px_isSuggestion
{
  return -[PXMockDisplayAssetCollection type](self, "type") == 8;
}

- (BOOL)px_isMomentShare
{
  return -[PXMockDisplayAssetCollection type](self, "type") == 7;
}

- (BOOL)px_isContentSyndicationAlbum
{
  return 0;
}

- (BOOL)px_isFolder
{
  return 0;
}

- (BOOL)px_isSmartFolder
{
  return 0;
}

- (BOOL)px_isRegularFolder
{
  return 0;
}

- (BOOL)px_isTopLevelFolder
{
  return 0;
}

- (BOOL)px_isProjectsFolder
{
  return 0;
}

- (BOOL)px_isContentSyndicationFolder
{
  return 0;
}

- (BOOL)px_isAllMacSyncedAlbumsFolder
{
  return 0;
}

- (BOOL)px_isMediaTypesFolder
{
  return 0;
}

- (BOOL)px_isUtilitiesFolder
{
  return 0;
}

- (BOOL)px_isSharedAlbumsFolder
{
  return 0;
}

- (BOOL)px_isSharedAlbumsAndActivityFolder
{
  return 0;
}

- (BOOL)px_isMacSyncedAlbum
{
  int64_t v2;

  v2 = -[PXMockDisplayAssetCollection subtype](self, "subtype");
  return v2 == 3 || (v2 & 0xFFFFFFFFFFFFFFFELL) == 4;
}

- (BOOL)px_isMacSyncedRegularAlbum
{
  return -[PXMockDisplayAssetCollection subtype](self, "subtype") == 5;
}

- (BOOL)px_isMacSyncedFacesAlbum
{
  return -[PXMockDisplayAssetCollection subtype](self, "subtype") == 4;
}

- (BOOL)px_isMacSyncedEventsFolder
{
  return 0;
}

- (BOOL)px_isMacSyncedFacesFolder
{
  return 0;
}

- (BOOL)px_isProject
{
  return 0;
}

- (BOOL)px_isPhotosVirtualCollection
{
  return 0;
}

- (BOOL)px_isMomentsVirtualCollection
{
  return 0;
}

- (BOOL)px_isEventsVirtualCollection
{
  return 0;
}

- (BOOL)px_isTripsVirtualCollection
{
  return 0;
}

- (BOOL)px_isFeaturedPhotosCollection
{
  return 0;
}

- (BOOL)px_isWallpaperSuggestionsVirtualCollection
{
  return 0;
}

- (BOOL)px_isBookmarksVirtualCollection
{
  return 0;
}

- (BOOL)px_isSearchResultsVirtualCollection
{
  return 0;
}

- (BOOL)px_isMemoriesVirtualCollection
{
  return 0;
}

- (BOOL)px_isForYouVirtualCollection
{
  return 0;
}

- (BOOL)px_isPeopleVirtualCollection
{
  return 0;
}

- (BOOL)px_isSharedActivityVirtualCollection
{
  return 0;
}

- (BOOL)px_isAllAlbumsVirtualCollection
{
  return 0;
}

- (BOOL)px_isMyAlbumsVirtualCollection
{
  return 0;
}

- (BOOL)px_isSharedAlbumsVirtualCollection
{
  return 0;
}

- (BOOL)px_isContentSyndicationVirtualCollection
{
  return 0;
}

- (BOOL)px_isMapVirtualCollection
{
  return 0;
}

- (BOOL)px_isContentSyndicationAllPhotosAlbum
{
  return 0;
}

- (BOOL)px_isMomentShareVirtualCollection
{
  return 0;
}

- (BOOL)px_isImportHistoryCollection
{
  return 0;
}

- (BOOL)px_isImportSessionCollection
{
  return 0;
}

- (BOOL)px_isImportAssetCollection
{
  return 0;
}

- (BOOL)px_isTransientPlacesCollection
{
  return 0;
}

- (BOOL)px_isRecentlySavedCollection
{
  return 0;
}

- (BOOL)px_isRecentlyViewedCollection
{
  return 0;
}

- (BOOL)px_isRecentlyEditedCollection
{
  return 0;
}

- (BOOL)px_isRecentlySharedCollection
{
  return 0;
}

- (BOOL)px_isSharedLibrarySharingSuggestionsSmartAlbum
{
  return 0;
}

- (BOOL)px_isSharedLibrarySharingSuggestion
{
  return 0;
}

- (BOOL)px_isSavedTodayCollection
{
  return 0;
}

- (NSString)uuid
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@-%p"), v5, self);

  return (NSString *)v6;
}

- (id)localizedDateDescriptionWithOptions:(unint64_t)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMockDisplayAssetCollection.m"), 568, CFSTR("not implemented yet"));

  abort();
}

- (id)px_cheapLogIdentifier
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %p"), objc_opt_class(), self);
}

- (unint64_t)estimatedAssetCount
{
  return self->estimatedAssetCount;
}

- (BOOL)isAggregation
{
  return self->isAggregation;
}

- (BOOL)isEnriched
{
  return self->isEnriched;
}

- (BOOL)isEnrichmentComplete
{
  return self->isEnrichmentComplete;
}

- (BOOL)isRecent
{
  return self->isRecent;
}

- (NSString)localizedDateDescription
{
  return self->localizedDateDescription;
}

- (NSString)localizedShortDateDescription
{
  return self->localizedShortDateDescription;
}

- (NSArray)localizedLocationNames
{
  return self->localizedLocationNames;
}

- (NSString)localizedSmartDescription
{
  return self->localizedSmartDescription;
}

- (double)promotionScore
{
  return self->promotionScore;
}

- (unsigned)px_highlightEnrichmentState
{
  return self->px_highlightEnrichmentState;
}

- (int64_t)px_highlightKind
{
  return self->px_highlightKind;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (NSString)localizedSubtitle
{
  return self->_localizedSubtitle;
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)subtype
{
  return self->_subtype;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (BOOL)isPrivacySensitiveAlbum
{
  return self->_isPrivacySensitiveAlbum;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_localizedSubtitle, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->localizedSmartDescription, 0);
  objc_storeStrong((id *)&self->localizedLocationNames, 0);
  objc_storeStrong((id *)&self->localizedShortDateDescription, 0);
  objc_storeStrong((id *)&self->localizedDateDescription, 0);
}

@end
