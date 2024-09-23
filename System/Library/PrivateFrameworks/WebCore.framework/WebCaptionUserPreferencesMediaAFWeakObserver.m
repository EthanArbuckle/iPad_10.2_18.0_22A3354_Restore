@implementation WebCaptionUserPreferencesMediaAFWeakObserver

- (WebCaptionUserPreferencesMediaAFWeakObserver)initWithWeakPtr:(void *)a3
{
  WebCaptionUserPreferencesMediaAFWeakObserver *v4;
  void *v5;
  WebCaptionUserPreferencesMediaAFWeakObserver *v6;
  DefaultWeakPtrImpl *v7;
  unsigned int *m_ptr;
  unsigned int v9;
  unsigned int v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)WebCaptionUserPreferencesMediaAFWeakObserver;
  v4 = -[WebCaptionUserPreferencesMediaAFWeakObserver init](&v12, sel_init);
  v6 = v4;
  if (v4)
  {
    v7 = *(DefaultWeakPtrImpl **)a3;
    *(_QWORD *)a3 = 0;
    m_ptr = (unsigned int *)v4->m_weakPtr.m_impl.m_ptr;
    v6->m_weakPtr.m_impl.m_ptr = v7;
    if (m_ptr)
    {
      do
      {
        v9 = __ldaxr(m_ptr);
        v10 = v9 - 1;
      }
      while (__stlxr(v10, m_ptr));
      if (!v10)
      {
        atomic_store(1u, m_ptr);
        WTF::fastFree((WTF *)m_ptr, v5);
      }
    }
  }
  return v6;
}

- (void).cxx_destruct
{
  unsigned int *m_ptr;
  unsigned int v4;
  unsigned int v5;

  m_ptr = (unsigned int *)self->m_weakPtr.m_impl.m_ptr;
  self->m_weakPtr.m_impl.m_ptr = 0;
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
