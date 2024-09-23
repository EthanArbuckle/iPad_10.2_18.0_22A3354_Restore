@implementation WebPolicyDecisionListenerPrivate

- (WebPolicyDecisionListenerPrivate)initWithTarget:(id)a3 action:(SEL)a4
{
  WebPolicyDecisionListenerPrivate *v6;
  void *m_ptr;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WebPolicyDecisionListenerPrivate;
  v6 = -[WebPolicyDecisionListenerPrivate init](&v9, sel_init);
  if (v6)
  {
    if (a3)
      CFRetain(a3);
    m_ptr = v6->target.m_ptr;
    v6->target.m_ptr = a3;
    if (m_ptr)
      CFRelease(m_ptr);
    v6->action = a4;
  }
  return v6;
}

- (void).cxx_destruct
{
  void *m_ptr;

  m_ptr = self->target.m_ptr;
  self->target.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
