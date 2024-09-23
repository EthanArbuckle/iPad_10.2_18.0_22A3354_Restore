@implementation WebFramePrivate

- (void)setWebFrameView:(id)a3
{
  void *m_ptr;

  if (a3)
    CFRetain(a3);
  m_ptr = self->webFrameView.m_ptr;
  self->webFrameView.m_ptr = a3;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (void).cxx_destruct
{
  void *m_ptr;
  void *v4;
  WTF *value;
  uint64_t v6;
  uint64_t v7;
  int v8;
  unsigned int v9;
  unsigned int v10;
  WebScriptDebugger *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  WTF *v17;
  void *v18;
  void *v19;

  m_ptr = self->provisionalURL.m_ptr;
  self->provisionalURL.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v4 = self->url.m_ptr;
  self->url.m_ptr = 0;
  if (v4)
    CFRelease(v4);
  value = (WTF *)self->captionPreferencesTestingModeToken.__ptr_.__value_;
  self->captionPreferencesTestingModeToken.__ptr_.__value_ = 0;
  if (value)
  {
    v6 = *(_QWORD *)value;
    if (*(_QWORD *)value)
    {
      v7 = *(_QWORD *)(v6 + 8);
      if (v7)
      {
        v8 = *(_DWORD *)(v7 + 136);
        if (v8)
          *(_DWORD *)(v7 + 136) = v8 - 1;
      }
      *(_QWORD *)value = 0;
      do
      {
        v9 = __ldaxr((unsigned int *)v6);
        v10 = v9 - 1;
      }
      while (__stlxr(v10, (unsigned int *)v6));
      if (!v10)
      {
        atomic_store(1u, (unsigned int *)v6);
        WTF::fastFree((WTF *)v6, (void *)a2);
      }
    }
    else
    {
      *(_QWORD *)value = 0;
    }
    WTF::fastFree(value, (void *)a2);
  }
  v11 = self->scriptDebugger.__ptr_.__value_;
  self->scriptDebugger.__ptr_.__value_ = 0;
  if (v11)
  {
    v12 = *((_QWORD *)v11 + 30);
    if (v12)
    {
      v13 = (uint64_t *)(v12 - 16);
      v14 = *(_QWORD *)(((v12 - 16) & 0xFFFFFFFFFFFFF000) + 0x10);
      v15 = *(uint64_t **)(v12 - 8);
      if (v15)
      {
        v16 = *v13;
        *v15 = *v13;
        *(_QWORD *)(v16 + 8) = v15;
        *v13 = 0;
        v13[1] = 0;
      }
      *v13 = *(_QWORD *)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;
      *((_QWORD *)v11 + 30) = 0;
    }
    JSC::Debugger::~Debugger((JSC::Debugger *)v11);
    WTF::fastFree(v17, v18);
  }
  v19 = self->webFrameView.m_ptr;
  self->webFrameView.m_ptr = 0;
  if (v19)
    CFRelease(v19);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 8) = 0;
  return self;
}

@end
