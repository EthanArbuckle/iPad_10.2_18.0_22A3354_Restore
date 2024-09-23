@implementation WebPreviewConverterDelegate

- (WebPreviewConverterDelegate)initWithDelegate:(void *)a3
{
  void *v4;
  WebPreviewConverterDelegate *v5;
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
  v15.super_class = (Class)WebPreviewConverterDelegate;
  v5 = -[WebPreviewConverterDelegate init](&v15, sel_init);
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
    m_ptr = (unsigned int *)v5->_delegate.m_impl.m_ptr;
    v5->_delegate.m_impl.m_ptr = (DefaultWeakPtrImpl *)v6;
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

- (void)connection:(id)a3 didReceiveData:(id)a4 lengthReceived:(int64_t)a5
{
  DefaultWeakPtrImpl *m_ptr;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  WebCore::FragmentedSharedBuffer *v9;

  v9 = (WebCore::FragmentedSharedBuffer *)a4;
  m_ptr = self->_delegate.m_impl.m_ptr;
  if (m_ptr)
  {
    v6 = *((_QWORD *)m_ptr + 1);
    if (v6)
    {
      WebCore::SharedBuffer::create<NSData *&>(&v9, &v8);
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v6 + 16))(v6, v8);
      WTF::Ref<WebCore::SharedBuffer,WTF::RawPtrTraits<WebCore::SharedBuffer>,WTF::DefaultRefDerefTraits<WebCore::SharedBuffer>>::~Ref(&v8, v7);
    }
  }
}

- (void)connectionDidFinishLoading:(id)a3
{
  DefaultWeakPtrImpl *m_ptr;
  uint64_t v4;

  m_ptr = self->_delegate.m_impl.m_ptr;
  if (m_ptr)
  {
    v4 = *((_QWORD *)m_ptr + 1);
    if (v4)
      (*(void (**)(uint64_t))(*(_QWORD *)v4 + 24))(v4);
  }
}

- (void)connection:(id)a3 didFailWithError:(id)a4
{
  DefaultWeakPtrImpl *m_ptr;
  uint64_t v5;
  WTF::StringImpl *v6;
  CFTypeRef v7;
  WTF::StringImpl *v8;
  WTF::StringImpl *v9;
  WTF::StringImpl *v10;
  WTF::StringImpl *v11;
  WTF::StringImpl *v12;
  WTF::StringImpl *v13;
  CFTypeRef cf;

  m_ptr = self->_delegate.m_impl.m_ptr;
  if (m_ptr)
  {
    v5 = *((_QWORD *)m_ptr + 1);
    if (v5)
    {
      WebCore::ResourceError::ResourceError((WebCore::ResourceError *)&v11, (NSError *)a4);
      (*(void (**)(uint64_t, WTF::StringImpl **))(*(_QWORD *)v5 + 32))(v5, &v11);
      v7 = cf;
      cf = 0;
      if (v7)
        CFRelease(v7);
      v8 = v13;
      v13 = 0;
      if (v8)
      {
        if (*(_DWORD *)v8 == 2)
          WTF::StringImpl::destroy(v8, v6);
        else
          *(_DWORD *)v8 -= 2;
      }
      v9 = v12;
      v12 = 0;
      if (v9)
      {
        if (*(_DWORD *)v9 == 2)
          WTF::StringImpl::destroy(v9, v6);
        else
          *(_DWORD *)v9 -= 2;
      }
      v10 = v11;
      v11 = 0;
      if (v10)
      {
        if (*(_DWORD *)v10 == 2)
          WTF::StringImpl::destroy(v10, v6);
        else
          *(_DWORD *)v10 -= 2;
      }
    }
  }
}

- (void).cxx_destruct
{
  unsigned int *m_ptr;
  unsigned int v4;
  unsigned int v5;

  m_ptr = (unsigned int *)self->_delegate.m_impl.m_ptr;
  self->_delegate.m_impl.m_ptr = 0;
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
