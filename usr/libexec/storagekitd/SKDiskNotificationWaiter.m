@implementation SKDiskNotificationWaiter

- (SKDiskNotificationWaiter)initWithDiskIdentifier:(id)a3
{
  id v5;
  SKDiskNotificationWaiter *v6;
  SKDiskNotificationWaiter *v7;
  dispatch_semaphore_t v8;
  OS_dispatch_semaphore *semaphore;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SKDiskNotificationWaiter;
  v6 = -[SKDiskNotificationWaiter init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_expectedDiskIdentifier, a3);
    v8 = dispatch_semaphore_create(0);
    semaphore = v7->_semaphore;
    v7->_semaphore = (OS_dispatch_semaphore *)v8;

  }
  return v7;
}

- (NSString)expectedDiskIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setExpectedDiskIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (OS_dispatch_semaphore)semaphore
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSemaphore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_semaphore, 0);
  objc_storeStrong((id *)&self->_expectedDiskIdentifier, 0);
}

@end
