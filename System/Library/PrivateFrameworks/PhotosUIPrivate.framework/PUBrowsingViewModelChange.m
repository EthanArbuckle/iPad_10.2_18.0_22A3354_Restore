@implementation PUBrowsingViewModelChange

- (NSMutableDictionary)_mutableViewModelChangesByAssetReference
{
  NSMutableDictionary *mutableViewModelChangesByAssetReference;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  mutableViewModelChangesByAssetReference = self->_mutableViewModelChangesByAssetReference;
  if (!mutableViewModelChangesByAssetReference)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v5 = self->_mutableViewModelChangesByAssetReference;
    self->_mutableViewModelChangesByAssetReference = v4;

    mutableViewModelChangesByAssetReference = self->_mutableViewModelChangesByAssetReference;
  }
  return mutableViewModelChangesByAssetReference;
}

- (NSDictionary)assetViewModelChangesByAssetReference
{
  return (NSDictionary *)self->_mutableViewModelChangesByAssetReference;
}

- (NSMapTable)_mutableSharedViewModelChangesByAssetUUID
{
  NSMapTable *mutableSharedViewModelChangesByAssetUUID;
  NSMapTable *v4;
  NSMapTable *v5;

  mutableSharedViewModelChangesByAssetUUID = self->_mutableSharedViewModelChangesByAssetUUID;
  if (!mutableSharedViewModelChangesByAssetUUID)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v4 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v5 = self->_mutableSharedViewModelChangesByAssetUUID;
    self->_mutableSharedViewModelChangesByAssetUUID = v4;

    mutableSharedViewModelChangesByAssetUUID = self->_mutableSharedViewModelChangesByAssetUUID;
  }
  return mutableSharedViewModelChangesByAssetUUID;
}

- (NSMapTable)assetSharedViewModelChangesByAssetUUID
{
  return self->_mutableSharedViewModelChangesByAssetUUID;
}

- (BOOL)hasChanges
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PUBrowsingViewModelChange;
  if (-[PUViewModelChange hasChanges](&v8, sel_hasChanges))
    return 1;
  if (-[PUBrowsingViewModelChange assetsDataSourceDidChange](self, "assetsDataSourceDidChange"))
    return 1;
  if (-[PUBrowsingViewModelChange currentAssetDidChange](self, "currentAssetDidChange"))
    return 1;
  if (-[PUBrowsingViewModelChange currentAssetTransitionProgressDidChange](self, "currentAssetTransitionProgressDidChange"))
  {
    return 1;
  }
  if (-[PUBrowsingViewModelChange browsingSpeedRegimeDidChange](self, "browsingSpeedRegimeDidChange"))
    return 1;
  if (-[PUBrowsingViewModelChange transitionDriverIdentifierDidChange](self, "transitionDriverIdentifierDidChange"))
    return 1;
  if (-[PUBrowsingViewModelChange isScrubbingDidChange](self, "isScrubbingDidChange"))
    return 1;
  if (-[PUBrowsingViewModelChange isScrollingDidChange](self, "isScrollingDidChange"))
    return 1;
  if (-[PUBrowsingViewModelChange livePhotoShouldPlayDidChange](self, "livePhotoShouldPlayDidChange"))
    return 1;
  if (-[PUBrowsingViewModelChange chromeVisibilityDidChange](self, "chromeVisibilityDidChange"))
    return 1;
  if (-[PUBrowsingViewModelChange presentingOverOneUpDidChange](self, "presentingOverOneUpDidChange"))
    return 1;
  -[PUBrowsingViewModelChange assetViewModelChangesByAssetReference](self, "assetViewModelChangesByAssetReference");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
    return 1;
  -[PUBrowsingViewModelChange assetSharedViewModelChangesByAssetUUID](self, "assetSharedViewModelChangesByAssetUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  return v6
      || -[PUBrowsingViewModelChange videoOverlayPlayStateDidChange](self, "videoOverlayPlayStateDidChange")
      || -[PUBrowsingViewModelChange isAttemptingToPlayVideoOverlayDidChange](self, "isAttemptingToPlayVideoOverlayDidChange")|| -[PUBrowsingViewModelChange isScrubbingActivationDidChange](self, "isScrubbingActivationDidChange")|| -[PUBrowsingViewModelChange isVideoContentAllowedDidChange](self, "isVideoContentAllowedDidChange")|| -[PUBrowsingViewModelChange reviewScreenSelectionDidChange](self, "reviewScreenSelectionDidChange")|| -[PUBrowsingViewModelChange navigationBarTitleDidChange](self, "navigationBarTitleDidChange")|| -[PUBrowsingViewModelChange resizeTaskDescriptorViewModelDidChange](self, "resizeTaskDescriptorViewModelDidChange")|| -[PUBrowsingViewModelChange contentPrivacyStateDidChange](self, "contentPrivacyStateDidChange")|| -[PUBrowsingViewModelChange systemAuthenticationTypeDidChange](self, "systemAuthenticationTypeDidChange")|| -[PUBrowsingViewModelChange wantsContentUnavailableUnlockButtonVisibleDidChange](self, "wantsContentUnavailableUnlockButtonVisibleDidChange")|| -[PUBrowsingViewModelChange isInSelectionModeDidChange](self, "isInSelectionModeDidChange")|| -[PUBrowsingViewModelChange isPresentedForPreviewDidChange](self, "isPresentedForPreviewDidChange")|| -[PUBrowsingViewModelChange isFillScreenModeEnabledDidChange](self, "isFillScreenModeEnabledDidChange")|| -[PUBrowsingViewModelChange videoPlayerDidChange](self, "videoPlayerDidChange")|| -[PUBrowsingViewModelChange imageAnalysisInteractionDidChange](self, "imageAnalysisInteractionDidChange")
      || -[PUBrowsingViewModelChange isInteractingWithVideoScrubberDidChange](self, "isInteractingWithVideoScrubberDidChange")|| -[PUBrowsingViewModelChange isAnimatingPresentationSizeDidChange](self, "isAnimatingPresentationSizeDidChange");
}

- (BOOL)assetsDataSourceDidChange
{
  return self->_assetsDataSourceDidChange;
}

- (void)_setAssetsDataSourceDidChange:(BOOL)a3
{
  self->_assetsDataSourceDidChange = a3;
}

- (BOOL)currentAssetDidChange
{
  return self->_currentAssetDidChange;
}

- (void)_setCurrentAssetDidChange:(BOOL)a3
{
  self->_currentAssetDidChange = a3;
}

- (BOOL)currentAssetTransitionProgressDidChange
{
  return self->_currentAssetTransitionProgressDidChange;
}

- (void)_setCurrentAssetTransitionProgressDidChange:(BOOL)a3
{
  self->_currentAssetTransitionProgressDidChange = a3;
}

- (BOOL)transitionDriverIdentifierDidChange
{
  return self->_transitionDriverIdentifierDidChange;
}

- (void)_setTransitionDriverIdentifierDidChange:(BOOL)a3
{
  self->_transitionDriverIdentifierDidChange = a3;
}

- (BOOL)browsingSpeedRegimeDidChange
{
  return self->_browsingSpeedRegimeDidChange;
}

- (void)_setBrowsingSpeedRegimeDidChange:(BOOL)a3
{
  self->_browsingSpeedRegimeDidChange = a3;
}

- (BOOL)isScrubbingDidChange
{
  return self->_isScrubbingDidChange;
}

- (void)_setIsScrubbingDidChange:(BOOL)a3
{
  self->_isScrubbingDidChange = a3;
}

- (BOOL)isScrollingDidChange
{
  return self->_isScrollingDidChange;
}

- (void)_setIsScrollingDidChange:(BOOL)a3
{
  self->_isScrollingDidChange = a3;
}

- (BOOL)livePhotoShouldPlayDidChange
{
  return self->_livePhotoShouldPlayDidChange;
}

- (void)setLivePhotoShouldPlayDidChange:(BOOL)a3
{
  self->_livePhotoShouldPlayDidChange = a3;
}

- (BOOL)isAnimatingAnyTransitionDidChange
{
  return self->_isAnimatingAnyTransitionDidChange;
}

- (void)_setAnimatingAnyTransitionDidChange:(BOOL)a3
{
  self->_isAnimatingAnyTransitionDidChange = a3;
}

- (BOOL)secondScreenSizeDidChange
{
  return self->_secondScreenSizeDidChange;
}

- (void)_setSecondScreenSizeDidChange:(BOOL)a3
{
  self->_secondScreenSizeDidChange = a3;
}

- (BOOL)chromeVisibilityDidChange
{
  return self->_chromeVisibilityDidChange;
}

- (void)_setChromeVisibilityDidChange:(BOOL)a3
{
  self->_chromeVisibilityDidChange = a3;
}

- (BOOL)presentingOverOneUpDidChange
{
  return self->_presentingOverOneUpDidChange;
}

- (void)_setPresentingOverOneUpDidChange:(BOOL)a3
{
  self->_presentingOverOneUpDidChange = a3;
}

- (BOOL)reviewScreenBarsModelDidChange
{
  return self->_reviewScreenBarsModelDidChange;
}

- (void)_setReviewScreenBarsModelDidChange:(BOOL)a3
{
  self->_reviewScreenBarsModelDidChange = a3;
}

- (BOOL)videoOverlayPlayStateDidChange
{
  return self->_videoOverlayPlayStateDidChange;
}

- (void)_setVideoOverlayPlayStateDidChange:(BOOL)a3
{
  self->_videoOverlayPlayStateDidChange = a3;
}

- (BOOL)isAttemptingToPlayVideoOverlayDidChange
{
  return self->_isAttemptingToPlayVideoOverlayDidChange;
}

- (void)_setIsAttemptingToPlayVideoOverlayDidChange:(BOOL)a3
{
  self->_isAttemptingToPlayVideoOverlayDidChange = a3;
}

- (BOOL)isScrubbingActivationDidChange
{
  return self->_isScrubbingActivationDidChange;
}

- (void)_setIsScrubbingActivationDidChange:(BOOL)a3
{
  self->_isScrubbingActivationDidChange = a3;
}

- (BOOL)isVideoContentAllowedDidChange
{
  return self->_isVideoContentAllowedDidChange;
}

- (void)setIsVideoContentAllowedDidChange:(BOOL)a3
{
  self->_isVideoContentAllowedDidChange = a3;
}

- (BOOL)reviewScreenSelectionDidChange
{
  return self->_reviewScreenSelectionDidChange;
}

- (void)_setReviewScreenSelectionDidChange:(BOOL)a3
{
  self->_reviewScreenSelectionDidChange = a3;
}

- (BOOL)navigationBarTitleDidChange
{
  return self->_navigationBarTitleDidChange;
}

- (void)_setNavigationBarTitleDidChange:(BOOL)a3
{
  self->_navigationBarTitleDidChange = a3;
}

- (BOOL)resizeTaskDescriptorViewModelDidChange
{
  return self->_resizeTaskDescriptorViewModelDidChange;
}

- (void)_setResizeTaskDescriptorViewModelDidChange:(BOOL)a3
{
  self->_resizeTaskDescriptorViewModelDidChange = a3;
}

- (BOOL)contentPrivacyStateDidChange
{
  return self->_contentPrivacyStateDidChange;
}

- (void)_setContentPrivacyStateDidChange:(BOOL)a3
{
  self->_contentPrivacyStateDidChange = a3;
}

- (BOOL)systemAuthenticationTypeDidChange
{
  return self->_systemAuthenticationTypeDidChange;
}

- (void)_setSystemAuthenticationTypeDidChange:(BOOL)a3
{
  self->_systemAuthenticationTypeDidChange = a3;
}

- (BOOL)wantsContentUnavailableUnlockButtonVisibleDidChange
{
  return self->_wantsContentUnavailableUnlockButtonVisibleDidChange;
}

- (void)_setWantsContentUnavailableUnlockButtonVisibleDidChange:(BOOL)a3
{
  self->_wantsContentUnavailableUnlockButtonVisibleDidChange = a3;
}

- (BOOL)isInSelectionModeDidChange
{
  return self->_isInSelectionModeDidChange;
}

- (void)_setIsInSelectionModeDidChange:(BOOL)a3
{
  self->_isInSelectionModeDidChange = a3;
}

- (BOOL)isPresentedForPreviewDidChange
{
  return self->_isPresentedForPreviewDidChange;
}

- (void)setIsPresentedForPreviewDidChange:(BOOL)a3
{
  self->_isPresentedForPreviewDidChange = a3;
}

- (BOOL)isFillScreenModeEnabledDidChange
{
  return self->_isFillScreenModeEnabledDidChange;
}

- (void)setIsFillScreenModeEnabledDidChange:(BOOL)a3
{
  self->_isFillScreenModeEnabledDidChange = a3;
}

- (BOOL)videoPlayerDidChange
{
  return self->_videoPlayerDidChange;
}

- (void)setVideoPlayerDidChange:(BOOL)a3
{
  self->_videoPlayerDidChange = a3;
}

- (BOOL)imageAnalysisInteractionDidChange
{
  return self->_imageAnalysisInteractionDidChange;
}

- (void)setImageAnalysisInteractionDidChange:(BOOL)a3
{
  self->_imageAnalysisInteractionDidChange = a3;
}

- (BOOL)isInteractingWithVideoScrubberDidChange
{
  return self->_isInteractingWithVideoScrubberDidChange;
}

- (void)setIsInteractingWithVideoScrubberDidChange:(BOOL)a3
{
  self->_isInteractingWithVideoScrubberDidChange = a3;
}

- (BOOL)isAnimatingPresentationSizeDidChange
{
  return self->_isAnimatingPresentationSizeDidChange;
}

- (void)setIsAnimatingPresentationSizeDidChange:(BOOL)a3
{
  self->_isAnimatingPresentationSizeDidChange = a3;
}

- (PUBrowsingVideoPlayerChange)videoPlayerChange
{
  return self->_videoPlayerChange;
}

- (void)setVideoPlayerChange:(id)a3
{
  objc_storeStrong((id *)&self->_videoPlayerChange, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoPlayerChange, 0);
  objc_storeStrong((id *)&self->_mutableSharedViewModelChangesByAssetUUID, 0);
  objc_storeStrong((id *)&self->_mutableViewModelChangesByAssetReference, 0);
}

@end
