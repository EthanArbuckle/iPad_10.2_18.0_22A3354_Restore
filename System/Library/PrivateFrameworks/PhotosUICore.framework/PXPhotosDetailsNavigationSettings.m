@implementation PXPhotosDetailsNavigationSettings

+ (id)settingsControllerModule
{
  void *v2;
  void *v3;
  uint64_t v5;

  static SettingsUIProvider.Module(_:sections:)(0xD000000000000012, 0x80000001A7C63C30, (uint64_t (*)(uint64_t))sub_1A70E4368, &v5);
  SettingsUIModule.prototypeToolsModule.getter();
  v3 = v2;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3;
}

+ (BOOL)shouldAllowZoomFromSheets
{
  return 1;
}

+ (BOOL)canUseSystemSwipeToDismiss
{
  return 1;
}

- (id)parentSettings
{
  return +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
}

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXPhotosDetailsNavigationSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[PXPhotosDetailsNavigationSettings setUseZoomTransition:](self, "setUseZoomTransition:", 1);
  -[PXPhotosDetailsNavigationSettings setCustomZoomTransitionDimming:](self, "setCustomZoomTransitionDimming:", 1);
  -[PXPhotosDetailsNavigationSettings setZoomTransitionDimmingWhite:](self, "setZoomTransitionDimmingWhite:", 0.0);
  -[PXPhotosDetailsNavigationSettings setZoomTransitionDimmingOpacity:](self, "setZoomTransitionDimmingOpacity:", 0.5);
  -[PXPhotosDetailsNavigationSettings setCustomZoomTransitionDimmingBlurEffect:](self, "setCustomZoomTransitionDimmingBlurEffect:", 1);
  -[PXPhotosDetailsNavigationSettings setZoomTransitionDimmingBlurEffectStyle:](self, "setZoomTransitionDimmingBlurEffectStyle:", 3);
  -[PXPhotosDetailsNavigationSettings setAllowZoomBounce:](self, "setAllowZoomBounce:", 1);
  -[PXPhotosDetailsNavigationSettings setZoomBounceScale:](self, "setZoomBounceScale:", 0.9);
  -[PXPhotosDetailsNavigationSettings setZoomBounceDelay:](self, "setZoomBounceDelay:", 0.1);
  -[PXPhotosDetailsNavigationSettings setZoomBounceRefractoryPeriod:](self, "setZoomBounceRefractoryPeriod:", 0.5);
  -[PXPhotosDetailsNavigationSettings setUseSystemSwipeToDismiss:](self, "setUseSystemSwipeToDismiss:", +[PXPhotosDetailsNavigationSettings canUseSystemSwipeToDismiss](PXPhotosDetailsNavigationSettings, "canUseSystemSwipeToDismiss"));
  -[PXPhotosDetailsNavigationSettings setEnsureOpaqueDestination:](self, "setEnsureOpaqueDestination:", 1);
  -[PXPhotosDetailsNavigationSettings setUseDebugColors:](self, "setUseDebugColors:", 0);
  -[PXPhotosDetailsNavigationSettings setShowDebugOverlays:](self, "setShowDebugOverlays:", 0);
  -[PXPhotosDetailsNavigationSettings setAllowScreenEdgeSwipeToDismiss:](self, "setAllowScreenEdgeSwipeToDismiss:", 1);
  -[PXPhotosDetailsNavigationSettings setScreenEdgeSwipeForegroundInset:](self, "setScreenEdgeSwipeForegroundInset:", 35.0);
  -[PXPhotosDetailsNavigationSettings setScreenEdgeSwipeSlideDownDuration:](self, "setScreenEdgeSwipeSlideDownDuration:", 0.3);
  -[PXPhotosDetailsNavigationSettings setScreenEdgeSwipeInteractionRelativeDistance:](self, "setScreenEdgeSwipeInteractionRelativeDistance:", 1.0);
  -[PXPhotosDetailsNavigationSettings setScreenEdgeSwipeInteractiveFraction:](self, "setScreenEdgeSwipeInteractiveFraction:", 0.5);
  -[PXPhotosDetailsNavigationSettings setWorkAround123679412:](self, "setWorkAround123679412:", 0);
  -[PXPhotosDetailsNavigationSettings setAllowZoomFromSheets:](self, "setAllowZoomFromSheets:", +[PXPhotosDetailsNavigationSettings shouldAllowZoomFromSheets](PXPhotosDetailsNavigationSettings, "shouldAllowZoomFromSheets"));
  -[PXPhotosDetailsNavigationSettings setWorkAround125263280:](self, "setWorkAround125263280:", 0);
}

- (BOOL)useZoomTransition
{
  return self->_useZoomTransition;
}

- (void)setUseZoomTransition:(BOOL)a3
{
  self->_useZoomTransition = a3;
}

- (BOOL)customZoomTransitionDimming
{
  return self->_customZoomTransitionDimming;
}

- (void)setCustomZoomTransitionDimming:(BOOL)a3
{
  self->_customZoomTransitionDimming = a3;
}

- (double)zoomTransitionDimmingWhite
{
  return self->_zoomTransitionDimmingWhite;
}

- (void)setZoomTransitionDimmingWhite:(double)a3
{
  self->_zoomTransitionDimmingWhite = a3;
}

- (double)zoomTransitionDimmingOpacity
{
  return self->_zoomTransitionDimmingOpacity;
}

- (void)setZoomTransitionDimmingOpacity:(double)a3
{
  self->_zoomTransitionDimmingOpacity = a3;
}

- (BOOL)customZoomTransitionDimmingBlurEffect
{
  return self->_customZoomTransitionDimmingBlurEffect;
}

- (void)setCustomZoomTransitionDimmingBlurEffect:(BOOL)a3
{
  self->_customZoomTransitionDimmingBlurEffect = a3;
}

- (int64_t)zoomTransitionDimmingBlurEffectStyle
{
  return self->_zoomTransitionDimmingBlurEffectStyle;
}

- (void)setZoomTransitionDimmingBlurEffectStyle:(int64_t)a3
{
  self->_zoomTransitionDimmingBlurEffectStyle = a3;
}

- (BOOL)allowZoomBounce
{
  return self->_allowZoomBounce;
}

- (void)setAllowZoomBounce:(BOOL)a3
{
  self->_allowZoomBounce = a3;
}

- (double)zoomBounceScale
{
  return self->_zoomBounceScale;
}

- (void)setZoomBounceScale:(double)a3
{
  self->_zoomBounceScale = a3;
}

- (double)zoomBounceDelay
{
  return self->_zoomBounceDelay;
}

- (void)setZoomBounceDelay:(double)a3
{
  self->_zoomBounceDelay = a3;
}

- (double)zoomBounceRefractoryPeriod
{
  return self->_zoomBounceRefractoryPeriod;
}

- (void)setZoomBounceRefractoryPeriod:(double)a3
{
  self->_zoomBounceRefractoryPeriod = a3;
}

- (BOOL)useSystemSwipeToDismiss
{
  return self->_useSystemSwipeToDismiss;
}

- (void)setUseSystemSwipeToDismiss:(BOOL)a3
{
  self->_useSystemSwipeToDismiss = a3;
}

- (BOOL)ensureOpaqueDestination
{
  return self->_ensureOpaqueDestination;
}

- (void)setEnsureOpaqueDestination:(BOOL)a3
{
  self->_ensureOpaqueDestination = a3;
}

- (BOOL)useDebugColors
{
  return self->_useDebugColors;
}

- (void)setUseDebugColors:(BOOL)a3
{
  self->_useDebugColors = a3;
}

- (BOOL)showDebugOverlays
{
  return self->_showDebugOverlays;
}

- (void)setShowDebugOverlays:(BOOL)a3
{
  self->_showDebugOverlays = a3;
}

- (BOOL)allowScreenEdgeSwipeToDismiss
{
  return self->_allowScreenEdgeSwipeToDismiss;
}

- (void)setAllowScreenEdgeSwipeToDismiss:(BOOL)a3
{
  self->_allowScreenEdgeSwipeToDismiss = a3;
}

- (double)screenEdgeSwipeForegroundInset
{
  return self->_screenEdgeSwipeForegroundInset;
}

- (void)setScreenEdgeSwipeForegroundInset:(double)a3
{
  self->_screenEdgeSwipeForegroundInset = a3;
}

- (double)screenEdgeSwipeSlideDownDuration
{
  return self->_screenEdgeSwipeSlideDownDuration;
}

- (void)setScreenEdgeSwipeSlideDownDuration:(double)a3
{
  self->_screenEdgeSwipeSlideDownDuration = a3;
}

- (double)screenEdgeSwipeInteractionRelativeDistance
{
  return self->_screenEdgeSwipeInteractionRelativeDistance;
}

- (void)setScreenEdgeSwipeInteractionRelativeDistance:(double)a3
{
  self->_screenEdgeSwipeInteractionRelativeDistance = a3;
}

- (double)screenEdgeSwipeInteractiveFraction
{
  return self->_screenEdgeSwipeInteractiveFraction;
}

- (void)setScreenEdgeSwipeInteractiveFraction:(double)a3
{
  self->_screenEdgeSwipeInteractiveFraction = a3;
}

- (BOOL)workAround123679412
{
  return self->_workAround123679412;
}

- (void)setWorkAround123679412:(BOOL)a3
{
  self->_workAround123679412 = a3;
}

- (BOOL)allowZoomFromSheets
{
  return self->_allowZoomFromSheets;
}

- (void)setAllowZoomFromSheets:(BOOL)a3
{
  self->_allowZoomFromSheets = a3;
}

- (BOOL)workAround125263280
{
  return self->_workAround125263280;
}

- (void)setWorkAround125263280:(BOOL)a3
{
  self->_workAround125263280 = a3;
}

+ (PXPhotosDetailsNavigationSettings)sharedInstance
{
  if (sharedInstance_onceToken_166827 != -1)
    dispatch_once(&sharedInstance_onceToken_166827, &__block_literal_global_166828);
  return (PXPhotosDetailsNavigationSettings *)(id)sharedInstance_sharedInstance_166829;
}

void __51__PXPhotosDetailsNavigationSettings_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "detailsNavigationSettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedInstance_sharedInstance_166829;
  sharedInstance_sharedInstance_166829 = v0;

}

@end
