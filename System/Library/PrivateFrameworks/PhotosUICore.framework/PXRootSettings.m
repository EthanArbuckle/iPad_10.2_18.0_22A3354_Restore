@implementation PXRootSettings

+ (id)sharedInstance
{
  uint64_t v3;
  void *v4;

  os_unfair_lock_lock((os_unfair_lock_t)&PXSettingsSharedInstanceLock);
  if (!sharedInstance_sharedInstance_98411)
  {
    objc_msgSend(a1, "createSharedInstance");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)sharedInstance_sharedInstance_98411;
    sharedInstance_sharedInstance_98411 = v3;

  }
  os_unfair_lock_unlock((os_unfair_lock_t)&PXSettingsSharedInstanceLock);
  return (id)sharedInstance_sharedInstance_98411;
}

- (BOOL)private_wantsInternalUI
{
  return self->_private_wantsInternalUI;
}

- (BOOL)canShowInternalUI
{
  int HasInternalUI;

  HasInternalUI = PFOSVariantHasInternalUI();
  if (HasInternalUI)
    LOBYTE(HasInternalUI) = -[PXRootSettings private_wantsInternalUI](self, "private_wantsInternalUI");
  return HasInternalUI;
}

- (void)createChildren
{
  PXCPLStatusSettings *v3;
  PXCPLStatusSettings *cplStatusSettings;
  PXDuplicatesSettings *v5;
  PXDuplicatesSettings *duplicatesSettings;
  PXSharedAlbumsSettings *v7;
  PXSharedAlbumsSettings *sharedAlbumsSettings;
  PXAssetsRecoverySettings *v9;
  PXAssetsRecoverySettings *assetsRecoverySettings;
  PXDocumentMenuSettings *v11;
  PXDocumentMenuSettings *documentMenuSettings;
  PXMacSyncedAlbumsSettings *v13;
  PXMacSyncedAlbumsSettings *macSyncedAlbumsSettings;
  PXImageModulationSettings *v15;
  PXImageModulationSettings *imageModulationSettings;
  PXSharedLibrarySettings *v17;
  PXSharedLibrarySettings *sharedLibrarySettings;
  PXAlbumsDebugUISettings *v19;
  PXAlbumsDebugUISettings *albumsDebugUISettings;
  PXDragAndDropSettings *v21;
  PXDragAndDropSettings *dragAndDrop;
  PXForYouSettings *v23;
  PXForYouSettings *forYou;
  PXPhotoPickerSettings *v25;
  PXPhotoPickerSettings *photoPickerSettings;
  PXPeopleDetailSettings *v27;
  PXPeopleDetailSettings *peopleDetail;
  PXPhotosDetailsHeaderTileSettings *v29;
  PXPhotosDetailsHeaderTileSettings *photosDetailsHeaderTile;
  PXImportSettings *v31;
  PXImportSettings *importSettings;
  PXDiagnosticsSettings *v33;
  PXDiagnosticsSettings *diagnostics;
  PXInlineVideoStabilizationSettings *v35;
  PXInlineVideoStabilizationSettings *inlineVideoStabilizationSettings;
  PXPhotosDetailsNavigationSettings *v37;
  PXPhotosDetailsNavigationSettings *detailsNavigationSettings;
  PXPeopleUISettings *v39;
  PXPeopleUISettings *peopleUISettings;
  PXApplicationSettings *v41;
  PXApplicationSettings *applicationSettings;
  PXAudioSettings *v43;
  PXAudioSettings *audioSettings;
  PXStorySettings *v45;
  PXStorySettings *storySettings;
  PXVideoPlaybackSettings *v47;
  PXVideoPlaybackSettings *videoPlaybackSettings;
  PXAssetsSceneSettings *v49;
  PXAssetsSceneSettings *assetsScene;
  PXCompleteMyMomentSettings *v51;
  PXCompleteMyMomentSettings *completeMyMoment;
  PXCuratedLibrarySettings *v53;
  PXCuratedLibrarySettings *curatedLibrarySettings;
  PXCursorInteractionSettings *v55;
  PXCursorInteractionSettings *cursorInteractionSettings;
  PXPasteboardAssetSettings *v57;
  PXPasteboardAssetSettings *dragDropSettings;
  PXFooterSettings *v59;
  PXFooterSettings *footerSettings;
  PXGridSettings *v61;
  PXGridSettings *grid;
  PXGPPTSettings *v63;
  PXGPPTSettings *tungstenPPTSettings;
  PXKeyboardSettings *v65;
  PXKeyboardSettings *keyboardSettings;
  PXKitSettings *v67;
  PXKitSettings *kit;
  PXWorkaroundSettings *v69;
  PXWorkaroundSettings *workaroundSettings;
  PXMemoriesRelatedSettings *v71;
  PXMemoriesRelatedSettings *memoriesRelated;
  PXUpNextSettings *v73;
  PXUpNextSettings *upNextSettings;
  PXMemoriesFeedSettings *v75;
  PXMemoriesFeedSettings *memoryFeed;
  PXContentPrivacySettings *v77;
  PXContentPrivacySettings *contentPrivacySettings;
  PXContentSyndicationSettings *v79;
  PXContentSyndicationSettings *contentSyndicationSettings;
  PXMessagesUISettings *v81;
  PXMessagesUISettings *messagesUISettings;
  PXModelSettings *v83;
  PXModelSettings *model;
  PXOneUpSettings *v85;
  PXOneUpSettings *oneUpSettings;
  PXPhotosDataSourceSettings *v87;
  PXPhotosDataSourceSettings *photosDataSource;
  PXPhotosDetailsSettings *v89;
  PXPhotosDetailsSettings *photosDetails;
  PXPhotosGridSettings *v91;
  PXPhotosGridSettings *photosGridSettings;
  PXSearchSettings *v93;
  PXSearchSettings *searchSettings;
  PXSharingSettings *v95;
  PXSharingSettings *sharingSettings;
  PXGenerativeStorySettings *v97;
  PXGenerativeStorySettings *generativeStorySettings;
  PXStickersSettings *v99;
  PXStickersSettings *stickersSettings;
  PXTilingSettings *v101;
  PXTilingSettings *tiling;
  PXAssetVariationsSettings *v103;
  PXAssetVariationsSettings *variationsSettings;
  PXSwipeDownSettings *v105;
  PXSwipeDownSettings *swipeDownSettings;
  PXZoomablePhotosSettings *v107;
  PXZoomablePhotosSettings *zoomablePhotosSettings;
  PXMediaProviderSettings *v109;
  PXMediaProviderSettings *mediaProviderSettings;
  PXDisplayAssetViewDemoSettings *v111;
  PXDisplayAssetViewDemoSettings *assetViewDemoSettings;
  PXFocusSettings *v113;
  PXFocusSettings *focusSettings;
  PXSystemNavigationSettings *v115;
  PXSystemNavigationSettings *systemNavigationSettings;
  PXLemonadeSettings *v117;
  PXLemonadeSettings *lemonadeSettings;
  PXMapSettings *v119;
  PXMapSettings *mapSettings;

  v3 = -[PTSettings initWithDefaultValues]([PXCPLStatusSettings alloc], "initWithDefaultValues");
  cplStatusSettings = self->_cplStatusSettings;
  self->_cplStatusSettings = v3;

  v5 = -[PTSettings initWithDefaultValues]([PXDuplicatesSettings alloc], "initWithDefaultValues");
  duplicatesSettings = self->_duplicatesSettings;
  self->_duplicatesSettings = v5;

  v7 = -[PTSettings initWithDefaultValues]([PXSharedAlbumsSettings alloc], "initWithDefaultValues");
  sharedAlbumsSettings = self->_sharedAlbumsSettings;
  self->_sharedAlbumsSettings = v7;

  v9 = -[PTSettings initWithDefaultValues]([PXAssetsRecoverySettings alloc], "initWithDefaultValues");
  assetsRecoverySettings = self->_assetsRecoverySettings;
  self->_assetsRecoverySettings = v9;

  v11 = -[PTSettings initWithDefaultValues]([PXDocumentMenuSettings alloc], "initWithDefaultValues");
  documentMenuSettings = self->_documentMenuSettings;
  self->_documentMenuSettings = v11;

  v13 = -[PTSettings initWithDefaultValues]([PXMacSyncedAlbumsSettings alloc], "initWithDefaultValues");
  macSyncedAlbumsSettings = self->_macSyncedAlbumsSettings;
  self->_macSyncedAlbumsSettings = v13;

  v15 = -[PTSettings initWithDefaultValues]([PXImageModulationSettings alloc], "initWithDefaultValues");
  imageModulationSettings = self->_imageModulationSettings;
  self->_imageModulationSettings = v15;

  v17 = -[PTSettings initWithDefaultValues]([PXSharedLibrarySettings alloc], "initWithDefaultValues");
  sharedLibrarySettings = self->_sharedLibrarySettings;
  self->_sharedLibrarySettings = v17;

  v19 = -[PTSettings initWithDefaultValues]([PXAlbumsDebugUISettings alloc], "initWithDefaultValues");
  albumsDebugUISettings = self->_albumsDebugUISettings;
  self->_albumsDebugUISettings = v19;

  v21 = -[PTSettings initWithDefaultValues]([PXDragAndDropSettings alloc], "initWithDefaultValues");
  dragAndDrop = self->_dragAndDrop;
  self->_dragAndDrop = v21;

  v23 = -[PTSettings initWithDefaultValues]([PXForYouSettings alloc], "initWithDefaultValues");
  forYou = self->_forYou;
  self->_forYou = v23;

  v25 = -[PTSettings initWithDefaultValues]([PXPhotoPickerSettings alloc], "initWithDefaultValues");
  photoPickerSettings = self->_photoPickerSettings;
  self->_photoPickerSettings = v25;

  v27 = -[PTSettings initWithDefaultValues]([PXPeopleDetailSettings alloc], "initWithDefaultValues");
  peopleDetail = self->_peopleDetail;
  self->_peopleDetail = v27;

  v29 = -[PTSettings initWithDefaultValues]([PXPhotosDetailsHeaderTileSettings alloc], "initWithDefaultValues");
  photosDetailsHeaderTile = self->_photosDetailsHeaderTile;
  self->_photosDetailsHeaderTile = v29;

  v31 = -[PTSettings initWithDefaultValues]([PXImportSettings alloc], "initWithDefaultValues");
  importSettings = self->_importSettings;
  self->_importSettings = v31;

  v33 = -[PTSettings initWithDefaultValues]([PXDiagnosticsSettings alloc], "initWithDefaultValues");
  diagnostics = self->_diagnostics;
  self->_diagnostics = v33;

  v35 = -[PTSettings initWithDefaultValues]([PXInlineVideoStabilizationSettings alloc], "initWithDefaultValues");
  inlineVideoStabilizationSettings = self->_inlineVideoStabilizationSettings;
  self->_inlineVideoStabilizationSettings = v35;

  v37 = -[PTSettings initWithDefaultValues]([PXPhotosDetailsNavigationSettings alloc], "initWithDefaultValues");
  detailsNavigationSettings = self->_detailsNavigationSettings;
  self->_detailsNavigationSettings = v37;

  v39 = -[PTSettings initWithDefaultValues]([PXPeopleUISettings alloc], "initWithDefaultValues");
  peopleUISettings = self->_peopleUISettings;
  self->_peopleUISettings = v39;

  v41 = -[PTSettings initWithDefaultValues]([PXApplicationSettings alloc], "initWithDefaultValues");
  applicationSettings = self->_applicationSettings;
  self->_applicationSettings = v41;

  v43 = -[PTSettings initWithDefaultValues]([PXAudioSettings alloc], "initWithDefaultValues");
  audioSettings = self->_audioSettings;
  self->_audioSettings = v43;

  v45 = -[PTSettings initWithDefaultValues]([PXStorySettings alloc], "initWithDefaultValues");
  storySettings = self->_storySettings;
  self->_storySettings = v45;

  v47 = -[PTSettings initWithDefaultValues]([PXVideoPlaybackSettings alloc], "initWithDefaultValues");
  videoPlaybackSettings = self->_videoPlaybackSettings;
  self->_videoPlaybackSettings = v47;

  v49 = -[PTSettings initWithDefaultValues]([PXAssetsSceneSettings alloc], "initWithDefaultValues");
  assetsScene = self->_assetsScene;
  self->_assetsScene = v49;

  v51 = -[PTSettings initWithDefaultValues]([PXCompleteMyMomentSettings alloc], "initWithDefaultValues");
  completeMyMoment = self->_completeMyMoment;
  self->_completeMyMoment = v51;

  v53 = -[PTSettings initWithDefaultValues]([PXCuratedLibrarySettings alloc], "initWithDefaultValues");
  curatedLibrarySettings = self->_curatedLibrarySettings;
  self->_curatedLibrarySettings = v53;

  v55 = -[PTSettings initWithDefaultValues]([PXCursorInteractionSettings alloc], "initWithDefaultValues");
  cursorInteractionSettings = self->_cursorInteractionSettings;
  self->_cursorInteractionSettings = v55;

  v57 = -[PTSettings initWithDefaultValues]([PXPasteboardAssetSettings alloc], "initWithDefaultValues");
  dragDropSettings = self->_dragDropSettings;
  self->_dragDropSettings = v57;

  v59 = -[PTSettings initWithDefaultValues]([PXFooterSettings alloc], "initWithDefaultValues");
  footerSettings = self->_footerSettings;
  self->_footerSettings = v59;

  v61 = -[PTSettings initWithDefaultValues]([PXGridSettings alloc], "initWithDefaultValues");
  grid = self->_grid;
  self->_grid = v61;

  v63 = -[PTSettings initWithDefaultValues]([PXGPPTSettings alloc], "initWithDefaultValues");
  tungstenPPTSettings = self->_tungstenPPTSettings;
  self->_tungstenPPTSettings = v63;

  v65 = -[PTSettings initWithDefaultValues]([PXKeyboardSettings alloc], "initWithDefaultValues");
  keyboardSettings = self->_keyboardSettings;
  self->_keyboardSettings = v65;

  v67 = -[PTSettings initWithDefaultValues]([PXKitSettings alloc], "initWithDefaultValues");
  kit = self->_kit;
  self->_kit = v67;

  v69 = -[PTSettings initWithDefaultValues]([PXWorkaroundSettings alloc], "initWithDefaultValues");
  workaroundSettings = self->_workaroundSettings;
  self->_workaroundSettings = v69;

  v71 = -[PTSettings initWithDefaultValues]([PXMemoriesRelatedSettings alloc], "initWithDefaultValues");
  memoriesRelated = self->_memoriesRelated;
  self->_memoriesRelated = v71;

  v73 = -[PTSettings initWithDefaultValues]([PXUpNextSettings alloc], "initWithDefaultValues");
  upNextSettings = self->_upNextSettings;
  self->_upNextSettings = v73;

  v75 = -[PTSettings initWithDefaultValues]([PXMemoriesFeedSettings alloc], "initWithDefaultValues");
  memoryFeed = self->_memoryFeed;
  self->_memoryFeed = v75;

  v77 = -[PTSettings initWithDefaultValues]([PXContentPrivacySettings alloc], "initWithDefaultValues");
  contentPrivacySettings = self->_contentPrivacySettings;
  self->_contentPrivacySettings = v77;

  v79 = -[PTSettings initWithDefaultValues]([PXContentSyndicationSettings alloc], "initWithDefaultValues");
  contentSyndicationSettings = self->_contentSyndicationSettings;
  self->_contentSyndicationSettings = v79;

  v81 = -[PTSettings initWithDefaultValues]([PXMessagesUISettings alloc], "initWithDefaultValues");
  messagesUISettings = self->_messagesUISettings;
  self->_messagesUISettings = v81;

  v83 = -[PTSettings initWithDefaultValues]([PXModelSettings alloc], "initWithDefaultValues");
  model = self->_model;
  self->_model = v83;

  v85 = -[PTSettings initWithDefaultValues]([PXOneUpSettings alloc], "initWithDefaultValues");
  oneUpSettings = self->_oneUpSettings;
  self->_oneUpSettings = v85;

  v87 = -[PTSettings initWithDefaultValues]([PXPhotosDataSourceSettings alloc], "initWithDefaultValues");
  photosDataSource = self->_photosDataSource;
  self->_photosDataSource = v87;

  v89 = -[PTSettings initWithDefaultValues]([PXPhotosDetailsSettings alloc], "initWithDefaultValues");
  photosDetails = self->_photosDetails;
  self->_photosDetails = v89;

  v91 = -[PTSettings initWithDefaultValues]([PXPhotosGridSettings alloc], "initWithDefaultValues");
  photosGridSettings = self->_photosGridSettings;
  self->_photosGridSettings = v91;

  v93 = -[PTSettings initWithDefaultValues]([PXSearchSettings alloc], "initWithDefaultValues");
  searchSettings = self->_searchSettings;
  self->_searchSettings = v93;

  v95 = -[PTSettings initWithDefaultValues]([PXSharingSettings alloc], "initWithDefaultValues");
  sharingSettings = self->_sharingSettings;
  self->_sharingSettings = v95;

  v97 = -[PTSettings initWithDefaultValues]([PXGenerativeStorySettings alloc], "initWithDefaultValues");
  generativeStorySettings = self->_generativeStorySettings;
  self->_generativeStorySettings = v97;

  v99 = -[PTSettings initWithDefaultValues]([PXStickersSettings alloc], "initWithDefaultValues");
  stickersSettings = self->_stickersSettings;
  self->_stickersSettings = v99;

  v101 = -[PTSettings initWithDefaultValues]([PXTilingSettings alloc], "initWithDefaultValues");
  tiling = self->_tiling;
  self->_tiling = v101;

  v103 = -[PTSettings initWithDefaultValues]([PXAssetVariationsSettings alloc], "initWithDefaultValues");
  variationsSettings = self->_variationsSettings;
  self->_variationsSettings = v103;

  v105 = -[PTSettings initWithDefaultValues]([PXSwipeDownSettings alloc], "initWithDefaultValues");
  swipeDownSettings = self->_swipeDownSettings;
  self->_swipeDownSettings = v105;

  v107 = -[PTSettings initWithDefaultValues]([PXZoomablePhotosSettings alloc], "initWithDefaultValues");
  zoomablePhotosSettings = self->_zoomablePhotosSettings;
  self->_zoomablePhotosSettings = v107;

  v109 = -[PTSettings initWithDefaultValues]([PXMediaProviderSettings alloc], "initWithDefaultValues");
  mediaProviderSettings = self->_mediaProviderSettings;
  self->_mediaProviderSettings = v109;

  v111 = -[PTSettings initWithDefaultValues]([PXDisplayAssetViewDemoSettings alloc], "initWithDefaultValues");
  assetViewDemoSettings = self->_assetViewDemoSettings;
  self->_assetViewDemoSettings = v111;

  v113 = -[PTSettings initWithDefaultValues]([PXFocusSettings alloc], "initWithDefaultValues");
  focusSettings = self->_focusSettings;
  self->_focusSettings = v113;

  v115 = -[PTSettings initWithDefaultValues]([PXSystemNavigationSettings alloc], "initWithDefaultValues");
  systemNavigationSettings = self->_systemNavigationSettings;
  self->_systemNavigationSettings = v115;

  v117 = -[PTSettings initWithDefaultValues]([PXLemonadeSettings alloc], "initWithDefaultValues");
  lemonadeSettings = self->_lemonadeSettings;
  self->_lemonadeSettings = v117;

  v119 = -[PTSettings initWithDefaultValues]([PXMapSettings alloc], "initWithDefaultValues");
  mapSettings = self->_mapSettings;
  self->_mapSettings = v119;

}

- (PXContentSyndicationSettings)contentSyndicationSettings
{
  return self->_contentSyndicationSettings;
}

- (PXCursorInteractionSettings)cursorInteractionSettings
{
  return self->_cursorInteractionSettings;
}

- (PXZoomablePhotosSettings)zoomablePhotosSettings
{
  return self->_zoomablePhotosSettings;
}

- (PXCuratedLibrarySettings)curatedLibrarySettings
{
  return self->_curatedLibrarySettings;
}

- (PXSharedLibrarySettings)sharedLibrarySettings
{
  return self->_sharedLibrarySettings;
}

- (PXPhotosDetailsSettings)photosDetails
{
  return self->_photosDetails;
}

- (PXDragAndDropSettings)dragAndDrop
{
  return self->_dragAndDrop;
}

- (PXDiagnosticsSettings)diagnostics
{
  return self->_diagnostics;
}

- (PXApplicationSettings)applicationSettings
{
  return self->_applicationSettings;
}

- (PXPhotosGridSettings)photosGridSettings
{
  return self->_photosGridSettings;
}

- (PXKeyboardSettings)keyboardSettings
{
  return self->_keyboardSettings;
}

- (PXSharingSettings)sharingSettings
{
  return self->_sharingSettings;
}

- (PXForYouSettings)forYou
{
  return self->_forYou;
}

- (PXFocusSettings)focusSettings
{
  return self->_focusSettings;
}

- (PXGridSettings)grid
{
  return self->_grid;
}

- (PXKitSettings)kit
{
  return self->_kit;
}

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXRootSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[PXRootSettings setPrivate_wantsInternalUI:](self, "setPrivate_wantsInternalUI:", 1);
  -[PXRootSettings setShowLibraryFilterTip:](self, "setShowLibraryFilterTip:", 0);
}

- (void)setShowLibraryFilterTip:(BOOL)a3
{
  const __CFString *v3;
  id v4;

  if (self->_showLibraryFilterTip != a3)
  {
    self->_showLibraryFilterTip = a3;
    if (a3)
      v3 = CFSTR("PhotosLibraryTipContextMock");
    else
      v3 = 0;
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setValue:forKey:", v3, CFSTR("TipKitOverrideAlwaysDisplayContentForContext"));

  }
}

- (void)setPrivate_wantsInternalUI:(BOOL)a3
{
  self->_private_wantsInternalUI = a3;
}

- (PXPhotosDataSourceSettings)photosDataSource
{
  return self->_photosDataSource;
}

- (PXStorySettings)storySettings
{
  return self->_storySettings;
}

- (id)parentSettings
{
  return 0;
}

- (void)setHideWIPAlerts:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", v3, CFSTR("PXRootSettingsHideWIPAlerts"));

}

- (BOOL)hideWIPAlerts
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("PXRootSettingsHideWIPAlerts"));

  return v3;
}

- (void)setDiagnostics:(id)a3
{
  objc_storeStrong((id *)&self->_diagnostics, a3);
}

- (PXPhotosDetailsNavigationSettings)detailsNavigationSettings
{
  return self->_detailsNavigationSettings;
}

- (void)setDetailsNavigationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_detailsNavigationSettings, a3);
}

- (void)setStorySettings:(id)a3
{
  objc_storeStrong((id *)&self->_storySettings, a3);
}

- (PXImageModulationSettings)imageModulationSettings
{
  return self->_imageModulationSettings;
}

- (void)setImageModulationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_imageModulationSettings, a3);
}

- (void)setZoomablePhotosSettings:(id)a3
{
  objc_storeStrong((id *)&self->_zoomablePhotosSettings, a3);
}

- (void)setCuratedLibrarySettings:(id)a3
{
  objc_storeStrong((id *)&self->_curatedLibrarySettings, a3);
}

- (PXPhotoPickerSettings)photoPickerSettings
{
  return self->_photoPickerSettings;
}

- (void)setPhotoPickerSettings:(id)a3
{
  objc_storeStrong((id *)&self->_photoPickerSettings, a3);
}

- (void)setKeyboardSettings:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardSettings, a3);
}

- (PXVideoPlaybackSettings)videoPlaybackSettings
{
  return self->_videoPlaybackSettings;
}

- (void)setVideoPlaybackSettings:(id)a3
{
  objc_storeStrong((id *)&self->_videoPlaybackSettings, a3);
}

- (PXOneUpSettings)oneUpSettings
{
  return self->_oneUpSettings;
}

- (void)setOneUpSettings:(id)a3
{
  objc_storeStrong((id *)&self->_oneUpSettings, a3);
}

- (void)setPhotosDetails:(id)a3
{
  objc_storeStrong((id *)&self->_photosDetails, a3);
}

- (PXPhotosDetailsHeaderTileSettings)photosDetailsHeaderTile
{
  return self->_photosDetailsHeaderTile;
}

- (void)setPhotosDetailsHeaderTile:(id)a3
{
  objc_storeStrong((id *)&self->_photosDetailsHeaderTile, a3);
}

- (PXMemoriesFeedSettings)memoryFeed
{
  return self->_memoryFeed;
}

- (void)setMemoryFeed:(id)a3
{
  objc_storeStrong((id *)&self->_memoryFeed, a3);
}

- (PXMemoriesRelatedSettings)memoriesRelated
{
  return self->_memoriesRelated;
}

- (void)setMemoriesRelated:(id)a3
{
  objc_storeStrong((id *)&self->_memoriesRelated, a3);
}

- (PXUpNextSettings)upNextSettings
{
  return self->_upNextSettings;
}

- (void)setUpNextSettings:(id)a3
{
  objc_storeStrong((id *)&self->_upNextSettings, a3);
}

- (PXContentPrivacySettings)contentPrivacySettings
{
  return self->_contentPrivacySettings;
}

- (void)setContentPrivacySettings:(id)a3
{
  objc_storeStrong((id *)&self->_contentPrivacySettings, a3);
}

- (void)setContentSyndicationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_contentSyndicationSettings, a3);
}

- (PXMessagesUISettings)messagesUISettings
{
  return self->_messagesUISettings;
}

- (void)setMessagesUISettings:(id)a3
{
  objc_storeStrong((id *)&self->_messagesUISettings, a3);
}

- (PXAssetsSceneSettings)assetsScene
{
  return self->_assetsScene;
}

- (void)setAssetsScene:(id)a3
{
  objc_storeStrong((id *)&self->_assetsScene, a3);
}

- (void)setPhotosDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_photosDataSource, a3);
}

- (PXTilingSettings)tiling
{
  return self->_tiling;
}

- (void)setTiling:(id)a3
{
  objc_storeStrong((id *)&self->_tiling, a3);
}

- (PXModelSettings)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
}

- (void)setKit:(id)a3
{
  objc_storeStrong((id *)&self->_kit, a3);
}

- (PXWorkaroundSettings)workaroundSettings
{
  return self->_workaroundSettings;
}

- (void)setWorkaroundSettings:(id)a3
{
  objc_storeStrong((id *)&self->_workaroundSettings, a3);
}

- (PXGPPTSettings)tungstenPPTSettings
{
  return self->_tungstenPPTSettings;
}

- (void)setTungstenPPTSettings:(id)a3
{
  objc_storeStrong((id *)&self->_tungstenPPTSettings, a3);
}

- (PXSwipeDownSettings)swipeDownSettings
{
  return self->_swipeDownSettings;
}

- (void)setSwipeDownSettings:(id)a3
{
  objc_storeStrong((id *)&self->_swipeDownSettings, a3);
}

- (PXPeopleDetailSettings)peopleDetail
{
  return self->_peopleDetail;
}

- (void)setPeopleDetail:(id)a3
{
  objc_storeStrong((id *)&self->_peopleDetail, a3);
}

- (PXPeopleUISettings)peopleUISettings
{
  return self->_peopleUISettings;
}

- (void)setPeopleUISettings:(id)a3
{
  objc_storeStrong((id *)&self->_peopleUISettings, a3);
}

- (void)setDragAndDrop:(id)a3
{
  objc_storeStrong((id *)&self->_dragAndDrop, a3);
}

- (void)setCursorInteractionSettings:(id)a3
{
  objc_storeStrong((id *)&self->_cursorInteractionSettings, a3);
}

- (void)setSharingSettings:(id)a3
{
  objc_storeStrong((id *)&self->_sharingSettings, a3);
}

- (PXAssetVariationsSettings)variationsSettings
{
  return self->_variationsSettings;
}

- (void)setVariationsSettings:(id)a3
{
  objc_storeStrong((id *)&self->_variationsSettings, a3);
}

- (PXAssetsRecoverySettings)assetsRecoverySettings
{
  return self->_assetsRecoverySettings;
}

- (void)setAssetsRecoverySettings:(id)a3
{
  objc_storeStrong((id *)&self->_assetsRecoverySettings, a3);
}

- (PXCompleteMyMomentSettings)completeMyMoment
{
  return self->_completeMyMoment;
}

- (void)setCompleteMyMoment:(id)a3
{
  objc_storeStrong((id *)&self->_completeMyMoment, a3);
}

- (void)setForYou:(id)a3
{
  objc_storeStrong((id *)&self->_forYou, a3);
}

- (void)setGrid:(id)a3
{
  objc_storeStrong((id *)&self->_grid, a3);
}

- (PXImportSettings)importSettings
{
  return self->_importSettings;
}

- (void)setImportSettings:(id)a3
{
  objc_storeStrong((id *)&self->_importSettings, a3);
}

- (PXSearchSettings)searchSettings
{
  return self->_searchSettings;
}

- (void)setSearchSettings:(id)a3
{
  objc_storeStrong((id *)&self->_searchSettings, a3);
}

- (PXAlbumsDebugUISettings)albumsDebugUISettings
{
  return self->_albumsDebugUISettings;
}

- (void)setAlbumsDebugUISettings:(id)a3
{
  objc_storeStrong((id *)&self->_albumsDebugUISettings, a3);
}

- (void)setApplicationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_applicationSettings, a3);
}

- (PXFooterSettings)footerSettings
{
  return self->_footerSettings;
}

- (void)setFooterSettings:(id)a3
{
  objc_storeStrong((id *)&self->_footerSettings, a3);
}

- (void)setPhotosGridSettings:(id)a3
{
  objc_storeStrong((id *)&self->_photosGridSettings, a3);
}

- (void)setSharedLibrarySettings:(id)a3
{
  objc_storeStrong((id *)&self->_sharedLibrarySettings, a3);
}

- (PXGenerativeStorySettings)generativeStorySettings
{
  return self->_generativeStorySettings;
}

- (void)setGenerativeStorySettings:(id)a3
{
  objc_storeStrong((id *)&self->_generativeStorySettings, a3);
}

- (PXLemonadeSettings)lemonadeSettings
{
  return self->_lemonadeSettings;
}

- (void)setLemonadeSettings:(id)a3
{
  objc_storeStrong((id *)&self->_lemonadeSettings, a3);
}

- (PXCPLStatusSettings)cplStatusSettings
{
  return self->_cplStatusSettings;
}

- (void)setCplStatusSettings:(id)a3
{
  objc_storeStrong((id *)&self->_cplStatusSettings, a3);
}

- (PXDuplicatesSettings)duplicatesSettings
{
  return self->_duplicatesSettings;
}

- (void)setDuplicatesSettings:(id)a3
{
  objc_storeStrong((id *)&self->_duplicatesSettings, a3);
}

- (PXDocumentMenuSettings)documentMenuSettings
{
  return self->_documentMenuSettings;
}

- (void)setDocumentMenuSettings:(id)a3
{
  objc_storeStrong((id *)&self->_documentMenuSettings, a3);
}

- (PXMacSyncedAlbumsSettings)macSyncedAlbumsSettings
{
  return self->_macSyncedAlbumsSettings;
}

- (void)setMacSyncedAlbumsSettings:(id)a3
{
  objc_storeStrong((id *)&self->_macSyncedAlbumsSettings, a3);
}

- (PXInlineVideoStabilizationSettings)inlineVideoStabilizationSettings
{
  return self->_inlineVideoStabilizationSettings;
}

- (void)setInlineVideoStabilizationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_inlineVideoStabilizationSettings, a3);
}

- (BOOL)showLibraryFilterTip
{
  return self->_showLibraryFilterTip;
}

- (PXAudioSettings)audioSettings
{
  return self->_audioSettings;
}

- (void)setAudioSettings:(id)a3
{
  objc_storeStrong((id *)&self->_audioSettings, a3);
}

- (PXMediaProviderSettings)mediaProviderSettings
{
  return self->_mediaProviderSettings;
}

- (void)setMediaProviderSettings:(id)a3
{
  objc_storeStrong((id *)&self->_mediaProviderSettings, a3);
}

- (PXPasteboardAssetSettings)dragDropSettings
{
  return self->_dragDropSettings;
}

- (void)setDragDropSettings:(id)a3
{
  objc_storeStrong((id *)&self->_dragDropSettings, a3);
}

- (PXDisplayAssetViewDemoSettings)assetViewDemoSettings
{
  return self->_assetViewDemoSettings;
}

- (void)setAssetViewDemoSettings:(id)a3
{
  objc_storeStrong((id *)&self->_assetViewDemoSettings, a3);
}

- (void)setFocusSettings:(id)a3
{
  objc_storeStrong((id *)&self->_focusSettings, a3);
}

- (PXSystemNavigationSettings)systemNavigationSettings
{
  return self->_systemNavigationSettings;
}

- (void)setSystemNavigationSettings:(id)a3
{
  objc_storeStrong((id *)&self->_systemNavigationSettings, a3);
}

- (PXStickersSettings)stickersSettings
{
  return self->_stickersSettings;
}

- (void)setStickersSettings:(id)a3
{
  objc_storeStrong((id *)&self->_stickersSettings, a3);
}

- (PXMapSettings)mapSettings
{
  return self->_mapSettings;
}

- (void)setMapSettings:(id)a3
{
  objc_storeStrong((id *)&self->_mapSettings, a3);
}

- (PXSharedAlbumsSettings)sharedAlbumsSettings
{
  return self->_sharedAlbumsSettings;
}

- (void)setSharedAlbumsSettings:(id)a3
{
  objc_storeStrong((id *)&self->_sharedAlbumsSettings, a3);
}

- (BOOL)showWIPAlertRadar
{
  return self->_showWIPAlertRadar;
}

- (void)setShowWIPAlertRadar:(BOOL)a3
{
  self->_showWIPAlertRadar = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedAlbumsSettings, 0);
  objc_storeStrong((id *)&self->_mapSettings, 0);
  objc_storeStrong((id *)&self->_stickersSettings, 0);
  objc_storeStrong((id *)&self->_systemNavigationSettings, 0);
  objc_storeStrong((id *)&self->_focusSettings, 0);
  objc_storeStrong((id *)&self->_assetViewDemoSettings, 0);
  objc_storeStrong((id *)&self->_dragDropSettings, 0);
  objc_storeStrong((id *)&self->_mediaProviderSettings, 0);
  objc_storeStrong((id *)&self->_audioSettings, 0);
  objc_storeStrong((id *)&self->_inlineVideoStabilizationSettings, 0);
  objc_storeStrong((id *)&self->_macSyncedAlbumsSettings, 0);
  objc_storeStrong((id *)&self->_documentMenuSettings, 0);
  objc_storeStrong((id *)&self->_duplicatesSettings, 0);
  objc_storeStrong((id *)&self->_cplStatusSettings, 0);
  objc_storeStrong((id *)&self->_lemonadeSettings, 0);
  objc_storeStrong((id *)&self->_generativeStorySettings, 0);
  objc_storeStrong((id *)&self->_sharedLibrarySettings, 0);
  objc_storeStrong((id *)&self->_photosGridSettings, 0);
  objc_storeStrong((id *)&self->_footerSettings, 0);
  objc_storeStrong((id *)&self->_applicationSettings, 0);
  objc_storeStrong((id *)&self->_albumsDebugUISettings, 0);
  objc_storeStrong((id *)&self->_searchSettings, 0);
  objc_storeStrong((id *)&self->_importSettings, 0);
  objc_storeStrong((id *)&self->_grid, 0);
  objc_storeStrong((id *)&self->_forYou, 0);
  objc_storeStrong((id *)&self->_completeMyMoment, 0);
  objc_storeStrong((id *)&self->_assetsRecoverySettings, 0);
  objc_storeStrong((id *)&self->_variationsSettings, 0);
  objc_storeStrong((id *)&self->_sharingSettings, 0);
  objc_storeStrong((id *)&self->_cursorInteractionSettings, 0);
  objc_storeStrong((id *)&self->_dragAndDrop, 0);
  objc_storeStrong((id *)&self->_peopleUISettings, 0);
  objc_storeStrong((id *)&self->_peopleDetail, 0);
  objc_storeStrong((id *)&self->_swipeDownSettings, 0);
  objc_storeStrong((id *)&self->_tungstenPPTSettings, 0);
  objc_storeStrong((id *)&self->_workaroundSettings, 0);
  objc_storeStrong((id *)&self->_kit, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_tiling, 0);
  objc_storeStrong((id *)&self->_photosDataSource, 0);
  objc_storeStrong((id *)&self->_assetsScene, 0);
  objc_storeStrong((id *)&self->_messagesUISettings, 0);
  objc_storeStrong((id *)&self->_contentSyndicationSettings, 0);
  objc_storeStrong((id *)&self->_contentPrivacySettings, 0);
  objc_storeStrong((id *)&self->_upNextSettings, 0);
  objc_storeStrong((id *)&self->_memoriesRelated, 0);
  objc_storeStrong((id *)&self->_memoryFeed, 0);
  objc_storeStrong((id *)&self->_photosDetailsHeaderTile, 0);
  objc_storeStrong((id *)&self->_photosDetails, 0);
  objc_storeStrong((id *)&self->_oneUpSettings, 0);
  objc_storeStrong((id *)&self->_videoPlaybackSettings, 0);
  objc_storeStrong((id *)&self->_keyboardSettings, 0);
  objc_storeStrong((id *)&self->_photoPickerSettings, 0);
  objc_storeStrong((id *)&self->_curatedLibrarySettings, 0);
  objc_storeStrong((id *)&self->_zoomablePhotosSettings, 0);
  objc_storeStrong((id *)&self->_imageModulationSettings, 0);
  objc_storeStrong((id *)&self->_storySettings, 0);
  objc_storeStrong((id *)&self->_detailsNavigationSettings, 0);
  objc_storeStrong((id *)&self->_diagnostics, 0);
}

+ (id)settingsControllerModule
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v119;
  _QWORD v120[5];
  _QWORD v121[3];
  _QWORD v122[6];
  _QWORD v123[50];
  _QWORD v124[3];

  v124[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83078];
  v3 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_private_wantsInternalUI);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rowWithTitle:valueKeyPath:", CFSTR("Internal UI"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v124[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v124, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:", v6);
  v119 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (_os_feature_enabled_impl())
  {
    v8 = (void *)MEMORY[0x1E0D83048];
    NSStringFromSelector(sel_lemonadeSettings);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "rowWithTitle:childSettingsKeyPath:", CFSTR("Lemonade"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v10);

  }
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Diagnostics"), CFSTR("diagnostics"));
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v123[0] = v116;
  v11 = (void *)MEMORY[0x1E0D83048];
  NSStringFromSelector(sel_detailsNavigationSettings);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "rowWithTitle:childSettingsKeyPath:", CFSTR("Details Navigation"), v114);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v123[1] = v113;
  v12 = (void *)MEMORY[0x1E0D83048];
  NSStringFromSelector(sel_storySettings);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "rowWithTitle:childSettingsKeyPath:", CFSTR("Interactive Memories"), v112);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v123[2] = v111;
  v13 = (void *)MEMORY[0x1E0D83048];
  NSStringFromSelector(sel_photosGridSettings);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "rowWithTitle:childSettingsKeyPath:", CFSTR("Photos Grid"), v110);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v123[3] = v109;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Zoomable Photos"), CFSTR("zoomablePhotosSettings"));
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v123[4] = v108;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Curated Library"), CFSTR("curatedLibrarySettings"));
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v123[5] = v107;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Footer"), CFSTR("footerSettings"));
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v123[6] = v106;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Photo Picker"), CFSTR("photoPickerSettings"));
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v123[7] = v105;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Image Modulation Settings"), CFSTR("imageModulationSettings"));
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v123[8] = v104;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Tungsten PPT"), CFSTR("tungstenPPTSettings"));
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v123[9] = v103;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Keyboard"), CFSTR("keyboardSettings"));
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v123[10] = v102;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Photos Details"), CFSTR("photosDetails"));
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v123[11] = v101;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Photos Details Header Tile"), CFSTR("photosDetailsHeaderTile"));
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v123[12] = v100;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Memory Feed"), CFSTR("memoryFeed"));
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v123[13] = v99;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Memories & Related"), CFSTR("memoriesRelated"));
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v123[14] = v98;
  v14 = (void *)MEMORY[0x1E0D83048];
  NSStringFromSelector(sel_upNextSettings);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "rowWithTitle:childSettingsKeyPath:", CFSTR("Up Next"), v97);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v123[15] = v96;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Content Privacy"), CFSTR("contentPrivacySettings"));
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v123[16] = v95;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Content Syndication"), CFSTR("contentSyndicationSettings"));
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v123[17] = v94;
  v15 = (void *)MEMORY[0x1E0D83048];
  NSStringFromSelector(sel_messagesUISettings);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "rowWithTitle:childSettingsKeyPath:", CFSTR("Messages UI"), v93);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v123[18] = v92;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Assets Scene"), CFSTR("assetsScene"));
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v123[19] = v91;
  v16 = (void *)MEMORY[0x1E0D83048];
  NSStringFromSelector(sel_assetsRecoverySettings);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "rowWithTitle:childSettingsKeyPath:", CFSTR("Assets Recovery"), v90);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v123[20] = v89;
  v17 = (void *)MEMORY[0x1E0D83048];
  NSStringFromSelector(sel_oneUpSettings);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "rowWithTitle:childSettingsKeyPath:", CFSTR("One Up"), v88);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v123[21] = v87;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Photos Data Source"), CFSTR("photosDataSource"));
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v123[22] = v86;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Tiling"), CFSTR("tiling"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v123[23] = v85;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Model"), CFSTR("model"));
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v123[24] = v84;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Kit"), CFSTR("kit"));
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v123[25] = v83;
  v18 = (void *)MEMORY[0x1E0D83048];
  NSStringFromSelector(sel_workaroundSettings);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "rowWithTitle:childSettingsKeyPath:", CFSTR("Workarounds"), v82);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v123[26] = v81;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Drag & Drop"), CFSTR("dragAndDrop"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v123[27] = v80;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Cursor Interaction"), CFSTR("cursorInteractionSettings"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v123[28] = v79;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("People Debug"), CFSTR("peopleDetail"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v123[29] = v78;
  v19 = (void *)MEMORY[0x1E0D83048];
  NSStringFromSelector(sel_peopleUISettings);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "rowWithTitle:childSettingsKeyPath:", CFSTR("People UI"), v77);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v123[30] = v75;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Sharing"), CFSTR("sharingSettings"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v123[31] = v74;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Variations"), CFSTR("variationsSettings"));
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v123[32] = v73;
  v20 = (void *)MEMORY[0x1E0D83048];
  NSStringFromSelector(sel_swipeDownSettings);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "rowWithTitle:childSettingsKeyPath:", CFSTR("Swipe Down"), v72);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v123[33] = v71;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Complete My Moment"), CFSTR("completeMyMoment"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v123[34] = v70;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("For You"), CFSTR("forYou"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v123[35] = v69;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Grid"), CFSTR("grid"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v123[36] = v68;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Search"), CFSTR("searchSettings"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v123[37] = v67;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Stickers"), CFSTR("stickersSettings"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v123[38] = v66;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Albums Debug UI"), CFSTR("albumsDebugUISettings"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v123[39] = v65;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Application"), CFSTR("applicationSettings"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v123[40] = v64;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Import"), CFSTR("importSettings"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v123[41] = v63;
  v21 = (void *)MEMORY[0x1E0D83048];
  NSStringFromSelector(sel_systemNavigationSettings);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "rowWithTitle:childSettingsKeyPath:", CFSTR("System Navigation"), v62);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v123[42] = v61;
  v22 = (void *)MEMORY[0x1E0D83048];
  NSStringFromSelector(sel_mediaProviderSettings);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "rowWithTitle:childSettingsKeyPath:", CFSTR("Media Provider"), v60);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v123[43] = v59;
  v23 = (void *)MEMORY[0x1E0D83048];
  NSStringFromSelector(sel_videoPlaybackSettings);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "rowWithTitle:childSettingsKeyPath:", CFSTR("Video Playback"), v58);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v123[44] = v57;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Inline Video Stabilization"), CFSTR("inlineVideoStabilizationSettings"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v123[45] = v56;
  v24 = (void *)MEMORY[0x1E0D83048];
  NSStringFromSelector(sel_mapSettings);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "rowWithTitle:childSettingsKeyPath:", CFSTR("Maps"), v55);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v123[46] = v25;
  v26 = (void *)MEMORY[0x1E0D83048];
  NSStringFromSelector(sel_sharedAlbumsSettings);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "rowWithTitle:childSettingsKeyPath:", CFSTR("Shared Albums"), v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v123[47] = v28;
  v29 = (void *)MEMORY[0x1E0D83048];
  NSStringFromSelector(sel_macSyncedAlbumsSettings);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "rowWithTitle:childSettingsKeyPath:", CFSTR("Mac-Synced Albums"), v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v123[48] = v31;
  v76 = v7;
  v32 = (void *)MEMORY[0x1E0D83048];
  NSStringFromSelector(sel_sharedLibrarySettings);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "rowWithTitle:childSettingsKeyPath:", CFSTR("Shared Library"), v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v123[49] = v34;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v123, 50);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v35);

  v36 = (void *)MEMORY[0x1E0D83048];
  NSStringFromSelector(sel_cplStatusSettings);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "rowWithTitle:childSettingsKeyPath:", CFSTR("CPL Status"), v117);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v122[0] = v115;
  v37 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_showLibraryFilterTip);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "rowWithTitle:valueKeyPath:", CFSTR("Library Filter Tip"), v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v122[1] = v39;
  v40 = (void *)MEMORY[0x1E0D83048];
  NSStringFromSelector(sel_audioSettings);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "rowWithTitle:childSettingsKeyPath:", CFSTR("Audio"), v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v122[2] = v42;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Duplicates"), CFSTR("duplicatesSettings"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v122[3] = v43;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Document Menu"), CFSTR("documentMenuSettings"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v122[4] = v44;
  v45 = (void *)MEMORY[0x1E0D83010];
  v120[0] = MEMORY[0x1E0C809B0];
  v120[1] = 3221225472;
  v120[2] = __46__PXRootSettings_UI__settingsControllerModule__block_invoke;
  v120[3] = &__block_descriptor_40_e11_B24__0_8_16l;
  v120[4] = a1;
  objc_msgSend(MEMORY[0x1E0D830A0], "actionWithHandler:", v120);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "rowWithTitle:action:", CFSTR("Home Screen Quick Actions"), v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v122[5] = v47;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v122, 6);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "addObjectsFromArray:", v48);

  objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:", v76);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83078], "px_restoreDefaultsSection");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = (void *)MEMORY[0x1E0D83078];
  v121[0] = v119;
  v121[1] = v49;
  v121[2] = v50;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v121, 3);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "moduleWithTitle:contents:", CFSTR("PhotosUICore"), v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  return v53;
}

+ (void)_manageHomeScreenQuickActions
{
  id v2;
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51__PXRootSettings_UI___manageHomeScreenQuickActions__block_invoke;
  v3[3] = &__block_descriptor_40_e30_v16__0__PXAlertConfiguration_8l;
  v3[4] = a1;
  v2 = +[PXAlert show:](PXAlert, "show:", v3);
}

+ (void)_setWantsInternalHomeScreenQuickActions:(BOOL)a3
{
  id v3;

  objc_msgSend(MEMORY[0x1E0D71A48], "setShouldShowInternalQuickActions:", a3);
  v3 = +[PXAlert show:](PXAlert, "show:", &__block_literal_global_150903);
}

uint64_t __62__PXRootSettings_UI___setWantsInternalHomeScreenQuickActions___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setTitle:", CFSTR("It can take several seconds for Quick Actions to update"));
}

void __51__PXRootSettings_UI___manageHomeScreenQuickActions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  _QWORD v5[5];
  _QWORD v6[5];

  v3 = a2;
  objc_msgSend(v3, "setTitle:", CFSTR("Home Screen Quick Actions"));
  v4 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__PXRootSettings_UI___manageHomeScreenQuickActions__block_invoke_2;
  v6[3] = &__block_descriptor_40_e5_v8__0l;
  v6[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "addActionWithTitle:style:action:", CFSTR("Show Internal Quick Actions"), 0, v6);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __51__PXRootSettings_UI___manageHomeScreenQuickActions__block_invoke_3;
  v5[3] = &__block_descriptor_40_e5_v8__0l;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "addActionWithTitle:style:action:", CFSTR("Hide Internal Quick Actions"), 0, v5);
  objc_msgSend(v3, "addActionWithTitle:style:action:", CFSTR("Cancel"), 1, 0);

}

uint64_t __51__PXRootSettings_UI___manageHomeScreenQuickActions__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setWantsInternalHomeScreenQuickActions:", 1);
}

uint64_t __51__PXRootSettings_UI___manageHomeScreenQuickActions__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setWantsInternalHomeScreenQuickActions:", 0);
}

uint64_t __46__PXRootSettings_UI__settingsControllerModule__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_manageHomeScreenQuickActions");
  return 1;
}

@end
