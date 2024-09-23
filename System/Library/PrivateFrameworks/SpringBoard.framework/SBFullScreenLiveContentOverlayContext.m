@implementation SBFullScreenLiveContentOverlayContext

- (int64_t)overlayType
{
  return self->_overlayType;
}

- (SBFullScreenSwitcherSceneLiveContentOverlay)overlay
{
  return self->_overlay;
}

- (SBFullScreenLiveContentOverlayContext)initWithOverlay:(id)a3
{
  id v5;
  SBFullScreenLiveContentOverlayContext *v6;
  SBFullScreenLiveContentOverlayContext *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBFullScreenLiveContentOverlayContext;
  v6 = -[SBFullScreenLiveContentOverlayContext init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_overlay, a3);
    v7->_overlayType = objc_msgSend(v5, "overlayType");
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlay, 0);
}

@end
