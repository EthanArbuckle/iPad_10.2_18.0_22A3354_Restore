@implementation WebCoreAVVideoCaptureSourceObserver

- (WebCoreAVVideoCaptureSourceObserver)initWithCaptureSource:(void *)a3
{
  void *v4;
  WebCoreAVVideoCaptureSourceObserver *v5;
  uint64_t v6;
  ThreadSafeWeakPtrControlBlock *v8;
  int v9;
  ThreadSafeWeakPtrControlBlock *m_ptr;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)WebCoreAVVideoCaptureSourceObserver;
  v5 = -[WebCoreAVVideoCaptureSourceObserver init](&v17, sel_init);
  if (v5)
  {
    if (!a3)
    {
      v8 = 0;
      goto LABEL_15;
    }
    v6 = *((_QWORD *)a3 + 38);
    if (__ldaxr((unsigned __int8 *)v6))
    {
      __clrex();
    }
    else if (!__stxr(1u, (unsigned __int8 *)v6))
    {
      goto LABEL_8;
    }
    MEMORY[0x19AEA534C](v6);
LABEL_8:
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
    if (v9 == 1)
    {
      if (!__stlxr(0, (unsigned __int8 *)v6))
      {
LABEL_15:
        m_ptr = v5->m_captureSource.m_controlBlock.m_ptr;
        v5->m_captureSource.m_controlBlock.m_ptr = v8;
        if (!m_ptr)
          goto LABEL_28;
        if (__ldaxr((unsigned __int8 *)m_ptr))
        {
          __clrex();
        }
        else if (!__stxr(1u, (unsigned __int8 *)m_ptr))
        {
          goto LABEL_20;
        }
        MEMORY[0x19AEA534C](m_ptr);
LABEL_20:
        v12 = *((_QWORD *)m_ptr + 2) - 1;
        *((_QWORD *)m_ptr + 2) = v12;
        if (v12)
        {
          v16 = __ldxr((unsigned __int8 *)m_ptr);
          if (v16 == 1)
          {
            if (!__stlxr(0, (unsigned __int8 *)m_ptr))
              goto LABEL_28;
          }
          else
          {
            __clrex();
          }
          WTF::Lock::unlockSlow((WTF::Lock *)m_ptr);
          goto LABEL_28;
        }
        v13 = *((_QWORD *)m_ptr + 1);
        v14 = __ldxr((unsigned __int8 *)m_ptr);
        if (v14 == 1)
        {
          if (!__stlxr(0, (unsigned __int8 *)m_ptr))
          {
            if (!v13)
              goto LABEL_27;
            goto LABEL_28;
          }
        }
        else
        {
          __clrex();
        }
        WTF::Lock::unlockSlow((WTF::Lock *)m_ptr);
        if (!v13)
LABEL_27:
          WTF::fastFree((WTF *)m_ptr, v4);
LABEL_28:
        v5->m_captureSource.m_objectOfCorrectType = (AVVideoCaptureSource *)a3;
        return v5;
      }
    }
    else
    {
      __clrex();
    }
    WTF::Lock::unlockSlow((WTF::Lock *)v6);
    goto LABEL_15;
  }
  return v5;
}

- (void)disconnect
{
  void *v3;
  ThreadSafeWeakPtrControlBlock *m_ptr;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:", self);
  -[WebCoreAVVideoCaptureSourceObserver removeNotificationObservers](self, "removeNotificationObservers");
  m_ptr = self->m_captureSource.m_controlBlock.m_ptr;
  self->m_captureSource.m_controlBlock.m_ptr = 0;
  if (!m_ptr)
    goto LABEL_14;
  if (__ldaxr((unsigned __int8 *)m_ptr))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)m_ptr))
  {
    goto LABEL_6;
  }
  MEMORY[0x19AEA534C](m_ptr);
LABEL_6:
  v6 = *((_QWORD *)m_ptr + 2) - 1;
  *((_QWORD *)m_ptr + 2) = v6;
  if (v6)
  {
    v9 = __ldxr((unsigned __int8 *)m_ptr);
    if (v9 == 1)
    {
      if (!__stlxr(0, (unsigned __int8 *)m_ptr))
        goto LABEL_14;
    }
    else
    {
      __clrex();
    }
    WTF::Lock::unlockSlow((WTF::Lock *)m_ptr);
    goto LABEL_14;
  }
  v7 = *((_QWORD *)m_ptr + 1);
  v8 = __ldxr((unsigned __int8 *)m_ptr);
  if (v8 == 1)
  {
    if (!__stlxr(0, (unsigned __int8 *)m_ptr))
    {
      if (!v7)
        goto LABEL_13;
      goto LABEL_14;
    }
  }
  else
  {
    __clrex();
  }
  WTF::Lock::unlockSlow((WTF::Lock *)m_ptr);
  if (!v7)
LABEL_13:
    WTF::fastFree((WTF *)m_ptr, v3);
LABEL_14:
  self->m_captureSource.m_objectOfCorrectType = 0;
}

- (void)addNotificationObservers
{
  ThreadSafeWeakPtrControlBlock *m_ptr;
  AVVideoCaptureSource *m_objectOfCorrectType;
  int v6;
  void *v7;
  PAL *v8;
  uint64_t v9;
  PAL *v10;
  PAL *v11;

  m_ptr = self->m_captureSource.m_controlBlock.m_ptr;
  if (!m_ptr)
  {
    m_objectOfCorrectType = 0;
    goto LABEL_15;
  }
  m_objectOfCorrectType = self->m_captureSource.m_objectOfCorrectType;
  if (__ldaxr((unsigned __int8 *)m_ptr))
  {
    __clrex();
LABEL_6:
    MEMORY[0x19AEA534C](m_ptr, a2);
    goto LABEL_7;
  }
  if (__stxr(1u, (unsigned __int8 *)m_ptr))
    goto LABEL_6;
LABEL_7:
  if (*((_QWORD *)m_ptr + 3))
    ++*((_QWORD *)m_ptr + 1);
  else
    m_objectOfCorrectType = 0;
  v6 = __ldxr((unsigned __int8 *)m_ptr);
  if (v6 == 1)
  {
    if (!__stlxr(0, (unsigned __int8 *)m_ptr))
      goto LABEL_15;
  }
  else
  {
    __clrex();
  }
  WTF::Lock::unlockSlow((WTF::Lock *)m_ptr);
LABEL_15:
  v7 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (PAL *)objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_deviceConnectedDidChange_, PAL::get_AVFoundation_AVCaptureDeviceWasDisconnectedNotification((PAL *)v7), 0);
  v9 = *((_QWORD *)m_objectOfCorrectType + 120);
  v10 = (PAL *)objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_sessionRuntimeError_, PAL::get_AVFoundation_AVCaptureSessionRuntimeErrorNotification(v8), v9);
  v11 = (PAL *)objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_beginSessionInterrupted_, PAL::get_AVFoundation_AVCaptureSessionWasInterruptedNotification(v10), v9);
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel_endSessionInterrupted_, PAL::get_AVFoundation_AVCaptureSessionInterruptionEndedNotification(v11), v9);
  WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::RealtimeVideoCaptureSource,(WTF::DestructionThread)2>(*((unsigned __int8 **)m_objectOfCorrectType + 38));
}

- (void)removeNotificationObservers
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self);
}

- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  ThreadSafeWeakPtrControlBlock *m_ptr;
  AVVideoCaptureSource *m_objectOfCorrectType;
  int v10;
  unint64_t v11;
  __CVBuffer *v12;
  uint64_t v13;
  unsigned int *v14;
  unsigned int v15;
  unsigned int *v16;
  unsigned int *v17;
  unsigned int v18;
  unsigned int v19;
  uint64_t v20;
  unint64_t Width;
  __CVBuffer *v22;
  float Height;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  WTF::MonotonicTime *v27;
  uint64_t v28;
  unsigned int *v29;
  unsigned int v30;
  unsigned int v31;
  unint64_t v32;
  char v33;
  uint64_t v34;
  char v35;
  char v36;
  char v37;
  char v38;
  char v39;
  uint64_t v40;

  m_ptr = self->m_captureSource.m_controlBlock.m_ptr;
  if (!m_ptr)
    return;
  m_objectOfCorrectType = self->m_captureSource.m_objectOfCorrectType;
  if (__ldaxr((unsigned __int8 *)m_ptr))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)m_ptr))
  {
    goto LABEL_6;
  }
  MEMORY[0x19AEA534C](m_ptr, a2, a3);
LABEL_6:
  if (*((_QWORD *)m_ptr + 3))
    ++*((_QWORD *)m_ptr + 1);
  else
    m_objectOfCorrectType = 0;
  v10 = __ldxr((unsigned __int8 *)m_ptr);
  if (v10 != 1)
  {
    __clrex();
LABEL_34:
    WTF::Lock::unlockSlow((WTF::Lock *)m_ptr);
    if (!m_objectOfCorrectType)
      return;
    goto LABEL_12;
  }
  if (__stlxr(0, (unsigned __int8 *)m_ptr))
    goto LABEL_34;
  if (!m_objectOfCorrectType)
    return;
LABEL_12:
  v11 = *((_QWORD *)m_objectOfCorrectType + 160) + 1;
  *((_QWORD *)m_objectOfCorrectType + 160) = v11;
  if (v11 >= 5)
  {
    WebCore::VideoFrameCV::create(a4, (opaqueCMSampleBuffer *)objc_msgSend(a5, "isVideoMirrored", a3), *((_WORD *)m_objectOfCorrectType + 240), &v40);
    v13 = v40;
    if (v40)
    {
      v14 = (unsigned int *)(v40 + 8);
      do
        v15 = __ldaxr(v14);
      while (__stlxr(v15 + 1, v14));
    }
    v16 = (unsigned int *)*((_QWORD *)m_objectOfCorrectType + 57);
    *((_QWORD *)m_objectOfCorrectType + 57) = v13;
    if (v16)
    {
      v17 = v16 + 2;
      do
      {
        v18 = __ldaxr(v17);
        v19 = v18 - 1;
      }
      while (__stlxr(v19, v17));
      if (!v19)
      {
        atomic_store(1u, v16 + 2);
        (*(void (**)(unsigned int *))(*(_QWORD *)v16 + 8))(v16);
      }
    }
    v20 = v40;
    Width = WebCore::softLinkCoreVideoCVPixelBufferGetWidth(*(WebCore **)(v40 + 48), v12);
    Height = (float)(unint64_t)WebCore::softLinkCoreVideoCVPixelBufferGetHeight(*(WebCore **)(v20 + 48), v22);
    v24 = 0x7FFFFFFFLL;
    v25 = 0x80000000;
    if ((float)Width > -2147500000.0)
      v25 = (int)(float)Width;
    if ((float)Width < 2147500000.0)
      v24 = v25;
    if (Height >= 2147500000.0)
    {
      v26 = 0x7FFFFFFF00000000;
    }
    else if (Height <= -2147500000.0)
    {
      v26 = 0x8000000000000000;
    }
    else
    {
      v26 = (unint64_t)(int)Height << 32;
    }
    v32 = v26 | v24;
    v27 = (WTF::MonotonicTime *)WebCore::RealtimeMediaSource::setIntrinsicSize(m_objectOfCorrectType, (const WebCore::IntSize *)&v32, 1);
    WTF::MonotonicTime::now(v27);
    LOBYTE(v32) = 0;
    v33 = 0;
    v34 = v28;
    v35 = 1;
    v36 = 0;
    v37 = 0;
    v38 = 0;
    v39 = 0;
    WebCore::RealtimeVideoCaptureSource::dispatchVideoFrameToObservers((uint64_t)m_objectOfCorrectType, (WebCore::VideoFrame *)v20, (uint64_t)&v32);
    v40 = 0;
    v29 = (unsigned int *)(v20 + 8);
    do
    {
      v30 = __ldaxr(v29);
      v31 = v30 - 1;
    }
    while (__stlxr(v31, v29));
    if (!v31)
    {
      atomic_store(1u, (unsigned int *)(v20 + 8));
      (*(void (**)(uint64_t))(*(_QWORD *)v20 + 8))(v20);
    }
  }
  WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::RealtimeVideoCaptureSource,(WTF::DestructionThread)2>(*((unsigned __int8 **)m_objectOfCorrectType + 38));
}

- (void)captureOutput:(id)a3 didFinishProcessingPhoto:(id)a4 error:(id)a5
{
  ThreadSafeWeakPtrControlBlock *m_ptr;
  AVVideoCaptureSource *m_objectOfCorrectType;
  int v11;
  char *v12;
  char *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  char *v18;
  WTF::NativePromiseBase *v19;
  WTF::StringImpl *v20;
  WTF::StringImpl *v21;
  unsigned __int8 *v22;
  uint64_t *v24;
  uint64_t v25;
  unsigned __int8 *v26;
  uint64_t v28;
  WTF::StringImpl *v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  int v33;
  _BYTE *v34;
  WTF::NativePromiseBase *v35;
  _BYTE *v37;
  WTF *v38;
  uint64_t v39;
  uint64_t v40;
  WTF::Lock *v41;
  int v42;
  unsigned int *v43;
  unsigned int *v44;
  unsigned int v45;
  unsigned int v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  WTF::StringImpl *v50;
  WTF::StringImpl *v51;
  uint64_t v52;
  int v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  WTF::StringImpl *v59;
  WTF::StringImpl *v60;
  WTF *v61;
  uint64_t v62;
  WTF::StringImpl *v63;
  WTF::StringImpl *v64;
  const char *v65;
  uint64_t v66;
  WTF::Lock *v67;
  char v68;
  uint64_t v69;

  m_ptr = self->m_captureSource.m_controlBlock.m_ptr;
  if (!m_ptr)
    return;
  m_objectOfCorrectType = self->m_captureSource.m_objectOfCorrectType;
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
  v11 = __ldxr((unsigned __int8 *)m_ptr);
  if (v11 == 1)
  {
    if (!__stlxr(0, (unsigned __int8 *)m_ptr))
    {
      if (!m_objectOfCorrectType)
        return;
      goto LABEL_12;
    }
  }
  else
  {
    __clrex();
  }
  WTF::Lock::unlockSlow((WTF::Lock *)m_ptr);
  if (!m_objectOfCorrectType)
    return;
LABEL_12:
  if (a3)
    CFRetain(a3);
  if (a4)
    CFRetain(a4);
  if (a5)
  {
    CFRetain(a5);
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    WebCore::AVVideoCaptureSource::rejectPendingPhotoRequest((unsigned __int8 *)m_objectOfCorrectType, (const WTF::String *)&v63, v48, v49);
    v51 = v63;
    v63 = 0;
    if (v51)
    {
      if (*(_DWORD *)v51 == 2)
        v51 = (WTF::StringImpl *)WTF::StringImpl::destroy(v51, v50);
      else
        *(_DWORD *)v51 -= 2;
    }
    WTF::RunLoop::main(v51);
    v52 = *((_QWORD *)m_objectOfCorrectType + 38);
    if (__ldaxr((unsigned __int8 *)v52))
    {
      __clrex();
    }
    else if (!__stxr(1u, (unsigned __int8 *)v52))
    {
      goto LABEL_106;
    }
    MEMORY[0x19AEA534C](v52);
LABEL_106:
    ++*(_QWORD *)(v52 + 8);
    v54 = __ldxr((unsigned __int8 *)v52);
    if (v54 == 1)
    {
      if (!__stlxr(0, (unsigned __int8 *)v52))
      {
LABEL_111:
        v55 = (*(uint64_t (**)(AVVideoCaptureSource *))(*(_QWORD *)m_objectOfCorrectType + 24))(m_objectOfCorrectType);
        v57 = v56;
        v58 = *((_QWORD *)m_objectOfCorrectType + 6);
        v59 = (WTF::StringImpl *)WTF::fastMalloc((WTF *)0x40);
        *(_QWORD *)v59 = &off_1E31F7300;
        *((_QWORD *)v59 + 1) = m_objectOfCorrectType;
        *((_QWORD *)v59 + 2) = m_objectOfCorrectType;
        *((_QWORD *)v59 + 3) = v55;
        *((_QWORD *)v59 + 4) = v57;
        *((_QWORD *)v59 + 5) = "captureOutputDidFinishProcessingPhoto";
        *((_QWORD *)v59 + 6) = v58;
        *((_QWORD *)v59 + 7) = a5;
        v63 = v59;
        WTF::RunLoop::dispatch();
        v60 = v63;
        v63 = 0;
        if (v60)
          (*(void (**)(WTF::StringImpl *))(*(_QWORD *)v60 + 8))(v60);
        goto LABEL_91;
      }
    }
    else
    {
      __clrex();
    }
    WTF::Lock::unlockSlow((WTF::Lock *)v52);
    goto LABEL_111;
  }
  v12 = (char *)objc_msgSend(a4, "fileDataRepresentation");
  v13 = v12;
  if (v12 && (v14 = objc_msgSend(v12, "bytes"), v15 = objc_msgSend(v13, "length"), (v13 = (char *)v15) != 0))
  {
    if (HIDWORD(v15))
    {
      __break(0xC471u);
      return;
    }
    v16 = WTF::fastMalloc((WTF *)v15);
    v17 = (uint64_t *)v16;
    v18 = 0;
    do
    {
      v18[v16] = v18[v14];
      ++v18;
    }
    while (v13 != v18);
  }
  else
  {
    v17 = 0;
  }
  v19 = (WTF::NativePromiseBase *)WTF::StringImpl::createWithoutCopyingNonEmpty();
  v21 = v63;
  v22 = (unsigned __int8 *)m_objectOfCorrectType + 992;
  if (__ldaxr((unsigned __int8 *)m_objectOfCorrectType + 992))
  {
    __clrex();
  }
  else if (!__stxr(1u, v22))
  {
    goto LABEL_31;
  }
  v19 = (WTF::NativePromiseBase *)MEMORY[0x19AEA534C]((char *)m_objectOfCorrectType + 992);
LABEL_31:
  v24 = (uint64_t *)*((_QWORD *)m_objectOfCorrectType + 123);
  if (v24)
  {
    v61 = (WTF *)v17;
    LODWORD(v62) = (_DWORD)v13;
    HIDWORD(v62) = (_DWORD)v13;
    if (v63)
      *(_DWORD *)v63 += 2;
    v63 = 0;
    v64 = 0;
    v65 = "resolvePendingPhotoRequest";
    v66 = 0;
    v25 = *v24;
    if (!*v24)
    {
      v31 = 0;
LABEL_49:
      v34 = (_BYTE *)WTF::NativePromiseBase::logChannel(v19);
      if (*v34 && v34[16] >= 4u)
        WTF::Logger::log<WTF::Logger::LogSiteIdentifier,char [39],WTF::NativePromise<std::pair<WTF::Vector<unsigned char,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>,WTF::String>,WTF::String,0u>>((uint64_t)v34, (WTF::Logger::LogSiteIdentifier *)&v63, v31);
      goto LABEL_67;
    }
    v26 = (unsigned __int8 *)(v25 + 48);
    if (__ldaxr((unsigned __int8 *)(v25 + 48)))
    {
      __clrex();
    }
    else if (!__stxr(1u, v26))
    {
      goto LABEL_43;
    }
    v19 = (WTF::NativePromiseBase *)MEMORY[0x19AEA534C](v25 + 48);
LABEL_43:
    v32 = *(_DWORD *)(v25 + 88);
    v33 = __ldxr(v26);
    if (v33 == 1)
    {
      if (!__stlxr(0, v26))
      {
LABEL_48:
        v31 = *v24;
        if (v32)
          goto LABEL_49;
        v35 = (WTF::NativePromiseBase *)(v31 + 48);
        v67 = (WTF::Lock *)(v31 + 48);
        v68 = 1;
        if (__ldaxr((unsigned __int8 *)(v31 + 48)))
        {
          __clrex();
        }
        else if (!__stxr(1u, (unsigned __int8 *)v35))
        {
LABEL_56:
          v37 = (_BYTE *)WTF::NativePromiseBase::logChannel(v35);
          if (*v37 && v37[16] >= 4u)
            WTF::Logger::log<WTF::Logger::LogSiteIdentifier,char [12],WTF::NativePromise<std::pair<WTF::Vector<unsigned char,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>,WTF::String>,WTF::String,0u>>((uint64_t)v37, 4u, (WTF::Logger::LogSiteIdentifier *)&v63, " resolving ", v31);
          v38 = v61;
          v61 = 0;
          WTF::String::isolatedCopy();
          v39 = v69;
          v40 = *(unsigned int *)(v31 + 88);
          if ((_DWORD)v40 != -1)
            ((void (*)(uint64_t *, uint64_t))off_1E31F70E0[v40])(&v69, v31 + 56);
          *(_QWORD *)(v31 + 56) = v38;
          *(_QWORD *)(v31 + 64) = v62;
          *(_QWORD *)(v31 + 72) = v39;
          *(_DWORD *)(v31 + 80) = 0;
          *(_DWORD *)(v31 + 88) = 1;
          WTF::NativePromise<std::pair<WTF::Vector<unsigned char,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>,WTF::String>,WTF::String,0u>::dispatchAll(v31, (unsigned __int8 **)&v67);
          if (!v68)
            goto LABEL_67;
          v41 = v67;
          v42 = __ldxr((unsigned __int8 *)v67);
          if (v42 == 1)
          {
            if (!__stlxr(0, (unsigned __int8 *)v67))
              goto LABEL_67;
          }
          else
          {
            __clrex();
          }
          WTF::Lock::unlockSlow(v41);
LABEL_67:
          if (v21)
          {
            if (*(_DWORD *)v21 == 2)
              WTF::StringImpl::destroy(v21, v20);
            else
              *(_DWORD *)v21 -= 2;
          }
          if (v61)
            WTF::fastFree(v61, v20);
          v17 = (uint64_t *)*((_QWORD *)m_objectOfCorrectType + 123);
          *((_QWORD *)m_objectOfCorrectType + 123) = 0;
          if (v17)
          {
            if (*v17)
            {
              WTF::NativePromise<std::pair<WTF::Vector<unsigned char,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>,WTF::String>,WTF::String,0u>::assertIsDead(*v17);
              v43 = (unsigned int *)*v17;
              *v17 = 0;
              if (v43)
              {
                v44 = v43 + 2;
                do
                {
                  v45 = __ldaxr(v44);
                  v46 = v45 - 1;
                }
                while (__stlxr(v46, v44));
                if (!v46)
                {
                  atomic_store(1u, v43 + 2);
                  (*(void (**)(unsigned int *))(*(_QWORD *)v43 + 16))(v43);
                }
              }
            }
            else
            {
              *v17 = 0;
            }
            WTF::fastFree((WTF *)v17, v20);
            v17 = 0;
          }
          goto LABEL_81;
        }
        v35 = (WTF::NativePromiseBase *)MEMORY[0x19AEA534C]();
        goto LABEL_56;
      }
    }
    else
    {
      __clrex();
    }
    v19 = (WTF::NativePromiseBase *)WTF::Lock::unlockSlow((WTF::Lock *)v26);
    goto LABEL_48;
  }
  v28 = *((_QWORD *)m_objectOfCorrectType + 5);
  if (v28)
  {
    v29 = (WTF::StringImpl *)(*(uint64_t (**)(AVVideoCaptureSource *))(*(_QWORD *)m_objectOfCorrectType + 24))(m_objectOfCorrectType);
    v30 = *((_QWORD *)m_objectOfCorrectType + 6);
    v63 = v29;
    v64 = v20;
    v65 = "resolvePendingPhotoRequest";
    v66 = v30;
    if (*(_BYTE *)(v28 + 12))
      WTF::Logger::log<WTF::Logger::LogSiteIdentifier,char [18]>((uint64_t)&WebCore::LogWebRTC, 1u, (WTF::Logger::LogSiteIdentifier *)&v63, "no photo producer");
  }
LABEL_81:
  v47 = __ldxr(v22);
  if (v47 != 1)
  {
    __clrex();
    goto LABEL_85;
  }
  if (__stlxr(0, v22))
LABEL_85:
    WTF::Lock::unlockSlow((WTF::Lock *)((char *)m_objectOfCorrectType + 992));
  if (v21)
  {
    if (*(_DWORD *)v21 == 2)
    {
      WTF::StringImpl::destroy(v21, v20);
      if (!v17)
        goto LABEL_91;
      goto LABEL_90;
    }
    *(_DWORD *)v21 -= 2;
  }
  if (v17)
LABEL_90:
    WTF::fastFree((WTF *)v17, v20);
LABEL_91:
  if (a4)
    CFRelease(a4);
  if (a3)
    CFRelease(a3);
  WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::RealtimeVideoCaptureSource,(WTF::DestructionThread)2>(*((unsigned __int8 **)m_objectOfCorrectType + 38));
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  ThreadSafeWeakPtrControlBlock *m_ptr;
  AVVideoCaptureSource *m_objectOfCorrectType;
  int v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  const char *v26;
  const char *v27;
  const char *v28;
  _QWORD v29[4];

  m_ptr = self->m_captureSource.m_controlBlock.m_ptr;
  if (m_ptr)
  {
    m_objectOfCorrectType = self->m_captureSource.m_objectOfCorrectType;
    if (__ldaxr((unsigned __int8 *)m_ptr))
    {
      __clrex();
    }
    else if (!__stxr(1u, (unsigned __int8 *)m_ptr))
    {
      goto LABEL_6;
    }
    MEMORY[0x19AEA534C](m_ptr, a2, a3, a4, a5, a6);
LABEL_6:
    if (*((_QWORD *)m_ptr + 3))
      ++*((_QWORD *)m_ptr + 1);
    else
      m_objectOfCorrectType = 0;
    v11 = __ldxr((unsigned __int8 *)m_ptr);
    if (v11 == 1)
    {
      if (!__stlxr(0, (unsigned __int8 *)m_ptr))
      {
        if (!m_objectOfCorrectType)
          return;
        goto LABEL_15;
      }
    }
    else
    {
      __clrex();
    }
    WTF::Lock::unlockSlow((WTF::Lock *)m_ptr);
    if (!m_objectOfCorrectType)
      return;
LABEL_15:
    v12 = (void *)objc_msgSend(a5, "valueForKey:", *MEMORY[0x1E0CB2CB8], a4, a5, a6);
    v13 = objc_msgSend((id)objc_msgSend(a5, "valueForKey:", *MEMORY[0x1E0CB2CC0]), "BOOLValue");
    if (!*((_QWORD *)m_objectOfCorrectType + 5))
      goto LABEL_21;
    v14 = *((_QWORD *)m_objectOfCorrectType + 6);
    v29[0] = "AVVideoCaptureSource";
    v29[1] = 21;
    v29[2] = "observeValueForKeyPath";
    v29[3] = v14;
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@"), v12);
    v16 = "did";
    v17 = *((_QWORD *)m_objectOfCorrectType + 5);
    if (v13)
      v16 = "will";
    v28 = v16;
    v27 = (const char *)objc_msgSend(a3, "UTF8String");
    v26 = (const char *)objc_msgSend(v15, "UTF8String");
    if (*(_BYTE *)(v17 + 12))
      WTF::Logger::log<WTF::Logger::LogSiteIdentifier,char const*,char [10],char const*,char [6],char const*>((uint64_t)&WebCore::LogWebRTC, 0, (WTF::Logger::LogSiteIdentifier *)v29, &v28, " change '", &v27, "' to ", &v26);
    if (v15)
    {
      CFRelease(v15);
      if ((v13 & 1) == 0)
        goto LABEL_22;
    }
    else
    {
LABEL_21:
      if ((v13 & 1) == 0)
      {
LABEL_22:
        if (objc_msgSend(a3, "isEqualToString:", CFSTR("running")))
        {
          v18 = objc_msgSend(v12, "BOOLValue");
          v19 = (*(uint64_t (**)(AVVideoCaptureSource *))(*(_QWORD *)m_objectOfCorrectType + 24))(m_objectOfCorrectType);
          v21 = v20;
          v22 = *((_QWORD *)m_objectOfCorrectType + 6);
          v23 = WTF::fastMalloc((WTF *)0x38);
          *(_QWORD *)v23 = off_1E31F7328;
          *(_QWORD *)(v23 + 8) = m_objectOfCorrectType;
          *(_QWORD *)(v23 + 16) = v19;
          *(_QWORD *)(v23 + 24) = v21;
          *(_QWORD *)(v23 + 32) = "captureSessionIsRunningDidChange";
          *(_QWORD *)(v23 + 40) = v22;
          *(_BYTE *)(v23 + 48) = v18;
          (*(void (**)(AVVideoCaptureSource *))(*(_QWORD *)m_objectOfCorrectType + 136))(m_objectOfCorrectType);
          v24 = (_QWORD *)WTF::fastMalloc((WTF *)0x18);
          *v24 = &off_1E34195B0;
          v24[1] = m_objectOfCorrectType;
          v24[2] = v23;
          v29[0] = v24;
          WTF::callOnMainThread();
          v25 = v29[0];
          v29[0] = 0;
          if (v25)
            (*(void (**)(uint64_t))(*(_QWORD *)v25 + 8))(v25);
        }
        objc_msgSend(a3, "isEqualToString:", CFSTR("suspended"));
      }
    }
    WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::RealtimeVideoCaptureSource,(WTF::DestructionThread)2>(*((unsigned __int8 **)m_objectOfCorrectType + 38));
  }
}

- (void)deviceConnectedDidChange:(id)a3
{
  ThreadSafeWeakPtrControlBlock *m_ptr;
  AVVideoCaptureSource *m_objectOfCorrectType;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;

  m_ptr = self->m_captureSource.m_controlBlock.m_ptr;
  if (!m_ptr)
    return;
  m_objectOfCorrectType = self->m_captureSource.m_objectOfCorrectType;
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
  v7 = __ldxr((unsigned __int8 *)m_ptr);
  if (v7 == 1)
  {
    if (!__stlxr(0, (unsigned __int8 *)m_ptr))
    {
      if (!m_objectOfCorrectType)
        return;
      goto LABEL_15;
    }
  }
  else
  {
    __clrex();
  }
  WTF::Lock::unlockSlow((WTF::Lock *)m_ptr);
  if (!m_objectOfCorrectType)
    return;
LABEL_15:
  if (a3)
    CFRetain(a3);
  v8 = *((_QWORD *)m_objectOfCorrectType + 5);
  if (v8)
  {
    v9 = (*(uint64_t (**)(AVVideoCaptureSource *, SEL))(*(_QWORD *)m_objectOfCorrectType + 24))(m_objectOfCorrectType, a2);
    v10 = *((_QWORD *)m_objectOfCorrectType + 6);
    v13 = v9;
    v14 = v11;
    v15 = "deviceDisconnected";
    v16 = v10;
    if (*(_BYTE *)(v8 + 12))
      WTF::Logger::log<WTF::Logger::LogSiteIdentifier>((uint64_t)&WebCore::LogWebRTC, 0, (WTF::Logger::LogSiteIdentifier *)&v13);
  }
  v12 = *((_QWORD *)m_objectOfCorrectType + 121);
  if (v12 == objc_msgSend(a3, "object", v13, v14, v15, v16))
    (*(void (**)(AVVideoCaptureSource *))(*(_QWORD *)m_objectOfCorrectType + 240))(m_objectOfCorrectType);
  if (a3)
    CFRelease(a3);
  WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::RealtimeVideoCaptureSource,(WTF::DestructionThread)2>(*((unsigned __int8 **)m_objectOfCorrectType + 38));
}

- (void)sessionRuntimeError:(id)a3
{
  void *v4;
  uint64_t v5;
  ThreadSafeWeakPtrControlBlock *m_ptr;
  void *v7;
  AVVideoCaptureSource *m_objectOfCorrectType;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  WTF::StringImpl *v14;
  WTF::StringImpl *v15;
  WTF::StringImpl *v16;
  WTF::StringImpl *v17;
  WTF::StringImpl *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  char *v22;
  unsigned __int8 *v23;
  int v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  WTF::Logger *v31;
  uint64_t v32;
  uint64_t v33;
  WTF::StringImpl *v34;
  WTF::StringImpl *v35;
  WTF::StringImpl *v36;
  WTF::Logger *v37;
  uint64_t v38;
  WTF::StringImpl **v39;
  WTF::StringImpl *v40;
  WTF::StringImpl *v41;
  WTF::StringImpl *v42;
  WTF::StringImpl *v43;
  WTF::StringImpl *v44;
  int v45;
  WTF::StringImpl *v46;
  uint64_t v47;
  WTF::Logger *v48;
  WTF::Logger *v49;
  int *v50;
  WTF::StringImpl **v51;
  WTF::String *v52;
  __int128 v53;
  __int128 v54;
  WTF::Logger *v55;
  uint64_t v56;
  WTF::StringImpl *v57;
  WTF::StringImpl *v58;
  WTF::StringImpl *v59;
  WTF::StringImpl *v60;
  WTF::StringImpl *v61;
  WTF::StringImpl *v62;
  WTF::StringImpl *v63;
  uint8_t buf[16];
  WTF::StringImpl *v65[2];
  int v66;
  WTF::StringImpl *v67;
  int v68;
  WTF::StringImpl *v69[3];

  v69[1] = *(WTF::StringImpl **)MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(a3, "userInfo");
  v5 = objc_msgSend(v4, "objectForKeyedSubscript:", PAL::get_AVFoundation_AVCaptureSessionErrorKey((PAL *)v4));
  m_ptr = self->m_captureSource.m_controlBlock.m_ptr;
  if (!m_ptr)
    return;
  v7 = (void *)v5;
  m_objectOfCorrectType = self->m_captureSource.m_objectOfCorrectType;
  if (__ldaxr((unsigned __int8 *)m_ptr))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)m_ptr))
  {
    goto LABEL_6;
  }
  MEMORY[0x19AEA534C](m_ptr);
LABEL_6:
  if (*((_QWORD *)m_ptr + 3))
    ++*((_QWORD *)m_ptr + 1);
  else
    m_objectOfCorrectType = 0;
  v10 = __ldxr((unsigned __int8 *)m_ptr);
  if (v10 != 1)
  {
    __clrex();
LABEL_45:
    WTF::Lock::unlockSlow((WTF::Lock *)m_ptr);
    if (!m_objectOfCorrectType)
      return;
    goto LABEL_12;
  }
  if (__stlxr(0, (unsigned __int8 *)m_ptr))
    goto LABEL_45;
  if (!m_objectOfCorrectType)
    return;
LABEL_12:
  if (v7)
    CFRetain(v7);
  *(_QWORD *)&v53 = (*(uint64_t (**)(AVVideoCaptureSource *))(*(_QWORD *)m_objectOfCorrectType + 24))(m_objectOfCorrectType);
  *((_QWORD *)&v53 + 1) = v11;
  v13 = *((_QWORD *)m_objectOfCorrectType + 5);
  v12 = *((_QWORD *)m_objectOfCorrectType + 6);
  *(_QWORD *)&v54 = "captureSessionRuntimeError";
  *((_QWORD *)&v54 + 1) = v12;
  if (v13)
  {
    v52 = (WTF::String *)objc_msgSend(v7, "code");
    if (*(_BYTE *)(v13 + 12))
    {
      WTF::Logger::LogSiteIdentifier::toString((WTF::Logger::LogSiteIdentifier *)&v53);
      WTF::String::number(v52);
      WTF::String::String((WTF::String *)&v58, ", ");
      MEMORY[0x19AEA5508](&v57, objc_msgSend(v7, "localizedDescription"));
      v55 = v59;
      v63 = v58;
      *(_QWORD *)buf = v60;
      v62 = v57;
      WTF::tryMakeStringFromAdapters<WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>>((uint64_t)buf, (uint64_t *)&v55, (uint64_t *)&v63, (uint64_t *)&v62, &v61);
      if (!v61)
      {
        __break(0xC471u);
        return;
      }
      v15 = v57;
      v57 = 0;
      if (v15)
      {
        if (*(_DWORD *)v15 == 2)
          WTF::StringImpl::destroy(v15, v14);
        else
          *(_DWORD *)v15 -= 2;
      }
      v16 = v58;
      v58 = 0;
      if (v16)
      {
        if (*(_DWORD *)v16 == 2)
          WTF::StringImpl::destroy(v16, v14);
        else
          *(_DWORD *)v16 -= 2;
      }
      v17 = v59;
      v59 = 0;
      if (v17)
      {
        if (*(_DWORD *)v17 == 2)
          WTF::StringImpl::destroy(v17, v14);
        else
          *(_DWORD *)v17 -= 2;
      }
      v18 = v60;
      v60 = 0;
      if (v18)
      {
        if (*(_DWORD *)v18 == 2)
          WTF::StringImpl::destroy(v18, v14);
        else
          *(_DWORD *)v18 -= 2;
      }
      v19 = qword_1ECE7CD60;
      v20 = os_log_type_enabled((os_log_t)qword_1ECE7CD60, OS_LOG_TYPE_DEFAULT);
      if ((_DWORD)v20)
      {
        WTF::String::utf8();
        v22 = v55 ? (char *)v55 + 16 : 0;
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = v22;
        _os_log_impl(&dword_1940B8000, v19, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
        v20 = (uint64_t)v55;
        v55 = 0;
        if (v20)
        {
          if (*(_DWORD *)v20 == 1)
            v20 = WTF::fastFree((WTF *)v20, v21);
          else
            --*(_DWORD *)v20;
        }
      }
      if (WebCore::LogWebRTC && byte_1ECE7CD50)
      {
        v23 = (unsigned __int8 *)MEMORY[0x1E0CBF890];
        while (1)
        {
          v24 = *v23;
          if ((v24 & 1) != 0)
            break;
          v25 = __ldaxr(v23);
          if (v25 == v24)
          {
            if (!__stxr(v24 | 1, v23))
            {
              v26 = WTF::Logger::observers((WTF::Logger *)v20);
              v27 = *(unsigned int *)(v26 + 12);
              if ((_DWORD)v27)
              {
                v28 = *(uint64_t **)v26;
                v29 = *(_QWORD *)v26 + 8 * v27;
                v50 = &v66;
                v51 = v65;
                do
                {
                  v30 = *v28;
                  *(_DWORD *)buf = 0;
                  WTF::Logger::LogSiteIdentifier::toString((WTF::Logger::LogSiteIdentifier *)&v53);
                  LODWORD(v65[0]) = 0;
                  WTF::String::number(v52);
                  v66 = 0;
                  WTF::String::String((WTF::String *)&v67, ", ");
                  v68 = 0;
                  MEMORY[0x19AEA5508](v69, objc_msgSend(v7, "localizedDescription", v50, v51));
                  v55 = 0;
                  v56 = 0;
                  v31 = (WTF::Logger *)WTF::fastMalloc((WTF *)0x40);
                  LODWORD(v56) = 4;
                  v55 = v31;
                  v32 = HIDWORD(v56);
                  *((_DWORD *)v31 + 4 * HIDWORD(v56)) = *(_DWORD *)buf;
                  v33 = *(_QWORD *)&buf[8];
                  if (*(_QWORD *)&buf[8])
                    **(_DWORD **)&buf[8] += 2;
                  *((_QWORD *)v31 + 2 * v32 + 1) = v33;
                  *((_DWORD *)v31 + 4 * (v32 + 1)) = v65[0];
                  v34 = v65[1];
                  if (v65[1])
                    *(_DWORD *)v65[1] += 2;
                  *((_QWORD *)v31 + 2 * (v32 + 1) + 1) = v34;
                  *((_DWORD *)v31 + 4 * (v32 + 2)) = v66;
                  v35 = v67;
                  if (v67)
                    *(_DWORD *)v67 += 2;
                  *((_QWORD *)v31 + 2 * (v32 + 2) + 1) = v35;
                  *((_DWORD *)v31 + 4 * (v32 + 3)) = v68;
                  v36 = v69[0];
                  if (v69[0])
                    *(_DWORD *)v69[0] += 2;
                  *((_QWORD *)v31 + 2 * (v32 + 3) + 1) = v36;
                  HIDWORD(v56) = v32 + 4;
                  (*(void (**)(uint64_t, char *, uint64_t, WTF::Logger **))(*(_QWORD *)v30 + 16))(v30, &WebCore::LogWebRTC, 1, &v55);
                  v37 = v55;
                  if (HIDWORD(v56))
                  {
                    v38 = 16 * HIDWORD(v56);
                    v39 = (WTF::StringImpl **)((char *)v55 + 8);
                    do
                    {
                      v40 = *v39;
                      *v39 = 0;
                      if (v40)
                      {
                        if (*(_DWORD *)v40 == 2)
                          WTF::StringImpl::destroy(v40, (WTF::StringImpl *)v21);
                        else
                          *(_DWORD *)v40 -= 2;
                      }
                      v39 += 2;
                      v38 -= 16;
                    }
                    while (v38);
                    v37 = v55;
                  }
                  if (v37)
                  {
                    v55 = 0;
                    LODWORD(v56) = 0;
                    WTF::fastFree(v37, v21);
                  }
                  v41 = v69[0];
                  v69[0] = 0;
                  if (v41)
                  {
                    if (*(_DWORD *)v41 == 2)
                      WTF::StringImpl::destroy(v41, (WTF::StringImpl *)v21);
                    else
                      *(_DWORD *)v41 -= 2;
                  }
                  v42 = v67;
                  v67 = 0;
                  if (v42)
                  {
                    if (*(_DWORD *)v42 == 2)
                      WTF::StringImpl::destroy(v42, (WTF::StringImpl *)v21);
                    else
                      *(_DWORD *)v42 -= 2;
                  }
                  v43 = v65[1];
                  v65[1] = 0;
                  if (v43)
                  {
                    if (*(_DWORD *)v43 == 2)
                      WTF::StringImpl::destroy(v43, (WTF::StringImpl *)v21);
                    else
                      *(_DWORD *)v43 -= 2;
                  }
                  v44 = *(WTF::StringImpl **)&buf[8];
                  *(_QWORD *)&buf[8] = 0;
                  if (v44)
                  {
                    if (*(_DWORD *)v44 == 2)
                      WTF::StringImpl::destroy(v44, (WTF::StringImpl *)v21);
                    else
                      *(_DWORD *)v44 -= 2;
                  }
                  ++v28;
                }
                while (v28 != (uint64_t *)v29);
              }
              v45 = __ldxr(v23);
              if (v45 == 1)
              {
                if (!__stlxr(0, v23))
                  break;
              }
              else
              {
                __clrex();
              }
              WTF::Lock::unlockSlow(MEMORY[0x1E0CBF890]);
              break;
            }
          }
          else
          {
            __clrex();
          }
        }
      }
      v46 = v61;
      v61 = 0;
      if (v46)
      {
        if (*(_DWORD *)v46 == 2)
          WTF::StringImpl::destroy(v46, (WTF::StringImpl *)v21);
        else
          *(_DWORD *)v46 -= 2;
      }
    }
  }
  if (*((_BYTE *)m_objectOfCorrectType + 1161))
  {
    if (objc_msgSend(v7, "code") == -11819)
    {
      *(_OWORD *)buf = v53;
      *(_OWORD *)v65 = v54;
      v47 = WTF::fastMalloc((WTF *)0x30);
      *(_QWORD *)v47 = off_1E31F7350;
      *(_QWORD *)(v47 + 8) = m_objectOfCorrectType;
      *(_OWORD *)(v47 + 16) = *(_OWORD *)buf;
      *(_OWORD *)(v47 + 32) = *(_OWORD *)v65;
      (*(void (**)(AVVideoCaptureSource *))(*(_QWORD *)m_objectOfCorrectType + 136))(m_objectOfCorrectType);
      v48 = (WTF::Logger *)WTF::fastMalloc((WTF *)0x18);
      *(_QWORD *)v48 = &off_1E34195B0;
      *((_QWORD *)v48 + 1) = m_objectOfCorrectType;
      *((_QWORD *)v48 + 2) = v47;
      v55 = v48;
      WTF::callOnMainThread();
      v49 = v55;
      v55 = 0;
      if (v49)
        (*(void (**)(WTF::Logger *))(*(_QWORD *)v49 + 8))(v49);
    }
  }
  if (v7)
    CFRelease(v7);
  WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::RealtimeVideoCaptureSource,(WTF::DestructionThread)2>(*((unsigned __int8 **)m_objectOfCorrectType + 38));
}

- (void)beginSessionInterrupted:(id)a3
{
  ThreadSafeWeakPtrControlBlock *m_ptr;
  AVVideoCaptureSource *m_objectOfCorrectType;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  int v16;
  uint64_t v17;
  unsigned int v18;
  int v19;
  WTF::StringImpl *v20;
  WTF::StringImpl *v21;
  WTF::StringImpl *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  char *v26;
  unsigned __int8 *v27;
  int v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  WTF::Logger *v35;
  uint64_t v36;
  uint64_t v37;
  WTF::StringImpl *v38;
  WTF::Logger *v39;
  uint64_t v40;
  WTF::StringImpl **v41;
  WTF::StringImpl *v42;
  WTF::StringImpl *v43;
  WTF::StringImpl *v44;
  int v45;
  WTF::StringImpl *v46;
  AVVideoCaptureSource *v47;
  _QWORD v48[4];
  WTF::Logger *v49;
  uint64_t v50;
  WTF::StringImpl *v51;
  WTF::StringImpl *v52;
  WTF::StringImpl *v53;
  __int128 buf;
  int v55;
  WTF::StringImpl *v56[3];

  v56[2] = *(WTF::StringImpl **)MEMORY[0x1E0C80C00];
  m_ptr = self->m_captureSource.m_controlBlock.m_ptr;
  if (!m_ptr)
    return;
  m_objectOfCorrectType = self->m_captureSource.m_objectOfCorrectType;
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
  v7 = __ldxr((unsigned __int8 *)m_ptr);
  if (v7 == 1)
  {
    if (!__stlxr(0, (unsigned __int8 *)m_ptr))
    {
      if (!m_objectOfCorrectType)
        return;
      goto LABEL_15;
    }
  }
  else
  {
    __clrex();
  }
  WTF::Lock::unlockSlow((WTF::Lock *)m_ptr);
  if (!m_objectOfCorrectType)
    return;
LABEL_15:
  if (a3)
    CFRetain(a3);
  v8 = *((_QWORD *)m_objectOfCorrectType + 5);
  if (v8)
  {
    v9 = (*(uint64_t (**)(AVVideoCaptureSource *, SEL))(*(_QWORD *)m_objectOfCorrectType + 24))(m_objectOfCorrectType, a2);
    v10 = *((_QWORD *)m_objectOfCorrectType + 6);
    v48[0] = v9;
    v48[1] = v11;
    v48[2] = "captureSessionBeginInterruption";
    v48[3] = v10;
    v12 = (void *)objc_msgSend(a3, "userInfo");
    v13 = objc_msgSend(v12, "objectForKeyedSubscript:", PAL::get_AVFoundation_AVCaptureSessionInterruptionReasonKey((PAL *)v12));
    if (*(_BYTE *)(v8 + 12))
    {
      v14 = (void *)v13;
      WTF::Logger::LogSiteIdentifier::toString((WTF::Logger::LogSiteIdentifier *)v48);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        MEMORY[0x19AEA5508](&v51, objc_msgSend(v14, "description"));
      else
        WTF::LogArgument<void const*>::toString();
      if (v52)
      {
        v15 = *((_DWORD *)v52 + 1);
        if (v51)
        {
LABEL_24:
          v16 = *((_DWORD *)v51 + 1);
LABEL_25:
          if ((v16 | v15) < 0)
            goto LABEL_101;
          v17 = (v15 + v16);
          if (__OFADD__(v15, v16))
            goto LABEL_101;
          if (v52)
          {
            v18 = *((_DWORD *)v52 + 4);
            v19 = (v18 >> 2) & 1;
            if (v51 && (v18 & 4) != 0)
              goto LABEL_30;
          }
          else
          {
            if (v51)
            {
LABEL_30:
              v19 = (*((unsigned __int8 *)v51 + 16) >> 2) & 1;
              goto LABEL_31;
            }
            v19 = 1;
          }
LABEL_31:
          WTF::tryMakeStringImplFromAdaptersInternal<WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>>(v17, v19, (uint64_t)v52, (uint64_t)v51, &buf);
          v53 = (WTF::StringImpl *)buf;
          if ((_QWORD)buf)
          {
            v21 = v51;
            v51 = 0;
            if (v21)
            {
              if (*(_DWORD *)v21 == 2)
                WTF::StringImpl::destroy(v21, v20);
              else
                *(_DWORD *)v21 -= 2;
            }
            v22 = v52;
            v52 = 0;
            if (v22)
            {
              if (*(_DWORD *)v22 == 2)
                WTF::StringImpl::destroy(v22, v20);
              else
                *(_DWORD *)v22 -= 2;
            }
            v23 = qword_1ECE7CD60;
            v24 = os_log_type_enabled((os_log_t)qword_1ECE7CD60, OS_LOG_TYPE_DEFAULT);
            if ((_DWORD)v24)
            {
              WTF::String::utf8();
              v26 = v49 ? (char *)v49 + 16 : 0;
              LODWORD(buf) = 136446210;
              *(_QWORD *)((char *)&buf + 4) = v26;
              _os_log_impl(&dword_1940B8000, v23, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);
              v24 = (uint64_t)v49;
              v49 = 0;
              if (v24)
              {
                if (*(_DWORD *)v24 == 1)
                  v24 = WTF::fastFree((WTF *)v24, v25);
                else
                  --*(_DWORD *)v24;
              }
            }
            if (WebCore::LogWebRTC)
            {
              v27 = (unsigned __int8 *)MEMORY[0x1E0CBF890];
              while (1)
              {
                v28 = *v27;
                if ((v28 & 1) != 0)
                  break;
                v29 = __ldaxr(v27);
                if (v29 == v28)
                {
                  if (!__stxr(v28 | 1, v27))
                  {
                    v47 = m_objectOfCorrectType;
                    v30 = WTF::Logger::observers((WTF::Logger *)v24);
                    v31 = *(unsigned int *)(v30 + 12);
                    if ((_DWORD)v31)
                    {
                      v32 = *(uint64_t **)v30;
                      v33 = *(_QWORD *)v30 + 8 * v31;
                      do
                      {
                        v34 = *v32;
                        LODWORD(buf) = 0;
                        WTF::Logger::LogSiteIdentifier::toString((WTF::Logger::LogSiteIdentifier *)v48);
                        v55 = 0;
                        if ((objc_opt_respondsToSelector() & 1) != 0)
                          MEMORY[0x19AEA5508](v56, objc_msgSend(v14, "description"));
                        else
                          WTF::LogArgument<void const*>::toString();
                        v49 = 0;
                        v50 = 0;
                        v35 = (WTF::Logger *)WTF::fastMalloc((WTF *)0x20);
                        LODWORD(v50) = 2;
                        v49 = v35;
                        v36 = HIDWORD(v50);
                        *((_DWORD *)v35 + 4 * HIDWORD(v50)) = buf;
                        v37 = *((_QWORD *)&buf + 1);
                        if (*((_QWORD *)&buf + 1))
                          **((_DWORD **)&buf + 1) += 2;
                        *((_QWORD *)v35 + 2 * v36 + 1) = v37;
                        *((_DWORD *)v35 + 4 * (v36 + 1)) = v55;
                        v38 = v56[0];
                        if (v56[0])
                          *(_DWORD *)v56[0] += 2;
                        *((_QWORD *)v35 + 2 * (v36 + 1) + 1) = v38;
                        HIDWORD(v50) = v36 + 2;
                        (*(void (**)(uint64_t, char *, _QWORD, WTF::Logger **))(*(_QWORD *)v34 + 16))(v34, &WebCore::LogWebRTC, 0, &v49);
                        v39 = v49;
                        if (HIDWORD(v50))
                        {
                          v40 = 16 * HIDWORD(v50);
                          v41 = (WTF::StringImpl **)((char *)v49 + 8);
                          do
                          {
                            v42 = *v41;
                            *v41 = 0;
                            if (v42)
                            {
                              if (*(_DWORD *)v42 == 2)
                                WTF::StringImpl::destroy(v42, (WTF::StringImpl *)v25);
                              else
                                *(_DWORD *)v42 -= 2;
                            }
                            v41 += 2;
                            v40 -= 16;
                          }
                          while (v40);
                          v39 = v49;
                        }
                        if (v39)
                        {
                          v49 = 0;
                          LODWORD(v50) = 0;
                          WTF::fastFree(v39, v25);
                        }
                        v43 = v56[0];
                        v56[0] = 0;
                        if (v43)
                        {
                          if (*(_DWORD *)v43 == 2)
                            WTF::StringImpl::destroy(v43, (WTF::StringImpl *)v25);
                          else
                            *(_DWORD *)v43 -= 2;
                        }
                        v44 = (WTF::StringImpl *)*((_QWORD *)&buf + 1);
                        *((_QWORD *)&buf + 1) = 0;
                        if (v44)
                        {
                          if (*(_DWORD *)v44 == 2)
                            WTF::StringImpl::destroy(v44, (WTF::StringImpl *)v25);
                          else
                            *(_DWORD *)v44 -= 2;
                        }
                        ++v32;
                      }
                      while (v32 != (uint64_t *)v33);
                    }
                    v45 = __ldxr(v27);
                    if (v45 == 1)
                    {
                      m_objectOfCorrectType = v47;
                      if (!__stlxr(0, v27))
                        break;
                    }
                    else
                    {
                      __clrex();
                      m_objectOfCorrectType = v47;
                    }
                    WTF::Lock::unlockSlow(MEMORY[0x1E0CBF890]);
                    break;
                  }
                }
                else
                {
                  __clrex();
                }
              }
            }
            v46 = v53;
            v53 = 0;
            if (v46)
            {
              if (*(_DWORD *)v46 == 2)
                WTF::StringImpl::destroy(v46, (WTF::StringImpl *)v25);
              else
                *(_DWORD *)v46 -= 2;
            }
            goto LABEL_89;
          }
LABEL_101:
          __break(0xC471u);
          return;
        }
      }
      else
      {
        v15 = 0;
        if (v51)
          goto LABEL_24;
      }
      v16 = 0;
      goto LABEL_25;
    }
  }
LABEL_89:
  *((_BYTE *)m_objectOfCorrectType + 1160) = 1;
  if (a3)
    CFRelease(a3);
  WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::RealtimeVideoCaptureSource,(WTF::DestructionThread)2>(*((unsigned __int8 **)m_objectOfCorrectType + 38));
}

- (void)endSessionInterrupted:(id)a3
{
  ThreadSafeWeakPtrControlBlock *m_ptr;
  AVVideoCaptureSource *m_objectOfCorrectType;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];

  m_ptr = self->m_captureSource.m_controlBlock.m_ptr;
  if (!m_ptr)
    return;
  m_objectOfCorrectType = self->m_captureSource.m_objectOfCorrectType;
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
  v7 = __ldxr((unsigned __int8 *)m_ptr);
  if (v7 == 1)
  {
    if (!__stlxr(0, (unsigned __int8 *)m_ptr))
    {
      if (!m_objectOfCorrectType)
        return;
      goto LABEL_15;
    }
  }
  else
  {
    __clrex();
  }
  WTF::Lock::unlockSlow((WTF::Lock *)m_ptr);
  if (!m_objectOfCorrectType)
    return;
LABEL_15:
  if (a3)
    CFRetain(a3);
  v8 = *((_QWORD *)m_objectOfCorrectType + 5);
  if (v8)
  {
    v9 = (*(uint64_t (**)(AVVideoCaptureSource *, SEL))(*(_QWORD *)m_objectOfCorrectType + 24))(m_objectOfCorrectType, a2);
    v10 = *((_QWORD *)m_objectOfCorrectType + 6);
    v12[0] = v9;
    v12[1] = v11;
    v12[2] = "captureSessionEndInterruption";
    v12[3] = v10;
    if (*(_BYTE *)(v8 + 12))
      WTF::Logger::log<WTF::Logger::LogSiteIdentifier>((uint64_t)&WebCore::LogWebRTC, 0, (WTF::Logger::LogSiteIdentifier *)v12);
  }
  *((_BYTE *)m_objectOfCorrectType + 1160) = 0;
  if (a3)
    CFRelease(a3);
  WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::RealtimeVideoCaptureSource,(WTF::DestructionThread)2>(*((unsigned __int8 **)m_objectOfCorrectType + 38));
}

- (void).cxx_destruct
{
  ThreadSafeWeakPtrControlBlock *m_ptr;
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;

  m_ptr = self->m_captureSource.m_controlBlock.m_ptr;
  self->m_captureSource.m_controlBlock.m_ptr = 0;
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
