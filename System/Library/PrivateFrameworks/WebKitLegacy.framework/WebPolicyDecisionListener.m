@implementation WebPolicyDecisionListener

- (id)_initWithTarget:(id)a3 action:(SEL)a4
{
  WebPolicyDecisionListener *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WebPolicyDecisionListener;
  v6 = -[WebPolicyDecisionListener init](&v8, sel_init);
  if (v6)
    v6->_private = -[WebPolicyDecisionListenerPrivate initWithTarget:action:]([WebPolicyDecisionListenerPrivate alloc], "initWithTarget:action:", a3, a4);
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WebPolicyDecisionListener;
  -[WebPolicyDecisionListener dealloc](&v3, sel_dealloc);
}

- (void)_usePolicy:(unsigned __int8)a3
{
  WebPolicyDecisionListenerPrivate *v3;
  void *m_ptr;

  v3 = self->_private;
  m_ptr = v3->target.m_ptr;
  if (m_ptr)
    objc_msgSend(m_ptr, v3->action, a3);
}

- (void)_invalidate
{
  WebPolicyDecisionListenerPrivate *v2;
  void *m_ptr;

  v2 = self->_private;
  m_ptr = v2->target.m_ptr;
  v2->target.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (void)use
{
  -[WebPolicyDecisionListener _usePolicy:](self, "_usePolicy:", 0);
}

- (void)ignore
{
  -[WebPolicyDecisionListener _usePolicy:](self, "_usePolicy:", 2);
}

- (void)download
{
  -[WebPolicyDecisionListener _usePolicy:](self, "_usePolicy:", 1);
}

@end
