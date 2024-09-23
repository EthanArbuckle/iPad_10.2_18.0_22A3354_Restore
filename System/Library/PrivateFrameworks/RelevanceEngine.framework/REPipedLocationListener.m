@implementation REPipedLocationListener

- (id)_init
{
  id *v2;
  NSObject *v3;
  uint64_t v4;
  id v5;
  uint8_t v7[16];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)REPipedLocationListener;
  v2 = -[RESingleton _init](&v8, sel__init);
  if (v2)
  {
    RELogForDomain(5);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_2132F7000, v3, OS_LOG_TYPE_INFO, "Starting piped location listener", v7, 2u);
    }

    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1998]), "initWithMachServiceName:", CFSTR("com.apple.relevanceengine.pipedlocation"));
    v5 = v2[1];
    v2[1] = (id)v4;

    objc_msgSend(v2[1], "setDelegate:", v2);
    objc_msgSend(v2[1], "resume");
  }
  return v2;
}

- (void)dealloc
{
  NSXPCListener *listener;
  objc_super v4;

  -[NSXPCListener invalidate](self->_listener, "invalidate");
  -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", 0);
  listener = self->_listener;
  self->_listener = 0;

  v4.receiver = self;
  v4.super_class = (Class)REPipedLocationListener;
  -[REPipedLocationListener dealloc](&v4, sel_dealloc);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  RELogForDomain(5);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v5, "description");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = 136315138;
    v12 = objc_msgSend(v8, "UTF8String");
    _os_log_impl(&dword_2132F7000, v7, OS_LOG_TYPE_INFO, "New piped location connection: %s", (uint8_t *)&v11, 0xCu);

  }
  +[RESingleton sharedInstance](REPipedLocationDonor, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setConnection:", v6);

  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
}

@end
