@implementation WebCoreAVFMovieObserver

- (WebCoreAVFMovieObserver)initWithPlayer:(void *)a3
{
  WebCoreAVFMovieObserver *v4;
  void *v5;
  WebCoreAVFMovieObserver *v6;
  ThreadSafeWeakPtrControlBlock *v7;
  ThreadSafeWeakPtrControlBlock *m_ptr;
  uint64_t v10;
  uint64_t v11;
  int v12;
  MediaPlayerPrivateAVFoundationObjC *v13;
  WorkQueue *v14;
  int v16;
  WorkQueue *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)WebCoreAVFMovieObserver;
  v4 = -[WebCoreAVFMovieObserver init](&v18, sel_init);
  v6 = v4;
  if (!v4)
    return v6;
  v7 = *(ThreadSafeWeakPtrControlBlock **)a3;
  *(_QWORD *)a3 = 0;
  m_ptr = v4->m_player.m_controlBlock.m_ptr;
  v4->m_player.m_controlBlock.m_ptr = v7;
  if (m_ptr)
  {
    if (__ldaxr((unsigned __int8 *)m_ptr))
    {
      __clrex();
    }
    else if (!__stxr(1u, (unsigned __int8 *)m_ptr))
    {
      goto LABEL_7;
    }
    MEMORY[0x19AEA534C](m_ptr);
LABEL_7:
    v10 = *((_QWORD *)m_ptr + 2) - 1;
    *((_QWORD *)m_ptr + 2) = v10;
    if (!v10)
    {
      v11 = *((_QWORD *)m_ptr + 1);
      v12 = __ldxr((unsigned __int8 *)m_ptr);
      if (v12 == 1)
      {
        if (!__stlxr(0, (unsigned __int8 *)m_ptr))
        {
          if (v11)
            goto LABEL_15;
LABEL_14:
          WTF::fastFree((WTF *)m_ptr, v5);
          goto LABEL_15;
        }
      }
      else
      {
        __clrex();
      }
      WTF::Lock::unlockSlow((WTF::Lock *)m_ptr);
      if (v11)
        goto LABEL_15;
      goto LABEL_14;
    }
    v16 = __ldxr((unsigned __int8 *)m_ptr);
    if (v16 == 1)
    {
      if (!__stlxr(0, (unsigned __int8 *)m_ptr))
        goto LABEL_15;
    }
    else
    {
      __clrex();
    }
    WTF::Lock::unlockSlow((WTF::Lock *)m_ptr);
  }
LABEL_15:
  v13 = (MediaPlayerPrivateAVFoundationObjC *)*((_QWORD *)a3 + 1);
  *((_QWORD *)a3 + 1) = 0;
  v6->m_player.m_objectOfCorrectType = v13;
  WTF::WorkQueue::create();
  v14 = v6->m_backgroundQueue.m_ptr;
  v6->m_backgroundQueue.m_ptr = v17;
  if (v14)
    (*(void (**)(WorkQueue *))(*(_QWORD *)v14 + 56))(v14);
  return v6;
}

- (void)disconnect
{
  ThreadSafeWeakPtrControlBlock *m_ptr;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;

  m_ptr = self->m_player.m_controlBlock.m_ptr;
  self->m_player.m_controlBlock.m_ptr = 0;
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
  MEMORY[0x19AEA534C](m_ptr, a2);
LABEL_6:
  v5 = *((_QWORD *)m_ptr + 2) - 1;
  *((_QWORD *)m_ptr + 2) = v5;
  if (v5)
  {
    v8 = __ldxr((unsigned __int8 *)m_ptr);
    if (v8 == 1)
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
  v6 = *((_QWORD *)m_ptr + 1);
  v7 = __ldxr((unsigned __int8 *)m_ptr);
  if (v7 == 1)
  {
    if (!__stlxr(0, (unsigned __int8 *)m_ptr))
    {
      if (!v6)
        goto LABEL_13;
      goto LABEL_14;
    }
  }
  else
  {
    __clrex();
  }
  WTF::Lock::unlockSlow((WTF::Lock *)m_ptr);
  if (!v6)
LABEL_13:
    WTF::fastFree((WTF *)m_ptr, (void *)a2);
LABEL_14:
  self->m_player.m_objectOfCorrectType = 0;
}

- (void)metadataLoaded
{
  _QWORD *v3;
  _QWORD *v4;

  if (self)
    CFRetain(self);
  v3 = (_QWORD *)WTF::fastMalloc((WTF *)0x18);
  *v3 = &off_1E3204EC8;
  v3[1] = self;
  v3[2] = self;
  v4 = v3;
  WTF::ensureOnMainThread();
  if (v4)
    (*(void (**)(_QWORD *))(*v4 + 8))(v4);
}

- (void)didEnd:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  if (self)
    CFRetain(self);
  v4 = (_QWORD *)WTF::fastMalloc((WTF *)0x18);
  *v4 = &off_1E3204F18;
  v4[1] = self;
  v4[2] = self;
  v5 = v4;
  WTF::ensureOnMainThread();
  if (v5)
    (*(void (**)(_QWORD *))(*v5 + 8))(v5);
}

- (void)chapterMetadataDidChange:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  if (self)
    CFRetain(self);
  v4 = (_QWORD *)WTF::fastMalloc((WTF *)0x18);
  *v4 = &off_1E3204F68;
  v4[1] = self;
  v4[2] = self;
  v5 = v4;
  WTF::ensureOnMainThread();
  if (v5)
    (*(void (**)(_QWORD *))(*v5 + 8))(v5);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(int)a6
{
  const void *v11;
  const void *v12;
  WorkQueue *m_ptr;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;

  if (self)
    CFRetain(self);
  if (!a6 && objc_msgSend(a3, "isEqualToString:", CFSTR("seekableTimeRanges")))
  {
    v11 = (const void *)objc_msgSend(a5, "valueForKey:", *MEMORY[0x1E0CB2CB8]);
    v12 = v11;
    if (v11)
      CFRetain(v11);
    m_ptr = self->m_backgroundQueue.m_ptr;
    if (a4)
      CFRetain(a4);
    CFRetain(self);
    v14 = (_QWORD *)WTF::fastMalloc((WTF *)0x28);
    *v14 = &off_1E3204FB8;
    v14[1] = v12;
    v14[2] = a4;
    v14[3] = self;
    v14[4] = self;
    v19 = v14;
    (*(void (**)(WorkQueue *, _QWORD **))(*(_QWORD *)m_ptr + 32))(m_ptr, &v19);
    v15 = v19;
    v19 = 0;
    if (v15)
      (*(void (**)(_QWORD *))(*v15 + 8))(v15);
  }
  if (a3)
    CFRetain(a3);
  if (a5)
    CFRetain(a5);
  if (a4)
    CFRetain(a4);
  v16 = WTF::fastMalloc((WTF *)0x28);
  *(_QWORD *)v16 = &off_1E3205008;
  *(_QWORD *)(v16 + 8) = a3;
  *(_QWORD *)(v16 + 16) = a5;
  *(_QWORD *)(v16 + 24) = a4;
  *(_DWORD *)(v16 + 32) = a6;
  v17 = (_QWORD *)WTF::fastMalloc((WTF *)0x20);
  *v17 = &off_1E3204B68;
  v17[1] = self;
  v17[2] = self;
  v17[3] = v16;
  v19 = v17;
  WTF::ensureOnMainThread();
  v18 = v19;
  v19 = 0;
  if (v18)
    (*(void (**)(_QWORD *))(*v18 + 8))(v18);
}

- (void)legibleOutput:(id)a3 didOutputAttributedStrings:(id)a4 nativeSampleBuffers:(id)a5 forItemTime:(id *)a6
{
  uint64_t v10;
  __int128 v11;
  int64_t var3;
  uint64_t v13;

  if (self)
    CFRetain(self);
  if (a4)
    CFRetain(a4);
  if (a5)
    CFRetain(a5);
  v11 = *(_OWORD *)&a6->var0;
  var3 = a6->var3;
  v10 = WTF::fastMalloc((WTF *)0x40);
  *(_QWORD *)v10 = &off_1E3205030;
  *(_QWORD *)(v10 + 8) = self;
  *(_QWORD *)(v10 + 16) = self;
  *(_QWORD *)(v10 + 24) = a4;
  *(_QWORD *)(v10 + 32) = a5;
  *(_OWORD *)(v10 + 40) = v11;
  *(_QWORD *)(v10 + 56) = var3;
  v13 = v10;
  WTF::ensureOnMainThread();
  if (v13)
    (*(void (**)(uint64_t))(*(_QWORD *)v13 + 8))(v13);
}

- (void)outputSequenceWasFlushed:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  if (self)
    CFRetain(self);
  v4 = (_QWORD *)WTF::fastMalloc((WTF *)0x18);
  *v4 = &off_1E3205080;
  v4[1] = self;
  v4[2] = self;
  v5 = v4;
  WTF::ensureOnMainThread();
  if (v5)
    (*(void (**)(_QWORD *))(*v5 + 8))(v5);
}

- (void)metadataOutput:(id)a3 didOutputTimedMetadataGroups:(id)a4 fromPlayerItemTrack:(id)a5
{
  ThreadSafeWeakPtrControlBlock *m_ptr;
  MediaPlayerPrivateAVFoundationObjC *m_objectOfCorrectType;
  int v9;
  uint64_t v10;
  int v12;
  uint64_t v13;
  uint64_t (**v14)();
  uint64_t (**v15)();
  uint64_t (***v16)();
  uint64_t (**v17)();
  uint64_t v18;
  uint64_t v19;
  int v21;
  uint64_t (***v22)();
  uint64_t (***v23)();

  if (a4)
  {
    m_ptr = self->m_player.m_controlBlock.m_ptr;
    if (m_ptr)
    {
      m_objectOfCorrectType = self->m_player.m_objectOfCorrectType;
      if (__ldaxr((unsigned __int8 *)m_ptr))
      {
        __clrex();
      }
      else if (!__stxr(1u, (unsigned __int8 *)m_ptr))
      {
        goto LABEL_7;
      }
      MEMORY[0x19AEA534C](m_ptr, a2, a3);
LABEL_7:
      if (*((_QWORD *)m_ptr + 3))
        ++*((_QWORD *)m_ptr + 1);
      else
        m_objectOfCorrectType = 0;
      v9 = __ldxr((unsigned __int8 *)m_ptr);
      if (v9 == 1)
      {
        if (!__stlxr(0, (unsigned __int8 *)m_ptr))
        {
          if (!m_objectOfCorrectType)
            return;
LABEL_16:
          v10 = *((_QWORD *)m_objectOfCorrectType + 6);
          if (__ldaxr((unsigned __int8 *)v10))
          {
            __clrex();
          }
          else if (!__stxr(1u, (unsigned __int8 *)v10))
          {
            goto LABEL_20;
          }
          MEMORY[0x19AEA534C](v10, a2, a3);
LABEL_20:
          ++*(_QWORD *)(v10 + 8);
          v12 = __ldxr((unsigned __int8 *)v10);
          if (v12 == 1)
          {
            if (!__stlxr(0, (unsigned __int8 *)v10))
            {
LABEL_25:
              CFRetain(a4);
              v13 = WebCore::MediaPlayerPrivateAVFoundationObjC::currentTime((WebCore::MediaPlayerPrivateAVFoundationObjC *)m_objectOfCorrectType);
              v15 = v14;
              v16 = (uint64_t (***)())WTF::fastMalloc((WTF *)0x28);
              v17 = &off_1E32050D0;
              *v16 = &off_1E32050D0;
              v16[1] = (uint64_t (**)())m_objectOfCorrectType;
              v16[2] = (uint64_t (**)())a4;
              v16[3] = (uint64_t (**)())v13;
              v16[4] = v15;
              v23 = v16;
              v18 = *((_QWORD *)m_objectOfCorrectType + 11);
              if (!v18)
              {
                v23 = 0;
                goto LABEL_43;
              }
              v19 = *((_QWORD *)m_objectOfCorrectType + 12);
              if (__ldaxr((unsigned __int8 *)v18))
              {
                __clrex();
              }
              else if (!__stxr(1u, (unsigned __int8 *)v18))
              {
                goto LABEL_31;
              }
              MEMORY[0x19AEA534C](v18);
LABEL_31:
              if (*(_QWORD *)(v18 + 24))
                ++*(_QWORD *)(v18 + 8);
              else
                v19 = 0;
              v21 = __ldxr((unsigned __int8 *)v18);
              if (v21 == 1)
              {
                if (!__stlxr(0, (unsigned __int8 *)v18))
                  goto LABEL_39;
              }
              else
              {
                __clrex();
              }
              WTF::Lock::unlockSlow((WTF::Lock *)v18);
LABEL_39:
              if (v19)
              {
                (*(void (**)(_QWORD, uint64_t (****)()))(**(_QWORD **)(*(_QWORD *)(v19 + 8) + 8)
                                                                            + 592))(*(_QWORD *)(*(_QWORD *)(v19 + 8) + 8), &v23);
                WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::MediaPlayer,(WTF::DestructionThread)1>(*(unsigned __int8 **)v19);
              }
              v22 = v23;
              v23 = 0;
              if (!v22)
                goto LABEL_44;
              v17 = *v22;
LABEL_43:
              v17[1]();
LABEL_44:
              WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::MediaPlayerPrivateAVFoundation,(WTF::DestructionThread)1>(*((unsigned __int8 **)m_objectOfCorrectType + 6));
              return;
            }
          }
          else
          {
            __clrex();
          }
          WTF::Lock::unlockSlow((WTF::Lock *)v10);
          goto LABEL_25;
        }
      }
      else
      {
        __clrex();
      }
      WTF::Lock::unlockSlow((WTF::Lock *)m_ptr);
      if (!m_objectOfCorrectType)
        return;
      goto LABEL_16;
    }
  }
}

- (void)metadataCollector:(id)a3 didCollectDateRangeMetadataGroups:(id)a4 indexesOfNewGroups:(id)a5 indexesOfModifiedGroups:(id)a6
{
  ThreadSafeWeakPtrControlBlock *m_ptr;
  MediaPlayerPrivateAVFoundationObjC *m_objectOfCorrectType;
  int v10;
  uint64_t v11;
  int v13;
  uint64_t v14;
  uint64_t (**v15)();
  uint64_t (**v16)();
  uint64_t (***v17)();
  uint64_t (**v18)();
  uint64_t v19;
  uint64_t v20;
  int v22;
  uint64_t (***v23)();
  uint64_t (***v24)();

  if (a4)
  {
    m_ptr = self->m_player.m_controlBlock.m_ptr;
    if (m_ptr)
    {
      m_objectOfCorrectType = self->m_player.m_objectOfCorrectType;
      if (__ldaxr((unsigned __int8 *)m_ptr))
      {
        __clrex();
      }
      else if (!__stxr(1u, (unsigned __int8 *)m_ptr))
      {
        goto LABEL_7;
      }
      MEMORY[0x19AEA534C](m_ptr, a2, a3);
LABEL_7:
      if (*((_QWORD *)m_ptr + 3))
        ++*((_QWORD *)m_ptr + 1);
      else
        m_objectOfCorrectType = 0;
      v10 = __ldxr((unsigned __int8 *)m_ptr);
      if (v10 == 1)
      {
        if (!__stlxr(0, (unsigned __int8 *)m_ptr))
        {
          if (!m_objectOfCorrectType)
            return;
LABEL_16:
          v11 = *((_QWORD *)m_objectOfCorrectType + 6);
          if (__ldaxr((unsigned __int8 *)v11))
          {
            __clrex();
          }
          else if (!__stxr(1u, (unsigned __int8 *)v11))
          {
            goto LABEL_20;
          }
          MEMORY[0x19AEA534C](v11, a2, a3);
LABEL_20:
          ++*(_QWORD *)(v11 + 8);
          v13 = __ldxr((unsigned __int8 *)v11);
          if (v13 == 1)
          {
            if (!__stlxr(0, (unsigned __int8 *)v11))
            {
LABEL_25:
              CFRetain(a4);
              v14 = WebCore::MediaPlayerPrivateAVFoundationObjC::currentTime((WebCore::MediaPlayerPrivateAVFoundationObjC *)m_objectOfCorrectType);
              v16 = v15;
              v17 = (uint64_t (***)())WTF::fastMalloc((WTF *)0x28);
              v18 = &off_1E32050F8;
              *v17 = &off_1E32050F8;
              v17[1] = (uint64_t (**)())m_objectOfCorrectType;
              v17[2] = (uint64_t (**)())a4;
              v17[3] = (uint64_t (**)())v14;
              v17[4] = v16;
              v24 = v17;
              v19 = *((_QWORD *)m_objectOfCorrectType + 11);
              if (!v19)
              {
                v24 = 0;
                goto LABEL_43;
              }
              v20 = *((_QWORD *)m_objectOfCorrectType + 12);
              if (__ldaxr((unsigned __int8 *)v19))
              {
                __clrex();
              }
              else if (!__stxr(1u, (unsigned __int8 *)v19))
              {
                goto LABEL_31;
              }
              MEMORY[0x19AEA534C](v19);
LABEL_31:
              if (*(_QWORD *)(v19 + 24))
                ++*(_QWORD *)(v19 + 8);
              else
                v20 = 0;
              v22 = __ldxr((unsigned __int8 *)v19);
              if (v22 == 1)
              {
                if (!__stlxr(0, (unsigned __int8 *)v19))
                  goto LABEL_39;
              }
              else
              {
                __clrex();
              }
              WTF::Lock::unlockSlow((WTF::Lock *)v19);
LABEL_39:
              if (v20)
              {
                (*(void (**)(_QWORD, uint64_t (****)()))(**(_QWORD **)(*(_QWORD *)(v20 + 8) + 8)
                                                                            + 592))(*(_QWORD *)(*(_QWORD *)(v20 + 8) + 8), &v24);
                WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::MediaPlayer,(WTF::DestructionThread)1>(*(unsigned __int8 **)v20);
              }
              v23 = v24;
              v24 = 0;
              if (!v23)
                goto LABEL_44;
              v18 = *v23;
LABEL_43:
              v18[1]();
LABEL_44:
              WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::MediaPlayerPrivateAVFoundation,(WTF::DestructionThread)1>(*((unsigned __int8 **)m_objectOfCorrectType + 6));
              return;
            }
          }
          else
          {
            __clrex();
          }
          WTF::Lock::unlockSlow((WTF::Lock *)v11);
          goto LABEL_25;
        }
      }
      else
      {
        __clrex();
      }
      WTF::Lock::unlockSlow((WTF::Lock *)m_ptr);
      if (!m_objectOfCorrectType)
        return;
      goto LABEL_16;
    }
  }
}

- (void).cxx_destruct
{
  WorkQueue *m_ptr;
  ThreadSafeWeakPtrControlBlock *v4;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;

  m_ptr = self->m_backgroundQueue.m_ptr;
  self->m_backgroundQueue.m_ptr = 0;
  if (m_ptr)
    (*(void (**)(WorkQueue *, SEL))(*(_QWORD *)m_ptr + 56))(m_ptr, a2);
  v4 = self->m_player.m_controlBlock.m_ptr;
  self->m_player.m_controlBlock.m_ptr = 0;
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
  *((_QWORD *)self + 4) = 0;
  return self;
}

- (_QWORD)observeValueForKeyPath:ofObject:change:context:
{
  uint64_t v2;
  uint64_t v3;

  *a1 = &off_1E3204B90;
  v2 = a1[2];
  a1[2] = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  v3 = a1[1];
  a1[1] = 0;
  if (v3)
    WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::MediaPlayerPrivateAVFoundation,(WTF::DestructionThread)1>(*(unsigned __int8 **)(v3 + 48));
  return a1;
}

- (uint64_t)observeValueForKeyPath:ofObject:change:context:
{
  uint64_t result;

  ++WebCore::ScriptDisallowedScope::s_count;
  result = (*(uint64_t (**)(_QWORD, _QWORD))(**(_QWORD **)(a1 + 16) + 16))(*(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 8));
  --WebCore::ScriptDisallowedScope::s_count;
  return result;
}

- (uint64_t)observeValueForKeyPath:(***WTF::Detail::CallableWrapper<-[WebCoreAVFMovieObserver)observeValueForKeyPath:ofObject:change:context:]::$_28::operator( ofObject:change:context:
{
  uint64_t (**v1)();
  uint64_t (*v2)();
  uint64_t (***v3)();
  uint64_t (*v4)();
  int v6;
  uint64_t (**v7)();
  uint64_t (***v8)();
  uint64_t (**v9)();
  uint64_t v10;
  uint64_t v11;
  int v13;
  uint64_t (***v14)();

  v1 = result[1];
  v2 = v1[1];
  if (!v2)
    return result;
  v3 = result;
  v4 = v1[2];
  if (__ldaxr((unsigned __int8 *)v2))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)v2))
  {
    goto LABEL_6;
  }
  result = (uint64_t (***)())MEMORY[0x19AEA534C](v2);
LABEL_6:
  if (*((_QWORD *)v2 + 3))
    ++*((_QWORD *)v2 + 1);
  else
    v4 = 0;
  v6 = __ldxr((unsigned __int8 *)v2);
  if (v6 != 1)
  {
    __clrex();
LABEL_14:
    result = (uint64_t (***)())WTF::Lock::unlockSlow((WTF::Lock *)v2);
    if (!v4)
      return result;
    goto LABEL_15;
  }
  if (__stlxr(0, (unsigned __int8 *)v2))
    goto LABEL_14;
  if (!v4)
    return result;
LABEL_15:
  v7 = v3[3];
  v3[3] = 0;
  v8 = (uint64_t (***)())WTF::fastMalloc((WTF *)0x18);
  v9 = &off_1E3204B90;
  *v8 = &off_1E3204B90;
  v8[1] = (uint64_t (**)())v4;
  v8[2] = v7;
  v14 = v8;
  v10 = *((_QWORD *)v4 + 11);
  if (!v10)
  {
    v14 = 0;
    return (uint64_t (***)())v9[1]();
  }
  v11 = *((_QWORD *)v4 + 12);
  if (__ldaxr((unsigned __int8 *)v10))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)v10))
  {
    goto LABEL_21;
  }
  MEMORY[0x19AEA534C](v10);
LABEL_21:
  if (*(_QWORD *)(v10 + 24))
    ++*(_QWORD *)(v10 + 8);
  else
    v11 = 0;
  v13 = __ldxr((unsigned __int8 *)v10);
  if (v13 != 1)
  {
    __clrex();
    goto LABEL_28;
  }
  if (__stlxr(0, (unsigned __int8 *)v10))
LABEL_28:
    WTF::Lock::unlockSlow((WTF::Lock *)v10);
  if (v11)
  {
    (*(void (**)(_QWORD, uint64_t (****)()))(**(_QWORD **)(*(_QWORD *)(v11 + 8) + 8) + 592))(*(_QWORD *)(*(_QWORD *)(v11 + 8) + 8), &v14);
    WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::MediaPlayer,(WTF::DestructionThread)1>(*(unsigned __int8 **)v11);
  }
  result = v14;
  v14 = 0;
  if (result)
  {
    v9 = *result;
    return (uint64_t (***)())v9[1]();
  }
  return result;
}

- (_QWORD)metadataLoaded
{
  uint64_t v2;

  v2 = a1[1];
  *a1 = &off_1E3204EF0;
  a1[1] = 0;
  if (v2)
    WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::MediaPlayerPrivateAVFoundation,(WTF::DestructionThread)1>(*(unsigned __int8 **)(v2 + 48));
  return a1;
}

- (uint64_t)metadataLoaded
{
  uint64_t v3;

  v3 = *((_QWORD *)this + 1);
  *(_QWORD *)this = &off_1E3204EF0;
  *((_QWORD *)this + 1) = 0;
  if (v3)
    WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::MediaPlayerPrivateAVFoundation,(WTF::DestructionThread)1>(*(unsigned __int8 **)(v3 + 48));
  return WTF::fastFree(this, a2);
}

- (unsigned)metadataLoaded
{
  WebCore::MediaPlayerPrivateAVFoundationObjC *v1;

  v1 = *(WebCore::MediaPlayerPrivateAVFoundationObjC **)(a1 + 8);
  *((_BYTE *)v1 + 391) = 0;
  (*(void (**)(WebCore::MediaPlayerPrivateAVFoundationObjC *))(*(_QWORD *)v1 + 1616))(v1);
  (*(void (**)(WebCore::MediaPlayerPrivateAVFoundationObjC *))(*(_QWORD *)v1 + 1000))(v1);
  return WebCore::MediaPlayerPrivateAVFoundationObjC::processChapterTracks(v1);
}

- (_QWORD)didEnd:(_QWORD *)a1
{
  const void *v2;

  *a1 = &off_1E3204F18;
  v2 = (const void *)a1[2];
  a1[2] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

- (uint64_t)didEnd:(WTF *)this
{
  const void *v3;

  *(_QWORD *)this = &off_1E3204F18;
  v3 = (const void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v3)
    CFRelease(v3);
  return WTF::fastFree(this, a2);
}

- (uint64_t)didEnd:(***WTF:(void>::call(uint64_t *)(result :Detail::CallableWrapper<-[WebCoreAVFMovieObserver)didEnd:]::$_26
{
  uint64_t (**v1)();
  uint64_t (*v2)();
  uint64_t (*v3)();
  int v5;
  uint64_t (***v6)();
  uint64_t (**v7)();
  uint64_t v8;
  uint64_t v9;
  int v11;
  uint64_t (***v12)();

  v1 = result[1];
  v2 = v1[1];
  if (!v2)
    return result;
  v3 = v1[2];
  if (__ldaxr((unsigned __int8 *)v2))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)v2))
  {
    goto LABEL_6;
  }
  result = (uint64_t (***)())MEMORY[0x19AEA534C](v2);
LABEL_6:
  if (*((_QWORD *)v2 + 3))
    ++*((_QWORD *)v2 + 1);
  else
    v3 = 0;
  v5 = __ldxr((unsigned __int8 *)v2);
  if (v5 != 1)
  {
    __clrex();
LABEL_14:
    result = (uint64_t (***)())WTF::Lock::unlockSlow((WTF::Lock *)v2);
    if (!v3)
      return result;
    goto LABEL_15;
  }
  if (__stlxr(0, (unsigned __int8 *)v2))
    goto LABEL_14;
  if (!v3)
    return result;
LABEL_15:
  v6 = (uint64_t (***)())WTF::fastMalloc((WTF *)0x10);
  v7 = &off_1E3204F40;
  *v6 = &off_1E3204F40;
  v6[1] = (uint64_t (**)())v3;
  v12 = v6;
  v8 = *((_QWORD *)v3 + 11);
  if (!v8)
  {
    v12 = 0;
    return (uint64_t (***)())v7[1]();
  }
  v9 = *((_QWORD *)v3 + 12);
  if (__ldaxr((unsigned __int8 *)v8))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)v8))
  {
    goto LABEL_21;
  }
  MEMORY[0x19AEA534C](v8);
LABEL_21:
  if (*(_QWORD *)(v8 + 24))
    ++*(_QWORD *)(v8 + 8);
  else
    v9 = 0;
  v11 = __ldxr((unsigned __int8 *)v8);
  if (v11 != 1)
  {
    __clrex();
    goto LABEL_28;
  }
  if (__stlxr(0, (unsigned __int8 *)v8))
LABEL_28:
    WTF::Lock::unlockSlow((WTF::Lock *)v8);
  if (v9)
  {
    (*(void (**)(_QWORD, uint64_t (****)()))(**(_QWORD **)(*(_QWORD *)(v9 + 8) + 8) + 592))(*(_QWORD *)(*(_QWORD *)(v9 + 8) + 8), &v12);
    WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::MediaPlayer,(WTF::DestructionThread)1>(*(unsigned __int8 **)v9);
  }
  result = v12;
  v12 = 0;
  if (result)
  {
    v7 = *result;
    return (uint64_t (***)())v7[1]();
  }
  return result;
}

- (_QWORD)didEnd:
{
  uint64_t v2;

  v2 = a1[1];
  *a1 = &off_1E3204F40;
  a1[1] = 0;
  if (v2)
    WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::MediaPlayerPrivateAVFoundation,(WTF::DestructionThread)1>(*(unsigned __int8 **)(v2 + 48));
  return a1;
}

- (uint64_t)didEnd:
{
  uint64_t v3;

  v3 = *((_QWORD *)this + 1);
  *(_QWORD *)this = &off_1E3204F40;
  *((_QWORD *)this + 1) = 0;
  if (v3)
    WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::MediaPlayerPrivateAVFoundation,(WTF::DestructionThread)1>(*(unsigned __int8 **)(v3 + 48));
  return WTF::fastFree(this, a2);
}

- (unsigned)didEnd:
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  *(_BYTE *)(v1 + 896) = 0;
  *(_DWORD *)(v1 + 864) = 0;
  *(_QWORD *)(v1 + 856) = 0x7FF8000000000000;
  return WebCore::MediaPlayerPrivateAVFoundation::didEnd((WebCore::MediaPlayerPrivateAVFoundation *)v1);
}

- (_QWORD)chapterMetadataDidChange:(_QWORD *)a1
{
  const void *v2;

  *a1 = &off_1E3204F68;
  v2 = (const void *)a1[2];
  a1[2] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

- (uint64_t)chapterMetadataDidChange:(WTF *)this
{
  const void *v3;

  *(_QWORD *)this = &off_1E3204F68;
  v3 = (const void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v3)
    CFRelease(v3);
  return WTF::fastFree(this, a2);
}

- (uint64_t)chapterMetadataDidChange:(***WTF:(void>::call(uint64_t *)(result :Detail::CallableWrapper<-[WebCoreAVFMovieObserver)chapterMetadataDidChange:]::$_27
{
  uint64_t (**v1)();
  uint64_t (*v2)();
  uint64_t (*v3)();
  int v5;
  uint64_t (***v6)();
  uint64_t (**v7)();
  uint64_t v8;
  uint64_t v9;
  int v11;
  uint64_t (***v12)();

  v1 = result[1];
  v2 = v1[1];
  if (!v2)
    return result;
  v3 = v1[2];
  if (__ldaxr((unsigned __int8 *)v2))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)v2))
  {
    goto LABEL_6;
  }
  result = (uint64_t (***)())MEMORY[0x19AEA534C](v2);
LABEL_6:
  if (*((_QWORD *)v2 + 3))
    ++*((_QWORD *)v2 + 1);
  else
    v3 = 0;
  v5 = __ldxr((unsigned __int8 *)v2);
  if (v5 != 1)
  {
    __clrex();
LABEL_14:
    result = (uint64_t (***)())WTF::Lock::unlockSlow((WTF::Lock *)v2);
    if (!v3)
      return result;
    goto LABEL_15;
  }
  if (__stlxr(0, (unsigned __int8 *)v2))
    goto LABEL_14;
  if (!v3)
    return result;
LABEL_15:
  v6 = (uint64_t (***)())WTF::fastMalloc((WTF *)0x10);
  v7 = &off_1E3204F90;
  *v6 = &off_1E3204F90;
  v6[1] = (uint64_t (**)())v3;
  v12 = v6;
  v8 = *((_QWORD *)v3 + 11);
  if (!v8)
  {
    v12 = 0;
    return (uint64_t (***)())v7[1]();
  }
  v9 = *((_QWORD *)v3 + 12);
  if (__ldaxr((unsigned __int8 *)v8))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)v8))
  {
    goto LABEL_21;
  }
  MEMORY[0x19AEA534C](v8);
LABEL_21:
  if (*(_QWORD *)(v8 + 24))
    ++*(_QWORD *)(v8 + 8);
  else
    v9 = 0;
  v11 = __ldxr((unsigned __int8 *)v8);
  if (v11 != 1)
  {
    __clrex();
    goto LABEL_28;
  }
  if (__stlxr(0, (unsigned __int8 *)v8))
LABEL_28:
    WTF::Lock::unlockSlow((WTF::Lock *)v8);
  if (v9)
  {
    (*(void (**)(_QWORD, uint64_t (****)()))(**(_QWORD **)(*(_QWORD *)(v9 + 8) + 8) + 592))(*(_QWORD *)(*(_QWORD *)(v9 + 8) + 8), &v12);
    WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::MediaPlayer,(WTF::DestructionThread)1>(*(unsigned __int8 **)v9);
  }
  result = v12;
  v12 = 0;
  if (result)
  {
    v7 = *result;
    return (uint64_t (***)())v7[1]();
  }
  return result;
}

- (_QWORD)chapterMetadataDidChange:
{
  uint64_t v2;

  v2 = a1[1];
  *a1 = &off_1E3204F90;
  a1[1] = 0;
  if (v2)
    WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::MediaPlayerPrivateAVFoundation,(WTF::DestructionThread)1>(*(unsigned __int8 **)(v2 + 48));
  return a1;
}

- (uint64_t)chapterMetadataDidChange:
{
  uint64_t v3;

  v3 = *((_QWORD *)this + 1);
  *(_QWORD *)this = &off_1E3204F90;
  *((_QWORD *)this + 1) = 0;
  if (v3)
    WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::MediaPlayerPrivateAVFoundation,(WTF::DestructionThread)1>(*(unsigned __int8 **)(v3 + 48));
  return WTF::fastFree(this, a2);
}

- (unsigned)chapterMetadataDidChange:
{
  return WebCore::MediaPlayerPrivateAVFoundationObjC::processChapterTracks(*(WebCore::MediaPlayerPrivateAVFoundationObjC **)(a1 + 8));
}

- (_QWORD)observeValueForKeyPath:(_QWORD *)a1 ofObject:change:context:
{
  const void *v2;
  const void *v3;
  const void *v4;

  *a1 = &off_1E3205008;
  v2 = (const void *)a1[3];
  a1[3] = 0;
  if (v2)
    CFRelease(v2);
  v3 = (const void *)a1[2];
  a1[2] = 0;
  if (v3)
    CFRelease(v3);
  v4 = (const void *)a1[1];
  a1[1] = 0;
  if (v4)
    CFRelease(v4);
  return a1;
}

- (uint64_t)observeValueForKeyPath:(WTF *)this ofObject:(void *)a2 change:context:
{
  const void *v3;
  const void *v4;
  const void *v5;

  *(_QWORD *)this = &off_1E3205008;
  v3 = (const void *)*((_QWORD *)this + 3);
  *((_QWORD *)this + 3) = 0;
  if (v3)
    CFRelease(v3);
  v4 = (const void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v4)
    CFRelease(v4);
  v5 = (const void *)*((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = 0;
  if (v5)
    CFRelease(v5);
  return WTF::fastFree(this, a2);
}

- (uint64_t)observeValueForKeyPath:(uint64_t)a1 ofObject:change:context:
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t result;
  _QWORD *v12;

  objc_msgSend(*(id *)(a1 + 16), "seekableTimeRangesLastModifiedTime");
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 16), "liveUpdateInterval");
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = 0;
  v7 = (_QWORD *)WTF::fastMalloc((WTF *)0x20);
  *v7 = &off_1E3204FE0;
  v7[1] = v6;
  v7[2] = v3;
  v7[3] = v5;
  v9 = *(_QWORD *)(a1 + 24);
  v8 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 32) = 0;
  v10 = (_QWORD *)WTF::fastMalloc((WTF *)0x20);
  *v10 = &off_1E3204B68;
  v10[1] = v9;
  v10[2] = v8;
  v10[3] = v7;
  v12 = v10;
  WTF::ensureOnMainThread();
  result = (uint64_t)v12;
  if (v12)
    return (*(uint64_t (**)(_QWORD *))(*v12 + 8))(v12);
  return result;
}

- (void)observeValueForKeyPath:(uint64_t)a1 ofObject:(uint64_t)a2 change:context:
{
  void *v4;
  int v5;
  int v6;
  WTF::StringImpl *v7;
  int v8;
  uint64_t v9;
  WTF::StringImpl *v10;
  void *v11;
  uint64_t v12;
  WTF::StringImpl *v13;
  WTF::StringImpl *v14;
  int v15;
  int v16;
  char v17;
  int v18;
  char v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  const void *v26;
  int v27;
  int v28;
  uint64_t v29;
  _QWORD *v30;
  char v31;
  WebCore *v32;
  NSError *v33;
  uint64_t v34;
  uint64_t v35;
  WTF::StringImpl *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  int v44;
  uint64_t v45;
  BOOL v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  CMTimeValue v50;
  uint64_t v51;
  int v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  WTF::StringImpl *v57;
  WTF::StringImpl *v58;
  WTF::StringImpl *v59;
  WTF::StringImpl *v60;
  WTF::StringImpl *v61;
  WTF::StringImpl *v62;
  NSObject *v63;
  WTF *v64;
  void *v65;
  char *v66;
  unsigned __int8 *v67;
  int v68;
  int v69;
  void *v70;
  uint64_t v71;
  const char *v72;
  WTF::StringImpl *v73;
  WTF::StringImpl *v74;
  WTF::StringImpl *v75;
  WTF::StringImpl *v76;
  WTF::StringImpl *v77;
  WTF::StringImpl *v78;
  NSObject *v79;
  WTF *v80;
  void *v81;
  char *v82;
  unsigned __int8 *v83;
  int v84;
  int v85;
  void *v86;
  WTF *v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t i;
  void *v92;
  CMTime *v93;
  CMTimeRange *v94;
  uint64_t v95;
  unsigned __int8 v96;
  unsigned __int8 v97;
  _BOOL4 v99;
  char v100;
  BOOL v101;
  uint64_t v102;
  uint64_t timescale;
  unsigned __int8 v104;
  unsigned __int8 v105;
  _BOOL4 v107;
  char v108;
  BOOL v109;
  CMTimeValue value;
  void *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t j;
  uint64_t v115;
  void *v116;
  void *v117;
  const void *v118;
  WTF::StringImpl *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t k;
  unsigned __int8 v123;
  unsigned __int8 v124;
  _BOOL4 v126;
  char v127;
  WTF::StringImpl *v128;
  WTF::StringImpl *v129;
  WTF::StringImpl *v130;
  WTF::StringImpl *v131;
  WTF::StringImpl *v132;
  WTF::StringImpl *v133;
  NSObject *v134;
  WTF *v135;
  char *v136;
  unsigned __int8 *v137;
  int v138;
  int v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t *v142;
  uint64_t v143;
  WTF::Logger *v144;
  uint64_t v145;
  uint64_t v146;
  WTF::StringImpl *v147;
  WTF::StringImpl *v148;
  WTF::StringImpl *v149;
  uint64_t v150;
  WTF *v151;
  const char *v152;
  uint64_t v153;
  WTF::StringImpl **v154;
  WTF::StringImpl *v155;
  WTF::StringImpl *v156;
  WTF::StringImpl *v157;
  WTF::StringImpl *v158;
  WTF::StringImpl *v159;
  WTF::StringImpl *v160;
  int v161;
  char v162;
  WTF::StringImpl *v163;
  uint64_t v164;
  WTF::StringImpl *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t *v168;
  uint64_t v169;
  WTF::Logger *v170;
  uint64_t v171;
  uint64_t v172;
  WTF::StringImpl *v173;
  WTF::StringImpl *v174;
  WTF::StringImpl *v175;
  uint64_t v176;
  WTF *v177;
  const char *v178;
  uint64_t v179;
  WTF::StringImpl **v180;
  WTF::StringImpl *v181;
  WTF::StringImpl *v182;
  WTF::StringImpl *v183;
  WTF::StringImpl *v184;
  WTF::StringImpl *v185;
  WTF::StringImpl *v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t *v189;
  uint64_t v190;
  WTF::Logger *v191;
  uint64_t v192;
  uint64_t v193;
  WTF::StringImpl *v194;
  WTF::StringImpl *v195;
  WTF::StringImpl *v196;
  uint64_t v197;
  WTF *v198;
  const char *v199;
  uint64_t v200;
  WTF::StringImpl **v201;
  WTF::StringImpl *v202;
  WTF::StringImpl *v203;
  WTF::StringImpl *v204;
  WTF::StringImpl *v205;
  WTF::StringImpl *v206;
  WTF::StringImpl *v207;
  WTF::StringImpl *v208;
  int v209;
  int v210;
  char v211;
  WTF::StringImpl *v212;
  uint64_t v213;
  WTF::StringImpl *v214;
  WTF::StringImpl *v215;
  double v216;
  double v217;
  uint64_t v218;
  int v219;
  uint64_t v220;
  unsigned __int8 v221;
  unsigned __int8 v222;
  _BOOL4 v224;
  char v225;
  uint64_t v226;
  WTF::StringImpl *v227;
  char v228;
  uint64_t v229;
  uint64_t v230;
  int v232;
  void *v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  WebCore::PlatformTimeRanges *v237;
  WebCore::PlatformTimeRanges *v238;
  WebCore::PlatformTimeRanges *v239;
  __int128 v240;
  __int128 v241;
  uint64_t v242;
  WTF::Logger *v243[2];
  _OWORD v244[3];
  CMTime v245;
  void *v246;
  uint64_t v247;
  uint64_t v248;
  WTF::Logger *v249[2];
  __int128 v250;
  __int128 v251;
  __int128 v252;
  WTF::StringImpl *v253;
  WTF::StringImpl *v254;
  WTF::StringImpl *v255;
  WTF::StringImpl *v256;
  WTF::StringImpl *v257;
  WTF::StringImpl *v258;
  WTF::StringImpl *v259;
  WebCore *v260[2];
  __int128 v261;
  __int128 v262;
  __int128 v263;
  __int128 buf;
  const char *v265;
  WTF::StringImpl *v266;
  int v267;
  WTF::StringImpl *v268;
  int v269;
  WTF::StringImpl *v270;
  int v271;
  _QWORD v272[11];

  v272[8] = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(*(id *)(a1 + 16), "valueForKey:", *MEMORY[0x1E0CB2CB8]);
  v5 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "valueForKey:", *MEMORY[0x1E0CB2CC0]), "BOOLValue");
  v6 = *(_DWORD *)(a1 + 32);
  if (v6 == 3)
  {
    if (!objc_msgSend(*(id *)(a1 + 8), "isEqualToString:", CFSTR("readyForDisplay")))
    {
LABEL_17:
      v6 = *(_DWORD *)(a1 + 32);
      goto LABEL_18;
    }
    v8 = objc_msgSend(v4, "BOOLValue");
    v9 = *(_QWORD *)(a2 + 280);
    v10 = *(WTF::StringImpl **)(a2 + 288);
    *(_QWORD *)&buf = "MediaPlayerPrivateAVFoundationObjC";
    *((_QWORD *)&buf + 1) = 35;
    v265 = "firstFrameAvailableDidChange";
    v266 = v10;
    if (*(_BYTE *)(v9 + 12))
      WTF::Logger::log<WTF::Logger::LogSiteIdentifier>((uint64_t)&WebCore::LogMedia, 0, (WTF::Logger::LogSiteIdentifier *)&buf);
    *(_BYTE *)(a2 + 946) = v8;
    v11 = *(void **)(a2 + 416);
    if (v11)
      LOBYTE(v11) = objc_msgSend(v11, "isExternalPlaybackActive");
    LOBYTE(v260[0]) = (_BYTE)v11;
    v12 = *(_QWORD *)(a2 + 280);
    v13 = *(WTF::StringImpl **)(a2 + 288);
    *(_QWORD *)&buf = "MediaPlayerPrivateAVFoundationObjC";
    *((_QWORD *)&buf + 1) = 35;
    v265 = "isCurrentPlaybackTargetWireless";
    v266 = v13;
    if (*(_BYTE *)(v12 + 12) && WebCore::LogMedia && byte_1ECE7C490 >= 3u)
    {
      WTF::Logger::log<WTF::Logger::LogSiteIdentifier,BOOL>((uint64_t)&WebCore::LogMedia, 3, (WTF::Logger::LogSiteIdentifier *)&buf);
      if (!LOBYTE(v260[0]))
        goto LABEL_13;
    }
    else if ((v11 & 1) == 0)
    {
LABEL_13:
      if (v8 && !*(_BYTE *)(a2 + 394))
        WebCore::MediaPlayerPrivateAVFoundationObjC::tracksChanged((WTF::StringImpl **)a2, v7);
    }
    WebCore::MediaPlayerPrivateAVFoundation::updateStates((unsigned __int8 *)a2);
    goto LABEL_17;
  }
LABEL_18:
  if (v6 == 1 && objc_msgSend(*(id *)(a1 + 8), "isEqualToString:", CFSTR("enabled")))
  {
    objc_msgSend(v4, "BOOLValue");
    WebCore::MediaPlayerPrivateAVFoundationObjC::tracksChanged((WTF::StringImpl **)a2, v14);
    WebCore::MediaPlayerPrivateAVFoundation::updateStates((unsigned __int8 *)a2);
  }
  v15 = v5 ^ 1;
  if (*(_DWORD *)(a1 + 32))
    v16 = 0;
  else
    v16 = v5;
  if (v16 == 1
    && ((objc_msgSend(*(id *)(a1 + 8), "isEqualToString:", CFSTR("playbackLikelyToKeepUp")) & 1) != 0
     || (objc_msgSend(*(id *)(a1 + 8), "isEqualToString:", CFSTR("playbackBufferEmpty")) & 1) != 0
     || objc_msgSend(*(id *)(a1 + 8), "isEqualToString:", CFSTR("playbackBufferFull"))))
  {
    ++*(_DWORD *)(a2 + 928);
  }
  if (*(_DWORD *)(a1 + 32))
    v17 = 1;
  else
    v17 = v5;
  if ((v17 & 1) == 0)
  {
    if (objc_msgSend(*(id *)(a1 + 8), "isEqualToString:", CFSTR("status")))
    {
      *(_DWORD *)(a2 + 932) = objc_msgSend(v4, "intValue");
LABEL_42:
      WebCore::MediaPlayerPrivateAVFoundation::updateStates((unsigned __int8 *)a2);
      goto LABEL_43;
    }
    if (objc_msgSend(*(id *)(a1 + 8), "isEqualToString:", CFSTR("playbackLikelyToKeepUp")))
    {
      *(_BYTE *)(a2 + 941) = objc_msgSend(v4, "BOOLValue");
      goto LABEL_41;
    }
    if (objc_msgSend(*(id *)(a1 + 8), "isEqualToString:", CFSTR("playbackBufferEmpty")))
    {
      *(_BYTE *)(a2 + 942) = objc_msgSend(v4, "BOOLValue");
      goto LABEL_41;
    }
    if (objc_msgSend(*(id *)(a1 + 8), "isEqualToString:", CFSTR("playbackBufferFull")))
    {
      *(_BYTE *)(a2 + 943) = objc_msgSend(v4, "BOOLValue");
LABEL_41:
      v18 = *(_DWORD *)(a2 + 928) - 1;
      *(_DWORD *)(a2 + 928) = v18;
      if (v18)
        goto LABEL_43;
      goto LABEL_42;
    }
    if (objc_msgSend(*(id *)(a1 + 8), "isEqualToString:", CFSTR("asset")))
    {
      if (v4)
        CFRetain(v4);
      v26 = *(const void **)(a2 + 408);
      *(_QWORD *)(a2 + 408) = v4;
      if (v26)
        CFRelease(v26);
      WebCore::MediaPlayerPrivateAVFoundationObjC::processChapterTracks((WebCore::MediaPlayerPrivateAVFoundationObjC *)a2);
LABEL_65:
      v15 = 0;
      goto LABEL_43;
    }
    if (objc_msgSend(*(id *)(a1 + 8), "isEqualToString:", CFSTR("loadedTimeRanges")))
    {
      if (v4)
        CFRetain(v4);
      v239 = (WebCore::PlatformTimeRanges *)(a2 + 1152);
      if (*(_DWORD *)(a2 + 1160))
      {
        if (*(_DWORD *)(a2 + 1164))
          *(_DWORD *)(a2 + 1164) = 0;
        v87 = *(WTF **)v239;
        if (*(_QWORD *)v239)
        {
          *(_QWORD *)(a2 + 1152) = 0;
          *(_DWORD *)(a2 + 1160) = 0;
          WTF::fastFree(v87, v86);
        }
      }
      v262 = 0u;
      v263 = 0u;
      *(_OWORD *)v260 = 0u;
      v261 = 0u;
      v88 = v4;
      v89 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", v260, &buf, 16);
      if (v89)
      {
        v90 = *(_QWORD *)v261;
        do
        {
          for (i = 0; i != v89; ++i)
          {
            if (*(_QWORD *)v261 != v90)
              objc_enumerationMutation(v88);
            v92 = (void *)*((_QWORD *)v260[1] + i);
            memset(v244, 0, 32);
            *(_OWORD *)v243 = 0u;
            if (v92)
            {
              objc_msgSend(v92, "CMTimeRangeValue");
              if ((BYTE4(v243[1]) & 1) != 0
                && (BYTE4(v244[1]) & 1) != 0
                && !*((_QWORD *)&v244[1] + 1)
                && (*((_QWORD *)&v244[0] + 1) & 0x8000000000000000) == 0)
              {
                v241 = *(_OWORD *)((char *)v244 + 8);
                v242 = *((_QWORD *)&v244[1] + 1);
                if (PAL::get_CoreMedia_kCMTimeZero(void)::once != -1)
                  dispatch_once(&PAL::get_CoreMedia_kCMTimeZero(void)::once, &__block_literal_global_6_2);
                v245 = *(CMTime *)PAL::get_CoreMedia_kCMTimeZero(void)::constantCoreMediakCMTimeZero;
                *(_OWORD *)v249 = v241;
                *(_QWORD *)&v250 = v242;
                if (PAL::softLinkCoreMediaCMTimeCompare((PAL *)v249, &v245, v93))
                {
                  *(_OWORD *)v249 = *(_OWORD *)v243;
                  v250 = v244[0];
                  v95 = LODWORD(v243[1]);
                  v96 = BYTE4(v243[1]) & 1;
                  if ((~HIDWORD(v243[1]) & 3) == 0)
                    v96 = BYTE4(v243[1]) & 1 | 2;
                  if ((~HIDWORD(v243[1]) & 5) == 0)
                    v96 |= 4u;
                  if ((~HIDWORD(v243[1]) & 9) == 0)
                    v96 |= 8u;
                  if ((~HIDWORD(v243[1]) & 0x11) != 0)
                    v97 = v96;
                  else
                    v97 = v96 | 0x10;
                  v99 = (v97 & 1) == 0 || LODWORD(v243[1]) != 0;
                  if ((uint64_t)v243[0] >= 0)
                    v100 = 5;
                  else
                    v100 = 9;
                  v101 = !v99;
                  if (v99)
                  {
                    v102 = (uint64_t)v243[0];
                  }
                  else
                  {
                    v97 = v100;
                    v102 = (uint64_t)v243[0] >> 63;
                  }
                  if (v101)
                    v95 = 1;
                  *(_QWORD *)&v240 = v102;
                  *((_QWORD *)&v240 + 1) = v95 | ((unint64_t)v97 << 32);
                  v251 = v244[1];
                  PAL::softLinkCoreMediaCMTimeRangeGetEnd((PAL *)v249, v94);
                  timescale = v245.timescale;
                  v104 = v245.flags & 1;
                  if ((~v245.flags & 3) == 0)
                    v104 = v245.flags & 1 | 2;
                  if ((~v245.flags & 5) == 0)
                    v104 |= 4u;
                  if ((~v245.flags & 9) == 0)
                    v104 |= 8u;
                  if ((~v245.flags & 0x11) != 0)
                    v105 = v104;
                  else
                    v105 = v104 | 0x10;
                  v107 = (v105 & 1) == 0 || v245.timescale != 0;
                  if (v245.value >= 0)
                    v108 = 5;
                  else
                    v108 = 9;
                  v109 = !v107;
                  if (v107)
                  {
                    value = v245.value;
                  }
                  else
                  {
                    v105 = v108;
                    value = v245.value >> 63;
                  }
                  if (v109)
                    timescale = 1;
                  v249[0] = (WTF::Logger *)value;
                  v249[1] = (WTF::Logger *)(timescale | ((unint64_t)v105 << 32));
                  WebCore::PlatformTimeRanges::add(v239, &v240, (__int128 *)v249, 0);
                }
              }
            }
          }
          v89 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", v260, &buf, 16);
        }
        while (v89);
      }
      WebCore::MediaPlayerPrivateAVFoundation::loadedTimeRangesChanged((WebCore::MediaPlayerPrivateAVFoundation *)a2);
      WebCore::MediaPlayerPrivateAVFoundation::updateStates((unsigned __int8 *)a2);
      v4 = v88;
      if (v88)
        CFRelease(v88);
      goto LABEL_43;
    }
    if (objc_msgSend(*(id *)(a1 + 8), "isEqualToString:", CFSTR("tracks")))
    {
      if (v4)
        CFRetain(v4);
      *(_OWORD *)v249 = 0u;
      v250 = 0u;
      v251 = 0u;
      v252 = 0u;
      v111 = *(void **)(a2 + 768);
      v112 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", v249, &buf, 16);
      if (v112)
      {
        v113 = *(_QWORD *)v250;
        do
        {
          for (j = 0; j != v112; ++j)
          {
            if (*(_QWORD *)v250 != v113)
              objc_enumerationMutation(v111);
            objc_msgSend(*((id *)v249[1] + j), "removeObserver:forKeyPath:", *(_QWORD *)(a2 + 456), CFSTR("enabled"));
          }
          v112 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", v249, &buf, 16);
        }
        while (v112);
      }
      v115 = objc_msgSend(*(id *)(a2 + 408), "tracks");
      v245.value = MEMORY[0x1E0C809B0];
      *(_QWORD *)&v245.timescale = 3221225472;
      v245.epoch = (CMTimeEpoch)___ZN7WebCore34MediaPlayerPrivateAVFoundationObjC15tracksDidChangeERKN3WTF9RetainPtrI7NSArrayEE_block_invoke;
      v246 = &unk_1E32047F0;
      v247 = v115;
      v248 = a2;
      v116 = (void *)objc_msgSend(v4, "objectsAtIndexes:", objc_msgSend(v4, "indexesOfObjectsPassingTest:", &v245));
      v117 = v116;
      if (v116)
        CFRetain(v116);
      v118 = *(const void **)(a2 + 768);
      *(_QWORD *)(a2 + 768) = v117;
      if (v118)
      {
        CFRelease(v118);
        v117 = *(void **)(a2 + 768);
      }
      *(_OWORD *)v243 = 0u;
      memset(v244, 0, sizeof(v244));
      v120 = objc_msgSend(v117, "countByEnumeratingWithState:objects:count:", v243, v260, 16);
      if (v120)
      {
        v121 = **(_QWORD **)&v244[0];
        do
        {
          for (k = 0; k != v120; ++k)
          {
            if (**(_QWORD **)&v244[0] != v121)
              objc_enumerationMutation(v117);
            objc_msgSend(*((id *)v243[1] + k), "addObserver:forKeyPath:options:context:", *(_QWORD *)(a2 + 456), CFSTR("enabled"), 1, 1);
          }
          v120 = objc_msgSend(v117, "countByEnumeratingWithState:objects:count:", v243, v260, 16);
        }
        while (v120);
      }
      *(_QWORD *)(a2 + 920) = 0;
      WebCore::MediaPlayerPrivateAVFoundationObjC::tracksChanged((WTF::StringImpl **)a2, v119);
      WebCore::MediaPlayerPrivateAVFoundation::updateStates((unsigned __int8 *)a2);
      if (v4)
        CFRelease(v4);
      goto LABEL_65;
    }
    if (objc_msgSend(*(id *)(a1 + 8), "isEqualToString:", CFSTR("hasEnabledAudio")))
    {
      v162 = objc_msgSend(v4, "BOOLValue");
      LOBYTE(v260[0]) = v162;
      v164 = *(_QWORD *)(a2 + 280);
      v165 = *(WTF::StringImpl **)(a2 + 288);
      *(_QWORD *)&buf = "MediaPlayerPrivateAVFoundationObjC";
      *((_QWORD *)&buf + 1) = 35;
      v265 = "hasEnabledAudioDidChange";
      v266 = v165;
      if (*(_BYTE *)(v164 + 12))
      {
        WTF::Logger::log<WTF::Logger::LogSiteIdentifier,BOOL>((uint64_t)&WebCore::LogMedia, 0, (WTF::Logger::LogSiteIdentifier *)&buf);
        v162 = (char)v260[0];
      }
      *(_BYTE *)(a2 + 944) = v162;
      WebCore::MediaPlayerPrivateAVFoundationObjC::tracksChanged((WTF::StringImpl **)a2, v163);
      WebCore::MediaPlayerPrivateAVFoundation::updateStates((unsigned __int8 *)a2);
      goto LABEL_43;
    }
    if (objc_msgSend(*(id *)(a1 + 8), "isEqualToString:", CFSTR("hasEnabledVideo")))
    {
      v211 = objc_msgSend(v4, "BOOLValue");
      LOBYTE(v260[0]) = v211;
      v213 = *(_QWORD *)(a2 + 280);
      v214 = *(WTF::StringImpl **)(a2 + 288);
      *(_QWORD *)&buf = "MediaPlayerPrivateAVFoundationObjC";
      *((_QWORD *)&buf + 1) = 35;
      v265 = "hasEnabledVideoDidChange";
      v266 = v214;
      if (*(_BYTE *)(v213 + 12))
      {
        WTF::Logger::log<WTF::Logger::LogSiteIdentifier,BOOL>((uint64_t)&WebCore::LogMedia, 0, (WTF::Logger::LogSiteIdentifier *)&buf);
        v211 = (char)v260[0];
      }
      *(_BYTE *)(a2 + 945) = v211;
      WebCore::MediaPlayerPrivateAVFoundationObjC::tracksChanged((WTF::StringImpl **)a2, v212);
      WebCore::MediaPlayerPrivateAVFoundation::updateStates((unsigned __int8 *)a2);
      goto LABEL_43;
    }
    if (objc_msgSend(*(id *)(a1 + 8), "isEqualToString:", CFSTR("presentationSize")))
    {
      objc_msgSend(v4, "sizeValue");
      *(float *)&v216 = v216;
      *(float *)&v217 = v217;
      *(_DWORD *)(a2 + 784) = LODWORD(v216);
      *(_DWORD *)(a2 + 788) = LODWORD(v217);
      if (*(_QWORD *)(a2 + 408))
      {
        WebCore::MediaPlayerPrivateAVFoundationObjC::updateRotationSession((uint64_t *)a2);
        WebCore::MediaPlayerPrivateAVFoundation::setNaturalSize((unsigned __int8 *)a2, *(float *)(a2 + 784), *(float *)(a2 + 788));
      }
      goto LABEL_42;
    }
    if (objc_msgSend(*(id *)(a1 + 8), "isEqualToString:", CFSTR("duration")))
    {
      if (v4)
      {
        objc_msgSend(v4, "CMTimeValue");
        v218 = (uint64_t)v260[0];
        v219 = HIDWORD(v260[1]);
        LODWORD(v220) = v260[1];
      }
      else
      {
        LODWORD(v220) = 0;
        v218 = 0;
        v219 = 0;
        v260[0] = 0;
        v260[1] = 0;
        *(_QWORD *)&v261 = 0;
      }
      v221 = v219 & 1;
      if ((~v219 & 3) == 0)
        v221 = v219 & 1 | 2;
      if ((~v219 & 5) == 0)
        v221 |= 4u;
      if ((~v219 & 9) == 0)
        v221 |= 8u;
      if ((~v219 & 0x11) != 0)
        v222 = v221;
      else
        v222 = v221 | 0x10;
      v224 = (v222 & 1) == 0 || (_DWORD)v220 != 0;
      if (v218 >= 0)
        v225 = 5;
      else
        v225 = 9;
      if (!v224)
        v222 = v225;
      v220 = v220;
      if (!v224)
      {
        v218 >>= 63;
        v220 = 1;
      }
      v249[0] = (WTF::Logger *)v218;
      v249[1] = (WTF::Logger *)(v220 | ((unint64_t)v222 << 32));
      if (WTF::MediaTime::compare((WTF::MediaTime *)(a2 + 352), (const WTF::MediaTime *)v249))
      {
        v226 = *(_QWORD *)(a2 + 280);
        v227 = *(WTF::StringImpl **)(a2 + 288);
        *(_QWORD *)&buf = "MediaPlayerPrivateAVFoundationObjC";
        *((_QWORD *)&buf + 1) = 35;
        v265 = "durationDidChange";
        v266 = v227;
        if (*(_BYTE *)(v226 + 12) && WebCore::LogMedia && byte_1ECE7C490 >= 3u)
          WTF::Logger::log<WTF::Logger::LogSiteIdentifier,WTF::MediaTime>((uint64_t)&WebCore::LogMedia, 3u, (WTF::Logger::LogSiteIdentifier *)&buf, (WTF::MediaTime *)v249);
        v228 = *(_BYTE *)(a2 + 364);
        *(WTF::Logger **)(a2 + 352) = v249[0];
        *(WTF::Logger **)(a2 + 357) = *(WTF::Logger **)((char *)v249 + 5);
        if ((v228 & 1) != 0)
        {
          v229 = *(_QWORD *)(a2 + 88);
          if (v229)
          {
            v230 = *(_QWORD *)(a2 + 96);
            if (__ldaxr((unsigned __int8 *)v229))
            {
              __clrex();
            }
            else if (!__stxr(1u, (unsigned __int8 *)v229))
            {
              goto LABEL_578;
            }
            MEMORY[0x19AEA534C](v229);
LABEL_578:
            if (*(_QWORD *)(v229 + 24))
              ++*(_QWORD *)(v229 + 8);
            else
              v230 = 0;
            v232 = __ldxr((unsigned __int8 *)v229);
            if (v232 == 1)
            {
              if (!__stlxr(0, (unsigned __int8 *)v229))
              {
LABEL_586:
                if (v230)
                {
                  (*(void (**)(_QWORD))(**(_QWORD **)(*(_QWORD *)(v230 + 8) + 8) + 64))(*(_QWORD *)(*(_QWORD *)(v230 + 8) + 8));
                  WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::MediaPlayer,(WTF::DestructionThread)1>(*(unsigned __int8 **)v230);
                }
                goto LABEL_43;
              }
            }
            else
            {
              __clrex();
            }
            WTF::Lock::unlockSlow((WTF::Lock *)v229);
            goto LABEL_586;
          }
        }
      }
    }
    else if (objc_msgSend(*(id *)(a1 + 8), "isEqualToString:", CFSTR("canPlayFastReverse")))
    {
      *(_BYTE *)(a2 + 949) = objc_msgSend(v4, "BOOLValue");
    }
    else if (objc_msgSend(*(id *)(a1 + 8), "isEqualToString:", CFSTR("canPlayFastForward")))
    {
      *(_BYTE *)(a2 + 948) = objc_msgSend(v4, "BOOLValue");
    }
  }
LABEL_43:
  if (*(_DWORD *)(a1 + 32) == 2)
    v19 = v5;
  else
    v19 = 1;
  if ((v19 & 1) != 0)
    goto LABEL_109;
  if (objc_msgSend(*(id *)(a1 + 8), "isEqualToString:", CFSTR("rate")))
  {
    objc_msgSend(v4, "doubleValue");
    if (*(double *)(a2 + 888) == v20)
      goto LABEL_109;
    *(double *)(a2 + 888) = v20;
    WebCore::MediaPlayerPrivateAVFoundation::updateStates((unsigned __int8 *)a2);
    v21 = *(_QWORD *)(a2 + 88);
    if (!v21)
      goto LABEL_109;
    v22 = *(_QWORD *)(a2 + 96);
    if (__ldaxr((unsigned __int8 *)v21))
    {
      __clrex();
    }
    else if (!__stxr(1u, (unsigned __int8 *)v21))
    {
      goto LABEL_86;
    }
    MEMORY[0x19AEA534C](v21);
LABEL_86:
    if (*(_QWORD *)(v21 + 24))
      ++*(_QWORD *)(v21 + 8);
    else
      v22 = 0;
    v43 = __ldxr((unsigned __int8 *)v21);
    if (v43 == 1)
    {
      if (!__stlxr(0, (unsigned __int8 *)v21))
      {
LABEL_94:
        if (v22)
        {
          (*(void (**)(_QWORD))(**(_QWORD **)(*(_QWORD *)(v22 + 8) + 8) + 72))(*(_QWORD *)(*(_QWORD *)(v22 + 8) + 8));
LABEL_108:
          WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::MediaPlayer,(WTF::DestructionThread)1>(*(unsigned __int8 **)v22);
          goto LABEL_109;
        }
        goto LABEL_109;
      }
    }
    else
    {
      __clrex();
    }
    WTF::Lock::unlockSlow((WTF::Lock *)v21);
    goto LABEL_94;
  }
  if (objc_msgSend(*(id *)(a1 + 8), "isEqualToString:", CFSTR("timeControlStatus")))
  {
    WebCore::MediaPlayerPrivateAVFoundationObjC::timeControlStatusDidChange((unsigned __int8 *)a2, objc_msgSend(v4, "intValue"));
    goto LABEL_109;
  }
  if ((objc_msgSend(*(id *)(a1 + 8), "isEqualToString:", CFSTR("externalPlaybackActive")) & 1) == 0
    && !objc_msgSend(*(id *)(a1 + 8), "isEqualToString:", CFSTR("allowsExternalPlayback")))
  {
    if (objc_msgSend(*(id *)(a1 + 8), "isEqualToString:", CFSTR("outputObscuredDueToInsufficientExternalProtection")))
    {
      v27 = objc_msgSend(v4, "BOOLValue");
      v28 = v27;
      v29 = *(_QWORD *)(a2 + 712);
      if (v29)
      {
        v30 = *(_QWORD **)(v29 + 8);
        v31 = v27 ^ 1;
        if (!v30)
          v31 = 1;
        if ((v31 & 1) == 0)
        {
          v32 = (WebCore *)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.WebKit"), 1212433232, 0);
          v260[0] = v32;
          v34 = v30[4];
          if (v34)
          {
            if (*(_QWORD *)(v34 + 8))
            {
              v35 = v30[7];
              v36 = (WTF::StringImpl *)v30[8];
              *(_QWORD *)&buf = "CDMSessionAVFoundationObjC";
              *((_QWORD *)&buf + 1) = 27;
              v265 = "playerDidReceiveError";
              v266 = v36;
              if (*(_BYTE *)(v35 + 12))
              {
                WTF::Logger::log<WTF::Logger::LogSiteIdentifier,NSError *>((uint64_t)&WebCore::LogEME, 1u, (WTF::Logger::LogSiteIdentifier *)&buf, (id *)v260);
                v32 = v260[0];
              }
              v37 = WebCore::mediaKeyErrorSystemCode(v32, v33);
              (*(void (**)(_QWORD, uint64_t, uint64_t))(**(_QWORD **)(v30[4] + 8) + 24))(*(_QWORD *)(v30[4] + 8), 6, v37);
            }
          }
        }
      }
      v38 = *(_QWORD *)(a2 + 728);
      if (v38)
      {
        v39 = *(unsigned int *)(v38 + 100);
        if ((_DWORD)v39)
        {
          v40 = *(_QWORD *)(v38 + 88);
          v41 = 8 * v39;
          do
          {
            if (*(_QWORD *)v40)
            {
              v42 = *(_QWORD *)(*(_QWORD *)v40 + 8);
              if (v42)
                WebCore::CDMInstanceSessionFairPlayStreamingAVFObjC::outputObscuredDueToInsufficientExternalProtectionChanged((WTF *)(v42 - 16), v28);
            }
            v40 += 8;
            v41 -= 8;
          }
          while (v41);
        }
      }
    }
    goto LABEL_109;
  }
  v24 = *(_QWORD *)(a2 + 88);
  if (!v24)
    goto LABEL_109;
  v22 = *(_QWORD *)(a2 + 96);
  if (__ldaxr((unsigned __int8 *)v24))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)v24))
  {
    goto LABEL_98;
  }
  MEMORY[0x19AEA534C](v24);
LABEL_98:
  if (*(_QWORD *)(v24 + 24))
    ++*(_QWORD *)(v24 + 8);
  else
    v22 = 0;
  v44 = __ldxr((unsigned __int8 *)v24);
  if (v44 != 1)
  {
    __clrex();
    goto LABEL_105;
  }
  if (__stlxr(0, (unsigned __int8 *)v24))
LABEL_105:
    WTF::Lock::unlockSlow((WTF::Lock *)v24);
  if (v22)
  {
    v45 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(v22 + 72) + 760))(*(_QWORD *)(v22 + 72));
    (*(void (**)(_QWORD, uint64_t))(**(_QWORD **)(*(_QWORD *)(v22 + 8) + 8) + 208))(*(_QWORD *)(*(_QWORD *)(v22 + 8) + 8), v45);
    goto LABEL_108;
  }
LABEL_109:
  if (!*(_BYTE *)(*(_QWORD *)(a2 + 280) + 12))
    return;
  v46 = WebCore::LogMedia && byte_1ECE7C490 >= 4u;
  if (!v46
    || (objc_msgSend(*(id *)(a1 + 8), "isEqualToString:", CFSTR("loadedTimeRanges")) & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 8), "isEqualToString:", CFSTR("seekableTimeRanges")) & 1) != 0)
  {
    return;
  }
  v47 = *(_QWORD *)(a2 + 288);
  v260[0] = (WebCore *)"MediaPlayerPrivateAVFoundation";
  v260[1] = (WebCore *)31;
  *(_QWORD *)&v261 = "observeValueForKeyPath";
  *((_QWORD *)&v261 + 1) = v47;
  if (!v15)
  {
    v53 = "did";
    v54 = *(_QWORD *)(a2 + 280);
    if (v5)
      v53 = "will";
    v237 = (WebCore::PlatformTimeRanges *)v53;
    v55 = objc_msgSend(*(id *)(a1 + 8), "UTF8String");
    if (!*(_BYTE *)(v54 + 12) || !WebCore::LogMedia || byte_1ECE7C490 < 4u)
      return;
    v56 = (const char *)v55;
    WTF::Logger::LogSiteIdentifier::toString((WTF::Logger::LogSiteIdentifier *)v260);
    WTF::String::String((WTF::String *)&v258, (const char *)v237);
    WTF::String::String((WTF::String *)&v257, " change '");
    WTF::String::String((WTF::String *)&v256, v56);
    WTF::String::String((WTF::String *)&v255, "'");
    *(_QWORD *)&buf = v259;
    v249[0] = v258;
    v243[0] = v257;
    v245.value = (CMTimeValue)v256;
    *(_QWORD *)&v241 = v255;
    WTF::tryMakeStringFromAdapters<WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>>((uint64_t)&buf, (uint64_t *)v249, (uint64_t *)v243, &v245.value, (uint64_t *)&v241, &v240);
    if ((_QWORD)v240)
    {
      v58 = v255;
      v255 = 0;
      if (v58)
      {
        if (*(_DWORD *)v58 == 2)
          WTF::StringImpl::destroy(v58, v57);
        else
          *(_DWORD *)v58 -= 2;
      }
      v59 = v256;
      v256 = 0;
      if (v59)
      {
        if (*(_DWORD *)v59 == 2)
          WTF::StringImpl::destroy(v59, v57);
        else
          *(_DWORD *)v59 -= 2;
      }
      v60 = v257;
      v257 = 0;
      if (v60)
      {
        if (*(_DWORD *)v60 == 2)
          WTF::StringImpl::destroy(v60, v57);
        else
          *(_DWORD *)v60 -= 2;
      }
      v61 = v258;
      v258 = 0;
      if (v61)
      {
        if (*(_DWORD *)v61 == 2)
          WTF::StringImpl::destroy(v61, v57);
        else
          *(_DWORD *)v61 -= 2;
      }
      v62 = v259;
      v259 = 0;
      if (v62)
      {
        if (*(_DWORD *)v62 == 2)
          WTF::StringImpl::destroy(v62, v57);
        else
          *(_DWORD *)v62 -= 2;
      }
      v63 = qword_1ECE7C4A0;
      v64 = (WTF *)os_log_type_enabled((os_log_t)qword_1ECE7C4A0, OS_LOG_TYPE_DEFAULT);
      if ((_DWORD)v64)
      {
        WTF::String::utf8();
        v66 = v249[0] ? (char *)v249[0] + 16 : 0;
        LODWORD(buf) = 136446210;
        *(_QWORD *)((char *)&buf + 4) = v66;
        _os_log_impl(&dword_1940B8000, v63, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);
        v64 = v249[0];
        v249[0] = 0;
        if (v64)
        {
          if (*(_DWORD *)v64 == 1)
            v64 = (WTF *)WTF::fastFree(v64, v65);
          else
            --*(_DWORD *)v64;
        }
      }
      if (WebCore::LogMedia && byte_1ECE7C490 >= 4u)
      {
        v67 = (unsigned __int8 *)MEMORY[0x1E0CBF890];
        while (1)
        {
          v68 = *v67;
          if ((v68 & 1) != 0)
            break;
          v69 = __ldaxr(v67);
          if (v69 == v68)
          {
            if (!__stxr(v68 | 1, v67))
            {
              v140 = WTF::Logger::observers(v64);
              v141 = *(unsigned int *)(v140 + 12);
              if ((_DWORD)v141)
              {
                v142 = *(uint64_t **)v140;
                v234 = *(_QWORD *)v140 + 8 * v141;
                do
                {
                  v143 = *v142;
                  LODWORD(buf) = 0;
                  WTF::Logger::LogSiteIdentifier::toString((WTF::Logger::LogSiteIdentifier *)v260);
                  LODWORD(v265) = 0;
                  WTF::String::String((WTF::String *)&v266, (const char *)v237);
                  v267 = 0;
                  WTF::String::String((WTF::String *)&v268, " change '");
                  v269 = 0;
                  WTF::String::String((WTF::String *)&v270, v56);
                  v271 = 0;
                  WTF::String::String((WTF::String *)v272, "'");
                  v249[0] = 0;
                  v249[1] = 0;
                  v144 = (WTF::Logger *)WTF::fastMalloc((WTF *)0x50);
                  LODWORD(v249[1]) = 5;
                  v249[0] = v144;
                  v145 = HIDWORD(v249[1]);
                  *((_DWORD *)v144 + 4 * HIDWORD(v249[1])) = buf;
                  v146 = *((_QWORD *)&buf + 1);
                  if (*((_QWORD *)&buf + 1))
                    **((_DWORD **)&buf + 1) += 2;
                  *((_QWORD *)v144 + 2 * v145 + 1) = v146;
                  *((_DWORD *)v144 + 4 * (v145 + 1)) = (_DWORD)v265;
                  v147 = v266;
                  if (v266)
                    *(_DWORD *)v266 += 2;
                  *((_QWORD *)v144 + 2 * (v145 + 1) + 1) = v147;
                  *((_DWORD *)v144 + 4 * (v145 + 2)) = v267;
                  v148 = v268;
                  if (v268)
                    *(_DWORD *)v268 += 2;
                  *((_QWORD *)v144 + 2 * (v145 + 2) + 1) = v148;
                  *((_DWORD *)v144 + 4 * (v145 + 3)) = v269;
                  v149 = v270;
                  if (v270)
                    *(_DWORD *)v270 += 2;
                  *((_QWORD *)v144 + 2 * (v145 + 3) + 1) = v149;
                  *((_DWORD *)v144 + 4 * (v145 + 4)) = v271;
                  v150 = v272[0];
                  if (v272[0])
                    *(_DWORD *)v272[0] += 2;
                  *((_QWORD *)v144 + 2 * (v145 + 4) + 1) = v150;
                  HIDWORD(v249[1]) = v145 + 5;
                  (*(void (**)(uint64_t, char *, uint64_t, WTF::Logger **))(*(_QWORD *)v143 + 16))(v143, &WebCore::LogMedia, 4, v249);
                  v151 = v249[0];
                  if (HIDWORD(v249[1]))
                  {
                    v152 = v56;
                    v153 = 16 * HIDWORD(v249[1]);
                    v154 = (WTF::StringImpl **)((char *)v249[0] + 8);
                    do
                    {
                      v155 = *v154;
                      *v154 = 0;
                      if (v155)
                      {
                        if (*(_DWORD *)v155 == 2)
                          WTF::StringImpl::destroy(v155, (WTF::StringImpl *)v65);
                        else
                          *(_DWORD *)v155 -= 2;
                      }
                      v154 += 2;
                      v153 -= 16;
                    }
                    while (v153);
                    v151 = v249[0];
                    v56 = v152;
                  }
                  if (v151)
                  {
                    v249[0] = 0;
                    LODWORD(v249[1]) = 0;
                    WTF::fastFree(v151, v65);
                  }
                  v156 = (WTF::StringImpl *)v272[0];
                  v272[0] = 0;
                  if (v156)
                  {
                    if (*(_DWORD *)v156 == 2)
                      WTF::StringImpl::destroy(v156, (WTF::StringImpl *)v65);
                    else
                      *(_DWORD *)v156 -= 2;
                  }
                  v157 = v270;
                  v270 = 0;
                  if (v157)
                  {
                    if (*(_DWORD *)v157 == 2)
                      WTF::StringImpl::destroy(v157, (WTF::StringImpl *)v65);
                    else
                      *(_DWORD *)v157 -= 2;
                  }
                  v158 = v268;
                  v268 = 0;
                  if (v158)
                  {
                    if (*(_DWORD *)v158 == 2)
                      WTF::StringImpl::destroy(v158, (WTF::StringImpl *)v65);
                    else
                      *(_DWORD *)v158 -= 2;
                  }
                  v159 = v266;
                  v266 = 0;
                  if (v159)
                  {
                    if (*(_DWORD *)v159 == 2)
                      WTF::StringImpl::destroy(v159, (WTF::StringImpl *)v65);
                    else
                      *(_DWORD *)v159 -= 2;
                  }
                  v160 = (WTF::StringImpl *)*((_QWORD *)&buf + 1);
                  *((_QWORD *)&buf + 1) = 0;
                  if (v160)
                  {
                    if (*(_DWORD *)v160 == 2)
                      WTF::StringImpl::destroy(v160, (WTF::StringImpl *)v65);
                    else
                      *(_DWORD *)v160 -= 2;
                  }
                  ++v142;
                }
                while (v142 != (uint64_t *)v234);
              }
              v161 = __ldxr(v67);
              if (v161 == 1)
              {
                if (!__stlxr(0, v67))
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
      v208 = (WTF::StringImpl *)v240;
      *(_QWORD *)&v240 = 0;
      if (v208)
        goto LABEL_503;
      return;
    }
LABEL_590:
    __break(0xC471u);
    JUMPOUT(0x1947786ECLL);
  }
  if (!objc_msgSend(*(id *)(a1 + 8), "isEqualToString:", CFSTR("duration")))
  {
    v70 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@"), objc_msgSend(v4, "description"));
    v71 = *(_QWORD *)(a2 + 280);
    v72 = (const char *)objc_msgSend(*(id *)(a1 + 8), "UTF8String");
    v238 = (WebCore::PlatformTimeRanges *)objc_msgSend(v70, "UTF8String");
    if (*(_BYTE *)(v71 + 12) && WebCore::LogMedia && byte_1ECE7C490 >= 4u)
    {
      WTF::Logger::LogSiteIdentifier::toString((WTF::Logger::LogSiteIdentifier *)v260);
      WTF::String::String((WTF::String *)&v258, "did change '");
      WTF::String::String((WTF::String *)&v257, v72);
      WTF::String::String((WTF::String *)&v256, "' to ");
      WTF::String::String((WTF::String *)&v255, (const char *)v238);
      *(_QWORD *)&buf = v259;
      v249[0] = v258;
      v243[0] = v257;
      v245.value = (CMTimeValue)v256;
      *(_QWORD *)&v241 = v255;
      WTF::tryMakeStringFromAdapters<WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>>((uint64_t)&buf, (uint64_t *)v249, (uint64_t *)v243, &v245.value, (uint64_t *)&v241, &v240);
      if (!(_QWORD)v240)
      {
        __break(0xC471u);
        JUMPOUT(0x1947786F4);
      }
      v74 = v255;
      v255 = 0;
      if (v74)
      {
        if (*(_DWORD *)v74 == 2)
          WTF::StringImpl::destroy(v74, v73);
        else
          *(_DWORD *)v74 -= 2;
      }
      v75 = v256;
      v256 = 0;
      if (v75)
      {
        if (*(_DWORD *)v75 == 2)
          WTF::StringImpl::destroy(v75, v73);
        else
          *(_DWORD *)v75 -= 2;
      }
      v76 = v257;
      v257 = 0;
      if (v76)
      {
        if (*(_DWORD *)v76 == 2)
          WTF::StringImpl::destroy(v76, v73);
        else
          *(_DWORD *)v76 -= 2;
      }
      v77 = v258;
      v258 = 0;
      if (v77)
      {
        if (*(_DWORD *)v77 == 2)
          WTF::StringImpl::destroy(v77, v73);
        else
          *(_DWORD *)v77 -= 2;
      }
      v78 = v259;
      v259 = 0;
      if (v78)
      {
        if (*(_DWORD *)v78 == 2)
          WTF::StringImpl::destroy(v78, v73);
        else
          *(_DWORD *)v78 -= 2;
      }
      v79 = qword_1ECE7C4A0;
      v80 = (WTF *)os_log_type_enabled((os_log_t)qword_1ECE7C4A0, OS_LOG_TYPE_DEFAULT);
      if ((_DWORD)v80)
      {
        WTF::String::utf8();
        v82 = v249[0] ? (char *)v249[0] + 16 : 0;
        LODWORD(buf) = 136446210;
        *(_QWORD *)((char *)&buf + 4) = v82;
        _os_log_impl(&dword_1940B8000, v79, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);
        v80 = v249[0];
        v249[0] = 0;
        if (v80)
        {
          if (*(_DWORD *)v80 == 1)
            v80 = (WTF *)WTF::fastFree(v80, v81);
          else
            --*(_DWORD *)v80;
        }
      }
      if (WebCore::LogMedia && byte_1ECE7C490 >= 4u)
      {
        v83 = (unsigned __int8 *)MEMORY[0x1E0CBF890];
        while (1)
        {
          v84 = *v83;
          if ((v84 & 1) != 0)
            break;
          v85 = __ldaxr(v83);
          if (v85 == v84)
          {
            if (!__stxr(v84 | 1, v83))
            {
              v233 = v70;
              v187 = WTF::Logger::observers(v80);
              v188 = *(unsigned int *)(v187 + 12);
              if ((_DWORD)v188)
              {
                v189 = *(uint64_t **)v187;
                v235 = *(_QWORD *)v187 + 8 * v188;
                do
                {
                  v190 = *v189;
                  LODWORD(buf) = 0;
                  WTF::Logger::LogSiteIdentifier::toString((WTF::Logger::LogSiteIdentifier *)v260);
                  LODWORD(v265) = 0;
                  WTF::String::String((WTF::String *)&v266, "did change '");
                  v267 = 0;
                  WTF::String::String((WTF::String *)&v268, v72);
                  v269 = 0;
                  WTF::String::String((WTF::String *)&v270, "' to ");
                  v271 = 0;
                  WTF::String::String((WTF::String *)v272, (const char *)v238);
                  v249[0] = 0;
                  v249[1] = 0;
                  v191 = (WTF::Logger *)WTF::fastMalloc((WTF *)0x50);
                  LODWORD(v249[1]) = 5;
                  v249[0] = v191;
                  v192 = HIDWORD(v249[1]);
                  *((_DWORD *)v191 + 4 * HIDWORD(v249[1])) = buf;
                  v193 = *((_QWORD *)&buf + 1);
                  if (*((_QWORD *)&buf + 1))
                    **((_DWORD **)&buf + 1) += 2;
                  *((_QWORD *)v191 + 2 * v192 + 1) = v193;
                  *((_DWORD *)v191 + 4 * (v192 + 1)) = (_DWORD)v265;
                  v194 = v266;
                  if (v266)
                    *(_DWORD *)v266 += 2;
                  *((_QWORD *)v191 + 2 * (v192 + 1) + 1) = v194;
                  *((_DWORD *)v191 + 4 * (v192 + 2)) = v267;
                  v195 = v268;
                  if (v268)
                    *(_DWORD *)v268 += 2;
                  *((_QWORD *)v191 + 2 * (v192 + 2) + 1) = v195;
                  *((_DWORD *)v191 + 4 * (v192 + 3)) = v269;
                  v196 = v270;
                  if (v270)
                    *(_DWORD *)v270 += 2;
                  *((_QWORD *)v191 + 2 * (v192 + 3) + 1) = v196;
                  *((_DWORD *)v191 + 4 * (v192 + 4)) = v271;
                  v197 = v272[0];
                  if (v272[0])
                    *(_DWORD *)v272[0] += 2;
                  *((_QWORD *)v191 + 2 * (v192 + 4) + 1) = v197;
                  HIDWORD(v249[1]) = v192 + 5;
                  (*(void (**)(uint64_t, char *, uint64_t, WTF::Logger **))(*(_QWORD *)v190 + 16))(v190, &WebCore::LogMedia, 4, v249);
                  v198 = v249[0];
                  if (HIDWORD(v249[1]))
                  {
                    v199 = v72;
                    v200 = 16 * HIDWORD(v249[1]);
                    v201 = (WTF::StringImpl **)((char *)v249[0] + 8);
                    do
                    {
                      v202 = *v201;
                      *v201 = 0;
                      if (v202)
                      {
                        if (*(_DWORD *)v202 == 2)
                          WTF::StringImpl::destroy(v202, (WTF::StringImpl *)v81);
                        else
                          *(_DWORD *)v202 -= 2;
                      }
                      v201 += 2;
                      v200 -= 16;
                    }
                    while (v200);
                    v198 = v249[0];
                    v72 = v199;
                  }
                  if (v198)
                  {
                    v249[0] = 0;
                    LODWORD(v249[1]) = 0;
                    WTF::fastFree(v198, v81);
                  }
                  v203 = (WTF::StringImpl *)v272[0];
                  v272[0] = 0;
                  if (v203)
                  {
                    if (*(_DWORD *)v203 == 2)
                      WTF::StringImpl::destroy(v203, (WTF::StringImpl *)v81);
                    else
                      *(_DWORD *)v203 -= 2;
                  }
                  v204 = v270;
                  v270 = 0;
                  if (v204)
                  {
                    if (*(_DWORD *)v204 == 2)
                      WTF::StringImpl::destroy(v204, (WTF::StringImpl *)v81);
                    else
                      *(_DWORD *)v204 -= 2;
                  }
                  v205 = v268;
                  v268 = 0;
                  if (v205)
                  {
                    if (*(_DWORD *)v205 == 2)
                      WTF::StringImpl::destroy(v205, (WTF::StringImpl *)v81);
                    else
                      *(_DWORD *)v205 -= 2;
                  }
                  v206 = v266;
                  v266 = 0;
                  if (v206)
                  {
                    if (*(_DWORD *)v206 == 2)
                      WTF::StringImpl::destroy(v206, (WTF::StringImpl *)v81);
                    else
                      *(_DWORD *)v206 -= 2;
                  }
                  v207 = (WTF::StringImpl *)*((_QWORD *)&buf + 1);
                  *((_QWORD *)&buf + 1) = 0;
                  if (v207)
                  {
                    if (*(_DWORD *)v207 == 2)
                      WTF::StringImpl::destroy(v207, (WTF::StringImpl *)v81);
                    else
                      *(_DWORD *)v207 -= 2;
                  }
                  ++v189;
                }
                while (v189 != (uint64_t *)v235);
              }
              v210 = __ldxr(v83);
              if (v210 == 1)
              {
                v70 = v233;
                if (!__stlxr(0, v83))
                  break;
              }
              else
              {
                __clrex();
                v70 = v233;
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
      v215 = (WTF::StringImpl *)v240;
      *(_QWORD *)&v240 = 0;
      if (v215)
      {
        if (*(_DWORD *)v215 == 2)
        {
          WTF::StringImpl::destroy(v215, (WTF::StringImpl *)v81);
          if (!v70)
            return;
LABEL_511:
          CFRelease(v70);
          return;
        }
        *(_DWORD *)v215 -= 2;
      }
    }
    if (!v70)
      return;
    goto LABEL_511;
  }
  v48 = *(_QWORD *)(a2 + 280);
  v49 = (const char *)objc_msgSend(*(id *)(a1 + 8), "UTF8String");
  if (v4)
  {
    objc_msgSend(v4, "CMTimeValue");
    v50 = (CMTimeValue)v249[0];
    LODWORD(v51) = v249[1];
    v52 = HIDWORD(v249[1]);
  }
  else
  {
    LODWORD(v51) = 0;
    v50 = 0;
    v52 = 0;
    v249[0] = 0;
    v249[1] = 0;
    *(_QWORD *)&v250 = 0;
  }
  v123 = v52 & 1;
  if ((~v52 & 3) == 0)
    v123 = v52 & 1 | 2;
  if ((~v52 & 5) == 0)
    v123 |= 4u;
  if ((~v52 & 9) == 0)
    v123 |= 8u;
  if ((~v52 & 0x11) != 0)
    v124 = v123;
  else
    v124 = v123 | 0x10;
  v126 = (v124 & 1) == 0 || (_DWORD)v51 != 0;
  if (v50 >= 0)
    v127 = 5;
  else
    v127 = 9;
  if (!v126)
    v124 = v127;
  v51 = v51;
  if (!v126)
  {
    v50 >>= 63;
    v51 = 1;
  }
  v245.value = v50;
  *(_QWORD *)&v245.timescale = v51 | ((unint64_t)v124 << 32);
  if (!*(_BYTE *)(v48 + 12) || !WebCore::LogMedia || byte_1ECE7C490 < 4u)
    return;
  WTF::Logger::LogSiteIdentifier::toString((WTF::Logger::LogSiteIdentifier *)v260);
  WTF::String::String((WTF::String *)&v256, "did change '");
  WTF::String::String((WTF::String *)&v255, v49);
  WTF::String::String((WTF::String *)&v254, "' to ");
  WTF::MediaTime::toJSONString((WTF::MediaTime *)&v245);
  *(_QWORD *)&buf = v257;
  v243[0] = v256;
  *(_QWORD *)&v241 = v255;
  *(_QWORD *)&v240 = v254;
  v259 = v253;
  WTF::tryMakeStringFromAdapters<WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>>((uint64_t)&buf, (uint64_t *)v243, (uint64_t *)&v241, (uint64_t *)&v240, (uint64_t *)&v259, &v258);
  if (!v258)
    goto LABEL_590;
  v129 = v253;
  v253 = 0;
  if (v129)
  {
    if (*(_DWORD *)v129 == 2)
      WTF::StringImpl::destroy(v129, v128);
    else
      *(_DWORD *)v129 -= 2;
  }
  v130 = v254;
  v254 = 0;
  if (v130)
  {
    if (*(_DWORD *)v130 == 2)
      WTF::StringImpl::destroy(v130, v128);
    else
      *(_DWORD *)v130 -= 2;
  }
  v131 = v255;
  v255 = 0;
  if (v131)
  {
    if (*(_DWORD *)v131 == 2)
      WTF::StringImpl::destroy(v131, v128);
    else
      *(_DWORD *)v131 -= 2;
  }
  v132 = v256;
  v256 = 0;
  if (v132)
  {
    if (*(_DWORD *)v132 == 2)
      WTF::StringImpl::destroy(v132, v128);
    else
      *(_DWORD *)v132 -= 2;
  }
  v133 = v257;
  v257 = 0;
  if (v133)
  {
    if (*(_DWORD *)v133 == 2)
      WTF::StringImpl::destroy(v133, v128);
    else
      *(_DWORD *)v133 -= 2;
  }
  v134 = qword_1ECE7C4A0;
  v135 = (WTF *)os_log_type_enabled((os_log_t)qword_1ECE7C4A0, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)v135)
  {
    WTF::String::utf8();
    v136 = v243[0] ? (char *)v243[0] + 16 : 0;
    LODWORD(buf) = 136446210;
    *(_QWORD *)((char *)&buf + 4) = v136;
    _os_log_impl(&dword_1940B8000, v134, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);
    v135 = v243[0];
    v243[0] = 0;
    if (v135)
    {
      if (*(_DWORD *)v135 == 1)
        v135 = (WTF *)WTF::fastFree(v135, v65);
      else
        --*(_DWORD *)v135;
    }
  }
  if (WebCore::LogMedia && byte_1ECE7C490 >= 4u)
  {
    v137 = (unsigned __int8 *)MEMORY[0x1E0CBF890];
    while (1)
    {
      v138 = *v137;
      if ((v138 & 1) != 0)
        break;
      v139 = __ldaxr(v137);
      if (v139 == v138)
      {
        if (!__stxr(v138 | 1, v137))
        {
          v166 = WTF::Logger::observers(v135);
          v167 = *(unsigned int *)(v166 + 12);
          if ((_DWORD)v167)
          {
            v168 = *(uint64_t **)v166;
            v236 = *(_QWORD *)v166 + 8 * v167;
            do
            {
              v169 = *v168;
              LODWORD(buf) = 0;
              WTF::Logger::LogSiteIdentifier::toString((WTF::Logger::LogSiteIdentifier *)v260);
              LODWORD(v265) = 0;
              WTF::String::String((WTF::String *)&v266, "did change '");
              v267 = 0;
              WTF::String::String((WTF::String *)&v268, v49);
              v269 = 0;
              WTF::String::String((WTF::String *)&v270, "' to ");
              v271 = 1;
              WTF::MediaTime::toJSONString((WTF::MediaTime *)&v245);
              v243[0] = 0;
              v243[1] = 0;
              v170 = (WTF::Logger *)WTF::fastMalloc((WTF *)0x50);
              LODWORD(v243[1]) = 5;
              v243[0] = v170;
              v171 = HIDWORD(v243[1]);
              *((_DWORD *)v170 + 4 * HIDWORD(v243[1])) = buf;
              v172 = *((_QWORD *)&buf + 1);
              if (*((_QWORD *)&buf + 1))
                **((_DWORD **)&buf + 1) += 2;
              *((_QWORD *)v170 + 2 * v171 + 1) = v172;
              *((_DWORD *)v170 + 4 * (v171 + 1)) = (_DWORD)v265;
              v173 = v266;
              if (v266)
                *(_DWORD *)v266 += 2;
              *((_QWORD *)v170 + 2 * (v171 + 1) + 1) = v173;
              *((_DWORD *)v170 + 4 * (v171 + 2)) = v267;
              v174 = v268;
              if (v268)
                *(_DWORD *)v268 += 2;
              *((_QWORD *)v170 + 2 * (v171 + 2) + 1) = v174;
              *((_DWORD *)v170 + 4 * (v171 + 3)) = v269;
              v175 = v270;
              if (v270)
                *(_DWORD *)v270 += 2;
              *((_QWORD *)v170 + 2 * (v171 + 3) + 1) = v175;
              *((_DWORD *)v170 + 4 * (v171 + 4)) = v271;
              v176 = v272[0];
              if (v272[0])
                *(_DWORD *)v272[0] += 2;
              *((_QWORD *)v170 + 2 * (v171 + 4) + 1) = v176;
              HIDWORD(v243[1]) = v171 + 5;
              (*(void (**)(uint64_t, char *, uint64_t, WTF::Logger **))(*(_QWORD *)v169 + 16))(v169, &WebCore::LogMedia, 4, v243);
              v177 = v243[0];
              if (HIDWORD(v243[1]))
              {
                v178 = v49;
                v179 = 16 * HIDWORD(v243[1]);
                v180 = (WTF::StringImpl **)((char *)v243[0] + 8);
                do
                {
                  v181 = *v180;
                  *v180 = 0;
                  if (v181)
                  {
                    if (*(_DWORD *)v181 == 2)
                      WTF::StringImpl::destroy(v181, (WTF::StringImpl *)v65);
                    else
                      *(_DWORD *)v181 -= 2;
                  }
                  v180 += 2;
                  v179 -= 16;
                }
                while (v179);
                v177 = v243[0];
                v49 = v178;
              }
              if (v177)
              {
                v243[0] = 0;
                LODWORD(v243[1]) = 0;
                WTF::fastFree(v177, v65);
              }
              v182 = (WTF::StringImpl *)v272[0];
              v272[0] = 0;
              if (v182)
              {
                if (*(_DWORD *)v182 == 2)
                  WTF::StringImpl::destroy(v182, (WTF::StringImpl *)v65);
                else
                  *(_DWORD *)v182 -= 2;
              }
              v183 = v270;
              v270 = 0;
              if (v183)
              {
                if (*(_DWORD *)v183 == 2)
                  WTF::StringImpl::destroy(v183, (WTF::StringImpl *)v65);
                else
                  *(_DWORD *)v183 -= 2;
              }
              v184 = v268;
              v268 = 0;
              if (v184)
              {
                if (*(_DWORD *)v184 == 2)
                  WTF::StringImpl::destroy(v184, (WTF::StringImpl *)v65);
                else
                  *(_DWORD *)v184 -= 2;
              }
              v185 = v266;
              v266 = 0;
              if (v185)
              {
                if (*(_DWORD *)v185 == 2)
                  WTF::StringImpl::destroy(v185, (WTF::StringImpl *)v65);
                else
                  *(_DWORD *)v185 -= 2;
              }
              v186 = (WTF::StringImpl *)*((_QWORD *)&buf + 1);
              *((_QWORD *)&buf + 1) = 0;
              if (v186)
              {
                if (*(_DWORD *)v186 == 2)
                  WTF::StringImpl::destroy(v186, (WTF::StringImpl *)v65);
                else
                  *(_DWORD *)v186 -= 2;
              }
              ++v168;
            }
            while (v168 != (uint64_t *)v236);
          }
          v209 = __ldxr(v137);
          if (v209 == 1)
          {
            if (!__stlxr(0, v137))
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
  v208 = v258;
  v258 = 0;
  if (v208)
  {
LABEL_503:
    if (*(_DWORD *)v208 == 2)
      WTF::StringImpl::destroy(v208, (WTF::StringImpl *)v65);
    else
      *(_DWORD *)v208 -= 2;
  }
}

- (_QWORD)legibleOutput:(_QWORD *)a1 didOutputAttributedStrings:nativeSampleBuffers:forItemTime:
{
  const void *v2;
  const void *v3;
  const void *v4;

  *a1 = &off_1E3205030;
  v2 = (const void *)a1[4];
  a1[4] = 0;
  if (v2)
    CFRelease(v2);
  v3 = (const void *)a1[3];
  a1[3] = 0;
  if (v3)
    CFRelease(v3);
  v4 = (const void *)a1[2];
  a1[2] = 0;
  if (v4)
    CFRelease(v4);
  return a1;
}

- (uint64_t)legibleOutput:(WTF *)this didOutputAttributedStrings:(void *)a2 nativeSampleBuffers:forItemTime:
{
  const void *v3;
  const void *v4;
  const void *v5;

  *(_QWORD *)this = &off_1E3205030;
  v3 = (const void *)*((_QWORD *)this + 4);
  *((_QWORD *)this + 4) = 0;
  if (v3)
    CFRelease(v3);
  v4 = (const void *)*((_QWORD *)this + 3);
  *((_QWORD *)this + 3) = 0;
  if (v4)
    CFRelease(v4);
  v5 = (const void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v5)
    CFRelease(v5);
  return WTF::fastFree(this, a2);
}

- (uint64_t)legibleOutput:(***WTF:(void>::call(uint64_t *)(result :Detail::CallableWrapper<-[WebCoreAVFMovieObserver)legibleOutput:didOutputAttributedStrings:nativeSampleBuffers:forItemTime:]::$_31 didOutputAttributedStrings:nativeSampleBuffers:forItemTime:
{
  uint64_t (**v1)();
  uint64_t (*v2)();
  uint64_t (***v3)();
  uint64_t (*v4)();
  int v6;
  uint64_t (**v7)();
  uint64_t (**v8)();
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (**v13)();
  int v14;
  __int128 v15;
  uint64_t (**v16)();
  uint64_t (***v17)();

  v1 = result[1];
  v2 = v1[1];
  if (!v2)
    return result;
  v3 = result;
  v4 = v1[2];
  if (__ldaxr((unsigned __int8 *)v2))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)v2))
  {
    goto LABEL_6;
  }
  result = (uint64_t (***)())MEMORY[0x19AEA534C](v2);
LABEL_6:
  if (*((_QWORD *)v2 + 3))
    ++*((_QWORD *)v2 + 1);
  else
    v4 = 0;
  v6 = __ldxr((unsigned __int8 *)v2);
  if (v6 != 1)
  {
    __clrex();
LABEL_14:
    result = (uint64_t (***)())WTF::Lock::unlockSlow((WTF::Lock *)v2);
    if (!v4)
      return result;
    goto LABEL_15;
  }
  if (__stlxr(0, (unsigned __int8 *)v2))
    goto LABEL_14;
  if (!v4)
    return result;
LABEL_15:
  v7 = v3[3];
  v8 = v3[4];
  v3[3] = 0;
  v3[4] = 0;
  v15 = *(_OWORD *)(v3 + 5);
  v16 = v3[7];
  v9 = WTF::fastMalloc((WTF *)0x38);
  *(_QWORD *)v9 = &off_1E3205058;
  *(_QWORD *)(v9 + 8) = v4;
  *(_QWORD *)(v9 + 16) = v7;
  *(_QWORD *)(v9 + 24) = v8;
  *(_QWORD *)(v9 + 48) = v16;
  *(_OWORD *)(v9 + 32) = v15;
  v17 = (uint64_t (***)())v9;
  v10 = *((_QWORD *)v4 + 11);
  if (!v10)
  {
    v17 = 0;
    v13 = &off_1E3205058;
    return (uint64_t (***)())v13[1]();
  }
  v11 = *((_QWORD *)v4 + 12);
  if (__ldaxr((unsigned __int8 *)v10))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)v10))
  {
    goto LABEL_21;
  }
  MEMORY[0x19AEA534C](v10);
LABEL_21:
  if (*(_QWORD *)(v10 + 24))
    ++*(_QWORD *)(v10 + 8);
  else
    v11 = 0;
  v14 = __ldxr((unsigned __int8 *)v10);
  if (v14 != 1)
  {
    __clrex();
    goto LABEL_28;
  }
  if (__stlxr(0, (unsigned __int8 *)v10))
LABEL_28:
    WTF::Lock::unlockSlow((WTF::Lock *)v10);
  if (v11)
  {
    (*(void (**)(_QWORD, uint64_t (****)()))(**(_QWORD **)(*(_QWORD *)(v11 + 8) + 8) + 592))(*(_QWORD *)(*(_QWORD *)(v11 + 8) + 8), &v17);
    WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::MediaPlayer,(WTF::DestructionThread)1>(*(unsigned __int8 **)v11);
  }
  result = v17;
  v17 = 0;
  if (result)
  {
    v13 = *result;
    return (uint64_t (***)())v13[1]();
  }
  return result;
}

- (_QWORD)legibleOutput:didOutputAttributedStrings:nativeSampleBuffers:forItemTime:
{
  const void *v2;
  const void *v3;
  uint64_t v4;

  *a1 = &off_1E3205058;
  v2 = (const void *)a1[3];
  a1[3] = 0;
  if (v2)
    CFRelease(v2);
  v3 = (const void *)a1[2];
  a1[2] = 0;
  if (v3)
    CFRelease(v3);
  v4 = a1[1];
  a1[1] = 0;
  if (v4)
    WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::MediaPlayerPrivateAVFoundation,(WTF::DestructionThread)1>(*(unsigned __int8 **)(v4 + 48));
  return a1;
}

- (uint64_t)legibleOutput:didOutputAttributedStrings:nativeSampleBuffers:forItemTime:
{
  int v2;
  uint64_t v3;
  unsigned __int8 v4;
  uint64_t v5;
  unsigned __int8 v6;
  _BOOL4 v8;
  char v9;
  BOOL v10;
  uint64_t v11;
  const WTF::MediaTime *v12;
  const char **v13;
  _QWORD *v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  const char *v19;
  unint64_t v20;
  const char *v21;
  uint64_t v22;

  ++WebCore::ScriptDisallowedScope::s_count;
  v3 = *(unsigned int *)(a1 + 40);
  v2 = *(_DWORD *)(a1 + 44);
  v4 = v2 & 1;
  if ((~v2 & 3) == 0)
    v4 = v2 & 1 | 2;
  if ((~v2 & 5) == 0)
    v4 |= 4u;
  if ((~v2 & 9) == 0)
    v4 |= 8u;
  v5 = *(_QWORD *)(a1 + 32);
  if ((~v2 & 0x11) != 0)
    v6 = v4;
  else
    v6 = v4 | 0x10;
  v8 = (v6 & 1) == 0 || v3 != 0;
  if (v5 >= 0)
    v9 = 5;
  else
    v9 = 9;
  v10 = !v8;
  if (v8)
  {
    v11 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v6 = v9;
    v11 = v5 >> 63;
  }
  if (v10)
    v3 = 1;
  v19 = (const char *)v11;
  v20 = v3 | ((unint64_t)v6 << 32);
  v12 = (const WTF::MediaTime *)WTF::MediaTime::zeroTime((WTF::MediaTime *)a1);
  if (WTF::MediaTime::compare((WTF::MediaTime *)&v19, v12) == -1)
    v13 = (const char **)v12;
  else
    v13 = &v19;
  v18 = *(_OWORD *)v13;
  v14 = *(_QWORD **)(a1 + 8);
  result = v14[84];
  if (result)
  {
    result = (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, __int128 *))(*(_QWORD *)result + 208))(result, *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), &v18);
  }
  else
  {
    v17 = v14[35];
    v16 = v14[36];
    v19 = "MediaPlayerPrivateAVFoundationObjC";
    v20 = 35;
    v21 = "processCue";
    v22 = v16;
    if (*(_BYTE *)(v17 + 12))
      result = WTF::Logger::log<WTF::Logger::LogSiteIdentifier,char [22]>((uint64_t)&WebCore::LogMedia, 0, (WTF::Logger::LogSiteIdentifier *)&v19, "no current text track");
  }
  --WebCore::ScriptDisallowedScope::s_count;
  return result;
}

- (_QWORD)outputSequenceWasFlushed:(_QWORD *)a1
{
  const void *v2;

  *a1 = &off_1E3205080;
  v2 = (const void *)a1[2];
  a1[2] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

- (uint64_t)outputSequenceWasFlushed:(WTF *)this
{
  const void *v3;

  *(_QWORD *)this = &off_1E3205080;
  v3 = (const void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v3)
    CFRelease(v3);
  return WTF::fastFree(this, a2);
}

- (uint64_t)outputSequenceWasFlushed:(***WTF:(void>::call(uint64_t *)(result :Detail::CallableWrapper<-[WebCoreAVFMovieObserver)outputSequenceWasFlushed:]::$_32
{
  uint64_t (**v1)();
  uint64_t (*v2)();
  uint64_t (*v3)();
  int v5;
  uint64_t (***v6)();
  uint64_t (**v7)();
  uint64_t v8;
  uint64_t v9;
  int v11;
  uint64_t (***v12)();

  v1 = result[1];
  v2 = v1[1];
  if (!v2)
    return result;
  v3 = v1[2];
  if (__ldaxr((unsigned __int8 *)v2))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)v2))
  {
    goto LABEL_6;
  }
  result = (uint64_t (***)())MEMORY[0x19AEA534C](v2);
LABEL_6:
  if (*((_QWORD *)v2 + 3))
    ++*((_QWORD *)v2 + 1);
  else
    v3 = 0;
  v5 = __ldxr((unsigned __int8 *)v2);
  if (v5 != 1)
  {
    __clrex();
LABEL_14:
    result = (uint64_t (***)())WTF::Lock::unlockSlow((WTF::Lock *)v2);
    if (!v3)
      return result;
    goto LABEL_15;
  }
  if (__stlxr(0, (unsigned __int8 *)v2))
    goto LABEL_14;
  if (!v3)
    return result;
LABEL_15:
  v6 = (uint64_t (***)())WTF::fastMalloc((WTF *)0x10);
  v7 = &off_1E32050A8;
  *v6 = &off_1E32050A8;
  v6[1] = (uint64_t (**)())v3;
  v12 = v6;
  v8 = *((_QWORD *)v3 + 11);
  if (!v8)
  {
    v12 = 0;
    return (uint64_t (***)())v7[1]();
  }
  v9 = *((_QWORD *)v3 + 12);
  if (__ldaxr((unsigned __int8 *)v8))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)v8))
  {
    goto LABEL_21;
  }
  MEMORY[0x19AEA534C](v8);
LABEL_21:
  if (*(_QWORD *)(v8 + 24))
    ++*(_QWORD *)(v8 + 8);
  else
    v9 = 0;
  v11 = __ldxr((unsigned __int8 *)v8);
  if (v11 != 1)
  {
    __clrex();
    goto LABEL_28;
  }
  if (__stlxr(0, (unsigned __int8 *)v8))
LABEL_28:
    WTF::Lock::unlockSlow((WTF::Lock *)v8);
  if (v9)
  {
    (*(void (**)(_QWORD, uint64_t (****)()))(**(_QWORD **)(*(_QWORD *)(v9 + 8) + 8) + 592))(*(_QWORD *)(*(_QWORD *)(v9 + 8) + 8), &v12);
    WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::MediaPlayer,(WTF::DestructionThread)1>(*(unsigned __int8 **)v9);
  }
  result = v12;
  v12 = 0;
  if (result)
  {
    v7 = *result;
    return (uint64_t (***)())v7[1]();
  }
  return result;
}

- (_QWORD)outputSequenceWasFlushed:
{
  uint64_t v2;

  v2 = a1[1];
  *a1 = &off_1E32050A8;
  a1[1] = 0;
  if (v2)
    WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::MediaPlayerPrivateAVFoundation,(WTF::DestructionThread)1>(*(unsigned __int8 **)(v2 + 48));
  return a1;
}

- (uint64_t)outputSequenceWasFlushed:
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  _QWORD v6[4];

  v1 = *(_QWORD **)(a1 + 8);
  v2 = v1[35];
  v3 = v1[36];
  v6[0] = "MediaPlayerPrivateAVFoundationObjC";
  v6[1] = 35;
  v6[2] = "flushCues";
  v6[3] = v3;
  if (*(_BYTE *)(v2 + 12))
  {
    if (WebCore::LogMedia && byte_1ECE7C490 >= 3u)
      WTF::Logger::log<WTF::Logger::LogSiteIdentifier>((uint64_t)&WebCore::LogMedia, 3, (WTF::Logger::LogSiteIdentifier *)v6);
  }
  result = v1[84];
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 216))(result);
  return result;
}

- (_QWORD)metadataOutput:(_QWORD *)a1 didOutputTimedMetadataGroups:fromPlayerItemTrack:
{
  const void *v2;
  uint64_t v3;

  *a1 = &off_1E32050D0;
  v2 = (const void *)a1[2];
  a1[2] = 0;
  if (v2)
    CFRelease(v2);
  v3 = a1[1];
  a1[1] = 0;
  if (v3)
    WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::MediaPlayerPrivateAVFoundation,(WTF::DestructionThread)1>(*(unsigned __int8 **)(v3 + 48));
  return a1;
}

- (uint64_t)metadataOutput:(WTF *)this didOutputTimedMetadataGroups:(void *)a2 fromPlayerItemTrack:
{
  const void *v3;
  uint64_t v4;

  *(_QWORD *)this = &off_1E32050D0;
  v3 = (const void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v3)
    CFRelease(v3);
  v4 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = 0;
  if (v4)
    WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::MediaPlayerPrivateAVFoundation,(WTF::DestructionThread)1>(*(unsigned __int8 **)(v4 + 48));
  return WTF::fastFree(this, a2);
}

- (uint64_t)metadataOutput:(_QWORD *)a1 didOutputTimedMetadataGroups:fromPlayerItemTrack:
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const void *v8;
  const void *v9;
  CFTypeRef v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  ++WebCore::ScriptDisallowedScope::s_count;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = (void *)a1[2];
  result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  v4 = result;
  if (result)
  {
    v5 = *(_QWORD *)v12;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = a1[1];
        v8 = (const void *)objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v6), "items");
        v9 = v8;
        if (v8)
          CFRetain(v8);
        v10 = v9;
        WebCore::MediaPlayerPrivateAVFoundationObjC::metadataDidArrive(v7, &v10, (WTF::MediaTime *)(a1 + 3));
        if (v9)
          CFRelease(v9);
        ++v6;
      }
      while (v4 != v6);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v4 = result;
    }
    while (result);
  }
  --WebCore::ScriptDisallowedScope::s_count;
  return result;
}

- (_QWORD)metadataCollector:(_QWORD *)a1 didCollectDateRangeMetadataGroups:indexesOfNewGroups:indexesOfModifiedGroups:
{
  const void *v2;
  uint64_t v3;

  *a1 = &off_1E32050F8;
  v2 = (const void *)a1[2];
  a1[2] = 0;
  if (v2)
    CFRelease(v2);
  v3 = a1[1];
  a1[1] = 0;
  if (v3)
    WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::MediaPlayerPrivateAVFoundation,(WTF::DestructionThread)1>(*(unsigned __int8 **)(v3 + 48));
  return a1;
}

- (uint64_t)metadataCollector:(WTF *)this didCollectDateRangeMetadataGroups:(void *)a2 indexesOfNewGroups:indexesOfModifiedGroups:
{
  const void *v3;
  uint64_t v4;

  *(_QWORD *)this = &off_1E32050F8;
  v3 = (const void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v3)
    CFRelease(v3);
  v4 = *((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = 0;
  if (v4)
    WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::MediaPlayerPrivateAVFoundation,(WTF::DestructionThread)1>(*(unsigned __int8 **)(v4 + 48));
  return WTF::fastFree(this, a2);
}

- (void)metadataCollector:(uint64_t *)a1 didCollectDateRangeMetadataGroups:indexesOfNewGroups:indexesOfModifiedGroups:
{
  void *v2;
  uint64_t v3;
  uint64_t i;
  void *v5;
  double v6;
  double v7;
  WTF::MediaTime *v8;
  double v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  int v21;
  void *v22;
  int v23;
  int v24;
  double v25;
  id obj;
  uint64_t v27;
  WTF::MediaTime *v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;
  __int128 v34;
  uint64_t v35;
  __int128 v36;
  uint64_t v37;
  CFTypeRef v38;
  int v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  PAL *v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v2 = (void *)a1[2];
  v29 = a1[1];
  if (v2)
    CFRetain(v2);
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v46, v51, 16, v2);
  if (v3)
  {
    v27 = *(_QWORD *)v47;
    v28 = (WTF::MediaTime *)(a1 + 3);
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v47 != v27)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        objc_msgSend((id)objc_msgSend(v5, "startDate"), "timeIntervalSince1970");
        v7 = v6;
        v8 = (WTF::MediaTime *)objc_msgSend((id)objc_msgSend(v5, "endDate"), "timeIntervalSince1970");
        v44 = (PAL *)WTF::MediaTime::createWithDouble(v8, v9 - v7);
        v45 = v10;
        objc_msgSend((id)objc_msgSend(*(id *)(v29 + 424), "currentDate"), "timeIntervalSince1970");
        v12 = v11;
        if (v11 == 0.0)
        {
          v14 = 0.0;
        }
        else
        {
          WTF::MediaTime::toDouble(v28);
          v14 = v7 - (v12 - v13);
        }
        v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v16 = (void *)objc_msgSend(v5, "items");
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
        if (v17)
        {
          v18 = *(_QWORD *)v41;
          do
          {
            for (j = 0; j != v17; ++j)
            {
              if (*(_QWORD *)v41 != v18)
                objc_enumerationMutation(v16);
              v20 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * j), "mutableCopy");
              v22 = v20;
              if ((!v20 || (objc_msgSend(v20, "time"), (v39 & 1) == 0))
                && (PAL::softLinkCoreMediaCMTimeMakeWithSeconds((PAL *)0x989680, v14, v21),
                    v34 = v36,
                    v35 = v37,
                    objc_msgSend(v22, "setTime:", &v34),
                    !v22)
                || (objc_msgSend(v22, "duration"), (v39 & 1) == 0))
              {
                if ((v45 & 0x2000000000) != 0)
                {
                  WTF::MediaTime::toDouble((WTF::MediaTime *)&v44);
                  PAL::softLinkCoreMediaCMTimeMakeWithSeconds((PAL *)v45, v25, v24);
                }
                else
                {
                  PAL::softLinkCoreMediaCMTimeMake(v44, v45, v23);
                }
                HIDWORD(v32) = HIDWORD(v32) & 0xFFFFFFFE | BYTE4(v45) & 1 | BYTE4(v45) & 0xE;
                v31 = v33;
                v30 = v32;
                objc_msgSend(v22, "setDuration:", &v30);
              }
              objc_msgSend(v15, "addObject:", v22);
              if (v22)
                CFRelease(v22);
            }
            v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
          }
          while (v17);
        }
        v38 = v15;
        if (v15)
          CFRetain(v15);
        WebCore::MediaPlayerPrivateAVFoundationObjC::metadataDidArrive(v29, &v38, v28);
        if (v15)
        {
          CFRelease(v15);
          CFRelease(v15);
        }
      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    }
    while (v3);
  }
  if (obj)
    CFRelease(obj);
}

@end
