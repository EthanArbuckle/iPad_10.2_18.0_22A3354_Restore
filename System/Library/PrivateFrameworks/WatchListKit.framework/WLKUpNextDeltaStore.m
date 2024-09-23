@implementation WLKUpNextDeltaStore

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_15);
  return (id)sharedInstance__singleton;
}

void __37__WLKUpNextDeltaStore_sharedInstance__block_invoke()
{
  WLKUpNextDeltaStore *v0;
  void *v1;

  v0 = objc_alloc_init(WLKUpNextDeltaStore);
  v1 = (void *)sharedInstance__singleton;
  sharedInstance__singleton = (uint64_t)v0;

}

- (WLKUpNextDeltaStore)init
{
  WLKUpNextDeltaStore *v2;
  WLKSharedFileStorage *v3;
  WLKSharedFileStorage *fileStorage;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WLKUpNextDeltaStore;
  v2 = -[WLKUpNextDeltaStore init](&v6, sel_init);
  if (v2)
  {
    v3 = -[WLKSharedFileStorage initWithFileName:class:]([WLKSharedFileStorage alloc], "initWithFileName:class:", CFSTR("upnextdelta.plist"), objc_opt_class());
    fileStorage = v2->_fileStorage;
    v2->_fileStorage = v3;

  }
  return v2;
}

- (void)read:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!v4)
    -[WLKUpNextDeltaStore read:].cold.1();
  v5 = v4;
  -[WLKSharedFileStorage read:](self->_fileStorage, "read:", v4);

}

- (void)write:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (!v7)
    -[WLKUpNextDeltaStore write:completion:].cold.1();
  if (!v6)
    -[WLKUpNextDeltaStore write:completion:].cold.2();
  -[WLKSharedFileStorage write:completion:](self->_fileStorage, "write:completion:", v7, v6);

}

- (void)merge:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (!v7)
    -[WLKUpNextDeltaStore merge:completion:].cold.1();
  if (!v6)
    -[WLKUpNextDeltaStore merge:completion:].cold.2();
  -[WLKSharedFileStorage merge:completion:](self->_fileStorage, "merge:completion:", v7, v6);

}

- (void)delete:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!v4)
    -[WLKUpNextDeltaStore delete:].cold.1();
  v5 = v4;
  -[WLKSharedFileStorage delete:](self->_fileStorage, "delete:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileStorage, 0);
}

- (void)read:.cold.1()
{
  __assert_rtn("-[WLKUpNextDeltaStore read:]", "WLKUpNextDeltaStore.m", 48, "completion != nil");
}

- (void)write:completion:.cold.1()
{
  __assert_rtn("-[WLKUpNextDeltaStore write:completion:]", "WLKUpNextDeltaStore.m", 55, "delta != nil");
}

- (void)write:completion:.cold.2()
{
  __assert_rtn("-[WLKUpNextDeltaStore write:completion:]", "WLKUpNextDeltaStore.m", 56, "completion != nil");
}

- (void)merge:completion:.cold.1()
{
  __assert_rtn("-[WLKUpNextDeltaStore merge:completion:]", "WLKUpNextDeltaStore.m", 63, "delta != nil");
}

- (void)merge:completion:.cold.2()
{
  __assert_rtn("-[WLKUpNextDeltaStore merge:completion:]", "WLKUpNextDeltaStore.m", 64, "completion != nil");
}

- (void)delete:.cold.1()
{
  __assert_rtn("-[WLKUpNextDeltaStore delete:]", "WLKUpNextDeltaStore.m", 71, "completion != nil");
}

@end
