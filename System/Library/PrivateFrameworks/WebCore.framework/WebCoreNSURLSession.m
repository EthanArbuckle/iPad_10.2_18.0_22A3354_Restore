@implementation WebCoreNSURLSession

- (WebCoreNSURLSession)initWithResourceLoader:(void *)a3 delegate:(id)a4 delegateQueue:(id)a5
{
  WebCoreNSURLSession *v8;
  WebCoreNSURLSession *v9;
  unsigned int *v10;
  unsigned int v11;
  PlatformMediaResourceLoader *m_ptr;
  unsigned int *v13;
  unsigned int v14;
  unsigned int v15;
  RefCountedSerialFunctionDispatcher *v16;
  RefCountedSerialFunctionDispatcher *v17;
  RefCountedSerialFunctionDispatcher *v18;
  const void **p_m_ptr;
  const void *v20;
  WorkQueue *v21;
  WorkQueue *v22;
  RefCountedSerialFunctionDispatcher *v23;
  RefCountedSerialFunctionDispatcher *v24;
  RefCountedSerialFunctionDispatcher *v25;
  RefCountedSerialFunctionDispatcher *v26;
  RefCountedSerialFunctionDispatcher *v28;
  RefCountedSerialFunctionDispatcher *v29;
  objc_super v30;
  RefCountedSerialFunctionDispatcher *v31;

  v30.receiver = self;
  v30.super_class = (Class)WebCoreNSURLSession;
  v8 = -[WebCoreNSURLSession init](&v30, sel_init);
  v9 = v8;
  if (!v8)
    return v9;
  v10 = (unsigned int *)((char *)a3 + 8);
  do
    v11 = __ldaxr(v10);
  while (__stlxr(v11 + 1, v10));
  m_ptr = v8->_loader.m_ptr;
  v8->_loader.m_ptr = (PlatformMediaResourceLoader *)a3;
  if (m_ptr)
  {
    v13 = (unsigned int *)((char *)m_ptr + 8);
    do
    {
      v14 = __ldaxr(v13);
      v15 = v14 - 1;
    }
    while (__stlxr(v15, v13));
    if (!v15)
    {
      atomic_store(1u, v13);
      v28 = (RefCountedSerialFunctionDispatcher *)WTF::fastMalloc((WTF *)0x10);
      v28->var0 = (void **)off_1E32051E8;
      v28[1].var0 = (void **)v13;
      v31 = v28;
      WTF::ensureOnMainThread();
      v29 = v31;
      v31 = 0;
      if (v29)
        (*((void (**)(RefCountedSerialFunctionDispatcher *))v29->var0 + 1))(v29);
    }
  }
  (*(void (**)(RefCountedSerialFunctionDispatcher **__return_ptr))(*(_QWORD *)v9->_loader.m_ptr + 24))(&v31);
  v16 = v31;
  v31 = 0;
  v17 = v9->_targetDispatcher.m_ptr;
  v9->_targetDispatcher.m_ptr = v16;
  if (v17)
  {
    (*((void (**)(RefCountedSerialFunctionDispatcher *))v17->var0 + 5))(v17);
    v18 = v31;
    v31 = 0;
    if (v18)
      (*((void (**)(RefCountedSerialFunctionDispatcher *))v18->var0 + 5))(v18);
  }
  -[WebCoreNSURLSession setDelegate:](v9, "setDelegate:", a4);
  if (a5)
  {
    p_m_ptr = (const void **)&v9->_queue.m_ptr;
LABEL_14:
    CFRetain(a5);
    goto LABEL_15;
  }
  a5 = (id)objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  p_m_ptr = (const void **)&v9->_queue.m_ptr;
  if (a5)
    goto LABEL_14;
LABEL_15:
  v20 = *p_m_ptr;
  *p_m_ptr = a5;
  if (v20)
    CFRelease(v20);
  WTF::WorkQueue::create();
  v21 = (WorkQueue *)v31;
  v31 = 0;
  v22 = v9->_internalQueue.m_ptr;
  v9->_internalQueue.m_ptr = v21;
  if (v22)
  {
    (*(void (**)(WorkQueue *))(*(_QWORD *)v22 + 56))(v22);
    v23 = v31;
    v31 = 0;
    if (v23)
      (*((void (**)(RefCountedSerialFunctionDispatcher *))v23->var0 + 7))(v23);
  }
  v24 = v9->_targetDispatcher.m_ptr;
  CFRetain(v9);
  v25 = (RefCountedSerialFunctionDispatcher *)WTF::fastMalloc((WTF *)0x10);
  v25->var0 = (void **)&off_1E3485C60;
  v25[1].var0 = (void **)&v9->super.isa;
  v31 = v25;
  (*((void (**)(RefCountedSerialFunctionDispatcher *, RefCountedSerialFunctionDispatcher **))v24->var0 + 2))(v24, &v31);
  v26 = v31;
  v31 = 0;
  if (v26)
    (*((void (**)(RefCountedSerialFunctionDispatcher *))v26->var0 + 1))(v26);
  return v9;
}

- (void)dealloc
{
  Lock *p_dataTasksLock;
  RefCountedSerialFunctionDispatcher *m_ptr;
  void *m_table;
  RangeResponseGenerator *v7;
  _QWORD *v8;
  _QWORD *v9;
  int v10;
  objc_super v11;
  _QWORD *v12;

  p_dataTasksLock = &self->_dataTasksLock;
  if (__ldaxr(&self->_dataTasksLock.m_byte.value.__a_.__a_value))
  {
    __clrex();
  }
  else if (!__stxr(1u, &p_dataTasksLock->m_byte.value.__a_.__a_value))
  {
    goto LABEL_5;
  }
  MEMORY[0x19AEA534C](&self->_dataTasksLock, a2);
LABEL_5:
  m_ptr = self->_targetDispatcher.m_ptr;
  m_table = self->_dataTasks.m_impl.var0.m_table;
  self->_dataTasks.m_impl.var0.m_table = 0;
  v7 = self->_rangeResponseGenerator.m_ptr;
  self->_rangeResponseGenerator.m_ptr = 0;
  v8 = (_QWORD *)WTF::fastMalloc((WTF *)0x18);
  *v8 = &off_1E3485C88;
  v8[1] = m_table;
  v8[2] = v7;
  v12 = v8;
  (*((void (**)(RefCountedSerialFunctionDispatcher *, _QWORD **))m_ptr->var0 + 2))(m_ptr, &v12);
  v9 = v12;
  v12 = 0;
  if (v9)
    (*(void (**)(_QWORD *))(*v9 + 8))(v9);
  v10 = __ldxr(&p_dataTasksLock->m_byte.value.__a_.__a_value);
  if (v10 == 1)
  {
    if (!__stlxr(0, &p_dataTasksLock->m_byte.value.__a_.__a_value))
      goto LABEL_12;
  }
  else
  {
    __clrex();
  }
  WTF::Lock::unlockSlow((WTF::Lock *)p_dataTasksLock);
LABEL_12:
  v11.receiver = self;
  v11.super_class = (Class)WebCoreNSURLSession;
  -[WebCoreNSURLSession dealloc](&v11, sel_dealloc);
}

- (void)taskCompleted:(id)a3
{
  Lock *p_dataTasksLock;
  HashSet<WTF::RetainPtr<WebCoreNSURLSessionDataTask>, WTF::DefaultHash<WTF::RetainPtr<WebCoreNSURLSessionDataTask>>, WTF::HashTraits<WTF::RetainPtr<WebCoreNSURLSessionDataTask>>, WTF::HashTableTraits> *p_dataTasks;
  _DWORD *m_tableForLLDB;
  unsigned int v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  id v14;
  int v15;
  const void *v16;
  _DWORD *m_table;
  int v18;
  unsigned int v19;
  _BOOL4 v21;
  int v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD *v25;

  objc_msgSend(a3, "setSession:", 0);
  p_dataTasksLock = &self->_dataTasksLock;
  if (__ldaxr(&self->_dataTasksLock.m_byte.value.__a_.__a_value))
  {
    __clrex();
LABEL_4:
    MEMORY[0x19AEA534C](&self->_dataTasksLock);
    goto LABEL_5;
  }
  if (__stxr(1u, &p_dataTasksLock->m_byte.value.__a_.__a_value))
    goto LABEL_4;
LABEL_5:
  p_dataTasks = &self->_dataTasks;
  m_tableForLLDB = self->_dataTasks.m_impl.var0.m_tableForLLDB;
  if (!m_tableForLLDB)
    goto LABEL_27;
  v9 = *(m_tableForLLDB - 2);
  v10 = ((unint64_t)a3 + ~((_QWORD)a3 << 32)) ^ (((unint64_t)a3 + ~((_QWORD)a3 << 32)) >> 22);
  v11 = 9 * ((v10 + ~(v10 << 13)) ^ ((v10 + ~(v10 << 13)) >> 8));
  v12 = (v11 ^ (v11 >> 15)) + ~((v11 ^ (v11 >> 15)) << 27);
  v13 = v9 & ((v12 >> 31) ^ v12);
  v14 = *(id *)&m_tableForLLDB[2 * v13];
  if (v14 != a3)
  {
    v15 = 1;
    while (v14)
    {
      v13 = ((_DWORD)v13 + v15) & v9;
      v14 = *(id *)&m_tableForLLDB[2 * v13];
      ++v15;
      if (v14 == a3)
        goto LABEL_12;
    }
    v13 = *(m_tableForLLDB - 1);
  }
  if (v13 != *(m_tableForLLDB - 1))
  {
    v16 = *(const void **)&m_tableForLLDB[2 * v13];
    *(_QWORD *)&m_tableForLLDB[2 * v13] = 0;
    if (v16)
      CFRelease(v16);
    *(_QWORD *)&m_tableForLLDB[2 * v13] = -1;
    ++*((_DWORD *)p_dataTasks->m_impl.var0.m_table - 4);
    m_table = p_dataTasks->m_impl.var0.m_table;
    v18 = p_dataTasks->m_impl.var0.m_table ? *(m_table - 3) - 1 : -1;
    *(m_table - 3) = v18;
    m_tableForLLDB = p_dataTasks->m_impl.var0.m_table;
    if (!p_dataTasks->m_impl.var0.m_table)
      goto LABEL_27;
    v19 = *(m_tableForLLDB - 1);
    if (6 * *(m_tableForLLDB - 3) < v19 && v19 >= 9)
    {
      WTF::HashTable<WTF::RetainPtr<AVContentKeyRequest>,WTF::RetainPtr<AVContentKeyRequest>,WTF::IdentityExtractor,WTF::DefaultHash<WTF::RetainPtr<AVContentKeyRequest>>,WTF::HashTraits<WTF::RetainPtr<AVContentKeyRequest>>,WTF::HashTraits<WTF::RetainPtr<AVContentKeyRequest>>>::rehash((uint64_t *)&self->_dataTasks, v19 >> 1);
      m_tableForLLDB = p_dataTasks->m_impl.var0.m_table;
      if (!p_dataTasks->m_impl.var0.m_table)
        goto LABEL_27;
    }
  }
LABEL_12:
  if (*(m_tableForLLDB - 3))
    v21 = 0;
  else
LABEL_27:
    v21 = -[WebCoreNSURLSession invalidated](self, "invalidated");
  v22 = __ldxr(&p_dataTasksLock->m_byte.value.__a_.__a_value);
  if (v22 == 1)
  {
    if (!__stlxr(0, &p_dataTasksLock->m_byte.value.__a_.__a_value))
    {
      if (!v21)
        return;
      goto LABEL_34;
    }
  }
  else
  {
    __clrex();
  }
  WTF::Lock::unlockSlow((WTF::Lock *)&self->_dataTasksLock);
  if (!v21)
    return;
LABEL_34:
  CFRetain(self);
  v23 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v23 = &off_1E3485CB0;
  v23[1] = self;
  v25 = v23;
  -[WebCoreNSURLSession addDelegateOperation:](self, "addDelegateOperation:", &v25);
  v24 = v25;
  v25 = 0;
  if (v24)
    (*(void (**)(_QWORD *))(*v24 + 8))(v24);
}

- (void)addDelegateOperation:(void *)a3
{
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  const void *v7;
  const void *v8;
  WorkQueue *m_ptr;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;

  v4 = (void *)MEMORY[0x1E0CB34C8];
  v5 = *(_QWORD *)a3;
  *(_QWORD *)a3 = 0;
  v6 = malloc_type_malloc(0x28uLL, 0x10E0040274B6D37uLL);
  *v6 = MEMORY[0x1E0C809A0];
  v6[1] = 50331650;
  v6[2] = WTF::BlockPtr<void ()(void)>::fromCallable<WTF::Function<void ()(void)>>(WTF::Function<void ()(void)>)::{lambda(void *)#1}::__invoke;
  v6[3] = &WTF::BlockPtr<void ()(void)>::fromCallable<WTF::Function<void ()(void)>>(WTF::Function<void ()(void)>)::descriptor;
  v6[4] = v5;
  v7 = (const void *)objc_msgSend(v4, "blockOperationWithBlock:", v6);
  v8 = v7;
  if (v7)
    CFRetain(v7);
  _Block_release(v6);
  m_ptr = self->_internalQueue.m_ptr;
  CFRetain(self);
  v10 = (_QWORD *)WTF::fastMalloc((WTF *)0x18);
  *v10 = &off_1E3485CD8;
  v10[1] = self;
  v10[2] = v8;
  v12 = v10;
  (*(void (**)(WorkQueue *, _QWORD **))(*(_QWORD *)m_ptr + 32))(m_ptr, &v12);
  v11 = v12;
  v12 = 0;
  if (v11)
    (*(void (**)(_QWORD *))(*v11 + 8))(v11);
}

- (void)task:(id)a3 didReceiveCORSAccessCheckResult:(BOOL)a4
{
  uint64_t v5;

  if (!a4)
  {
    v5 = 2;
LABEL_6:
    -[WebCoreNSURLSession setCorsResults:](self, "setCorsResults:", v5);
    return;
  }
  if (-[WebCoreNSURLSession corsResults](self, "corsResults", a3) != 2)
  {
    v5 = 1;
    goto LABEL_6;
  }
}

- (void)task:(id)a3 addSecurityOrigin:(void *)a4
{
  Lock *p_dataTasksLock;
  WTF *v8;
  WTF::StringImpl *v9;
  WTF *v10;
  unsigned int v11;
  unsigned int v12;
  int v13;
  WTF::StringImpl *v14;
  WTF::StringImpl *v15;
  uint64_t v16;
  _BYTE v17[24];
  WTF *v18;

  p_dataTasksLock = &self->_dataTasksLock;
  if (__ldaxr(&self->_dataTasksLock.m_byte.value.__a_.__a_value))
  {
    __clrex();
LABEL_4:
    MEMORY[0x19AEA534C](&self->_dataTasksLock, a2, a3);
    goto LABEL_5;
  }
  if (__stxr(1u, &p_dataTasksLock->m_byte.value.__a_.__a_value))
    goto LABEL_4;
LABEL_5:
  v8 = *(WTF **)a4;
  *(_QWORD *)a4 = 0;
  v18 = v8;
  WTF::HashTable<WTF::RefPtr<WebCore::SecurityOrigin,WTF::RawPtrTraits<WebCore::SecurityOrigin>,WTF::DefaultRefDerefTraits<WebCore::SecurityOrigin>>,WTF::RefPtr<WebCore::SecurityOrigin,WTF::RawPtrTraits<WebCore::SecurityOrigin>,WTF::DefaultRefDerefTraits<WebCore::SecurityOrigin>>,WTF::IdentityExtractor,WTF::DefaultHash<WTF::RefPtr<WebCore::SecurityOrigin,WTF::RawPtrTraits<WebCore::SecurityOrigin>,WTF::DefaultRefDerefTraits<WebCore::SecurityOrigin>>>,WTF::HashTraits<WTF::RefPtr<WebCore::SecurityOrigin,WTF::RawPtrTraits<WebCore::SecurityOrigin>,WTF::DefaultRefDerefTraits<WebCore::SecurityOrigin>>>,WTF::HashTraits<WTF::RefPtr<WebCore::SecurityOrigin,WTF::RawPtrTraits<WebCore::SecurityOrigin>,WTF::DefaultRefDerefTraits<WebCore::SecurityOrigin>>>>::add((uint64_t *)&self->_origins, (uint64_t *)&v18, (uint64_t)v17);
  v10 = v18;
  v18 = 0;
  if (v10)
  {
    do
    {
      v11 = __ldaxr((unsigned int *)v10);
      v12 = v11 - 1;
    }
    while (__stlxr(v12, (unsigned int *)v10));
    if (!v12)
    {
      atomic_store(1u, (unsigned int *)v10);
      v14 = (WTF::StringImpl *)*((_QWORD *)v10 + 6);
      *((_QWORD *)v10 + 6) = 0;
      if (v14)
      {
        if (*(_DWORD *)v14 == 2)
          WTF::StringImpl::destroy(v14, v9);
        else
          *(_DWORD *)v14 -= 2;
      }
      v15 = (WTF::StringImpl *)*((_QWORD *)v10 + 5);
      *((_QWORD *)v10 + 5) = 0;
      if (v15)
      {
        if (*(_DWORD *)v15 == 2)
          WTF::StringImpl::destroy(v15, v9);
        else
          *(_DWORD *)v15 -= 2;
      }
      v16 = *((unsigned int *)v10 + 8);
      if ((_DWORD)v16 != -1)
        ((void (*)(_BYTE *, char *))off_1E3485CF0[v16])(v17, (char *)v10 + 8);
      *((_DWORD *)v10 + 8) = -1;
      WTF::fastFree(v10, v9);
    }
  }
  v13 = __ldxr(&p_dataTasksLock->m_byte.value.__a_.__a_value);
  if (v13 == 1)
  {
    if (!__stlxr(0, &p_dataTasksLock->m_byte.value.__a_.__a_value))
      return;
  }
  else
  {
    __clrex();
  }
  WTF::Lock::unlockSlow((WTF::Lock *)p_dataTasksLock);
}

- (void)rangeResponseGenerator
{
  return self->_rangeResponseGenerator.m_ptr;
}

- (NSURLSessionTaskDelegate)delegate
{
  return (NSURLSessionTaskDelegate *)objc_loadWeak(&self->_delegate.m_weakReference);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak(&self->_delegate.m_weakReference, a3);
}

- (NSOperationQueue)delegateQueue
{
  return (NSOperationQueue *)self->_queue.m_ptr;
}

- (NSURLSessionConfiguration)configuration
{
  return 0;
}

- (NSString)sessionDescription
{
  return (NSString *)self->_sessionDescription.m_ptr;
}

- (void)setSessionDescription:(id)a3
{
  void *v4;
  void *m_ptr;

  v4 = (void *)objc_msgSend(a3, "copy");
  m_ptr = self->_sessionDescription.m_ptr;
  self->_sessionDescription.m_ptr = v4;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (void)loader
{
  return self->_loader.m_ptr;
}

- (BOOL)didPassCORSAccessChecks
{
  return -[WebCoreNSURLSession corsResults](self, "corsResults") == 1;
}

- (BOOL)isCrossOrigin:(const void *)a3
{
  Lock *p_dataTasksLock;
  const WebCore::SecurityOrigin **m_table;
  uint64_t v8;
  const WebCore::SecurityOrigin **v9;
  const WebCore::SecurityOrigin **v10;
  uint64_t v11;
  const WebCore::SecurityOrigin **v12;
  int isSameOriginDomain;
  const WebCore::SecurityOrigin **v14;
  char v15;
  int v16;

  p_dataTasksLock = &self->_dataTasksLock;
  if (__ldaxr(&self->_dataTasksLock.m_byte.value.__a_.__a_value))
  {
    __clrex();
  }
  else if (!__stxr(1u, &p_dataTasksLock->m_byte.value.__a_.__a_value))
  {
    goto LABEL_5;
  }
  MEMORY[0x19AEA534C](&self->_dataTasksLock, a2);
LABEL_5:
  m_table = (const WebCore::SecurityOrigin **)self->_origins.m_impl.var0.m_table;
  if (m_table)
  {
    v8 = *((unsigned int *)m_table - 1);
    v9 = &m_table[v8];
    if (*((_DWORD *)m_table - 3))
    {
      v10 = m_table;
      if ((_DWORD)v8)
      {
        v11 = 8 * v8;
        v10 = m_table;
        while ((unint64_t)*v10 + 1 <= 1)
        {
          ++v10;
          v11 -= 8;
          if (!v11)
          {
            v10 = v9;
            goto LABEL_12;
          }
        }
      }
      goto LABEL_12;
    }
    v10 = &m_table[v8];
  }
  else
  {
    v10 = 0;
    v8 = 0;
  }
  v9 = &m_table[v8];
  if (m_table)
  {
LABEL_12:
    v12 = &m_table[*((unsigned int *)m_table - 1)];
    goto LABEL_17;
  }
  v12 = 0;
LABEL_17:
  if (v12 == v10)
  {
    v15 = 0;
  }
  else
  {
    do
    {
      isSameOriginDomain = WebCore::SecurityOrigin::isSameOriginDomain((WebCore::SecurityOrigin *)a3, *v10);
      if (!isSameOriginDomain)
        break;
      v14 = v10 + 1;
      v10 = v9;
      if (v14 != v9)
      {
        v10 = v14;
        while ((unint64_t)*v10 + 1 <= 1)
        {
          if (++v10 == v9)
          {
            v10 = v9;
            break;
          }
        }
      }
    }
    while (v10 != v12);
    v15 = isSameOriginDomain ^ 1;
  }
  v16 = __ldxr(&p_dataTasksLock->m_byte.value.__a_.__a_value);
  if (v16 == 1)
  {
    if (!__stlxr(0, &p_dataTasksLock->m_byte.value.__a_.__a_value))
      return v15;
  }
  else
  {
    __clrex();
  }
  WTF::Lock::unlockSlow((WTF::Lock *)p_dataTasksLock);
  return v15;
}

- (void)finishTasksAndInvalidate
{
  Lock *p_dataTasksLock;
  unsigned int *m_tableForLLDB;
  _BOOL4 v6;
  int v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;

  -[WebCoreNSURLSession setInvalidated:](self, "setInvalidated:", 1);
  p_dataTasksLock = &self->_dataTasksLock;
  if (__ldaxr(&self->_dataTasksLock.m_byte.value.__a_.__a_value))
  {
    __clrex();
  }
  else if (!__stxr(1u, &p_dataTasksLock->m_byte.value.__a_.__a_value))
  {
    goto LABEL_5;
  }
  MEMORY[0x19AEA534C](&self->_dataTasksLock);
LABEL_5:
  m_tableForLLDB = self->_dataTasks.m_impl.var0.m_tableForLLDB;
  if (m_tableForLLDB)
    v6 = *(m_tableForLLDB - 3) == 0;
  else
    v6 = 1;
  v7 = __ldxr(&p_dataTasksLock->m_byte.value.__a_.__a_value);
  if (v7 == 1)
  {
    if (!__stlxr(0, &p_dataTasksLock->m_byte.value.__a_.__a_value))
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
  WTF::Lock::unlockSlow((WTF::Lock *)&self->_dataTasksLock);
  if (!v6)
    return;
LABEL_14:
  CFRetain(self);
  v8 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v8 = &off_1E3485D10;
  v8[1] = self;
  v10 = v8;
  -[WebCoreNSURLSession addDelegateOperation:](self, "addDelegateOperation:", &v10);
  v9 = v10;
  v10 = 0;
  if (v9)
    (*(void (**)(_QWORD *))(*v9 + 8))(v9);
}

- (void)invalidateAndCancel
{
  Lock *p_dataTasksLock;
  unsigned int *m_tableForLLDB;
  uint64_t v6;
  WTF *v7;
  unsigned int *v8;
  uint64_t v9;
  uint64_t v10;
  const void **m_table;
  unsigned int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  id *v16;
  void *v17;
  const void **v18;
  const void *v19;
  const void **v20;
  unsigned int v21;
  const void *v22;

  p_dataTasksLock = &self->_dataTasksLock;
  if (__ldaxr(&self->_dataTasksLock.m_byte.value.__a_.__a_value))
  {
    __clrex();
LABEL_4:
    MEMORY[0x19AEA534C](&self->_dataTasksLock, a2);
    goto LABEL_5;
  }
  if (__stxr(1u, &p_dataTasksLock->m_byte.value.__a_.__a_value))
    goto LABEL_4;
LABEL_5:
  m_tableForLLDB = self->_dataTasks.m_impl.var0.m_tableForLLDB;
  if (!m_tableForLLDB || (v6 = *(m_tableForLLDB - 3), !(_DWORD)v6))
  {
    v7 = 0;
LABEL_16:
    v12 = 0;
    goto LABEL_17;
  }
  if (v6 >> 29)
  {
    __break(0xC471u);
    return;
  }
  v7 = (WTF *)WTF::fastMalloc((WTF *)(8 * v6));
  v8 = self->_dataTasks.m_impl.var0.m_tableForLLDB;
  if (!v8 || !*(v8 - 3))
    goto LABEL_16;
  v9 = *(v8 - 1);
  if ((_DWORD)v9)
  {
    v10 = 8 * v9;
    m_table = (const void **)self->_dataTasks.m_impl.var0.m_table;
    while ((unint64_t)*m_table + 1 <= 1)
    {
      ++m_table;
      v10 -= 8;
      if (!v10)
        goto LABEL_16;
    }
  }
  else
  {
    m_table = (const void **)self->_dataTasks.m_impl.var0.m_table;
  }
  v20 = (const void **)&v8[2 * v9];
  if (m_table == v20)
    goto LABEL_16;
  v21 = 0;
  v22 = *m_table;
LABEL_36:
  if (v22)
    CFRetain(v22);
  v12 = v21 + 1;
  *((_QWORD *)v7 + v21) = v22;
  while (++m_table != v20)
  {
    v22 = *m_table;
    if ((unint64_t)*m_table + 1 > 1)
    {
      ++v21;
      if (m_table != v20)
        goto LABEL_36;
      break;
    }
  }
LABEL_17:
  v13 = __ldxr(&p_dataTasksLock->m_byte.value.__a_.__a_value);
  if (v13 == 1)
  {
    if (!__stlxr(0, &p_dataTasksLock->m_byte.value.__a_.__a_value))
      goto LABEL_22;
  }
  else
  {
    __clrex();
  }
  WTF::Lock::unlockSlow((WTF::Lock *)p_dataTasksLock);
LABEL_22:
  v14 = 8 * v12;
  if (v12)
  {
    v15 = 8 * v12;
    v16 = (id *)v7;
    do
    {
      objc_msgSend(*v16++, "cancel");
      v15 -= 8;
    }
    while (v15);
  }
  -[WebCoreNSURLSession finishTasksAndInvalidate](self, "finishTasksAndInvalidate");
  if (v12)
  {
    v18 = (const void **)v7;
    do
    {
      v19 = *v18;
      *v18 = 0;
      if (v19)
        CFRelease(v19);
      ++v18;
      v14 -= 8;
    }
    while (v14);
  }
  if (v7)
    WTF::fastFree(v7, v17);
}

- (void)resetWithCompletionHandler:(id)a3
{
  void *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;

  v4 = _Block_copy(a3);
  v5 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v5 = off_1E3485D38;
  v5[1] = v4;
  v7 = v5;
  -[WebCoreNSURLSession addDelegateOperation:](self, "addDelegateOperation:", &v7);
  v6 = v7;
  v7 = 0;
  if (v6)
    (*(void (**)(_QWORD *))(*v6 + 8))(v6);
  _Block_release(0);
}

- (void)flushWithCompletionHandler:(id)a3
{
  void *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;

  v4 = _Block_copy(a3);
  v5 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v5 = off_1E3485D60;
  v5[1] = v4;
  v7 = v5;
  -[WebCoreNSURLSession addDelegateOperation:](self, "addDelegateOperation:", &v7);
  v6 = v7;
  v7 = 0;
  if (v6)
    (*(void (**)(_QWORD *))(*v6 + 8))(v6);
  _Block_release(0);
}

- (void)getTasksWithCompletionHandler:(id)a3
{
  Lock *p_dataTasksLock;
  id v7;
  unsigned int *m_tableForLLDB;
  uint64_t v9;
  void *v10;
  unsigned int *v11;
  uint64_t v12;
  unsigned int *v13;
  unsigned int *v14;
  uint64_t v15;
  unsigned int *v16;
  unsigned int *v17;
  int v18;
  _QWORD *v19;
  _QWORD *v20;
  CFTypeRef v21;
  _QWORD v22[5];
  CFTypeRef cf;
  _QWORD *v24;

  p_dataTasksLock = &self->_dataTasksLock;
  if (__ldaxr(&self->_dataTasksLock.m_byte.value.__a_.__a_value))
  {
    __clrex();
  }
  else if (!__stxr(1u, &p_dataTasksLock->m_byte.value.__a_.__a_value))
  {
    goto LABEL_5;
  }
  MEMORY[0x19AEA534C](&self->_dataTasksLock, a2);
LABEL_5:
  v7 = objc_alloc(MEMORY[0x1E0C99DE8]);
  m_tableForLLDB = self->_dataTasks.m_impl.var0.m_tableForLLDB;
  if (m_tableForLLDB)
    v9 = *(m_tableForLLDB - 3);
  else
    v9 = 0;
  v10 = (void *)objc_msgSend(v7, "initWithCapacity:", v9);
  v11 = self->_dataTasks.m_impl.var0.m_tableForLLDB;
  if (v11)
  {
    v12 = *(v11 - 1);
    v13 = &v11[2 * v12];
    if (*(v11 - 3))
    {
      v14 = self->_dataTasks.m_impl.var0.m_tableForLLDB;
      if ((_DWORD)v12)
      {
        v15 = 8 * v12;
        v14 = self->_dataTasks.m_impl.var0.m_tableForLLDB;
        while ((unint64_t)(*(_QWORD *)v14 + 1) <= 1)
        {
          v14 += 2;
          v15 -= 8;
          if (!v15)
          {
            v14 = v13;
            goto LABEL_15;
          }
        }
      }
      goto LABEL_15;
    }
    v14 = &v11[2 * v12];
  }
  else
  {
    v14 = 0;
    v12 = 0;
  }
  v13 = &v11[2 * v12];
  if (v11)
  {
LABEL_15:
    v16 = &v11[2 * *(v11 - 1)];
    goto LABEL_20;
  }
  v16 = 0;
LABEL_20:
  while (v14 != v16)
  {
    if (*(_QWORD *)v14)
      objc_msgSend(v10, "addObject:");
    v17 = v14 + 2;
    v14 = v13;
    if (v17 != v13)
    {
      v14 = v17;
      while ((unint64_t)(*(_QWORD *)v14 + 1) <= 1)
      {
        v14 += 2;
        if (v14 == v13)
        {
          v14 = v13;
          break;
        }
      }
    }
  }
  v18 = __ldxr(&p_dataTasksLock->m_byte.value.__a_.__a_value);
  if (v18 != 1)
  {
    __clrex();
    goto LABEL_33;
  }
  if (__stlxr(0, &p_dataTasksLock->m_byte.value.__a_.__a_value))
LABEL_33:
    WTF::Lock::unlockSlow((WTF::Lock *)p_dataTasksLock);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3321888768;
  v22[2] = __53__WebCoreNSURLSession_getTasksWithCompletionHandler___block_invoke;
  v22[3] = &unk_1E3485B50;
  v22[4] = a3;
  cf = v10;
  if (v10)
    CFRetain(v10);
  v19 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v19 = off_1E3355EF8;
  v19[1] = v22;
  v24 = v19;
  -[WebCoreNSURLSession addDelegateOperation:](self, "addDelegateOperation:", &v24);
  v20 = v24;
  v24 = 0;
  if (v20)
    (*(void (**)(_QWORD *))(*v20 + 8))(v20);
  v21 = cf;
  cf = 0;
  if (v21)
    CFRelease(v21);
  if (v10)
    CFRelease(v10);
}

uint64_t __53__WebCoreNSURLSession_getTasksWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0, 0);
}

- (void)getAllTasksWithCompletionHandler:(id)a3
{
  Lock *p_dataTasksLock;
  id v7;
  unsigned int *m_tableForLLDB;
  uint64_t v9;
  void *v10;
  unsigned int *v11;
  uint64_t v12;
  unsigned int *v13;
  unsigned int *v14;
  uint64_t v15;
  unsigned int *v16;
  unsigned int *v17;
  int v18;
  _QWORD *v19;
  _QWORD *v20;
  CFTypeRef v21;
  _QWORD v22[5];
  CFTypeRef cf;
  _QWORD *v24;

  p_dataTasksLock = &self->_dataTasksLock;
  if (__ldaxr(&self->_dataTasksLock.m_byte.value.__a_.__a_value))
  {
    __clrex();
  }
  else if (!__stxr(1u, &p_dataTasksLock->m_byte.value.__a_.__a_value))
  {
    goto LABEL_5;
  }
  MEMORY[0x19AEA534C](&self->_dataTasksLock, a2);
LABEL_5:
  v7 = objc_alloc(MEMORY[0x1E0C99DE8]);
  m_tableForLLDB = self->_dataTasks.m_impl.var0.m_tableForLLDB;
  if (m_tableForLLDB)
    v9 = *(m_tableForLLDB - 3);
  else
    v9 = 0;
  v10 = (void *)objc_msgSend(v7, "initWithCapacity:", v9);
  v11 = self->_dataTasks.m_impl.var0.m_tableForLLDB;
  if (v11)
  {
    v12 = *(v11 - 1);
    v13 = &v11[2 * v12];
    if (*(v11 - 3))
    {
      v14 = self->_dataTasks.m_impl.var0.m_tableForLLDB;
      if ((_DWORD)v12)
      {
        v15 = 8 * v12;
        v14 = self->_dataTasks.m_impl.var0.m_tableForLLDB;
        while ((unint64_t)(*(_QWORD *)v14 + 1) <= 1)
        {
          v14 += 2;
          v15 -= 8;
          if (!v15)
          {
            v14 = v13;
            goto LABEL_15;
          }
        }
      }
      goto LABEL_15;
    }
    v14 = &v11[2 * v12];
  }
  else
  {
    v14 = 0;
    v12 = 0;
  }
  v13 = &v11[2 * v12];
  if (v11)
  {
LABEL_15:
    v16 = &v11[2 * *(v11 - 1)];
    goto LABEL_20;
  }
  v16 = 0;
LABEL_20:
  while (v14 != v16)
  {
    if (*(_QWORD *)v14)
      objc_msgSend(v10, "addObject:");
    v17 = v14 + 2;
    v14 = v13;
    if (v17 != v13)
    {
      v14 = v17;
      while ((unint64_t)(*(_QWORD *)v14 + 1) <= 1)
      {
        v14 += 2;
        if (v14 == v13)
        {
          v14 = v13;
          break;
        }
      }
    }
  }
  v18 = __ldxr(&p_dataTasksLock->m_byte.value.__a_.__a_value);
  if (v18 != 1)
  {
    __clrex();
    goto LABEL_33;
  }
  if (__stlxr(0, &p_dataTasksLock->m_byte.value.__a_.__a_value))
LABEL_33:
    WTF::Lock::unlockSlow((WTF::Lock *)p_dataTasksLock);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3321888768;
  v22[2] = __56__WebCoreNSURLSession_getAllTasksWithCompletionHandler___block_invoke;
  v22[3] = &unk_1E3485B50;
  v22[4] = a3;
  cf = v10;
  if (v10)
    CFRetain(v10);
  v19 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v19 = off_1E3355EF8;
  v19[1] = v22;
  v24 = v19;
  -[WebCoreNSURLSession addDelegateOperation:](self, "addDelegateOperation:", &v24);
  v20 = v24;
  v24 = 0;
  if (v20)
    (*(void (**)(_QWORD *))(*v20 + 8))(v20);
  v21 = cf;
  cf = 0;
  if (v21)
    CFRelease(v21);
  if (v10)
    CFRelease(v10);
}

uint64_t __56__WebCoreNSURLSession_getAllTasksWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (id)dataTaskWithRequest:(id)a3
{
  WebCoreNSURLSessionDataTask *v5;
  uint64_t v6;
  Lock *p_dataTasksLock;
  uint64_t v9;
  uint64_t *p_dataTasks;
  void *m_table;
  int v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unsigned int v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  int v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  unint64_t v26;
  unsigned int v27;
  int v28;

  if (-[WebCoreNSURLSession invalidated](self, "invalidated"))
    return 0;
  v5 = [WebCoreNSURLSessionDataTask alloc];
  ++self->_nextTaskIdentifier;
  v6 = -[WebCoreNSURLSessionDataTask initWithSession:identifier:request:targetDispatcher:](v5, "initWithSession:identifier:request:targetDispatcher:", self);
  p_dataTasksLock = &self->_dataTasksLock;
  if (__ldaxr(&self->_dataTasksLock.m_byte.value.__a_.__a_value))
  {
    __clrex();
  }
  else if (!__stxr(1u, &p_dataTasksLock->m_byte.value.__a_.__a_value))
  {
    goto LABEL_7;
  }
  MEMORY[0x19AEA534C](&self->_dataTasksLock);
LABEL_7:
  if (v6)
    CFRetain((CFTypeRef)v6);
  m_table = self->_dataTasks.m_impl.var0.m_table;
  p_dataTasks = (uint64_t *)&self->_dataTasks;
  v9 = (uint64_t)m_table;
  if (m_table
    || (WTF::HashTable<WTF::RetainPtr<AVContentKeyRequest>,WTF::RetainPtr<AVContentKeyRequest>,WTF::IdentityExtractor,WTF::DefaultHash<WTF::RetainPtr<AVContentKeyRequest>>,WTF::HashTraits<WTF::RetainPtr<AVContentKeyRequest>>,WTF::HashTraits<WTF::RetainPtr<AVContentKeyRequest>>>::rehash(p_dataTasks, 8u), (v9 = *p_dataTasks) != 0))
  {
    v12 = *(_DWORD *)(v9 - 8);
  }
  else
  {
    v12 = 0;
  }
  v13 = (~(v6 << 32) + v6) ^ ((unint64_t)(~(v6 << 32) + v6) >> 22);
  v14 = 9 * ((v13 + ~(v13 << 13)) ^ ((v13 + ~(v13 << 13)) >> 8));
  v15 = (v14 ^ (v14 >> 15)) + ~((v14 ^ (v14 >> 15)) << 27);
  v16 = v12 & ((v15 >> 31) ^ v15);
  v17 = (uint64_t *)(v9 + 8 * v16);
  v18 = *v17;
  if (!*v17)
  {
LABEL_20:
    *v17 = v6;
    v21 = *p_dataTasks;
    if (*p_dataTasks)
      v22 = *(_DWORD *)(v21 - 12) + 1;
    else
      v22 = 1;
    *(_DWORD *)(v21 - 12) = v22;
    v23 = *p_dataTasks;
    if (*p_dataTasks)
      v24 = *(_DWORD *)(v23 - 12);
    else
      v24 = 0;
    v25 = (*(_DWORD *)(v23 - 16) + v24);
    v26 = *(unsigned int *)(v23 - 4);
    if (v26 > 0x400)
    {
      if (v26 > 2 * v25)
        goto LABEL_35;
    }
    else
    {
      if (3 * v26 > 4 * v25)
        goto LABEL_35;
      if (!(_DWORD)v26)
      {
        v27 = 8;
        goto LABEL_34;
      }
    }
    v27 = (_DWORD)v26 << (6 * *(_DWORD *)(v23 - 12) >= (2 * v26));
LABEL_34:
    WTF::HashTable<WTF::RetainPtr<AVContentKeyRequest>,WTF::RetainPtr<AVContentKeyRequest>,WTF::IdentityExtractor,WTF::DefaultHash<WTF::RetainPtr<AVContentKeyRequest>>,WTF::HashTraits<WTF::RetainPtr<AVContentKeyRequest>>,WTF::HashTraits<WTF::RetainPtr<AVContentKeyRequest>>>::rehash(p_dataTasks, v27);
    goto LABEL_35;
  }
  v19 = 0;
  v20 = 1;
  while (v18 != v6)
  {
    if (v18 == -1)
      v19 = v17;
    v16 = (v16 + v20) & v12;
    v17 = (uint64_t *)(v9 + 8 * v16);
    v18 = *v17;
    ++v20;
    if (!*v17)
    {
      if (v19)
      {
        *v19 = 0;
        --*(_DWORD *)(*p_dataTasks - 16);
        v17 = v19;
      }
      goto LABEL_20;
    }
  }
  if (v6)
    CFRelease((CFTypeRef)v6);
LABEL_35:
  v28 = __ldxr(&p_dataTasksLock->m_byte.value.__a_.__a_value);
  if (v28 == 1)
  {
    if (!__stlxr(0, &p_dataTasksLock->m_byte.value.__a_.__a_value))
      return (id)(id)CFMakeCollectable((CFTypeRef)v6);
  }
  else
  {
    __clrex();
  }
  WTF::Lock::unlockSlow((WTF::Lock *)p_dataTasksLock);
  return (id)(id)CFMakeCollectable((CFTypeRef)v6);
}

- (id)dataTaskWithURL:(id)a3
{
  return -[WebCoreNSURLSession dataTaskWithRequest:](self, "dataTaskWithRequest:", objc_msgSend(MEMORY[0x1E0C92C80], "requestWithURL:", a3));
}

- (void)sendH2Ping:(id)a3 pongHandler:(id)a4
{
  void *v7;
  _QWORD *v8;
  _QWORD *v9;

  if (self)
    CFRetain(self);
  if (a3)
    CFRetain(a3);
  v7 = _Block_copy(a4);
  v8 = (_QWORD *)WTF::fastMalloc((WTF *)0x28);
  *v8 = off_1E3485D88;
  v8[1] = self;
  v8[2] = self;
  v8[3] = a3;
  v8[4] = v7;
  v9 = v8;
  WTF::callOnMainThread();
  if (v9)
    (*(void (**)(_QWORD *))(*v9 + 8))(v9);
  _Block_release(0);
}

- (id)uploadTaskWithRequest:(id)a3 fromFile:(id)a4
{
  return 0;
}

- (id)uploadTaskWithRequest:(id)a3 fromData:(id)a4
{
  return 0;
}

- (id)uploadTaskWithStreamedRequest:(id)a3
{
  return 0;
}

- (id)downloadTaskWithRequest:(id)a3
{
  return 0;
}

- (id)downloadTaskWithURL:(id)a3
{
  return 0;
}

- (id)downloadTaskWithResumeData:(id)a3
{
  return 0;
}

- (id)streamTaskWithHostName:(id)a3 port:(int64_t)a4
{
  return 0;
}

- (id)streamTaskWithNetService:(id)a3
{
  return 0;
}

- (BOOL)isKindOfClass:(Class)a3
{
  objc_super v6;

  if ((Class)objc_opt_class() == a3)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)WebCoreNSURLSession;
  return -[WebCoreNSURLSession isKindOfClass:](&v6, sel_isKindOfClass_, a3);
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (unsigned)corsResults
{
  return self->_corsResults;
}

- (void)setCorsResults:(unsigned __int8)a3
{
  self->_corsResults = a3;
}

- (void).cxx_destruct
{
  unsigned __int8 **m_ptr;
  WorkQueue *v4;
  _QWORD *m_table;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  WTF::StringImpl *v11;
  WTF::StringImpl *v12;
  uint64_t v13;
  unsigned int *m_tableForLLDB;
  uint64_t v15;
  const void **v16;
  const void *v17;
  void *v18;
  void *v19;
  RefCountedSerialFunctionDispatcher *v20;
  PlatformMediaResourceLoader *v21;
  unsigned int *v22;
  unsigned int v23;
  unsigned int v24;
  _QWORD *v25;
  _QWORD *v26;
  char v27;

  m_ptr = (unsigned __int8 **)self->_rangeResponseGenerator.m_ptr;
  self->_rangeResponseGenerator.m_ptr = 0;
  if (m_ptr)
    WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::RangeResponseGenerator,(WTF::DestructionThread)1>(*m_ptr);
  v4 = self->_internalQueue.m_ptr;
  self->_internalQueue.m_ptr = 0;
  if (v4)
    (*(void (**)(WorkQueue *, SEL))(*(_QWORD *)v4 + 56))(v4, a2);
  m_table = self->_origins.m_impl.var0.m_table;
  if (m_table)
  {
    v6 = *((unsigned int *)m_table - 1);
    if ((_DWORD)v6)
    {
      for (i = 0; i != v6; ++i)
      {
        v8 = m_table[i];
        if (v8 != -1)
        {
          m_table[i] = 0;
          if (v8)
          {
            do
            {
              v9 = __ldaxr((unsigned int *)v8);
              v10 = v9 - 1;
            }
            while (__stlxr(v10, (unsigned int *)v8));
            if (!v10)
            {
              atomic_store(1u, (unsigned int *)v8);
              v11 = *(WTF::StringImpl **)(v8 + 48);
              *(_QWORD *)(v8 + 48) = 0;
              if (v11)
              {
                if (*(_DWORD *)v11 == 2)
                  WTF::StringImpl::destroy(v11, (WTF::StringImpl *)a2);
                else
                  *(_DWORD *)v11 -= 2;
              }
              v12 = *(WTF::StringImpl **)(v8 + 40);
              *(_QWORD *)(v8 + 40) = 0;
              if (v12)
              {
                if (*(_DWORD *)v12 == 2)
                  WTF::StringImpl::destroy(v12, (WTF::StringImpl *)a2);
                else
                  *(_DWORD *)v12 -= 2;
              }
              v13 = *(unsigned int *)(v8 + 32);
              if ((_DWORD)v13 != -1)
                ((void (*)(char *, uint64_t))off_1E3485CF0[v13])(&v27, v8 + 8);
              *(_DWORD *)(v8 + 32) = -1;
              WTF::fastFree((WTF *)v8, (void *)a2);
            }
          }
        }
      }
    }
    WTF::fastFree((WTF *)(m_table - 2), (void *)a2);
  }
  m_tableForLLDB = self->_dataTasks.m_impl.var0.m_tableForLLDB;
  if (m_tableForLLDB)
  {
    v15 = *(m_tableForLLDB - 1);
    if ((_DWORD)v15)
    {
      v16 = (const void **)self->_dataTasks.m_impl.var0.m_table;
      do
      {
        v17 = *v16;
        if (*v16 != (const void *)-1)
        {
          *v16 = 0;
          if (v17)
            CFRelease(v17);
        }
        ++v16;
        --v15;
      }
      while (v15);
    }
    WTF::fastFree((WTF *)(m_tableForLLDB - 4), (void *)a2);
  }
  v18 = self->_sessionDescription.m_ptr;
  self->_sessionDescription.m_ptr = 0;
  if (v18)
    CFRelease(v18);
  v19 = self->_queue.m_ptr;
  self->_queue.m_ptr = 0;
  if (v19)
    CFRelease(v19);
  objc_destroyWeak(&self->_delegate.m_weakReference);
  v20 = self->_targetDispatcher.m_ptr;
  self->_targetDispatcher.m_ptr = 0;
  if (v20)
    (*((void (**)(RefCountedSerialFunctionDispatcher *))v20->var0 + 5))(v20);
  v21 = self->_loader.m_ptr;
  self->_loader.m_ptr = 0;
  if (v21)
  {
    v22 = (unsigned int *)((char *)v21 + 8);
    do
    {
      v23 = __ldaxr(v22);
      v24 = v23 - 1;
    }
    while (__stlxr(v24, v22));
    if (!v24)
    {
      atomic_store(1u, v22);
      v25 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
      *v25 = off_1E32051E8;
      v25[1] = v22;
      v26 = v25;
      WTF::ensureOnMainThread();
      if (v26)
        (*(void (**)(_QWORD *))(*v26 + 8))(v26);
    }
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 11) = 0;
  *((_QWORD *)self + 13) = 0;
  *(_OWORD *)((char *)self + 8) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 33) = 0u;
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 8) = 0;
  return self;
}

- (_QWORD)initWithResourceLoader:(_QWORD *)a1 delegate:delegateQueue:
{
  const void *v2;

  v2 = (const void *)a1[1];
  *a1 = &off_1E3485C60;
  a1[1] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

- (uint64_t)initWithResourceLoader:(WTF *)this delegate:(void *)a2 delegateQueue:
{
  const void *v3;

  v3 = (const void *)*((_QWORD *)this + 1);
  *(_QWORD *)this = &off_1E3485C60;
  *((_QWORD *)this + 1) = 0;
  if (v3)
    CFRelease(v3);
  return WTF::fastFree(this, a2);
}

- (unsigned)initWithResourceLoader:(uint64_t)a1 delegate:delegateQueue:
{
  RefCountedSerialFunctionDispatcher *v2;
  WebCore::RangeResponseGenerator *v3;
  unsigned __int8 *result;
  uint64_t v5;
  unsigned __int8 **v6;

  v2 = *(RefCountedSerialFunctionDispatcher **)(*(_QWORD *)(a1 + 8) + 16);
  v3 = (WebCore::RangeResponseGenerator *)WTF::fastMalloc((WTF *)0x18);
  result = (unsigned __int8 *)WebCore::RangeResponseGenerator::RangeResponseGenerator(v3, v2);
  v5 = *(_QWORD *)(a1 + 8);
  v6 = *(unsigned __int8 ***)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v3;
  if (v6)
    return WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::RangeResponseGenerator,(WTF::DestructionThread)1>(*v6);
  return result;
}

- (_QWORD)dealloc
{
  unsigned __int8 **v3;
  uint64_t v4;
  uint64_t v5;
  const void **v6;
  const void *v7;

  *a1 = &off_1E3485C88;
  v3 = (unsigned __int8 **)a1[2];
  a1[2] = 0;
  if (v3)
    WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::RangeResponseGenerator,(WTF::DestructionThread)1>(*v3);
  v4 = a1[1];
  if (v4)
  {
    v5 = *(unsigned int *)(v4 - 4);
    if ((_DWORD)v5)
    {
      v6 = (const void **)a1[1];
      do
      {
        v7 = *v6;
        if (*v6 != (const void *)-1)
        {
          *v6 = 0;
          if (v7)
            CFRelease(v7);
        }
        ++v6;
        --v5;
      }
      while (v5);
    }
    WTF::fastFree((WTF *)(v4 - 16), a2);
  }
  return a1;
}

- (uint64_t)dealloc
{
  uint64_t v1;
  uint64_t v2;
  id *v3;
  id *v4;
  uint64_t v5;
  id *v6;
  id *v7;

  v1 = *(_QWORD *)(result + 8);
  if (v1)
  {
    v2 = *(unsigned int *)(v1 - 4);
    v3 = (id *)(v1 + 8 * v2);
    if (*(_DWORD *)(v1 - 12))
    {
      v4 = *(id **)(result + 8);
      if ((_DWORD)v2)
      {
        v5 = 8 * v2;
        v4 = *(id **)(result + 8);
        while ((unint64_t)*v4 + 1 <= 1)
        {
          ++v4;
          v5 -= 8;
          if (!v5)
          {
            v4 = v3;
            goto LABEL_8;
          }
        }
      }
      goto LABEL_8;
    }
    v4 = (id *)(v1 + 8 * v2);
  }
  else
  {
    v4 = 0;
    v2 = 0;
  }
  v3 = (id *)(v1 + 8 * v2);
  if (v1)
  {
LABEL_8:
    v6 = (id *)(v1 + 8 * *(unsigned int *)(v1 - 4));
    goto LABEL_13;
  }
  v6 = 0;
LABEL_13:
  while (v4 != v6)
  {
    v7 = v4 + 1;
    result = objc_msgSend(*v4, "setSession:", 0);
    v4 = v3;
    if (v7 != v3)
    {
      v4 = v7;
      while ((unint64_t)*v4 + 1 <= 1)
      {
        if (++v4 == v3)
        {
          v4 = v3;
          break;
        }
      }
    }
  }
  return result;
}

- (_QWORD)taskCompleted:(_QWORD *)a1
{
  const void *v2;

  v2 = (const void *)a1[1];
  *a1 = &off_1E3485CB0;
  a1[1] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

- (uint64_t)taskCompleted:(WTF *)this
{
  const void *v3;

  v3 = (const void *)*((_QWORD *)this + 1);
  *(_QWORD *)this = &off_1E3485CB0;
  *((_QWORD *)this + 1) = 0;
  if (v3)
    CFRelease(v3);
  return WTF::fastFree(this, a2);
}

- (uint64_t)taskCompleted:(uint64_t)a1
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 8), "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "delegate"), "URLSession:didBecomeInvalidWithError:", *(_QWORD *)(a1 + 8), 0);
  return result;
}

- (_QWORD)addDelegateOperation:(_QWORD *)a1
{
  const void *v2;
  const void *v3;

  *a1 = &off_1E3485CD8;
  v2 = (const void *)a1[2];
  a1[2] = 0;
  if (v2)
    CFRelease(v2);
  v3 = (const void *)a1[1];
  a1[1] = 0;
  if (v3)
    CFRelease(v3);
  return a1;
}

- (uint64_t)addDelegateOperation:(WTF *)this
{
  const void *v3;
  const void *v4;

  *(_QWORD *)this = &off_1E3485CD8;
  v3 = (const void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v3)
    CFRelease(v3);
  v4 = (const void *)*((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = 0;
  if (v4)
    CFRelease(v4);
  return WTF::fastFree(this, a2);
}

- (uint64_t)addDelegateOperation:(uint64_t)a1
{
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "delegateQueue"), "addOperation:", *(_QWORD *)(a1 + 16));
  return objc_msgSend(*(id *)(a1 + 16), "waitUntilFinished");
}

- (_QWORD)finishTasksAndInvalidate
{
  const void *v2;

  v2 = (const void *)a1[1];
  *a1 = &off_1E3485D10;
  a1[1] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

- (uint64_t)finishTasksAndInvalidate
{
  void *v2;
  uint64_t result;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 8), "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(v2, "URLSession:didBecomeInvalidWithError:", *(_QWORD *)(a1 + 8), 0);
  return result;
}

- (uint64_t)resetWithCompletionHandler:(uint64_t)a1
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)resetWithCompletionHandler:(const void *)a1
{
  void *v2;

  *a1 = off_1E3485D38;
  _Block_release(a1[1]);
  return WTF::fastFree((WTF *)a1, v2);
}

- (uint64_t)flushWithCompletionHandler:(uint64_t)a1
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (uint64_t)flushWithCompletionHandler:(const void *)a1
{
  void *v2;

  *a1 = off_1E3485D60;
  _Block_release(a1[1]);
  return WTF::fastFree((WTF *)a1, v2);
}

- (uint64_t)sendH2Ping:(uint64_t)a1 pongHandler:
{
  const void *v2;
  const void *v3;

  *(_QWORD *)a1 = off_1E3485D88;
  _Block_release(*(const void **)(a1 + 32));
  v2 = *(const void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = 0;
  if (v2)
    CFRelease(v2);
  v3 = *(const void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = 0;
  if (v3)
    CFRelease(v3);
  return a1;
}

{
  void *v2;
  const void *v3;
  const void *v4;

  *(_QWORD *)a1 = off_1E3485D88;
  _Block_release(*(const void **)(a1 + 32));
  v3 = *(const void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = 0;
  if (v3)
    CFRelease(v3);
  v4 = *(const void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = 0;
  if (v4)
    CFRelease(v4);
  return WTF::fastFree((WTF *)a1, v2);
}

- (void)sendH2Ping:(uint64_t)a1 pongHandler:
{
  id v2;
  const void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  WTF::StringImpl *v10;
  WTF::StringImpl *v11;
  _QWORD *v12;
  WTF::StringImpl *v13[5];

  if (objc_msgSend(*(id *)(a1 + 8), "invalidated"))
  {
    v2 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v3 = (const void *)objc_msgSend(v2, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB32E8], -1, 0);
    (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(0.0);
    if (v3)
      CFRelease(v3);
  }
  else
  {
    v4 = objc_msgSend(*(id *)(a1 + 8), "loader");
    MEMORY[0x19AEA52E0](v13, *(_QWORD *)(a1 + 24));
    v6 = *(_QWORD *)(a1 + 8);
    v5 = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;
    v7 = *(_QWORD *)(a1 + 32);
    *(_QWORD *)(a1 + 32) = 0;
    v8 = (_QWORD *)WTF::fastMalloc((WTF *)0x20);
    *v8 = off_1E3485DB0;
    v8[1] = v6;
    v8[2] = v5;
    v8[3] = v7;
    v12 = v8;
    (*(void (**)(uint64_t, WTF::StringImpl **, _QWORD **))(*(_QWORD *)v4 + 16))(v4, v13, &v12);
    v9 = v12;
    v12 = 0;
    if (v9)
      (*(void (**)(_QWORD *))(*v9 + 8))(v9);
    _Block_release(0);
    v11 = v13[0];
    v13[0] = 0;
    if (v11)
    {
      if (*(_DWORD *)v11 == 2)
        WTF::StringImpl::destroy(v11, v10);
      else
        *(_DWORD *)v11 -= 2;
    }
  }
}

- (uint64_t)sendH2Ping:pongHandler:
{
  const void *v2;

  *(_QWORD *)a1 = off_1E3485DD8;
  v2 = *(const void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = 0;
  if (v2)
    CFRelease(v2);
  _Block_release(*(const void **)(a1 + 8));
  return a1;
}

{
  const void *v2;
  void *v3;

  *(_QWORD *)a1 = off_1E3485DD8;
  v2 = *(const void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = 0;
  if (v2)
    CFRelease(v2);
  _Block_release(*(const void **)(a1 + 8));
  return WTF::fastFree((WTF *)a1, v3);
}

- (void)sendH2Ping:pongHandler:
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;

  v1 = a1[1];
  v2 = a1[2];
  a1[1] = 0;
  a1[2] = 0;
  v3 = a1[3];
  v4 = (_QWORD *)WTF::fastMalloc((WTF *)0x20);
  *v4 = off_1E3485E00;
  v4[1] = v1;
  v4[2] = v2;
  v4[3] = v3;
  v5 = v4;
  WTF::callOnMainThread();
  if (v5)
    (*(void (**)(_QWORD *))(*v5 + 8))(v5);
  _Block_release(0);
}

@end
