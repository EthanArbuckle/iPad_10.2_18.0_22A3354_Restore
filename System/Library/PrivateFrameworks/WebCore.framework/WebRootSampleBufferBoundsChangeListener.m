@implementation WebRootSampleBufferBoundsChangeListener

- (WebRootSampleBufferBoundsChangeListener)initWithCallback:(void *)a3
{
  WebRootSampleBufferBoundsChangeListener *v4;
  WebRootSampleBufferBoundsChangeListener *v5;
  void *v6;
  void *value;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WebRootSampleBufferBoundsChangeListener;
  v4 = -[WebRootSampleBufferBoundsChangeListener init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v6 = *(void **)a3;
    *(_QWORD *)a3 = 0;
    value = v4->_callback.m_callableWrapper.__ptr_.__value_;
    v5->_callback.m_callableWrapper.__ptr_.__value_ = v6;
    if (value)
      (*(void (**)(void *))(*(_QWORD *)value + 8))(value);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[WebRootSampleBufferBoundsChangeListener invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)WebRootSampleBufferBoundsChangeListener;
  -[WebRootSampleBufferBoundsChangeListener dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  void *value;

  -[WebRootSampleBufferBoundsChangeListener stop](self, "stop");
  value = self->_callback.m_callableWrapper.__ptr_.__value_;
  self->_callback.m_callableWrapper.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(void *))(*(_QWORD *)value + 8))(value);
}

- (void)begin:(id)a3
{
  id v3;
  void *m_ptr;

  v3 = a3;
  if (a3)
    CFRetain(a3);
  m_ptr = self->_rootLayer.m_ptr;
  self->_rootLayer.m_ptr = v3;
  if (m_ptr)
  {
    CFRelease(m_ptr);
    v3 = self->_rootLayer.m_ptr;
  }
  objc_msgSend(v3, "addObserver:forKeyPath:options:context:", self, CFSTR("bounds"), 1, 0);
}

- (void)stop
{
  void *m_ptr;
  void *v4;

  m_ptr = self->_rootLayer.m_ptr;
  if (m_ptr)
  {
    objc_msgSend(m_ptr, "removeObserver:forKeyPath:", self, CFSTR("bounds"));
    v4 = self->_rootLayer.m_ptr;
    self->_rootLayer.m_ptr = 0;
    if (v4)
      CFRelease(v4);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  _QWORD *v9;
  _QWORD *v10;

  if ((objc_msgSend((id)objc_msgSend(a5, "valueForKey:", *MEMORY[0x1E0CB2CC0]), "BOOLValue") & 1) == 0
    && self->_rootLayer.m_ptr == a4
    && objc_msgSend(a3, "isEqualToString:", CFSTR("bounds")))
  {
    CFRetain(self);
    v9 = (_QWORD *)WTF::fastMalloc((WTF *)0x10);
    *v9 = &off_1E3206350;
    v9[1] = self;
    v10 = v9;
    WTF::ensureOnMainThread();
    if (v10)
      (*(void (**)(_QWORD *))(*v10 + 8))(v10);
  }
}

- (void).cxx_destruct
{
  void *m_ptr;
  void *value;
  WebRootSampleBufferBoundsChangeListener *v4;

  m_ptr = self->_rootLayer.m_ptr;
  self->_rootLayer.m_ptr = 0;
  if (m_ptr)
  {
    v4 = self;
    CFRelease(m_ptr);
    self = v4;
  }
  value = self->_callback.m_callableWrapper.__ptr_.__value_;
  self->_callback.m_callableWrapper.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(void *))(*(_QWORD *)value + 8))(value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

- (_QWORD)observeValueForKeyPath:(_QWORD *)a1 ofObject:change:context:
{
  const void *v2;

  v2 = (const void *)a1[1];
  *a1 = &off_1E3206350;
  a1[1] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

- (uint64_t)observeValueForKeyPath:(WTF *)this ofObject:(void *)a2 change:context:
{
  const void *v3;

  v3 = (const void *)*((_QWORD *)this + 1);
  *(_QWORD *)this = &off_1E3206350;
  *((_QWORD *)this + 1) = 0;
  if (v3)
    CFRelease(v3);
  return WTF::fastFree(this, a2);
}

- (uint64_t)observeValueForKeyPath:(uint64_t)a1 ofObject:change:context:
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 16))(result);
  return result;
}

@end
