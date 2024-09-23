@implementation WebMediaSessionHelper

- (WebMediaSessionHelper)initWithCallback:(void *)a3
{
  void *v4;
  WebMediaSessionHelper *v5;
  uint64_t v6;
  ThreadSafeWeakPtrControlBlock *v8;
  int v9;
  ThreadSafeWeakPtrControlBlock *m_ptr;
  uint64_t v12;
  uint64_t v13;
  int v14;
  void *v15;
  PAL *v16;
  WTF::RunLoop *v17;
  uint64_t v18;
  _QWORD *v19;
  int v21;
  void *v22;
  _QWORD *v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)WebMediaSessionHelper;
  v5 = -[WebMediaSessionHelper init](&v24, sel_init);
  if (!v5)
    return v5;
  v6 = *((_QWORD *)a3 + 1);
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
  m_ptr = v5->_callback.m_controlBlock.m_ptr;
  v5->_callback.m_controlBlock.m_ptr = v8;
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
  v21 = __ldxr((unsigned __int8 *)m_ptr);
  if (v21 != 1)
  {
    __clrex();
    goto LABEL_38;
  }
  if (__stlxr(0, (unsigned __int8 *)m_ptr))
LABEL_38:
    WTF::Lock::unlockSlow((WTF::Lock *)m_ptr);
LABEL_27:
  v5->_callback.m_objectOfCorrectType = (MediaSessionHelperIOS *)a3;
  v15 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  objc_msgSend(v15, "addObserver:selector:name:object:", v5, sel_applicationWillEnterForeground_, PAL::get_UIKit_UIApplicationWillEnterForegroundNotification((PAL *)v15), 0);
  objc_msgSend(v15, "addObserver:selector:name:object:", v5, sel_applicationDidBecomeActive_, PAL::get_UIKit_UIApplicationDidBecomeActiveNotification((PAL *)objc_msgSend(v15, "addObserver:selector:name:object:", v5, sel_applicationWillEnterForeground_, WebUIApplicationWillEnterForegroundNotification, 0)), 0);
  objc_msgSend(v15, "addObserver:selector:name:object:", v5, sel_applicationWillResignActive_, PAL::get_UIKit_UIApplicationWillResignActiveNotification((PAL *)objc_msgSend(v15, "addObserver:selector:name:object:", v5, sel_applicationDidBecomeActive_, WebUIApplicationDidBecomeActiveNotification, 0)), 0);
  objc_msgSend(v15, "addObserver:selector:name:object:", v5, sel_applicationDidEnterBackground_, PAL::get_UIKit_UIApplicationDidEnterBackgroundNotification((PAL *)objc_msgSend(v15, "addObserver:selector:name:object:", v5, sel_applicationWillResignActive_, WebUIApplicationWillResignActiveNotification, 0)), 0);
  v16 = (PAL *)objc_msgSend(v15, "addObserver:selector:name:object:", v5, sel_activeOutputDeviceDidChange_, PAL::get_AVFoundation_AVAudioSessionRouteChangeNotification((PAL *)objc_msgSend(v15, "addObserver:selector:name:object:", v5, sel_applicationDidEnterBackground_, WebUIApplicationDidEnterBackgroundNotification, 0)), 0);
  v17 = (WTF::RunLoop *)objc_msgSend(v15, "addObserver:selector:name:object:", v5, sel_spatialPlaybackCapabilitiesChanged_, PAL::get_AVFoundation_AVAudioSessionSpatialPlaybackCapabilitiesChangedNotification(v16), 0);
  if (HIBYTE(word_1ECE81303) == 1)
  {
    if (word_1ECE81303 != 1)
      goto LABEL_31;
    v18 = qword_1ECE81320;
    goto LABEL_30;
  }
  if (byte_1ECE81302 == 1)
  {
    v22 = (void *)qword_1ECE81310;
  }
  else
  {
    v22 = dlopen("/System/Library/PrivateFrameworks/Celestial.framework/Celestial", 2);
    qword_1ECE81310 = (uint64_t)v22;
    byte_1ECE81302 = 1;
  }
  v17 = (WTF::RunLoop *)dlsym(v22, "AVSystemController_ServerConnectionDiedNotification");
  if (v17)
  {
    v18 = *(_QWORD *)v17;
    qword_1ECE81320 = *(_QWORD *)v17;
    word_1ECE81303 = 257;
LABEL_30:
    v17 = (WTF::RunLoop *)objc_msgSend(v15, "addObserver:selector:name:object:", v5, sel_mediaServerConnectionDied_, v18, 0);
    goto LABEL_31;
  }
  word_1ECE81303 = 256;
LABEL_31:
  WTF::RunLoop::main(v17);
  v19 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v19 = off_1E3207458;
  v23 = v19;
  WTF::RunLoop::dispatch();
  if (v23)
    (*(void (**)(_QWORD *))(*v23 + 8))(v23);
  return v5;
}

- (void)dealloc
{
  WTF::RunLoop *v3;
  void *m_ptr;
  _QWORD *v5;
  _QWORD *v6;
  objc_super v7;
  _QWORD *v8;

  v3 = (WTF::RunLoop *)pthread_main_np();
  if ((_DWORD)v3)
  {
    objc_msgSend(self->_routeDetector.m_ptr, "setRouteDetectionEnabled:", 0);
  }
  else
  {
    WTF::RunLoop::main(v3);
    m_ptr = self->_routeDetector.m_ptr;
    self->_routeDetector.m_ptr = 0;
    v5 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
    *v5 = &off_1E3207480;
    v5[1] = m_ptr;
    v8 = v5;
    WTF::RunLoop::dispatch();
    v6 = v8;
    v8 = 0;
    if (v6)
      (*(void (**)(_QWORD *))(*v6 + 8))(v6);
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self);
  v7.receiver = self;
  v7.super_class = (Class)WebMediaSessionHelper;
  -[WebMediaSessionHelper dealloc](&v7, sel_dealloc);
}

- (BOOL)hasWirelessTargetsAvailable
{
  return objc_msgSend(self->_routeDetector.m_ptr, "multipleRoutesDetected");
}

- (void)startMonitoringAirPlayRoutes
{
  void *m_ptr;

  if (!self->_monitoringAirPlayRoutes)
  {
    self->_monitoringAirPlayRoutes = 1;
    if (!self->_startMonitoringAirPlayRoutesPending)
    {
      m_ptr = self->_routeDetector.m_ptr;
      if (m_ptr)
      {
        objc_msgSend(m_ptr, "setRouteDetectionEnabled:", 1);
      }
      else
      {
        self->_startMonitoringAirPlayRoutesPending = 1;
        CFRetain(self);
        CFRetain(self);
        WTF::callOnWebThreadOrDispatchAsyncOnMainThread();
        CFRelease(self);
        if (self)
          CFRelease(self);
      }
    }
  }
}

PAL *__53__WebMediaSessionHelper_startMonitoringAirPlayRoutes__block_invoke(PAL *result)
{
  PAL *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  void *v7;
  uint64_t v8;
  const void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  int v18;
  uint64_t v19;

  v1 = result;
  v2 = *((_QWORD *)result + 4);
  v3 = *(_QWORD *)(v2 + 8);
  if (!v3)
    goto LABEL_33;
  v4 = *(_QWORD *)(v2 + 16);
  if (__ldaxr((unsigned __int8 *)v3))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)v3))
  {
    goto LABEL_6;
  }
  result = (PAL *)MEMORY[0x19AEA534C](v3);
LABEL_6:
  if (*(_QWORD *)(v3 + 24))
    ++*(_QWORD *)(v3 + 8);
  else
    v4 = 0;
  v6 = __ldxr((unsigned __int8 *)v3);
  if (v6 == 1)
  {
    if (!__stlxr(0, (unsigned __int8 *)v3))
    {
      if (!v4)
        goto LABEL_33;
      goto LABEL_15;
    }
  }
  else
  {
    __clrex();
  }
  result = (PAL *)WTF::Lock::unlockSlow((WTF::Lock *)v3);
  if (!v4)
    goto LABEL_33;
LABEL_15:
  v7 = (void *)objc_msgSend(objc_alloc((Class)PAL::getAVRouteDetectorClass[0](result)), "init");
  v8 = *((_QWORD *)v1 + 4);
  v9 = *(const void **)(v8 + 24);
  *(_QWORD *)(v8 + 24) = v7;
  if (v9)
  {
    CFRelease(v9);
    v8 = *((_QWORD *)v1 + 4);
    v7 = *(void **)(v8 + 24);
  }
  objc_msgSend(v7, "setRouteDetectionEnabled:", *(unsigned __int8 *)(v8 + 32));
  v10 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  objc_msgSend(v10, "addObserver:selector:name:object:", *((_QWORD *)v1 + 4), sel_wirelessRoutesAvailableDidChange_, PAL::get_AVFoundation_AVRouteDetectorMultipleRoutesDetectedDidChangeNotification((PAL *)v10), *(_QWORD *)(*((_QWORD *)v1 + 4) + 24));
  result = (PAL *)WebCore::MediaSessionHelper::externalOutputDeviceAvailableDidChange(v4, objc_msgSend(*(id *)(v4 + 56), "hasWirelessTargetsAvailable"));
  v12 = *(_QWORD *)(v4 + 8);
  if (__ldaxr((unsigned __int8 *)v12))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)v12))
  {
    goto LABEL_21;
  }
  result = (PAL *)MEMORY[0x19AEA534C](v12);
LABEL_21:
  v14 = *(_QWORD *)(v12 + 8);
  v15 = v14 - 1;
  *(_QWORD *)(v12 + 8) = v14 - 1;
  if (v14 == 1)
  {
    v19 = *(_QWORD *)(v12 + 16);
    v16 = *(_QWORD *)(v12 + 24);
    *(_QWORD *)(v12 + 24) = 0;
    v17 = v19 != 0;
  }
  else
  {
    v16 = 0;
    v17 = 1;
  }
  v18 = __ldxr((unsigned __int8 *)v12);
  if (v18 == 1)
  {
    if (!__stlxr(0, (unsigned __int8 *)v12))
    {
      if (v15)
        goto LABEL_33;
      goto LABEL_29;
    }
  }
  else
  {
    __clrex();
  }
  result = (PAL *)WTF::Lock::unlockSlow((WTF::Lock *)v12);
  if (v15)
    goto LABEL_33;
LABEL_29:
  if (v16)
    result = (PAL *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v16 + 8))(v16);
  if (!v17)
    result = (PAL *)WTF::fastFree((WTF *)v12, v11);
LABEL_33:
  *(_BYTE *)(*((_QWORD *)v1 + 4) + 33) = 0;
  return result;
}

- (void)stopMonitoringAirPlayRoutes
{
  if (self->_monitoringAirPlayRoutes)
  {
    self->_monitoringAirPlayRoutes = 0;
    objc_msgSend(self->_routeDetector.m_ptr, "setRouteDetectionEnabled:", 0);
  }
}

- (void)applicationWillEnterForeground:(id)a3
{
  WebMediaSessionHelper *cf;

  objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", CFSTR("isSuspendedUnderLock")), "BOOLValue");
  if (self)
  {
    CFRetain(self);
    cf = self;
    CFRetain(self);
  }
  else
  {
    cf = 0;
  }
  WTF::callOnWebThreadOrDispatchAsyncOnMainThread();
  if (self)
    CFRelease(self);
  if (cf)
    CFRelease(cf);
}

uint64_t __56__WebMediaSessionHelper_applicationWillEnterForeground___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  int v14;
  uint64_t v15;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(_QWORD *)(v1 + 8);
  if (!v2)
    return result;
  v3 = result;
  v4 = *(_QWORD *)(v1 + 16);
  if (__ldaxr((unsigned __int8 *)v2))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)v2))
  {
    goto LABEL_6;
  }
  result = MEMORY[0x19AEA534C](v2);
LABEL_6:
  if (*(_QWORD *)(v2 + 24))
    ++*(_QWORD *)(v2 + 8);
  else
    v4 = 0;
  v6 = __ldxr((unsigned __int8 *)v2);
  if (v6 == 1)
  {
    if (!__stlxr(0, (unsigned __int8 *)v2))
    {
      if (!v4)
        return result;
      goto LABEL_15;
    }
  }
  else
  {
    __clrex();
  }
  result = WTF::Lock::unlockSlow((WTF::Lock *)v2);
  if (!v4)
    return result;
LABEL_15:
  result = WebCore::MediaSessionHelper::applicationWillEnterForeground(v4, *(unsigned __int8 *)(v3 + 48));
  v8 = *(_QWORD *)(v4 + 8);
  if (__ldaxr((unsigned __int8 *)v8))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)v8))
  {
    goto LABEL_19;
  }
  result = MEMORY[0x19AEA534C](v8);
LABEL_19:
  v10 = *(_QWORD *)(v8 + 8);
  v11 = v10 - 1;
  *(_QWORD *)(v8 + 8) = v10 - 1;
  if (v10 == 1)
  {
    v15 = *(_QWORD *)(v8 + 16);
    v12 = *(_QWORD *)(v8 + 24);
    *(_QWORD *)(v8 + 24) = 0;
    v13 = v15 != 0;
  }
  else
  {
    v12 = 0;
    v13 = 1;
  }
  v14 = __ldxr((unsigned __int8 *)v8);
  if (v14 != 1)
  {
    __clrex();
LABEL_26:
    result = WTF::Lock::unlockSlow((WTF::Lock *)v8);
    if (v11)
      return result;
    goto LABEL_27;
  }
  if (__stlxr(0, (unsigned __int8 *)v8))
    goto LABEL_26;
  if (v11)
    return result;
LABEL_27:
  if (v12)
    result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v12 + 8))(v12);
  if (!v13)
    return WTF::fastFree((WTF *)v8, v7);
  return result;
}

- (void)applicationDidBecomeActive:(id)a3
{
  WebMediaSessionHelper *cf;

  if (self)
  {
    CFRetain(self);
    cf = self;
    CFRetain(self);
  }
  else
  {
    cf = 0;
  }
  WTF::callOnWebThreadOrDispatchAsyncOnMainThread();
  if (self)
    CFRelease(self);
  if (cf)
    CFRelease(cf);
}

uint64_t __52__WebMediaSessionHelper_applicationDidBecomeActive___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v5;
  void *v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  int v13;
  uint64_t v14;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(_QWORD *)(v1 + 8);
  if (!v2)
    return result;
  v3 = *(_QWORD *)(v1 + 16);
  if (__ldaxr((unsigned __int8 *)v2))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)v2))
  {
    goto LABEL_6;
  }
  result = MEMORY[0x19AEA534C](v2);
LABEL_6:
  if (*(_QWORD *)(v2 + 24))
    ++*(_QWORD *)(v2 + 8);
  else
    v3 = 0;
  v5 = __ldxr((unsigned __int8 *)v2);
  if (v5 == 1)
  {
    if (!__stlxr(0, (unsigned __int8 *)v2))
    {
      if (!v3)
        return result;
      goto LABEL_15;
    }
  }
  else
  {
    __clrex();
  }
  result = WTF::Lock::unlockSlow((WTF::Lock *)v2);
  if (!v3)
    return result;
LABEL_15:
  result = WebCore::MediaSessionHelper::applicationDidBecomeActive(v3);
  v7 = *(_QWORD *)(v3 + 8);
  if (__ldaxr((unsigned __int8 *)v7))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)v7))
  {
    goto LABEL_19;
  }
  result = MEMORY[0x19AEA534C](v7);
LABEL_19:
  v9 = *(_QWORD *)(v7 + 8);
  v10 = v9 - 1;
  *(_QWORD *)(v7 + 8) = v9 - 1;
  if (v9 == 1)
  {
    v14 = *(_QWORD *)(v7 + 16);
    v11 = *(_QWORD *)(v7 + 24);
    *(_QWORD *)(v7 + 24) = 0;
    v12 = v14 != 0;
  }
  else
  {
    v11 = 0;
    v12 = 1;
  }
  v13 = __ldxr((unsigned __int8 *)v7);
  if (v13 != 1)
  {
    __clrex();
LABEL_26:
    result = WTF::Lock::unlockSlow((WTF::Lock *)v7);
    if (v10)
      return result;
    goto LABEL_27;
  }
  if (__stlxr(0, (unsigned __int8 *)v7))
    goto LABEL_26;
  if (v10)
    return result;
LABEL_27:
  if (v11)
    result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v11 + 8))(v11);
  if (!v12)
    return WTF::fastFree((WTF *)v7, v6);
  return result;
}

- (void)applicationWillResignActive:(id)a3
{
  WebMediaSessionHelper *cf;

  if (self)
  {
    CFRetain(self);
    cf = self;
    CFRetain(self);
  }
  else
  {
    cf = 0;
  }
  WTF::callOnWebThreadOrDispatchAsyncOnMainThread();
  if (self)
    CFRelease(self);
  if (cf)
    CFRelease(cf);
}

uint64_t __53__WebMediaSessionHelper_applicationWillResignActive___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v5;
  void *v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  int v13;
  uint64_t v14;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(_QWORD *)(v1 + 8);
  if (!v2)
    return result;
  v3 = *(_QWORD *)(v1 + 16);
  if (__ldaxr((unsigned __int8 *)v2))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)v2))
  {
    goto LABEL_6;
  }
  result = MEMORY[0x19AEA534C](v2);
LABEL_6:
  if (*(_QWORD *)(v2 + 24))
    ++*(_QWORD *)(v2 + 8);
  else
    v3 = 0;
  v5 = __ldxr((unsigned __int8 *)v2);
  if (v5 == 1)
  {
    if (!__stlxr(0, (unsigned __int8 *)v2))
    {
      if (!v3)
        return result;
      goto LABEL_15;
    }
  }
  else
  {
    __clrex();
  }
  result = WTF::Lock::unlockSlow((WTF::Lock *)v2);
  if (!v3)
    return result;
LABEL_15:
  result = WebCore::MediaSessionHelper::applicationWillBecomeInactive(v3);
  v7 = *(_QWORD *)(v3 + 8);
  if (__ldaxr((unsigned __int8 *)v7))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)v7))
  {
    goto LABEL_19;
  }
  result = MEMORY[0x19AEA534C](v7);
LABEL_19:
  v9 = *(_QWORD *)(v7 + 8);
  v10 = v9 - 1;
  *(_QWORD *)(v7 + 8) = v9 - 1;
  if (v9 == 1)
  {
    v14 = *(_QWORD *)(v7 + 16);
    v11 = *(_QWORD *)(v7 + 24);
    *(_QWORD *)(v7 + 24) = 0;
    v12 = v14 != 0;
  }
  else
  {
    v11 = 0;
    v12 = 1;
  }
  v13 = __ldxr((unsigned __int8 *)v7);
  if (v13 != 1)
  {
    __clrex();
LABEL_26:
    result = WTF::Lock::unlockSlow((WTF::Lock *)v7);
    if (v10)
      return result;
    goto LABEL_27;
  }
  if (__stlxr(0, (unsigned __int8 *)v7))
    goto LABEL_26;
  if (v10)
    return result;
LABEL_27:
  if (v11)
    result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v11 + 8))(v11);
  if (!v12)
    return WTF::fastFree((WTF *)v7, v6);
  return result;
}

- (void)wirelessRoutesAvailableDidChange:(id)a3
{
  WebMediaSessionHelper *cf;

  if (self)
  {
    CFRetain(self);
    cf = self;
    CFRetain(self);
  }
  else
  {
    cf = 0;
  }
  WTF::callOnWebThreadOrDispatchAsyncOnMainThread();
  if (self)
    CFRelease(self);
  if (cf)
    CFRelease(cf);
}

uint64_t __58__WebMediaSessionHelper_wirelessRoutesAvailableDidChange___block_invoke(uint64_t result, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  int v14;
  uint64_t v15;

  v2 = *(_QWORD *)(result + 32);
  v3 = *(_QWORD *)(v2 + 8);
  if (!v3)
    return result;
  v4 = result;
  v5 = *(_QWORD *)(v2 + 16);
  if (__ldaxr((unsigned __int8 *)v3))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)v3))
  {
    goto LABEL_6;
  }
  result = MEMORY[0x19AEA534C](v3);
LABEL_6:
  if (*(_QWORD *)(v3 + 24))
    ++*(_QWORD *)(v3 + 8);
  else
    v5 = 0;
  v7 = __ldxr((unsigned __int8 *)v3);
  if (v7 == 1)
  {
    if (!__stlxr(0, (unsigned __int8 *)v3))
    {
      if (!v5)
        return result;
      goto LABEL_15;
    }
  }
  else
  {
    __clrex();
  }
  result = WTF::Lock::unlockSlow((WTF::Lock *)v3);
  if (!v5)
    return result;
LABEL_15:
  if (*(_BYTE *)(*(_QWORD *)(v4 + 32) + 32))
    result = WebCore::MediaSessionHelper::externalOutputDeviceAvailableDidChange(v5, objc_msgSend(*(id *)(v5 + 56), "hasWirelessTargetsAvailable"));
  v8 = *(_QWORD *)(v5 + 8);
  if (__ldaxr((unsigned __int8 *)v8))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)v8))
  {
    goto LABEL_21;
  }
  result = MEMORY[0x19AEA534C](v8);
LABEL_21:
  v10 = *(_QWORD *)(v8 + 8);
  v11 = v10 - 1;
  *(_QWORD *)(v8 + 8) = v10 - 1;
  if (v10 == 1)
  {
    v15 = *(_QWORD *)(v8 + 16);
    v12 = *(_QWORD *)(v8 + 24);
    *(_QWORD *)(v8 + 24) = 0;
    v13 = v15 != 0;
  }
  else
  {
    v12 = 0;
    v13 = 1;
  }
  v14 = __ldxr((unsigned __int8 *)v8);
  if (v14 != 1)
  {
    __clrex();
LABEL_28:
    result = WTF::Lock::unlockSlow((WTF::Lock *)v8);
    if (v11)
      return result;
    goto LABEL_29;
  }
  if (__stlxr(0, (unsigned __int8 *)v8))
    goto LABEL_28;
  if (v11)
    return result;
LABEL_29:
  if (v12)
    result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v12 + 8))(v12);
  if (!v13)
    return WTF::fastFree((WTF *)v8, a2);
  return result;
}

- (void)applicationDidEnterBackground:(id)a3
{
  WebMediaSessionHelper *cf;

  objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "userInfo"), "objectForKey:", CFSTR("isSuspendedUnderLock")), "BOOLValue");
  if (self)
  {
    CFRetain(self);
    cf = self;
    CFRetain(self);
  }
  else
  {
    cf = 0;
  }
  WTF::callOnWebThreadOrDispatchAsyncOnMainThread();
  if (self)
    CFRelease(self);
  if (cf)
    CFRelease(cf);
}

uint64_t __55__WebMediaSessionHelper_applicationDidEnterBackground___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  int v14;
  uint64_t v15;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(_QWORD *)(v1 + 8);
  if (!v2)
    return result;
  v3 = result;
  v4 = *(_QWORD *)(v1 + 16);
  if (__ldaxr((unsigned __int8 *)v2))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)v2))
  {
    goto LABEL_6;
  }
  result = MEMORY[0x19AEA534C](v2);
LABEL_6:
  if (*(_QWORD *)(v2 + 24))
    ++*(_QWORD *)(v2 + 8);
  else
    v4 = 0;
  v6 = __ldxr((unsigned __int8 *)v2);
  if (v6 == 1)
  {
    if (!__stlxr(0, (unsigned __int8 *)v2))
    {
      if (!v4)
        return result;
      goto LABEL_15;
    }
  }
  else
  {
    __clrex();
  }
  result = WTF::Lock::unlockSlow((WTF::Lock *)v2);
  if (!v4)
    return result;
LABEL_15:
  result = WebCore::MediaSessionHelper::applicationDidEnterBackground(v4, *(unsigned __int8 *)(v3 + 48));
  v8 = *(_QWORD *)(v4 + 8);
  if (__ldaxr((unsigned __int8 *)v8))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)v8))
  {
    goto LABEL_19;
  }
  result = MEMORY[0x19AEA534C](v8);
LABEL_19:
  v10 = *(_QWORD *)(v8 + 8);
  v11 = v10 - 1;
  *(_QWORD *)(v8 + 8) = v10 - 1;
  if (v10 == 1)
  {
    v15 = *(_QWORD *)(v8 + 16);
    v12 = *(_QWORD *)(v8 + 24);
    *(_QWORD *)(v8 + 24) = 0;
    v13 = v15 != 0;
  }
  else
  {
    v12 = 0;
    v13 = 1;
  }
  v14 = __ldxr((unsigned __int8 *)v8);
  if (v14 != 1)
  {
    __clrex();
LABEL_26:
    result = WTF::Lock::unlockSlow((WTF::Lock *)v8);
    if (v11)
      return result;
    goto LABEL_27;
  }
  if (__stlxr(0, (unsigned __int8 *)v8))
    goto LABEL_26;
  if (v11)
    return result;
LABEL_27:
  if (v12)
    result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v12 + 8))(v12);
  if (!v13)
    return WTF::fastFree((WTF *)v8, v7);
  return result;
}

- (void)mediaServerConnectionDied:(id)a3
{
  WebMediaSessionHelper *cf;

  if (self)
  {
    CFRetain(self);
    cf = self;
    CFRetain(self);
  }
  else
  {
    cf = 0;
  }
  WTF::callOnWebThreadOrDispatchAsyncOnMainThread();
  if (self)
    CFRelease(self);
  if (cf)
    CFRelease(cf);
}

uint64_t __51__WebMediaSessionHelper_mediaServerConnectionDied___block_invoke(uint64_t result, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  int v15;
  uint64_t v16;
  _QWORD *v17;

  v2 = *(_QWORD *)(result + 32);
  v3 = *(_QWORD *)(v2 + 8);
  if (!v3)
    return result;
  v4 = *(_QWORD *)(v2 + 16);
  if (__ldaxr((unsigned __int8 *)v3))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)v3))
  {
    goto LABEL_6;
  }
  result = MEMORY[0x19AEA534C](v3);
LABEL_6:
  if (*(_QWORD *)(v3 + 24))
    ++*(_QWORD *)(v3 + 8);
  else
    v4 = 0;
  v6 = __ldxr((unsigned __int8 *)v3);
  if (v6 == 1)
  {
    if (!__stlxr(0, (unsigned __int8 *)v3))
    {
      if (!v4)
        return result;
      goto LABEL_15;
    }
  }
  else
  {
    __clrex();
  }
  result = WTF::Lock::unlockSlow((WTF::Lock *)v3);
  if (!v4)
    return result;
LABEL_15:
  if (*(_BYTE *)(v4 + 68))
  {
    v7 = *(_QWORD *)(v4 + 64);
    *(_BYTE *)(v4 + 64) = 0;
    *(_BYTE *)(v4 + 68) = 0;
    v8 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
    *v8 = off_1E3207430;
    v8[1] = v7 & 0xFFFFFFFFFFLL;
    v17 = v8;
    WTF::callOnMainRunLoop();
    result = (uint64_t)v17;
    if (v17)
      result = (*(uint64_t (**)(_QWORD *))(*v17 + 8))(v17);
  }
  v9 = *(_QWORD *)(v4 + 8);
  if (__ldaxr((unsigned __int8 *)v9))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)v9))
  {
    goto LABEL_22;
  }
  result = MEMORY[0x19AEA534C](v9);
LABEL_22:
  v11 = *(_QWORD *)(v9 + 8);
  v12 = v11 - 1;
  *(_QWORD *)(v9 + 8) = v11 - 1;
  if (v11 == 1)
  {
    v16 = *(_QWORD *)(v9 + 16);
    v13 = *(_QWORD *)(v9 + 24);
    *(_QWORD *)(v9 + 24) = 0;
    v14 = v16 != 0;
  }
  else
  {
    v13 = 0;
    v14 = 1;
  }
  v15 = __ldxr((unsigned __int8 *)v9);
  if (v15 != 1)
  {
    __clrex();
LABEL_29:
    result = WTF::Lock::unlockSlow((WTF::Lock *)v9);
    if (v12)
      return result;
    goto LABEL_30;
  }
  if (__stlxr(0, (unsigned __int8 *)v9))
    goto LABEL_29;
  if (v12)
    return result;
LABEL_30:
  if (v13)
    result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v13 + 8))(v13);
  if (!v14)
    return WTF::fastFree((WTF *)v9, a2);
  return result;
}

- (void)activeOutputDeviceDidChange:(id)a3
{
  void *v4;
  WebMediaSessionHelper *cf;

  v4 = (void *)objc_msgSend(a3, "userInfo");
  objc_msgSend((id)objc_msgSend(v4, "objectForKey:", PAL::get_AVFoundation_AVAudioSessionRouteChangeReasonKey((PAL *)v4)), "unsignedIntegerValue");
  if (self)
  {
    CFRetain(self);
    cf = self;
    CFRetain(self);
  }
  else
  {
    cf = 0;
  }
  WTF::callOnWebThreadOrDispatchAsyncOnMainThread();
  if (self)
    CFRelease(self);
  if (cf)
    CFRelease(cf);
}

_DWORD *__53__WebMediaSessionHelper_activeOutputDeviceDidChange___block_invoke(_DWORD *result)
{
  uint64_t v1;
  uint64_t v2;
  _DWORD *v3;
  uint64_t v4;
  int v6;
  WebCore::MediaPlaybackTargetCocoa *v7;
  _DWORD *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  int v18;
  uint64_t v19;
  _DWORD *v20;
  _DWORD *v21;

  v1 = *((_QWORD *)result + 4);
  v2 = *(_QWORD *)(v1 + 8);
  if (!v2)
    return result;
  v3 = result;
  v4 = *(_QWORD *)(v1 + 16);
  if (__ldaxr((unsigned __int8 *)v2))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)v2))
  {
    goto LABEL_6;
  }
  result = (_DWORD *)MEMORY[0x19AEA534C](v2);
LABEL_6:
  if (*(_QWORD *)(v2 + 24))
    ++*(_QWORD *)(v2 + 8);
  else
    v4 = 0;
  v6 = __ldxr((unsigned __int8 *)v2);
  if (v6 == 1)
  {
    if (!__stlxr(0, (unsigned __int8 *)v2))
    {
      if (!v4)
        return result;
      goto LABEL_15;
    }
  }
  else
  {
    __clrex();
  }
  result = (_DWORD *)WTF::Lock::unlockSlow((WTF::Lock *)v2);
  if (!v4)
    return result;
LABEL_15:
  MediaSessionHelperIOS::updateCarPlayIsConnected((MediaSessionHelperIOS *)v4);
  v7 = (WebCore::MediaPlaybackTargetCocoa *)WebCore::MediaSessionHelper::activeAudioRouteDidChange(v4, *((unsigned __int8 *)v3 + 48));
  WebCore::MediaPlaybackTargetCocoa::create(v7, (uint64_t *)&v21);
  v8 = v21;
  v9 = (*(uint64_t (**)(_DWORD *))(*(_QWORD *)v21 + 24))(v21);
  v10 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v9 + 32))(v9);
  v20 = v8;
  WebCore::MediaSessionHelper::activeVideoRouteDidChange(v4, v10, (uint64_t *)&v20);
  result = v20;
  if (v20)
  {
    if (v20[2] == 1)
      result = (_DWORD *)(*(uint64_t (**)(void))(*(_QWORD *)v20 + 8))();
    else
      --v20[2];
  }
  v12 = *(_QWORD *)(v4 + 8);
  if (__ldaxr((unsigned __int8 *)v12))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)v12))
  {
    goto LABEL_22;
  }
  result = (_DWORD *)MEMORY[0x19AEA534C](v12);
LABEL_22:
  v14 = *(_QWORD *)(v12 + 8);
  v15 = v14 - 1;
  *(_QWORD *)(v12 + 8) = v14 - 1;
  if (v14 == 1)
  {
    v19 = *(_QWORD *)(v12 + 16);
    v16 = *(_QWORD *)(v12 + 24);
    *(_QWORD *)(v12 + 24) = 0;
    v17 = v19 != 0;
  }
  else
  {
    v16 = 0;
    v17 = 1;
  }
  v18 = __ldxr((unsigned __int8 *)v12);
  if (v18 != 1)
  {
    __clrex();
LABEL_29:
    result = (_DWORD *)WTF::Lock::unlockSlow((WTF::Lock *)v12);
    if (v15)
      return result;
    goto LABEL_30;
  }
  if (__stlxr(0, (unsigned __int8 *)v12))
    goto LABEL_29;
  if (v15)
    return result;
LABEL_30:
  if (v16)
    result = (_DWORD *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v16 + 8))(v16);
  if (!v17)
    return (_DWORD *)WTF::fastFree((WTF *)v12, v11);
  return result;
}

- (void)spatialPlaybackCapabilitiesChanged:(id)a3
{
  WebMediaSessionHelper *cf;

  if (self)
  {
    CFRetain(self);
    cf = self;
    CFRetain(self);
  }
  else
  {
    cf = 0;
  }
  WTF::callOnWebThreadOrDispatchAsyncOnMainThread();
  if (self)
    CFRelease(self);
  if (cf)
    CFRelease(cf);
}

uint64_t __60__WebMediaSessionHelper_spatialPlaybackCapabilitiesChanged___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  WebCore::MediaSessionHelper *v3;
  int v5;
  void *v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  int v13;
  uint64_t v14;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(_QWORD *)(v1 + 8);
  if (!v2)
    return result;
  v3 = *(WebCore::MediaSessionHelper **)(v1 + 16);
  if (__ldaxr((unsigned __int8 *)v2))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)v2))
  {
    goto LABEL_6;
  }
  result = MEMORY[0x19AEA534C](v2);
LABEL_6:
  if (*(_QWORD *)(v2 + 24))
    ++*(_QWORD *)(v2 + 8);
  else
    v3 = 0;
  v5 = __ldxr((unsigned __int8 *)v2);
  if (v5 == 1)
  {
    if (!__stlxr(0, (unsigned __int8 *)v2))
    {
      if (!v3)
        return result;
      goto LABEL_15;
    }
  }
  else
  {
    __clrex();
  }
  result = WTF::Lock::unlockSlow((WTF::Lock *)v2);
  if (!v3)
    return result;
LABEL_15:
  result = WebCore::MediaSessionHelper::updateActiveAudioRouteSupportsSpatialPlayback(v3);
  v7 = *((_QWORD *)v3 + 1);
  if (__ldaxr((unsigned __int8 *)v7))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)v7))
  {
    goto LABEL_19;
  }
  result = MEMORY[0x19AEA534C](v7);
LABEL_19:
  v9 = *(_QWORD *)(v7 + 8);
  v10 = v9 - 1;
  *(_QWORD *)(v7 + 8) = v9 - 1;
  if (v9 == 1)
  {
    v14 = *(_QWORD *)(v7 + 16);
    v11 = *(_QWORD *)(v7 + 24);
    *(_QWORD *)(v7 + 24) = 0;
    v12 = v14 != 0;
  }
  else
  {
    v11 = 0;
    v12 = 1;
  }
  v13 = __ldxr((unsigned __int8 *)v7);
  if (v13 != 1)
  {
    __clrex();
LABEL_26:
    result = WTF::Lock::unlockSlow((WTF::Lock *)v7);
    if (v10)
      return result;
    goto LABEL_27;
  }
  if (__stlxr(0, (unsigned __int8 *)v7))
    goto LABEL_26;
  if (v10)
    return result;
LABEL_27:
  if (v11)
    result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v11 + 8))(v11);
  if (!v12)
    return WTF::fastFree((WTF *)v7, v6);
  return result;
}

- (void).cxx_destruct
{
  void *m_ptr;
  ThreadSafeWeakPtrControlBlock *v4;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;

  m_ptr = self->_routeDetector.m_ptr;
  self->_routeDetector.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v4 = self->_callback.m_controlBlock.m_ptr;
  self->_callback.m_controlBlock.m_ptr = 0;
  if (!v4)
    return;
  if (__ldaxr((unsigned __int8 *)v4))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)v4))
  {
    goto LABEL_8;
  }
  MEMORY[0x19AEA534C](v4, a2);
LABEL_8:
  v6 = *((_QWORD *)v4 + 2) - 1;
  *((_QWORD *)v4 + 2) = v6;
  if (v6)
  {
    v9 = __ldxr((unsigned __int8 *)v4);
    if (v9 == 1)
    {
      if (!__stlxr(0, (unsigned __int8 *)v4))
        return;
    }
    else
    {
      __clrex();
    }
    WTF::Lock::unlockSlow((WTF::Lock *)v4);
    return;
  }
  v7 = *((_QWORD *)v4 + 1);
  v8 = __ldxr((unsigned __int8 *)v4);
  if (v8 == 1)
  {
    if (!__stlxr(0, (unsigned __int8 *)v4))
    {
      if (!v7)
        goto LABEL_16;
      return;
    }
  }
  else
  {
    __clrex();
  }
  WTF::Lock::unlockSlow((WTF::Lock *)v4);
  if (!v7)
LABEL_16:
    WTF::fastFree((WTF *)v4, (void *)a2);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

- (uint64_t)initWithCallback:(PAL *)a1
{
  return objc_msgSend((id)objc_msgSend((id)PAL::getUIApplicationClass(a1), "sharedApplication"), "beginReceivingRemoteControlEvents");
}

- (_QWORD)dealloc
{
  const void *v2;

  v2 = (const void *)a1[1];
  *a1 = &off_1E3207480;
  a1[1] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

- (uint64_t)dealloc
{
  return objc_msgSend(*(id *)(a1 + 8), "setRouteDetectionEnabled:", 0);
}

@end
