@implementation WebCoreFPSContentKeySessionDelegate

- (WebCoreFPSContentKeySessionDelegate)initWithParent:(void *)a3
{
  void *v4;
  WebCoreFPSContentKeySessionDelegate *v5;
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
  v15.super_class = (Class)WebCoreFPSContentKeySessionDelegate;
  v5 = -[WebCoreFPSContentKeySessionDelegate init](&v15, sel_init);
  if (v5)
  {
    v6 = *((_QWORD *)a3 + 1);
    if (v6)
      goto LABEL_16;
    v6 = WTF::fastCompactMalloc((WTF *)0x10);
    *(_DWORD *)v6 = 1;
    *(_QWORD *)(v6 + 8) = a3;
    v7 = (unsigned int *)*((_QWORD *)a3 + 1);
    *((_QWORD *)a3 + 1) = v6;
    if (!v7)
      goto LABEL_16;
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
LABEL_16:
      do
        v10 = __ldaxr((unsigned int *)v6);
      while (__stlxr(v10 + 1, (unsigned int *)v6));
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

- (void)contentKeySession:(id)a3 didProvideContentKeyRequest:(id)a4
{
  DefaultWeakPtrImpl *m_ptr;
  uint64_t v5;

  m_ptr = self->_parent.m_impl.m_ptr;
  if (m_ptr)
  {
    v5 = *((_QWORD *)m_ptr + 1);
    if (v5)
      (*(void (**)(uint64_t, id))(*(_QWORD *)v5 + 16))(v5, a4);
  }
}

- (void)contentKeySession:(id)a3 didProvideRenewingContentKeyRequest:(id)a4
{
  DefaultWeakPtrImpl *m_ptr;
  uint64_t v5;

  m_ptr = self->_parent.m_impl.m_ptr;
  if (m_ptr)
  {
    v5 = *((_QWORD *)m_ptr + 1);
    if (v5)
      (*(void (**)(uint64_t, id))(*(_QWORD *)v5 + 32))(v5, a4);
  }
}

- (void)contentKeySession:(id)a3 didProvidePersistableContentKeyRequest:(id)a4
{
  DefaultWeakPtrImpl *m_ptr;
  uint64_t v5;

  m_ptr = self->_parent.m_impl.m_ptr;
  if (m_ptr)
  {
    v5 = *((_QWORD *)m_ptr + 1);
    if (v5)
      (*(void (**)(uint64_t, id))(*(_QWORD *)v5 + 40))(v5, a4);
  }
}

- (void)contentKeySession:(id)a3 didProvideContentKeyRequests:(id)a4 forInitializationData:(id)a5
{
  DefaultWeakPtrImpl *m_ptr;
  unint64_t v8;
  void *v9;
  WTF *v10;
  uint64_t v11;
  const void *v12;
  WTF *v13;
  _QWORD v14[5];
  WTF *v15;
  uint64_t v16;

  m_ptr = self->_parent.m_impl.m_ptr;
  if (m_ptr && *((_QWORD *)m_ptr + 1))
  {
    v15 = 0;
    v16 = 0;
    v8 = objc_msgSend(a4, "count", a3);
    if (v8)
    {
      if (v8 >> 29)
      {
        __break(0xC471u);
        return;
      }
      LODWORD(v16) = v8;
      v15 = (WTF *)WTF::fastMalloc((WTF *)(8 * v8));
    }
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3321888768;
    v14[2] = __108__WebCoreFPSContentKeySessionDelegate_contentKeySession_didProvideContentKeyRequests_forInitializationData___block_invoke;
    v14[3] = &__block_descriptor_40_e8_32c122_ZTSKZ108__WebCoreFPSContentKeySessionDelegate_contentKeySession_didProvideContentKeyRequests_forInitializationData__E3__0_e36_v32__0__AVContentKeyRequest_8Q16_B24l;
    v14[4] = &v15;
    objc_msgSend(a4, "enumerateObjectsUsingBlock:", v14);
    (*(void (**)(_QWORD, WTF **))(**((_QWORD **)self->_parent.m_impl.m_ptr + 1) + 24))(*((_QWORD *)self->_parent.m_impl.m_ptr + 1), &v15);
    if (HIDWORD(v16))
    {
      v10 = v15;
      v11 = 8 * HIDWORD(v16);
      do
      {
        v12 = *(const void **)v10;
        *(_QWORD *)v10 = 0;
        if (v12)
          CFRelease(v12);
        v10 = (WTF *)((char *)v10 + 8);
        v11 -= 8;
      }
      while (v11);
    }
    v13 = v15;
    if (v15)
    {
      v15 = 0;
      LODWORD(v16) = 0;
      WTF::fastFree(v13, v9);
    }
  }
}

void __108__WebCoreFPSContentKeySessionDelegate_contentKeySession_didProvideContentKeyRequests_forInitializationData___block_invoke(uint64_t a1, const void *a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  WTF *v8;
  void *v9;
  WTF *v10;
  uint64_t v11;
  WTF *v12;
  const void *v13;
  const void *v14;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(unsigned int *)(v3 + 12);
  if ((_DWORD)v4 != *(_DWORD *)(v3 + 8))
  {
    *(_QWORD *)(*(_QWORD *)v3 + 8 * v4) = a2;
    if (!a2)
    {
LABEL_23:
      *(_DWORD *)(v3 + 12) = v4 + 1;
      return;
    }
LABEL_22:
    CFRetain(a2);
    LODWORD(v4) = *(_DWORD *)(v3 + 12);
    goto LABEL_23;
  }
  v5 = v4 + (v4 >> 2);
  if (v5 >= 0x10)
    v6 = v5 + 1;
  else
    v6 = 16;
  if (v6 <= v4 + 1)
    v7 = v4 + 1;
  else
    v7 = v6;
  if (!(v7 >> 29))
  {
    v8 = *(WTF **)v3;
    v10 = (WTF *)WTF::fastMalloc((WTF *)(8 * v7));
    *(_DWORD *)(v3 + 8) = v7;
    *(_QWORD *)v3 = v10;
    if ((_DWORD)v4)
    {
      v11 = 8 * v4;
      v12 = v8;
      do
      {
        v13 = *(const void **)v12;
        *(_QWORD *)v12 = 0;
        *(_QWORD *)v10 = v13;
        v14 = *(const void **)v12;
        *(_QWORD *)v12 = 0;
        if (v14)
          CFRelease(v14);
        v10 = (WTF *)((char *)v10 + 8);
        v12 = (WTF *)((char *)v12 + 8);
        v11 -= 8;
      }
      while (v11);
      v10 = *(WTF **)v3;
    }
    if (v8)
    {
      if (v10 == v8)
      {
        *(_QWORD *)v3 = 0;
        *(_DWORD *)(v3 + 8) = 0;
      }
      WTF::fastFree(v8, v9);
      v10 = *(WTF **)v3;
    }
    v4 = *(unsigned int *)(v3 + 12);
    *((_QWORD *)v10 + v4) = a2;
    if (!a2)
      goto LABEL_23;
    goto LABEL_22;
  }
  __break(0xC471u);
}

- (void)contentKeySession:(id)a3 contentKeyRequest:(id)a4 didFailWithError:(id)a5
{
  DefaultWeakPtrImpl *m_ptr;
  uint64_t v6;

  m_ptr = self->_parent.m_impl.m_ptr;
  if (m_ptr)
  {
    v6 = *((_QWORD *)m_ptr + 1);
    if (v6)
      (*(void (**)(uint64_t, id, id))(*(_QWORD *)v6 + 48))(v6, a4, a5);
  }
}

- (void)contentKeySession:(id)a3 contentKeyRequestDidSucceed:(id)a4
{
  DefaultWeakPtrImpl *m_ptr;
  uint64_t v5;

  m_ptr = self->_parent.m_impl.m_ptr;
  if (m_ptr)
  {
    v5 = *((_QWORD *)m_ptr + 1);
    if (v5)
      (*(void (**)(uint64_t, id))(*(_QWORD *)v5 + 56))(v5, a4);
  }
}

- (BOOL)contentKeySession:(id)a3 shouldRetryContentKeyRequest:(id)a4 reason:(id)a5
{
  DefaultWeakPtrImpl *m_ptr;
  uint64_t v6;

  m_ptr = self->_parent.m_impl.m_ptr;
  if (m_ptr && (v6 = *((_QWORD *)m_ptr + 1)) != 0)
    return (*(uint64_t (**)(uint64_t, id, id))(*(_QWORD *)v6 + 64))(v6, a4, a5);
  else
    return 0;
}

- (void)contentKeySessionContentProtectionSessionIdentifierDidChange:(id)a3
{
  DefaultWeakPtrImpl *m_ptr;
  uint64_t v4;

  m_ptr = self->_parent.m_impl.m_ptr;
  if (m_ptr)
  {
    v4 = *((_QWORD *)m_ptr + 1);
    if (v4)
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v4 + 72))(v4, objc_msgSend(a3, "contentProtectionSessionIdentifier"));
  }
}

- (void)contentKeySession:(id)a3 contentProtectionSessionIdentifierDidChangeForReportGroup:(id)a4
{
  DefaultWeakPtrImpl *m_ptr;
  uint64_t v5;

  m_ptr = self->_parent.m_impl.m_ptr;
  if (m_ptr)
  {
    v5 = *((_QWORD *)m_ptr + 1);
    if (v5)
      (*(void (**)(uint64_t, id, uint64_t))(*(_QWORD *)v5 + 80))(v5, a4, objc_msgSend(a4, "contentProtectionSessionIdentifier", a3));
  }
}

- (void)contentKeySession:(id)a3 externalProtectionStatusDidChangeForContentKey:(id)a4
{
  DefaultWeakPtrImpl *m_ptr;
  uint64_t v5;

  m_ptr = self->_parent.m_impl.m_ptr;
  if (m_ptr)
  {
    v5 = *((_QWORD *)m_ptr + 1);
    if (v5)
      (*(void (**)(uint64_t, id))(*(_QWORD *)v5 + 96))(v5, a4);
  }
}

- (void)contentKeySession:(id)a3 externalProtectionStatusDidChangeForContentKeyRequest:(id)a4
{
  DefaultWeakPtrImpl *m_ptr;
  uint64_t v5;

  m_ptr = self->_parent.m_impl.m_ptr;
  if (m_ptr)
  {
    v5 = *((_QWORD *)m_ptr + 1);
    if (v5)
      (*(void (**)(uint64_t, id))(*(_QWORD *)v5 + 104))(v5, a4);
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

@end
