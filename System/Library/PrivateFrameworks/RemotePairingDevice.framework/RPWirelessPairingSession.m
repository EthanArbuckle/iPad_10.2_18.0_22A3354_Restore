@implementation RPWirelessPairingSession

- (RPWirelessPairingSession)initWithUnderlyingObject:(id)a3
{
  id v5;
  RPWirelessPairingSession *v6;
  RPWirelessPairingSession *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RPWirelessPairingSession;
  v6 = -[RPWirelessPairingSession init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_underlyingObject, a3);

  return v7;
}

- (void)registerInvalidationHandlerOnQueue:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[RPWirelessPairingSession underlyingObject](self, "underlyingObject");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerInvalidationHandlerWithInvokingOnQueue:handler:", v7, v6);

}

- (void)endSession
{
  id v2;

  -[RPWirelessPairingSession underlyingObject](self, "underlyingObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endSession");

}

- (BOOL)invalidated
{
  void *v2;
  char v3;

  -[RPWirelessPairingSession underlyingObject](self, "underlyingObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "invalidated");

  return v3;
}

- (RPWirelessPairingSession_Internal)underlyingObject
{
  return self->_underlyingObject;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingObject, 0);
}

@end
