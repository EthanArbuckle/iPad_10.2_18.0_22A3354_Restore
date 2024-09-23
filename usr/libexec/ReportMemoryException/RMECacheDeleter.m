@implementation RMECacheDeleter

- (RMECacheDeleter)init
{
  void *v3;
  void *v4;
  id v5;
  RMECacheDeleter *v6;
  RMECacheDeleter *v7;
  objc_super v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[RMECacheEnumerator getLogContainer:](RMECacheEnumerator, "getLogContainer:", 1));
  v4 = v3;
  if (v3)
  {
    v5 = v3;
    if (self)
    {
      v9.receiver = self;
      v9.super_class = (Class)RMECacheDeleter;
      v6 = -[RMECacheDeleter init](&v9, "init");
      self = v6;
      if (v6)
        objc_storeStrong((id *)&v6->_archivesDirectory, v4);
    }

    self = self;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_archivesDirectory, 0);
}

@end
