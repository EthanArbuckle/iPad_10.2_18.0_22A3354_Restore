@implementation TSBonjourAdvertise

- (TSBonjourAdvertise)init
{
  TSBonjourAdvertise *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSBonjourAdvertise;
  v2 = -[TSBonjourAdvertise init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.timesync.bonjour.advertise", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)registeredServiceWithName:(const char *)a3 regType:(const char *)a4 domain:(const char *)a5 withFlags:(unsigned int)a6
{
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  int v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  unsigned int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v19 = 136315906;
    v20 = a3;
    v21 = 2080;
    v22 = a4;
    v23 = 2080;
    v24 = a5;
    v25 = 1024;
    v26 = a6;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Registered service with name %s type %s domain %s flags 0x%08x\n", (uint8_t *)&v19, 0x26u);
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSBonjourAdvertise delegate](self, "delegate");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    -[TSBonjourAdvertise delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_opt_respondsToSelector();

    if ((v17 & 1) != 0)
    {
      -[TSBonjourAdvertise delegate](self, "delegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "didChangeServiceName:type:andDomain:onAdvertiser:", v11, v12, v13, self);

    }
  }

}

- (BOOL)startAdvertisingWithError:(id *)a3
{
  _DNSServiceRef_t **p_sdRef;
  _DNSServiceRef_t *sdRef;
  DNSServiceErrorType v6;

  sdRef = self->_sdRef;
  p_sdRef = &self->_sdRef;
  if (!sdRef)
  {
    v6 = DNSServiceRegister(p_sdRef, 0x100000u, 0, 0, "_ptp-general._udp.", 0, 0, 0x4001u, 0, 0, (DNSServiceRegisterReply)TSBARegisterServiceReply, self);
    if (a3 && v6)
    {
      TSBonjourErrorFromErrorCode(v6);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      v6 = 1;
      return v6 == 0;
    }
    if (v6)
      return v6 == 0;
    DNSServiceSetDispatchQueue(self->_sdRef, (dispatch_queue_t)self->_queue);
  }
  v6 = 0;
  return v6 == 0;
}

- (BOOL)stopAdvertising
{
  _DNSServiceRef_t *sdRef;

  sdRef = self->_sdRef;
  if (sdRef)
  {
    DNSServiceRefDeallocate(self->_sdRef);
    self->_sdRef = 0;
  }
  return sdRef != 0;
}

- (void)dealloc
{
  _DNSServiceRef_t *sdRef;
  objc_super v4;

  sdRef = self->_sdRef;
  if (sdRef)
    DNSServiceRefDeallocate(sdRef);
  v4.receiver = self;
  v4.super_class = (Class)TSBonjourAdvertise;
  -[TSBonjourAdvertise dealloc](&v4, sel_dealloc);
}

- (TSBonjourAdvertiseDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (TSBonjourAdvertiseDelegate *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
