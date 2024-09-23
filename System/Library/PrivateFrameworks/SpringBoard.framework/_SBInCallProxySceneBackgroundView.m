@implementation _SBInCallProxySceneBackgroundView

- (_SBInCallProxySceneBackgroundView)initWithFrame:(CGRect)a3 proxyTarget:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  _SBInCallProxySceneBackgroundView *v10;
  _SBInCallProxySceneBackgroundView *v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_SBInCallProxySceneBackgroundView;
  v10 = -[_SBInCallProxySceneBackgroundView initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
    objc_storeWeak((id *)&v10->_proxyTarget, v9);

  return v11;
}

- (BOOL)isFullscreen
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_proxyTarget);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(WeakRetained, "isFullscreen");
  else
    v3 = 0;

  return v3;
}

- (void)setFullscreen:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_proxyTarget);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "setFullscreen:", v3);

}

- (BOOL)needsClassicModeBackground
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_proxyTarget);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(WeakRetained, "needsClassicModeBackground");
  else
    v3 = 0;

  return v3;
}

- (void)setNeedsClassicModeBackground:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_proxyTarget);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "setNeedsClassicModeBackground:", v3);

}

- (BOOL)shouldUseBrightMaterial
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_proxyTarget);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(WeakRetained, "shouldUseBrightMaterial");
  else
    v3 = 0;

  return v3;
}

- (void)setShouldUseBrightMaterial:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_proxyTarget);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "setShouldUseBrightMaterial:", v3);

}

- (void)setWallpaperStyle:(int64_t)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_proxyTarget);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "setWallpaperStyle:", a3);

}

- (void)setWallpaperStyle:(int64_t)a3 withAnimationSettings:(id)a4
{
  id WeakRetained;
  id v7;

  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_proxyTarget);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "setWallpaperStyle:withAnimationSettings:", a3, v7);

}

- (int64_t)wallpaperStyle
{
  id WeakRetained;
  int64_t v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_proxyTarget);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(WeakRetained, "wallpaperStyle");
  else
    v3 = 0;

  return v3;
}

- (SBApplicationSceneBackgroundView)proxyTarget
{
  return (SBApplicationSceneBackgroundView *)objc_loadWeakRetained((id *)&self->_proxyTarget);
}

- (void)setProxyTarget:(id)a3
{
  objc_storeWeak((id *)&self->_proxyTarget, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_proxyTarget);
}

@end
