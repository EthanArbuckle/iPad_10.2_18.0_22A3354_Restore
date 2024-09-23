@implementation TVMediaPlaybackManager

- (TVMediaPlaybackManager)initWithMediaController:(id)a3
{
  id v5;
  TVMediaPlaybackManager *v6;
  TVMediaPlaybackManager *v7;
  UITapGestureRecognizer *v8;
  UITapGestureRecognizer *menuGestureRecognizer;
  UITapGestureRecognizer *v10;
  _TVNonFocusSwipeUpCapture *v11;
  _TVNonFocusSwipeUpCapture *swipeUpCapture;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TVMediaPlaybackManager;
  v6 = -[TVMediaPlaybackManager init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mediaController, a3);
    v8 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", v7, sel__onMenu);
    -[UITapGestureRecognizer setDelegate:](v8, "setDelegate:", v7);
    -[UITapGestureRecognizer setAllowedPressTypes:](v8, "setAllowedPressTypes:", &unk_24EBCD4F0);
    -[UITapGestureRecognizer setEnabled:](v8, "setEnabled:", 0);
    menuGestureRecognizer = v7->_menuGestureRecognizer;
    v7->_menuGestureRecognizer = v8;
    v10 = v8;

    v11 = -[_TVNonFocusSwipeUpCapture initWithTarget:action:]([_TVNonFocusSwipeUpCapture alloc], "initWithTarget:action:", v7, sel__onSwipeUp);
    swipeUpCapture = v7->_swipeUpCapture;
    v7->_swipeUpCapture = v11;

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
  v4.super_class = (Class)TVMediaPlaybackManager;
  -[TVMediaPlaybackManager dealloc](&v4, sel_dealloc);
}

- (void)setDelegate:(id)a3
{
  TVMediaPlaybackManagerDelegate **p_delegate;
  id v5;

  p_delegate = &self->_delegate;
  v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  self->_delegateFlags.hasShouldEnableUIModeImplicitly = objc_opt_respondsToSelector() & 1;
  self->_delegateFlags.hasEvaluateSwipeUpMessage = objc_opt_respondsToSelector() & 1;
  LOBYTE(p_delegate) = objc_opt_respondsToSelector();

  self->_delegateFlags.hasPresentPlaybackController = p_delegate & 1;
}

- (UIPanGestureRecognizer)swipeUpGestureRecognizer
{
  return -[_TVNonFocusSwipeUpCapture gestureRecognizer](self->_swipeUpCapture, "gestureRecognizer");
}

- (void)onAppear
{
  self->_mediaPlaybackTrigger = 1;
  -[TVMediaPlaybackManager _processTrigger](self, "_processTrigger");
  self->_isFirstAppearance = 0;
}

- (void)onDisappear
{
  self->_mediaPlaybackTrigger = 2;
  -[TVMediaPlaybackManager _processTrigger](self, "_processTrigger");
}

- (void)onEvent
{
  self->_mediaPlaybackTrigger = 4;
  -[TVMediaPlaybackManager _processTrigger](self, "_processTrigger");
}

- (void)onMediaControllerStateDidChange
{
  self->_mediaPlaybackTrigger = 5;
  -[TVMediaPlaybackManager _processTrigger](self, "_processTrigger");
}

- (BOOL)onSupplementaryUIShouldPresent
{
  int mediaPlaybackState;

  mediaPlaybackState = self->_mediaPlaybackState;
  if (mediaPlaybackState == 2)
  {
    self->_mediaPlaybackTrigger = 3;
    self->_mediaPlaybackTriggerModifier |= 3uLL;
    -[TVMediaPlaybackManager _processTrigger](self, "_processTrigger");
  }
  return mediaPlaybackState == 2;
}

- (void)onSupplementaryUIShouldDismiss
{
  if (self->_mediaPlaybackState == 1 && -[TVMediaPlaybackManager currentUIMode](self, "currentUIMode") == 1)
  {
    self->_mediaPlaybackTrigger = 3;
    -[TVMediaPlaybackManager _processTrigger](self, "_processTrigger");
  }
}

- (void)setShowcaseFactor:(double)a3
{
  if (self->_showcaseFactor != a3)
  {
    self->_showcaseFactor = a3;
    -[TVMediaPlaybackManager _onShowcaseFactorDidChange](self, "_onShowcaseFactorDidChange");
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

- (void)_onMenu
{
  self->_mediaPlaybackTrigger = 3;
  if (-[TVMediaPlaybackManager currentUIMode](self, "currentUIMode") == 1)
    self->_mediaPlaybackTriggerModifier |= 1uLL;
  -[TVMediaPlaybackManager _processTrigger](self, "_processTrigger");
}

- (void)_onSwipeUp
{
  self->_mediaPlaybackTrigger = 3;
  if (self->_mediaPlaybackState == 2)
    self->_mediaPlaybackTriggerModifier |= 1uLL;
  -[TVMediaPlaybackManager _processTrigger](self, "_processTrigger");
}

- (void)_onTimeout
{
  self->_mediaPlaybackTrigger = 6;
  -[TVMediaPlaybackManager _processTrigger](self, "_processTrigger");
}

- (void)_onShowcaseFactorDidChange
{
  self->_mediaPlaybackTrigger = 7;
  -[TVMediaPlaybackManager _processTrigger](self, "_processTrigger");
}

- (void)_processTrigger
{
  int v3;
  int v4;
  void *v5;
  void *v6;
  id v7;

  switch(self->_mediaPlaybackState)
  {
    case 0:
      v3 = -[TVMediaPlaybackManager _processUndefinedStateTriggers](self, "_processUndefinedStateTriggers");
      goto LABEL_10;
    case 1:
      v3 = -[TVMediaPlaybackManager _processBackgroundedStateTriggers](self, "_processBackgroundedStateTriggers");
      goto LABEL_10;
    case 2:
      v3 = -[TVMediaPlaybackManager _processForegroundedStateTriggers](self, "_processForegroundedStateTriggers");
      goto LABEL_10;
    case 3:
      v3 = -[TVMediaPlaybackManager _processWaitingForTimeoutStateTriggers](self, "_processWaitingForTimeoutStateTriggers");
      goto LABEL_10;
    case 4:
      v3 = -[TVMediaPlaybackManager _processWillBeBackgroundedStateTriggers](self, "_processWillBeBackgroundedStateTriggers");
      goto LABEL_10;
    case 5:
      v3 = -[TVMediaPlaybackManager _processWillBeForegroundedStateTriggers](self, "_processWillBeForegroundedStateTriggers");
      goto LABEL_10;
    case 6:
      v3 = -[TVMediaPlaybackManager _processPausedStateTriggers](self, "_processPausedStateTriggers");
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
    -[TVMediaPlaybackManager _processStateExit](self, "_processStateExit");
    self->_mediaPlaybackState = v4;
    -[TVMediaPlaybackManager _processStateEnter](self, "_processStateEnter");
  }
  -[TVMediaPlaybackManager menuGestureRecognizer](self, "menuGestureRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", -[TVMediaPlaybackManager _canMenu](self, "_canMenu"));

  -[TVMediaPlaybackManager swipeUpGestureRecognizer](self, "swipeUpGestureRecognizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", -[TVMediaPlaybackManager _canSwipeUp](self, "_canSwipeUp"));

  if ((v4 & 0xFFFFFFFE) != 4 && self->_delegateFlags.hasEvaluateSwipeUpMessage)
  {
    -[TVMediaPlaybackManager delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "evaluateSwipeUpMessageForMediaPlaybackManager:", self);

  }
}

- (void)_processStateEnter
{
  int mediaPlaybackState;
  void *v4;
  void *v5;
  _BOOL4 hasPresentPlaybackController;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  _QWORD v13[5];

  mediaPlaybackState = self->_mediaPlaybackState;
  switch(mediaPlaybackState)
  {
    case 0:
      goto LABEL_8;
    case 2:
      -[TVMediaPlaybackManager mediaController](self, "mediaController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setShowsVideoControls:", 1);

LABEL_8:
      self->_mediaPlaybackStateModifier = 0;
      return;
    case 3:
      -[TVMediaPlaybackManager _scheduleBackgroundedTimer](self, "_scheduleBackgroundedTimer");
      return;
    case 4:
    case 5:
      if (mediaPlaybackState != 5)
        goto LABEL_12;
      -[TVMediaPlaybackManager mediaController](self, "mediaController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "mediaInfo");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "intent") != 1)
      {

LABEL_12:
        -[TVMediaPlaybackManager delegate](self, "delegate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v12[4] = self;
        v13[0] = MEMORY[0x24BDAC760];
        v13[1] = 3221225472;
        v13[2] = __44__TVMediaPlaybackManager__processStateEnter__block_invoke;
        v13[3] = &unk_24EB85440;
        v13[4] = self;
        v12[0] = MEMORY[0x24BDAC760];
        v12[1] = 3221225472;
        v12[2] = __44__TVMediaPlaybackManager__processStateEnter__block_invoke_2;
        v12[3] = &unk_24EB85A38;
        objc_msgSend(v10, "mediaPlaybackManager:shouldHideUI:animated:animations:completion:", self, mediaPlaybackState == 5, 1, v13, v12);

        return;
      }
      hasPresentPlaybackController = self->_delegateFlags.hasPresentPlaybackController;

      if (!hasPresentPlaybackController)
        goto LABEL_12;
      -[TVMediaPlaybackManager delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "presentForegroundPlaybackControllerForMediaPlaybackManager:", self);

      if ((v8 & 1) == 0)
        goto LABEL_12;
      return;
    case 6:
      -[TVMediaPlaybackManager mediaController](self, "mediaController");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "pause");

      return;
    default:
      return;
  }
}

void __44__TVMediaPlaybackManager__processStateEnter__block_invoke(uint64_t a1)
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

uint64_t __44__TVMediaPlaybackManager__processStateEnter__block_invoke_2(uint64_t result, int a2)
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
      -[TVMediaPlaybackManager mediaController](self, "mediaController");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setShowsVideoControls:", 0);

      break;
    case 6:
      -[TVMediaPlaybackManager mediaController](self, "mediaController");
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
  int v9;
  uint64_t v10;
  void *v12;

  mediaPlaybackState = self->_mediaPlaybackState;
  if ((self->_mediaPlaybackTrigger | 4) == 5)
  {
    -[TVMediaPlaybackManager mediaController](self, "mediaController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "state");

    if (v5)
    {
      -[TVMediaPlaybackManager mediaController](self, "mediaController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "state");

      if (v7 != 1
        && self->_isFirstAppearance
        && -[TVMediaPlaybackManager goesToForegroundOnFirstAppear](self, "goesToForegroundOnFirstAppear")
        || self->_delegateFlags.hasShouldEnableUIModeImplicitly
        && (-[TVMediaPlaybackManager delegate](self, "delegate"),
            v8 = (void *)objc_claimAutoreleasedReturnValue(),
            v9 = objc_msgSend(v8, "mediaPlaybackManager:shouldEnableUIModeImplicitly:", self, 0),
            v8,
            !v9))
      {
        mediaPlaybackState = 2;
        v10 = 1;
      }
      else
      {
        v10 = 0;
        if ((unint64_t)(v7 - 1) < 2 || v7 == 4)
          mediaPlaybackState = 1;
        else
          mediaPlaybackState = 3;
      }
      -[TVMediaPlaybackManager delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "mediaPlaybackManager:shouldHideUI:animated:animations:completion:", self, v10, 0, 0, 0);

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
      -[TVMediaPlaybackManager mediaController](self, "mediaController");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "state");

      if (v4 == 3)
        mediaPlaybackState = 3;
      break;
    case 7:
      if (-[TVMediaPlaybackManager _shouldPause](self, "_shouldPause"))
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
      -[TVMediaPlaybackManager mediaController](self, "mediaController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "state") == 1)
      {

      }
      else
      {
        -[TVMediaPlaybackManager mediaController](self, "mediaController");
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
      -[TVMediaPlaybackManager _scheduleBackgroundedTimer](self, "_scheduleBackgroundedTimer");
      break;
    case 5:
      -[TVMediaPlaybackManager mediaController](self, "mediaController");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "state");

      if (v4 != 3)
        mediaPlaybackState = 1;
      break;
    case 7:
      if (-[TVMediaPlaybackManager _shouldPause](self, "_shouldPause"))
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
    -[TVMediaPlaybackManager mediaController](self, "mediaController");
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
  if (self->_mediaPlaybackTrigger == 7 && !-[TVMediaPlaybackManager _shouldPause](self, "_shouldPause"))
  {
    -[TVMediaPlaybackManager mediaController](self, "mediaController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "state");

    -[TVMediaPlaybackManager mediaController](self, "mediaController");
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

  objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__onTimeout, 0, 0, 5.0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)p_backgroundedTimer, v5);

}

- (BOOL)_shouldPause
{
  double v2;

  -[TVMediaPlaybackManager showcaseFactor](self, "showcaseFactor");
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
  -[TVMediaPlaybackManager mediaController](self, "mediaController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "state");

  if (v4 == 4)
    return 0;
  v6 = v4 & 0xFFFFFFFFFFFFFFFELL;
  -[TVMediaPlaybackManager mediaController](self, "mediaController");
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
        -[TVMediaPlaybackManager delegate](self, "delegate");
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

  -[TVMediaPlaybackManager mediaController](self, "mediaController");
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
    -[TVMediaPlaybackManager delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "mediaPlaybackManager:shouldEnableUIModeImplicitly:", self, 0);

    if ((v8 & 1) != 0)
      return 1;
    mediaPlaybackState = self->_mediaPlaybackState;
  }
  return (mediaPlaybackState | 2) == 3 && -[TVMediaPlaybackManager currentUIMode](self, "currentUIMode") == 1;
}

- (TVMediaController)mediaController
{
  return self->_mediaController;
}

- (TVMediaPlaybackManagerDelegate)delegate
{
  return (TVMediaPlaybackManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (UITapGestureRecognizer)menuGestureRecognizer
{
  return self->_menuGestureRecognizer;
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
  objc_storeStrong((id *)&self->_menuGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_mediaController, 0);
  objc_storeStrong((id *)&self->_swipeUpCapture, 0);
  objc_destroyWeak((id *)&self->_backgroundedTimer);
}

@end
