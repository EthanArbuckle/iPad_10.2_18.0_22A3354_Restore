@implementation SKDelegateResponseQueue

- (SKDelegateResponseQueue)initWithQueue:(id)a3
{
  id v5;
  SKDelegateResponseQueue *v6;
  SKDelegateResponseQueue *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKDelegateResponseQueue;
  v6 = -[SKDelegateResponseQueue init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dispatchQueue, a3);

  return v7;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
