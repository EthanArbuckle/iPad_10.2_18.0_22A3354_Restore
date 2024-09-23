@implementation ISLiveWallpaperUIView

- (ISLiveWallpaperUIView)initWithCoder:(id)a3
{
  ISLiveWallpaperUIView *v3;
  ISLiveWallpaperUIView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ISLiveWallpaperUIView;
  v3 = -[ISBasePlayerUIView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[ISLiveWallpaperUIView _ISLiveWallpaperUIViewCommonInitialization](v3, "_ISLiveWallpaperUIViewCommonInitialization");
  return v4;
}

- (ISLiveWallpaperUIView)initWithFrame:(CGRect)a3
{
  ISLiveWallpaperUIView *v3;
  ISLiveWallpaperUIView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ISLiveWallpaperUIView;
  v3 = -[ISBasePlayerUIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[ISLiveWallpaperUIView _ISLiveWallpaperUIViewCommonInitialization](v3, "_ISLiveWallpaperUIViewCommonInitialization");
  return v4;
}

- (void)_ISLiveWallpaperUIViewCommonInitialization
{
  void *v3;
  ISLiveWallpaperPlayer *v4;
  ISTouchingGestureRecognizer *v5;
  UIGestureRecognizer *playbackGestureRecognizer;
  dispatch_queue_t v7;

  -[ISBasePlayerUIView setContentMode:](self, "setContentMode:", 2);
  v7 = dispatch_queue_create("com.apple.livewallpaperplayer", 0);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B2E8]), "initWithDispatchQueue:", v7);
  v4 = -[ISBasePlayer initWithVideoPlayer:]([ISLiveWallpaperPlayer alloc], "initWithVideoPlayer:", v3);
  -[ISBasePlayerUIView setPlayer:](self, "setPlayer:", v4);
  v5 = -[ISTouchingGestureRecognizer initWithTarget:action:]([ISTouchingGestureRecognizer alloc], "initWithTarget:action:", self, sel__handlePlaybackRecognizer_);
  -[ISTouchingGestureRecognizer setMinimumTouchDuration:](v5, "setMinimumTouchDuration:", 0.075);
  -[ISTouchingGestureRecognizer setCancelsTouchesInView:](v5, "setCancelsTouchesInView:", 0);
  -[ISLiveWallpaperUIView addGestureRecognizer:](self, "addGestureRecognizer:", v5);
  playbackGestureRecognizer = self->_playbackGestureRecognizer;
  self->_playbackGestureRecognizer = &v5->super;

}

- (void)willMoveToWindow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ISLiveWallpaperUIView;
  -[ISLiveWallpaperUIView willMoveToWindow:](&v14, sel_willMoveToWindow_, v4);
  if (v4)
  {
    objc_initWeak(&location, self);
    v5 = (void *)MEMORY[0x1E0C99E88];
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __42__ISLiveWallpaperUIView_willMoveToWindow___block_invoke;
    v11 = &unk_1E9453858;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v5, "scheduledTimerWithTimeInterval:repeats:block:", 1, &v8, 0.06);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ISLiveWallpaperUIView setUpdateTimer:](self, "setUpdateTimer:", v6, v8, v9, v10, v11);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    -[ISLiveWallpaperUIView updateTimer](self, "updateTimer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "invalidate");

  }
}

- (void)setTouching:(BOOL)a3
{
  if (self->_touching != a3)
  {
    self->_touching = a3;
    -[ISLiveWallpaperUIView _updatePlayer](self, "_updatePlayer");
  }
}

- (void)setForce:(double)a3
{
  if (self->_force != a3)
  {
    self->_force = a3;
    -[ISLiveWallpaperUIView _updatePlayer](self, "_updatePlayer");
  }
}

- (void)_handleUpdateTimer
{
  double v3;
  double v4;
  _BOOL4 v5;
  double v6;
  double v7;

  -[ISLiveWallpaperUIView force](self, "force");
  v4 = v3;
  v5 = -[ISLiveWallpaperUIView touching](self, "touching");
  v6 = v4 + 0.25;
  if (!v5)
    v6 = 0.0;
  v7 = fmax(v6, 0.0);
  if (v7 > 400.0)
    v7 = 400.0;
  -[ISLiveWallpaperUIView setForce:](self, "setForce:", v7);
}

- (void)_handlePlaybackRecognizer:(id)a3
{
  -[ISLiveWallpaperUIView setTouching:](self, "setTouching:", (unint64_t)(objc_msgSend(a3, "state") - 1) < 2);
}

- (void)_updatePlayer
{
  BOOL v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  BOOL v11;

  v3 = -[ISLiveWallpaperUIView touching](self, "touching");
  -[ISLiveWallpaperUIView force](self, "force");
  v5 = v4;
  -[ISBasePlayerUIView player](self, "player");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __38__ISLiveWallpaperUIView__updatePlayer__block_invoke;
  v8[3] = &unk_1E9453880;
  v9 = v6;
  v11 = v3;
  v10 = v5;
  v7 = v6;
  objc_msgSend(v7, "performChanges:", v8);

}

- (void)dealloc
{
  objc_super v3;

  -[NSTimer invalidate](self->_updateTimer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)ISLiveWallpaperUIView;
  -[ISLiveWallpaperUIView dealloc](&v3, sel_dealloc);
}

- (UIGestureRecognizer)playbackGestureRecognizer
{
  return self->_playbackGestureRecognizer;
}

- (BOOL)touching
{
  return self->_touching;
}

- (double)force
{
  return self->_force;
}

- (NSTimer)updateTimer
{
  return self->_updateTimer;
}

- (void)setUpdateTimer:(id)a3
{
  objc_storeStrong((id *)&self->_updateTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateTimer, 0);
  objc_storeStrong((id *)&self->_playbackGestureRecognizer, 0);
}

uint64_t __38__ISLiveWallpaperUIView__updatePlayer__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setTouching:", *(unsigned __int8 *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "setForce:", *(double *)(a1 + 40));
}

void __42__ISLiveWallpaperUIView_willMoveToWindow___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleUpdateTimer");

}

@end
