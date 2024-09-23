@implementation WebAVPlayerViewControllerDelegate

- (RefPtr<WebCore::VideoPresentationInterfaceAVKit,)fullscreenInterface
{
  VideoPresentationInterfaceAVKit **v2;
  VideoPresentationInterfaceAVKit **v3;
  ThreadSafeWeakPtrControlBlock *m_ptr;
  VideoPresentationInterfaceAVKit *m_objectOfCorrectType;
  int v7;

  v3 = v2;
  m_ptr = self->_fullscreenInterface.m_controlBlock.m_ptr;
  if (!m_ptr)
  {
    *v2 = 0;
    return (RefPtr<WebCore::VideoPresentationInterfaceAVKit, WTF::RawPtrTraits<WebCore::VideoPresentationInterfaceAVKit>, WTF::DefaultRefDerefTraits<WebCore::VideoPresentationInterfaceAVKit>>)self;
  }
  m_objectOfCorrectType = self->_fullscreenInterface.m_objectOfCorrectType;
  if (__ldaxr((unsigned __int8 *)m_ptr))
  {
    __clrex();
LABEL_6:
    self = (WebAVPlayerViewControllerDelegate *)MEMORY[0x19AEA534C](m_ptr, a2);
    goto LABEL_7;
  }
  if (__stxr(1u, (unsigned __int8 *)m_ptr))
    goto LABEL_6;
LABEL_7:
  if (*((_QWORD *)m_ptr + 3))
    ++*((_QWORD *)m_ptr + 1);
  else
    m_objectOfCorrectType = 0;
  *v3 = m_objectOfCorrectType;
  v7 = __ldxr((unsigned __int8 *)m_ptr);
  if (v7 == 1)
  {
    if (!__stlxr(0, (unsigned __int8 *)m_ptr))
      return (RefPtr<WebCore::VideoPresentationInterfaceAVKit, WTF::RawPtrTraits<WebCore::VideoPresentationInterfaceAVKit>, WTF::DefaultRefDerefTraits<WebCore::VideoPresentationInterfaceAVKit>>)self;
  }
  else
  {
    __clrex();
  }
  return (RefPtr<WebCore::VideoPresentationInterfaceAVKit, WTF::RawPtrTraits<WebCore::VideoPresentationInterfaceAVKit>, WTF::DefaultRefDerefTraits<WebCore::VideoPresentationInterfaceAVKit>>)WTF::Lock::unlockSlow((WTF::Lock *)m_ptr);
}

- (void)setFullscreenInterface:()RefPtr<WebCore:()WTF:(WTF::DefaultRefDerefTraits<WebCore::VideoPresentationInterfaceAVKit>>)a3 :RawPtrTraits<WebCore::VideoPresentationInterfaceAVKit> :VideoPresentationInterfaceAVKit
{
  uint64_t v4;
  uint64_t v5;
  ThreadSafeWeakPtrControlBlock *m_ptr;
  ThreadSafeWeakPtrControlBlock *v8;
  int v9;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;

  v4 = *(_QWORD *)a3.var0;
  if (!*(_QWORD *)a3.var0)
  {
    m_ptr = self->_fullscreenInterface.m_controlBlock.m_ptr;
    self->_fullscreenInterface.m_controlBlock.m_ptr = 0;
    if (!m_ptr)
      goto LABEL_29;
    goto LABEL_17;
  }
  v5 = *(_QWORD *)(v4 + 64);
  if (!v5)
  {
    v8 = 0;
    goto LABEL_16;
  }
  if (__ldaxr((unsigned __int8 *)v5))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)v5))
  {
    goto LABEL_9;
  }
  MEMORY[0x19AEA534C](v5, a2);
LABEL_9:
  if (*(_QWORD *)(v5 + 24))
  {
    ++*(_QWORD *)(v5 + 16);
    v8 = (ThreadSafeWeakPtrControlBlock *)v5;
  }
  else
  {
    v8 = 0;
  }
  v9 = __ldxr((unsigned __int8 *)v5);
  if (v9 != 1)
  {
    __clrex();
    goto LABEL_15;
  }
  if (__stlxr(0, (unsigned __int8 *)v5))
LABEL_15:
    WTF::Lock::unlockSlow((WTF::Lock *)v5);
LABEL_16:
  m_ptr = self->_fullscreenInterface.m_controlBlock.m_ptr;
  self->_fullscreenInterface.m_controlBlock.m_ptr = v8;
  if (!m_ptr)
    goto LABEL_29;
LABEL_17:
  if (__ldaxr((unsigned __int8 *)m_ptr))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)m_ptr))
  {
    goto LABEL_21;
  }
  MEMORY[0x19AEA534C](m_ptr, a2);
LABEL_21:
  v11 = *((_QWORD *)m_ptr + 2) - 1;
  *((_QWORD *)m_ptr + 2) = v11;
  if (v11)
  {
    v14 = __ldxr((unsigned __int8 *)m_ptr);
    if (v14 == 1)
    {
      if (!__stlxr(0, (unsigned __int8 *)m_ptr))
        goto LABEL_29;
    }
    else
    {
      __clrex();
    }
    WTF::Lock::unlockSlow((WTF::Lock *)m_ptr);
    goto LABEL_29;
  }
  v12 = *((_QWORD *)m_ptr + 1);
  v13 = __ldxr((unsigned __int8 *)m_ptr);
  if (v13 == 1)
  {
    if (!__stlxr(0, (unsigned __int8 *)m_ptr))
    {
      if (!v12)
        goto LABEL_28;
      goto LABEL_29;
    }
  }
  else
  {
    __clrex();
  }
  WTF::Lock::unlockSlow((WTF::Lock *)m_ptr);
  if (!v12)
LABEL_28:
    WTF::fastFree((WTF *)m_ptr, (void *)a2);
LABEL_29:
  self->_fullscreenInterface.m_objectOfCorrectType = (VideoPresentationInterfaceAVKit *)v4;
}

- (void)playerViewControllerWillStartPictureInPicture:(id)a3
{
  WebCore::VideoPresentationInterfaceIOS *v3;

  if (self)
  {
    -[WebAVPlayerViewControllerDelegate fullscreenInterface](self, "fullscreenInterface", a3);
    if (v3)
    {
      WebCore::VideoPresentationInterfaceIOS::willStartPictureInPicture((uint64_t)v3);
      WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::VideoPresentationInterfaceIOS,(WTF::DestructionThread)2>(*((unsigned __int8 **)v3 + 8));
    }
  }
}

- (void)playerViewControllerDidStartPictureInPicture:(id)a3
{
  unsigned __int8 **v3;

  if (self)
  {
    -[WebAVPlayerViewControllerDelegate fullscreenInterface](self, "fullscreenInterface", a3);
    if (v3)
    {
      WebCore::VideoPresentationInterfaceIOS::didStartPictureInPicture((WebCore::VideoPresentationInterfaceIOS *)v3);
      WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::VideoPresentationInterfaceIOS,(WTF::DestructionThread)2>(v3[8]);
    }
  }
}

- (void)playerViewController:(id)a3 failedToStartPictureInPictureWithError:(id)a4
{
  unsigned __int8 **v4;

  if (self)
  {
    -[WebAVPlayerViewControllerDelegate fullscreenInterface](self, "fullscreenInterface", a3, a4);
    if (v4)
    {
      WebCore::VideoPresentationInterfaceIOS::failedToStartPictureInPicture((WebCore::VideoPresentationInterfaceIOS *)v4);
      WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::VideoPresentationInterfaceIOS,(WTF::DestructionThread)2>(v4[8]);
    }
  }
}

- (void)playerViewControllerWillStopPictureInPicture:(id)a3
{
  WebCore::VideoPresentationInterfaceIOS *v3;

  if (self)
  {
    -[WebAVPlayerViewControllerDelegate fullscreenInterface](self, "fullscreenInterface", a3);
    if (v3)
    {
      WebCore::VideoPresentationInterfaceIOS::willStopPictureInPicture((uint64_t)v3);
      WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::VideoPresentationInterfaceIOS,(WTF::DestructionThread)2>(*((unsigned __int8 **)v3 + 8));
    }
  }
}

- (void)playerViewControllerDidStopPictureInPicture:(id)a3
{
  unsigned __int8 **v3;

  if (self)
  {
    -[WebAVPlayerViewControllerDelegate fullscreenInterface](self, "fullscreenInterface", a3);
    if (v3)
    {
      WebCore::VideoPresentationInterfaceIOS::didStopPictureInPicture((WebCore::VideoPresentationInterfaceIOS *)v3);
      WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::VideoPresentationInterfaceIOS,(WTF::DestructionThread)2>(v3[8]);
    }
  }
}

- (BOOL)playerViewControllerShouldAutomaticallyDismissAtPictureInPictureStart:(id)a3
{
  return 0;
}

- (BOOL)playerViewController:(id)a3 shouldExitFullScreenWithReason:(int64_t)a4
{
  unint64_t v5;
  char shouldExitFullscreenWithReason;
  uint64_t v8;

  if (!self)
    return 1;
  -[WebAVPlayerViewControllerDelegate fullscreenInterface](self, "fullscreenInterface", a3);
  if (!v8)
    return 1;
  if ((unint64_t)(a4 - 1) < 4)
    v5 = a4;
  else
    v5 = 0;
  shouldExitFullscreenWithReason = WebCore::VideoPresentationInterfaceIOS::shouldExitFullscreenWithReason(v8, (void *)v5);
  WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::VideoPresentationInterfaceIOS,(WTF::DestructionThread)2>(*(unsigned __int8 **)(v8 + 64));
  return shouldExitFullscreenWithReason;
}

- (void)playerViewController:(id)a3 restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:(id)a4
{
  uint64_t v5;

  if (self)
  {
    -[WebAVPlayerViewControllerDelegate fullscreenInterface](self, "fullscreenInterface", a3);
    if (v5)
    {
      WebCore::VideoPresentationInterfaceIOS::prepareForPictureInPictureStopWithCompletionHandler(v5, a4);
      WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::VideoPresentationInterfaceIOS,(WTF::DestructionThread)2>(*(unsigned __int8 **)(v5 + 64));
    }
  }
}

- (BOOL)playerViewControllerShouldStartPictureInPictureFromInlineWhenEnteringBackground:(id)a3
{
  return 1;
}

- (void).cxx_destruct
{
  ThreadSafeWeakPtrControlBlock *m_ptr;
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;

  m_ptr = self->_fullscreenInterface.m_controlBlock.m_ptr;
  self->_fullscreenInterface.m_controlBlock.m_ptr = 0;
  if (!m_ptr)
    return;
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
  v4 = *((_QWORD *)m_ptr + 2) - 1;
  *((_QWORD *)m_ptr + 2) = v4;
  if (v4)
  {
    v7 = __ldxr((unsigned __int8 *)m_ptr);
    if (v7 == 1)
    {
      if (!__stlxr(0, (unsigned __int8 *)m_ptr))
        return;
    }
    else
    {
      __clrex();
    }
    WTF::Lock::unlockSlow((WTF::Lock *)m_ptr);
    return;
  }
  v5 = *((_QWORD *)m_ptr + 1);
  v6 = __ldxr((unsigned __int8 *)m_ptr);
  if (v6 == 1)
  {
    if (!__stlxr(0, (unsigned __int8 *)m_ptr))
    {
      if (!v5)
        goto LABEL_14;
      return;
    }
  }
  else
  {
    __clrex();
  }
  WTF::Lock::unlockSlow((WTF::Lock *)m_ptr);
  if (!v5)
LABEL_14:
    WTF::fastFree((WTF *)m_ptr, (void *)a2);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
