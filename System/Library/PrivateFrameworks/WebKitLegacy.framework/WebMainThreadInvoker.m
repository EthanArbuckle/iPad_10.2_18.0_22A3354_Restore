@implementation WebMainThreadInvoker

- (WebMainThreadInvoker)initWithTarget:(id)a3
{
  self->target = a3;
  return self;
}

- (void)forwardInvocation:(id)a3
{
  void *m_ptr;
  CFTypeRef v6;
  id v7;
  CFTypeRef cf;

  objc_msgSend(a3, "setTarget:", self->target);
  objc_msgSend(a3, "performSelectorOnMainThread:withObject:waitUntilDone:", sel__webkit_invokeAndHandleException_, self, 1);
  m_ptr = self->exception.m_ptr;
  if (m_ptr)
  {
    self->exception.m_ptr = 0;
    v7 = (id)CFMakeCollectable(m_ptr);
    objc_exception_throw(v7);
  }
  if (strchr((char *)objc_msgSend((id)objc_msgSend(a3, "methodSignature"), "methodReturnType"), 64))
  {
    cf = 0;
    objc_msgSend(a3, "getReturnValue:", &cf);
    v6 = (id)CFMakeCollectable(cf);
  }
}

- (id)methodSignatureForSelector:(SEL)a3
{
  return (id)objc_msgSend(self->target, "methodSignatureForSelector:", a3);
}

- (void)handleException:(id)a3
{
  void *m_ptr;

  if (a3)
    CFRetain(a3);
  m_ptr = self->exception.m_ptr;
  self->exception.m_ptr = a3;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (void).cxx_destruct
{
  void *m_ptr;

  m_ptr = self->exception.m_ptr;
  self->exception.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
