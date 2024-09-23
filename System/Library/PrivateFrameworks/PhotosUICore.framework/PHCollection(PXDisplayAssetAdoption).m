@implementation PHCollection(PXDisplayAssetAdoption)

- (uint64_t)startDate
{
  return 0;
}

- (uint64_t)endDate
{
  return 0;
}

- (const)px_symbolImageName
{
  return CFSTR("rectangle.stack");
}

- (uint64_t)px_allowsKeyAssetDisplay
{
  if ((objc_msgSend(a1, "px_isRegularAlbum") & 1) != 0
    || (objc_msgSend(a1, "px_isSharedAlbum") & 1) != 0
    || (objc_msgSend(a1, "px_isFavoritesSmartAlbum") & 1) != 0
    || (objc_msgSend(a1, "px_isRecentsSmartAlbum") & 1) != 0
    || (objc_msgSend(a1, "px_isRegularFolder") & 1) != 0
    || (objc_msgSend(a1, "px_isMacSyncedAlbum") & 1) != 0)
  {
    return 1;
  }
  else
  {
    return objc_msgSend(a1, "px_isMacSyncedFacesFolder");
  }
}

- (uint64_t)px_allowsImplicitSelectionForProjectOrSharingAction
{
  return 0;
}

- (uint64_t)px_canDeleteContent
{
  return objc_msgSend(a1, "canPerformEditOperation:", 1);
}

- (uint64_t)px_canRemoveContent
{
  return objc_msgSend(a1, "canPerformEditOperation:", 2);
}

- (uint64_t)px_canAddContent
{
  return objc_msgSend(a1, "canPerformEditOperation:", 3);
}

- (uint64_t)px_canCreateContent
{
  return objc_msgSend(a1, "canPerformEditOperation:", 4);
}

- (uint64_t)px_canRearrangeContent
{
  return objc_msgSend(a1, "canPerformEditOperation:", 5);
}

- (uint64_t)px_isRenamable
{
  return objc_msgSend(a1, "canPerformEditOperation:", 7);
}

- (uint64_t)px_isDeletable
{
  return objc_msgSend(a1, "canPerformEditOperation:", 6);
}

- (uint64_t)px_allowsMoveToSharedLibrary
{
  if ((objc_msgSend(a1, "px_isRecentlyDeletedSmartAlbum") & 1) != 0)
    return 0;
  else
    return objc_msgSend(a1, "px_isRecoveredSmartAlbum") ^ 1;
}

- (uint64_t)px_allowsMoveToPersonalLibrary
{
  if ((objc_msgSend(a1, "px_isRecentlyDeletedSmartAlbum") & 1) != 0)
    return 0;
  else
    return objc_msgSend(a1, "px_isRecoveredSmartAlbum") ^ 1;
}

- (uint64_t)px_shouldUseFacesRectForSmartCropping
{
  return 1;
}

- (uint64_t)px_supportsFastCuration
{
  return 0;
}

- (uint64_t)px_wantsCurationByDefault
{
  return 0;
}

- (uint64_t)px_isUserCreated
{
  uint64_t result;

  if ((objc_msgSend(a1, "px_isRegularAlbum") & 1) != 0)
    return objc_msgSend(a1, "isTransient") ^ 1;
  if ((objc_msgSend(a1, "px_isRegularFolder") & 1) != 0)
    return objc_msgSend(a1, "isTransient") ^ 1;
  if ((objc_msgSend(a1, "px_isUserSmartAlbum") & 1) != 0)
    return objc_msgSend(a1, "isTransient") ^ 1;
  result = objc_msgSend(a1, "px_isProject");
  if ((_DWORD)result)
    return objc_msgSend(a1, "isTransient") ^ 1;
  return result;
}

- (uint64_t)px_isRegularAlbum
{
  return 0;
}

- (uint64_t)px_isImportedAlbum
{
  return 0;
}

- (uint64_t)px_isMyPhotoStreamAlbum
{
  return 0;
}

- (uint64_t)px_isUserSmartAlbum
{
  return 0;
}

- (uint64_t)px_isSmartAlbum
{
  return 0;
}

- (uint64_t)px_isRootSmartAlbum
{
  return 0;
}

- (uint64_t)px_isMediaTypeSmartAlbum
{
  return 0;
}

- (uint64_t)px_isLemonadeUtilitiesAlbum
{
  return 0;
}

- (uint64_t)px_isAllPhotosSmartAlbum
{
  return 0;
}

- (uint64_t)px_isFavoritesSmartAlbum
{
  return 0;
}

- (uint64_t)px_isPlacesSmartAlbum
{
  return 0;
}

- (uint64_t)px_isHiddenSmartAlbum
{
  return 0;
}

- (uint64_t)px_isRecentlyAddedSmartAlbum
{
  return 0;
}

- (uint64_t)px_isRecentlyDeletedSmartAlbum
{
  return 0;
}

- (uint64_t)px_isRecentsSmartAlbum
{
  return 0;
}

- (uint64_t)px_isRecentlyEditedSmartAlbum
{
  return 0;
}

- (uint64_t)px_isScreenRecordingsSmartAlbum
{
  return 0;
}

- (uint64_t)px_isVideosSmartAlbum
{
  return 0;
}

- (uint64_t)px_isTimelapsesSmartAlbum
{
  return 0;
}

- (uint64_t)px_isBurstsSmartAlbum
{
  return 0;
}

- (uint64_t)px_isSlomoVideosSmartAlbum
{
  return 0;
}

- (uint64_t)px_isSelfPortraitsSmartAlbum
{
  return 0;
}

- (uint64_t)px_isScreenshotsSmartAlbum
{
  return 0;
}

- (uint64_t)px_isDepthEffectSmartAlbum
{
  return 0;
}

- (uint64_t)px_isLivePhotosSmartAlbum
{
  return 0;
}

- (uint64_t)px_isAnimatedSmartAlbum
{
  return 0;
}

- (uint64_t)px_isLongExposuresSmartAlbum
{
  return 0;
}

- (uint64_t)px_isRAWSmartAlbum
{
  return 0;
}

- (uint64_t)px_isCinematicSmartAlbum
{
  return 0;
}

- (uint64_t)px_isProResSmartAlbum
{
  return 0;
}

- (uint64_t)px_isUtilityCollection
{
  return 0;
}

- (uint64_t)px_isRecentsCollection
{
  if ((objc_msgSend(a1, "px_isRecentlySavedCollection") & 1) != 0
    || (objc_msgSend(a1, "px_isRecentlyViewedCollection") & 1) != 0
    || (objc_msgSend(a1, "px_isRecentlyEditedCollection") & 1) != 0)
  {
    return 1;
  }
  else
  {
    return objc_msgSend(a1, "px_isRecentlySharedCollection");
  }
}

- (uint64_t)px_isDuplicatesAlbum
{
  return 0;
}

- (uint64_t)px_isUnableToUploadSmartAlbum
{
  return 0;
}

- (uint64_t)px_isSharedLibrarySharingSuggestionsSmartAlbum
{
  return 0;
}

- (uint64_t)px_isSharedLibrarySharingSuggestion
{
  return 0;
}

- (uint64_t)px_isPanoramasSmartAlbum
{
  return 0;
}

- (uint64_t)px_isSpatialSmartAlbum
{
  return 0;
}

- (uint64_t)px_isAllLibraryDuplicatesSmartAlbum
{
  return 0;
}

- (uint64_t)px_isRecoveredSmartAlbum
{
  return 0;
}

- (uint64_t)px_isPrivacySensitiveAlbum
{
  return 0;
}

- (uint64_t)px_containsPrivateContent
{
  return 0;
}

- (uint64_t)px_isSharedAlbum
{
  return 0;
}

- (uint64_t)px_isOwnedSharedAlbum
{
  return 0;
}

- (uint64_t)px_isCloudMultipleContributorsEnabled
{
  return 0;
}

- (uint64_t)px_isInReadWriteCloudLibrary
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "photoLibrary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "isCloudPhotoLibraryEnabled"))
    v2 = objc_msgSend(v1, "isReadOnlyCloudPhotoLibrary") ^ 1;
  else
    v2 = 0;

  return v2;
}

- (uint64_t)px_isMoment
{
  return 0;
}

- (uint64_t)px_isMemory
{
  return 0;
}

- (uint64_t)px_isHighlight
{
  return 0;
}

- (uint64_t)px_isHighlightEnrichedWithAssetMetadataAndScenesProcessed
{
  return 0;
}

- (uint64_t)px_isDayGroupHighlight
{
  return 0;
}

- (uint64_t)px_isDayHighlight
{
  return 0;
}

- (uint64_t)px_isMonthHighlight
{
  return 0;
}

- (uint64_t)px_isEvent
{
  return 0;
}

- (uint64_t)px_isTrip
{
  return 0;
}

- (uint64_t)px_isSuggestion
{
  return 0;
}

- (uint64_t)px_isMomentShare
{
  return 0;
}

- (uint64_t)px_isContentSyndicationAlbum
{
  return 0;
}

- (uint64_t)px_isFolder
{
  return 0;
}

- (uint64_t)px_isSmartFolder
{
  return 0;
}

- (uint64_t)px_isRegularFolder
{
  return 0;
}

- (uint64_t)px_isTopLevelFolder
{
  return 0;
}

- (uint64_t)px_isProjectsFolder
{
  return 0;
}

- (uint64_t)px_isContentSyndicationFolder
{
  return 0;
}

- (uint64_t)px_isAllMacSyncedAlbumsFolder
{
  return 0;
}

- (uint64_t)px_isMediaTypesFolder
{
  return 0;
}

- (uint64_t)px_isUtilitiesFolder
{
  return 0;
}

- (uint64_t)px_isSharedAlbumsFolder
{
  return 0;
}

- (uint64_t)px_isSharedAlbumsAndActivityFolder
{
  return 0;
}

- (uint64_t)px_isMacSyncedAlbum
{
  return 0;
}

- (uint64_t)px_isMacSyncedRegularAlbum
{
  return 0;
}

- (uint64_t)px_isMacSyncedFacesAlbum
{
  return 0;
}

- (uint64_t)px_isMacSyncedEventsFolder
{
  return 0;
}

- (uint64_t)px_isMacSyncedFacesFolder
{
  return 0;
}

- (uint64_t)px_isProject
{
  return 0;
}

- (uint64_t)px_isPhotosVirtualCollection
{
  return 0;
}

- (uint64_t)px_isMomentsVirtualCollection
{
  return 0;
}

- (uint64_t)px_isEventsVirtualCollection
{
  return 0;
}

- (uint64_t)px_isTripsVirtualCollection
{
  return 0;
}

- (uint64_t)px_isFeaturedPhotosCollection
{
  return 0;
}

- (uint64_t)px_isWallpaperSuggestionsVirtualCollection
{
  return 0;
}

- (uint64_t)px_isBookmarksVirtualCollection
{
  return 0;
}

- (uint64_t)px_isSearchResultsVirtualCollection
{
  return 0;
}

- (uint64_t)px_isMemoriesVirtualCollection
{
  return 0;
}

- (uint64_t)px_isForYouVirtualCollection
{
  return 0;
}

- (uint64_t)px_isPeopleVirtualCollection
{
  return 0;
}

- (uint64_t)px_isSharedActivityVirtualCollection
{
  return 0;
}

- (uint64_t)px_isAllAlbumsVirtualCollection
{
  return 0;
}

- (uint64_t)px_isMyAlbumsVirtualCollection
{
  return 0;
}

- (uint64_t)px_isSharedAlbumsVirtualCollection
{
  return 0;
}

- (uint64_t)px_isContentSyndicationVirtualCollection
{
  return 0;
}

- (uint64_t)px_isContentSyndicationAllPhotosAlbum
{
  return 0;
}

- (uint64_t)px_isMapVirtualCollection
{
  return 0;
}

- (uint64_t)px_isMomentShareVirtualCollection
{
  return 0;
}

- (uint64_t)px_isImportHistoryCollection
{
  return 0;
}

- (uint64_t)px_isImportSessionCollection
{
  return 0;
}

- (uint64_t)px_isImportAssetCollection
{
  return 0;
}

- (uint64_t)px_isTransientPlacesCollection
{
  return 0;
}

- (uint64_t)px_isRecentlySavedCollection
{
  return 0;
}

- (uint64_t)px_isRecentlyViewedCollection
{
  return 0;
}

- (uint64_t)px_isRecentlyEditedCollection
{
  return 0;
}

- (uint64_t)px_isRecentlySharedCollection
{
  return 0;
}

- (uint64_t)px_isSavedTodayCollection
{
  return 0;
}

@end
