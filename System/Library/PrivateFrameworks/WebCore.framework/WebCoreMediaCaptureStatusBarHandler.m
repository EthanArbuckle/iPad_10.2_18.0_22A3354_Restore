@implementation WebCoreMediaCaptureStatusBarHandler

- (WebCoreMediaCaptureStatusBarHandler)initWithManager:(void *)a3
{
  void *v4;
  WebCoreMediaCaptureStatusBarHandler *v5;
  uint64_t v6;
  unsigned int *v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int *m_ptr;
  unsigned int v12;
  unsigned int v13;
  void *v14;
  void *v15;

  v5 = -[WebCoreMediaCaptureStatusBarHandler init](self, "init");
  if (v5)
  {
    v6 = *(_QWORD *)a3;
    if (*(_QWORD *)a3)
      goto LABEL_20;
    v6 = WTF::fastCompactMalloc((WTF *)0x10);
    *(_DWORD *)v6 = 1;
    *(_QWORD *)(v6 + 8) = a3;
    v7 = *(unsigned int **)a3;
    *(_QWORD *)a3 = v6;
    if (!v7)
      goto LABEL_20;
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
    v6 = *(_QWORD *)a3;
    if (*(_QWORD *)a3)
    {
LABEL_20:
      do
        v10 = __ldaxr((unsigned int *)v6);
      while (__stlxr(v10 + 1, (unsigned int *)v6));
    }
    m_ptr = (unsigned int *)v5->m_manager.m_impl.m_ptr;
    v5->m_manager.m_impl.m_ptr = (DefaultWeakPtrImpl *)v6;
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
    v14 = v5->m_statusBarStyleOverride.m_ptr;
    v5->m_statusBarStyleOverride.m_ptr = 0;
    if (v14)
      CFRelease(v14);
    v15 = v5->m_coordinator.m_ptr;
    v5->m_coordinator.m_ptr = 0;
    if (v15)
      CFRelease(v15);
  }
  return v5;
}

- (void)validateIsStopped
{
  NSObject *v2;
  uint8_t v3[16];

  if (self->m_statusBarStyleOverride.m_ptr || self->m_coordinator.m_ptr)
  {
    v2 = qword_1ECE7CD60;
    if (os_log_type_enabled((os_log_t)qword_1ECE7CD60, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v3 = 0;
      _os_log_error_impl(&dword_1940B8000, v2, OS_LOG_TYPE_ERROR, "WebCoreMediaCaptureStatusBarHandler is not correctly stopped", v3, 2u);
    }
  }
}

- (void)start
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *m_ptr;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[5];

  v3 = (void *)_MergedGlobals_6();
  {
    if (byte_1ECE90D38)
    {
      v4 = WebCore::presentingApplicationPIDOverride(void)::pid;
      goto LABEL_4;
    }
  }
  else
  {
    LOBYTE(WebCore::presentingApplicationPIDOverride(void)::pid) = 0;
    byte_1ECE90D38 = 0;
  }
  v4 = getpid();
LABEL_4:
  v5 = (void *)objc_msgSend(v3, "assertionWithStatusBarStyleOverrides:forPID:exclusive:showsWhenForeground:", 0x1000000, v4, 1, 1);
  v6 = v5;
  if (v5)
    CFRetain(v5);
  m_ptr = self->m_statusBarStyleOverride.m_ptr;
  self->m_statusBarStyleOverride.m_ptr = v6;
  if (m_ptr)
    CFRelease(m_ptr);
  v8 = objc_alloc_init((Class)off_1ECE76A00());
  v9 = self->m_coordinator.m_ptr;
  self->m_coordinator.m_ptr = v8;
  if (v9)
  {
    CFRelease(v9);
    v8 = self->m_coordinator.m_ptr;
  }
  objc_msgSend(v8, "setDelegate:", self);
  v10 = MEMORY[0x1E0C809B0];
  v11 = self->m_coordinator.m_ptr;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __44__WebCoreMediaCaptureStatusBarHandler_start__block_invoke;
  v15[3] = &unk_1E3203608;
  v15[4] = self;
  objc_msgSend(v11, "setRegisteredStyleOverrides:reply:", 0x1000000, v15);
  v12 = self->m_statusBarStyleOverride.m_ptr;
  v13[4] = self;
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __44__WebCoreMediaCaptureStatusBarHandler_start__block_invoke_1;
  v14[3] = &unk_1E3203630;
  v14[4] = self;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __44__WebCoreMediaCaptureStatusBarHandler_start__block_invoke_2;
  v13[3] = &unk_1E3203658;
  objc_msgSend(v12, "acquireWithHandler:invalidationHandler:", v14, v13);
}

uint64_t __44__WebCoreMediaCaptureStatusBarHandler_start__block_invoke(uint64_t result, void *a2)
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  _QWORD *v6;
  _BYTE v7[12];
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v3 = result;
    v4 = qword_1ECE7CD60;
    if (os_log_type_enabled((os_log_t)qword_1ECE7CD60, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v7 = 134218242;
      *(_QWORD *)&v7[4] = objc_msgSend(a2, "code");
      v8 = 2080;
      v9 = objc_msgSend((id)objc_msgSend(a2, "localizedDescription"), "UTF8String");
      _os_log_error_impl(&dword_1940B8000, v4, OS_LOG_TYPE_ERROR, "WebCoreMediaCaptureStatusBarHandler _acquireStatusBarOverride failed, code = %ld, description is '%s'", v7, 0x16u);
    }
    v5 = *(_QWORD *)(v3 + 32);
    if (v5)
      CFRetain(*(CFTypeRef *)(v3 + 32));
    v6 = (_QWORD *)WTF::fastMalloc((WTF *)0x18);
    *v6 = &off_1E3203688;
    v6[1] = v5;
    v6[2] = v5;
    *(_QWORD *)v7 = v6;
    WTF::callOnMainThread();
    result = *(_QWORD *)v7;
    *(_QWORD *)v7 = 0;
    if (result)
      return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  }
  return result;
}

uint64_t __44__WebCoreMediaCaptureStatusBarHandler_start__block_invoke_1(uint64_t result, char a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;

  if ((a2 & 1) == 0)
  {
    v2 = *(_QWORD *)(result + 32);
    if (v2)
      CFRetain(*(CFTypeRef *)(result + 32));
    v3 = (_QWORD *)WTF::fastMalloc((WTF *)0x18);
    *v3 = &off_1E32036B0;
    v3[1] = v2;
    v3[2] = v2;
    v4 = v3;
    WTF::callOnMainThread();
    result = (uint64_t)v4;
    if (v4)
      return (*(uint64_t (**)(_QWORD *))(*v4 + 8))(v4);
  }
  return result;
}

uint64_t __44__WebCoreMediaCaptureStatusBarHandler_start__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t result;
  _QWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
    CFRetain(*(CFTypeRef *)(a1 + 32));
  v2 = (_QWORD *)WTF::fastMalloc((WTF *)0x18);
  *v2 = &off_1E32036D8;
  v2[1] = v1;
  v2[2] = v1;
  v4 = v2;
  WTF::callOnMainThread();
  result = (uint64_t)v4;
  if (v4)
    return (*(uint64_t (**)(_QWORD *))(*v4 + 8))(v4);
  return result;
}

- (void)stop
{
  void *m_ptr;
  void *v4;
  void *v5;
  void *v6;
  unsigned int *v7;
  unsigned int v8;
  unsigned int v9;

  m_ptr = self->m_coordinator.m_ptr;
  if (m_ptr)
  {
    objc_msgSend(m_ptr, "setDelegate:", 0);
    v4 = self->m_coordinator.m_ptr;
    self->m_coordinator.m_ptr = 0;
    if (v4)
      CFRelease(v4);
  }
  v5 = self->m_statusBarStyleOverride.m_ptr;
  if (v5)
  {
    objc_msgSend(v5, "invalidate");
    v6 = self->m_statusBarStyleOverride.m_ptr;
    self->m_statusBarStyleOverride.m_ptr = 0;
    if (v6)
      CFRelease(v6);
  }
  v7 = (unsigned int *)self->m_manager.m_impl.m_ptr;
  self->m_manager.m_impl.m_ptr = 0;
  if (v7)
  {
    do
    {
      v8 = __ldaxr(v7);
      v9 = v8 - 1;
    }
    while (__stlxr(v9, v7));
    if (!v9)
    {
      atomic_store(1u, v7);
      WTF::fastFree((WTF *)v7, (void *)a2);
    }
  }
}

- (BOOL)statusBarCoordinator:(id)a3 receivedTapWithContext:(id)a4 completionBlock:(id)a5
{
  void *v7;
  _QWORD *v8;
  _QWORD *v10;

  if (self)
    CFRetain(self);
  v7 = _Block_copy(a5);
  v8 = (_QWORD *)WTF::fastMalloc((WTF *)0x20);
  *v8 = off_1E3203700;
  v8[1] = self;
  v8[2] = self;
  v8[3] = v7;
  v10 = v8;
  WTF::callOnMainThread();
  if (v10)
    (*(void (**)(_QWORD *))(*v10 + 8))(v10);
  _Block_release(0);
  return 1;
}

- (void)statusBarCoordinator:(id)a3 invalidatedRegistrationWithError:(id)a4
{
  _QWORD *v5;
  _QWORD *v6;

  if (self)
    CFRetain(self);
  v5 = (_QWORD *)WTF::fastMalloc((WTF *)0x18);
  *v5 = &off_1E3203750;
  v5[1] = self;
  v5[2] = self;
  v6 = v5;
  WTF::callOnMainThread();
  if (v6)
    (*(void (**)(_QWORD *))(*v6 + 8))(v6);
}

- (void).cxx_destruct
{
  void *m_ptr;
  void *v4;
  unsigned int *v5;
  unsigned int v6;
  unsigned int v7;

  m_ptr = self->m_coordinator.m_ptr;
  self->m_coordinator.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v4 = self->m_statusBarStyleOverride.m_ptr;
  self->m_statusBarStyleOverride.m_ptr = 0;
  if (v4)
    CFRelease(v4);
  v5 = (unsigned int *)self->m_manager.m_impl.m_ptr;
  self->m_manager.m_impl.m_ptr = 0;
  if (v5)
  {
    do
    {
      v6 = __ldaxr(v5);
      v7 = v6 - 1;
    }
    while (__stlxr(v7, v5));
    if (!v7)
    {
      atomic_store(1u, v5);
      WTF::fastFree((WTF *)v5, (void *)a2);
    }
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

- (uint64_t)statusBarCoordinator:(uint64_t)a1 receivedTapWithContext:completionBlock:
{
  const void *v2;

  *(_QWORD *)a1 = off_1E3203700;
  _Block_release(*(const void **)(a1 + 24));
  v2 = *(const void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

{
  void *v2;
  const void *v3;

  *(_QWORD *)a1 = off_1E3203700;
  _Block_release(*(const void **)(a1 + 24));
  v3 = *(const void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = 0;
  if (v3)
    CFRelease(v3);
  return WTF::fastFree((WTF *)a1, v2);
}

- (void)statusBarCoordinator:(uint64_t)a1 receivedTapWithContext:completionBlock:
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8);
  if (v1)
  {
    v2 = *(_QWORD *)(v1 + 8);
    if (v2)
    {
      v3 = *(_QWORD *)(a1 + 24);
      *(_QWORD *)(a1 + 24) = 0;
      v4 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
      *v4 = off_1E3203728;
      v4[1] = v3;
      v6 = v4;
      (*(void (**)(_QWORD, _QWORD **))(**(_QWORD **)(v2 + 16) + 16))(*(_QWORD *)(v2 + 16), &v6);
      v5 = v6;
      v6 = 0;
      if (v5)
        (*(void (**)(_QWORD *))(*v5 + 8))(v5);
      _Block_release(0);
    }
  }
}

- (uint64_t)statusBarCoordinator:receivedTapWithContext:completionBlock:
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 16))();
}

- (_QWORD)statusBarCoordinator:(_QWORD *)a1 invalidatedRegistrationWithError:
{
  const void *v2;

  *a1 = &off_1E3203750;
  v2 = (const void *)a1[2];
  a1[2] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

- (uint64_t)statusBarCoordinator:(WTF *)this invalidatedRegistrationWithError:(void *)a2
{
  const void *v3;

  *(_QWORD *)this = &off_1E3203750;
  v3 = (const void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v3)
    CFRelease(v3);
  return WTF::fastFree(this, a2);
}

- (uint64_t)statusBarCoordinator:(uint64_t)result invalidatedRegistrationWithError:
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 8) + 8);
  if (v1)
  {
    v2 = *(_QWORD *)(v1 + 8);
    if (v2)
      return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(v2 + 24) + 16))(*(_QWORD *)(v2 + 24));
  }
  return result;
}

@end
