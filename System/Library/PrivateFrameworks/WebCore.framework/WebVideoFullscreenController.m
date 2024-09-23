@implementation WebVideoFullscreenController

- (WebVideoFullscreenController)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WebVideoFullscreenController;
  return -[WebVideoFullscreenController init](&v3, sel_init);
}

- (void)setVideoElement:(NakedPtr<WebCore::HTMLVideoElement>)a3
{
  uint64_t v4;
  HTMLVideoElement *m_ptr;

  v4 = *(_QWORD *)a3.var0;
  if (*(_QWORD *)a3.var0)
    *(_DWORD *)(v4 + 24) += 2;
  m_ptr = self->_videoElement.m_ptr;
  self->_videoElement.m_ptr = (HTMLVideoElement *)v4;
  if (m_ptr)
  {
    if (*((_DWORD *)m_ptr + 6) == 2)
    {
      if ((*((_WORD *)m_ptr + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef((WebCore::Node *)m_ptr, (void *)a2);
    }
    else
    {
      *((_DWORD *)m_ptr + 6) -= 2;
    }
  }
}

- (NakedPtr<WebCore::HTMLVideoElement>)videoElement
{
  HTMLVideoElement **v2;

  *v2 = self->_videoElement.m_ptr;
  return (NakedPtr<WebCore::HTMLVideoElement>)self;
}

- (void)enterFullscreen:(id)a3 mode:(unsigned int)a4
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  VideoFullscreenControllerContext *m_ptr;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  int v17;
  VideoFullscreenControllerContext *v18;
  void *v19;
  const void *v20;
  HTMLVideoElement *v21;
  VideoFullscreenControllerContext *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  BOOL v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  WebCore::HTMLVideoElement *v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unsigned __int8 *v45;
  uint64_t v46;
  float v47;
  unsigned int v48;
  uint64_t v49;
  float v50;
  unsigned int v51;
  uint64_t v52;
  int v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD v59[3];
  uint64_t v60;

  v7 = WTF::fastMalloc((WTF *)0x88);
  v8 = WTF::fastMalloc((WTF *)0x20);
  *(_BYTE *)v8 = 0;
  *(_OWORD *)(v8 + 8) = xmmword_19689B170;
  *(_QWORD *)(v8 + 24) = v7;
  *(_DWORD *)(v7 + 64) = 0;
  *(_QWORD *)v7 = off_1E3486F48;
  *(_QWORD *)(v7 + 8) = v8;
  *(_QWORD *)(v7 + 16) = &unk_1E34872A0;
  *(_QWORD *)(v7 + 24) = 0;
  *(_QWORD *)(v7 + 32) = &unk_1E3487328;
  *(_QWORD *)(v7 + 40) = 0;
  *(_QWORD *)(v7 + 48) = &unk_1E3487538;
  *(_QWORD *)(v7 + 56) = 0;
  *(_OWORD *)(v7 + 72) = 0u;
  *(_OWORD *)(v7 + 88) = 0u;
  *(_OWORD *)(v7 + 104) = 0u;
  *(_OWORD *)(v7 + 120) = 0u;
  m_ptr = self->_context.m_ptr;
  self->_context.m_ptr = (VideoFullscreenControllerContext *)v7;
  if (!m_ptr)
    goto LABEL_18;
  v11 = *((_QWORD *)m_ptr + 1);
  if (__ldaxr((unsigned __int8 *)v11))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)v11))
  {
    goto LABEL_6;
  }
  MEMORY[0x19AEA534C](v11);
LABEL_6:
  v13 = *(_QWORD *)(v11 + 8);
  v14 = v13 - 1;
  *(_QWORD *)(v11 + 8) = v13 - 1;
  if (v13 == 1)
  {
    v57 = *(_QWORD *)(v11 + 16);
    v15 = *(_QWORD *)(v11 + 24);
    *(_QWORD *)(v11 + 24) = 0;
    v16 = v57 != 0;
  }
  else
  {
    v15 = 0;
    v16 = 1;
  }
  v17 = __ldxr((unsigned __int8 *)v11);
  if (v17 != 1)
  {
    __clrex();
LABEL_13:
    WTF::Lock::unlockSlow((WTF::Lock *)v11);
    if (v14)
      goto LABEL_18;
    goto LABEL_14;
  }
  if (__stlxr(0, (unsigned __int8 *)v11))
    goto LABEL_13;
  if (v14)
    goto LABEL_18;
LABEL_14:
  if (v15)
    (*(void (**)(uint64_t))(*(_QWORD *)v15 + 8))(v15);
  if (!v16)
    WTF::fastFree((WTF *)v11, v9);
LABEL_18:
  v18 = self->_context.m_ptr;
  CFRetain(self);
  v20 = (const void *)*((_QWORD *)v18 + 16);
  *((_QWORD *)v18 + 16) = self;
  if (v20)
    CFRelease(v20);
  v22 = self->_context.m_ptr;
  v21 = self->_videoElement.m_ptr;
  if (a3)
    CFRetain(a3);
  *((_DWORD *)v21 + 6) += 2;
  v23 = *((_QWORD *)v22 + 14);
  *((_QWORD *)v22 + 14) = v21;
  if (v23)
  {
    if (*(_DWORD *)(v23 + 24) == 2)
    {
      if ((*(_WORD *)(v23 + 30) & 0x400) == 0)
        WebCore::Node::removedLastRef((WebCore::Node *)v23, v19);
    }
    else
    {
      *(_DWORD *)(v23 + 24) -= 2;
    }
  }
  v24 = WTF::fastMalloc((WTF *)0x70);
  *(_DWORD *)(v24 + 32) = 1;
  *(_BYTE *)(v24 + 36) = 3;
  *(_DWORD *)(v24 + 40) = 0;
  *(_QWORD *)v24 = off_1E333FD30;
  *(_QWORD *)(v24 + 8) = 0;
  *(_QWORD *)(v24 + 16) = &unk_1E333FF48;
  *(_QWORD *)(v24 + 24) = 0;
  *(_QWORD *)(v24 + 48) = 0;
  *(_BYTE *)(v24 + 56) = 0;
  *(_OWORD *)(v24 + 64) = 0u;
  *(_OWORD *)(v24 + 80) = 0u;
  *(_OWORD *)(v24 + 89) = 0u;
  v25 = *((_QWORD *)v22 + 13);
  *((_QWORD *)v22 + 13) = v24;
  if (v25)
  {
    if (*(_DWORD *)(v25 + 32) == 1)
    {
      (*(void (**)(uint64_t))(*(_QWORD *)(v25 + 16) + 8))(v25 + 16);
      v24 = *((_QWORD *)v22 + 13);
    }
    else
    {
      --*(_DWORD *)(v25 + 32);
    }
  }
  v26 = *((_QWORD *)v22 + 6);
  v60 = (uint64_t)v22 + 48;
  (*(void (**)(void))(v26 + 32))();
  WTF::HashTable<WTF::CheckedPtr<WebCore::PlaybackSessionModelClient,WTF::RawPtrTraits<WebCore::PlaybackSessionModelClient>>,WTF::CheckedPtr<WebCore::PlaybackSessionModelClient,WTF::RawPtrTraits<WebCore::PlaybackSessionModelClient>>,WTF::IdentityExtractor,WTF::DefaultHash<WTF::CheckedPtr<WebCore::PlaybackSessionModelClient,WTF::RawPtrTraits<WebCore::PlaybackSessionModelClient>>>,WTF::HashTraits<WTF::CheckedPtr<WebCore::PlaybackSessionModelClient,WTF::RawPtrTraits<WebCore::PlaybackSessionModelClient>>>,WTF::HashTraits<WTF::CheckedPtr<WebCore::PlaybackSessionModelClient,WTF::RawPtrTraits<WebCore::PlaybackSessionModelClient>>>>::add((uint64_t *)(v24 + 64), &v60, (uint64_t)v59);
  if (v60)
    (*(void (**)(uint64_t))(*(_QWORD *)v60 + 40))(v60);
  WebCore::PlaybackSessionModelMediaElement::setMediaElement(*((WebCore::EventNames ***)v22 + 13), *((WebCore::HTMLMediaElement **)v22 + 14));
  v27 = WTF::fastMalloc((WTF *)0x90);
  v28 = WTF::fastMalloc((WTF *)0x20);
  *(_BYTE *)v28 = 0;
  *(_OWORD *)(v28 + 8) = xmmword_19689B170;
  *(_QWORD *)(v28 + 24) = v27;
  *(_QWORD *)v27 = off_1E3348210;
  *(_QWORD *)(v27 + 8) = v28;
  WebCore::VideoPresentationModelVideoElement::VideoListener::create((WebCore::VideoPresentationModelVideoElement::VideoListener *)v27, (uint64_t *)(v27 + 16));
  *(_QWORD *)(v27 + 48) = 0;
  *(_WORD *)(v27 + 56) = 256;
  *(_QWORD *)(v27 + 24) = 0;
  *(_QWORD *)(v27 + 32) = 0;
  *(_BYTE *)(v27 + 40) = 0;
  *(_BYTE *)(v27 + 128) = 0;
  *(_QWORD *)(v27 + 136) = 0;
  *(_QWORD *)(v27 + 60) = 0;
  *(_QWORD *)(v27 + 76) = 0;
  *(_QWORD *)(v27 + 68) = 0;
  *(_OWORD *)(v27 + 88) = 0u;
  *(_OWORD *)(v27 + 104) = 0u;
  *(_BYTE *)(v27 + 120) = 0;
  v30 = *((_QWORD *)v22 + 12);
  *((_QWORD *)v22 + 12) = v27;
  if (v30)
  {
    v31 = *(_QWORD *)(v30 + 8);
    if (__ldaxr((unsigned __int8 *)v31))
    {
      __clrex();
    }
    else if (!__stxr(1u, (unsigned __int8 *)v31))
    {
      goto LABEL_35;
    }
    MEMORY[0x19AEA534C](v31);
LABEL_35:
    v33 = *(_QWORD *)(v31 + 8);
    v34 = v33 - 1;
    *(_QWORD *)(v31 + 8) = v33 - 1;
    if (v33 == 1)
    {
      v58 = *(_QWORD *)(v31 + 16);
      v35 = *(_QWORD *)(v31 + 24);
      *(_QWORD *)(v31 + 24) = 0;
      v36 = v58 != 0;
    }
    else
    {
      v35 = 0;
      v36 = 1;
    }
    v37 = __ldxr((unsigned __int8 *)v31);
    if (v37 == 1)
    {
      if (!__stlxr(0, (unsigned __int8 *)v31))
      {
        if (v34)
          goto LABEL_47;
LABEL_43:
        if (v35)
          (*(void (**)(uint64_t))(*(_QWORD *)v35 + 8))(v35);
        if (!v36)
          WTF::fastFree((WTF *)v31, v29);
        goto LABEL_47;
      }
    }
    else
    {
      __clrex();
    }
    WTF::Lock::unlockSlow((WTF::Lock *)v31);
    if (v34)
      goto LABEL_47;
    goto LABEL_43;
  }
LABEL_47:
  v38 = *((_QWORD *)v22 + 12);
  v39 = *((_QWORD *)v22 + 2);
  v60 = (uint64_t)v22 + 16;
  (*(void (**)(void))(v39 + 32))();
  WTF::HashTable<WTF::CheckedPtr<WebCore::PlaybackSessionModelClient,WTF::RawPtrTraits<WebCore::PlaybackSessionModelClient>>,WTF::CheckedPtr<WebCore::PlaybackSessionModelClient,WTF::RawPtrTraits<WebCore::PlaybackSessionModelClient>>,WTF::IdentityExtractor,WTF::DefaultHash<WTF::CheckedPtr<WebCore::PlaybackSessionModelClient,WTF::RawPtrTraits<WebCore::PlaybackSessionModelClient>>>,WTF::HashTraits<WTF::CheckedPtr<WebCore::PlaybackSessionModelClient,WTF::RawPtrTraits<WebCore::PlaybackSessionModelClient>>>,WTF::HashTraits<WTF::CheckedPtr<WebCore::PlaybackSessionModelClient,WTF::RawPtrTraits<WebCore::PlaybackSessionModelClient>>>>::add((uint64_t *)(v38 + 48), &v60, (uint64_t)v59);
  if (v60)
    (*(void (**)(uint64_t))(*(_QWORD *)v60 + 40))(v60);
  WebCore::VideoPresentationModelVideoElement::setVideoElement(*((WebCore::VideoPresentationModelVideoElement **)v22 + 12), *((WebCore::HTMLVideoElement **)v22 + 14));
  v40 = (WebCore::HTMLVideoElement *)*((_QWORD *)v22 + 14);
  if (HIBYTE(WebCore::isPictureInPictureSupported))
  {
    if ((_BYTE)WebCore::isPictureInPictureSupported)
    {
LABEL_51:
      v41 = WebCore::HTMLVideoElement::supportsFullscreen(v40, 2);
      goto LABEL_54;
    }
  }
  else if (-[objc_class isPictureInPictureSupported](getAVPictureInPictureControllerClass(), "isPictureInPictureSupported"))
  {
    goto LABEL_51;
  }
  v41 = 0;
LABEL_54:
  v42 = elementRectInWindow(*((WebCore::HTMLVideoElement **)v22 + 14));
  v44 = v43;
  v45 = WebCore::VideoPresentationModelVideoElement::setVideoLayerFrame(*((_QWORD *)v22 + 12), 0.0, 0.0, (float)(int)v43, (float)SHIDWORD(v43));
  v46 = *((_QWORD *)v21 + 142);
  if (!v46)
  {
    v48 = 0;
LABEL_63:
    v51 = 0;
    goto LABEL_64;
  }
  v47 = (*(float (**)(_QWORD))(**(_QWORD **)(v46 + 72) + 288))(*(_QWORD *)(v46 + 72));
  if (v47 >= 4294967300.0)
  {
    v48 = -1;
  }
  else if (v47 <= 0.0)
  {
    v48 = 0;
  }
  else
  {
    v48 = v47;
  }
  v49 = *((_QWORD *)v21 + 142);
  if (!v49)
    goto LABEL_63;
  v45 = (unsigned __int8 *)(*(uint64_t (**)(_QWORD))(**(_QWORD **)(v49 + 72) + 288))(*(_QWORD *)(v49 + 72));
  if (v50 < 4294967300.0)
  {
    if (v50 > 0.0)
    {
      v51 = v50;
      goto LABEL_64;
    }
    goto LABEL_63;
  }
  v51 = -1;
LABEL_64:
  WTF::RunLoop::main((WTF::RunLoop *)v45);
  v52 = *((_QWORD *)v22 + 1);
  if (__ldaxr((unsigned __int8 *)v52))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)v52))
  {
    goto LABEL_68;
  }
  MEMORY[0x19AEA534C](v52);
LABEL_68:
  ++*(_QWORD *)(v52 + 8);
  v54 = __ldxr((unsigned __int8 *)v52);
  if (v54 != 1)
  {
    __clrex();
LABEL_73:
    WTF::Lock::unlockSlow((WTF::Lock *)v52);
    if (!a3)
      goto LABEL_75;
    goto LABEL_74;
  }
  if (__stlxr(0, (unsigned __int8 *)v52))
    goto LABEL_73;
  if (a3)
LABEL_74:
    CFRetain(a3);
LABEL_75:
  v55 = WTF::fastMalloc((WTF *)0x40);
  *(_QWORD *)v55 = &off_1E34879D8;
  *(_QWORD *)(v55 + 8) = v22;
  *(_QWORD *)(v55 + 16) = v22;
  *(_QWORD *)(v55 + 24) = v42;
  *(_QWORD *)(v55 + 32) = v44;
  *(_QWORD *)(v55 + 40) = COERCE_UNSIGNED_INT((float)v48) | ((unint64_t)COERCE_UNSIGNED_INT((float)v51) << 32);
  *(_QWORD *)(v55 + 48) = a3;
  *(_DWORD *)(v55 + 56) = a4;
  *(_BYTE *)(v55 + 60) = v41;
  v59[0] = v55;
  WTF::RunLoop::dispatch();
  v56 = v59[0];
  v59[0] = 0;
  if (v56)
    (*(void (**)(uint64_t))(*(_QWORD *)v56 + 8))(v56);
  if (a3)
    CFRelease(a3);
}

- (void)exitFullscreen
{
  VideoFullscreenControllerContext::exitFullscreen(self->_context.m_ptr);
}

- (void)requestHideAndExitFullscreen
{
  VideoFullscreenControllerContext *m_ptr;

  m_ptr = self->_context.m_ptr;
  if (m_ptr)
    (*(void (**)(_QWORD))(**((_QWORD **)m_ptr + 11) + 160))(*((_QWORD *)m_ptr + 11));
}

- (void)didFinishFullscreen:(void *)a3
{
  VideoFullscreenControllerContext *m_ptr;
  const void *v5;
  VideoFullscreenControllerContext *v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  int v13;
  HTMLVideoElement *v14;
  uint64_t v15;

  if (self)
    CFRetain(self);
  m_ptr = self->_context.m_ptr;
  v5 = (const void *)*((_QWORD *)m_ptr + 16);
  *((_QWORD *)m_ptr + 16) = 0;
  if (v5)
    CFRelease(v5);
  v6 = self->_context.m_ptr;
  self->_context.m_ptr = 0;
  if (v6)
  {
    v7 = *((_QWORD *)v6 + 1);
    if (__ldaxr((unsigned __int8 *)v7))
    {
      __clrex();
    }
    else if (!__stxr(1u, (unsigned __int8 *)v7))
    {
      goto LABEL_10;
    }
    MEMORY[0x19AEA534C](v7, a2, a3);
LABEL_10:
    v9 = *(_QWORD *)(v7 + 8);
    v10 = v9 - 1;
    *(_QWORD *)(v7 + 8) = v9 - 1;
    if (v9 == 1)
    {
      v15 = *(_QWORD *)(v7 + 16);
      v11 = *(_QWORD *)(v7 + 24);
      *(_QWORD *)(v7 + 24) = 0;
      v12 = v15 != 0;
    }
    else
    {
      v11 = 0;
      v12 = 1;
    }
    v13 = __ldxr((unsigned __int8 *)v7);
    if (v13 == 1)
    {
      if (!__stlxr(0, (unsigned __int8 *)v7))
      {
        if (v10)
          goto LABEL_22;
LABEL_18:
        if (v11)
          (*(void (**)(uint64_t, SEL, void *))(*(_QWORD *)v11 + 8))(v11, a2, a3);
        if (!v12)
          WTF::fastFree((WTF *)v7, (void *)a2);
        goto LABEL_22;
      }
    }
    else
    {
      __clrex();
    }
    WTF::Lock::unlockSlow((WTF::Lock *)v7);
    if (v10)
      goto LABEL_22;
    goto LABEL_18;
  }
LABEL_22:
  v14 = self->_videoElement.m_ptr;
  self->_videoElement.m_ptr = 0;
  if (v14)
  {
    if (*((_DWORD *)v14 + 6) == 2)
    {
      if ((*((_WORD *)v14 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef((WebCore::Node *)v14, (void *)a2);
    }
    else
    {
      *((_DWORD *)v14 + 6) -= 2;
    }
  }
  CFRelease(self);
}

- (void).cxx_destruct
{
  HTMLVideoElement *m_ptr;
  VideoFullscreenControllerContext *v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  int v11;
  uint64_t v12;

  m_ptr = self->_videoElement.m_ptr;
  self->_videoElement.m_ptr = 0;
  if (m_ptr)
  {
    if (*((_DWORD *)m_ptr + 6) == 2)
    {
      if ((*((_WORD *)m_ptr + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef((WebCore::Node *)m_ptr, (void *)a2);
    }
    else
    {
      *((_DWORD *)m_ptr + 6) -= 2;
    }
  }
  v4 = self->_context.m_ptr;
  self->_context.m_ptr = 0;
  if (v4)
  {
    v5 = *((_QWORD *)v4 + 1);
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
    v7 = *(_QWORD *)(v5 + 8);
    v8 = v7 - 1;
    *(_QWORD *)(v5 + 8) = v7 - 1;
    if (v7 == 1)
    {
      v12 = *(_QWORD *)(v5 + 16);
      v9 = *(_QWORD *)(v5 + 24);
      *(_QWORD *)(v5 + 24) = 0;
      v10 = v12 != 0;
    }
    else
    {
      v9 = 0;
      v10 = 1;
    }
    v11 = __ldxr((unsigned __int8 *)v5);
    if (v11 == 1)
    {
      if (!__stlxr(0, (unsigned __int8 *)v5))
      {
        if (v8)
          return;
LABEL_17:
        if (v9)
          (*(void (**)(uint64_t, SEL))(*(_QWORD *)v9 + 8))(v9, a2);
        if (!v10)
          WTF::fastFree((WTF *)v5, (void *)a2);
        return;
      }
    }
    else
    {
      __clrex();
    }
    WTF::Lock::unlockSlow((WTF::Lock *)v5);
    if (v8)
      return;
    goto LABEL_17;
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
