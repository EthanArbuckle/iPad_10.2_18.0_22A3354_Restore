@implementation _SBTransientOverlayPresentedEntity

- (_SBTransientOverlayPresentedEntity)initWithViewController:(id)a3 window:(id)a4 baseWindowLevel:(double)a5
{
  id v9;
  id v10;
  _SBTransientOverlayPresentedEntity *v11;
  _SBTransientOverlayPresentedEntity *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_SBTransientOverlayPresentedEntity;
  v11 = -[_SBTransientOverlayPresentedEntity init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_baseWindowLevel = a5;
    objc_storeStrong((id *)&v11->_viewController, a3);
    objc_storeStrong((id *)&v12->_window, a4);
  }

  return v12;
}

- (void)setProximityEnabledAssertion:(id)a3
{
  BSInvalidatable *v5;
  BSInvalidatable *v6;
  BSInvalidatable **p_proximityEnabledAssertion;
  BSInvalidatable *proximityEnabledAssertion;
  BSInvalidatable *v9;

  v5 = (BSInvalidatable *)a3;
  proximityEnabledAssertion = self->_proximityEnabledAssertion;
  p_proximityEnabledAssertion = &self->_proximityEnabledAssertion;
  v6 = proximityEnabledAssertion;
  if (proximityEnabledAssertion != v5)
  {
    v9 = v5;
    -[BSInvalidatable invalidate](v6, "invalidate");
    objc_storeStrong((id *)p_proximityEnabledAssertion, a3);
    v5 = v9;
  }

}

- (double)baseWindowLevel
{
  return self->_baseWindowLevel;
}

- (SBTransientOverlayViewController)viewController
{
  return self->_viewController;
}

- (SBTransientOverlayBackgroundWindow)backgroundWindow
{
  return self->_backgroundWindow;
}

- (void)setBackgroundWindow:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundWindow, a3);
}

- (BOOL)isRotating
{
  return self->_rotating;
}

- (void)setRotating:(BOOL)a3
{
  self->_rotating = a3;
}

- (SBTransientOverlayWindow)window
{
  return self->_window;
}

- (BOOL)isDismissing
{
  return self->_dismissing;
}

- (void)setDismissing:(BOOL)a3
{
  self->_dismissing = a3;
}

- (BOOL)hasFinishedWindowInitialization
{
  return self->_hasFinishedWindowInitialization;
}

- (void)setHasFinishedWindowInitialization:(BOOL)a3
{
  self->_hasFinishedWindowInitialization = a3;
}

- (BOOL)hasPreservedInputViews
{
  return self->_hasPreservedInputViews;
}

- (void)setHasPreservedInputViews:(BOOL)a3
{
  self->_hasPreservedInputViews = a3;
}

- (BSInvalidatable)disableAutoUnlockAssertion
{
  return self->_disableAutoUnlockAssertion;
}

- (void)setDisableAutoUnlockAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_disableAutoUnlockAssertion, a3);
}

- (BSInvalidatable)proximityEnabledAssertion
{
  return self->_proximityEnabledAssertion;
}

- (BSInvalidatable)wallpaperAnimationSuspensionAssertion
{
  return self->_wallpaperAnimationSuspensionAssertion;
}

- (void)setWallpaperAnimationSuspensionAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_wallpaperAnimationSuspensionAssertion, a3);
}

- (SBFluidDismissalState)fluidDismissalState
{
  return self->_fluidDismissalState;
}

- (void)setFluidDismissalState:(id)a3
{
  objc_storeStrong((id *)&self->_fluidDismissalState, a3);
}

- (SBPresentationObservationToken)bannerLongLookPresentationObservationToken
{
  return self->_bannerLongLookPresentationObservationToken;
}

- (void)setBannerLongLookPresentationObservationToken:(id)a3
{
  objc_storeStrong((id *)&self->_bannerLongLookPresentationObservationToken, a3);
}

- (BSInvalidatable)bannerLongLookWindowLevelAssertion
{
  return self->_bannerLongLookWindowLevelAssertion;
}

- (void)setBannerLongLookWindowLevelAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_bannerLongLookWindowLevelAssertion, a3);
}

- (SBPresentationObservationToken)controlCenterPresentationObservationToken
{
  return self->_controlCenterPresentationObservationToken;
}

- (void)setControlCenterPresentationObservationToken:(id)a3
{
  objc_storeStrong((id *)&self->_controlCenterPresentationObservationToken, a3);
}

- (BSInvalidatable)controlCenterWindowLevelAssertion
{
  return self->_controlCenterWindowLevelAssertion;
}

- (void)setControlCenterWindowLevelAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_controlCenterWindowLevelAssertion, a3);
}

- (SBPresentationObservationToken)siriPresentationObservationToken
{
  return self->_siriPresentationObservationToken;
}

- (void)setSiriPresentationObservationToken:(id)a3
{
  objc_storeStrong((id *)&self->_siriPresentationObservationToken, a3);
}

- (BSInvalidatable)siriWindowLevelAssertion
{
  return self->_siriWindowLevelAssertion;
}

- (void)setSiriWindowLevelAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_siriWindowLevelAssertion, a3);
}

- (BSInvalidatable)keyFocusStealingAssertion
{
  return self->_keyFocusStealingAssertion;
}

- (void)setKeyFocusStealingAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_keyFocusStealingAssertion, a3);
}

- (BSInvalidatable)keyFocusPreventionAssertion
{
  return self->_keyFocusPreventionAssertion;
}

- (void)setKeyFocusPreventionAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_keyFocusPreventionAssertion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyFocusPreventionAssertion, 0);
  objc_storeStrong((id *)&self->_keyFocusStealingAssertion, 0);
  objc_storeStrong((id *)&self->_siriWindowLevelAssertion, 0);
  objc_storeStrong((id *)&self->_siriPresentationObservationToken, 0);
  objc_storeStrong((id *)&self->_controlCenterWindowLevelAssertion, 0);
  objc_storeStrong((id *)&self->_controlCenterPresentationObservationToken, 0);
  objc_storeStrong((id *)&self->_bannerLongLookWindowLevelAssertion, 0);
  objc_storeStrong((id *)&self->_bannerLongLookPresentationObservationToken, 0);
  objc_storeStrong((id *)&self->_fluidDismissalState, 0);
  objc_storeStrong((id *)&self->_wallpaperAnimationSuspensionAssertion, 0);
  objc_storeStrong((id *)&self->_proximityEnabledAssertion, 0);
  objc_storeStrong((id *)&self->_disableAutoUnlockAssertion, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_backgroundWindow, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
}

@end
