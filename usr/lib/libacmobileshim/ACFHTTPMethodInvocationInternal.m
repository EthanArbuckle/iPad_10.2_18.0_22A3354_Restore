@implementation ACFHTTPMethodInvocationInternal

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ACFHTTPMethodInvocationInternal;
  -[ACFHTTPMethodInvocationInternal dealloc](&v3, sel_dealloc);
}

- (ACFHTTPMethodInvocationInternal)init
{
  ACFHTTPMethodInvocationInternal *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ACFHTTPMethodInvocationInternal;
  v2 = -[ACFHTTPMethodInvocationInternal init](&v4, sel_init);
  if (v2)
  {
    v2->_invocationGuard = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x24BDD1788]);
    v2->_schedulingGuard = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x24BDD1788]);
    v2->_runLoops = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  }
  return v2;
}

- (NSRecursiveLock)invocationGuard
{
  return (NSRecursiveLock *)objc_getProperty(self, a2, 8, 1);
}

- (void)setInvocationGuard:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSRecursiveLock)schedulingGuard
{
  return (NSRecursiveLock *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSchedulingGuard:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMutableDictionary)runLoops
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRunLoops:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSURLConnection)connection
{
  return (NSURLConnection *)objc_getProperty(self, a2, 32, 1);
}

- (void)setConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (BOOL)isFinished
{
  return self->_isFinished;
}

- (void)setIsFinished:(BOOL)a3
{
  self->_isFinished = a3;
}

- (NSMutableData)receivedDataAccumulator
{
  return (NSMutableData *)objc_getProperty(self, a2, 48, 1);
}

- (void)setReceivedDataAccumulator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

@end
