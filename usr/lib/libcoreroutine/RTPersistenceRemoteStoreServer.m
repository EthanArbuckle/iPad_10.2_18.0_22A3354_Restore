@implementation RTPersistenceRemoteStoreServer

- (RTPersistenceRemoteStoreServer)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithStoreURL_modelURL_options_);
}

- (RTPersistenceRemoteStoreServer)initWithStoreURL:(id)a3 modelURL:(id)a4 options:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  RTPersistenceRemoteStoreServer *v15;
  id *p_isa;
  RTPersistenceRemoteStoreServer *v17;
  NSObject *v18;
  const char *v19;
  objc_super v21;
  uint8_t buf[16];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_WORD *)buf = 0;
    v19 = "Invalid parameter not satisfying: storeURL";
LABEL_16:
    _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, v19, buf, 2u);
    goto LABEL_17;
  }
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_WORD *)buf = 0;
    v19 = "Invalid parameter not satisfying: modelURL";
    goto LABEL_16;
  }
  objc_msgSend(v11, "objectForKey:", *MEMORY[0x1E0C97A60]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    *(_WORD *)buf = 0;
    v19 = "Invalid parameter not satisfying: [options objectForKey:NSXPCStoreServiceNameKey]";
    goto LABEL_16;
  }
  objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0C97A40]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v19 = "Invalid parameter not satisfying: [options objectForKey:NSXPCStoreDaemonizeKey]";
      goto LABEL_16;
    }
LABEL_17:

    v17 = 0;
    goto LABEL_18;
  }
  v21.receiver = self;
  v21.super_class = (Class)RTPersistenceRemoteStoreServer;
  v15 = -[RTPersistenceRemoteStoreServer init](&v21, sel_init);
  p_isa = (id *)&v15->super.isa;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_storeURL, a3);
    objc_storeStrong(p_isa + 3, a4);
    objc_storeStrong(p_isa + 4, a5);
  }
  self = p_isa;
  v17 = self;
LABEL_18:

  return v17;
}

- (void)startListening
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)MEMORY[0x1D8231EA8](self, a2);
  v4 = objc_alloc(MEMORY[0x1E0C97C30]);
  -[RTPersistenceRemoteStoreServer storeURL](self, "storeURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPersistenceRemoteStoreServer modelURL](self, "modelURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTPersistenceRemoteStoreServer serverOptions](self, "serverOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initForStoreWithURL:usingModelAtURL:options:policy:", v5, v6, v7, 0);
  -[RTPersistenceRemoteStoreServer setXpcStoreServer:](self, "setXpcStoreServer:", v8);

  objc_autoreleasePoolPop(v3);
  -[RTPersistenceRemoteStoreServer xpcStoreServer](self, "xpcStoreServer");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "startListening");

}

- (NSXPCStoreServer)xpcStoreServer
{
  return (NSXPCStoreServer *)objc_getProperty(self, a2, 8, 1);
}

- (void)setXpcStoreServer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSURL)storeURL
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (void)setStoreURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSURL)modelURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (void)setModelURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSDictionary)serverOptions
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setServerOptions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverOptions, 0);
  objc_storeStrong((id *)&self->_modelURL, 0);
  objc_storeStrong((id *)&self->_storeURL, 0);
  objc_storeStrong((id *)&self->_xpcStoreServer, 0);
}

@end
