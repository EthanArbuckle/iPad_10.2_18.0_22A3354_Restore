@implementation WebCoreSharedBufferData

- (unint64_t)length
{
  return self->_size;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

- (const)bytes
{
  DataSegment *m_ptr;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t position;
  WebCore::CachedResource *v11;
  char v12;
  char *v13;

  m_ptr = self->_dataSegment.m_ptr;
  v3 = *((unsigned int *)m_ptr + 6);
  if ((_DWORD)v3 != -1)
  {
    v13 = &v12;
    v5 = ((uint64_t (*)(char **, char *))__const__ZNSt3__116__variant_detail12__visitation6__base11__visit_altB8sn180100INS1_9__variant15__value_visitorIRN3WTF7VisitorIZNK7WebCore11DataSegment4dataEvE3__0JZNKS9_4dataEvE3__1ZNKS9_4dataEvE3__2ZNKS9_4dataEvE3__3EEEEEJRKNS0_6__implIJNS6_6VectorIhLm0ENS6_15CrashOnOverflowELm16ENS6_10FastMallocEEENS6_9RetainPtrIPK8__CFDataEENS6_14FileSystemImpl14MappedFileDataENS9_8ProviderEEEEEEEDcOT_DpOT0____fmatrix[v3])(&v13, (char *)m_ptr + 8);
    v6 = *((unsigned int *)m_ptr + 6);
    if ((_DWORD)v6 != -1)
    {
      v7 = v5;
      v13 = &v12;
      v8 = ((uint64_t (*)(char **, char *))__const__ZNSt3__116__variant_detail12__visitation6__base11__visit_altB8sn180100INS1_9__variant15__value_visitorIRN3WTF7VisitorIZNK7WebCore11DataSegment4sizeEvE3__0JZNKS9_4sizeEvE3__1ZNKS9_4sizeEvE3__2ZNKS9_4sizeEvE3__3EEEEEJRKNS0_6__implIJNS6_6VectorIhLm0ENS6_15CrashOnOverflowELm16ENS6_10FastMallocEEENS6_9RetainPtrIPK8__CFDataEENS6_14FileSystemImpl14MappedFileDataENS9_8ProviderEEEEEEEDcOT_DpOT0____fmatrix[v6])(&v13, (char *)m_ptr + 8);
      position = self->_position;
      if (v8 >= position)
        return (const void *)(v7 + position);
      __break(1u);
    }
  }
  v11 = (WebCore::CachedResource *)std::__throw_bad_variant_access[abi:sn180100]();
  return WebCore::CachedResource::restartDecodedDataDeletionTimer(v11);
}

- (WebCoreSharedBufferData)initWithDataSegment:(const void *)a3 position:(unint64_t)a4 size:(unint64_t)a5
{
  WebCoreSharedBufferData *v8;
  void *v9;
  unsigned int v10;
  unsigned int *m_ptr;
  unsigned int v12;
  unsigned int v13;
  uint64_t v15;
  objc_super v16;
  char v17;

  v16.receiver = self;
  v16.super_class = (Class)WebCoreSharedBufferData;
  v8 = -[WebCoreSharedBufferData init](&v16, sel_init);
  if (v8)
  {
    if (WebCore::DataSegment::size((WebCore::DataSegment *)a3) < a4)
    {
      __break(0xC471u);
      JUMPOUT(0x19415EF7CLL);
    }
    if (WebCore::DataSegment::size((WebCore::DataSegment *)a3) - a4 < a5)
    {
      __break(0xC471u);
      JUMPOUT(0x19415EF9CLL);
    }
    do
      v10 = __ldaxr((unsigned int *)a3);
    while (__stlxr(v10 + 1, (unsigned int *)a3));
    m_ptr = (unsigned int *)v8->_dataSegment.m_ptr;
    v8->_dataSegment.m_ptr = (DataSegment *)a3;
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
        v15 = m_ptr[6];
        if ((_DWORD)v15 != -1)
          ((void (*)(char *, unsigned int *))off_1E3347178[v15])(&v17, m_ptr + 2);
        m_ptr[6] = -1;
        WTF::fastFree((WTF *)m_ptr, v9);
      }
    }
    v8->_position = a4;
    v8->_size = a5;
  }
  return v8;
}

- (void).cxx_destruct
{
  DataSegment *m_ptr;
  unsigned int v3;
  unsigned int v4;
  uint64_t v5;
  char v6;

  m_ptr = self->_dataSegment.m_ptr;
  self->_dataSegment.m_ptr = 0;
  if (m_ptr)
  {
    do
    {
      v3 = __ldaxr((unsigned int *)m_ptr);
      v4 = v3 - 1;
    }
    while (__stlxr(v4, (unsigned int *)m_ptr));
    if (!v4)
    {
      atomic_store(1u, (unsigned int *)m_ptr);
      v5 = *((unsigned int *)m_ptr + 6);
      if ((_DWORD)v5 != -1)
        ((void (*)(char *, char *))off_1E3347178[v5])(&v6, (char *)m_ptr + 8);
      *((_DWORD *)m_ptr + 6) = -1;
      WTF::fastFree((WTF *)m_ptr, (void *)a2);
    }
  }
}

- (void)dealloc
{
  WTF *v3;
  _QWORD *v4;
  _QWORD *v5;
  objc_super v6;
  _QWORD *v7;

  v3 = (WTF *)objc_opt_class();
  if ((WTF::isMainThread(v3) & 1) != 0)
  {
    v6.receiver = self;
    v6.super_class = (Class)WebCoreSharedBufferData;
    -[WebCoreSharedBufferData dealloc](&v6, sel_dealloc);
  }
  else
  {
    v4 = (_QWORD *)WTF::fastMalloc((WTF *)0x18);
    *v4 = off_1E3357AF0;
    v4[1] = v3;
    v4[2] = self;
    v7 = v4;
    WTF::callOnMainThread();
    v5 = v7;
    v7 = 0;
    if (v5)
      (*(void (**)(_QWORD *))(*v5 + 8))(v5);
  }
}

@end
