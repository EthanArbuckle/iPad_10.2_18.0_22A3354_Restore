@implementation CSSessionConfig

- (CSSessionConfig)init
{
  CSSessionConfig *v2;
  dispatch_semaphore_t v3;
  OS_dispatch_semaphore *receiveFileSema;
  NSString *hostOutputDir;
  NSSet *remoteUUIDs;
  NSArray *proxies;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CSSessionConfig;
  v2 = -[CSSessionConfig init](&v9, "init");
  if (v2)
  {
    v3 = dispatch_semaphore_create(0);
    receiveFileSema = v2->_receiveFileSema;
    v2->_receiveFileSema = (OS_dispatch_semaphore *)v3;

    hostOutputDir = v2->_hostOutputDir;
    v2->_hostOutputDir = 0;

    remoteUUIDs = v2->_remoteUUIDs;
    v2->_remoteUUIDs = 0;

    proxies = v2->_proxies;
    v2->_proxies = (NSArray *)&__NSArray0__struct;

    v2->_shouldCollectAllTrusted = 0;
  }
  return v2;
}

- (NSSet)remoteUUIDs
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRemoteUUIDs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (OS_dispatch_semaphore)receiveFileSema
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 24, 1);
}

- (void)setReceiveFileSema:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)hostOutputDir
{
  return self->_hostOutputDir;
}

- (void)setHostOutputDir:(id)a3
{
  objc_storeStrong((id *)&self->_hostOutputDir, a3);
}

- (NSArray)proxies
{
  return self->_proxies;
}

- (void)setProxies:(id)a3
{
  objc_storeStrong((id *)&self->_proxies, a3);
}

- (BOOL)shouldCollectAllTrusted
{
  return self->_shouldCollectAllTrusted;
}

- (void)setShouldCollectAllTrusted:(BOOL)a3
{
  self->_shouldCollectAllTrusted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proxies, 0);
  objc_storeStrong((id *)&self->_hostOutputDir, 0);
  objc_storeStrong((id *)&self->_receiveFileSema, 0);
  objc_storeStrong((id *)&self->_remoteUUIDs, 0);
}

@end
