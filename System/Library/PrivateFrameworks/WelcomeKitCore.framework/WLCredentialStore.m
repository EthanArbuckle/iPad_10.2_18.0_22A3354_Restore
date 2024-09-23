@implementation WLCredentialStore

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_10);
  return (id)sharedInstance_instance_0;
}

void __35__WLCredentialStore_sharedInstance__block_invoke()
{
  WLCredentialStore *v0;
  void *v1;

  v0 = objc_alloc_init(WLCredentialStore);
  v1 = (void *)sharedInstance_instance_0;
  sharedInstance_instance_0 = (uint64_t)v0;

}

- (WLCredentialStore)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WLCredentialStore;
  return -[WLCredentialStore init](&v3, sel_init);
}

- (void)setCredentials:(id)a3 forAuthentication:(id)a4
{
  WLAuthenticationCredentials *v6;
  WLDeviceAuthentication *v7;
  WLAuthenticationCredentials *credentials;
  WLAuthenticationCredentials *v9;
  WLDeviceAuthentication *authentication;
  WLCredentialStore *obj;

  v6 = (WLAuthenticationCredentials *)a3;
  v7 = (WLDeviceAuthentication *)a4;
  obj = self;
  objc_sync_enter(obj);
  credentials = obj->_credentials;
  obj->_credentials = v6;
  v9 = v6;

  authentication = obj->_authentication;
  obj->_authentication = v7;

  objc_sync_exit(obj);
}

- (id)currentAuthentication
{
  WLCredentialStore *v2;
  WLDeviceAuthentication *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_authentication;
  objc_sync_exit(v2);

  return v3;
}

- (id)credentialsForAuthentication:(id)a3
{
  id v4;
  WLCredentialStore *v5;
  void *v6;
  void *v7;
  int v8;
  WLAuthenticationCredentials *v9;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_msgSend(v4, "sessionUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLDeviceAuthentication sessionUUID](v5->_authentication, "sessionUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
    v9 = v5->_credentials;
  else
    v9 = 0;
  objc_sync_exit(v5);

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authentication, 0);
  objc_storeStrong((id *)&self->_credentials, 0);
}

@end
