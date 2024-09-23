@implementation SUICFlamesView

+ (BOOL)_isMetalAvailable
{
  return 1;
}

- (SUICFlamesView)initWithFrame:(CGRect)a3 screen:(id)a4 fidelity:(int64_t)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  SUICFlamesView *v12;
  __objc2_class *v13;
  uint64_t v14;
  SUICFlamesViewProviding *flamesView;
  objc_super v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a4;
  v17.receiver = self;
  v17.super_class = (Class)SUICFlamesView;
  v12 = -[SUICFlamesView initWithFrame:](&v17, sel_initWithFrame_, x, y, width, height);
  if (v12)
  {
    if (+[SUICFlamesView _isMetalAvailable](SUICFlamesView, "_isMetalAvailable"))
      v13 = SUICFlamesViewMetal;
    else
      v13 = SUICFlamesViewLegacy;
    v14 = objc_msgSend([v13 alloc], "initWithFrame:screen:fidelity:", v11, a5, x, y, width, height);
    flamesView = v12->_flamesView;
    v12->_flamesView = (SUICFlamesViewProviding *)v14;

  }
  return v12;
}

- (void)layoutSubviews
{
  SUICFlamesViewProviding *flamesView;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUICFlamesView;
  -[SUICFlamesView layoutSubviews](&v4, sel_layoutSubviews);
  flamesView = self->_flamesView;
  -[SUICFlamesView bounds](self, "bounds");
  -[SUICFlamesViewProviding setFrame:](flamesView, "setFrame:");
}

- (void)setHidden:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SUICFlamesView;
  -[SUICFlamesView setHidden:](&v5, sel_setHidden_);
  -[SUICFlamesViewProviding setHidden:](self->_flamesView, "setHidden:", v3);
}

- (void)didMoveToSuperview
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUICFlamesView;
  -[SUICFlamesView didMoveToSuperview](&v4, sel_didMoveToSuperview);
  -[SUICFlamesView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[SUICFlamesView addSubview:](self, "addSubview:", self->_flamesView);
  else
    -[SUICFlamesViewProviding removeFromSuperview](self->_flamesView, "removeFromSuperview");
}

- (void)prewarmShadersForCurrentMode
{
  -[SUICFlamesViewProviding prewarmShadersForCurrentMode](self->_flamesView, "prewarmShadersForCurrentMode");
}

- (void)setRenderingEnabled:(BOOL)a3 forReason:(id)a4
{
  -[SUICFlamesViewProviding setRenderingEnabled:forReason:](self->_flamesView, "setRenderingEnabled:forReason:", a3, a4);
}

- (void)fadeOutCurrentAura
{
  -[SUICFlamesViewProviding fadeOutCurrentAura](self->_flamesView, "fadeOutCurrentAura");
}

- (void)resetAndReinitialize:(BOOL)a3
{
  -[SUICFlamesViewProviding resetAndReinitialize:](self->_flamesView, "resetAndReinitialize:", a3);
}

- (void)setFlamesDelegate:(id)a3
{
  SUICFlamesView *v5;

  objc_storeWeak((id *)&self->_flamesDelegate, a3);
  if (a3)
    v5 = self;
  else
    v5 = 0;
  -[SUICFlamesViewProviding setFlamesDelegate:](self->_flamesView, "setFlamesDelegate:", v5);
}

- (BOOL)isRenderingEnabled
{
  return -[SUICFlamesViewProviding isRenderingEnabled](self->_flamesView, "isRenderingEnabled");
}

- (int64_t)mode
{
  return -[SUICFlamesViewProviding mode](self->_flamesView, "mode");
}

- (void)setMode:(int64_t)a3
{
  -[SUICFlamesViewProviding setMode:](self->_flamesView, "setMode:", a3);
}

- (int64_t)state
{
  return -[SUICFlamesViewProviding state](self->_flamesView, "state");
}

- (void)setState:(int64_t)a3
{
  -[SUICFlamesViewProviding setState:](self->_flamesView, "setState:", a3);
}

- (BOOL)showAura
{
  return -[SUICFlamesViewProviding showAura](self->_flamesView, "showAura");
}

- (void)setShowAura:(BOOL)a3
{
  -[SUICFlamesViewProviding setShowAura:](self->_flamesView, "setShowAura:", a3);
}

- (BOOL)freezesAura
{
  return -[SUICFlamesViewProviding freezesAura](self->_flamesView, "freezesAura");
}

- (void)setFreezesAura:(BOOL)a3
{
  -[SUICFlamesViewProviding setFreezesAura:](self->_flamesView, "setFreezesAura:", a3);
}

- (BOOL)reduceFrameRate
{
  return -[SUICFlamesViewProviding reduceFrameRate](self->_flamesView, "reduceFrameRate");
}

- (void)setReduceFrameRate:(BOOL)a3
{
  -[SUICFlamesViewProviding setReduceFrameRate:](self->_flamesView, "setReduceFrameRate:", a3);
}

- (BOOL)reduceThinkingFramerate
{
  return -[SUICFlamesViewProviding reduceThinkingFramerate](self->_flamesView, "reduceThinkingFramerate");
}

- (void)setReduceThinkingFramerate:(BOOL)a3
{
  -[SUICFlamesViewProviding setReduceThinkingFramerate:](self->_flamesView, "setReduceThinkingFramerate:", a3);
}

- (CGRect)activeFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[SUICFlamesViewProviding activeFrame](self->_flamesView, "activeFrame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setActiveFrame:(CGRect)a3
{
  -[SUICFlamesViewProviding setActiveFrame:](self->_flamesView, "setActiveFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (UIImage)overlayImage
{
  return (UIImage *)-[SUICFlamesViewProviding overlayImage](self->_flamesView, "overlayImage");
}

- (void)setOverlayImage:(id)a3
{
  -[SUICFlamesViewProviding setOverlayImage:](self->_flamesView, "setOverlayImage:", a3);
}

- (UIColor)dictationColor
{
  return (UIColor *)-[SUICFlamesViewProviding dictationColor](self->_flamesView, "dictationColor");
}

- (void)setDictationColor:(id)a3
{
  -[SUICFlamesViewProviding setDictationColor:](self->_flamesView, "setDictationColor:", a3);
}

- (BOOL)renderInBackground
{
  return -[SUICFlamesViewProviding renderInBackground](self->_flamesView, "renderInBackground");
}

- (void)setRenderInBackground:(BOOL)a3
{
  -[SUICFlamesViewProviding setRenderInBackground:](self->_flamesView, "setRenderInBackground:", a3);
}

- (BOOL)paused
{
  return -[SUICFlamesViewProviding flamesPaused](self->_flamesView, "flamesPaused");
}

- (void)setPaused:(BOOL)a3
{
  -[SUICFlamesViewProviding setFlamesPaused:](self->_flamesView, "setFlamesPaused:", a3);
}

- (double)horizontalScaleFactor
{
  double result;

  -[SUICFlamesViewProviding horizontalScaleFactor](self->_flamesView, "horizontalScaleFactor");
  return result;
}

- (void)setHorizontalScaleFactor:(double)a3
{
  -[SUICFlamesViewProviding setHorizontalScaleFactor:](self->_flamesView, "setHorizontalScaleFactor:", a3);
}

- (BOOL)accelerateTransitions
{
  return -[SUICFlamesViewProviding accelerateTransitions](self->_flamesView, "accelerateTransitions");
}

- (void)setAccelerateTransitions:(BOOL)a3
{
  -[SUICFlamesViewProviding setAccelerateTransitions:](self->_flamesView, "setAccelerateTransitions:", a3);
}

- (float)audioLevelForFlamesView:(id)a3
{
  void *v4;
  float v5;
  float v6;

  -[SUICFlamesView flamesDelegate](self, "flamesDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "audioLevelForFlamesView:", self);
  v6 = v5;

  return v6;
}

- (void)flamesViewAuraDidDisplay:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[SUICFlamesView flamesDelegate](self, "flamesDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[SUICFlamesView flamesDelegate](self, "flamesDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "flamesViewAuraDidDisplay:", self);

  }
}

- (SUICFlamesViewDelegate)flamesDelegate
{
  return (SUICFlamesViewDelegate *)objc_loadWeakRetained((id *)&self->_flamesDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_flamesDelegate);
  objc_storeStrong((id *)&self->_flamesView, 0);
}

@end
