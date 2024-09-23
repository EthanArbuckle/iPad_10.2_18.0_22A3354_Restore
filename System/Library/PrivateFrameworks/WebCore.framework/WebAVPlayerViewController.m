@implementation WebAVPlayerViewController

- (WebAVPlayerViewController)initWithFullscreenInterface:(void *)a3
{
  void *v4;
  WebAVPlayerViewController *v5;
  uint64_t v6;
  ThreadSafeWeakPtrControlBlock *v8;
  int v9;
  ThreadSafeWeakPtrControlBlock *m_ptr;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)WebAVPlayerViewController;
  v5 = -[WebAVPlayerViewController init](&v25, sel_init);
  if (!v5)
    return v5;
  v6 = *((_QWORD *)a3 + 8);
  if (!v6)
  {
    v8 = 0;
    goto LABEL_14;
  }
  if (__ldaxr((unsigned __int8 *)v6))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)v6))
  {
    goto LABEL_7;
  }
  MEMORY[0x19AEA534C](v6);
LABEL_7:
  if (*(_QWORD *)(v6 + 24))
  {
    ++*(_QWORD *)(v6 + 16);
    v8 = (ThreadSafeWeakPtrControlBlock *)v6;
  }
  else
  {
    v8 = 0;
  }
  v9 = __ldxr((unsigned __int8 *)v6);
  if (v9 != 1)
  {
    __clrex();
    goto LABEL_13;
  }
  if (__stlxr(0, (unsigned __int8 *)v6))
LABEL_13:
    WTF::Lock::unlockSlow((WTF::Lock *)v6);
LABEL_14:
  m_ptr = v5->_fullscreenInterface.m_controlBlock.m_ptr;
  v5->_fullscreenInterface.m_controlBlock.m_ptr = v8;
  if (!m_ptr)
    goto LABEL_27;
  if (__ldaxr((unsigned __int8 *)m_ptr))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)m_ptr))
  {
    goto LABEL_19;
  }
  MEMORY[0x19AEA534C](m_ptr);
LABEL_19:
  v12 = *((_QWORD *)m_ptr + 2) - 1;
  *((_QWORD *)m_ptr + 2) = v12;
  if (!v12)
  {
    v13 = *((_QWORD *)m_ptr + 1);
    v14 = __ldxr((unsigned __int8 *)m_ptr);
    if (v14 == 1)
    {
      if (!__stlxr(0, (unsigned __int8 *)m_ptr))
      {
        if (v13)
          goto LABEL_27;
LABEL_26:
        WTF::fastFree((WTF *)m_ptr, v4);
        goto LABEL_27;
      }
    }
    else
    {
      __clrex();
    }
    WTF::Lock::unlockSlow((WTF::Lock *)m_ptr);
    if (v13)
      goto LABEL_27;
    goto LABEL_26;
  }
  v20 = __ldxr((unsigned __int8 *)m_ptr);
  if (v20 != 1)
  {
    __clrex();
    goto LABEL_39;
  }
  if (__stlxr(0, (unsigned __int8 *)m_ptr))
LABEL_39:
    WTF::Lock::unlockSlow((WTF::Lock *)m_ptr);
LABEL_27:
  v5->_fullscreenInterface.m_objectOfCorrectType = (VideoPresentationInterfaceAVKit *)a3;
  if (-[WebAVPlayerViewController loggerPtr](v5, "loggerPtr"))
  {
    if (-[WebAVPlayerViewController logChannel](v5, "logChannel"))
    {
      v15 = -[WebAVPlayerViewController loggerPtr](v5, "loggerPtr");
      v16 = -[WebAVPlayerViewController logChannel](v5, "logChannel");
      v21 = 0;
      v22 = 0;
      v23 = "-[WebAVPlayerViewController initWithFullscreenInterface:]";
      v24 = -[WebAVPlayerViewController logIdentifier](v5, "logIdentifier");
      if (*(_BYTE *)(v15 + 12))
        WTF::Logger::log<WTF::Logger::LogSiteIdentifier>(v16, 0, (WTF::Logger::LogSiteIdentifier *)&v21);
    }
  }
  v17 = (void *)objc_msgSend(objc_alloc((Class)getAVPlayerViewControllerClass()), "initWithPlayerLayerView:", *((_QWORD *)a3 + 31));
  v18 = v5->_avPlayerViewController.m_ptr;
  v5->_avPlayerViewController.m_ptr = v17;
  if (v18)
  {
    CFRelease(v18);
    v17 = v5->_avPlayerViewController.m_ptr;
  }
  objc_msgSend(v17, "setModalPresentationStyle:", 5, v21, v22, v23, v24);
  return v5;
}

- (void)dealloc
{
  _BYTE *v3;
  $F9635BD25436628440684A9CD771B596 *v4;
  void *m_ptr;
  objc_super v6;
  _QWORD v7[4];

  if (-[WebAVPlayerViewController loggerPtr](self, "loggerPtr"))
  {
    if (-[WebAVPlayerViewController logChannel](self, "logChannel"))
    {
      v3 = -[WebAVPlayerViewController loggerPtr](self, "loggerPtr");
      v4 = -[WebAVPlayerViewController logChannel](self, "logChannel");
      v7[0] = 0;
      v7[1] = 0;
      v7[2] = "-[WebAVPlayerViewController dealloc]";
      v7[3] = -[WebAVPlayerViewController logIdentifier](self, "logIdentifier");
      if (v3[12])
        WTF::Logger::log<WTF::Logger::LogSiteIdentifier>((uint64_t)v4, 0, (WTF::Logger::LogSiteIdentifier *)v7);
    }
  }
  if (self->_startPictureInPictureTimer.m_ptr)
  {
    -[WebAVPlayerViewController removeObserver](self, "removeObserver");
    objc_msgSend(self->_startPictureInPictureTimer.m_ptr, "invalidate");
    m_ptr = self->_startPictureInPictureTimer.m_ptr;
    self->_startPictureInPictureTimer.m_ptr = 0;
    if (m_ptr)
      CFRelease(m_ptr);
  }
  v6.receiver = self;
  v6.super_class = (Class)WebAVPlayerViewController;
  -[WebAVPlayerViewController dealloc](&v6, sel_dealloc);
}

- (BOOL)playerViewControllerShouldHandleDoneButtonTap:(id)a3
{
  WeakObjCPtr<WebAVPlayerViewControllerDelegate> *p_delegate;

  p_delegate = &self->_delegate;
  if (objc_loadWeak(&self->_delegate.m_weakReference))
    return objc_msgSend(objc_loadWeak(&p_delegate->m_weakReference), "playerViewController:shouldExitFullScreenWithReason:", a3, 0);
  else
    return 1;
}

- (void)setWebKitOverrideRouteSharingPolicy:(unint64_t)a3 routingContextUID:(id)a4
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(self->_avPlayerViewController.m_ptr, "setWebKitOverrideRouteSharingPolicy:routingContextUID:", a3, a4);
}

- (void)enterFullScreenAnimated:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v5;
  _BYTE *v7;
  $F9635BD25436628440684A9CD771B596 *v8;
  _QWORD v9[4];

  v5 = a3;
  if (-[WebAVPlayerViewController loggerPtr](self, "loggerPtr"))
  {
    if (-[WebAVPlayerViewController logChannel](self, "logChannel"))
    {
      v7 = -[WebAVPlayerViewController loggerPtr](self, "loggerPtr");
      v8 = -[WebAVPlayerViewController logChannel](self, "logChannel");
      v9[0] = 0;
      v9[1] = 0;
      v9[2] = "-[WebAVPlayerViewController enterFullScreenAnimated:completionHandler:]";
      v9[3] = -[WebAVPlayerViewController logIdentifier](self, "logIdentifier");
      if (v7[12])
        WTF::Logger::log<WTF::Logger::LogSiteIdentifier,BOOL>((uint64_t)v8, 0, (WTF::Logger::LogSiteIdentifier *)v9);
    }
  }
  objc_msgSend(self->_avPlayerViewController.m_ptr, "enterFullScreenAnimated:completionHandler:", v5, a4);
}

- (void)exitFullScreenAnimated:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v5;
  _BYTE *v7;
  $F9635BD25436628440684A9CD771B596 *v8;
  _QWORD v9[4];

  v5 = a3;
  if (-[WebAVPlayerViewController loggerPtr](self, "loggerPtr"))
  {
    if (-[WebAVPlayerViewController logChannel](self, "logChannel"))
    {
      v7 = -[WebAVPlayerViewController loggerPtr](self, "loggerPtr");
      v8 = -[WebAVPlayerViewController logChannel](self, "logChannel");
      v9[0] = 0;
      v9[1] = 0;
      v9[2] = "-[WebAVPlayerViewController exitFullScreenAnimated:completionHandler:]";
      v9[3] = -[WebAVPlayerViewController logIdentifier](self, "logIdentifier");
      if (v7[12])
        WTF::Logger::log<WTF::Logger::LogSiteIdentifier,BOOL>((uint64_t)v8, 0, (WTF::Logger::LogSiteIdentifier *)v9);
    }
  }
  objc_msgSend(self->_avPlayerViewController.m_ptr, "exitFullScreenAnimated:completionHandler:", v5, a4);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *m_ptr;
  void *v8;
  _QWORD block[5];

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("pictureInPicturePossible"), a4, a5, a6))
  {
    if (-[WebAVPlayerViewController isPictureInPicturePossible](self, "isPictureInPicturePossible"))
    {
      m_ptr = self->_startPictureInPictureTimer.m_ptr;
      if (m_ptr)
      {
        objc_msgSend(m_ptr, "invalidate");
        v8 = self->_startPictureInPictureTimer.m_ptr;
        self->_startPictureInPictureTimer.m_ptr = 0;
        if (v8)
          CFRelease(v8);
        -[WebAVPlayerViewController removeObserver](self, "removeObserver");
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __76__WebAVPlayerViewController_observeValueForKeyPath_ofObject_change_context___block_invoke;
        block[3] = &unk_1E3203658;
        block[4] = self;
        dispatch_async(MEMORY[0x1E0C80D38], block);
      }
    }
  }
}

uint64_t __76__WebAVPlayerViewController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startPictureInPicture");
}

- (void)initObserver
{
  objc_msgSend(self->_avPlayerViewController.m_ptr, "addObserver:forKeyPath:options:context:", self, CFSTR("pictureInPicturePossible"), 1, 0);
}

- (void)removeObserver
{
  objc_msgSend(self->_avPlayerViewController.m_ptr, "removeObserver:forKeyPath:context:", self, CFSTR("pictureInPicturePossible"), 0);
}

- (void)tryToStartPictureInPicture
{
  _BYTE *v3;
  $F9635BD25436628440684A9CD771B596 *v4;
  void *v5;
  void *v6;
  void *m_ptr;
  _QWORD v8[5];
  _QWORD block[5];
  _QWORD v10[4];

  if (-[WebAVPlayerViewController loggerPtr](self, "loggerPtr"))
  {
    if (-[WebAVPlayerViewController logChannel](self, "logChannel"))
    {
      v3 = -[WebAVPlayerViewController loggerPtr](self, "loggerPtr");
      v4 = -[WebAVPlayerViewController logChannel](self, "logChannel");
      v10[0] = 0;
      v10[1] = 0;
      v10[2] = "-[WebAVPlayerViewController tryToStartPictureInPicture]";
      v10[3] = -[WebAVPlayerViewController logIdentifier](self, "logIdentifier");
      if (v3[12])
        WTF::Logger::log<WTF::Logger::LogSiteIdentifier>((uint64_t)v4, 0, (WTF::Logger::LogSiteIdentifier *)v10);
    }
  }
  if (!self->_startPictureInPictureTimer.m_ptr)
  {
    if (-[WebAVPlayerViewController isPictureInPicturePossible](self, "isPictureInPicturePossible"))
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __55__WebAVPlayerViewController_tryToStartPictureInPicture__block_invoke;
      block[3] = &unk_1E3203658;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
    else
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __55__WebAVPlayerViewController_tryToStartPictureInPicture__block_invoke_2;
      v8[3] = &unk_1E3484F88;
      v8[4] = self;
      v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:repeats:block:", 0, v8, 5.0);
      v6 = v5;
      if (v5)
        CFRetain(v5);
      m_ptr = self->_startPictureInPictureTimer.m_ptr;
      self->_startPictureInPictureTimer.m_ptr = v6;
      if (m_ptr)
        CFRelease(m_ptr);
      -[WebAVPlayerViewController initObserver](self, "initObserver");
    }
  }
}

uint64_t __55__WebAVPlayerViewController_tryToStartPictureInPicture__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startPictureInPicture");
}

void __55__WebAVPlayerViewController_tryToStartPictureInPicture__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 **v6;
  int v8;

  objc_msgSend(*(id *)(a1 + 32), "removeObserver");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(const void **)(v2 + 32);
  *(_QWORD *)(v2 + 32) = 0;
  if (v3)
    CFRelease(v3);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(v4 + 8);
  if (!v5)
    return;
  v6 = *(unsigned __int8 ***)(v4 + 16);
  if (__ldaxr((unsigned __int8 *)v5))
  {
    __clrex();
LABEL_7:
    MEMORY[0x19AEA534C](v5);
    goto LABEL_8;
  }
  if (__stxr(1u, (unsigned __int8 *)v5))
    goto LABEL_7;
LABEL_8:
  if (*(_QWORD *)(v5 + 24))
    ++*(_QWORD *)(v5 + 8);
  else
    v6 = 0;
  v8 = __ldxr((unsigned __int8 *)v5);
  if (v8 == 1)
  {
    if (!__stlxr(0, (unsigned __int8 *)v5))
    {
      if (!v6)
        return;
      goto LABEL_14;
    }
  }
  else
  {
    __clrex();
  }
  WTF::Lock::unlockSlow((WTF::Lock *)v5);
  if (v6)
  {
LABEL_14:
    WebCore::VideoPresentationInterfaceIOS::failedToStartPictureInPicture((WebCore::VideoPresentationInterfaceIOS *)v6);
    WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::VideoPresentationInterfaceIOS,(WTF::DestructionThread)2>(v6[8]);
  }
}

- (void)startPictureInPicture
{
  _BYTE *v3;
  $F9635BD25436628440684A9CD771B596 *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  const void *v8;

  if (-[WebAVPlayerViewController loggerPtr](self, "loggerPtr"))
  {
    if (-[WebAVPlayerViewController logChannel](self, "logChannel"))
    {
      v3 = -[WebAVPlayerViewController loggerPtr](self, "loggerPtr");
      v4 = -[WebAVPlayerViewController logChannel](self, "logChannel");
      v5 = 0;
      v6 = 0;
      v7 = "-[WebAVPlayerViewController startPictureInPicture]";
      v8 = -[WebAVPlayerViewController logIdentifier](self, "logIdentifier");
      if (v3[12])
        WTF::Logger::log<WTF::Logger::LogSiteIdentifier>((uint64_t)v4, 0, (WTF::Logger::LogSiteIdentifier *)&v5);
    }
  }
  objc_msgSend(self->_avPlayerViewController.m_ptr, "startPictureInPicture", v5, v6, v7, v8);
}

- (void)stopPictureInPicture
{
  _BYTE *v3;
  $F9635BD25436628440684A9CD771B596 *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  const void *v8;

  if (-[WebAVPlayerViewController loggerPtr](self, "loggerPtr"))
  {
    if (-[WebAVPlayerViewController logChannel](self, "logChannel"))
    {
      v3 = -[WebAVPlayerViewController loggerPtr](self, "loggerPtr");
      v4 = -[WebAVPlayerViewController logChannel](self, "logChannel");
      v5 = 0;
      v6 = 0;
      v7 = "-[WebAVPlayerViewController stopPictureInPicture]";
      v8 = -[WebAVPlayerViewController logIdentifier](self, "logIdentifier");
      if (v3[12])
        WTF::Logger::log<WTF::Logger::LogSiteIdentifier>((uint64_t)v4, 0, (WTF::Logger::LogSiteIdentifier *)&v5);
    }
  }
  objc_msgSend(self->_avPlayerViewController.m_ptr, "stopPictureInPicture", v5, v6, v7, v8);
}

- (BOOL)isPictureInPicturePossible
{
  return objc_msgSend(self->_avPlayerViewController.m_ptr, "isPictureInPicturePossible");
}

- (BOOL)isPictureInPictureActive
{
  return objc_msgSend(self->_avPlayerViewController.m_ptr, "isPictureInPictureActive");
}

- (BOOL)pictureInPictureActive
{
  return objc_msgSend(self->_avPlayerViewController.m_ptr, "isPictureInPictureActive");
}

- (BOOL)pictureInPictureWasStartedWhenEnteringBackground
{
  return objc_msgSend(self->_avPlayerViewController.m_ptr, "pictureInPictureWasStartedWhenEnteringBackground");
}

- (id)view
{
  return (id)objc_msgSend(self->_avPlayerViewController.m_ptr, "view");
}

- (void)flashPlaybackControlsWithDuration:(double)a3
{
  _BYTE *v5;
  $F9635BD25436628440684A9CD771B596 *v6;
  _QWORD v7[4];

  if (-[WebAVPlayerViewController loggerPtr](self, "loggerPtr"))
  {
    if (-[WebAVPlayerViewController logChannel](self, "logChannel"))
    {
      v5 = -[WebAVPlayerViewController loggerPtr](self, "loggerPtr");
      v6 = -[WebAVPlayerViewController logChannel](self, "logChannel");
      v7[0] = 0;
      v7[1] = 0;
      v7[2] = "-[WebAVPlayerViewController flashPlaybackControlsWithDuration:]";
      v7[3] = -[WebAVPlayerViewController logIdentifier](self, "logIdentifier");
      if (v5[12])
        WTF::Logger::log<WTF::Logger::LogSiteIdentifier>((uint64_t)v6, 0, (WTF::Logger::LogSiteIdentifier *)v7);
    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(self->_avPlayerViewController.m_ptr, "flashPlaybackControlsWithDuration:", a3);
}

- (BOOL)showsPlaybackControls
{
  return objc_msgSend(self->_avPlayerViewController.m_ptr, "showsPlaybackControls");
}

- (void)setShowsPlaybackControls:(BOOL)a3
{
  _BOOL8 v3;
  _BYTE *v5;
  $F9635BD25436628440684A9CD771B596 *v6;
  _QWORD v7[4];

  v3 = a3;
  if (-[WebAVPlayerViewController loggerPtr](self, "loggerPtr"))
  {
    if (-[WebAVPlayerViewController logChannel](self, "logChannel"))
    {
      v5 = -[WebAVPlayerViewController loggerPtr](self, "loggerPtr");
      v6 = -[WebAVPlayerViewController logChannel](self, "logChannel");
      v7[0] = 0;
      v7[1] = 0;
      v7[2] = "-[WebAVPlayerViewController setShowsPlaybackControls:]";
      v7[3] = -[WebAVPlayerViewController logIdentifier](self, "logIdentifier");
      if (v5[12])
        WTF::Logger::log<WTF::Logger::LogSiteIdentifier,BOOL>((uint64_t)v6, 0, (WTF::Logger::LogSiteIdentifier *)v7);
    }
  }
  objc_msgSend(self->_avPlayerViewController.m_ptr, "setShowsPlaybackControls:", v3);
}

- (void)setAllowsPictureInPicturePlayback:(BOOL)a3
{
  _BOOL8 v3;
  _BYTE *v5;
  $F9635BD25436628440684A9CD771B596 *v6;
  _QWORD v7[4];

  v3 = a3;
  if (-[WebAVPlayerViewController loggerPtr](self, "loggerPtr"))
  {
    if (-[WebAVPlayerViewController logChannel](self, "logChannel"))
    {
      v5 = -[WebAVPlayerViewController loggerPtr](self, "loggerPtr");
      v6 = -[WebAVPlayerViewController logChannel](self, "logChannel");
      v7[0] = 0;
      v7[1] = 0;
      v7[2] = "-[WebAVPlayerViewController setAllowsPictureInPicturePlayback:]";
      v7[3] = -[WebAVPlayerViewController logIdentifier](self, "logIdentifier");
      if (v5[12])
        WTF::Logger::log<WTF::Logger::LogSiteIdentifier,BOOL>((uint64_t)v6, 0, (WTF::Logger::LogSiteIdentifier *)v7);
    }
  }
  objc_msgSend(self->_avPlayerViewController.m_ptr, "setAllowsPictureInPicturePlayback:", v3);
}

- (void)setDelegate:(id)a3
{
  objc_msgSend(self->_avPlayerViewController.m_ptr, "setDelegate:", a3);
}

- (void)setPlayerController:(id)a3
{
  objc_msgSend(self->_avPlayerViewController.m_ptr, "setPlayerController:", a3);
}

- (id)avPlayerViewController
{
  return self->_avPlayerViewController.m_ptr;
}

- (void)removeFromParentViewController
{
  objc_msgSend(self->_avPlayerViewController.m_ptr, "removeFromParentViewController");
}

- (const)logIdentifier
{
  ThreadSafeWeakPtrControlBlock *m_ptr;
  VideoPresentationInterfaceAVKit *m_objectOfCorrectType;
  int v5;
  uint64_t v6;

  m_ptr = self->_fullscreenInterface.m_controlBlock.m_ptr;
  if (!m_ptr)
    return m_ptr;
  m_objectOfCorrectType = self->_fullscreenInterface.m_objectOfCorrectType;
  if (__ldaxr((unsigned __int8 *)m_ptr))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)m_ptr))
  {
    goto LABEL_6;
  }
  MEMORY[0x19AEA534C](m_ptr, a2);
LABEL_6:
  if (*((_QWORD *)m_ptr + 3))
    ++*((_QWORD *)m_ptr + 1);
  else
    m_objectOfCorrectType = 0;
  v5 = __ldxr((unsigned __int8 *)m_ptr);
  if (v5 != 1)
  {
    __clrex();
LABEL_15:
    WTF::Lock::unlockSlow((WTF::Lock *)m_ptr);
    if (m_objectOfCorrectType)
      goto LABEL_12;
    return 0;
  }
  if (__stlxr(0, (unsigned __int8 *)m_ptr))
    goto LABEL_15;
  if (!m_objectOfCorrectType)
    return 0;
LABEL_12:
  v6 = *(_QWORD *)(*((_QWORD *)m_objectOfCorrectType + 33) + 24);
  if (v6)
    m_ptr = (ThreadSafeWeakPtrControlBlock *)(*(uint64_t (**)(uint64_t, SEL))(*(_QWORD *)v6 + 496))(v6, a2);
  else
    m_ptr = 0;
  WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::VideoPresentationInterfaceIOS,(WTF::DestructionThread)2>(*((unsigned __int8 **)m_objectOfCorrectType + 8));
  return m_ptr;
}

- (const)loggerPtr
{
  ThreadSafeWeakPtrControlBlock *m_ptr;
  VideoPresentationInterfaceAVKit *m_objectOfCorrectType;
  int v5;
  uint64_t v6;

  m_ptr = self->_fullscreenInterface.m_controlBlock.m_ptr;
  if (!m_ptr)
    return m_ptr;
  m_objectOfCorrectType = self->_fullscreenInterface.m_objectOfCorrectType;
  if (__ldaxr((unsigned __int8 *)m_ptr))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)m_ptr))
  {
    goto LABEL_6;
  }
  MEMORY[0x19AEA534C](m_ptr, a2);
LABEL_6:
  if (*((_QWORD *)m_ptr + 3))
    ++*((_QWORD *)m_ptr + 1);
  else
    m_objectOfCorrectType = 0;
  v5 = __ldxr((unsigned __int8 *)m_ptr);
  if (v5 != 1)
  {
    __clrex();
LABEL_15:
    WTF::Lock::unlockSlow((WTF::Lock *)m_ptr);
    if (m_objectOfCorrectType)
      goto LABEL_12;
    return 0;
  }
  if (__stlxr(0, (unsigned __int8 *)m_ptr))
    goto LABEL_15;
  if (!m_objectOfCorrectType)
    return 0;
LABEL_12:
  v6 = *(_QWORD *)(*((_QWORD *)m_objectOfCorrectType + 33) + 24);
  if (v6)
    m_ptr = (ThreadSafeWeakPtrControlBlock *)(*(uint64_t (**)(uint64_t, SEL))(*(_QWORD *)v6 + 504))(v6, a2);
  else
    m_ptr = 0;
  WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::VideoPresentationInterfaceIOS,(WTF::DestructionThread)2>(*((unsigned __int8 **)m_objectOfCorrectType + 8));
  return m_ptr;
}

- ($F9635BD25436628440684A9CD771B596)logChannel
{
  return ($F9635BD25436628440684A9CD771B596 *)&WebCore::LogFullscreen;
}

- (void).cxx_destruct
{
  void *v3;
  void *m_ptr;
  void *v5;
  ThreadSafeWeakPtrControlBlock *v6;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;

  objc_destroyWeak(&self->_delegate.m_weakReference);
  m_ptr = self->_startPictureInPictureTimer.m_ptr;
  self->_startPictureInPictureTimer.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v5 = self->_avPlayerViewController.m_ptr;
  self->_avPlayerViewController.m_ptr = 0;
  if (v5)
    CFRelease(v5);
  v6 = self->_fullscreenInterface.m_controlBlock.m_ptr;
  self->_fullscreenInterface.m_controlBlock.m_ptr = 0;
  if (!v6)
    return;
  if (__ldaxr((unsigned __int8 *)v6))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)v6))
  {
    goto LABEL_10;
  }
  MEMORY[0x19AEA534C](v6);
LABEL_10:
  v8 = *((_QWORD *)v6 + 2) - 1;
  *((_QWORD *)v6 + 2) = v8;
  if (v8)
  {
    v11 = __ldxr((unsigned __int8 *)v6);
    if (v11 == 1)
    {
      if (!__stlxr(0, (unsigned __int8 *)v6))
        return;
    }
    else
    {
      __clrex();
    }
    WTF::Lock::unlockSlow((WTF::Lock *)v6);
    return;
  }
  v9 = *((_QWORD *)v6 + 1);
  v10 = __ldxr((unsigned __int8 *)v6);
  if (v10 == 1)
  {
    if (!__stlxr(0, (unsigned __int8 *)v6))
    {
      if (!v9)
        goto LABEL_18;
      return;
    }
  }
  else
  {
    __clrex();
  }
  WTF::Lock::unlockSlow((WTF::Lock *)v6);
  if (!v9)
LABEL_18:
    WTF::fastFree((WTF *)v6, v3);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 5) = 0;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end
