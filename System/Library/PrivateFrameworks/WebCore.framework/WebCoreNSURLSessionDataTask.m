@implementation WebCoreNSURLSessionDataTask

- (WebCoreNSURLSessionDataTask)initWithSession:(id)a3 identifier:(unint64_t)a4 request:(id)a5 targetDispatcher:(RefCountedSerialFunctionDispatcher *)a6
{
  double v10;
  RefCountedSerialFunctionDispatcher *m_ptr;
  void *v12;
  void *v13;
  void *v14;

  -[WebCoreNSURLSessionDataTask setTaskIdentifier:](self, "setTaskIdentifier:", a4);
  atomic_store(1uLL, (unint64_t *)&self->_state);
  LODWORD(v10) = *MEMORY[0x1E0C92BC8];
  -[WebCoreNSURLSessionDataTask setPriority:](self, "setPriority:", v10);
  -[WebCoreNSURLSessionDataTask setSession:](self, "setSession:", a3);
  if (a6)
    (*((void (**)(RefCountedSerialFunctionDispatcher *))a6->var0 + 4))(a6);
  m_ptr = self->_targetDispatcher.m_ptr;
  self->_targetDispatcher.m_ptr = a6;
  if (m_ptr)
    (*((void (**)(RefCountedSerialFunctionDispatcher *))m_ptr->var0 + 5))(m_ptr);
  self->_resumeSessionID = 0;
  if (objc_msgSend(a5, "valueForHTTPHeaderField:", CFSTR("User-Agent")))
  {
    v12 = (void *)objc_msgSend(a5, "mutableCopy");
    objc_msgSend(v12, "setValue:forHTTPHeaderField:", 0, CFSTR("User-Agent"));
    a5 = v12;
    if (!v12)
      goto LABEL_10;
  }
  else
  {
    v12 = 0;
    if (!a5)
      goto LABEL_10;
  }
  CFRetain(a5);
LABEL_10:
  v13 = self->_currentRequest.m_ptr;
  self->_currentRequest.m_ptr = a5;
  if (!v13)
  {
    if (!a5)
      goto LABEL_13;
    goto LABEL_12;
  }
  CFRelease(v13);
  a5 = self->_currentRequest.m_ptr;
  if (a5)
LABEL_12:
    CFRetain(a5);
LABEL_13:
  v14 = self->_originalRequest.m_ptr;
  self->_originalRequest.m_ptr = a5;
  if (v14)
  {
    CFRelease(v14);
    if (!v12)
      return self;
LABEL_19:
    CFRelease(v12);
    return self;
  }
  if (v12)
    goto LABEL_19;
  return self;
}

- (void)_cancel
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  int v7;
  WebCoreNSURLSession *v8;
  WebCoreNSURLSession *v9;
  void *v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  int v17;
  uint64_t v18;

  v3 = -[WebCoreNSURLSessionDataTask resource](self, "resource");
  v4 = v3;
  if (v3)
  {
    v5 = v3[1];
    if (__ldaxr((unsigned __int8 *)v5))
    {
      __clrex();
    }
    else if (!__stxr(1u, (unsigned __int8 *)v5))
    {
      goto LABEL_6;
    }
    MEMORY[0x19AEA534C](v5);
LABEL_6:
    ++*(_QWORD *)(v5 + 8);
    v7 = __ldxr((unsigned __int8 *)v5);
    if (v7 == 1)
    {
      if (!__stlxr(0, (unsigned __int8 *)v5))
        goto LABEL_11;
    }
    else
    {
      __clrex();
    }
    WTF::Lock::unlockSlow((WTF::Lock *)v5);
LABEL_11:
    (*(void (**)(_QWORD *))(*v4 + 24))(v4);
  }
  v8 = -[WebCoreNSURLSessionDataTask session](self, "session");
  v9 = v8;
  if (v8)
  {
    CFRetain(v8);
    WebCore::RangeResponseGenerator::removeTask((WebCore::RangeResponseGenerator *)-[WebCoreNSURLSession rangeResponseGenerator](v9, "rangeResponseGenerator"), self);
  }
  -[WebCoreNSURLSessionDataTask setResource:](self, "setResource:", 0);
  if (v9)
    CFRelease(v9);
  if (v4)
  {
    v11 = v4[1];
    if (__ldaxr((unsigned __int8 *)v11))
    {
      __clrex();
    }
    else if (!__stxr(1u, (unsigned __int8 *)v11))
    {
      goto LABEL_21;
    }
    MEMORY[0x19AEA534C](v11);
LABEL_21:
    v13 = *(_QWORD *)(v11 + 8);
    v14 = v13 - 1;
    *(_QWORD *)(v11 + 8) = v13 - 1;
    if (v13 == 1)
    {
      v18 = *(_QWORD *)(v11 + 16);
      v15 = *(_QWORD *)(v11 + 24);
      *(_QWORD *)(v11 + 24) = 0;
      v16 = v18 != 0;
    }
    else
    {
      v15 = 0;
      v16 = 1;
    }
    v17 = __ldxr((unsigned __int8 *)v11);
    if (v17 == 1)
    {
      if (!__stlxr(0, (unsigned __int8 *)v11))
      {
        if (v14)
          return;
LABEL_29:
        if (v15)
          (*(void (**)(uint64_t))(*(_QWORD *)v15 + 16))(v15);
        if (!v16)
          WTF::fastFree((WTF *)v11, v10);
        return;
      }
    }
    else
    {
      __clrex();
    }
    WTF::Lock::unlockSlow((WTF::Lock *)v11);
    if (v14)
      return;
    goto LABEL_29;
  }
}

- (NSURLRequest)originalRequest
{
  return (NSURLRequest *)(id)CFMakeCollectable((CFTypeRef)objc_msgSend(self->_originalRequest.m_ptr, "copy"));
}

- (NSURLRequest)currentRequest
{
  return (NSURLRequest *)(id)CFMakeCollectable((CFTypeRef)objc_msgSend(self->_currentRequest.m_ptr, "copy"));
}

- (NSError)error
{
  return (NSError *)(id)CFMakeCollectable((CFTypeRef)objc_msgSend(self->_error.m_ptr, "copy"));
}

- (NSString)taskDescription
{
  return (NSString *)(id)CFMakeCollectable((CFTypeRef)objc_msgSend(self->_taskDescription.m_ptr, "copy"));
}

- (void)setTaskDescription:(id)a3
{
  void *v4;
  void *m_ptr;

  v4 = (void *)objc_msgSend(a3, "copy");
  m_ptr = self->_taskDescription.m_ptr;
  self->_taskDescription.m_ptr = v4;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (WebCoreNSURLSession)session
{
  id WeakRetained;
  WebCoreNSURLSession *v4;

  objc_sync_enter(self);
  WeakRetained = objc_loadWeakRetained(&self->_session.m_weakReference);
  v4 = (id)CFMakeCollectable(WeakRetained);
  objc_sync_exit(self);
  return v4;
}

- (void)setSession:(id)a3
{
  objc_sync_enter(self);
  objc_storeWeak(&self->_session.m_weakReference, a3);
  objc_sync_exit(self);
}

- (void)resource
{
  return self->_resource.m_ptr;
}

- (void)setResource:(void *)a3
{
  uint64_t v5;
  int v7;
  PlatformMediaResource *m_ptr;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  int v15;
  uint64_t v16;

  if (a3)
  {
    v5 = *((_QWORD *)a3 + 1);
    if (__ldaxr((unsigned __int8 *)v5))
    {
      __clrex();
    }
    else if (!__stxr(1u, (unsigned __int8 *)v5))
    {
      goto LABEL_6;
    }
    MEMORY[0x19AEA534C](v5, a2);
LABEL_6:
    ++*(_QWORD *)(v5 + 8);
    v7 = __ldxr((unsigned __int8 *)v5);
    if (v7 == 1)
    {
      if (!__stlxr(0, (unsigned __int8 *)v5))
        goto LABEL_11;
    }
    else
    {
      __clrex();
    }
    WTF::Lock::unlockSlow((WTF::Lock *)v5);
  }
LABEL_11:
  m_ptr = self->_resource.m_ptr;
  self->_resource.m_ptr = (PlatformMediaResource *)a3;
  if (!m_ptr)
    return;
  v9 = *((_QWORD *)m_ptr + 1);
  if (__ldaxr((unsigned __int8 *)v9))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)v9))
  {
    goto LABEL_16;
  }
  MEMORY[0x19AEA534C](v9, a2);
LABEL_16:
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
LABEL_23:
    WTF::Lock::unlockSlow((WTF::Lock *)v9);
    if (v12)
      return;
    goto LABEL_24;
  }
  if (__stlxr(0, (unsigned __int8 *)v9))
    goto LABEL_23;
  if (v12)
    return;
LABEL_24:
  if (v13)
    (*(void (**)(uint64_t, SEL))(*(_QWORD *)v13 + 16))(v13, a2);
  if (!v14)
    WTF::fastFree((WTF *)v9, (void *)a2);
}

- (NSURLResponse)response
{
  return (NSURLResponse *)self->_response.m_ptr;
}

- (int64_t)state
{
  return atomic_load((unint64_t *)&self->_state);
}

- (void)cancel
{
  RefCountedSerialFunctionDispatcher *m_ptr;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;

  m_ptr = self->_targetDispatcher.m_ptr;
  CFRetain(self);
  v4 = (_QWORD *)WTF::fastMalloc((WTF *)0x18);
  *v4 = &off_1E3485E28;
  v4[1] = self;
  v4[2] = self;
  v6 = v4;
  (*((void (**)(RefCountedSerialFunctionDispatcher *, _QWORD **))m_ptr->var0 + 2))(m_ptr, &v6);
  v5 = v6;
  v6 = 0;
  if (v5)
    (*(void (**)(_QWORD *))(*v5 + 8))(v5);
}

- (void)suspend
{
  RefCountedSerialFunctionDispatcher *m_ptr;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;

  m_ptr = self->_targetDispatcher.m_ptr;
  CFRetain(self);
  v4 = (_QWORD *)WTF::fastMalloc((WTF *)0x18);
  *v4 = &off_1E3485E50;
  v4[1] = self;
  v4[2] = self;
  v6 = v4;
  (*((void (**)(RefCountedSerialFunctionDispatcher *, _QWORD **))m_ptr->var0 + 2))(m_ptr, &v6);
  v5 = v6;
  v6 = 0;
  if (v5)
    (*(void (**)(_QWORD *))(*v5 + 8))(v5);
}

- (void)resume
{
  void *v2;
  void *v3;
  char v4;
  uint64_t v5;
  unsigned int *v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  if (objc_msgSend(*(id *)(a1 + 16), "state") == 1)
  {
    objc_msgSend(*(id *)(a1 + 16), "_cancel");
    v2 = (void *)objc_msgSend(*(id *)(a1 + 16), "session");
    v3 = v2;
    if (v2)
      CFRetain(v2);
    if (objc_msgSend(*(id *)(a1 + 16), "state") == 1)
    {
      if (!v3)
        return;
      atomic_store(0, (unint64_t *)(*(_QWORD *)(a1 + 16) + 96));
      WebCore::RangeResponseGenerator::willHandleRequest((WebCore::RangeResponseGenerator *)objc_msgSend(v3, "rangeResponseGenerator"), *(WebCoreNSURLSessionDataTask **)(a1 + 16), (NSURLRequest *)objc_msgSend(*(id *)(a1 + 16), "originalRequest"));
      if ((v4 & 1) == 0)
      {
        ++*(_DWORD *)(*(_QWORD *)(a1 + 16) + 124);
        v5 = objc_msgSend(v3, "loader");
        v6 = (unsigned int *)(v5 + 8);
        do
          v7 = __ldaxr(v6);
        while (__stlxr(v7 + 1, v6));
        v8 = *(_QWORD *)(a1 + 8);
        v9 = *(_QWORD *)(a1 + 16);
        *(_QWORD *)(a1 + 8) = 0;
        v10 = *(_DWORD *)(v9 + 124);
        v11 = WTF::fastMalloc((WTF *)0x28);
        *(_QWORD *)v11 = &off_1E3485EA0;
        *(_QWORD *)(v11 + 8) = v5;
        *(_QWORD *)(v11 + 16) = v8;
        *(_QWORD *)(v11 + 24) = v9;
        *(_DWORD *)(v11 + 32) = v10;
        v12 = v11;
        WTF::ensureOnMainThread();
        if (v12)
          (*(void (**)(uint64_t))(*(_QWORD *)v12 + 8))(v12);
      }
    }
    else if (!v3)
    {
      return;
    }
    CFRelease(v3);
  }
}

- (void)dealloc
{
  PlatformMediaResource *m_ptr;
  RefCountedSerialFunctionDispatcher *v4;
  _QWORD *v5;
  _QWORD *v6;
  objc_super v7;
  _QWORD *v8;

  m_ptr = self->_resource.m_ptr;
  self->_resource.m_ptr = 0;
  if (m_ptr)
  {
    v4 = self->_targetDispatcher.m_ptr;
    v5 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
    *v5 = &off_1E3485EF0;
    v5[1] = m_ptr;
    v8 = v5;
    (*((void (**)(RefCountedSerialFunctionDispatcher *, _QWORD **))v4->var0 + 2))(v4, &v8);
    v6 = v8;
    v8 = 0;
    if (v6)
      (*(void (**)(_QWORD *))(*v6 + 8))(v6);
  }
  v7.receiver = self;
  v7.super_class = (Class)WebCoreNSURLSessionDataTask;
  -[WebCoreNSURLSessionDataTask dealloc](&v7, sel_dealloc);
}

- (id)_timingData
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (void)resource:(void *)a3 receivedResponse:(const void *)a4 completionHandler:(void *)a5
{
  WebCoreNSURLSession *v9;
  WebCoreNSURLSession *v10;
  WTF::StringImpl *v11;
  WTF *v12;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;
  WTF::StringImpl *v16;
  WTF::StringImpl *v17;
  uint64_t v18;
  WebCoreNSURLSession *v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  RefCountedSerialFunctionDispatcher *m_ptr;
  WTF *v24;
  WTF *v25;
  uint64_t v26;
  WTF *v27;
  char v28;

  v9 = -[WebCoreNSURLSessionDataTask session](self, "session");
  v10 = v9;
  if (v9)
    CFRetain(v9);
  WebCore::ResourceResponse::platformLazyInit((uint64_t)a4, 1);
  WebCore::SecurityOrigin::create((WebCore::SecurityOrigin *)a4, (uint64_t *)&v27);
  -[WebCoreNSURLSession task:addSecurityOrigin:](v10, "task:addSecurityOrigin:", self, &v27);
  v12 = v27;
  v27 = 0;
  if (!v12)
    goto LABEL_6;
  do
  {
    v13 = __ldaxr((unsigned int *)v12);
    v14 = v13 - 1;
  }
  while (__stlxr(v14, (unsigned int *)v12));
  if (!v14)
  {
    atomic_store(1u, (unsigned int *)v12);
    v16 = (WTF::StringImpl *)*((_QWORD *)v12 + 6);
    *((_QWORD *)v12 + 6) = 0;
    if (v16)
    {
      if (*(_DWORD *)v16 == 2)
        WTF::StringImpl::destroy(v16, v11);
      else
        *(_DWORD *)v16 -= 2;
    }
    v17 = (WTF::StringImpl *)*((_QWORD *)v12 + 5);
    *((_QWORD *)v12 + 5) = 0;
    if (v17)
    {
      if (*(_DWORD *)v17 == 2)
        WTF::StringImpl::destroy(v17, v11);
      else
        *(_DWORD *)v17 -= 2;
    }
    v18 = *((unsigned int *)v12 + 8);
    if ((_DWORD)v18 != -1)
      ((void (*)(char *, char *))off_1E3485CF0[v18])(&v28, (char *)v12 + 8);
    *((_DWORD *)v12 + 8) = -1;
    WTF::fastFree(v12, v11);
    if (a3)
      goto LABEL_7;
  }
  else
  {
LABEL_6:
    if (a3)
    {
LABEL_7:
      v15 = (**(uint64_t (***)(void *))a3)(a3);
      goto LABEL_18;
    }
  }
  v15 = 1;
LABEL_18:
  -[WebCoreNSURLSession task:didReceiveCORSAccessCheckResult:](v10, "task:didReceiveCORSAccessCheckResult:", self, v15, v27);
  WebCore::ResourceResponse::platformLazyInit((uint64_t)a4, 1);
  -[WebCoreNSURLSessionDataTask setCountOfBytesExpectedToReceive:](self, "setCountOfBytesExpectedToReceive:", *((_QWORD *)a4 + 6));
  v19 = (WebCoreNSURLSession *)*((_QWORD *)a4 + 30);
  if (v19)
    goto LABEL_26;
  if ((*((_BYTE *)a4 + 138) & 1) == 0)
  {
    WebCore::ResourceResponse::initNSURLResponse((WebCore::ResourceResponse *)a4);
    v19 = (WebCoreNSURLSession *)*((_QWORD *)a4 + 30);
    if (!v19)
      goto LABEL_21;
LABEL_26:
    CFRetain(v19);
    v20 = 0;
    if (!a3)
      goto LABEL_27;
    goto LABEL_22;
  }
  v19 = 0;
LABEL_21:
  v20 = 1;
  if (!a3)
    goto LABEL_27;
LABEL_22:
  if (v10
    && WebCore::RangeResponseGenerator::willSynthesizeRangeResponses((WebCore::RangeResponseGenerator *)-[WebCoreNSURLSession rangeResponseGenerator](v10, "rangeResponseGenerator"), self, (unint64_t)a3, (const WebCore::ResourceResponse *)a4))
  {
    -[WebCoreNSURLSessionDataTask setResource:](self, "setResource:", 0);
    v21 = *(_QWORD *)a5;
    *(_QWORD *)a5 = 0;
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v21 + 16))(v21, 1);
    (*(void (**)(uint64_t))(*(_QWORD *)v21 + 8))(v21);
    if ((v20 & 1) != 0)
    {
LABEL_38:
      v19 = v10;
LABEL_39:
      CFRelease(v19);
      return;
    }
LABEL_25:
    CFRelease(v19);
    goto LABEL_38;
  }
LABEL_27:
  if (self)
  {
    CFRetain(self);
    if (v10)
    {
      CFRetain(self);
      goto LABEL_31;
    }
  }
  else if (v10)
  {
LABEL_31:
    if ((v20 & 1) == 0)
      CFRetain(v19);
    v22 = *(_QWORD *)a5;
    *(_QWORD *)a5 = 0;
    m_ptr = self->_targetDispatcher.m_ptr;
    if (m_ptr)
      (*((void (**)(RefCountedSerialFunctionDispatcher *))m_ptr->var0 + 4))(self->_targetDispatcher.m_ptr);
    v24 = (WTF *)WTF::fastMalloc((WTF *)0x28);
    *(_QWORD *)v24 = &off_1E3485F18;
    *((_QWORD *)v24 + 1) = self;
    *((_QWORD *)v24 + 2) = v19;
    *((_QWORD *)v24 + 3) = v22;
    *((_QWORD *)v24 + 4) = m_ptr;
    v27 = v24;
    -[WebCoreNSURLSession addDelegateOperation:](v10, "addDelegateOperation:", &v27);
    v25 = v27;
    v27 = 0;
    if (v25)
      (*(void (**)(WTF *))(*(_QWORD *)v25 + 8))(v25);
    CFRelease(self);
    if ((v20 & 1) != 0)
      goto LABEL_38;
    goto LABEL_25;
  }
  v26 = *(_QWORD *)a5;
  *(_QWORD *)a5 = 0;
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)v26 + 16))(v26, 0);
  (*(void (**)(uint64_t))(*(_QWORD *)v26 + 8))(v26);
  if (self)
    CFRelease(self);
  if ((v20 & 1) == 0)
    goto LABEL_39;
}

- (BOOL)resource:(void *)a3 shouldCacheResponse:(const void *)a4
{
  WTF::StringImpl *v4;
  WTF::StringImpl *v5;
  BOOL v6;
  int v7;
  WTF::StringImpl *v9;

  WebCore::ResourceResponseBase::httpHeaderField((uint64_t)a4, 23, &v9);
  v5 = v9;
  if (!v9)
    return 1;
  v7 = *(_DWORD *)v9;
  v6 = *((_DWORD *)v9 + 1) == 0;
  v9 = 0;
  if (v7 == 2)
    WTF::StringImpl::destroy(v5, v4);
  else
    *(_DWORD *)v5 = v7 - 2;
  return v6;
}

- (void)resource:(void *)a3 receivedData:(void *)a4
{
  WebCoreNSURLSession *v6;
  WebCoreNSURLSession *v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;

  v6 = -[WebCoreNSURLSessionDataTask session](self, "session", a3);
  v7 = v6;
  if (v6)
    CFRetain(v6);
  if (self)
    CFRetain(self);
  v8 = *(_QWORD *)a4;
  *(_QWORD *)a4 = 0;
  v9 = (_QWORD *)WTF::fastMalloc((WTF *)0x18);
  *v9 = &off_1E3485FB0;
  v9[1] = self;
  v9[2] = v8;
  v11 = v9;
  -[WebCoreNSURLSession addDelegateOperation:](v7, "addDelegateOperation:", &v11);
  v10 = v11;
  v11 = 0;
  if (v10)
    (*(void (**)(_QWORD *))(*v10 + 8))(v10);
  if (v7)
    CFRelease(v7);
}

- (void)resource:(void *)a3 receivedRedirect:(const void *)a4 request:(void *)a5 completionHandler:(void *)a6
{
  WebCoreNSURLSession *v10;
  WebCoreNSURLSession *v11;
  WTF::StringImpl *v12;
  unsigned int *v13;
  unsigned int v14;
  unsigned int v15;
  const void *v16;
  uint64_t v17;
  RefCountedSerialFunctionDispatcher *m_ptr;
  uint64_t v19;
  CFTypeRef v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  RefCountedSerialFunctionDispatcher *v33;
  void *v34;
  uint64_t v35;
  RefCountedSerialFunctionDispatcher *v36;
  uint64_t v37;
  CFTypeRef v38;
  CFTypeRef v39;
  WTF::StringImpl *v40;
  WTF::StringImpl *v41;
  uint64_t v42;
  CFTypeRef cf[2];
  uint64_t v44;
  int v45;
  __int128 v46;
  uint64_t v47;
  int v48;
  uint64_t v49;
  int v50;
  __int128 v51;
  uint64_t v52;
  int v53;
  uint64_t v54;
  __int128 v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  int v61;
  char v62;
  __int128 v63;
  uint64_t v64;
  uint64_t v65;
  char v66;
  __int128 v67;
  RefCountedSerialFunctionDispatcher *v68;
  uint64_t v69;

  v10 = -[WebCoreNSURLSessionDataTask session](self, "session", a3);
  v11 = v10;
  if (v10)
    CFRetain(v10);
  WebCore::ResourceResponse::platformLazyInit((uint64_t)a4, 1);
  WebCore::SecurityOrigin::create((WebCore::SecurityOrigin *)a4, (uint64_t *)cf);
  -[WebCoreNSURLSession task:addSecurityOrigin:](v11, "task:addSecurityOrigin:", self, cf);
  v13 = (unsigned int *)cf[0];
  cf[0] = 0;
  if (v13)
  {
    do
    {
      v14 = __ldaxr(v13);
      v15 = v14 - 1;
    }
    while (__stlxr(v15, v13));
    if (!v15)
    {
      atomic_store(1u, v13);
      v40 = (WTF::StringImpl *)*((_QWORD *)v13 + 6);
      *((_QWORD *)v13 + 6) = 0;
      if (v40)
      {
        if (*(_DWORD *)v40 == 2)
          WTF::StringImpl::destroy(v40, v12);
        else
          *(_DWORD *)v40 -= 2;
      }
      v41 = (WTF::StringImpl *)*((_QWORD *)v13 + 5);
      *((_QWORD *)v13 + 5) = 0;
      if (v41)
      {
        if (*(_DWORD *)v41 == 2)
          WTF::StringImpl::destroy(v41, v12);
        else
          *(_DWORD *)v41 -= 2;
      }
      v42 = v13[8];
      if ((_DWORD)v42 != -1)
        ((void (*)(uint64_t *, unsigned int *))off_1E3485CF0[v42])(&v69, v13 + 2);
      v13[8] = -1;
      WTF::fastFree((WTF *)v13, v12);
    }
  }
  cf[0] = self;
  if (self)
    CFRetain(self);
  v16 = (const void *)*((_QWORD *)a4 + 30);
  if (v16)
  {
    cf[1] = *((CFTypeRef *)a4 + 30);
LABEL_27:
    CFRetain(v16);
    goto LABEL_11;
  }
  if ((*((_BYTE *)a4 + 138) & 1) == 0)
  {
    WebCore::ResourceResponse::initNSURLResponse((WebCore::ResourceResponse *)a4);
    v16 = (const void *)*((_QWORD *)a4 + 30);
    cf[1] = v16;
    if (!v16)
      goto LABEL_11;
    goto LABEL_27;
  }
  cf[1] = 0;
LABEL_11:
  WebCore::ResourceRequestBase::isolatedCopy((WebCore::ResourceRequestBase *)a5, (uint64_t)&v44);
  v17 = *(_QWORD *)a6;
  *(_QWORD *)a6 = 0;
  *((_QWORD *)&v67 + 1) = v17;
  m_ptr = self->_targetDispatcher.m_ptr;
  if (m_ptr)
    (*((void (**)(RefCountedSerialFunctionDispatcher *))m_ptr->var0 + 4))(self->_targetDispatcher.m_ptr);
  v68 = m_ptr;
  v19 = WTF::fastMalloc((WTF *)0xF0);
  *(_QWORD *)v19 = off_1E3485FD8;
  *(CFTypeRef *)(v19 + 8) = cf[0];
  v20 = cf[1];
  *(_OWORD *)cf = 0u;
  *(_QWORD *)(v19 + 16) = v20;
  v21 = v44;
  v44 = 0;
  *(_QWORD *)(v19 + 24) = v21;
  LODWORD(v21) = v45;
  *(_DWORD *)(v19 + 32) = v45;
  *(_OWORD *)(v19 + 36) = v46;
  *(_QWORD *)(v19 + 52) = v47;
  *(_DWORD *)(v19 + 60) = v48;
  v45 = v21 & 0xFFFFFFFE;
  v22 = v49;
  v49 = 0;
  *(_QWORD *)(v19 + 64) = v22;
  LODWORD(v22) = v50;
  *(_DWORD *)(v19 + 72) = v50;
  *(_OWORD *)(v19 + 76) = v51;
  *(_QWORD *)(v19 + 92) = v52;
  *(_DWORD *)(v19 + 100) = v53;
  v50 = v22 & 0xFFFFFFFE;
  *(_QWORD *)(v19 + 104) = v54;
  *(_QWORD *)(v19 + 112) = v55;
  v23 = *((_QWORD *)&v55 + 1);
  v55 = 0u;
  *(_QWORD *)(v19 + 120) = v23;
  v24 = v56;
  v56 = 0;
  *(_QWORD *)(v19 + 128) = v24;
  v25 = v57;
  v57 = 0;
  *(_QWORD *)(v19 + 136) = v25;
  v26 = v58;
  v58 = 0;
  *(_QWORD *)(v19 + 144) = v26;
  v27 = v59;
  v59 = 0;
  *(_QWORD *)(v19 + 152) = v27;
  v28 = v60;
  v60 = 0;
  *(_QWORD *)(v19 + 160) = v28;
  LODWORD(v27) = v61;
  *(_BYTE *)(v19 + 172) = v62;
  *(_DWORD *)(v19 + 168) = v27;
  *(_QWORD *)(v19 + 176) = v63;
  v29 = *((_QWORD *)&v63 + 1);
  v63 = 0u;
  *(_QWORD *)(v19 + 184) = v29;
  v30 = v64;
  v64 = 0;
  *(_QWORD *)(v19 + 192) = v30;
  v31 = v65;
  *(_BYTE *)(v19 + 208) = v66;
  *(_QWORD *)(v19 + 200) = v31;
  *(_QWORD *)(v19 + 216) = v67;
  v32 = *((_QWORD *)&v67 + 1);
  v67 = 0u;
  *(_QWORD *)(v19 + 224) = v32;
  v33 = v68;
  v68 = 0;
  *(_QWORD *)(v19 + 232) = v33;
  v69 = v19;
  -[WebCoreNSURLSession addDelegateOperation:](v11, "addDelegateOperation:", &v69);
  v35 = v69;
  v69 = 0;
  if (v35)
    (*(void (**)(uint64_t))(*(_QWORD *)v35 + 8))(v35);
  v36 = v68;
  v68 = 0;
  if (v36)
    (*((void (**)(RefCountedSerialFunctionDispatcher *))v36->var0 + 5))(v36);
  v37 = *((_QWORD *)&v67 + 1);
  *((_QWORD *)&v67 + 1) = 0;
  if (v37)
    (*(void (**)(uint64_t))(*(_QWORD *)v37 + 8))(v37);
  WebCore::ResourceRequest::~ResourceRequest((WebCore::ResourceRequest *)&v44, v34);
  v38 = cf[1];
  cf[1] = 0;
  if (v38)
    CFRelease(v38);
  v39 = cf[0];
  cf[0] = 0;
  if (v39)
    CFRelease(v39);
  if (v11)
    CFRelease(v11);
}

- (void)_resource:(void *)a3 loadFinishedWithError:(id)a4 metrics:(const void *)a5
{
  WebCoreNSURLSession *v8;
  WebCoreNSURLSession *v9;
  WebCoreNSURLSessionTaskMetrics *v10;
  __int128 v11;
  __int128 v12;
  WebCore::AdditionalNetworkLoadMetricsForWebInspector *v13;
  WTF::StringImpl *v14;
  uint64_t v15;
  _DWORD *v16;
  WTF::StringImpl *v17;
  RefCountedSerialFunctionDispatcher *m_ptr;
  _QWORD *v19;
  uint64_t v20;
  _OWORD v21[5];
  uint64_t v22;
  WTF::StringImpl *v23;
  int v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;

  if (-[WebCoreNSURLSessionDataTask state](self, "state", a3) != 3)
  {
    atomic_store(3uLL, (unint64_t *)&self->_state);
    CFRetain(self);
    v8 = -[WebCoreNSURLSessionDataTask session](self, "session");
    v9 = v8;
    if (v8)
      CFRetain(v8);
    if (a4)
      CFRetain(a4);
    v10 = [WebCoreNSURLSessionTaskMetrics alloc];
    v26 = 0;
    v11 = *((_OWORD *)a5 + 1);
    v21[0] = *(_OWORD *)a5;
    v21[1] = v11;
    v12 = *((_OWORD *)a5 + 3);
    v21[2] = *((_OWORD *)a5 + 2);
    v21[3] = v12;
    v21[4] = *((_OWORD *)a5 + 4);
    v22 = *((_QWORD *)a5 + 10);
    WTF::String::isolatedCopy();
    v24 = *((_DWORD *)a5 + 24);
    v25 = *(_OWORD *)((char *)a5 + 104);
    v13 = (WebCore::AdditionalNetworkLoadMetricsForWebInspector *)*((_QWORD *)a5 + 15);
    if (v13)
    {
      WebCore::AdditionalNetworkLoadMetricsForWebInspector::isolatedCopy(v13, &v27);
      v26 = v27;
    }
    v15 = -[WebCoreNSURLSessionTaskMetrics _initWithMetrics:onTarget:](v10, "_initWithMetrics:onTarget:", v21, self->_targetDispatcher.m_ptr);
    v16 = (_DWORD *)v26;
    v26 = 0;
    if (v16)
      WTF::RefCounted<WebCore::AdditionalNetworkLoadMetricsForWebInspector>::deref(v16, v14);
    v17 = v23;
    v23 = 0;
    if (v17)
    {
      if (*(_DWORD *)v17 == 2)
        WTF::StringImpl::destroy(v17, v14);
      else
        *(_DWORD *)v17 -= 2;
    }
    CFRetain(self);
    if (v9)
      CFRetain(v9);
    if (a4)
      CFRetain(a4);
    m_ptr = self->_targetDispatcher.m_ptr;
    if (m_ptr)
      (*((void (**)(RefCountedSerialFunctionDispatcher *))m_ptr->var0 + 4))(self->_targetDispatcher.m_ptr);
    v19 = (_QWORD *)WTF::fastMalloc((WTF *)0x30);
    *v19 = &off_1E3486098;
    v19[1] = self;
    v19[2] = v9;
    v19[3] = a4;
    v19[4] = v15;
    v19[5] = m_ptr;
    *(_QWORD *)&v21[0] = v19;
    -[WebCoreNSURLSession addDelegateOperation:](v9, "addDelegateOperation:", v21);
    v20 = *(_QWORD *)&v21[0];
    *(_QWORD *)&v21[0] = 0;
    if (v20)
      (*(void (**)(uint64_t))(*(_QWORD *)v20 + 8))(v20);
    if (a4)
    {
      CFRelease(a4);
      if (!v9)
        goto LABEL_24;
    }
    else if (!v9)
    {
LABEL_24:
      CFRelease(self);
      return;
    }
    CFRelease(v9);
    goto LABEL_24;
  }
}

- (void)resource:(void *)a3 accessControlCheckFailedWithError:(const void *)a4
{
  WTF::StringImpl *v4;
  _DWORD *v5;
  WTF::StringImpl *v6;
  _OWORD v7[5];
  WTF::StringImpl *v8[2];
  int v9;
  uint64_t v10;
  uint64_t v11;
  _DWORD *v12;

  v9 = 0;
  *(_OWORD *)v8 = 0u;
  memset(v7, 0, sizeof(v7));
  v10 = -1;
  v11 = -1;
  v12 = 0;
  -[WebCoreNSURLSessionDataTask _resource:loadFinishedWithError:metrics:](self, "_resource:loadFinishedWithError:metrics:", a3, WebCore::ResourceError::nsError((WebCore::ResourceError *)a4), v7);
  v5 = v12;
  v12 = 0;
  if (v5)
    WTF::RefCounted<WebCore::AdditionalNetworkLoadMetricsForWebInspector>::deref(v5, v4);
  v6 = v8[1];
  v8[1] = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2)
      WTF::StringImpl::destroy(v6, v4);
    else
      *(_DWORD *)v6 -= 2;
  }
}

- (void)resource:(void *)a3 loadFailedWithError:(const void *)a4
{
  WTF::StringImpl *v4;
  _DWORD *v5;
  WTF::StringImpl *v6;
  _OWORD v7[5];
  WTF::StringImpl *v8[2];
  int v9;
  uint64_t v10;
  uint64_t v11;
  _DWORD *v12;

  v9 = 0;
  *(_OWORD *)v8 = 0u;
  memset(v7, 0, sizeof(v7));
  v10 = -1;
  v11 = -1;
  v12 = 0;
  -[WebCoreNSURLSessionDataTask _resource:loadFinishedWithError:metrics:](self, "_resource:loadFinishedWithError:metrics:", a3, WebCore::ResourceError::nsError((WebCore::ResourceError *)a4), v7);
  v5 = v12;
  v12 = 0;
  if (v5)
    WTF::RefCounted<WebCore::AdditionalNetworkLoadMetricsForWebInspector>::deref(v5, v4);
  v6 = v8[1];
  v8[1] = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2)
      WTF::StringImpl::destroy(v6, v4);
    else
      *(_DWORD *)v6 -= 2;
  }
}

- (void)resourceFinished:(void *)a3 metrics:(const void *)a4
{
  -[WebCoreNSURLSessionDataTask _resource:loadFinishedWithError:metrics:](self, "_resource:loadFinishedWithError:metrics:", a3, 0, a4);
}

- (unint64_t)taskIdentifier
{
  return self->_taskIdentifier;
}

- (void)setTaskIdentifier:(unint64_t)a3
{
  self->_taskIdentifier = a3;
}

- (int64_t)countOfBytesReceived
{
  return self->_countOfBytesReceived;
}

- (void)setCountOfBytesReceived:(int64_t)a3
{
  self->_countOfBytesReceived = a3;
}

- (int64_t)countOfBytesSent
{
  return self->_countOfBytesSent;
}

- (void)setCountOfBytesSent:(int64_t)a3
{
  self->_countOfBytesSent = a3;
}

- (int64_t)countOfBytesExpectedToSend
{
  return self->_countOfBytesExpectedToSend;
}

- (void)setCountOfBytesExpectedToSend:(int64_t)a3
{
  self->_countOfBytesExpectedToSend = a3;
}

- (int64_t)countOfBytesExpectedToReceive
{
  return self->_countOfBytesExpectedToReceive;
}

- (void)setCountOfBytesExpectedToReceive:(int64_t)a3
{
  self->_countOfBytesExpectedToReceive = a3;
}

- (float)priority
{
  return self->_priority;
}

- (void)setPriority:(float)a3
{
  self->_priority = a3;
}

- (void).cxx_destruct
{
  void *m_ptr;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PlatformMediaResource *v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  int v15;
  RefCountedSerialFunctionDispatcher *v16;
  uint64_t v17;

  m_ptr = self->_taskDescription.m_ptr;
  self->_taskDescription.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v4 = self->_error.m_ptr;
  self->_error.m_ptr = 0;
  if (v4)
    CFRelease(v4);
  v5 = self->_currentRequest.m_ptr;
  self->_currentRequest.m_ptr = 0;
  if (v5)
    CFRelease(v5);
  v6 = self->_originalRequest.m_ptr;
  self->_originalRequest.m_ptr = 0;
  if (v6)
    CFRelease(v6);
  v7 = self->_response.m_ptr;
  self->_response.m_ptr = 0;
  if (v7)
    CFRelease(v7);
  v8 = self->_resource.m_ptr;
  self->_resource.m_ptr = 0;
  if (v8)
  {
    v9 = *((_QWORD *)v8 + 1);
    if (__ldaxr((unsigned __int8 *)v9))
    {
      __clrex();
    }
    else if (!__stxr(1u, (unsigned __int8 *)v9))
    {
      goto LABEL_16;
    }
    MEMORY[0x19AEA534C](v9, a2);
LABEL_16:
    v11 = *(_QWORD *)(v9 + 8);
    v12 = v11 - 1;
    *(_QWORD *)(v9 + 8) = v11 - 1;
    if (v11 == 1)
    {
      v17 = *(_QWORD *)(v9 + 16);
      v13 = *(_QWORD *)(v9 + 24);
      *(_QWORD *)(v9 + 24) = 0;
      v14 = v17 != 0;
    }
    else
    {
      v13 = 0;
      v14 = 1;
    }
    v15 = __ldxr((unsigned __int8 *)v9);
    if (v15 == 1)
    {
      if (!__stlxr(0, (unsigned __int8 *)v9))
      {
        if (v12)
          goto LABEL_28;
LABEL_24:
        if (v13)
          (*(void (**)(uint64_t, SEL))(*(_QWORD *)v13 + 16))(v13, a2);
        if (!v14)
          WTF::fastFree((WTF *)v9, (void *)a2);
        goto LABEL_28;
      }
    }
    else
    {
      __clrex();
    }
    WTF::Lock::unlockSlow((WTF::Lock *)v9);
    if (v12)
      goto LABEL_28;
    goto LABEL_24;
  }
LABEL_28:
  v16 = self->_targetDispatcher.m_ptr;
  self->_targetDispatcher.m_ptr = 0;
  if (v16)
    (*((void (**)(RefCountedSerialFunctionDispatcher *, SEL))v16->var0 + 5))(v16, a2);
  objc_destroyWeak(&self->_session.m_weakReference);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 13) = 0;
  *((_QWORD *)self + 14) = 0;
  *((_QWORD *)self + 12) = 0;
  return self;
}

- (_QWORD)cancel
{
  const void *v2;

  v2 = (const void *)a1[1];
  *a1 = &off_1E3485E28;
  a1[1] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

- (uint64_t)cancel
{
  const void *v3;

  v3 = (const void *)*((_QWORD *)this + 1);
  *(_QWORD *)this = &off_1E3485E28;
  *((_QWORD *)this + 1) = 0;
  if (v3)
    CFRelease(v3);
  return WTF::fastFree(this, a2);
}

- (WTF::StringImpl)cancel
{
  WTF::StringImpl *result;
  void *v3;
  uint64_t v4;
  WTF::StringImpl *v5;
  _DWORD *v6;
  _OWORD v7[5];
  WTF::StringImpl *v8[2];
  int v9;
  uint64_t v10;
  uint64_t v11;
  _DWORD *v12;

  result = (WTF::StringImpl *)objc_msgSend(*(id *)(a1 + 16), "state");
  if (result != (WTF::StringImpl *)3)
  {
    atomic_store(2uLL, (unint64_t *)(*(_QWORD *)(a1 + 16) + 96));
    objc_msgSend(*(id *)(a1 + 16), "_cancel");
    v3 = *(void **)(a1 + 16);
    v4 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB32E8], -999, 0);
    v9 = 0;
    *(_OWORD *)v8 = 0u;
    memset(v7, 0, sizeof(v7));
    v10 = -1;
    v11 = -1;
    v12 = 0;
    objc_msgSend(v3, "_resource:loadFinishedWithError:metrics:", 0, v4, v7);
    v6 = v12;
    v12 = 0;
    if (v6)
      WTF::RefCounted<WebCore::AdditionalNetworkLoadMetricsForWebInspector>::deref(v6, v5);
    result = v8[1];
    v8[1] = 0;
    if (result)
    {
      if (*(_DWORD *)result == 2)
        return (WTF::StringImpl *)WTF::StringImpl::destroy(result, v5);
      else
        *(_DWORD *)result -= 2;
    }
  }
  return result;
}

- (_QWORD)suspend
{
  const void *v2;

  v2 = (const void *)a1[1];
  *a1 = &off_1E3485E50;
  a1[1] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

- (uint64_t)suspend
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 16), "state");
  if (!result)
  {
    atomic_store(1uLL, (unint64_t *)(*(_QWORD *)(a1 + 16) + 96));
    return objc_msgSend(*(id *)(a1 + 16), "_cancel");
  }
  return result;
}

- (_QWORD)resume
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  int v10;
  const void *v11;
  uint64_t v13;

  *a1 = &off_1E3485EC8;
  v3 = a1[3];
  a1[3] = 0;
  if (!v3)
    goto LABEL_18;
  v4 = *(_QWORD *)(v3 + 8);
  if (__ldaxr((unsigned __int8 *)v4))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)v4))
  {
    goto LABEL_6;
  }
  MEMORY[0x19AEA534C](v4);
LABEL_6:
  v6 = *(_QWORD *)(v4 + 8);
  v7 = v6 - 1;
  *(_QWORD *)(v4 + 8) = v6 - 1;
  if (v6 == 1)
  {
    v13 = *(_QWORD *)(v4 + 16);
    v8 = *(_QWORD *)(v4 + 24);
    *(_QWORD *)(v4 + 24) = 0;
    v9 = v13 != 0;
  }
  else
  {
    v8 = 0;
    v9 = 1;
  }
  v10 = __ldxr((unsigned __int8 *)v4);
  if (v10 != 1)
  {
    __clrex();
LABEL_13:
    WTF::Lock::unlockSlow((WTF::Lock *)v4);
    if (v7)
      goto LABEL_18;
    goto LABEL_14;
  }
  if (__stlxr(0, (unsigned __int8 *)v4))
    goto LABEL_13;
  if (v7)
    goto LABEL_18;
LABEL_14:
  if (v8)
    (*(void (**)(uint64_t))(*(_QWORD *)v8 + 16))(v8);
  if (!v9)
    WTF::fastFree((WTF *)v4, a2);
LABEL_18:
  v11 = (const void *)a1[1];
  a1[1] = 0;
  if (v11)
    CFRelease(v11);
  return a1;
}

- (uint64_t)resume
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  int v10;
  const void *v11;
  uint64_t v13;

  *(_QWORD *)this = &off_1E3485EC8;
  v3 = *((_QWORD *)this + 3);
  *((_QWORD *)this + 3) = 0;
  if (!v3)
    goto LABEL_18;
  v4 = *(_QWORD *)(v3 + 8);
  if (__ldaxr((unsigned __int8 *)v4))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)v4))
  {
    goto LABEL_6;
  }
  MEMORY[0x19AEA534C](v4);
LABEL_6:
  v6 = *(_QWORD *)(v4 + 8);
  v7 = v6 - 1;
  *(_QWORD *)(v4 + 8) = v6 - 1;
  if (v6 == 1)
  {
    v13 = *(_QWORD *)(v4 + 16);
    v8 = *(_QWORD *)(v4 + 24);
    *(_QWORD *)(v4 + 24) = 0;
    v9 = v13 != 0;
  }
  else
  {
    v8 = 0;
    v9 = 1;
  }
  v10 = __ldxr((unsigned __int8 *)v4);
  if (v10 != 1)
  {
    __clrex();
LABEL_13:
    WTF::Lock::unlockSlow((WTF::Lock *)v4);
    if (v7)
      goto LABEL_18;
    goto LABEL_14;
  }
  if (__stlxr(0, (unsigned __int8 *)v4))
    goto LABEL_13;
  if (v7)
    goto LABEL_18;
LABEL_14:
  if (v8)
    (*(void (**)(uint64_t))(*(_QWORD *)v8 + 16))(v8);
  if (!v9)
    WTF::fastFree((WTF *)v4, a2);
LABEL_18:
  v11 = (const void *)*((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = 0;
  if (v11)
    CFRelease(v11);
  return WTF::fastFree(this, a2);
}

- (WTF::StringImpl)resume
{
  unint64_t *v1;
  unint64_t v2;
  WTF::StringImpl *result;
  WTF::StringImpl *v4;
  _DWORD *v5;
  WTF::StringImpl *v6;
  const void *v7;
  WTF::StringImpl *v8;
  WTF::StringImpl *v9;
  _OWORD v10[5];
  WTF::StringImpl *v11[2];
  int v12;
  uint64_t v13;
  uint64_t v14;
  _DWORD *v15;
  WTF::StringImpl *v16;
  WTF::StringImpl *v17;
  WTF::StringImpl *v18;
  int v19;
  __int16 v20;
  const void *v21;
  char v22;

  v1 = *(unint64_t **)(a1 + 16);
  if (*(_QWORD *)(a1 + 24))
  {
    v2 = atomic_load(v1 + 12);
    if (v2 || *(_DWORD *)(a1 + 32) != *(_DWORD *)(*(_QWORD *)(a1 + 16) + 124))
      return (WTF::StringImpl *)(*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 24) + 24))(*(_QWORD *)(a1 + 24));
    else
      return (WTF::StringImpl *)objc_msgSend(*(id *)(a1 + 16), "setResource:", *(_QWORD *)(a1 + 24));
  }
  else
  {
    v16 = 0;
    v17 = 0;
    WTF::URL::invalidate((WTF::URL *)&v17);
    v18 = 0;
    v19 = 0;
    v20 = 3;
    v21 = 0;
    v22 = 1;
    v12 = 0;
    *(_OWORD *)v11 = 0u;
    memset(v10, 0, sizeof(v10));
    v13 = -1;
    v14 = -1;
    v15 = 0;
    objc_msgSend(v1, "_resource:loadFinishedWithError:metrics:", 0, WebCore::ResourceError::nsError((WebCore::ResourceError *)&v16), v10);
    v5 = v15;
    v15 = 0;
    if (v5)
      WTF::RefCounted<WebCore::AdditionalNetworkLoadMetricsForWebInspector>::deref(v5, v4);
    v6 = v11[1];
    v11[1] = 0;
    if (v6)
    {
      if (*(_DWORD *)v6 == 2)
        WTF::StringImpl::destroy(v6, v4);
      else
        *(_DWORD *)v6 -= 2;
    }
    v7 = v21;
    v21 = 0;
    if (v7)
      CFRelease(v7);
    v8 = v18;
    v18 = 0;
    if (v8)
    {
      if (*(_DWORD *)v8 == 2)
        WTF::StringImpl::destroy(v8, v4);
      else
        *(_DWORD *)v8 -= 2;
    }
    v9 = v17;
    v17 = 0;
    if (v9)
    {
      if (*(_DWORD *)v9 == 2)
        WTF::StringImpl::destroy(v9, v4);
      else
        *(_DWORD *)v9 -= 2;
    }
    result = v16;
    v16 = 0;
    if (result)
    {
      if (*(_DWORD *)result == 2)
        return (WTF::StringImpl *)WTF::StringImpl::destroy(result, v4);
      else
        *(_DWORD *)result -= 2;
    }
  }
  return result;
}

- (_QWORD)dealloc
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  int v10;
  uint64_t v12;

  v3 = a1[1];
  *a1 = &off_1E3485EF0;
  a1[1] = 0;
  if (!v3)
    return a1;
  v4 = *(_QWORD *)(v3 + 8);
  if (__ldaxr((unsigned __int8 *)v4))
  {
    __clrex();
  }
  else if (!__stxr(1u, (unsigned __int8 *)v4))
  {
    goto LABEL_6;
  }
  MEMORY[0x19AEA534C](v4);
LABEL_6:
  v6 = *(_QWORD *)(v4 + 8);
  v7 = v6 - 1;
  *(_QWORD *)(v4 + 8) = v6 - 1;
  if (v6 == 1)
  {
    v12 = *(_QWORD *)(v4 + 16);
    v8 = *(_QWORD *)(v4 + 24);
    *(_QWORD *)(v4 + 24) = 0;
    v9 = v12 != 0;
  }
  else
  {
    v8 = 0;
    v9 = 1;
  }
  v10 = __ldxr((unsigned __int8 *)v4);
  if (v10 == 1)
  {
    if (!__stlxr(0, (unsigned __int8 *)v4))
    {
      if (v7)
        return a1;
      goto LABEL_14;
    }
  }
  else
  {
    __clrex();
  }
  WTF::Lock::unlockSlow((WTF::Lock *)v4);
  if (v7)
    return a1;
LABEL_14:
  if (v8)
    (*(void (**)(uint64_t))(*(_QWORD *)v8 + 16))(v8);
  if (!v9)
    WTF::fastFree((WTF *)v4, a2);
  return a1;
}

- (uint64_t)dealloc
{
  uint64_t v2;
  unsigned __int8 *v3;
  uint64_t v5;
  unsigned int *v6;
  unsigned int v7;
  int v8;
  unsigned int *v9;
  unsigned int v10;
  unsigned int v11;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = (unsigned __int8 *)(v2 + 24);
  if (__ldaxr((unsigned __int8 *)(v2 + 24)))
  {
    __clrex();
  }
  else if (!__stxr(1u, v3))
  {
    goto LABEL_5;
  }
  MEMORY[0x19AEA534C](v2 + 24);
LABEL_5:
  v5 = *(_QWORD *)(v2 + 16);
  if (v5)
  {
    v6 = (unsigned int *)(v5 + 8);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 + 1, v6));
  }
  v8 = __ldxr(v3);
  if (v8 != 1)
  {
    __clrex();
LABEL_13:
    WTF::Lock::unlockSlow((WTF::Lock *)v3);
    if (!v5)
      return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 8) + 24))(*(_QWORD *)(a1 + 8));
    goto LABEL_14;
  }
  if (__stlxr(0, v3))
    goto LABEL_13;
  if (!v5)
    return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 8) + 24))(*(_QWORD *)(a1 + 8));
LABEL_14:
  objc_storeWeak((id *)(v5 + 16), 0);
  v9 = (unsigned int *)(v5 + 8);
  do
  {
    v10 = __ldaxr(v9);
    v11 = v10 - 1;
  }
  while (__stlxr(v11, v9));
  if (!v11)
  {
    atomic_store(1u, (unsigned int *)(v5 + 8));
    (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
  }
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 8) + 24))(*(_QWORD *)(a1 + 8));
}

- (_QWORD)resource:(_QWORD *)a1 receivedResponse:completionHandler:
{
  uint64_t v2;
  uint64_t v3;
  const void *v4;
  const void *v5;

  *a1 = &off_1E3485F18;
  v2 = a1[4];
  a1[4] = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 40))(v2);
  v3 = a1[3];
  a1[3] = 0;
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  v4 = (const void *)a1[2];
  a1[2] = 0;
  if (v4)
    CFRelease(v4);
  v5 = (const void *)a1[1];
  a1[1] = 0;
  if (v5)
    CFRelease(v5);
  return a1;
}

- (uint64_t)resource:(WTF *)this receivedResponse:(void *)a2 completionHandler:
{
  uint64_t v3;
  uint64_t v4;
  const void *v5;
  const void *v6;

  *(_QWORD *)this = &off_1E3485F18;
  v3 = *((_QWORD *)this + 4);
  *((_QWORD *)this + 4) = 0;
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 40))(v3);
  v4 = *((_QWORD *)this + 3);
  *((_QWORD *)this + 3) = 0;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  v5 = (const void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v5)
    CFRelease(v5);
  v6 = (const void *)*((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = 0;
  if (v6)
    CFRelease(v6);
  return WTF::fastFree(this, a2);
}

- (void)resource:(uint64_t)a1 receivedResponse:completionHandler:
{
  uint64_t v2;
  uint64_t v3;
  const void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;

  v3 = *(_QWORD *)(a1 + 8);
  v2 = *(_QWORD *)(a1 + 16);
  if (v2)
    CFRetain(*(CFTypeRef *)(a1 + 16));
  v4 = *(const void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = v2;
  if (v4)
    CFRelease(v4);
  v5 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "session"), "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = objc_msgSend(*(id *)(a1 + 8), "session");
    v7 = *(_QWORD *)(a1 + 8);
    v8 = *(_QWORD *)(a1 + 16);
    if (v7)
      CFRetain(*(CFTypeRef *)(a1 + 8));
    v10 = *(_QWORD *)(a1 + 24);
    v9 = *(_QWORD *)(a1 + 32);
    *(_QWORD *)(a1 + 24) = 0;
    *(_QWORD *)(a1 + 32) = 0;
    v11 = malloc_type_malloc(0x38uLL, 0x10E0040276D0414uLL);
    *v11 = MEMORY[0x1E0C809A0];
    v11[1] = 50331650;
    v11[2] = WTF::BlockPtr<void ()(NSURLSessionResponseDisposition)>::fromCallable<-[WebCoreNSURLSessionDataTask resource:receivedResponse:completionHandler:]::$_13::operator()(void)::{lambda(NSURLSessionResponseDisposition)#1}>(-[WebCoreNSURLSessionDataTask resource:receivedResponse:completionHandler:]::$_13::operator()(void)::{lambda(NSURLSessionResponseDisposition)#1})::{lambda(void *,NSURLSessionResponseDisposition)#1}::__invoke;
    v11[3] = &WTF::BlockPtr<void ()(NSURLSessionResponseDisposition)>::fromCallable<-[WebCoreNSURLSessionDataTask resource:receivedResponse:completionHandler:]::$_13::operator()(void)::{lambda(NSURLSessionResponseDisposition)#1}>(-[WebCoreNSURLSessionDataTask resource:receivedResponse:completionHandler:]::$_13::operator()(void)::{lambda(NSURLSessionResponseDisposition)#1})::descriptor;
    v11[4] = v7;
    v11[5] = v9;
    v11[6] = v10;
    objc_msgSend(v5, "URLSession:dataTask:didReceiveResponse:completionHandler:", v6, v7, v8, v11);
    _Block_release(v11);
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(_QWORD *)(a1 + 8);
    if (v13)
      CFRetain(*(CFTypeRef *)(a1 + 8));
    v14 = *(_QWORD *)(a1 + 24);
    *(_QWORD *)(a1 + 24) = 0;
    v15 = (_QWORD *)WTF::fastMalloc((WTF *)0x18);
    *v15 = &off_1E3485F40;
    v15[1] = v13;
    v15[2] = v14;
    v17 = v15;
    (*(void (**)(uint64_t, _QWORD **))(*(_QWORD *)v12 + 16))(v12, &v17);
    v16 = v17;
    v17 = 0;
    if (v16)
      (*(void (**)(_QWORD *))(*v16 + 8))(v16);
  }
}

- (_QWORD)resource:receivedResponse:completionHandler:
{
  uint64_t v2;
  const void *v3;

  *a1 = &off_1E3485F88;
  v2 = a1[3];
  a1[3] = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  v3 = (const void *)a1[1];
  a1[1] = 0;
  if (v3)
    CFRelease(v3);
  return a1;
}

- (uint64_t)resource:receivedResponse:completionHandler:
{
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t);

  v1 = *(_QWORD *)(a1 + 16);
  v2 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 24) = 0;
  v3 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)v2 + 16);
  if (v1)
    v3(v2, 1);
  else
    v3(v2, 0);
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
}

- (void)resource:receivedResponse:completionHandler:
{
  uint64_t v2;
  uint64_t v3;
  const void *v4;

  v2 = a1[6];
  a1[6] = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  v3 = a1[5];
  a1[5] = 0;
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 40))(v3);
  v4 = (const void *)a1[4];
  a1[4] = 0;
  if (v4)
    CFRelease(v4);
}

- (_QWORD)resource:(_QWORD *)a1 receivedData:
{
  const void *v2;
  const void *v3;

  *a1 = &off_1E3485FB0;
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

- (uint64_t)resource:(WTF *)this receivedData:(void *)a2
{
  const void *v3;
  const void *v4;

  *(_QWORD *)this = &off_1E3485FB0;
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

- (uint64_t)resource:(uint64_t)a1 receivedData:
{
  void *v2;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 8), "setCountOfBytesReceived:", objc_msgSend(*(id *)(a1 + 8), "countOfBytesReceived") + objc_msgSend(*(id *)(a1 + 16), "length"));
  v2 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "session"), "delegate");
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(v2, "URLSession:dataTask:didReceiveData:", objc_msgSend(*(id *)(a1 + 8), "session"), *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16));
  return result;
}

- (_QWORD)resource:(_QWORD *)a1 receivedRedirect:(void *)a2 request:completionHandler:
{
  uint64_t v3;
  uint64_t v4;
  const void *v5;
  const void *v6;

  *a1 = off_1E3485FD8;
  v3 = a1[29];
  a1[29] = 0;
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 40))(v3);
  v4 = a1[28];
  a1[28] = 0;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  WebCore::ResourceRequest::~ResourceRequest((WebCore::ResourceRequest *)(a1 + 3), a2);
  v5 = (const void *)a1[2];
  a1[2] = 0;
  if (v5)
    CFRelease(v5);
  v6 = (const void *)a1[1];
  a1[1] = 0;
  if (v6)
    CFRelease(v6);
  return a1;
}

- (uint64_t)resource:(_QWORD *)a1 receivedRedirect:(void *)a2 request:completionHandler:
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const void *v6;
  const void *v7;

  *a1 = off_1E3485FD8;
  v3 = a1[29];
  a1[29] = 0;
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 40))(v3);
  v4 = a1[28];
  a1[28] = 0;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  WebCore::ResourceRequest::~ResourceRequest((WebCore::ResourceRequest *)(a1 + 3), a2);
  v6 = (const void *)a1[2];
  a1[2] = 0;
  if (v6)
    CFRelease(v6);
  v7 = (const void *)a1[1];
  a1[1] = 0;
  if (v7)
    CFRelease(v7);
  return WTF::fastFree((WTF *)a1, v5);
}

- (void)resource:(uint64_t)a1 receivedRedirect:request:completionHandler:
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  uint64_t v41;
  uint64_t v42;
  __int128 v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _BYTE v60[32];
  uint64_t v61;
  _BYTE v62[32];
  uint64_t v63;
  __int128 v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  int v70;
  char v71;
  __int128 v72;
  uint64_t v73;
  uint64_t v74;
  char v75;
  __int128 v76;
  uint64_t v77;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = (void *)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 8), "session"), "delegate");
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v3 = *(_QWORD *)(a1 + 224);
      v4 = *(_QWORD *)(a1 + 232);
      *(_QWORD *)(a1 + 224) = 0;
      *(_QWORD *)(a1 + 232) = 0;
      v5 = malloc_type_malloc(0x30uLL, 0x10E004002B5D1D8uLL);
      *v5 = MEMORY[0x1E0C809A0];
      v5[1] = 50331650;
      v5[2] = WTF::BlockPtr<void ()(NSURLRequest *)>::fromCallable<-[WebCoreNSURLSessionDataTask resource:receivedRedirect:request:completionHandler:]::$_14::operator()(void)::{lambda(NSURLRequest *)#1}>(-[WebCoreNSURLSessionDataTask resource:receivedRedirect:request:completionHandler:]::$_14::operator()(void)::{lambda(NSURLRequest *)#1})::{lambda(void *,NSURLRequest *)#1}::__invoke;
      v5[3] = &WTF::BlockPtr<void ()(NSURLRequest *)>::fromCallable<-[WebCoreNSURLSessionDataTask resource:receivedRedirect:request:completionHandler:]::$_14::operator()(void)::{lambda(NSURLRequest *)#1}>(-[WebCoreNSURLSessionDataTask resource:receivedRedirect:request:completionHandler:]::$_14::operator()(void)::{lambda(NSURLRequest *)#1})::descriptor;
      v5[4] = v3;
      v5[5] = v4;
      objc_msgSend(v2, "URLSession:task:willPerformHTTPRedirection:newRequest:completionHandler:", objc_msgSend(*(id *)(a1 + 8), "session"), *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), WebCore::ResourceRequest::nsURLRequest((WebCore::ResourceRequest *)(a1 + 24), 0), v5);
      _Block_release(v5);
      return;
    }
    v32 = *(_QWORD *)(a1 + 232);
    v33 = *(_QWORD *)(a1 + 24);
    *(_QWORD *)(a1 + 24) = 0;
    v59 = v33;
    v34 = *(_OWORD *)(a1 + 48);
    *(_OWORD *)v60 = *(_OWORD *)(a1 + 32);
    *(_OWORD *)&v60[16] = v34;
    *(_DWORD *)(a1 + 32) = *(_DWORD *)v60 & 0xFFFFFFFE;
    v35 = *(_QWORD *)(a1 + 64);
    *(_QWORD *)(a1 + 64) = 0;
    v61 = v35;
    v36 = *(_OWORD *)(a1 + 88);
    *(_OWORD *)v62 = *(_OWORD *)(a1 + 72);
    *(_OWORD *)&v62[16] = v36;
    *(_DWORD *)(a1 + 72) = *(_DWORD *)v62 & 0xFFFFFFFE;
    v63 = *(_QWORD *)(a1 + 104);
    v37 = *(_OWORD *)(a1 + 112);
    *(_OWORD *)(a1 + 112) = 0u;
    v64 = v37;
    *(_QWORD *)&v37 = *(_QWORD *)(a1 + 128);
    *(_QWORD *)(a1 + 128) = 0;
    v65 = v37;
    v38 = *(_QWORD *)(a1 + 136);
    *(_QWORD *)(a1 + 136) = 0;
    v66 = v38;
    *(_QWORD *)&v37 = *(_QWORD *)(a1 + 144);
    *(_QWORD *)(a1 + 144) = 0;
    v67 = v37;
    v39 = *(_QWORD *)(a1 + 152);
    *(_QWORD *)(a1 + 152) = 0;
    v68 = v39;
    *(_QWORD *)&v37 = *(_QWORD *)(a1 + 160);
    *(_QWORD *)(a1 + 160) = 0;
    v69 = v37;
    LODWORD(v39) = *(_DWORD *)(a1 + 168);
    v71 = *(_BYTE *)(a1 + 172);
    v70 = v39;
    v40 = *(_OWORD *)(a1 + 176);
    *(_OWORD *)(a1 + 176) = 0u;
    v72 = v40;
    v75 = *(_BYTE *)(a1 + 208);
    v41 = *(_QWORD *)(a1 + 192);
    v42 = *(_QWORD *)(a1 + 200);
    *(_QWORD *)(a1 + 192) = 0;
    v73 = v41;
    v74 = v42;
    v43 = *(_OWORD *)(a1 + 216);
    *(_OWORD *)(a1 + 216) = 0u;
    v76 = v43;
    v44 = WTF::fastMalloc((WTF *)0xD8);
    *(_QWORD *)v44 = off_1E3486070;
    v45 = v59;
    v59 = 0;
    *(_QWORD *)(v44 + 8) = v45;
    LODWORD(v45) = *(_DWORD *)v60;
    *(_DWORD *)(v44 + 16) = *(_DWORD *)v60;
    *(_OWORD *)(v44 + 20) = *(_OWORD *)&v60[4];
    *(_QWORD *)(v44 + 36) = *(_QWORD *)&v60[20];
    *(_DWORD *)(v44 + 44) = *(_DWORD *)&v60[28];
    *(_DWORD *)v60 = v45 & 0xFFFFFFFE;
    v46 = v61;
    v61 = 0;
    *(_QWORD *)(v44 + 48) = v46;
    LODWORD(v46) = *(_DWORD *)v62;
    *(_DWORD *)(v44 + 56) = *(_DWORD *)v62;
    *(_OWORD *)(v44 + 60) = *(_OWORD *)&v62[4];
    *(_QWORD *)(v44 + 76) = *(_QWORD *)&v62[20];
    *(_DWORD *)(v44 + 84) = *(_DWORD *)&v62[28];
    *(_DWORD *)v62 = v46 & 0xFFFFFFFE;
    *(_QWORD *)(v44 + 88) = v63;
    *(_QWORD *)(v44 + 96) = v64;
    v47 = *((_QWORD *)&v64 + 1);
    v64 = 0u;
    *(_QWORD *)(v44 + 104) = v47;
    v48 = v65;
    v65 = 0;
    *(_QWORD *)(v44 + 112) = v48;
    v49 = v66;
    v66 = 0;
    *(_QWORD *)(v44 + 120) = v49;
    v50 = v67;
    v67 = 0;
    *(_QWORD *)(v44 + 128) = v50;
    v51 = v68;
    v68 = 0;
    *(_QWORD *)(v44 + 136) = v51;
    v52 = v69;
    v69 = 0;
    *(_QWORD *)(v44 + 144) = v52;
    LODWORD(v51) = v70;
    *(_BYTE *)(v44 + 156) = v71;
    *(_DWORD *)(v44 + 152) = v51;
    *(_QWORD *)(v44 + 160) = v72;
    v53 = *((_QWORD *)&v72 + 1);
    v72 = 0u;
    *(_QWORD *)(v44 + 168) = v53;
    v54 = v73;
    v73 = 0;
    *(_QWORD *)(v44 + 176) = v54;
    v55 = v74;
    *(_BYTE *)(v44 + 192) = v75;
    *(_QWORD *)(v44 + 184) = v55;
    *(_QWORD *)(v44 + 200) = v76;
    v56 = *((_QWORD *)&v76 + 1);
    v76 = 0u;
    *(_QWORD *)(v44 + 208) = v56;
    v77 = v44;
    (*(void (**)(uint64_t, uint64_t *))(*(_QWORD *)v32 + 16))(v32, &v77);
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 232);
    v7 = *(_QWORD *)(a1 + 24);
    *(_QWORD *)(a1 + 24) = 0;
    v59 = v7;
    v8 = *(_OWORD *)(a1 + 48);
    *(_OWORD *)v60 = *(_OWORD *)(a1 + 32);
    *(_OWORD *)&v60[16] = v8;
    *(_DWORD *)(a1 + 32) = *(_DWORD *)v60 & 0xFFFFFFFE;
    v9 = *(_QWORD *)(a1 + 64);
    *(_QWORD *)(a1 + 64) = 0;
    v61 = v9;
    v10 = *(_OWORD *)(a1 + 88);
    *(_OWORD *)v62 = *(_OWORD *)(a1 + 72);
    *(_OWORD *)&v62[16] = v10;
    *(_DWORD *)(a1 + 72) = *(_DWORD *)v62 & 0xFFFFFFFE;
    v63 = *(_QWORD *)(a1 + 104);
    v11 = *(_OWORD *)(a1 + 112);
    *(_OWORD *)(a1 + 112) = 0u;
    v64 = v11;
    *(_QWORD *)&v11 = *(_QWORD *)(a1 + 128);
    *(_QWORD *)(a1 + 128) = 0;
    v65 = v11;
    v12 = *(_QWORD *)(a1 + 136);
    *(_QWORD *)(a1 + 136) = 0;
    v66 = v12;
    *(_QWORD *)&v11 = *(_QWORD *)(a1 + 144);
    *(_QWORD *)(a1 + 144) = 0;
    v67 = v11;
    v13 = *(_QWORD *)(a1 + 152);
    *(_QWORD *)(a1 + 152) = 0;
    v68 = v13;
    *(_QWORD *)&v11 = *(_QWORD *)(a1 + 160);
    *(_QWORD *)(a1 + 160) = 0;
    v69 = v11;
    LODWORD(v13) = *(_DWORD *)(a1 + 168);
    v71 = *(_BYTE *)(a1 + 172);
    v70 = v13;
    v14 = *(_OWORD *)(a1 + 176);
    *(_OWORD *)(a1 + 176) = 0u;
    v72 = v14;
    v75 = *(_BYTE *)(a1 + 208);
    v15 = *(_QWORD *)(a1 + 192);
    v16 = *(_QWORD *)(a1 + 200);
    *(_QWORD *)(a1 + 192) = 0;
    v73 = v15;
    v74 = v16;
    v17 = *(_OWORD *)(a1 + 216);
    *(_OWORD *)(a1 + 216) = 0u;
    v76 = v17;
    v18 = WTF::fastMalloc((WTF *)0xD8);
    *(_QWORD *)v18 = off_1E3486000;
    v19 = v59;
    v59 = 0;
    *(_QWORD *)(v18 + 8) = v19;
    LODWORD(v19) = *(_DWORD *)v60;
    *(_DWORD *)(v18 + 16) = *(_DWORD *)v60;
    *(_OWORD *)(v18 + 20) = *(_OWORD *)&v60[4];
    *(_QWORD *)(v18 + 36) = *(_QWORD *)&v60[20];
    *(_DWORD *)(v18 + 44) = *(_DWORD *)&v60[28];
    *(_DWORD *)v60 = v19 & 0xFFFFFFFE;
    v20 = v61;
    v61 = 0;
    *(_QWORD *)(v18 + 48) = v20;
    LODWORD(v20) = *(_DWORD *)v62;
    *(_DWORD *)(v18 + 56) = *(_DWORD *)v62;
    *(_OWORD *)(v18 + 60) = *(_OWORD *)&v62[4];
    *(_QWORD *)(v18 + 76) = *(_QWORD *)&v62[20];
    *(_DWORD *)(v18 + 84) = *(_DWORD *)&v62[28];
    *(_DWORD *)v62 = v20 & 0xFFFFFFFE;
    *(_QWORD *)(v18 + 88) = v63;
    *(_QWORD *)(v18 + 96) = v64;
    v21 = *((_QWORD *)&v64 + 1);
    v64 = 0u;
    *(_QWORD *)(v18 + 104) = v21;
    v22 = v65;
    v65 = 0;
    *(_QWORD *)(v18 + 112) = v22;
    v23 = v66;
    v66 = 0;
    *(_QWORD *)(v18 + 120) = v23;
    v24 = v67;
    v67 = 0;
    *(_QWORD *)(v18 + 128) = v24;
    v25 = v68;
    v68 = 0;
    *(_QWORD *)(v18 + 136) = v25;
    v26 = v69;
    v69 = 0;
    *(_QWORD *)(v18 + 144) = v26;
    LODWORD(v25) = v70;
    *(_BYTE *)(v18 + 156) = v71;
    *(_DWORD *)(v18 + 152) = v25;
    *(_QWORD *)(v18 + 160) = v72;
    v27 = *((_QWORD *)&v72 + 1);
    v72 = 0u;
    *(_QWORD *)(v18 + 168) = v27;
    v28 = v73;
    v73 = 0;
    *(_QWORD *)(v18 + 176) = v28;
    v29 = v74;
    *(_BYTE *)(v18 + 192) = v75;
    *(_QWORD *)(v18 + 184) = v29;
    *(_QWORD *)(v18 + 200) = v76;
    v30 = *((_QWORD *)&v76 + 1);
    v76 = 0u;
    *(_QWORD *)(v18 + 208) = v30;
    v77 = v18;
    (*(void (**)(uint64_t, uint64_t *))(*(_QWORD *)v6 + 16))(v6, &v77);
  }
  v57 = v77;
  v77 = 0;
  if (v57)
    (*(void (**)(uint64_t))(*(_QWORD *)v57 + 8))(v57);
  v58 = *((_QWORD *)&v76 + 1);
  *((_QWORD *)&v76 + 1) = 0;
  if (v58)
    (*(void (**)(uint64_t))(*(_QWORD *)v58 + 8))(v58);
  WebCore::ResourceRequest::~ResourceRequest((WebCore::ResourceRequest *)&v59, v31);
}

- (_QWORD)resource:receivedRedirect:request:completionHandler:
{
  uint64_t v3;

  *a1 = off_1E3486070;
  v3 = a1[26];
  a1[26] = 0;
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
  WebCore::ResourceRequest::~ResourceRequest((WebCore::ResourceRequest *)(a1 + 1), a2);
  return a1;
}

- (uint64_t)resource:receivedRedirect:request:completionHandler:
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 208);
  *(_QWORD *)(a1 + 208) = 0;
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v1 + 16))(v1, a1 + 8);
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 8))(v1);
}

- (void)resource:receivedRedirect:request:completionHandler:
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  __int128 v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  int v27;
  __int128 v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  char v39;
  __int128 v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  __int128 v44;
  uint64_t v45;

  v3 = *(_QWORD *)(a1 + 40);
  WebCore::ResourceRequest::ResourceRequest((WebCore::ResourceRequest *)&v21, a2);
  v4 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 32) = 0;
  *((_QWORD *)&v44 + 1) = v4;
  v5 = WTF::fastMalloc((WTF *)0xD8);
  *(_QWORD *)v5 = off_1E3486048;
  v6 = v21;
  v21 = 0;
  *(_QWORD *)(v5 + 8) = v6;
  LODWORD(v6) = v22;
  *(_DWORD *)(v5 + 16) = v22;
  *(_OWORD *)(v5 + 20) = v23;
  *(_QWORD *)(v5 + 36) = v24;
  *(_DWORD *)(v5 + 44) = v25;
  v22 = v6 & 0xFFFFFFFE;
  v7 = v26;
  v26 = 0;
  *(_QWORD *)(v5 + 48) = v7;
  LODWORD(v7) = v27;
  *(_DWORD *)(v5 + 56) = v27;
  *(_OWORD *)(v5 + 60) = v28;
  *(_QWORD *)(v5 + 76) = v29;
  *(_DWORD *)(v5 + 84) = v30;
  v27 = v7 & 0xFFFFFFFE;
  *(_QWORD *)(v5 + 88) = v31;
  *(_QWORD *)(v5 + 96) = v32;
  v8 = *((_QWORD *)&v32 + 1);
  v32 = 0u;
  *(_QWORD *)(v5 + 104) = v8;
  v9 = v33;
  v33 = 0;
  *(_QWORD *)(v5 + 112) = v9;
  v10 = v34;
  v34 = 0;
  *(_QWORD *)(v5 + 120) = v10;
  v11 = v35;
  v35 = 0;
  *(_QWORD *)(v5 + 128) = v11;
  v12 = v36;
  v36 = 0;
  *(_QWORD *)(v5 + 136) = v12;
  v13 = v37;
  v37 = 0;
  *(_QWORD *)(v5 + 144) = v13;
  LODWORD(v12) = v38;
  *(_BYTE *)(v5 + 156) = v39;
  *(_DWORD *)(v5 + 152) = v12;
  *(_QWORD *)(v5 + 160) = v40;
  v14 = *((_QWORD *)&v40 + 1);
  v40 = 0u;
  *(_QWORD *)(v5 + 168) = v14;
  v15 = v41;
  v41 = 0;
  *(_QWORD *)(v5 + 176) = v15;
  v16 = v42;
  *(_BYTE *)(v5 + 192) = v43;
  *(_QWORD *)(v5 + 184) = v16;
  *(_QWORD *)(v5 + 200) = v44;
  v17 = *((_QWORD *)&v44 + 1);
  v44 = 0u;
  *(_QWORD *)(v5 + 208) = v17;
  v45 = v5;
  (*(void (**)(uint64_t, uint64_t *))(*(_QWORD *)v3 + 16))(v3, &v45);
  v19 = v45;
  v45 = 0;
  if (v19)
    (*(void (**)(uint64_t))(*(_QWORD *)v19 + 8))(v19);
  v20 = *((_QWORD *)&v44 + 1);
  *((_QWORD *)&v44 + 1) = 0;
  if (v20)
    (*(void (**)(uint64_t))(*(_QWORD *)v20 + 8))(v20);
  WebCore::ResourceRequest::~ResourceRequest((WebCore::ResourceRequest *)&v21, v18);
}

- (_QWORD)_resource:(_QWORD *)a1 loadFinishedWithError:metrics:
{
  uint64_t v2;
  const void *v3;
  const void *v4;
  const void *v5;
  const void *v6;

  *a1 = &off_1E3486098;
  v2 = a1[5];
  a1[5] = 0;
  if (v2)
    (*(void (**)(uint64_t))(*(_QWORD *)v2 + 40))(v2);
  v3 = (const void *)a1[4];
  a1[4] = 0;
  if (v3)
    CFRelease(v3);
  v4 = (const void *)a1[3];
  a1[3] = 0;
  if (v4)
    CFRelease(v4);
  v5 = (const void *)a1[2];
  a1[2] = 0;
  if (v5)
    CFRelease(v5);
  v6 = (const void *)a1[1];
  a1[1] = 0;
  if (v6)
    CFRelease(v6);
  return a1;
}

- (uint64_t)_resource:(WTF *)this loadFinishedWithError:(void *)a2 metrics:
{
  uint64_t v3;
  const void *v4;
  const void *v5;
  const void *v6;
  const void *v7;

  *(_QWORD *)this = &off_1E3486098;
  v3 = *((_QWORD *)this + 5);
  *((_QWORD *)this + 5) = 0;
  if (v3)
    (*(void (**)(uint64_t))(*(_QWORD *)v3 + 40))(v3);
  v4 = (const void *)*((_QWORD *)this + 4);
  *((_QWORD *)this + 4) = 0;
  if (v4)
    CFRelease(v4);
  v5 = (const void *)*((_QWORD *)this + 3);
  *((_QWORD *)this + 3) = 0;
  if (v5)
    CFRelease(v5);
  v6 = (const void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v6)
    CFRelease(v6);
  v7 = (const void *)*((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = 0;
  if (v7)
    CFRelease(v7);
  return WTF::fastFree(this, a2);
}

- (uint64_t)_resource:(uint64_t)a1 loadFinishedWithError:metrics:
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  const void *v5;
  _QWORD *v6;
  uint64_t result;
  _QWORD *v8;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 16), "delegate");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "URLSession:task:didFinishCollectingMetrics:", *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 32));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "URLSession:task:didCompleteWithError:", *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 24));
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 8);
  if (v4)
    CFRetain(*(CFTypeRef *)(a1 + 8));
  v5 = *(const void **)(a1 + 16);
  if (v5)
    CFRetain(v5);
  v6 = (_QWORD *)WTF::fastMalloc((WTF *)0x18);
  *v6 = &off_1E34860C0;
  v6[1] = v4;
  v6[2] = v5;
  v8 = v6;
  (*(void (**)(uint64_t, _QWORD **))(*(_QWORD *)v3 + 16))(v3, &v8);
  result = (uint64_t)v8;
  v8 = 0;
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

- (_QWORD)_resource:loadFinishedWithError:metrics:
{
  const void *v2;
  const void *v3;

  *a1 = &off_1E34860C0;
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

- (uint64_t)_resource:loadFinishedWithError:metrics:
{
  return objc_msgSend(*(id *)(a1 + 16), "taskCompleted:", *(_QWORD *)(a1 + 8));
}

@end
