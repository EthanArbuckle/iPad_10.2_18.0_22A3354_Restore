@implementation PBUIRemoteIrisWallpaperPlayer

- (PBUIRemoteIrisWallpaperPlayer)init
{
  PBUIRemoteIrisWallpaperPlayer *v2;
  uint64_t v3;
  UILongPressGestureRecognizer *gestureRecognizer;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PBUIRemoteIrisWallpaperPlayer;
  v2 = -[PBUIRemoteIrisWallpaperPlayer init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA730]), "initWithTarget:action:", v2, sel__wallpaperGestureChanged_);
    gestureRecognizer = v2->_gestureRecognizer;
    v2->_gestureRecognizer = (UILongPressGestureRecognizer *)v3;

    -[UILongPressGestureRecognizer setMinimumPressDuration:](v2->_gestureRecognizer, "setMinimumPressDuration:", 0.15);
    -[UILongPressGestureRecognizer setCancelsTouchesInView:](v2->_gestureRecognizer, "setCancelsTouchesInView:", 0);
  }
  return v2;
}

- (void)_setIrisPlaybackState:(int64_t)a3
{
  id v4;

  if (self->_irisPlaybackState != a3)
  {
    self->_irisPlaybackState = a3;
    -[PBUIRemoteIrisWallpaperPlayer irisDelegate](self, "irisDelegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v4, "irisWallpaperPlayerPlaybackStateDidChange:", self);

  }
}

- (UIGestureRecognizer)irisGestureRecognizer
{
  return (UIGestureRecognizer *)self->_gestureRecognizer;
}

- (double)stillTimeInVideo
{
  return 0.0;
}

- (NSURL)videoFileURL
{
  return 0;
}

- (void)_wallpaperGestureChanged:(id)a3
{
  uint64_t v4;

  if (self->_gestureRecognizer == a3)
  {
    v4 = objc_msgSend(a3, "state");
    if ((unint64_t)(v4 - 3) >= 3)
    {
      if (v4 == 2)
      {
        -[PBUIRemoteIrisWallpaperPlayer _handleWallpaperGestureChanged](self, "_handleWallpaperGestureChanged");
      }
      else if (v4 == 1)
      {
        -[PBUIRemoteIrisWallpaperPlayer _handleWallpaperGestureBegan](self, "_handleWallpaperGestureBegan");
      }
    }
    else
    {
      -[PBUIRemoteIrisWallpaperPlayer _handleWallpaperGestureEnded](self, "_handleWallpaperGestureEnded");
    }
  }
}

- (void)_handleWallpaperGestureBegan
{
  -[PBUIRemoteIrisWallpaperPlayer _setTouchActive:](self, "_setTouchActive:", 1);
}

- (void)_handleWallpaperGestureEnded
{
  -[PBUIRemoteIrisWallpaperPlayer _setTouchActive:](self, "_setTouchActive:", 0);
}

- (void)_setTouchActive:(BOOL)a3
{
  void *v4;
  id v5;

  if (self->_touchActive != a3)
  {
    self->_touchActive = a3;
    -[PBUIRemoteIrisWallpaperPlayer delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v5, "remoteIrisWallpaperPlayer:touchActiveChanged:", self, self->_touchActive);
    -[PBUIRemoteIrisWallpaperPlayer irisDelegate](self, "irisDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v4, "irisWallpaperPlayerIsInteractingDidChange:", self);

  }
}

- (PBUIIrisWallpaperPlayerDelegate)irisDelegate
{
  return (PBUIIrisWallpaperPlayerDelegate *)objc_loadWeakRetained((id *)&self->_irisDelegate);
}

- (void)setIrisDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_irisDelegate, a3);
}

- (int64_t)irisPlaybackState
{
  return self->_irisPlaybackState;
}

- (PBUIRemoteIrisWallpaperPlayerDelegate)delegate
{
  return (PBUIRemoteIrisWallpaperPlayerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isTouchActive
{
  return self->_touchActive;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_irisDelegate);
  objc_storeStrong((id *)&self->_gestureRecognizer, 0);
}

@end
