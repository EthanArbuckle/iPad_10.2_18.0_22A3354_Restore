@implementation WebCoreResourceHandleAsOperationQueueDelegate

- (void)callFunctionOnMainThread:(void *)a3
{
  SynchronousLoaderMessageQueue *m_ptr;
  _QWORD *v5;
  uint64_t v6;
  unsigned __int8 *v7;
  optional<WTF::HashSet<WTF::RefPtr<WTF::SchedulePair>, WTF::SchedulePairHash>> *p_m_scheduledPairs;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *m_table;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned __int8 v18;
  int v19;
  uint64_t v20;
  _QWORD *v21;
  void *v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[2];
  char v30;
  _QWORD v31[3];

  m_ptr = self->m_messageQueue.m_ptr;
  if (m_ptr)
  {
    v5 = (_QWORD *)WTF::fastMalloc((WTF *)8);
    v6 = *(_QWORD *)a3;
    *(_QWORD *)a3 = 0;
    *v5 = v6;
    v7 = (unsigned __int8 *)m_ptr + 8;
    LODWORD(v6) = __ldaxr((unsigned __int8 *)m_ptr + 8);
    if ((_DWORD)v6)
    {
      __clrex();
    }
    else if (!__stxr(1u, v7))
    {
      goto LABEL_21;
    }
    MEMORY[0x19AEA534C]((char *)m_ptr + 8);
LABEL_21:
    v16 = *((_QWORD *)m_ptr + 2);
    v15 = *((_QWORD *)m_ptr + 3);
    if (v16)
    {
      if (v15 + 1 != v16)
        goto LABEL_23;
    }
    else
    {
      v28 = *((unsigned int *)m_ptr + 10);
      if (v15)
      {
        if (v15 != v28 - 1)
          goto LABEL_23;
      }
      else if ((_DWORD)v28)
      {
        v15 = 0;
        goto LABEL_23;
      }
    }
    WTF::Deque<std::unique_ptr<WTF::Function<void ()(void)>>,0ul>::expandCapacity((uint64_t *)m_ptr + 2);
    v15 = *((_QWORD *)m_ptr + 3);
LABEL_23:
    *(_QWORD *)(*((_QWORD *)m_ptr + 4) + 8 * v15) = v5;
    if (v15 == *((unsigned int *)m_ptr + 10) - 1)
      v17 = 0;
    else
      v17 = v15 + 1;
    *((_QWORD *)m_ptr + 3) = v17;
    v18 = atomic_load((unsigned __int8 *)m_ptr + 9);
    if ((v18 & 1) != 0)
    {
      v30 = 0;
      v29[0] = (char *)m_ptr + 9;
      v29[1] = &v30;
      v31[0] = WTF::ScopedLambdaRefFunctor<long ()(WTF::ParkingLot::UnparkResult),WTF::Condition::notifyOne(void)::{lambda(WTF::ParkingLot::UnparkResult)#1}>::implFunction;
      v31[1] = v31;
      v31[2] = v29;
      WTF::ParkingLot::unparkOneImpl();
    }
    v19 = __ldxr(v7);
    if (v19 == 1)
    {
      if (!__stlxr(0, v7))
        return;
    }
    else
    {
      __clrex();
    }
    WTF::Lock::unlockSlow((WTF::Lock *)((char *)m_ptr + 8));
    return;
  }
  if (!self->m_scheduledPairs.__engaged_)
    goto LABEL_18;
  p_m_scheduledPairs = &self->m_scheduledPairs;
  v10 = WTF::HashTable<WTF::CheckedPtr<WebCore::LayerPool,WTF::RawPtrTraits<WebCore::LayerPool>>,WTF::CheckedPtr<WebCore::LayerPool,WTF::RawPtrTraits<WebCore::LayerPool>>,WTF::IdentityExtractor,WTF::DefaultHash<WTF::CheckedPtr<WebCore::LayerPool,WTF::RawPtrTraits<WebCore::LayerPool>>>,WTF::HashTraits<WTF::CheckedPtr<WebCore::LayerPool,WTF::RawPtrTraits<WebCore::LayerPool>>>,WTF::HashTraits<WTF::CheckedPtr<WebCore::LayerPool,WTF::RawPtrTraits<WebCore::LayerPool>>>>::begin(&self->m_scheduledPairs);
  m_table = p_m_scheduledPairs->var0.__val_.m_impl.var0.m_table;
  if (p_m_scheduledPairs->var0.__val_.m_impl.var0.m_table)
    m_table += *((unsigned int *)m_table - 1);
  if (m_table == v10)
  {
LABEL_18:
    WTF::callOnMainThread();
  }
  else
  {
    while (1)
    {
      v13 = *(_QWORD *)(*v10 + 24);
      if (v13 != *MEMORY[0x1E0C9B270] && v13 != *MEMORY[0x1E0C9B280])
        break;
      while (++v10 != v11)
      {
        if ((unint64_t)(*v10 + 1) > 1)
          goto LABEL_17;
      }
      v10 = v11;
LABEL_17:
      if (v10 == m_table)
        goto LABEL_18;
    }
    v20 = *(_QWORD *)a3;
    *(_QWORD *)a3 = 0;
    v21 = malloc_type_malloc(0x30uLL, 0x10E00400C13C2AEuLL);
    v22 = v21;
    *v21 = MEMORY[0x1E0C809A0];
    v21[1] = 50331650;
    v21[2] = WTF::BlockPtr<void ()(void)>::fromCallable<-[WebCoreResourceHandleAsOperationQueueDelegate callFunctionOnMainThread:]::$_0>(-[WebCoreResourceHandleAsOperationQueueDelegate callFunctionOnMainThread:]::$_0)::{lambda(void *)#1}::__invoke;
    v21[3] = &WTF::BlockPtr<void ()(void)>::fromCallable<-[WebCoreResourceHandleAsOperationQueueDelegate callFunctionOnMainThread:]::$_0>(-[WebCoreResourceHandleAsOperationQueueDelegate callFunctionOnMainThread:]::$_0)::descriptor;
    *((_BYTE *)v21 + 32) = 0;
    v21[5] = v20;
    if (self->m_scheduledPairs.__engaged_)
    {
      v23 = WTF::HashTable<WTF::CheckedPtr<WebCore::LayerPool,WTF::RawPtrTraits<WebCore::LayerPool>>,WTF::CheckedPtr<WebCore::LayerPool,WTF::RawPtrTraits<WebCore::LayerPool>>,WTF::IdentityExtractor,WTF::DefaultHash<WTF::CheckedPtr<WebCore::LayerPool,WTF::RawPtrTraits<WebCore::LayerPool>>>,WTF::HashTraits<WTF::CheckedPtr<WebCore::LayerPool,WTF::RawPtrTraits<WebCore::LayerPool>>>,WTF::HashTraits<WTF::CheckedPtr<WebCore::LayerPool,WTF::RawPtrTraits<WebCore::LayerPool>>>>::begin(&self->m_scheduledPairs);
      v24 = v23;
      v26 = v25;
      if (p_m_scheduledPairs->var0.__val_.m_impl.var0.m_table)
        v27 = (uint64_t)p_m_scheduledPairs->var0.__val_.m_impl.var0.m_table
            + 8 * *((unsigned int *)p_m_scheduledPairs->var0.__val_.m_impl.var0.m_table - 1);
      else
        v27 = 0;
      if ((_QWORD *)v27 != v23)
      {
        do
        {
          CFRunLoopPerformBlock(*(CFRunLoopRef *)(*v24 + 16), *(CFTypeRef *)(*v24 + 24), v22);
          while (++v24 != v26)
          {
            if ((unint64_t)(*v24 + 1) > 1)
              goto LABEL_46;
          }
          v24 = v26;
LABEL_46:
          ;
        }
        while (v24 != (_QWORD *)v27);
      }
      _Block_release(v22);
    }
    else
    {
      __break(1u);
    }
  }
}

- (WebCoreResourceHandleAsOperationQueueDelegate)initWithHandle:(void *)a3 messageQueue:(void *)a4
{
  WebCoreResourceHandleAsOperationQueueDelegate *v6;
  void *v7;
  WebCoreResourceHandleAsOperationQueueDelegate *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD **v11;
  uint64_t *p_m_table;
  SynchronousLoaderMessageQueue *v13;
  SynchronousLoaderMessageQueue *m_ptr;
  unsigned int v15;
  unsigned int v16;
  void *v18;
  WTF *v19;

  v6 = -[WebCoreResourceHandleAsOperationQueueDelegate init](self, "init");
  v8 = v6;
  if (v6)
  {
    v6->m_handle = a3;
    if (a3)
    {
      v9 = **((_QWORD **)a3 + 2);
      if (v9)
      {
        v10 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v9 + 48))(v9);
        if (v10)
        {
          v11 = (_QWORD **)v10;
          p_m_table = (uint64_t *)&v8->m_scheduledPairs.var0.__val_.m_impl.var0.m_table;
          if (v8->m_scheduledPairs.__engaged_)
          {
            WTF::HashTable<WTF::RefPtr<WTF::SchedulePair,WTF::RawPtrTraits<WTF::SchedulePair>,WTF::DefaultRefDerefTraits<WTF::SchedulePair>>,WTF::RefPtr<WTF::SchedulePair,WTF::RawPtrTraits<WTF::SchedulePair>,WTF::DefaultRefDerefTraits<WTF::SchedulePair>>,WTF::IdentityExtractor,WTF::SchedulePairHash,WTF::HashTraits<WTF::RefPtr<WTF::SchedulePair,WTF::RawPtrTraits<WTF::SchedulePair>,WTF::DefaultRefDerefTraits<WTF::SchedulePair>>>,WTF::HashTraits<WTF::RefPtr<WTF::SchedulePair,WTF::RawPtrTraits<WTF::SchedulePair>,WTF::DefaultRefDerefTraits<WTF::SchedulePair>>>>::operator=(p_m_table, v11);
          }
          else
          {
            WTF::HashTable<WTF::RefPtr<WTF::SchedulePair,WTF::RawPtrTraits<WTF::SchedulePair>,WTF::DefaultRefDerefTraits<WTF::SchedulePair>>,WTF::RefPtr<WTF::SchedulePair,WTF::RawPtrTraits<WTF::SchedulePair>,WTF::DefaultRefDerefTraits<WTF::SchedulePair>>,WTF::IdentityExtractor,WTF::SchedulePairHash,WTF::HashTraits<WTF::RefPtr<WTF::SchedulePair,WTF::RawPtrTraits<WTF::SchedulePair>,WTF::DefaultRefDerefTraits<WTF::SchedulePair>>>,WTF::HashTraits<WTF::RefPtr<WTF::SchedulePair,WTF::RawPtrTraits<WTF::SchedulePair>,WTF::DefaultRefDerefTraits<WTF::SchedulePair>>>>::HashTable(p_m_table, v11);
            v8->m_scheduledPairs.__engaged_ = 1;
          }
        }
      }
    }
    v13 = *(SynchronousLoaderMessageQueue **)a4;
    *(_QWORD *)a4 = 0;
    m_ptr = v8->m_messageQueue.m_ptr;
    v8->m_messageQueue.m_ptr = v13;
    if (m_ptr)
    {
      do
      {
        v15 = __ldaxr((unsigned int *)m_ptr);
        v16 = v15 - 1;
      }
      while (__stlxr(v16, (unsigned int *)m_ptr));
      if (!v16)
      {
        atomic_store(1u, (unsigned int *)m_ptr);
        WTF::Deque<std::unique_ptr<WTF::Function<void ()(void)>>,0ul>::destroyAll((unint64_t *)m_ptr + 2, v7);
        v19 = (WTF *)*((_QWORD *)m_ptr + 4);
        if (v19)
        {
          *((_QWORD *)m_ptr + 4) = 0;
          *((_DWORD *)m_ptr + 10) = 0;
          WTF::fastFree(v19, v18);
        }
        WTF::fastFree((WTF *)m_ptr, v18);
      }
    }
  }
  return v8;
}

- (void)detachHandle
{
  Lock *p_m_lock;
  SynchronousLoaderMessageQueue *m_ptr;
  unsigned int v6;
  unsigned int v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  WTF *v12;

  p_m_lock = &self->m_lock;
  if (__ldaxr(&self->m_lock.m_byte.value.__a_.__a_value))
  {
    __clrex();
LABEL_4:
    MEMORY[0x19AEA534C](&self->m_lock, a2);
    goto LABEL_5;
  }
  if (__stxr(1u, &p_m_lock->m_byte.value.__a_.__a_value))
    goto LABEL_4;
LABEL_5:
  self->m_handle = 0;
  m_ptr = self->m_messageQueue.m_ptr;
  self->m_messageQueue.m_ptr = 0;
  if (m_ptr)
  {
    do
    {
      v6 = __ldaxr((unsigned int *)m_ptr);
      v7 = v6 - 1;
    }
    while (__stlxr(v7, (unsigned int *)m_ptr));
    if (!v7)
    {
      atomic_store(1u, (unsigned int *)m_ptr);
      WTF::Deque<std::unique_ptr<WTF::Function<void ()(void)>>,0ul>::destroyAll((unint64_t *)m_ptr + 2, (void *)a2);
      v12 = (WTF *)*((_QWORD *)m_ptr + 4);
      if (v12)
      {
        *((_QWORD *)m_ptr + 4) = 0;
        *((_DWORD *)m_ptr + 10) = 0;
        WTF::fastFree(v12, v11);
      }
      WTF::fastFree((WTF *)m_ptr, v11);
    }
  }
  v8 = self->m_requestResult.m_ptr;
  self->m_requestResult.m_ptr = 0;
  if (v8)
    CFRelease(v8);
  v9 = self->m_cachedResponseResult.m_ptr;
  self->m_cachedResponseResult.m_ptr = 0;
  if (v9)
    CFRelease(v9);
  self->m_BOOLResult = 0;
  WTF::BinarySemaphore::signal((WTF::BinarySemaphore *)&self->m_semaphore);
  v10 = __ldxr(&p_m_lock->m_byte.value.__a_.__a_value);
  if (v10 != 1)
  {
    __clrex();
    goto LABEL_16;
  }
  if (__stlxr(0, &p_m_lock->m_byte.value.__a_.__a_value))
LABEL_16:
    WTF::Lock::unlockSlow((WTF::Lock *)p_m_lock);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)WebCoreResourceHandleAsOperationQueueDelegate;
  -[WebCoreResourceHandleAsOperationQueueDelegate dealloc](&v2, sel_dealloc);
}

- (id)connection:(id)a3 willSendRequest:(id)a4 redirectResponse:(id)a5
{
  WebCore *v8;
  NSURLResponse *v9;
  NSURLRequest *v10;
  NSURLRequest *v11;
  _QWORD *v12;
  uint64_t v13;
  Lock *p_m_lock;
  void *m_ptr;
  _QWORD *v17;
  uint64_t v18;
  int v19;
  uint64_t v21;
  int v22;

  v8 = (WebCore *)objc_msgSend(a3, "currentRequest");
  v10 = WebCore::synthesizeRedirectResponseIfNecessary(v8, (NSURLRequest *)a4, (NSURLRequest *)a5, v9);
  if (!v10)
    return a4;
  v11 = v10;
  if (self)
  {
    CFRetain(self);
    CFRetain(self);
  }
  if (a4)
    CFRetain(a4);
  CFRetain(v11);
  v12 = (_QWORD *)WTF::fastMalloc((WTF *)0x28);
  *v12 = &off_1E3486108;
  v12[1] = self;
  v12[2] = self;
  v12[3] = a4;
  v12[4] = v11;
  v21 = (uint64_t)v12;
  -[WebCoreResourceHandleAsOperationQueueDelegate callFunctionOnMainThread:](self, "callFunctionOnMainThread:", &v21);
  v13 = v21;
  v21 = 0;
  if (v13)
    (*(void (**)(uint64_t))(*(_QWORD *)v13 + 8))(v13);
  v21 = 0x7FF0000000000000;
  v22 = 0;
  WTF::BinarySemaphore::waitUntil();
  p_m_lock = &self->m_lock;
  if (__ldaxr(&self->m_lock.m_byte.value.__a_.__a_value))
  {
    __clrex();
  }
  else if (!__stxr(1u, &p_m_lock->m_byte.value.__a_.__a_value))
  {
    goto LABEL_12;
  }
  MEMORY[0x19AEA534C](&self->m_lock);
LABEL_12:
  if (self->m_handle)
  {
    m_ptr = self->m_requestResult.m_ptr;
    if (m_ptr)
      CFRetain(self->m_requestResult.m_ptr);
    v17 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
    *v17 = &off_1E3486168;
    v17[1] = self;
    v21 = (uint64_t)v17;
    -[WebCoreResourceHandleAsOperationQueueDelegate callFunctionOnMainThread:](self, "callFunctionOnMainThread:", &v21);
    v18 = v21;
    v21 = 0;
    if (v18)
      (*(void (**)(uint64_t))(*(_QWORD *)v18 + 8))(v18);
    a4 = (id)CFMakeCollectable(m_ptr);
    self = 0;
  }
  else
  {
    a4 = 0;
  }
  v19 = __ldxr(&p_m_lock->m_byte.value.__a_.__a_value);
  if (v19 != 1)
  {
    __clrex();
LABEL_25:
    WTF::Lock::unlockSlow((WTF::Lock *)p_m_lock);
    if (!self)
      return a4;
    goto LABEL_22;
  }
  if (__stlxr(0, &p_m_lock->m_byte.value.__a_.__a_value))
    goto LABEL_25;
  if (self)
LABEL_22:
    CFRelease(self);
  return a4;
}

- (void)connection:(id)a3 didReceiveAuthenticationChallenge:(id)a4
{
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;

  if (self)
    CFRetain(self);
  if (a4)
    CFRetain(a4);
  v6 = (_QWORD *)WTF::fastMalloc((WTF *)0x20);
  *v6 = &off_1E3486190;
  v6[1] = self;
  v6[2] = self;
  v6[3] = a4;
  v8 = v6;
  -[WebCoreResourceHandleAsOperationQueueDelegate callFunctionOnMainThread:](self, "callFunctionOnMainThread:", &v8);
  v7 = v8;
  v8 = 0;
  if (v7)
    (*(void (**)(_QWORD *))(*v7 + 8))(v7);
}

- (BOOL)connection:(id)a3 canAuthenticateAgainstProtectionSpace:(id)a4
{
  WebCoreResourceHandleAsOperationQueueDelegate *v5;
  _QWORD *v6;
  uint64_t v7;
  unsigned __int8 *p_a_value;
  BOOL m_BOOLResult;
  _QWORD *v11;
  uint64_t v12;
  int v13;
  uint64_t v15;
  int v16;

  v5 = self;
  if (self)
  {
    CFRetain(self);
    CFRetain(v5);
  }
  if (a4)
    CFRetain(a4);
  v6 = (_QWORD *)WTF::fastMalloc((WTF *)0x20);
  *v6 = &off_1E34861B8;
  v6[1] = v5;
  v6[2] = v5;
  v6[3] = a4;
  v15 = (uint64_t)v6;
  -[WebCoreResourceHandleAsOperationQueueDelegate callFunctionOnMainThread:](v5, "callFunctionOnMainThread:", &v15);
  v7 = v15;
  v15 = 0;
  if (v7)
    (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
  v15 = 0x7FF0000000000000;
  v16 = 0;
  WTF::BinarySemaphore::waitUntil();
  p_a_value = &v5->m_lock.m_byte.value.__a_.__a_value;
  if (__ldaxr(&v5->m_lock.m_byte.value.__a_.__a_value))
  {
    __clrex();
  }
  else if (!__stxr(1u, p_a_value))
  {
    goto LABEL_11;
  }
  MEMORY[0x19AEA534C](&v5->m_lock);
LABEL_11:
  if (v5->m_handle)
  {
    m_BOOLResult = v5->m_BOOLResult;
    v11 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
    *v11 = &off_1E3486208;
    v11[1] = v5;
    v15 = (uint64_t)v11;
    -[WebCoreResourceHandleAsOperationQueueDelegate callFunctionOnMainThread:](v5, "callFunctionOnMainThread:", &v15);
    v12 = v15;
    v15 = 0;
    if (v12)
      (*(void (**)(uint64_t))(*(_QWORD *)v12 + 8))(v12);
    v5 = 0;
  }
  else
  {
    m_BOOLResult = 0;
  }
  v13 = __ldxr(p_a_value);
  if (v13 != 1)
  {
    __clrex();
LABEL_22:
    WTF::Lock::unlockSlow((WTF::Lock *)p_a_value);
    if (!v5)
      return m_BOOLResult;
    goto LABEL_19;
  }
  if (__stlxr(0, p_a_value))
    goto LABEL_22;
  if (v5)
LABEL_19:
    CFRelease(v5);
  return m_BOOLResult;
}

- (void)connection:(id)a3 didReceiveResponse:(id)a4
{
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;

  if (self)
  {
    CFRetain(self);
    CFRetain(self);
  }
  if (a4)
    CFRetain(a4);
  if (a3)
    CFRetain(a3);
  v7 = (_QWORD *)WTF::fastMalloc((WTF *)0x28);
  *v7 = &off_1E3486230;
  v7[1] = self;
  v7[2] = self;
  v7[3] = a4;
  v7[4] = a3;
  v11 = (uint64_t)v7;
  -[WebCoreResourceHandleAsOperationQueueDelegate callFunctionOnMainThread:](self, "callFunctionOnMainThread:", &v11);
  v8 = v11;
  v11 = 0;
  if (v8)
    (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
  v11 = 0x7FF0000000000000;
  v12 = 0;
  WTF::BinarySemaphore::waitUntil();
  v9 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v9 = &off_1E3486280;
  v9[1] = self;
  v11 = (uint64_t)v9;
  -[WebCoreResourceHandleAsOperationQueueDelegate callFunctionOnMainThread:](self, "callFunctionOnMainThread:", &v11);
  v10 = v11;
  v11 = 0;
  if (v10)
    (*(void (**)(uint64_t))(*(_QWORD *)v10 + 8))(v10);
}

- (void)connection:(id)a3 didReceiveData:(id)a4 lengthReceived:(int64_t)a5
{
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;

  if (self)
    CFRetain(self);
  if (a4)
    CFRetain(a4);
  v7 = (_QWORD *)WTF::fastMalloc((WTF *)0x20);
  *v7 = &off_1E34862A8;
  v7[1] = self;
  v7[2] = self;
  v7[3] = a4;
  v9 = v7;
  -[WebCoreResourceHandleAsOperationQueueDelegate callFunctionOnMainThread:](self, "callFunctionOnMainThread:", &v9);
  v8 = v9;
  v9 = 0;
  if (v8)
    (*(void (**)(_QWORD *))(*v8 + 8))(v8);
}

- (void)connection:(id)a3 didSendBodyData:(int64_t)a4 totalBytesWritten:(int64_t)a5 totalBytesExpectedToWrite:(int64_t)a6
{
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;

  if (self)
    CFRetain(self);
  v9 = (_QWORD *)WTF::fastMalloc((WTF *)0x28);
  *v9 = &off_1E34862D0;
  v9[1] = self;
  v9[2] = self;
  v9[3] = a5;
  v9[4] = a6;
  v11 = v9;
  -[WebCoreResourceHandleAsOperationQueueDelegate callFunctionOnMainThread:](self, "callFunctionOnMainThread:", &v11);
  v10 = v11;
  v11 = 0;
  if (v10)
    (*(void (**)(_QWORD *))(*v10 + 8))(v10);
}

- (void)connectionDidFinishLoading:(id)a3
{
  const void *v5;
  const void *v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;

  if (self)
    CFRetain(self);
  if (a3)
    CFRetain(a3);
  v5 = (const void *)objc_msgSend(a3, "_timingData");
  v6 = v5;
  if (v5)
    CFRetain(v5);
  v7 = (_QWORD *)WTF::fastMalloc((WTF *)0x28);
  *v7 = &off_1E34862F8;
  v7[1] = self;
  v7[2] = self;
  v7[3] = a3;
  v7[4] = v6;
  v9 = v7;
  -[WebCoreResourceHandleAsOperationQueueDelegate callFunctionOnMainThread:](self, "callFunctionOnMainThread:", &v9);
  v8 = v9;
  v9 = 0;
  if (v8)
    (*(void (**)(_QWORD *))(*v8 + 8))(v8);
}

- (void)connection:(id)a3 didFailWithError:(id)a4
{
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;

  if (self)
    CFRetain(self);
  if (a4)
    CFRetain(a4);
  v6 = (_QWORD *)WTF::fastMalloc((WTF *)0x20);
  *v6 = &off_1E3486320;
  v6[1] = self;
  v6[2] = self;
  v6[3] = a4;
  v8 = v6;
  -[WebCoreResourceHandleAsOperationQueueDelegate callFunctionOnMainThread:](self, "callFunctionOnMainThread:", &v8);
  v7 = v8;
  v8 = 0;
  if (v7)
    (*(void (**)(_QWORD *))(*v7 + 8))(v7);
}

- (id)connection:(id)a3 willCacheResponse:(id)a4
{
  WebCoreResourceHandleAsOperationQueueDelegate *v5;
  _QWORD *v6;
  uint64_t v7;
  unsigned __int8 *p_a_value;
  void *m_ptr;
  _QWORD *v11;
  uint64_t v12;
  CFTypeRef v13;
  int v14;
  uint64_t v16;
  int v17;

  v5 = self;
  if (self)
  {
    CFRetain(self);
    CFRetain(v5);
  }
  if (a4)
    CFRetain(a4);
  v6 = (_QWORD *)WTF::fastMalloc((WTF *)0x20);
  *v6 = &off_1E3486348;
  v6[1] = v5;
  v6[2] = v5;
  v6[3] = a4;
  v16 = (uint64_t)v6;
  -[WebCoreResourceHandleAsOperationQueueDelegate callFunctionOnMainThread:](v5, "callFunctionOnMainThread:", &v16);
  v7 = v16;
  v16 = 0;
  if (v7)
    (*(void (**)(uint64_t))(*(_QWORD *)v7 + 8))(v7);
  v16 = 0x7FF0000000000000;
  v17 = 0;
  WTF::BinarySemaphore::waitUntil();
  p_a_value = &v5->m_lock.m_byte.value.__a_.__a_value;
  if (__ldaxr(&v5->m_lock.m_byte.value.__a_.__a_value))
  {
    __clrex();
  }
  else if (!__stxr(1u, p_a_value))
  {
    goto LABEL_11;
  }
  MEMORY[0x19AEA534C](&v5->m_lock);
LABEL_11:
  if (v5->m_handle)
  {
    m_ptr = v5->m_cachedResponseResult.m_ptr;
    if (m_ptr)
      CFRetain(v5->m_cachedResponseResult.m_ptr);
    v11 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
    *v11 = &off_1E3486398;
    v11[1] = v5;
    v16 = (uint64_t)v11;
    -[WebCoreResourceHandleAsOperationQueueDelegate callFunctionOnMainThread:](v5, "callFunctionOnMainThread:", &v16);
    v12 = v16;
    v16 = 0;
    if (v12)
      (*(void (**)(uint64_t))(*(_QWORD *)v12 + 8))(v12);
    v13 = (id)CFMakeCollectable(m_ptr);
    v5 = 0;
  }
  else
  {
    v13 = 0;
  }
  v14 = __ldxr(p_a_value);
  if (v14 != 1)
  {
    __clrex();
LABEL_24:
    WTF::Lock::unlockSlow((WTF::Lock *)p_a_value);
    if (!v5)
      return (id)v13;
    goto LABEL_21;
  }
  if (__stlxr(0, p_a_value))
    goto LABEL_24;
  if (v5)
LABEL_21:
    CFRelease(v5);
  return (id)v13;
}

- (void).cxx_destruct
{
  void *m_table;
  void *m_ptr;
  void *v5;
  SynchronousLoaderMessageQueue *v6;
  unsigned int v7;
  unsigned int v8;
  void *v9;
  WTF *v10;

  if (self->m_scheduledPairs.__engaged_)
  {
    m_table = self->m_scheduledPairs.var0.__val_.m_impl.var0.m_table;
    if (m_table)
      WTF::HashTable<WTF::RefPtr<WTF::SchedulePair,WTF::RawPtrTraits<WTF::SchedulePair>,WTF::DefaultRefDerefTraits<WTF::SchedulePair>>,WTF::RefPtr<WTF::SchedulePair,WTF::RawPtrTraits<WTF::SchedulePair>,WTF::DefaultRefDerefTraits<WTF::SchedulePair>>,WTF::IdentityExtractor,WTF::SchedulePairHash,WTF::HashTraits<WTF::RefPtr<WTF::SchedulePair,WTF::RawPtrTraits<WTF::SchedulePair>,WTF::DefaultRefDerefTraits<WTF::SchedulePair>>>,WTF::HashTraits<WTF::RefPtr<WTF::SchedulePair,WTF::RawPtrTraits<WTF::SchedulePair>,WTF::DefaultRefDerefTraits<WTF::SchedulePair>>>>::deallocateTable((uint64_t)m_table, (void *)a2);
  }
  m_ptr = self->m_cachedResponseResult.m_ptr;
  self->m_cachedResponseResult.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v5 = self->m_requestResult.m_ptr;
  self->m_requestResult.m_ptr = 0;
  if (v5)
    CFRelease(v5);
  v6 = self->m_messageQueue.m_ptr;
  self->m_messageQueue.m_ptr = 0;
  if (v6)
  {
    do
    {
      v7 = __ldaxr((unsigned int *)v6);
      v8 = v7 - 1;
    }
    while (__stlxr(v8, (unsigned int *)v6));
    if (!v8)
    {
      atomic_store(1u, (unsigned int *)v6);
      WTF::Deque<std::unique_ptr<WTF::Function<void ()(void)>>,0ul>::destroyAll((unint64_t *)v6 + 2, (void *)a2);
      v10 = (WTF *)*((_QWORD *)v6 + 4);
      if (v10)
      {
        *((_QWORD *)v6 + 4) = 0;
        *((_DWORD *)v6 + 10) = 0;
        WTF::fastFree(v10, v9);
      }
      WTF::fastFree((WTF *)v6, v9);
    }
  }
}

- (id).cxx_construct
{
  *((_BYTE *)self + 8) = 0;
  *((_WORD *)self + 12) = 0;
  *((_BYTE *)self + 26) = 0;
  *((_BYTE *)self + 64) = 0;
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 4) = 0;
  *((_BYTE *)self + 56) = 0;
  return self;
}

- (uint64_t)callFunctionOnMainThread:
{
  uint64_t v1;

  if (!*(_BYTE *)(result + 32))
  {
    v1 = result;
    *(_BYTE *)(result + 32) = 1;
    (*(void (**)(_QWORD))(**(_QWORD **)(result + 40) + 16))(*(_QWORD *)(result + 40));
    result = *(_QWORD *)(v1 + 40);
    *(_QWORD *)(v1 + 40) = 0;
    if (result)
      return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  }
  return result;
}

- (_QWORD)connection:(_QWORD *)a1 willSendRequest:redirectResponse:
{
  const void *v2;

  v2 = (const void *)a1[1];
  *a1 = &off_1E3486168;
  a1[1] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

- (uint64_t)connection:(WTF *)this willSendRequest:(void *)a2 redirectResponse:
{
  const void *v3;

  v3 = (const void *)*((_QWORD *)this + 1);
  *(_QWORD *)this = &off_1E3486168;
  *((_QWORD *)this + 1) = 0;
  if (v3)
    CFRelease(v3);
  return WTF::fastFree(this, a2);
}

- (void)connection:(uint64_t)a1 willSendRequest:redirectResponse:
{
  _QWORD *v2;
  const void *v3;
  char v4;
  uint64_t v5;
  void *v6;
  const WebCore::SecurityOrigin *v7;
  uint64_t v8;
  uint64_t v9;
  WebCore::FormData *v10;
  WebCore::FormData *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  _DWORD **v15;
  const void *v16;
  WTF::StringImpl *v17;
  int v18;
  int v19;
  WebCore::ResourceHandle *v20;
  uint64_t v21;
  WTF::StringImpl *v22;
  char canRequest;
  WTF::StringImpl *v24;
  unsigned int v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  WTF::StringImpl *v30;
  void *v31;
  WTF::StringImpl *v32;
  WTF::StringImpl *v33;
  CFTypeRef v34;
  bmalloc::api *v35;
  void *v36;
  char v37;
  WTF::StringImpl *v38;
  WTF::StringImpl *v39;
  uint64_t v40;
  WTF::StringImpl *v41[5];
  uint64_t v42;
  _BYTE v43[168];
  WebCore::FormData *v44;
  char v45;
  _QWORD v46[5];
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  char v52;
  char v53;
  __int16 v54;
  char v55;
  int64x2_t v56;
  int64x2_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  int64x2_t v61;
  uint64_t v62;
  char v63;
  __int16 v64;
  char v65;
  CFTypeRef cf;
  char v67;

  v2 = *(_QWORD **)(a1 + 8);
  if (v2[2])
  {
    v3 = *(const void **)(a1 + 32);
    v46[0] = 0;
    WTF::URL::invalidate((WTF::URL *)v46);
    v53 = 0;
    v54 = 0;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0;
    v4 = v55 & 0xCE | 1;
    v55 = v4;
    v56 = vdupq_n_s64(0x7FF8000000000000uLL);
    v57 = v56;
    v58 = 0;
    v59 = 0;
    v61 = v56;
    v60 = 0x8000000000000000;
    v62 = 0x7FF8000000000000;
    v63 &= 0xF0u;
    v64 &= 0xC000u;
    v65 = v65 & 0xF8 | 2;
    cf = v3;
    if (v3)
    {
      CFRetain(v3);
      v4 = v55;
    }
    v67 = 0;
    v55 = v4 & 0xF0 | (v3 == 0);
    WebCore::ResourceRequest::ResourceRequest((WebCore::ResourceRequest *)v43, *(NSURLRequest **)(a1 + 24));
    v5 = objc_msgSend(*(id *)(a1 + 24), "HTTPBodyStream");
    v8 = *(_QWORD *)(a1 + 8);
    if (!v5)
      goto LABEL_15;
    v9 = *(_QWORD *)(*(_QWORD *)(v8 + 16) + 16);
    if ((*(_BYTE *)(v9 + 200) & 1) != 0)
    {
      if ((*(_BYTE *)(v9 + 200) & 4) != 0)
      {
LABEL_7:
        v10 = *(WebCore::FormData **)(v9 + 184);
        if (v10)
          ++*(_DWORD *)v10;
        if ((v45 & 1) == 0)
        {
          WebCore::ResourceRequest::doUpdateResourceRequest((WebCore::ResourceRequest *)v43);
          v45 |= 1u;
        }
        v11 = v44;
        v44 = v10;
        if (v11)
        {
          if (*(_DWORD *)v11 == 1)
          {
            WebCore::FormData::~FormData(v11, v6);
            bmalloc::api::isoDeallocate(v35, v36);
          }
          else
          {
            --*(_DWORD *)v11;
          }
        }
        v45 = v45 & 0xF3 | 4;
        v8 = *(_QWORD *)(a1 + 8);
LABEL_15:
        v12 = *(_QWORD *)(*(_QWORD *)(v8 + 16) + 16);
        if ((*(_BYTE *)(v12 + 200) & 1) == 0)
        {
          WebCore::ResourceRequest::doUpdateResourceRequest((WebCore::ResourceRequest *)(v12 + 16));
          *(_BYTE *)(v12 + 200) |= 1u;
        }
        v13 = *(unsigned int *)(v12 + 124);
        if ((_DWORD)v13)
        {
          v14 = 0;
          v15 = (_DWORD **)(*(_QWORD *)(v12 + 112) + 8);
          while (*((_WORD *)v15 - 4) != 26)
          {
            ++v14;
            v15 += 2;
            if (v13 == v14)
              goto LABEL_29;
          }
          if (v14 >= v13)
          {
            __break(0xC471u);
            return;
          }
          v17 = (WTF::StringImpl *)*v15;
          if (*v15)
          {
            v18 = *(_DWORD *)v17;
            v19 = *((_DWORD *)v17 + 1);
            *(_DWORD *)v17 += 2;
            if (v18)
            {
              *(_DWORD *)v17 = v18;
              if (v19)
              {
LABEL_30:
                v20 = *(WebCore::ResourceHandle **)(*(_QWORD *)(a1 + 8) + 16);
                if (!*(_BYTE *)(*((_QWORD *)v20 + 2) + 1040))
                {
                  if ((v45 & 1) == 0)
                  {
                    WebCore::ResourceRequest::doUpdateResourceRequest((WebCore::ResourceRequest *)v43);
                    v45 |= 1u;
                  }
                  WebCore::SecurityOrigin::create((WebCore::SecurityOrigin *)v43, &v42);
                  v21 = v42;
                  MEMORY[0x19AEA52E0](v41, objc_msgSend(*(id *)(a1 + 32), "URL"));
                  {
                    WebCore::OriginAccessPatternsForWebProcess::singleton(void)::instance = (uint64_t)&off_1E3400538;
                  }
                  canRequest = WebCore::SecurityOrigin::canRequest(v21, (WebCore::ThreadableBlobRegistry *)v41, (uint64_t (***)(_QWORD, uint64_t))&WebCore::OriginAccessPatternsForWebProcess::singleton(void)::instance);
                  v24 = v41[0];
                  v41[0] = 0;
                  if (v24)
                  {
                    if (*(_DWORD *)v24 == 2)
                      WTF::StringImpl::destroy(v24, v22);
                    else
                      *(_DWORD *)v24 -= 2;
                  }
                  v42 = 0;
                  if (v21)
                  {
                    do
                    {
                      v25 = __ldaxr((unsigned int *)v21);
                      v26 = v25 - 1;
                    }
                    while (__stlxr(v26, (unsigned int *)v21));
                    if (!v26)
                    {
                      atomic_store(1u, (unsigned int *)v21);
                      v38 = *(WTF::StringImpl **)(v21 + 48);
                      *(_QWORD *)(v21 + 48) = 0;
                      if (v38)
                      {
                        if (*(_DWORD *)v38 == 2)
                          WTF::StringImpl::destroy(v38, v22);
                        else
                          *(_DWORD *)v38 -= 2;
                      }
                      v39 = *(WTF::StringImpl **)(v21 + 40);
                      *(_QWORD *)(v21 + 40) = 0;
                      if (v39)
                      {
                        if (*(_DWORD *)v39 == 2)
                          WTF::StringImpl::destroy(v39, v22);
                        else
                          *(_DWORD *)v39 -= 2;
                      }
                      v40 = *(unsigned int *)(v21 + 32);
                      if ((_DWORD)v40 != -1)
                        ((void (*)(WTF::StringImpl **, uint64_t))off_1E3486120[v40])(v41, v21 + 8);
                      *(_DWORD *)(v21 + 32) = -1;
                      WTF::fastFree((WTF *)v21, v22);
                    }
                  }
                  v20 = *(WebCore::ResourceHandle **)(*(_QWORD *)(a1 + 8) + 16);
                  if ((canRequest & 1) == 0)
                    *(_BYTE *)(*((_QWORD *)v20 + 2) + 1040) = 1;
                }
                WebCore::ResourceHandle::checkTAO(v20, (const WebCore::ResourceResponse *)v46, v7);
                v27 = *(_QWORD *)(a1 + 8);
                v28 = *(_QWORD *)(v27 + 16);
                ++*(_WORD *)(*(_QWORD *)(v28 + 16) + 1028);
                v29 = *(_QWORD *)(a1 + 16);
                *(_QWORD *)(a1 + 16) = 0;
                v30 = (WTF::StringImpl *)WTF::fastMalloc((WTF *)0x18);
                *(_QWORD *)v30 = &off_1E3486140;
                *((_QWORD *)v30 + 1) = v27;
                *((_QWORD *)v30 + 2) = v29;
                v41[0] = v30;
                WebCore::ResourceHandle::willSendRequest(v28, (uint64_t)v43, (uint64_t)v46, (uint64_t *)v41);
                v32 = v41[0];
                v41[0] = 0;
                if (v32)
                  (*(void (**)(WTF::StringImpl *))(*(_QWORD *)v32 + 8))(v32);
                WebCore::ResourceRequest::~ResourceRequest((WebCore::ResourceRequest *)v43, v31);
                v34 = cf;
                cf = 0;
                if (v34)
                  CFRelease(v34);
                WebCore::ResourceResponseBase::~ResourceResponseBase((WebCore::ResourceResponseBase *)v46, v33);
                return;
              }
            }
            else
            {
              WTF::StringImpl::destroy(v17, (WTF::StringImpl *)v6);
              if (v19)
                goto LABEL_30;
            }
          }
        }
LABEL_29:
        WebCore::ResourceRequestBase::clearHTTPContentType(v43, (WTF::StringImpl *)v6);
        goto LABEL_30;
      }
    }
    else
    {
      WebCore::ResourceRequest::doUpdateResourceRequest((WebCore::ResourceRequest *)(v9 + 16));
      v37 = *(_BYTE *)(v9 + 200) | 1;
      *(_BYTE *)(v9 + 200) = v37;
      if ((v37 & 4) != 0)
        goto LABEL_7;
    }
    WebCore::ResourceRequest::doUpdateResourceHTTPBody((WebCore::ResourceRequest *)(v9 + 16));
    *(_BYTE *)(v9 + 200) |= 4u;
    goto LABEL_7;
  }
  v16 = (const void *)v2[5];
  v2[5] = 0;
  if (v16)
  {
    CFRelease(v16);
    v2 = *(_QWORD **)(a1 + 8);
  }
  WTF::BinarySemaphore::signal((WTF::BinarySemaphore *)(v2 + 3));
}

- (_QWORD)connection:willSendRequest:redirectResponse:
{
  const void *v2;

  *a1 = &off_1E3486140;
  v2 = (const void *)a1[2];
  a1[2] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

- (uint64_t)connection:willSendRequest:redirectResponse:
{
  CFTypeRef v3;
  CFTypeRef v4;
  uint64_t v5;
  const void *v6;

  v3 = WebCore::ResourceRequest::nsURLRequest(this, 1);
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 8);
  if (v3)
    CFRetain(v3);
  v6 = *(const void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;
  if (v6)
    CFRelease(v6);
  return WTF::BinarySemaphore::signal((WTF::BinarySemaphore *)(*(_QWORD *)(a1 + 8) + 24));
}

- (_QWORD)connection:(_QWORD *)a1 didReceiveAuthenticationChallenge:
{
  const void *v2;
  const void *v3;

  *a1 = &off_1E3486190;
  v2 = (const void *)a1[3];
  a1[3] = 0;
  if (v2)
    CFRelease(v2);
  v3 = (const void *)a1[2];
  a1[2] = 0;
  if (v3)
    CFRelease(v3);
  return a1;
}

- (uint64_t)connection:(WTF *)this didReceiveAuthenticationChallenge:(void *)a2
{
  const void *v3;
  const void *v4;

  *(_QWORD *)this = &off_1E3486190;
  v3 = (const void *)*((_QWORD *)this + 3);
  *((_QWORD *)this + 3) = 0;
  if (v3)
    CFRelease(v3);
  v4 = (const void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v4)
    CFRelease(v4);
  return WTF::fastFree(this, a2);
}

- (void)connection:(uint64_t)a1 didReceiveAuthenticationChallenge:
{
  AuthenticationClient *v1;
  WTF::StringImpl *v2;
  CFTypeRef v3;
  CFTypeRef v4;
  _BYTE v5[416];
  CFTypeRef v6;
  CFTypeRef cf;

  v1 = *(AuthenticationClient **)(*(_QWORD *)(a1 + 8) + 16);
  if (v1)
  {
    WebCore::AuthenticationChallenge::AuthenticationChallenge((WebCore::AuthenticationChallenge *)v5, *(NSURLAuthenticationChallenge **)(a1 + 24));
    WebCore::ResourceHandle::didReceiveAuthenticationChallenge(v1, (const WebCore::AuthenticationChallenge *)v5);
    v3 = cf;
    cf = 0;
    if (v3)
      CFRelease(v3);
    v4 = v6;
    v6 = 0;
    if (v4)
      CFRelease(v4);
    WebCore::AuthenticationChallengeBase::~AuthenticationChallengeBase((WebCore::AuthenticationChallengeBase *)v5, v2);
  }
  else
  {
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 24), "sender"), "cancelAuthenticationChallenge:", *(_QWORD *)(a1 + 24));
  }
}

- (_QWORD)connection:(_QWORD *)a1 canAuthenticateAgainstProtectionSpace:
{
  const void *v2;

  v2 = (const void *)a1[1];
  *a1 = &off_1E3486208;
  a1[1] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

- (uint64_t)connection:(WTF *)this canAuthenticateAgainstProtectionSpace:(void *)a2
{
  const void *v3;

  v3 = (const void *)*((_QWORD *)this + 1);
  *(_QWORD *)this = &off_1E3486208;
  *((_QWORD *)this + 1) = 0;
  if (v3)
    CFRelease(v3);
  return WTF::fastFree(this, a2);
}

- (WTF::StringImpl)connection:(uint64_t)a1 canAuthenticateAgainstProtectionSpace:
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  WTF::StringImpl *v7;
  uint64_t v8;
  CFTypeRef v9;
  WTF::StringImpl *v10;
  WTF::StringImpl *result;
  _QWORD *v12;
  WTF::StringImpl *v13;
  WTF::StringImpl *v14;
  CFTypeRef cf;

  v1 = *(_QWORD *)(a1 + 8);
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    WebCore::ProtectionSpace::ProtectionSpace((WebCore::ProtectionSpace *)&v13, *(NSURLProtectionSpace **)(a1 + 24));
    v5 = *(_QWORD *)(a1 + 8);
    v4 = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;
    v6 = (_QWORD *)WTF::fastMalloc((WTF *)0x18);
    *v6 = &off_1E34861E0;
    v6[1] = v5;
    v6[2] = v4;
    v12 = v6;
    WebCore::ResourceHandle::canAuthenticateAgainstProtectionSpace(v2, (uint64_t)&v13, (uint64_t *)&v12);
    v8 = (uint64_t)v12;
    v12 = 0;
    if (v8)
      (*(void (**)(uint64_t))(*(_QWORD *)v8 + 8))(v8);
    v9 = cf;
    cf = 0;
    if (v9)
      CFRelease(v9);
    v10 = v14;
    v14 = 0;
    if (v10)
    {
      if (*(_DWORD *)v10 == 2)
        WTF::StringImpl::destroy(v10, v7);
      else
        *(_DWORD *)v10 -= 2;
    }
    result = v13;
    v13 = 0;
    if (result)
    {
      if (*(_DWORD *)result == 2)
        return (WTF::StringImpl *)WTF::StringImpl::destroy(result, v7);
      else
        *(_DWORD *)result -= 2;
    }
  }
  else
  {
    *(_BYTE *)(v1 + 72) = 0;
    return (WTF::StringImpl *)WTF::BinarySemaphore::signal((WTF::BinarySemaphore *)(v1 + 24));
  }
  return result;
}

- (_QWORD)connection:canAuthenticateAgainstProtectionSpace:
{
  const void *v2;

  *a1 = &off_1E34861E0;
  v2 = (const void *)a1[2];
  a1[2] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

- (uint64_t)connection:canAuthenticateAgainstProtectionSpace:
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 8);
  *(_BYTE *)(v2 + 72) = a2;
  return WTF::BinarySemaphore::signal((WTF::BinarySemaphore *)(v2 + 24));
}

- (_QWORD)connection:(_QWORD *)a1 didReceiveResponse:
{
  const void *v2;

  v2 = (const void *)a1[1];
  *a1 = &off_1E3486280;
  a1[1] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

- (uint64_t)connection:(WTF *)this didReceiveResponse:(void *)a2
{
  const void *v3;

  v3 = (const void *)*((_QWORD *)this + 1);
  *(_QWORD *)this = &off_1E3486280;
  *((_QWORD *)this + 1) = 0;
  if (v3)
    CFRelease(v3);
  return WTF::fastFree(this, a2);
}

- (void)connection:(uint64_t)a1 didReceiveResponse:
{
  uint64_t v1;
  uint64_t v2;
  const void *v4;
  const WebCore::SecurityOrigin *v5;
  char v6;
  const WebCore::ResourceHandle *v7;
  WTF::StringImpl *v8;
  unsigned int *v9;
  unsigned int v10;
  WTF *v11;
  unsigned int v12;
  unsigned int v13;
  uint64_t v14;
  WTF *v15;
  uint64_t v16;
  unsigned int v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  WTF::StringImpl *v23;
  uint64_t v24;
  WTF *v25;
  unsigned int v26;
  unsigned int v27;
  CFTypeRef v28;
  _DWORD *v29;
  WTF::StringImpl *v30;
  _DWORD *v31;
  WTF::StringImpl *v32;
  _DWORD *v33;
  WTF::StringImpl *v34;
  _QWORD *v35;
  WTF *v36;
  _QWORD v37[5];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  WTF *v42[2];
  char v43;
  char v44;
  __int16 v45;
  char v46;
  int64x2_t v47;
  int64x2_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  int64x2_t v52;
  uint64_t v53;
  char v54;
  __int16 v55;
  char v56;
  CFTypeRef cf;
  char v58;

  v1 = *(_QWORD *)(a1 + 8);
  v2 = *(_QWORD *)(v1 + 16);
  if (v2 && (++*(_DWORD *)(v2 + 8), *(_QWORD *)(*(_QWORD *)(v2 + 16) + 8)))
  {
    if ((objc_opt_respondsToSelector() & 1) == 0 || objc_msgSend(*(id *)(a1 + 24), "statusCode") != 304)
      WebCore::adjustMIMETypeIfNecessary(objc_msgSend(*(id *)(a1 + 24), "_CFURLResponse"), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 8) + 16) + 16) + 163) == 1, 0);
    if (objc_msgSend((id)WebCore::ResourceRequest::nsURLRequest((WebCore::ResourceRequest *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 8) + 16) + 16) + 16), 0), "_propertyForKey:", CFSTR("ForceHTMLMIMEType")))
    {
      objc_msgSend(*(id *)(a1 + 24), "_setMIMEType:", CFSTR("text/html"));
    }
    v4 = *(const void **)(a1 + 24);
    v37[0] = 0;
    WTF::URL::invalidate((WTF::URL *)v37);
    v44 = 0;
    v45 = 0;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    *(_OWORD *)v42 = 0u;
    v43 = 0;
    v6 = v46 & 0xCE | 1;
    v46 = v6;
    v47 = vdupq_n_s64(0x7FF8000000000000uLL);
    v48 = v47;
    v49 = 0;
    v50 = 0;
    v51 = 0x8000000000000000;
    v52 = v47;
    v53 = 0x7FF8000000000000;
    v54 &= 0xF0u;
    v55 &= 0xC000u;
    v56 = v56 & 0xF8 | 2;
    cf = v4;
    if (v4)
    {
      CFRetain(v4);
      v6 = v46;
    }
    v58 = 0;
    v46 = v6 & 0xF0 | (v4 == 0);
    WebCore::ResourceHandle::checkTAO(*(WebCore::ResourceHandle **)(*(_QWORD *)(a1 + 8) + 16), (const WebCore::ResourceResponse *)v37, v5);
    WebCore::copyTimingData(*(WebCore **)(a1 + 32), *(NSURLConnection **)(*(_QWORD *)(a1 + 8) + 16), v7, (uint64_t *)&v36);
    v55 = v55 & 0xC3FF | 0x400;
    v9 = (unsigned int *)v36;
    if (v36)
    {
      do
        v10 = __ldaxr(v9);
      while (__stlxr(v10 + 1, v9));
    }
    v11 = v42[1];
    v42[1] = (WTF *)v9;
    if (v11)
    {
      do
      {
        v12 = __ldaxr((unsigned int *)v11);
        v13 = v12 - 1;
      }
      while (__stlxr(v13, (unsigned int *)v11));
      if (!v13)
      {
        atomic_store(1u, (unsigned int *)v11);
        v29 = (_DWORD *)*((_QWORD *)v11 + 16);
        *((_QWORD *)v11 + 16) = 0;
        if (v29)
          WTF::RefCounted<WebCore::AdditionalNetworkLoadMetricsForWebInspector>::deref(v29, v8);
        v30 = (WTF::StringImpl *)*((_QWORD *)v11 + 12);
        *((_QWORD *)v11 + 12) = 0;
        if (v30)
        {
          if (*(_DWORD *)v30 == 2)
            WTF::StringImpl::destroy(v30, v8);
          else
            *(_DWORD *)v30 -= 2;
        }
        WTF::fastFree(v11, v8);
      }
    }
    v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 8) + 16) + 16);
    v15 = v36;
    v36 = 0;
    v16 = *(_QWORD *)(v14 + 512);
    *(_QWORD *)(v14 + 512) = v15;
    if (v16)
    {
      do
      {
        v17 = __ldaxr((unsigned int *)v16);
        v18 = v17 - 1;
      }
      while (__stlxr(v18, (unsigned int *)v16));
      if (!v18)
      {
        atomic_store(1u, (unsigned int *)v16);
        v31 = *(_DWORD **)(v16 + 128);
        *(_QWORD *)(v16 + 128) = 0;
        if (v31)
          WTF::RefCounted<WebCore::AdditionalNetworkLoadMetricsForWebInspector>::deref(v31, v8);
        v32 = *(WTF::StringImpl **)(v16 + 96);
        *(_QWORD *)(v16 + 96) = 0;
        if (v32)
        {
          if (*(_DWORD *)v32 == 2)
            WTF::StringImpl::destroy(v32, v8);
          else
            *(_DWORD *)v32 -= 2;
        }
        WTF::fastFree((WTF *)v16, v8);
      }
    }
    v20 = *(_QWORD *)(a1 + 8);
    v19 = *(_QWORD *)(a1 + 16);
    v21 = *(_QWORD **)(v20 + 16);
    *(_QWORD *)(a1 + 16) = 0;
    v22 = (_QWORD *)WTF::fastMalloc((WTF *)0x18);
    *v22 = &off_1E3486258;
    v22[1] = v20;
    v22[2] = v19;
    v35 = v22;
    WebCore::ResourceHandle::didReceiveResponse(v21, (uint64_t)v37, (uint64_t *)&v35);
    v24 = (uint64_t)v35;
    v35 = 0;
    if (v24)
      (*(void (**)(uint64_t))(*(_QWORD *)v24 + 8))(v24);
    v25 = v36;
    v36 = 0;
    if (v25)
    {
      do
      {
        v26 = __ldaxr((unsigned int *)v25);
        v27 = v26 - 1;
      }
      while (__stlxr(v27, (unsigned int *)v25));
      if (!v27)
      {
        atomic_store(1u, (unsigned int *)v25);
        v33 = (_DWORD *)*((_QWORD *)v25 + 16);
        *((_QWORD *)v25 + 16) = 0;
        if (v33)
          WTF::RefCounted<WebCore::AdditionalNetworkLoadMetricsForWebInspector>::deref(v33, v23);
        v34 = (WTF::StringImpl *)*((_QWORD *)v25 + 12);
        *((_QWORD *)v25 + 12) = 0;
        if (v34)
        {
          if (*(_DWORD *)v34 == 2)
            WTF::StringImpl::destroy(v34, v23);
          else
            *(_DWORD *)v34 -= 2;
        }
        WTF::fastFree(v25, v23);
      }
    }
    v28 = cf;
    cf = 0;
    if (v28)
      CFRelease(v28);
    WebCore::ResourceResponseBase::~ResourceResponseBase((WebCore::ResourceResponseBase *)v37, v23);
  }
  else
  {
    WTF::BinarySemaphore::signal((WTF::BinarySemaphore *)(v1 + 24));
    if (!v2)
      return;
  }
  if (*(_DWORD *)(v2 + 8) == 1)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 48))(v2);
  else
    --*(_DWORD *)(v2 + 8);
}

- (_QWORD)connection:didReceiveResponse:
{
  const void *v2;

  *a1 = &off_1E3486258;
  v2 = (const void *)a1[2];
  a1[2] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

- (uint64_t)connection:didReceiveResponse:
{
  return WTF::BinarySemaphore::signal((WTF::BinarySemaphore *)(*(_QWORD *)(a1 + 8) + 24));
}

- (_QWORD)connection:(_QWORD *)a1 didReceiveData:lengthReceived:
{
  const void *v2;
  const void *v3;

  *a1 = &off_1E34862A8;
  v2 = (const void *)a1[3];
  a1[3] = 0;
  if (v2)
    CFRelease(v2);
  v3 = (const void *)a1[2];
  a1[2] = 0;
  if (v3)
    CFRelease(v3);
  return a1;
}

- (uint64_t)connection:(WTF *)this didReceiveData:(void *)a2 lengthReceived:
{
  const void *v3;
  const void *v4;

  *(_QWORD *)this = &off_1E34862A8;
  v3 = (const void *)*((_QWORD *)this + 3);
  *((_QWORD *)this + 3) = 0;
  if (v3)
    CFRelease(v3);
  v4 = (const void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v4)
    CFRelease(v4);
  return WTF::fastFree(this, a2);
}

- (uint64_t)connection:(uint64_t *)result didReceiveData:lengthReceived:
{
  uint64_t v1;
  uint64_t v2;
  const void *v3;
  CFIndex v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  CFIndex v9;

  v1 = *(_QWORD *)(result[1] + 16);
  if (v1)
  {
    v2 = *(_QWORD *)(*(_QWORD *)(v1 + 16) + 8);
    if (v2)
    {
      v3 = (const void *)result[3];
      v4 = WTF::fastMalloc((WTF *)0x38);
      *(_DWORD *)v4 = 1;
      *(_QWORD *)(v4 + 8) = v4 + 24;
      *(_QWORD *)(v4 + 16) = 1;
      *(_BYTE *)(v4 + 40) = 0;
      *(_QWORD *)(v4 + 48) = 0;
      WebCore::FragmentedSharedBuffer::append(v4, v3);
      v9 = v4;
      v5 = WTF::fastMalloc((WTF *)0x38);
      v8 = WebCore::SharedBuffer::SharedBuffer(v5, &v9);
      WTF::Ref<WebCore::FragmentedSharedBuffer,WTF::RawPtrTraits<WebCore::FragmentedSharedBuffer>,WTF::DefaultRefDerefTraits<WebCore::FragmentedSharedBuffer>>::~Ref(&v9, v6);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)v2 + 24))(v2, v1, v5, 0xFFFFFFFFLL);
      return WTF::Ref<WebCore::SharedBuffer,WTF::RawPtrTraits<WebCore::SharedBuffer>,WTF::DefaultRefDerefTraits<WebCore::SharedBuffer>>::~Ref(&v8, v7);
    }
  }
  return result;
}

- (_QWORD)connection:(_QWORD *)a1 didSendBodyData:totalBytesWritten:totalBytesExpectedToWrite:
{
  const void *v2;

  *a1 = &off_1E34862D0;
  v2 = (const void *)a1[2];
  a1[2] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

- (uint64_t)connection:(WTF *)this didSendBodyData:(void *)a2 totalBytesWritten:totalBytesExpectedToWrite:
{
  const void *v3;

  *(_QWORD *)this = &off_1E34862D0;
  v3 = (const void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v3)
    CFRelease(v3);
  return WTF::fastFree(this, a2);
}

- (uint64_t)connection:(uint64_t)result didSendBodyData:totalBytesWritten:totalBytesExpectedToWrite:
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 8) + 16);
  if (v1)
  {
    v2 = *(_QWORD *)(*(_QWORD *)(v1 + 16) + 8);
    if (v2)
      return (*(uint64_t (**)(_QWORD))(*(_QWORD *)v2 + 16))(*(_QWORD *)(*(_QWORD *)(v1 + 16) + 8));
  }
  return result;
}

- (_QWORD)connectionDidFinishLoading:(_QWORD *)a1
{
  const void *v2;
  const void *v3;
  const void *v4;

  *a1 = &off_1E34862F8;
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

- (uint64_t)connectionDidFinishLoading:(WTF *)this
{
  const void *v3;
  const void *v4;
  const void *v5;

  *(_QWORD *)this = &off_1E34862F8;
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

- (uint64_t)connectionDidFinishLoading:(uint64_t)result
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  void *v6;
  WTF::StringImpl *v7;
  uint64_t v8;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;
  WTF::StringImpl *v11;
  int v12;
  uint64_t v13;
  void *v14;
  unsigned __int8 *v15;
  unsigned __int8 *v16;
  unsigned __int8 v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;
  unsigned int v23;
  WTF::StringImpl *v24;
  void *v25;
  WTF *v26;
  WTF::StringImpl *v27;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 8) + 16);
  if (!v1)
    return result;
  v2 = *(_QWORD *)(v1 + 16);
  if (!*(_QWORD *)(v2 + 8))
    return result;
  v3 = result;
  v4 = *(_QWORD *)(v2 + 512);
  objc_msgSend((id)objc_msgSend(*(id *)(result + 32), "objectForKey:", CFSTR("_kCFNTimingDataResponseEnd")), "doubleValue");
  if (v5 == 0.0)
  {
    *(_QWORD *)(v4 + 80) = *(_QWORD *)(v4 + 72);
  }
  else
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", v5);
    objc_msgSend(v6, "timeIntervalSince1970");
    v27 = v7;
    WTF::WallTime::approximateMonotonicTime((WTF::WallTime *)&v27);
    *(_QWORD *)(v4 + 80) = v8;
    if (v6)
      CFRelease(v6);
  }
  MEMORY[0x19AEA5508](&v27, objc_msgSend(*(id *)(v3 + 32), "objectForKey:", CFSTR("_kCFNTimingDataNetworkProtocolName")));
  v10 = v27;
  v27 = 0;
  v11 = *(WTF::StringImpl **)(v4 + 96);
  *(_QWORD *)(v4 + 96) = v10;
  if (v11)
  {
    v12 = *(_DWORD *)v11 - 2;
    if (*(_DWORD *)v11 != 2)
    {
LABEL_9:
      *(_DWORD *)v11 = v12;
      goto LABEL_10;
    }
    WTF::StringImpl::destroy(v11, v9);
    v11 = v27;
    v27 = 0;
    if (v11)
    {
      v12 = *(_DWORD *)v11 - 2;
      if (*(_DWORD *)v11 != 2)
        goto LABEL_9;
      WTF::StringImpl::destroy(v11, v24);
    }
  }
LABEL_10:
  *(_QWORD *)(v4 + 112) = objc_msgSend((id)objc_msgSend(*(id *)(v3 + 32), "objectForKey:", CFSTR("_kCFNTimingDataResponseBodyBytesReceived")), "unsignedLongLongValue");
  *(_QWORD *)(v4 + 120) = objc_msgSend((id)objc_msgSend(*(id *)(v3 + 32), "objectForKey:", CFSTR("_kCFNTimingDataResponseBodyBytesDecoded")), "unsignedLongLongValue");
  *(_BYTE *)(v4 + 106) |= 1u;
  v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 8) + 16) + 16) + 8);
  result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v13 + 40))(v13);
  v15 = *(unsigned __int8 **)(*(_QWORD *)(v3 + 8) + 32);
  if (!v15)
    return result;
  v16 = v15 + 8;
  if (__ldaxr(v15 + 8))
  {
    __clrex();
  }
  else if (!__stxr(1u, v16))
  {
    goto LABEL_15;
  }
  MEMORY[0x19AEA534C](v15 + 8);
LABEL_15:
  v15[48] = 1;
  result = (uint64_t)(v15 + 9);
  v18 = atomic_load(v15 + 9);
  if ((v18 & 1) != 0)
  {
    atomic_store(0, (unsigned __int8 *)result);
    result = WTF::ParkingLot::unparkAll((WTF::ParkingLot *)result, v14);
  }
  v19 = __ldxr(v16);
  if (v19 == 1)
  {
    if (!__stlxr(0, v16))
      goto LABEL_22;
  }
  else
  {
    __clrex();
  }
  result = WTF::Lock::unlockSlow((WTF::Lock *)(v15 + 8));
LABEL_22:
  v20 = *(_QWORD *)(v3 + 8);
  v21 = *(_QWORD *)(v20 + 32);
  *(_QWORD *)(v20 + 32) = 0;
  if (v21)
  {
    do
    {
      v22 = __ldaxr((unsigned int *)v21);
      v23 = v22 - 1;
    }
    while (__stlxr(v23, (unsigned int *)v21));
    if (!v23)
    {
      atomic_store(1u, (unsigned int *)v21);
      WTF::Deque<std::unique_ptr<WTF::Function<void ()(void)>>,0ul>::destroyAll((unint64_t *)(v21 + 16), v14);
      v26 = *(WTF **)(v21 + 32);
      if (v26)
      {
        *(_QWORD *)(v21 + 32) = 0;
        *(_DWORD *)(v21 + 40) = 0;
        WTF::fastFree(v26, v25);
      }
      return WTF::fastFree((WTF *)v21, v25);
    }
  }
  return result;
}

- (_QWORD)connection:(_QWORD *)a1 didFailWithError:
{
  const void *v2;
  const void *v3;

  *a1 = &off_1E3486320;
  v2 = (const void *)a1[3];
  a1[3] = 0;
  if (v2)
    CFRelease(v2);
  v3 = (const void *)a1[2];
  a1[2] = 0;
  if (v3)
    CFRelease(v3);
  return a1;
}

- (uint64_t)connection:(WTF *)this didFailWithError:(void *)a2
{
  const void *v3;
  const void *v4;

  *(_QWORD *)this = &off_1E3486320;
  v3 = (const void *)*((_QWORD *)this + 3);
  *((_QWORD *)this + 3) = 0;
  if (v3)
    CFRelease(v3);
  v4 = (const void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v4)
    CFRelease(v4);
  return WTF::fastFree(this, a2);
}

- (uint64_t)connection:(uint64_t)result didFailWithError:
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  WTF::StringImpl *v4;
  CFTypeRef v5;
  WTF::StringImpl *v6;
  WTF::StringImpl *v7;
  unsigned __int8 *v8;
  unsigned __int8 *v9;
  unsigned __int8 v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  unsigned int v16;
  void *v17;
  WTF *v18;
  WTF::StringImpl *v19;
  WTF::StringImpl *v20;
  WTF::StringImpl *v21;
  CFTypeRef cf;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 8) + 16);
  if (v1)
  {
    v2 = *(_QWORD *)(*(_QWORD *)(v1 + 16) + 8);
    if (v2)
    {
      v3 = result;
      WebCore::ResourceError::ResourceError((WebCore::ResourceError *)&v19, *(NSError **)(result + 24));
      (*(void (**)(uint64_t, uint64_t, WTF::StringImpl **))(*(_QWORD *)v2 + 48))(v2, v1, &v19);
      v5 = cf;
      cf = 0;
      if (v5)
        CFRelease(v5);
      v6 = v21;
      v21 = 0;
      if (v6)
      {
        if (*(_DWORD *)v6 == 2)
          WTF::StringImpl::destroy(v6, v4);
        else
          *(_DWORD *)v6 -= 2;
      }
      v7 = v20;
      v20 = 0;
      if (v7)
      {
        if (*(_DWORD *)v7 == 2)
          WTF::StringImpl::destroy(v7, v4);
        else
          *(_DWORD *)v7 -= 2;
      }
      result = (uint64_t)v19;
      v19 = 0;
      if (result)
      {
        if (*(_DWORD *)result == 2)
          result = WTF::StringImpl::destroy((WTF::StringImpl *)result, v4);
        else
          *(_DWORD *)result -= 2;
      }
      v8 = *(unsigned __int8 **)(*(_QWORD *)(v3 + 8) + 32);
      if (v8)
      {
        v9 = v8 + 8;
        if (__ldaxr(v8 + 8))
        {
          __clrex();
        }
        else if (!__stxr(1u, v9))
        {
          goto LABEL_19;
        }
        MEMORY[0x19AEA534C](v8 + 8);
LABEL_19:
        v8[48] = 1;
        result = (uint64_t)(v8 + 9);
        v11 = atomic_load(v8 + 9);
        if ((v11 & 1) != 0)
        {
          atomic_store(0, (unsigned __int8 *)result);
          result = WTF::ParkingLot::unparkAll((WTF::ParkingLot *)result, v4);
        }
        v12 = __ldxr(v9);
        if (v12 == 1)
        {
          if (!__stlxr(0, v9))
            goto LABEL_26;
        }
        else
        {
          __clrex();
        }
        result = WTF::Lock::unlockSlow((WTF::Lock *)(v8 + 8));
LABEL_26:
        v13 = *(_QWORD *)(v3 + 8);
        v14 = *(_QWORD *)(v13 + 32);
        *(_QWORD *)(v13 + 32) = 0;
        if (v14)
        {
          do
          {
            v15 = __ldaxr((unsigned int *)v14);
            v16 = v15 - 1;
          }
          while (__stlxr(v16, (unsigned int *)v14));
          if (!v16)
          {
            atomic_store(1u, (unsigned int *)v14);
            WTF::Deque<std::unique_ptr<WTF::Function<void ()(void)>>,0ul>::destroyAll((unint64_t *)(v14 + 16), v4);
            v18 = *(WTF **)(v14 + 32);
            if (v18)
            {
              *(_QWORD *)(v14 + 32) = 0;
              *(_DWORD *)(v14 + 40) = 0;
              WTF::fastFree(v18, v17);
            }
            return WTF::fastFree((WTF *)v14, v17);
          }
        }
      }
    }
  }
  return result;
}

- (_QWORD)connection:(_QWORD *)a1 willCacheResponse:
{
  const void *v2;

  v2 = (const void *)a1[1];
  *a1 = &off_1E3486398;
  a1[1] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

- (uint64_t)connection:(WTF *)this willCacheResponse:(void *)a2
{
  const void *v3;

  v3 = (const void *)*((_QWORD *)this + 1);
  *(_QWORD *)this = &off_1E3486398;
  *((_QWORD *)this + 1) = 0;
  if (v3)
    CFRelease(v3);
  return WTF::fastFree(this, a2);
}

- (uint64_t)connection:(_QWORD *)a1 willCacheResponse:
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t result;
  const void *v9;
  _QWORD *v10;

  v2 = (_QWORD *)a1[1];
  v3 = v2[2];
  if (v3 && (v4 = *(_QWORD *)(*(_QWORD *)(v3 + 16) + 8)) != 0)
  {
    v6 = a1[2];
    v5 = a1[3];
    a1[2] = 0;
    v7 = (_QWORD *)WTF::fastMalloc((WTF *)0x18);
    *v7 = &off_1E3486370;
    v7[1] = v2;
    v7[2] = v6;
    v10 = v7;
    (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD **))(*(_QWORD *)v4 + 104))(v4, v3, v5, &v10);
    result = (uint64_t)v10;
    v10 = 0;
    if (result)
      return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  }
  else
  {
    v9 = (const void *)v2[6];
    v2[6] = 0;
    if (v9)
    {
      CFRelease(v9);
      v2 = (_QWORD *)a1[1];
    }
    return WTF::BinarySemaphore::signal((WTF::BinarySemaphore *)(v2 + 3));
  }
  return result;
}

- (_QWORD)connection:willCacheResponse:
{
  const void *v2;

  *a1 = &off_1E3486370;
  v2 = (const void *)a1[2];
  a1[2] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

- (uint64_t)connection:willCacheResponse:
{
  uint64_t v4;
  const void *v5;

  v4 = *(_QWORD *)(a1 + 8);
  if (cf)
    CFRetain(cf);
  v5 = *(const void **)(v4 + 48);
  *(_QWORD *)(v4 + 48) = cf;
  if (v5)
    CFRelease(v5);
  return WTF::BinarySemaphore::signal((WTF::BinarySemaphore *)(*(_QWORD *)(a1 + 8) + 24));
}

@end
