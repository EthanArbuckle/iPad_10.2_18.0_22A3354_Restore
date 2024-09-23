@implementation PUOneUpViewControllerSpecChange

- (BOOL)changed
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUOneUpViewControllerSpecChange;
  return -[PUViewControllerSpecChange changed](&v4, sel_changed)
      || -[PUOneUpViewControllerSpecChange chromeVisibilityChanged](self, "chromeVisibilityChanged")
      || -[PUOneUpViewControllerSpecChange contentLockingChanged](self, "contentLockingChanged")
      || -[PUOneUpViewControllerSpecChange shouldPlaceButtonsInNavigationBarChanged](self, "shouldPlaceButtonsInNavigationBarChanged")|| -[PUOneUpViewControllerSpecChange shouldUseCompactTitleViewChanged](self, "shouldUseCompactTitleViewChanged")|| -[PUOneUpViewControllerSpecChange shouldUseContentGuideInsetsChanged](self, "shouldUseContentGuideInsetsChanged")|| -[PUOneUpViewControllerSpecChange shouldUseUserTransformTilesChanged](self, "shouldUseUserTransformTilesChanged")|| -[PUOneUpViewControllerSpecChange shouldDisplayBadgesChanged](self, "shouldDisplayBadgesChanged")|| -[PUOneUpViewControllerSpecChange shouldDisplayAssetExplorerReviewScreenBadgesChanged](self, "shouldDisplayAssetExplorerReviewScreenBadgesChanged")|| -[PUOneUpViewControllerSpecChange shouldDisplayPlayButtonsChanged](self, "shouldDisplayPlayButtonsChanged")|| -[PUOneUpViewControllerSpecChange shouldDisplayProgressIndicatorsChanged](self, "shouldDisplayProgressIndicatorsChanged")|| -[PUOneUpViewControllerSpecChange shouldDisplayBufferingIndicatorsChanged](self,
           "shouldDisplayBufferingIndicatorsChanged")
      || -[PUOneUpViewControllerSpecChange canDisplayLoadingIndicatorsChanged](self, "canDisplayLoadingIndicatorsChanged")|| -[PUOneUpViewControllerSpecChange backgroundColorOverrideChanged](self, "backgroundColorOverrideChanged")|| -[PUOneUpViewControllerSpecChange progressIndicatorSizeChanged](self, "progressIndicatorSizeChanged")|| -[PUOneUpViewControllerSpecChange peopleRowSizeChanged](self, "peopleRowSizeChanged")|| -[PUOneUpViewControllerSpecChange progressIndicatorContentInsetsChanged](self, "progressIndicatorContentInsetsChanged")|| -[PUOneUpViewControllerSpecChange bufferingIndicatorSizeChanged](self, "bufferingIndicatorSizeChanged")|| -[PUOneUpViewControllerSpecChange shouldUseCompactCommentsTitleChanged](self, "shouldUseCompactCommentsTitleChanged")|| -[PUOneUpViewControllerSpecChange maximumToolbarHeightChanged](self, "maximumToolbarHeightChanged")|| -[PUOneUpViewControllerSpecChange shouldCounterrotateReviewScreenBarsChanged](self, "shouldCounterrotateReviewScreenBarsChanged")|| -[PUOneUpViewControllerSpecChange maximumAccessoryToolbarHeightChanged](self, "maximumAccessoryToolbarHeightChanged")
      || -[PUOneUpViewControllerSpecChange shouldLayoutReviewScreenControlBarVerticallyChanged](self, "shouldLayoutReviewScreenControlBarVerticallyChanged")|| -[PUOneUpViewControllerSpecChange shouldPlaceScrubberInScrubberBarChanged](self, "shouldPlaceScrubberInScrubberBarChanged")|| -[PUOneUpViewControllerSpecChange shouldDisplaySyndicationAttribution](self, "shouldDisplaySyndicationAttribution");
}

- (BOOL)chromeVisibilityChanged
{
  return *(&self->super._prefersCompactLayoutForSplitScreenChanged + 1);
}

- (void)_setChromeVisibilityChanged:(BOOL)a3
{
  *(&self->super._prefersCompactLayoutForSplitScreenChanged + 1) = a3;
}

- (BOOL)contentLockingChanged
{
  return *(&self->super._prefersCompactLayoutForSplitScreenChanged + 2);
}

- (void)_setContentLockingChanged:(BOOL)a3
{
  *(&self->super._prefersCompactLayoutForSplitScreenChanged + 2) = a3;
}

- (BOOL)presentedForPreviewChanged
{
  return self->_chromeVisibilityChanged;
}

- (void)_setPresentedForPreviewChanged:(BOOL)a3
{
  self->_chromeVisibilityChanged = a3;
}

- (BOOL)shouldPlaceButtonsInNavigationBarChanged
{
  return self->_contentLockingChanged;
}

- (void)_setShouldPlaceButtonsInNavigationBarChanged:(BOOL)a3
{
  self->_contentLockingChanged = a3;
}

- (BOOL)shouldUseCompactTitleViewChanged
{
  return self->_presentedForPreviewChanged;
}

- (void)_setShouldUseCompactTitleViewChanged:(BOOL)a3
{
  self->_presentedForPreviewChanged = a3;
}

- (BOOL)maximumToolbarHeightChanged
{
  return self->_shouldPlaceButtonsInNavigationBarChanged;
}

- (void)_setMaximumToolbarHeightChanged:(BOOL)a3
{
  self->_shouldPlaceButtonsInNavigationBarChanged = a3;
}

- (BOOL)maximumAccessoryToolbarHeightChanged
{
  return self->_shouldUseCompactTitleViewChanged;
}

- (void)_setMaximumAccessoryToolbarHeightChanged:(BOOL)a3
{
  self->_shouldUseCompactTitleViewChanged = a3;
}

- (BOOL)shouldUseContentGuideInsetsChanged
{
  return self->_maximumToolbarHeightChanged;
}

- (void)_setShouldUseContentGuideInsetsChanged:(BOOL)a3
{
  self->_maximumToolbarHeightChanged = a3;
}

- (BOOL)shouldUseUserTransformTilesChanged
{
  return self->_maximumAccessoryToolbarHeightChanged;
}

- (void)_setShouldUseUserTransformTilesChanged:(BOOL)a3
{
  self->_maximumAccessoryToolbarHeightChanged = a3;
}

- (BOOL)shouldDisplayBadgesChanged
{
  return self->_shouldUseContentGuideInsetsChanged;
}

- (void)_setShouldDisplayBadgesChanged:(BOOL)a3
{
  self->_shouldUseContentGuideInsetsChanged = a3;
}

- (BOOL)shouldDisplayAssetExplorerReviewScreenBadgesChanged
{
  return self->_shouldUseUserTransformTilesChanged;
}

- (void)_setShouldDisplayAssetExplorerReviewScreenBadgesChanged:(BOOL)a3
{
  self->_shouldUseUserTransformTilesChanged = a3;
}

- (BOOL)shouldDisplayPlayButtonsChanged
{
  return self->_shouldDisplayBadgesChanged;
}

- (void)_setShouldDisplayPlayButtonsChanged:(BOOL)a3
{
  self->_shouldDisplayBadgesChanged = a3;
}

- (BOOL)shouldDisplayProgressIndicatorsChanged
{
  return self->_shouldDisplayAssetExplorerReviewScreenBadgesChanged;
}

- (void)_setShouldDisplayProgressIndicatorsChanged:(BOOL)a3
{
  self->_shouldDisplayAssetExplorerReviewScreenBadgesChanged = a3;
}

- (BOOL)shouldDisplayPeopleRowChanged
{
  return self->_shouldDisplayPlayButtonsChanged;
}

- (void)_setShouldDisplayPeopleRowChanged:(BOOL)a3
{
  self->_shouldDisplayPlayButtonsChanged = a3;
}

- (BOOL)shouldAutoplayOnAppearChanged
{
  return self->_shouldDisplayProgressIndicatorsChanged;
}

- (void)_setShouldAutoplayOnAppearChanged:(BOOL)a3
{
  self->_shouldDisplayProgressIndicatorsChanged = a3;
}

- (BOOL)shouldDisplayEmptyPlaceholderChanged
{
  return self->_shouldDisplayPeopleRowChanged;
}

- (void)_setShouldDisplayEmptyPlaceholderChanged:(BOOL)a3
{
  self->_shouldDisplayPeopleRowChanged = a3;
}

- (BOOL)shouldDisplayBufferingIndicatorsChanged
{
  return self->_shouldAutoplayOnAppearChanged;
}

- (void)_setShouldDisplayBufferingIndicatorsChanged:(BOOL)a3
{
  self->_shouldAutoplayOnAppearChanged = a3;
}

- (BOOL)canDisplayLoadingIndicatorsChanged
{
  return self->_shouldDisplayEmptyPlaceholderChanged;
}

- (void)_setCanDisplayLoadingIndicatorsChanged:(BOOL)a3
{
  self->_shouldDisplayEmptyPlaceholderChanged = a3;
}

- (BOOL)backgroundColorOverrideChanged
{
  return self->_shouldDisplayBufferingIndicatorsChanged;
}

- (void)_setBackgroundColorOverrideChanged:(BOOL)a3
{
  self->_shouldDisplayBufferingIndicatorsChanged = a3;
}

- (BOOL)progressIndicatorSizeChanged
{
  return self->_canDisplayLoadingIndicatorsChanged;
}

- (void)_setProgressIndicatorSizeChanged:(BOOL)a3
{
  self->_canDisplayLoadingIndicatorsChanged = a3;
}

- (BOOL)progressIndicatorContentInsetsChanged
{
  return self->_backgroundColorOverrideChanged;
}

- (void)_setProgressIndicatorContentInsetsChanged:(BOOL)a3
{
  self->_backgroundColorOverrideChanged = a3;
}

- (BOOL)bufferingIndicatorSizeChanged
{
  return self->_progressIndicatorSizeChanged;
}

- (void)_setBufferingIndicatorSizeChanged:(BOOL)a3
{
  self->_progressIndicatorSizeChanged = a3;
}

- (BOOL)renderIndicatorSizeChanged
{
  return self->_progressIndicatorContentInsetsChanged;
}

- (void)_setRenderIndicatorSizeChanged:(BOOL)a3
{
  self->_progressIndicatorContentInsetsChanged = a3;
}

- (BOOL)shouldUseCompactCommentsTitleChanged
{
  return self->_bufferingIndicatorSizeChanged;
}

- (void)_setShouldUseCompactCommentsTitleChanged:(BOOL)a3
{
  self->_bufferingIndicatorSizeChanged = a3;
}

- (BOOL)tileInitialContentModeChanged
{
  return self->_renderIndicatorSizeChanged;
}

- (void)_setTileInitialContentModeChanged:(BOOL)a3
{
  self->_renderIndicatorSizeChanged = a3;
}

- (BOOL)shouldCounterrotateReviewScreenBarsChanged
{
  return self->_shouldUseCompactCommentsTitleChanged;
}

- (void)_setShouldCounterrotateReviewScreenBarsChanged:(BOOL)a3
{
  self->_shouldUseCompactCommentsTitleChanged = a3;
}

- (BOOL)shouldPinContentToTopChanged
{
  return self->_tileInitialContentModeChanged;
}

- (void)_setShouldPinContentToTopChanged:(BOOL)a3
{
  self->_tileInitialContentModeChanged = a3;
}

- (BOOL)shouldLayoutReviewScreenControlBarVerticallyChanged
{
  return self->_shouldCounterrotateReviewScreenBarsChanged;
}

- (void)_setShouldLayoutReviewScreenControlBarVerticallyChanged:(BOOL)a3
{
  self->_shouldCounterrotateReviewScreenBarsChanged = a3;
}

- (BOOL)shouldPlaceScrubberInScrubberBarChanged
{
  return self->_shouldPinContentToTopChanged;
}

- (void)_setShouldPlaceScrubberInScrubberBarChanged:(BOOL)a3
{
  self->_shouldPinContentToTopChanged = a3;
}

- (BOOL)hideNavigationBarWhenShowingAccessoryView
{
  return self->_shouldLayoutReviewScreenControlBarVerticallyChanged;
}

- (void)_setHideNavigationBarWhenShowingAccessoryView:(BOOL)a3
{
  self->_shouldLayoutReviewScreenControlBarVerticallyChanged = a3;
}

- (BOOL)hideScrubberWhenShowingAccessoryView
{
  return self->_shouldPlaceScrubberInScrubberBarChanged;
}

- (void)_setHideScrubberWhenShowingAccessoryView:(BOOL)a3
{
  self->_shouldPlaceScrubberInScrubberBarChanged = a3;
}

- (BOOL)prefersSquareImageInDetails
{
  return self->_hideNavigationBarWhenShowingAccessoryView;
}

- (void)_setPrefersSquareImageInDetails:(BOOL)a3
{
  self->_hideNavigationBarWhenShowingAccessoryView = a3;
}

- (BOOL)hideStatusBarWhenShowingAccessoryView
{
  return self->_hideScrubberWhenShowingAccessoryView;
}

- (void)_setHideStatusBarWhenShowingAccessoryView:(BOOL)a3
{
  self->_hideScrubberWhenShowingAccessoryView = a3;
}

- (BOOL)hideBadgesWhenShowingAccessoryView
{
  return self->_prefersSquareImageInDetails;
}

- (void)_setHideBadgesWhenShowingAccessoryView:(BOOL)a3
{
  self->_prefersSquareImageInDetails = a3;
}

- (BOOL)peopleRowSizeChanged
{
  return self->_hideStatusBarWhenShowingAccessoryView;
}

- (void)_setPeopleRowSizeChanged:(BOOL)a3
{
  self->_hideStatusBarWhenShowingAccessoryView = a3;
}

- (BOOL)shouldDisplaySyndicationAttribution
{
  return self->_hideBadgesWhenShowingAccessoryView;
}

- (void)_setShouldDisplaySyndicationAttribution:(BOOL)a3
{
  self->_hideBadgesWhenShowingAccessoryView = a3;
}

@end
