@implementation WebFramePolicyListener

- (WebFramePolicyListener)initWithFrame:(NakedPtr<WebCore:(void *)a4 :(unsigned __int8)a5 LocalFrame>)a3 policyFunction:defaultPolicy:
{
  WebFramePolicyListener *v8;
  WebFramePolicyListener *v9;
  uint64_t v10;
  unsigned int *v11;
  unsigned int v12;
  LocalFrame *m_ptr;
  unsigned int *v14;
  unsigned int v15;
  unsigned int v16;
  void *v17;
  void *value;
  _QWORD *v20;
  _QWORD *v21;

  v8 = -[WebFramePolicyListener init](self, "init");
  v9 = v8;
  if (v8)
  {
    v10 = *(_QWORD *)a3.m_ptr;
    if (*(_QWORD *)a3.m_ptr)
    {
      v11 = (unsigned int *)(v10 + 8);
      do
        v12 = __ldaxr(v11);
      while (__stlxr(v12 + 1, v11));
    }
    m_ptr = v8->_frame.m_ptr;
    v8->_frame.m_ptr = (LocalFrame *)v10;
    if (m_ptr)
    {
      v14 = (unsigned int *)((char *)m_ptr + 8);
      do
      {
        v15 = __ldaxr(v14);
        v16 = v15 - 1;
      }
      while (__stlxr(v16, v14));
      if (!v16)
      {
        atomic_store(1u, v14);
        v20 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
        *v20 = off_1E9D6A4D8;
        v20[1] = v14;
        v21 = v20;
        WTF::ensureOnMainThread();
        if (v21)
          (*(void (**)(_QWORD *))(*v21 + 8))(v21);
      }
    }
    v17 = *(void **)a4;
    *(_QWORD *)a4 = 0;
    value = v9->_policyFunction.m_function.m_callableWrapper.__ptr_.__value_;
    v9->_policyFunction.m_function.m_callableWrapper.__ptr_.__value_ = v17;
    if (value)
      (*(void (**)(void *))(*(_QWORD *)value + 8))(value);
    v9->_defaultPolicy = a5;
  }
  return v9;
}

- (WebFramePolicyListener)initWithFrame:(NakedPtr<WebCore:(void *)a4 :(unsigned __int8)a5 LocalFrame>)a3 policyFunction:(id)a6 defaultPolicy:(id)a7 appLinkURL:referrerURL:
{
  WebFramePolicyListener *v9;
  void *m_ptr;
  const WTF::URL *v11;
  void *v12;
  StringImpl *v13;
  void *v14;
  void *v15;
  WTF::StringImpl *v16;
  WTF *v17;
  unsigned int v18;
  unsigned int v19;
  WTF::StringImpl *v20;
  WTF::StringImpl *v22;
  WTF::StringImpl *v23;
  uint64_t v24;
  WTF::StringImpl *v25[5];
  WTF *v26;
  WTF::StringImpl *v27;
  uint64_t v28;
  char v29;

  v28 = *(_QWORD *)a3.m_ptr;
  v9 = -[WebFramePolicyListener initWithFrame:policyFunction:defaultPolicy:](self, "initWithFrame:policyFunction:defaultPolicy:", &v28, a4, a5);
  if (!v9)
    return v9;
  if (a6)
    CFRetain(a6);
  m_ptr = v9->_appLinkURL.m_ptr;
  v9->_appLinkURL.m_ptr = a6;
  if (m_ptr)
    CFRelease(m_ptr);
  MEMORY[0x1D82A38F0](v25, a7);
  WebCore::SecurityOrigin::create((WebCore::SecurityOrigin *)v25, v11);
  WebCore::SecurityOrigin::toURL(v26);
  v12 = (void *)WTF::URL::operator NSURL *();
  v14 = v12;
  if (v12)
    CFRetain(v12);
  v15 = v9->_referrerURL.m_ptr;
  v9->_referrerURL.m_ptr = v14;
  if (v15)
    CFRelease(v15);
  v16 = v27;
  v27 = 0;
  if (!v16)
  {
LABEL_13:
    v17 = v26;
    v26 = 0;
    if (!v17)
      goto LABEL_18;
    goto LABEL_16;
  }
  if (*(_DWORD *)v16 != 2)
  {
    *(_DWORD *)v16 -= 2;
    goto LABEL_13;
  }
  WTF::StringImpl::destroy(v16, v13);
  v17 = v26;
  v26 = 0;
  if (!v17)
    goto LABEL_18;
  do
  {
LABEL_16:
    v18 = __ldaxr((unsigned int *)v17);
    v19 = v18 - 1;
  }
  while (__stlxr(v19, (unsigned int *)v17));
  if (!v19)
  {
    atomic_store(1u, (unsigned int *)v17);
    v22 = (WTF::StringImpl *)*((_QWORD *)v17 + 6);
    *((_QWORD *)v17 + 6) = 0;
    if (v22)
    {
      if (*(_DWORD *)v22 == 2)
        WTF::StringImpl::destroy(v22, v13);
      else
        *(_DWORD *)v22 -= 2;
    }
    v23 = (WTF::StringImpl *)*((_QWORD *)v17 + 5);
    *((_QWORD *)v17 + 5) = 0;
    if (v23)
    {
      if (*(_DWORD *)v23 == 2)
        WTF::StringImpl::destroy(v23, v13);
      else
        *(_DWORD *)v23 -= 2;
    }
    v24 = *((unsigned int *)v17 + 8);
    if ((_DWORD)v24 != -1)
      ((void (*)(char *, char *))off_1E9D6B938[v24])(&v29, (char *)v17 + 8);
    *((_DWORD *)v17 + 8) = -1;
    WTF::fastFree(v17, v13);
    v20 = v25[0];
    v25[0] = 0;
    if (!v20)
      return v9;
    goto LABEL_19;
  }
LABEL_18:
  v20 = v25[0];
  v25[0] = 0;
  if (!v20)
    return v9;
LABEL_19:
  if (*(_DWORD *)v20 != 2)
  {
    *(_DWORD *)v20 -= 2;
    return v9;
  }
  WTF::StringImpl::destroy(v20, v13);
  return v9;
}

- (void)invalidate
{
  LocalFrame *m_ptr;
  unsigned int *v4;
  unsigned int v5;
  unsigned int v6;
  void *value;
  _QWORD *v8;
  _QWORD *v9;

  m_ptr = self->_frame.m_ptr;
  self->_frame.m_ptr = 0;
  if (m_ptr)
  {
    v4 = (unsigned int *)((char *)m_ptr + 8);
    do
    {
      v5 = __ldaxr(v4);
      v6 = v5 - 1;
    }
    while (__stlxr(v6, v4));
    if (!v6)
    {
      atomic_store(1u, v4);
      v8 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
      *v8 = off_1E9D6A4D8;
      v8[1] = v4;
      v9 = v8;
      WTF::ensureOnMainThread();
      if (v9)
        (*(void (**)(_QWORD *))(*v9 + 8))(v9);
    }
  }
  value = self->_policyFunction.m_function.m_callableWrapper.__ptr_.__value_;
  self->_policyFunction.m_function.m_callableWrapper.__ptr_.__value_ = 0;
  if (value)
  {
    (*(void (**)(void *, uint64_t))(*(_QWORD *)value + 16))(value, 2);
    (*(void (**)(void *))(*(_QWORD *)value + 8))(value);
  }
}

- (void)dealloc
{
  objc_class *v3;
  LocalFrame *m_ptr;
  unsigned int *v5;
  unsigned int v6;
  unsigned int v7;
  void *value;
  NSObject *v9;
  int defaultPolicy;
  _QWORD *v11;
  uint64_t v12;
  objc_super v13;
  uint8_t buf[8];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  if ((WebCoreObjCScheduleDeallocateOnMainThread(v3, (objc_object *)self) & 1) == 0)
  {
    m_ptr = self->_frame.m_ptr;
    self->_frame.m_ptr = 0;
    if (m_ptr)
    {
      v5 = (unsigned int *)((char *)m_ptr + 8);
      do
      {
        v6 = __ldaxr(v5);
        v7 = v6 - 1;
      }
      while (__stlxr(v7, v5));
      if (!v7)
      {
        atomic_store(1u, v5);
        v11 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
        *v11 = off_1E9D6A4D8;
        v11[1] = v5;
        *(_QWORD *)buf = v11;
        WTF::ensureOnMainThread();
        v12 = *(_QWORD *)buf;
        *(_QWORD *)buf = 0;
        if (v12)
          (*(void (**)(uint64_t))(*(_QWORD *)v12 + 8))(v12);
      }
    }
    value = self->_policyFunction.m_function.m_callableWrapper.__ptr_.__value_;
    self->_policyFunction.m_function.m_callableWrapper.__ptr_.__value_ = 0;
    if (value)
    {
      v9 = qword_1F0165908;
      if (os_log_type_enabled((os_log_t)qword_1F0165908, OS_LOG_TYPE_ERROR))
      {
        defaultPolicy = self->_defaultPolicy;
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = defaultPolicy;
        _os_log_error_impl(&dword_1D7FB9000, v9, OS_LOG_TYPE_ERROR, "Client application failed to make a policy decision via WebPolicyDecisionListener, using defaultPolicy %hhu", buf, 8u);
      }
      (*(void (**)(void *, _QWORD))(*(_QWORD *)value + 16))(value, self->_defaultPolicy);
      (*(void (**)(void *))(*(_QWORD *)value + 8))(value);
    }
    v13.receiver = self;
    v13.super_class = (Class)WebFramePolicyListener;
    -[WebFramePolicyListener dealloc](&v13, sel_dealloc);
  }
}

- (void)receivedPolicyDecision:(unsigned __int8)a3
{
  LocalFrame *m_ptr;
  void *value;
  unsigned int *v5;
  unsigned int v6;
  unsigned int v7;
  _QWORD *v8;
  _QWORD *v9;

  m_ptr = self->_frame.m_ptr;
  self->_frame.m_ptr = 0;
  if (m_ptr)
  {
    value = self->_policyFunction.m_function.m_callableWrapper.__ptr_.__value_;
    self->_policyFunction.m_function.m_callableWrapper.__ptr_.__value_ = 0;
    if (value)
    {
      (*(void (**)(void *, _QWORD))(*(_QWORD *)value + 16))(value, a3);
      (*(void (**)(void *))(*(_QWORD *)value + 8))(value);
    }
    v5 = (unsigned int *)((char *)m_ptr + 8);
    do
    {
      v6 = __ldaxr(v5);
      v7 = v6 - 1;
    }
    while (__stlxr(v7, v5));
    if (!v7)
    {
      atomic_store(1u, v5);
      v8 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
      *v8 = off_1E9D6A4D8;
      v8[1] = v5;
      v9 = v8;
      WTF::ensureOnMainThread();
      if (v9)
        (*(void (**)(_QWORD *))(*v9 + 8))(v9);
    }
  }
}

- (void)ignore
{
  -[WebFramePolicyListener receivedPolicyDecision:](self, "receivedPolicyDecision:", 2);
}

- (void)download
{
  -[WebFramePolicyListener receivedPolicyDecision:](self, "receivedPolicyDecision:", 1);
}

- (void)use
{
  id v3;
  void *m_ptr;
  _QWORD v5[5];

  if (self->_appLinkURL.m_ptr && self->_frame.m_ptr)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CA5938]);
    objc_msgSend(v3, "setReferrerURL:", self->_referrerURL.m_ptr);
    m_ptr = self->_appLinkURL.m_ptr;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __29__WebFramePolicyListener_use__block_invoke;
    v5[3] = &unk_1E9D6B648;
    v5[4] = self;
    objc_msgSend(MEMORY[0x1E0CA5838], "openWithURL:configuration:completionHandler:", m_ptr, v3, v5);
    if (v3)
      CFRelease(v3);
  }
  else
  {
    -[WebFramePolicyListener receivedPolicyDecision:](self, "receivedPolicyDecision:", 0);
  }
}

uint64_t __29__WebFramePolicyListener_use__block_invoke()
{
  return WebThreadRun();
}

uint64_t __29__WebFramePolicyListener_use__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "receivedPolicyDecision:", 2 * *(unsigned __int8 *)(a1 + 40));
}

- (void)continue
{
  -[WebFramePolicyListener receivedPolicyDecision:](self, "receivedPolicyDecision:", 0);
}

- (void).cxx_destruct
{
  void *m_ptr;
  void *v4;
  void *value;
  LocalFrame *v6;
  unsigned int *v7;
  unsigned int v8;
  unsigned int v9;
  _QWORD *v10;
  _QWORD *v11;

  m_ptr = self->_referrerURL.m_ptr;
  self->_referrerURL.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v4 = self->_appLinkURL.m_ptr;
  self->_appLinkURL.m_ptr = 0;
  if (v4)
    CFRelease(v4);
  value = self->_policyFunction.m_function.m_callableWrapper.__ptr_.__value_;
  self->_policyFunction.m_function.m_callableWrapper.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(void *, SEL))(*(_QWORD *)value + 8))(value, a2);
  v6 = self->_frame.m_ptr;
  self->_frame.m_ptr = 0;
  if (v6)
  {
    v7 = (unsigned int *)((char *)v6 + 8);
    do
    {
      v8 = __ldaxr(v7);
      v9 = v8 - 1;
    }
    while (__stlxr(v9, v7));
    if (!v9)
    {
      atomic_store(1u, v7);
      v10 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
      *v10 = off_1E9D6A4D8;
      v10[1] = v7;
      v11 = v10;
      WTF::ensureOnMainThread();
      if (v11)
        (*(void (**)(_QWORD *))(*v11 + 8))(v11);
    }
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end
