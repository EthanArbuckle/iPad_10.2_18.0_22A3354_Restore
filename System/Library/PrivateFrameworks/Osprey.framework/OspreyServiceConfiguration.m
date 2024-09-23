@implementation OspreyServiceConfiguration

- (OspreyServiceConfiguration)init
{
  OspreyServiceConfiguration *v2;
  OspreyConnectionPool *v3;
  OspreyConnectionPool *connectionPool;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OspreyServiceConfiguration;
  v2 = -[OspreyServiceConfiguration init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(OspreyConnectionPool);
    connectionPool = v2->_connectionPool;
    v2->_connectionPool = v3;

  }
  return v2;
}

+ (id)sharedConfiguration
{
  if (sharedConfiguration_onceToken != -1)
    dispatch_once(&sharedConfiguration_onceToken, &__block_literal_global);
  return (id)sharedConfiguration_shared;
}

void __49__OspreyServiceConfiguration_sharedConfiguration__block_invoke()
{
  OspreyServiceConfiguration *v0;
  void *v1;

  v0 = objc_alloc_init(OspreyServiceConfiguration);
  v1 = (void *)sharedConfiguration_shared;
  sharedConfiguration_shared = (uint64_t)v0;

}

- (OspreyConnectionPool)connectionPool
{
  return (OspreyConnectionPool *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionPool, 0);
}

@end
