@implementation NFSecureXPCEventPublisherManager

- (NFSecureXPCEventPublisher)wallet
{
  return self->_wallet;
}

+ (id)sharedManager
{
  if (qword_10032A870 != -1)
    dispatch_once(&qword_10032A870, &stru_1002E5670);
  return (id)qword_10032A878;
}

- (void)startPublisherWithQueue:(id)a3
{
  -[NFSecureXPCEventPublisherManager startPublisherWithXPCQueue:eventSendQueue:](self, "startPublisherWithXPCQueue:eventSendQueue:", a3, a3);
}

- (void)startPublisherWithXPCQueue:(id)a3 eventSendQueue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NFSecureXPCEventPublisherManager wallet](self, "wallet"));
  objc_msgSend(v8, "invalidate");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NFSecureXPCEventPublisherManager homed](self, "homed"));
  objc_msgSend(v9, "invalidate");

  v10 = objc_msgSend(objc_alloc((Class)NFSecureXPCEventPublisher), "initWithMachPort:xpcConnectionQueue:eventSendQueue:", CFSTR("com.apple.passd.nf-events"), v7, v6);
  -[NFSecureXPCEventPublisherManager setWallet:](self, "setWallet:", v10);

  v11 = objc_msgSend(objc_alloc((Class)NFSecureXPCEventPublisher), "initWithMachPort:xpcConnectionQueue:eventSendQueue:", CFSTR("com.apple.nfcd.xpc.homed.uaevents"), v7, v6);
  -[NFSecureXPCEventPublisherManager setHomed:](self, "setHomed:", v11);

}

- (void)invalidate
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NFSecureXPCEventPublisherManager wallet](self, "wallet"));
  objc_msgSend(v3, "invalidate");

  -[NFSecureXPCEventPublisherManager setWallet:](self, "setWallet:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NFSecureXPCEventPublisherManager homed](self, "homed"));
  objc_msgSend(v4, "invalidate");

  -[NFSecureXPCEventPublisherManager setHomed:](self, "setHomed:", 0);
}

- (void)setWallet:(id)a3
{
  objc_storeStrong((id *)&self->_wallet, a3);
}

- (NFSecureXPCEventPublisher)homed
{
  return self->_homed;
}

- (void)setHomed:(id)a3
{
  objc_storeStrong((id *)&self->_homed, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homed, 0);
  objc_storeStrong((id *)&self->_wallet, 0);
}

@end
