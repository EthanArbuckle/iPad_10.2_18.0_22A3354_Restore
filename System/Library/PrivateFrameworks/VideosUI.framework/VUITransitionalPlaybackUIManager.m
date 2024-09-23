@implementation VUITransitionalPlaybackUIManager

- (VUITransitionalPlaybackUIManager)initWithMediaController:(id)a3
{
  id v5;
  VUITransitionalPlaybackUIManager *v6;
  VUITransitionalPlaybackUIManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VUITransitionalPlaybackUIManager;
  v6 = -[VUITransitionalPlaybackUIManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mediaController, a3);
    v7->_isFirstAppearance = 1;
  }

  return v7;
}

- (void)dealloc
{
  id WeakRetained;
  objc_super v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_backgroundedTimer);
  objc_msgSend(WeakRetained, "invalidate");

  v4.receiver = self;
  v4.super_class = (Class)VUITransitionalPlaybackUIManager;
  -[VUITransitionalPlaybackUIManager dealloc](&v4, sel_dealloc);
}

- (void)setDelegate:(id)a3
{
  VUIMediaPlaybackManagerDelegate **p_delegate;
  id v5;

  p_delegate = &self->_delegate;
  v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  LOBYTE(p_delegate) = objc_opt_respondsToSelector();

  self->_delegateFlags.hasShouldEnableUIModeImplicitly = p_delegate & 1;
}

- (void)onAppear
{
  self->_mediaPlaybackTrigger = 1;
  -[VUITransitionalPlaybackUIManager _processTrigger](self, "_processTrigger");
  self->_isFirstAppearance = 0;
}

- (void)onDisappear
{
  self->_mediaPlaybackTrigger = 2;
  -[VUITransitionalPlaybackUIManager _processTrigger](self, "_processTrigger");
}

- (void)onEvent
{
  self->_mediaPlaybackTrigger = 4;
  -[VUITransitionalPlaybackUIManager _processTrigger](self, "_processTrigger");
}

- (void)onMediaControllerStateDidChange
{
  self->_mediaPlaybackTrigger = 5;
  -[VUITransitionalPlaybackUIManager _processTrigger](self, "_processTrigger");
}

- (BOOL)onSupplementaryUIShouldPresent
{
  int mediaPlaybackState;

  mediaPlaybackState = self->_mediaPlaybackState;
  if (mediaPlaybackState == 2)
  {
    self->_mediaPlaybackTrigger = 3;
    self->_mediaPlaybackTriggerModifier |= 3uLL;
    -[VUITransitionalPlaybackUIManager _processTrigger](self, "_processTrigger");
  }
  return mediaPlaybackState == 2;
}

- (void)onSupplementaryUIShouldDismiss
{
  if (self->_mediaPlaybackState == 1 && -[VUITransitionalPlaybackUIManager currentUIMode](self, "currentUIMode") == 1)
  {
    self->_mediaPlaybackTrigger = 3;
    -[VUITransitionalPlaybackUIManager _processTrigger](self, "_processTrigger");
  }
}

- (void)setShowcaseFactor:(double)a3
{
  if (self->_showcaseFactor != a3)
  {
    self->_showcaseFactor = a3;
    -[VUITransitionalPlaybackUIManager _onShowcaseFactorDidChange](self, "_onShowcaseFactorDidChange");
  }
}

- (BOOL)shouldHideUI
{
  return self->_mediaPlaybackState == 2;
}

- (int64_t)currentUIMode
{
  return self->_mediaPlaybackStateModifier & 1;
}

- (void)_onTimeout
{
  self->_mediaPlaybackTrigger = 6;
  -[VUITransitionalPlaybackUIManager _processTrigger](self, "_processTrigger");
}

- (void)_onShowcaseFactorDidChange
{
  self->_mediaPlaybackTrigger = 7;
  -[VUITransitionalPlaybackUIManager _processTrigger](self, "_processTrigger");
}

- (void)_processTrigger
{
  int v3;
  int v4;

  switch(self->_mediaPlaybackState)
  {
    case 0:
      v3 = -[VUITransitionalPlaybackUIManager _processUndefinedStateTriggers](self, "_processUndefinedStateTriggers");
      goto LABEL_10;
    case 1:
      v3 = -[VUITransitionalPlaybackUIManager _processBackgroundedStateTriggers](self, "_processBackgroundedStateTriggers");
      goto LABEL_10;
    case 2:
      v3 = -[VUITransitionalPlaybackUIManager _processForegroundedStateTriggers](self, "_processForegroundedStateTriggers");
      goto LABEL_10;
    case 3:
      v3 = -[VUITransitionalPlaybackUIManager _processWaitingForTimeoutStateTriggers](self, "_processWaitingForTimeoutStateTriggers");
      goto LABEL_10;
    case 4:
      v3 = -[VUITransitionalPlaybackUIManager _processWillBeBackgroundedStateTriggers](self, "_processWillBeBackgroundedStateTriggers");
      goto LABEL_10;
    case 5:
      v3 = -[VUITransitionalPlaybackUIManager _processWillBeForegroundedStateTriggers](self, "_processWillBeForegroundedStateTriggers");
      goto LABEL_10;
    case 6:
      v3 = -[VUITransitionalPlaybackUIManager _processPausedStateTriggers](self, "_processPausedStateTriggers");
LABEL_10:
      v4 = v3;
      break;
    default:
      v4 = 0;
      break;
  }
  self->_mediaPlaybackTrigger = 0;
  self->_mediaPlaybackTriggerModifier = 0;
  if (v4 != self->_mediaPlaybackState)
  {
    -[VUITransitionalPlaybackUIManager _processStateExit](self, "_processStateExit");
    self->_mediaPlaybackState = v4;
    -[VUITransitionalPlaybackUIManager _processStateEnter](self, "_processStateEnter");
  }
}

- (void)_processStateEnter
{
  int mediaPlaybackState;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 hasPresentPlaybackController;
  void *v8;
  id v9;
  _QWORD v10[5];
  _QWORD v11[5];

  mediaPlaybackState = self->_mediaPlaybackState;
  switch(mediaPlaybackState)
  {
    case 0:
      goto LABEL_8;
    case 2:
      -[VUITransitionalPlaybackUIManager mediaController](self, "mediaController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setShowsVideoControls:", 1);

LABEL_8:
      self->_mediaPlaybackStateModifier = 0;
      return;
    case 3:
      -[VUITransitionalPlaybackUIManager _scheduleBackgroundedTimer](self, "_scheduleBackgroundedTimer");
      return;
    case 4:
    case 5:
      -[VUITransitionalPlaybackUIManager delegate](self, "delegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (mediaPlaybackState != 5)
        goto LABEL_12;
      -[VUITransitionalPlaybackUIManager mediaController](self, "mediaController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "mediaInfo");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "intent") != 1)
      {

LABEL_12:
        v10[4] = self;
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __54__VUITransitionalPlaybackUIManager__processStateEnter__block_invoke;
        v11[3] = &unk_1E9F98DF0;
        v11[4] = self;
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __54__VUITransitionalPlaybackUIManager__processStateEnter__block_invoke_2;
        v10[3] = &unk_1E9F9B4F8;
        objc_msgSend(v4, "mediaPlaybackManager:shouldHideUI:animated:animations:completion:", self, mediaPlaybackState == 5, 1, v11, v10);
        goto LABEL_13;
      }
      hasPresentPlaybackController = self->_delegateFlags.hasPresentPlaybackController;

      if (!hasPresentPlaybackController
        || (objc_msgSend(v4, "presentForegroundPlaybackControllerForMediaPlaybackManager:", self) & 1) == 0)
      {
        goto LABEL_12;
      }
LABEL_13:

      return;
    case 6:
      -[VUITransitionalPlaybackUIManager mediaController](self, "mediaController");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "pause");

      return;
    default:
      return;
  }
}

void __54__VUITransitionalPlaybackUIManager__processStateEnter__block_invoke(uint64_t a1)
{
  _DWORD *v1;
  _BOOL8 v2;
  id v3;

  v1 = *(_DWORD **)(a1 + 32);
  v2 = v1[2] == 5;
  objc_msgSend(v1, "mediaController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transitionToForeground:animated:", v2, 1);

}

uint64_t __54__VUITransitionalPlaybackUIManager__processStateEnter__block_invoke_2(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_onTimeout");
  return result;
}

- (void)_processStateExit
{
  int mediaPlaybackState;
  id WeakRetained;
  id v4;
  id v5;

  mediaPlaybackState = self->_mediaPlaybackState;
  switch(mediaPlaybackState)
  {
    case 2:
      -[VUITransitionalPlaybackUIManager mediaController](self, "mediaController");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setShowsVideoControls:", 0);

      break;
    case 6:
      -[VUITransitionalPlaybackUIManager mediaController](self, "mediaController");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "play");

      break;
    case 3:
      WeakRetained = objc_loadWeakRetained((id *)&self->_backgroundedTimer);
      objc_msgSend(WeakRetained, "invalidate");

      break;
  }
}

- (int)_processUndefinedStateTriggers
{
  int mediaPlaybackState;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  mediaPlaybackState = self->_mediaPlaybackState;
  if ((self->_mediaPlaybackTrigger | 4) == 5)
  {
    -[VUITransitionalPlaybackUIManager mediaController](self, "mediaController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "state");

    if (v5)
    {
      -[VUITransitionalPlaybackUIManager mediaController](self, "mediaController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "state");

      -[VUITransitionalPlaybackUIManager delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 != 1
        && self->_isFirstAppearance
        && -[VUITransitionalPlaybackUIManager goesToForegroundOnFirstAppear](self, "goesToForegroundOnFirstAppear")
        || self->_delegateFlags.hasShouldEnableUIModeImplicitly
        && !objc_msgSend(v8, "mediaPlaybackManager:shouldEnableUIModeImplicitly:", self, 0))
      {
        mediaPlaybackState = 2;
        v9 = 1;
      }
      else
      {
        v9 = 0;
        if ((unint64_t)(v7 - 1) < 2 || v7 == 4)
          mediaPlaybackState = 1;
        else
          mediaPlaybackState = 3;
      }
      objc_msgSend(v8, "mediaPlaybackManager:shouldHideUI:animated:animations:completion:", self, v9, 0, 0, 0);

    }
  }
  return mediaPlaybackState;
}

- (int)_processBackgroundedStateTriggers
{
  int mediaPlaybackState;
  void *v3;
  uint64_t v4;

  mediaPlaybackState = self->_mediaPlaybackState;
  switch(self->_mediaPlaybackTrigger)
  {
    case 2:
      mediaPlaybackState = 0;
      break;
    case 3:
      mediaPlaybackState = 5;
      break;
    case 5:
      -[VUITransitionalPlaybackUIManager mediaController](self, "mediaController");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "state");

      if (v4 == 3)
        mediaPlaybackState = 3;
      break;
    case 7:
      if (-[VUITransitionalPlaybackUIManager _shouldPause](self, "_shouldPause"))
        mediaPlaybackState = 6;
      break;
    default:
      return mediaPlaybackState;
  }
  return mediaPlaybackState;
}

- (int)_processForegroundedStateTriggers
{
  int mediaPlaybackTrigger;
  int mediaPlaybackState;
  void *v5;
  void *v6;
  uint64_t v7;

  mediaPlaybackState = self->_mediaPlaybackState;
  mediaPlaybackTrigger = self->_mediaPlaybackTrigger;
  switch(mediaPlaybackTrigger)
  {
    case 5:
      -[VUITransitionalPlaybackUIManager mediaController](self, "mediaController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "state") == 1)
      {

      }
      else
      {
        -[VUITransitionalPlaybackUIManager mediaController](self, "mediaController");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "state");

        if (v7 != 2)
          return mediaPlaybackState;
      }
      return 4;
    case 3:
      self->_mediaPlaybackStateModifier |= self->_mediaPlaybackTriggerModifier & 3;
      return 4;
    case 2:
      return 0;
  }
  return mediaPlaybackState;
}

- (int)_processWaitingForTimeoutStateTriggers
{
  int mediaPlaybackState;
  void *v3;
  uint64_t v4;

  mediaPlaybackState = self->_mediaPlaybackState;
  switch(self->_mediaPlaybackTrigger)
  {
    case 2:
      mediaPlaybackState = 0;
      break;
    case 3:
    case 6:
      mediaPlaybackState = 5;
      break;
    case 4:
      -[VUITransitionalPlaybackUIManager _scheduleBackgroundedTimer](self, "_scheduleBackgroundedTimer");
      break;
    case 5:
      -[VUITransitionalPlaybackUIManager mediaController](self, "mediaController");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "state");

      if (v4 != 3)
        mediaPlaybackState = 1;
      break;
    case 7:
      if (-[VUITransitionalPlaybackUIManager _shouldPause](self, "_shouldPause"))
        mediaPlaybackState = 6;
      break;
    default:
      return mediaPlaybackState;
  }
  return mediaPlaybackState;
}

- (int)_processWillBeBackgroundedStateTriggers
{
  int mediaPlaybackTrigger;
  int v4;
  void *v5;

  mediaPlaybackTrigger = self->_mediaPlaybackTrigger;
  if (mediaPlaybackTrigger == 6)
  {
    -[VUITransitionalPlaybackUIManager mediaController](self, "mediaController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "state") == 3)
    {
      if ((self->_mediaPlaybackStateModifier & 2) != 0)
        v4 = 1;
      else
        v4 = 3;
    }
    else
    {
      v4 = 1;
    }

  }
  else if (mediaPlaybackTrigger == 2)
  {
    return 0;
  }
  else
  {
    return self->_mediaPlaybackState;
  }
  return v4;
}

- (int)_processWillBeForegroundedStateTriggers
{
  int mediaPlaybackState;
  int mediaPlaybackTrigger;

  mediaPlaybackState = self->_mediaPlaybackState;
  mediaPlaybackTrigger = self->_mediaPlaybackTrigger;
  if (mediaPlaybackTrigger == 2)
    mediaPlaybackState = 0;
  if (mediaPlaybackTrigger == 6)
    return 2;
  else
    return mediaPlaybackState;
}

- (int)_processPausedStateTriggers
{
  int mediaPlaybackState;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;

  mediaPlaybackState = self->_mediaPlaybackState;
  if (self->_mediaPlaybackTrigger == 7 && !-[VUITransitionalPlaybackUIManager _shouldPause](self, "_shouldPause"))
  {
    -[VUITransitionalPlaybackUIManager mediaController](self, "mediaController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "state");

    -[VUITransitionalPlaybackUIManager mediaController](self, "mediaController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mediaInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "intent");

    if (v8 == 1 && v5 == 2)
      return 3;
    else
      return 1;
  }
  return mediaPlaybackState;
}

- (void)_scheduleBackgroundedTimer
{
  NSTimer **p_backgroundedTimer;
  id WeakRetained;
  id v5;

  p_backgroundedTimer = &self->_backgroundedTimer;
  WeakRetained = objc_loadWeakRetained((id *)&self->_backgroundedTimer);
  objc_msgSend(WeakRetained, "invalidate");

  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__onTimeout, 0, 0, 5.0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)p_backgroundedTimer, v5);

}

- (BOOL)_shouldPause
{
  double v2;

  -[VUITransitionalPlaybackUIManager showcaseFactor](self, "showcaseFactor");
  return 1.0 - v2 > 0.04;
}

- (BOOL)_canSwipeUp
{
  void *v3;
  uint64_t v4;
  unint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int mediaPlaybackState;
  char v11;
  void *v12;

  if ((self->_mediaPlaybackState - 1) > 2)
    return 0;
  -[VUITransitionalPlaybackUIManager mediaController](self, "mediaController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "state");

  if (v4 == 4)
    return 0;
  v6 = v4 & 0xFFFFFFFFFFFFFFFELL;
  -[VUITransitionalPlaybackUIManager mediaController](self, "mediaController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mediaInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "intent");

  mediaPlaybackState = self->_mediaPlaybackState;
  if (mediaPlaybackState != 1 || v9)
  {
    v11 = 0;
    if (mediaPlaybackState == 2 && v9 == 1)
    {
      if (self->_delegateFlags.hasShouldEnableUIModeImplicitly)
      {
        -[VUITransitionalPlaybackUIManager delegate](self, "delegate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v12, "mediaPlaybackManager:shouldEnableUIModeImplicitly:", self, 1);

      }
      else
      {
        v11 = 0;
      }
    }
  }
  else
  {
    v11 = 1;
  }
  if (v6 == 2)
    return v11;
  else
    return 0;
}

- (BOOL)_canMenu
{
  void *v3;
  void *v4;
  uint64_t v5;
  int mediaPlaybackState;
  void *v7;
  char v8;

  -[VUITransitionalPlaybackUIManager mediaController](self, "mediaController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mediaInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "intent");

  mediaPlaybackState = self->_mediaPlaybackState;
  if (mediaPlaybackState == 2)
  {
    if (v5 != 1)
      return 1;
    if (!self->_delegateFlags.hasShouldEnableUIModeImplicitly)
      return 1;
    -[VUITransitionalPlaybackUIManager delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "mediaPlaybackManager:shouldEnableUIModeImplicitly:", self, 0);

    if ((v8 & 1) != 0)
      return 1;
    mediaPlaybackState = self->_mediaPlaybackState;
  }
  return (mediaPlaybackState | 2) == 3 && -[VUITransitionalPlaybackUIManager currentUIMode](self, "currentUIMode") == 1;
}

- (VUIMediaController)mediaController
{
  return self->_mediaController;
}

- (VUIMediaPlaybackManagerDelegate)delegate
{
  return (VUIMediaPlaybackManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (double)showcaseFactor
{
  return self->_showcaseFactor;
}

- (BOOL)goesToForegroundOnFirstAppear
{
  return self->_goesToForegroundOnFirstAppear;
}

- (void)setGoesToForegroundOnFirstAppear:(BOOL)a3
{
  self->_goesToForegroundOnFirstAppear = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_mediaController, 0);
  objc_destroyWeak((id *)&self->_backgroundedTimer);
}

@end
