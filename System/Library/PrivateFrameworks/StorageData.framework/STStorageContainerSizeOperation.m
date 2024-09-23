@implementation STStorageContainerSizeOperation

+ (id)operationForContainer:(id)a3
{
  id v3;
  STStorageContainerSizeOperation *v4;

  v3 = a3;
  v4 = objc_alloc_init(STStorageContainerSizeOperation);
  -[STStorageContainerSizeOperation setContainer:](v4, "setContainer:", v3);

  return v4;
}

- (void)main
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  -[STStorageContainerSizeOperation container](self, "container");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v16 = 0;
    v5 = objc_msgSend(v3, "diskUsageWithError:", &v16);
    v6 = v16;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  -[STStorageSizeOperation setSize:](self, "setSize:", v5);
  -[STStorageOperation setError:](self, "setError:", v6);
  if (v6)
  {
    v7 = objc_msgSend(v6, "code");
    objc_msgSend(v4, "url");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "path");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    STLog(2, CFSTR("Error %li sizing container %@"), v9, v10, v11, v12, v13, v14, v7);

  }
}

- (STContainer)container
{
  return (STContainer *)objc_getProperty(self, a2, 264, 1);
}

- (void)setContainer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 264);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_container, 0);
}

@end
