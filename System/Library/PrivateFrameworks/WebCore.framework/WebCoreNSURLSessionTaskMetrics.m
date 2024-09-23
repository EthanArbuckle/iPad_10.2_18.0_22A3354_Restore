@implementation WebCoreNSURLSessionTaskMetrics

- (id)_initWithMetrics:(void *)a3 onTarget:(RefCountedSerialFunctionDispatcher *)a4
{
  WebCoreNSURLSessionTaskMetrics *v6;
  RefCountedSerialFunctionDispatcher *m_ptr;
  id v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WebCoreNSURLSessionTaskMetrics;
  v6 = -[WebCoreNSURLSessionTaskMetrics init](&v11, sel_init);
  if (v6)
  {
    if (a4)
      (*((void (**)(RefCountedSerialFunctionDispatcher *))a4->var0 + 4))(a4);
    m_ptr = v6->_targetDispatcher.m_ptr;
    v6->_targetDispatcher.m_ptr = a4;
    if (m_ptr)
      (*((void (**)(RefCountedSerialFunctionDispatcher *))m_ptr->var0 + 5))(m_ptr);
    v8 = -[WebCoreNSURLSessionTaskTransactionMetrics _initWithMetrics:onTarget:]([WebCoreNSURLSessionTaskTransactionMetrics alloc], "_initWithMetrics:onTarget:", a3, a4);
    v9 = v6->_transactionMetrics.m_ptr;
    v6->_transactionMetrics.m_ptr = v8;
    if (v9)
      CFRelease(v9);
  }
  return v6;
}

- (void)dealloc
{
  RefCountedSerialFunctionDispatcher *v3;
  void *m_ptr;
  _QWORD *v5;
  _QWORD *v6;
  objc_super v7;
  _QWORD *v8;

  m_ptr = self->_transactionMetrics.m_ptr;
  v3 = self->_targetDispatcher.m_ptr;
  self->_transactionMetrics.m_ptr = 0;
  v5 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
  *v5 = &off_1E3485C38;
  v5[1] = m_ptr;
  v8 = v5;
  (*((void (**)(RefCountedSerialFunctionDispatcher *, _QWORD **))v3->var0 + 2))(v3, &v8);
  v6 = v8;
  v8 = 0;
  if (v6)
    (*(void (**)(_QWORD *))(*v6 + 8))(v6);
  v7.receiver = self;
  v7.super_class = (Class)WebCoreNSURLSessionTaskMetrics;
  -[WebCoreNSURLSessionTaskMetrics dealloc](&v7, sel_dealloc);
}

- (NSArray)transactionMetrics
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = self->_transactionMetrics.m_ptr;
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
}

- (void).cxx_destruct
{
  RefCountedSerialFunctionDispatcher *m_ptr;
  void *v4;

  m_ptr = self->_targetDispatcher.m_ptr;
  self->_targetDispatcher.m_ptr = 0;
  if (m_ptr)
    (*((void (**)(RefCountedSerialFunctionDispatcher *, SEL))m_ptr->var0 + 5))(m_ptr, a2);
  v4 = self->_transactionMetrics.m_ptr;
  self->_transactionMetrics.m_ptr = 0;
  if (v4)
    CFRelease(v4);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

- (_QWORD)dealloc
{
  const void *v2;

  v2 = (const void *)a1[1];
  *a1 = &off_1E3485C38;
  a1[1] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

- (uint64_t)dealloc
{
  const void *v3;

  v3 = (const void *)*((_QWORD *)this + 1);
  *(_QWORD *)this = &off_1E3485C38;
  *((_QWORD *)this + 1) = 0;
  if (v3)
    CFRelease(v3);
  return WTF::fastFree(this, a2);
}

@end
