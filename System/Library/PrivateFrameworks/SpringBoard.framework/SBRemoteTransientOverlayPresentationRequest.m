@implementation SBRemoteTransientOverlayPresentationRequest

- (SBRemoteTransientOverlayPresentationRequest)initWithViewController:(id)a3
{
  id v5;
  SBRemoteTransientOverlayPresentationRequest *v6;
  SBRemoteTransientOverlayPresentationRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBRemoteTransientOverlayPresentationRequest;
  v6 = -[SBRemoteTransientOverlayPresentationRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_animated = 1;
    v6->_shouldDismissSiri = 1;
    v6->_shouldPresentEmbeddedInTargetScene = 1;
    objc_storeStrong((id *)&v6->_viewController, a3);
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  id WeakRetained;

  v4 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithViewController:", self->_viewController);
  v5 = v4;
  if (v4)
  {
    *(_BYTE *)(v4 + 8) = self->_animated;
    objc_storeStrong((id *)(v4 + 24), self->_presentationTarget);
    *(_BYTE *)(v5 + 10) = self->_shouldDismissSiri;
    *(_BYTE *)(v5 + 11) = self->_shouldDismissPresentedBanners;
    *(_BYTE *)(v5 + 12) = self->_shouldStashPictureInPictureIfNeeded;
    *(_BYTE *)(v5 + 13) = self->_shouldPresentEmbeddedInTargetScene;
    WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
    objc_storeWeak((id *)(v5 + 32), WeakRetained);

  }
  return (id)v5;
}

- (SBTransientOverlayViewController)viewController
{
  return self->_viewController;
}

- (BOOL)isAnimated
{
  return self->_animated;
}

- (void)setAnimated:(BOOL)a3
{
  self->_animated = a3;
}

- (SBSRemoteAlertPresentationTarget)presentationTarget
{
  return self->_presentationTarget;
}

- (void)setPresentationTarget:(id)a3
{
  objc_storeStrong((id *)&self->_presentationTarget, a3);
}

- (SBWindowScene)windowScene
{
  return (SBWindowScene *)objc_loadWeakRetained((id *)&self->_windowScene);
}

- (void)setWindowScene:(id)a3
{
  objc_storeWeak((id *)&self->_windowScene, a3);
}

- (BOOL)isScreenshotMarkup
{
  return self->_isScreenshotMarkup;
}

- (void)setIsScreenshotMarkup:(BOOL)a3
{
  self->_isScreenshotMarkup = a3;
}

- (BOOL)shouldDismissSiri
{
  return self->_shouldDismissSiri;
}

- (void)setShouldDismissSiri:(BOOL)a3
{
  self->_shouldDismissSiri = a3;
}

- (BOOL)shouldDismissPresentedBanners
{
  return self->_shouldDismissPresentedBanners;
}

- (void)setShouldDismissPresentedBanners:(BOOL)a3
{
  self->_shouldDismissPresentedBanners = a3;
}

- (BOOL)shouldStashPictureInPictureIfNeeded
{
  return self->_shouldStashPictureInPictureIfNeeded;
}

- (void)setShouldStashPictureInPictureIfNeeded:(BOOL)a3
{
  self->_shouldStashPictureInPictureIfNeeded = a3;
}

- (BOOL)shouldPresentEmbeddedInTargetScene
{
  return self->_shouldPresentEmbeddedInTargetScene;
}

- (void)setShouldPresentEmbeddedInTargetScene:(BOOL)a3
{
  self->_shouldPresentEmbeddedInTargetScene = a3;
}

- (BOOL)isSceneBacked
{
  return self->_isSceneBacked;
}

- (void)setIsSceneBacked:(BOOL)a3
{
  self->_isSceneBacked = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_presentationTarget, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
}

@end
