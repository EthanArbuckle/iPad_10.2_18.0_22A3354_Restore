@implementation WebQueuedVideoOutputDelegate

- (WebQueuedVideoOutputDelegate)initWithParent:(void *)a3
{
  void *v4;
  WebQueuedVideoOutputDelegate *v5;
  uint64_t v6;
  unsigned int *v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int *m_ptr;
  unsigned int v12;
  unsigned int v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)WebQueuedVideoOutputDelegate;
  v5 = -[WebQueuedVideoOutputDelegate init](&v15, sel_init);
  if (v5)
  {
    if (a3)
    {
      v6 = *((_QWORD *)a3 + 1);
      if (v6)
        goto LABEL_19;
      v6 = WTF::fastCompactMalloc((WTF *)0x10);
      *(_DWORD *)v6 = 1;
      *(_QWORD *)(v6 + 8) = a3;
      v7 = (unsigned int *)*((_QWORD *)a3 + 1);
      *((_QWORD *)a3 + 1) = v6;
      if (!v7)
        goto LABEL_19;
      do
      {
        v8 = __ldaxr(v7);
        v9 = v8 - 1;
      }
      while (__stlxr(v9, v7));
      if (!v9)
      {
        atomic_store(1u, v7);
        WTF::fastFree((WTF *)v7, v4);
      }
      v6 = *((_QWORD *)a3 + 1);
      if (v6)
      {
LABEL_19:
        do
          v10 = __ldaxr((unsigned int *)v6);
        while (__stlxr(v10 + 1, (unsigned int *)v6));
      }
    }
    else
    {
      v6 = 0;
    }
    m_ptr = (unsigned int *)v5->_parent.m_impl.m_ptr;
    v5->_parent.m_impl.m_ptr = (DefaultWeakPtrImpl *)v6;
    if (m_ptr)
    {
      do
      {
        v12 = __ldaxr(m_ptr);
        v13 = v12 - 1;
      }
      while (__stlxr(v13, m_ptr));
      if (!v13)
      {
        atomic_store(1u, m_ptr);
        WTF::fastFree((WTF *)m_ptr, v4);
      }
    }
  }
  return v5;
}

- (void)outputMediaDataWillChange:(id)a3
{
  WTF *v5;
  unsigned int v6;
  void *v7;
  const void *v8;
  uint64_t v9;
  unsigned __int8 v10;
  unsigned __int8 v11;
  _BOOL4 v13;
  char v14;
  BOOL v15;
  uint64_t v16;
  unint64_t v17;
  int v18;
  char *v19;
  uint64_t v20;
  char *v21;
  CFTypeRef v22;
  WTF *v23;
  int v24;
  unsigned int *m_ptr;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const void *v31;
  CFTypeRef cf;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  __int128 v36;
  uint64_t i;
  WTF *v38;
  uint64_t v39;

  v38 = 0;
  v39 = 0;
  if (a3)
  {
    v5 = 0;
    v6 = 0;
    v36 = 0uLL;
    for (i = 0; ; i = 0)
    {
      objc_msgSend(a3, "earliestAvailablePixelBufferItemTime");
      if ((BYTE12(v36) & 1) == 0)
        break;
      v34 = v36;
      v35 = i;
      v8 = (const void *)objc_msgSend(a3, "copyPixelBufferForItemTime:itemTimeForDisplay:", &v34, 0);
      if (!v8)
        break;
      v9 = DWORD2(v36);
      v10 = BYTE12(v36) & 1;
      if ((~HIDWORD(v36) & 3) == 0)
        v10 = BYTE12(v36) & 1 | 2;
      if ((~HIDWORD(v36) & 5) == 0)
        v10 |= 4u;
      if ((~HIDWORD(v36) & 9) == 0)
        v10 |= 8u;
      if ((~HIDWORD(v36) & 0x11) != 0)
        v11 = v10;
      else
        v11 = v10 | 0x10;
      v13 = (v11 & 1) == 0 || DWORD2(v36) != 0;
      if ((uint64_t)v36 >= 0)
        v14 = 5;
      else
        v14 = 9;
      v15 = !v13;
      if (v13)
      {
        v16 = v36;
      }
      else
      {
        v11 = v14;
        v16 = (uint64_t)v36 >> 63;
      }
      if (v15)
        v9 = 1;
      cf = v8;
      *(_QWORD *)&v33 = v16;
      *((_QWORD *)&v33 + 1) = v9 | ((unint64_t)v11 << 32);
      if (v6 == (_DWORD)v39)
      {
        v17 = WTF::Vector<WebCore::QueuedVideoOutput::VideoFrameEntry,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>((uint64_t)&v38, v6 + 1, (unint64_t)&cf);
        v18 = HIDWORD(v39);
        v5 = v38;
        v19 = (char *)v38 + 24 * HIDWORD(v39);
        v20 = *(_QWORD *)v17;
        *(_QWORD *)v17 = 0;
        *(_QWORD *)v19 = v20;
        *(_OWORD *)(v19 + 8) = *(_OWORD *)(v17 + 8);
      }
      else
      {
        v21 = (char *)v5 + 24 * v6;
        cf = 0;
        *(_QWORD *)v21 = v8;
        *(_OWORD *)(v21 + 8) = v33;
        v18 = HIDWORD(v39);
      }
      v6 = v18 + 1;
      HIDWORD(v39) = v18 + 1;
      v22 = cf;
      cf = 0;
      if (v22)
        CFRelease(v22);
      v36 = 0uLL;
    }
    v23 = v38;
    if (v6)
    {
      v24 = v39;
      v38 = 0;
      v39 = 0;
      m_ptr = (unsigned int *)self->_parent.m_impl.m_ptr;
      if (m_ptr)
      {
        do
          v26 = __ldaxr(m_ptr);
        while (__stlxr(v26 + 1, m_ptr));
      }
      v27 = WTF::fastMalloc((WTF *)0x20);
      *(_QWORD *)v27 = &off_1E3209F10;
      *(_QWORD *)(v27 + 8) = v23;
      *(_DWORD *)(v27 + 16) = v24;
      *(_DWORD *)(v27 + 20) = v6;
      *(_QWORD *)(v27 + 24) = m_ptr;
      *(_QWORD *)&v36 = v27;
      WTF::callOnMainRunLoop();
      v28 = v36;
      *(_QWORD *)&v36 = 0;
      if (v28)
        (*(void (**)(uint64_t))(*(_QWORD *)v28 + 8))(v28);
      v23 = v38;
      if (HIDWORD(v39))
      {
        v29 = 0;
        v30 = 24 * HIDWORD(v39);
        do
        {
          v31 = *(const void **)((char *)v23 + v29);
          *(_QWORD *)((char *)v23 + v29) = 0;
          if (v31)
            CFRelease(v31);
          v29 += 24;
        }
        while (v30 != v29);
      }
    }
    if (v23)
      WTF::fastFree(v23, v7);
  }
}

- (void)outputSequenceWasFlushed:(id)a3
{
  unsigned int *m_ptr;
  unsigned int v5;
  _QWORD *v6;
  _QWORD *v7;

  objc_msgSend(a3, "requestNotificationOfMediaDataChangeAsSoonAsPossible");
  m_ptr = (unsigned int *)self->_parent.m_impl.m_ptr;
  if (m_ptr)
  {
    do
      v5 = __ldaxr(m_ptr);
    while (__stlxr(v5 + 1, m_ptr));
  }
  v6 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v6 = &off_1E3209F38;
  v6[1] = m_ptr;
  v7 = v6;
  WTF::callOnMainRunLoop();
  if (v7)
    (*(void (**)(_QWORD *))(*v7 + 8))(v7);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  int v8;
  int v9;
  unsigned int *m_ptr;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("rate"), a4, a5, a6))
  {
    objc_msgSend((id)objc_msgSend(a5, "valueForKey:", *MEMORY[0x1E0CB2CB8]), "floatValue");
    v9 = v8;
    m_ptr = (unsigned int *)self->_parent.m_impl.m_ptr;
    if (m_ptr)
    {
      do
        v11 = __ldaxr(m_ptr);
      while (__stlxr(v11 + 1, m_ptr));
    }
    v12 = WTF::fastMalloc((WTF *)0x18);
    *(_QWORD *)v12 = &off_1E3209F60;
    *(_QWORD *)(v12 + 8) = m_ptr;
    *(_DWORD *)(v12 + 16) = v9;
    v13 = v12;
    WTF::ensureOnMainRunLoop();
    if (v13)
      (*(void (**)(uint64_t))(*(_QWORD *)v13 + 8))(v13);
  }
}

- (void).cxx_destruct
{
  unsigned int *m_ptr;
  unsigned int v4;
  unsigned int v5;

  m_ptr = (unsigned int *)self->_parent.m_impl.m_ptr;
  self->_parent.m_impl.m_ptr = 0;
  if (m_ptr)
  {
    do
    {
      v4 = __ldaxr(m_ptr);
      v5 = v4 - 1;
    }
    while (__stlxr(v5, m_ptr));
    if (!v5)
    {
      atomic_store(1u, m_ptr);
      WTF::fastFree((WTF *)m_ptr, (void *)a2);
    }
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

- (uint64_t)outputMediaDataWillChange:(uint64_t)a1
{
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;
  uint64_t v6;
  const void **v7;
  uint64_t v8;
  const void *v9;
  WTF *v10;

  *(_QWORD *)a1 = &off_1E3209F10;
  v3 = *(unsigned int **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = 0;
  if (v3)
  {
    do
    {
      v4 = __ldaxr(v3);
      v5 = v4 - 1;
    }
    while (__stlxr(v5, v3));
    if (!v5)
    {
      atomic_store(1u, v3);
      WTF::fastFree((WTF *)v3, a2);
    }
  }
  v6 = *(unsigned int *)(a1 + 20);
  if ((_DWORD)v6)
  {
    v7 = *(const void ***)(a1 + 8);
    v8 = 24 * v6;
    do
    {
      v9 = *v7;
      *v7 = 0;
      if (v9)
        CFRelease(v9);
      v7 += 3;
      v8 -= 24;
    }
    while (v8);
  }
  v10 = *(WTF **)(a1 + 8);
  if (v10)
  {
    *(_QWORD *)(a1 + 8) = 0;
    *(_DWORD *)(a1 + 16) = 0;
    WTF::fastFree(v10, a2);
  }
  return a1;
}

- (uint64_t)outputMediaDataWillChange:(WTF *)this
{
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;
  uint64_t v6;
  const void **v7;
  uint64_t v8;
  const void *v9;
  WTF *v10;

  *(_QWORD *)this = &off_1E3209F10;
  v3 = (unsigned int *)*((_QWORD *)this + 3);
  *((_QWORD *)this + 3) = 0;
  if (v3)
  {
    do
    {
      v4 = __ldaxr(v3);
      v5 = v4 - 1;
    }
    while (__stlxr(v5, v3));
    if (!v5)
    {
      atomic_store(1u, v3);
      WTF::fastFree((WTF *)v3, a2);
    }
  }
  v6 = *((unsigned int *)this + 5);
  if ((_DWORD)v6)
  {
    v7 = (const void **)*((_QWORD *)this + 1);
    v8 = 24 * v6;
    do
    {
      v9 = *v7;
      *v7 = 0;
      if (v9)
        CFRelease(v9);
      v7 += 3;
      v8 -= 24;
    }
    while (v8);
  }
  v10 = (WTF *)*((_QWORD *)this + 1);
  if (v10)
  {
    *((_QWORD *)this + 1) = 0;
    *((_DWORD *)this + 4) = 0;
    WTF::fastFree(v10, a2);
  }
  return WTF::fastFree(this, a2);
}

- (uint64_t)outputMediaDataWillChange:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  int v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  unsigned __int8 v18;
  unsigned __int8 v19;
  _BOOL4 v21;
  char v22;
  uint64_t v23;
  char v24;
  uint64_t *v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  unsigned int v32;
  unsigned int v33;
  uint64_t v34;
  int v35;
  unsigned int v36;
  uint64_t v38;
  uint64_t v39;
  int v40;
  int v41;
  __int128 v42;

  v3 = *(_QWORD *)(result + 24);
  if (v3)
  {
    v4 = *(_QWORD *)(v3 + 8);
    if (v4)
    {
      v5 = result;
      v6 = (uint64_t *)(v4 + 88);
      v7 = *(_QWORD *)(v4 + 88);
      if (!v7)
      {
LABEL_4:
        *(_DWORD *)(v4 + 96) = 0;
LABEL_5:
        *(_DWORD *)(v4 + 100) = 0;
        goto LABEL_6;
      }
      v11 = *(unsigned int *)(v7 - 4);
      if (!(_DWORD)v11)
        goto LABEL_13;
      v27 = 0;
      do
      {
        v28 = --v11;
        v29 = *(_QWORD *)(v7 + 8 * v11);
        if ((unint64_t)(v29 + 1) >= 2 && !*(_QWORD *)(v29 + 8))
        {
          v38 = v11;
          v30 = v6;
          v31 = v11;
          *(_QWORD *)(v7 + 8 * v11) = 0;
          do
          {
            v32 = __ldaxr((unsigned int *)v29);
            v33 = v32 - 1;
          }
          while (__stlxr(v33, (unsigned int *)v29));
          if (!v33)
          {
            atomic_store(1u, (unsigned int *)v29);
            WTF::fastFree((WTF *)v29, a2);
          }
          v28 = v31;
          *(_QWORD *)(v7 + 8 * v31) = -1;
          ++v27;
          v6 = v30;
          v11 = v38;
        }
      }
      while (v28);
      v7 = *v6;
      if (v27)
      {
        *(_DWORD *)(v7 - 16) += v27;
        v34 = *v6;
        if (*v6)
          v35 = *(_DWORD *)(v34 - 12);
        else
          v35 = 0;
        *(_DWORD *)(v34 - 12) = v35 - v27;
        v7 = *v6;
      }
      if (!v7)
        goto LABEL_4;
      v36 = *(_DWORD *)(v7 - 4);
      if (v36 < 9 || 6 * *(_DWORD *)(v7 - 12) >= v36)
      {
LABEL_13:
        *(_DWORD *)(v4 + 96) = 0;
      }
      else
      {
        v6 = (uint64_t *)WTF::HashTable<WTF::Ref<WTF::DefaultWeakPtrImpl,WTF::RawPtrTraits<WTF::DefaultWeakPtrImpl>,WTF::DefaultRefDerefTraits<WTF::DefaultWeakPtrImpl>>,WTF::Ref<WTF::DefaultWeakPtrImpl,WTF::RawPtrTraits<WTF::DefaultWeakPtrImpl>,WTF::DefaultRefDerefTraits<WTF::DefaultWeakPtrImpl>>,WTF::IdentityExtractor,WTF::DefaultHash<WTF::Ref<WTF::DefaultWeakPtrImpl,WTF::RawPtrTraits<WTF::DefaultWeakPtrImpl>,WTF::DefaultRefDerefTraits<WTF::DefaultWeakPtrImpl>>>,WTF::HashTraits<WTF::Ref<WTF::DefaultWeakPtrImpl,WTF::RawPtrTraits<WTF::DefaultWeakPtrImpl>,WTF::DefaultRefDerefTraits<WTF::DefaultWeakPtrImpl>>>,WTF::HashTraits<WTF::Ref<WTF::DefaultWeakPtrImpl,WTF::RawPtrTraits<WTF::DefaultWeakPtrImpl>,WTF::DefaultRefDerefTraits<WTF::DefaultWeakPtrImpl>>>>::shrinkToBestSize(v6);
        v7 = *(_QWORD *)(v4 + 88);
        *(_DWORD *)(v4 + 96) = 0;
        if (!v7)
          goto LABEL_5;
      }
      v12 = *(_DWORD *)(v7 - 12);
      if (v12 >= 0x7FFFFFFF)
        v13 = -2;
      else
        v13 = 2 * v12;
      *(_DWORD *)(v4 + 100) = v13;
      if (*(_DWORD *)(v7 - 12))
      {
        v14 = *(void **)(v4 + 24);
        if (v14)
        {
          objc_msgSend(v14, "currentTime");
          v15 = v39;
          LODWORD(v16) = v40;
          v17 = v41;
        }
        else
        {
          LODWORD(v16) = 0;
          v15 = 0;
          v17 = 0;
        }
        v18 = v17 & 1;
        if ((~v17 & 3) == 0)
          v18 = v17 & 1 | 2;
        if ((~v17 & 5) == 0)
          v18 |= 4u;
        if ((~v17 & 9) == 0)
          v18 |= 8u;
        if ((~v17 & 0x11) != 0)
          v19 = v18;
        else
          v19 = v18 | 0x10;
        v21 = (v19 & 1) == 0 || (_DWORD)v16 != 0;
        if (v15 >= 0)
          v22 = 5;
        else
          v22 = 9;
        if (!v21)
          v19 = v22;
        v16 = v16;
        if (!v21)
        {
          v15 >>= 63;
          v16 = 1;
        }
        *(_QWORD *)&v42 = v15;
        *((_QWORD *)&v42 + 1) = v16 | ((unint64_t)v19 << 32);
        v23 = *(unsigned int *)(v5 + 20);
        if (!(_DWORD)v23)
          goto LABEL_48;
        v24 = 0;
        v25 = *(uint64_t **)(v5 + 8);
        v26 = 24 * v23;
        do
        {
          v24 |= (int)WTF::MediaTime::compare((WTF::MediaTime *)(v25 + 1), (const WTF::MediaTime *)&v42) < 1;
          std::__tree<std::__value_type<WTF::MediaTime,WTF::RetainPtr<__CVBuffer *>>,std::__map_value_compare<WTF::MediaTime,std::__value_type<WTF::MediaTime,WTF::RetainPtr<__CVBuffer *>>,std::less<WTF::MediaTime>,true>,WTF::FastAllocator<std::__value_type<WTF::MediaTime,WTF::RetainPtr<__CVBuffer *>>>>::__emplace_unique_key_args<WTF::MediaTime,WTF::MediaTime&,WTF::RetainPtr<__CVBuffer *>>((uint64_t **)(v4 + 64), (WTF::MediaTime *)(v25 + 1), v25 + 1, v25);
          v25 += 3;
          v26 -= 24;
        }
        while (v26);
        if ((v24 & 1) != 0)
          result = WebCore::QueuedVideoOutput::nextImageTimeReached((id *)v4);
        else
LABEL_48:
          result = (uint64_t)WebCore::QueuedVideoOutput::configureNextImageTimeObserver((_QWORD *)v4, (uint64_t)a2, a3);
        goto LABEL_9;
      }
LABEL_6:
      result = WTF::MediaTime::invalidTime((WTF::MediaTime *)v6);
      v42 = *(_OWORD *)result;
      v8 = *(unsigned int *)(v5 + 20);
      if ((_DWORD)v8)
      {
        v9 = *(uint64_t **)(v5 + 8);
        v10 = 24 * v8;
        do
        {
          result = std::__tree<std::__value_type<WTF::MediaTime,WTF::RetainPtr<__CVBuffer *>>,std::__map_value_compare<WTF::MediaTime,std::__value_type<WTF::MediaTime,WTF::RetainPtr<__CVBuffer *>>,std::less<WTF::MediaTime>,true>,WTF::FastAllocator<std::__value_type<WTF::MediaTime,WTF::RetainPtr<__CVBuffer *>>>>::__emplace_unique_key_args<WTF::MediaTime,WTF::MediaTime&,WTF::RetainPtr<__CVBuffer *>>((uint64_t **)(v4 + 64), (WTF::MediaTime *)(v9 + 1), v9 + 1, v9);
          v9 += 3;
          v10 -= 24;
        }
        while (v10);
      }
LABEL_9:
      if (*(_BYTE *)(v4 + 104))
        return objc_msgSend(*(id *)(v4 + 40), "requestNotificationOfMediaDataChangeAsSoonAsPossible");
    }
  }
  return result;
}

- (_QWORD)outputSequenceWasFlushed:(_QWORD *)a1
{
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;

  v3 = (unsigned int *)a1[1];
  *a1 = &off_1E3209F38;
  a1[1] = 0;
  if (v3)
  {
    do
    {
      v4 = __ldaxr(v3);
      v5 = v4 - 1;
    }
    while (__stlxr(v5, v3));
    if (!v5)
    {
      atomic_store(1u, v3);
      WTF::fastFree((WTF *)v3, a2);
    }
  }
  return a1;
}

- (uint64_t)outputSequenceWasFlushed:(WTF *)this
{
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;

  v3 = (unsigned int *)*((_QWORD *)this + 1);
  *(_QWORD *)this = &off_1E3209F38;
  *((_QWORD *)this + 1) = 0;
  if (v3)
  {
    do
    {
      v4 = __ldaxr(v3);
      v5 = v4 - 1;
    }
    while (__stlxr(v5, v3));
    if (!v5)
    {
      atomic_store(1u, v3);
      WTF::fastFree((WTF *)v3, a2);
    }
  }
  return WTF::fastFree(this, a2);
}

- (void)outputSequenceWasFlushed:(uint64_t)a1
{
  uint64_t v1;
  uint64_t v2;
  const void *v3;
  uint64_t *v4;
  uint64_t *v5;
  uint64_t *v6;
  uint64_t *v7;
  BOOL v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t *v12;
  void *v13;
  const void *v14;
  _QWORD *v15;
  WTF *v16;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1)
  {
    v2 = *(_QWORD *)(v1 + 8);
    if (v2)
    {
      if (*(_QWORD *)(v2 + 56))
      {
        objc_msgSend(*(id *)(v2 + 24), "removeTimeObserver:");
        v3 = *(const void **)(v2 + 56);
        *(_QWORD *)(v2 + 56) = 0;
        if (v3)
          CFRelease(v3);
      }
      if (*(_BYTE *)(v2 + 104))
      {
        if (*(_QWORD *)(v2 + 80))
        {
          v4 = (uint64_t *)(v2 + 72);
          v5 = *(uint64_t **)(v2 + 72);
          v6 = *(uint64_t **)(v2 + 64);
          if (v5)
          {
            do
            {
              v7 = v5;
              v5 = (uint64_t *)v5[1];
            }
            while (v5);
          }
          else
          {
            do
            {
              v7 = (uint64_t *)v4[2];
              v8 = *v7 == (_QWORD)v4;
              v4 = v7;
            }
            while (v8);
          }
          if (v6 != v7)
          {
            do
            {
              v9 = (uint64_t *)v6[1];
              v10 = v6;
              if (v9)
              {
                do
                {
                  v11 = v9;
                  v9 = (uint64_t *)*v9;
                }
                while (v9);
              }
              else
              {
                do
                {
                  v11 = (uint64_t *)v10[2];
                  v8 = *v11 == (_QWORD)v10;
                  v10 = v11;
                }
                while (!v8);
              }
              if (*(uint64_t **)(v2 + 64) == v6)
                *(_QWORD *)(v2 + 64) = v11;
              v12 = *(uint64_t **)(v2 + 72);
              --*(_QWORD *)(v2 + 80);
              std::__tree_remove[abi:sn180100]<std::__tree_node_base<void *> *>(v12, v6);
              v14 = (const void *)v6[6];
              v6[6] = 0;
              if (v14)
                CFRelease(v14);
              WTF::fastFree((WTF *)v6, v13);
              v6 = v11;
            }
            while (v11 != v7);
          }
        }
      }
      else
      {
        v16 = *(WTF **)(v2 + 72);
        v15 = (_QWORD *)(v2 + 72);
        std::__tree<std::__value_type<WTF::MediaTime,WTF::RetainPtr<__CVBuffer *>>,std::__map_value_compare<WTF::MediaTime,std::__value_type<WTF::MediaTime,WTF::RetainPtr<__CVBuffer *>>,std::less<WTF::MediaTime>,true>,WTF::FastAllocator<std::__value_type<WTF::MediaTime,WTF::RetainPtr<__CVBuffer *>>>>::destroy(v16);
        *(v15 - 1) = v15;
        *v15 = 0;
        v15[1] = 0;
      }
    }
  }
}

- (_QWORD)observeValueForKeyPath:(_QWORD *)a1 ofObject:(void *)a2 change:context:
{
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;

  v3 = (unsigned int *)a1[1];
  *a1 = &off_1E3209F60;
  a1[1] = 0;
  if (v3)
  {
    do
    {
      v4 = __ldaxr(v3);
      v5 = v4 - 1;
    }
    while (__stlxr(v5, v3));
    if (!v5)
    {
      atomic_store(1u, v3);
      WTF::fastFree((WTF *)v3, a2);
    }
  }
  return a1;
}

- (uint64_t)observeValueForKeyPath:(WTF *)this ofObject:(void *)a2 change:context:
{
  unsigned int *v3;
  unsigned int v4;
  unsigned int v5;

  v3 = (unsigned int *)*((_QWORD *)this + 1);
  *(_QWORD *)this = &off_1E3209F60;
  *((_QWORD *)this + 1) = 0;
  if (v3)
  {
    do
    {
      v4 = __ldaxr(v3);
      v5 = v4 - 1;
    }
    while (__stlxr(v5, v3));
    if (!v5)
    {
      atomic_store(1u, v3);
      WTF::fastFree((WTF *)v3, a2);
    }
  }
  return WTF::fastFree(this, a2);
}

- (uint64_t)observeValueForKeyPath:(uint64_t)result ofObject:change:context:
{
  uint64_t v1;
  uint64_t v2;
  float v3;

  v1 = *(_QWORD *)(result + 8);
  if (v1)
  {
    v2 = *(_QWORD *)(v1 + 8);
    if (v2)
    {
      v3 = *(float *)(result + 16);
      *(_BYTE *)(v2 + 104) = v3 == 0.0;
      if (v3 == 0.0)
        return objc_msgSend(*(id *)(v2 + 40), "requestNotificationOfMediaDataChangeAsSoonAsPossible");
    }
  }
  return result;
}

@end
