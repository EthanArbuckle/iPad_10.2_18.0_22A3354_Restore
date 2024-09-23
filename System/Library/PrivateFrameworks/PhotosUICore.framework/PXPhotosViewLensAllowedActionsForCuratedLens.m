@implementation PXPhotosViewLensAllowedActionsForCuratedLens

void ___PXPhotosViewLensAllowedActionsForCuratedLens_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[42];

  v7[41] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v7[0] = CFSTR("PXAssetCollectionActionTypePersonInfo");
  v7[1] = CFSTR("PXPhotosGridActionSetAllLibrariesFilter");
  v7[2] = CFSTR("PXPhotosGridActionSetPersonalLibraryFilter");
  v7[3] = CFSTR("PXPhotosGridActionSetSharedLibraryFilter");
  v7[4] = CFSTR("PXPhotosGridActionToggleSharedLibraryBadge");
  v7[5] = CFSTR("PXPhotosGridActionToggleFaceMode");
  v7[6] = CFSTR("PXAssetCollectionActionTypePlayMovie");
  v7[7] = CFSTR("PXLemonadePhotoKitAssetCollectionPlayMovieActionPerformer");
  v7[8] = CFSTR("PXAssetCollectionActionTypeRename");
  v7[9] = CFSTR("PXAssetCollectionActionTypeCustomize");
  v7[10] = CFSTR("PXAssetCollectionActionTypeCustomizeMemory");
  v7[11] = CFSTR("PXAssetCollectionActionTypeToggleFavorite");
  v7[12] = CFSTR("PXAssetCollectionActionTypeDelete");
  v7[13] = CFSTR("PXAssetCollectionActionTypeFavoritePerson");
  v7[14] = CFSTR("PXAssetCollectionActionTypeCustomizePeopleAlbum");
  v7[15] = CFSTR("PXAssetCollectionActionTypeCustomizeSocialGroupAlbum");
  v7[16] = CFSTR("PXAssetCollectionActionTypeMoveOut");
  v7[17] = CFSTR("PXAssetCollectionActionTypeRemoveSocialGroupFromHome");
  v7[18] = CFSTR("PXAssetCollectionActionTypeBlockPerson");
  v7[19] = CFSTR("PXAssetCollectionActionTypeAddPersonToHome");
  v7[20] = CFSTR("PXAssetCollectionActionTypeRemovePersonFromHome");
  v7[21] = CFSTR("PXAssetCollectionActionTypeChangePersonSortOrder");
  v7[22] = CFSTR("PXPhotosGridActionAddPeople");
  v7[23] = CFSTR("PXPhotosGridActionManagePeople");
  v7[24] = CFSTR("PXAssetCollectionActionTypeFileRadar");
  v7[25] = CFSTR("PXAssetCollectionActionTypeDebugCuration");
  v7[26] = CFSTR("PXAssetCollectionActionTypeCopyInternalURL");
  v7[27] = CFSTR("PXPhotosGridActionShare");
  v7[28] = CFSTR("PXAssetCollectionActionTypeAddPersonToAutoCounter");
  v7[29] = CFSTR("PXPhotosGridActionShowFilters");
  v7[30] = CFSTR("PXPhotosGridActionUnfilter");
  v7[31] = CFSTR("PXPhotosGridActionToggleFavoritesFilter");
  v7[32] = CFSTR("PXPhotosGridActionToggleImagesFilter");
  v7[33] = CFSTR("PXPhotosGridActionToggleEditedFilter");
  v7[34] = CFSTR("PXPhotosGridActionToggleVideosFilter");
  v7[35] = CFSTR("PXPhotosGridActionToggleShowOnlyScreenshotsFilter");
  v7[36] = CFSTR("PXPhotosGridActionToggleAspectFit");
  v7[37] = CFSTR("PXPhotosGridActionShowMap");
  v7[38] = CFSTR("PXPhotosGridActionSearch");
  v7[39] = CFSTR("PXPhotosGridActionTogglePreviewHeader");
  v7[40] = CFSTR("PXPhotosGridActionToggleIncludeOthersInSocialGroupAssetsFilter");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 41);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_PXPhotosViewLensAllowedActionsForCuratedLens_allowedActions;
  _PXPhotosViewLensAllowedActionsForCuratedLens_allowedActions = v2;

  if (_os_feature_enabled_impl())
  {
    v4 = (void *)objc_msgSend((id)_PXPhotosViewLensAllowedActionsForCuratedLens_allowedActions, "mutableCopy");
    objc_msgSend(v4, "addObject:", CFSTR("PXAssetCollectionActionTypeImprovePeopleRecognition"));
    v5 = objc_msgSend(v4, "copy");
    v6 = (void *)_PXPhotosViewLensAllowedActionsForCuratedLens_allowedActions;
    _PXPhotosViewLensAllowedActionsForCuratedLens_allowedActions = v5;

  }
}

@end
