@implementation NPSManagerBridge

- (void)synchronizeUserDefaultsDomain:(id)a3 keys:(id)a4 container:(id)a5 appGroupContainer:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[NPSManagerBridge npsManager](self, "npsManager");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "synchronizeUserDefaultsDomain:keys:container:appGroupContainer:", v13, v12, v11, v10);

}

- (NPSManager)npsManager
{
  return self->_npsManager;
}

- (NPSManagerBridge)init
{
  NPSManagerBridge *v2;
  uint64_t v3;
  NPSManager *npsManager;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NPSManagerBridge;
  v2 = -[NPSManagerBridge init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    npsManager = v2->_npsManager;
    v2->_npsManager = (NPSManager *)v3;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_npsManager, 0);
}

@end
