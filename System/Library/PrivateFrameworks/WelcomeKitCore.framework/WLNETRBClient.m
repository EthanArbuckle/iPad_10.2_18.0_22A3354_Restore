@implementation WLNETRBClient

- (WLNETRBClient)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WLNETRBClient;
  return -[WLNETRBClient init](&v3, sel_init);
}

- (void)startDHCPWithCompletion:(id)a3
{
  xpc_object_t v4;
  WLNETRBClient *v5;
  uint64_t v6;
  id dhcpStartCompletionBlock;
  WLNETRBClient *v8;
  id v9;
  const char *v10;
  int v11;
  void (**v12)(id, _QWORD);

  v12 = (void (**)(id, _QWORD))a3;
  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v4, (const char *)*MEMORY[0x24BE6B690], "255.255.255.0");
  xpc_dictionary_set_string(v4, (const char *)*MEMORY[0x24BE6B698], "10.17.1.199");
  xpc_dictionary_set_string(v4, (const char *)*MEMORY[0x24BE6B680], "10.17.1.254");
  xpc_dictionary_set_uint64(v4, (const char *)*MEMORY[0x24BE6B678], 3uLL);
  xpc_dictionary_set_string(v4, (const char *)*MEMORY[0x24BE6B688], "ap1");
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_dhcpStartCompletionBlock)
  {
    v10 = "_dhcpStartCompletionBlock == nil";
    v11 = 52;
    goto LABEL_8;
  }
  if (v5->_dhcpStopCompletionBlock)
  {
    v10 = "_dhcpStopCompletionBlock == nil";
    v11 = 53;
LABEL_8:
    __assert_rtn("-[WLNETRBClient startDHCPWithCompletion:]", "WLNETRBClient.m", v11, v10);
  }
  v6 = MEMORY[0x2207BB4C4](v12);
  dhcpStartCompletionBlock = v5->_dhcpStartCompletionBlock;
  v5->_dhcpStartCompletionBlock = (id)v6;

  objc_sync_exit(v5);
  if (!-[WLNETRBClient _startDHCPWithInterface:](v5, "_startDHCPWithInterface:", v4))
  {
    _WLLog();
    v8 = v5;
    objc_sync_enter(v8);
    v9 = v5->_dhcpStartCompletionBlock;
    v5->_dhcpStartCompletionBlock = 0;

    objc_sync_exit(v8);
    v12[2](v12, 0);
  }

}

- (BOOL)_startDHCPWithInterface:(id)a3
{
  id v4;

  v4 = a3;
  -[WLNETRBClient _netrbClient](self, "_netrbClient");
  LOBYTE(self) = _NETRBClientStartService();

  return (char)self;
}

- (void)_didStartDHCPWithSuccess:(BOOL)a3
{
  uint64_t v3;
  id v5;
  void *v6;
  WLNETRBClient *v7;
  void (**v8)(_QWORD, _QWORD);
  id dhcpStartCompletionBlock;
  ifaddrs *v10;
  sockaddr *ifa_addr;
  void *v12;
  void *v13;
  int v14;
  int v15;
  uint64_t v16;
  void *v17;
  id v18;
  _BOOL8 v19;
  char *ifa_name;
  WLNETRBClient *v21;
  ifaddrs *v22;
  char v23[256];
  uint64_t v24;

  v3 = a3;
  v24 = *MEMORY[0x24BDAC8D0];
  v19 = a3;
  _WLLog();
  v22 = 0;
  v5 = 0;
  v6 = 0;
  if (getifaddrs(&v22))
    goto LABEL_2;
  v10 = v22;
  if (!v22)
  {
    MEMORY[0x2207BB290](0);
    v5 = 0;
    v6 = 0;
    goto LABEL_2;
  }
  v21 = self;
  v6 = 0;
  v5 = 0;
  do
  {
    ifa_addr = v10->ifa_addr;
    if (ifa_addr->sa_family != 2)
      goto LABEL_14;
    inet_ntop(2, &ifa_addr->sa_data[2], v23, 0x100u);
    ifa_name = v10->ifa_name;
    _WLLog();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v10->ifa_name, ifa_name, v23);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v23);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqualToString:", CFSTR("ap1"));
    v15 = objc_msgSend(v13, "isEqualToString:", CFSTR("10.17.1.199"));
    if (v14)
    {
      if ((v15 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v23);
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = v6;
        v6 = (void *)v16;
LABEL_12:

      }
    }
    else if (v15)
    {
      v18 = v12;
      v17 = v5;
      v5 = v18;
      goto LABEL_12;
    }

LABEL_14:
    v10 = v10->ifa_next;
  }
  while (v10);
  MEMORY[0x2207BB290](v22);
  if (v6)
  {
    objc_msgSend(objc_retainAutorelease(v6), "UTF8String", v19);
    _WLLog();
  }
  v3 = v3;
  self = v21;
  if (v5)
  {
    v5 = objc_retainAutorelease(v5);
    objc_msgSend(v5, "UTF8String");
    _WLLog();
  }
LABEL_2:
  v7 = self;
  objc_sync_enter(v7);
  v8 = (void (**)(_QWORD, _QWORD))MEMORY[0x2207BB4C4](v7->_dhcpStartCompletionBlock);
  dhcpStartCompletionBlock = v7->_dhcpStartCompletionBlock;
  v7->_dhcpStartCompletionBlock = 0;

  objc_sync_exit(v7);
  if (v8)
    v8[2](v8, v3);
  else
    _WLLog();

}

- (void)stopDHCPWithCompletion:(id)a3
{
  WLNETRBClient *v4;
  uint64_t v5;
  id dhcpStopCompletionBlock;
  WLNETRBClient *v7;
  id v8;
  const char *v9;
  int v10;
  void (**v11)(id, _QWORD);

  v11 = (void (**)(id, _QWORD))a3;
  v4 = self;
  objc_sync_enter(v4);
  if (v4->_dhcpStartCompletionBlock)
  {
    v9 = "_dhcpStartCompletionBlock == nil";
    v10 = 135;
    goto LABEL_8;
  }
  if (v4->_dhcpStopCompletionBlock)
  {
    v9 = "_dhcpStopCompletionBlock == nil";
    v10 = 136;
LABEL_8:
    __assert_rtn("-[WLNETRBClient stopDHCPWithCompletion:]", "WLNETRBClient.m", v10, v9);
  }
  v5 = MEMORY[0x2207BB4C4](v11);
  dhcpStopCompletionBlock = v4->_dhcpStopCompletionBlock;
  v4->_dhcpStopCompletionBlock = (id)v5;

  objc_sync_exit(v4);
  if (!-[WLNETRBClient _stopDHCP](v4, "_stopDHCP"))
  {
    _WLLog();
    v7 = v4;
    objc_sync_enter(v7);
    v8 = v4->_dhcpStopCompletionBlock;
    v4->_dhcpStopCompletionBlock = 0;

    objc_sync_exit(v7);
    v11[2](v11, 0);
  }

}

- (BOOL)_stopDHCP
{
  -[WLNETRBClient _netrbClient](self, "_netrbClient");
  return _NETRBClientStopService();
}

- (void)_didStopDHCPWithSuccess:(BOOL)a3
{
  WLNETRBClient *v4;
  id dhcpStopCompletionBlock;
  void (**v6)(_QWORD);

  _WLLog();
  v4 = self;
  objc_sync_enter(v4);
  v6 = (void (**)(_QWORD))MEMORY[0x2207BB4C4](v4->_dhcpStopCompletionBlock);
  dhcpStopCompletionBlock = v4->_dhcpStopCompletionBlock;
  v4->_dhcpStopCompletionBlock = 0;

  objc_sync_exit(v4);
  if (v6)
    v6[2](v6);
  else
    _WLLog();

}

- (NETRBClient)_netrbClient
{
  NETRBClient *result;
  dispatch_queue_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  result = self->_netrbClientRef;
  if (!result)
  {
    v4 = dispatch_queue_create("WelcomeKitCore netrbClientQueue", 0);
    objc_initWeak(&location, self);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __29__WLNETRBClient__netrbClient__block_invoke;
    v6[3] = &unk_24E376C68;
    objc_copyWeak(&v7, &location);
    v5 = (void *)MEMORY[0x2207BB4C4](v6);
    self->_netrbClientRef = (NETRBClient *)_NETRBClientCreate();

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);

    return self->_netrbClientRef;
  }
  return result;
}

uint64_t __29__WLNETRBClient__netrbClient__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id WeakRetained;

  v5 = a3;
  _WLLog();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if ((_DWORD)a2 == 1002)
    {
      objc_msgSend(WeakRetained, "_didStopDHCPWithSuccess:", xpc_dictionary_get_uint64(v5, (const char *)*MEMORY[0x24BE6B6A0]) == 5002, a2, v5);
    }
    else if ((_DWORD)a2 == 1001)
    {
      objc_msgSend(WeakRetained, "_didStartDHCPWithSuccess:", xpc_dictionary_get_uint64(v5, (const char *)*MEMORY[0x24BE6B6A0]) == 5002, a2, v5);
    }
  }

  return 0;
}

- (BOOL)_completionsAreNil
{
  return !self->_dhcpStartCompletionBlock && self->_dhcpStopCompletionBlock == 0;
}

- (BOOL)isIPAddressInRange:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;
  unsigned int v7;
  unsigned int v9;
  uint64_t v10;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCString:encoding:", "10.17.1.199", 4);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCString:encoding:", "10.17.1.254", 4);
  if (!objc_msgSend(v4, "length") || !objc_msgSend(v5, "length") || !objc_msgSend(v3, "length"))
  {
LABEL_8:
    v6 = 0;
    goto LABEL_9;
  }
  v10 = 0;
  v9 = 0;
  v6 = 0;
  if (inet_pton(2, (const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"), (char *)&v10 + 4) == 1)
  {
    if (inet_pton(2, (const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"), &v10) == 1
      && inet_pton(2, (const char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String"), &v9) == 1)
    {
      v7 = bswap32(v9);
      if (v7 >= bswap32(HIDWORD(v10)))
      {
        v6 = v7 <= bswap32(v10);
        goto LABEL_9;
      }
    }
    goto LABEL_8;
  }
LABEL_9:

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dhcpStopCompletionBlock, 0);
  objc_storeStrong(&self->_dhcpStartCompletionBlock, 0);
}

@end
