@implementation WFSetupClient

- (WFSetupClient)init
{
  WFSetupClient *v2;
  uint64_t v3;
  WFSetupClientInternal *underlyingSwiftObject;
  WFSetupClient *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFSetupClient;
  v2 = -[WFSetupClient init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    underlyingSwiftObject = v2->_underlyingSwiftObject;
    v2->_underlyingSwiftObject = (WFSetupClientInternal *)v3;

    v5 = v2;
  }

  return v2;
}

- (OS_dispatch_queue)dispatchQueue
{
  return -[WFSetupClientInternal dispatchQueue](self->_underlyingSwiftObject, "dispatchQueue");
}

- (void)setDispatchQueue:(id)a3
{
  -[WFSetupClientInternal setDispatchQueue:](self->_underlyingSwiftObject, "setDispatchQueue:", a3);
}

- (id)interruptionHandler
{
  return -[WFSetupClientInternal interruptionHandler](self->_underlyingSwiftObject, "interruptionHandler");
}

- (void)setInterruptionHandler:(id)a3
{
  -[WFSetupClientInternal setInterruptionHandler:](self->_underlyingSwiftObject, "setInterruptionHandler:", a3);
}

- (id)invalidationHandler
{
  return -[WFSetupClientInternal invalidationHandler](self->_underlyingSwiftObject, "invalidationHandler");
}

- (void)setInvalidationHandler:(id)a3
{
  -[WFSetupClientInternal setInvalidationHandler:](self->_underlyingSwiftObject, "setInvalidationHandler:", a3);
}

- (SFDevice)peerDevice
{
  return -[WFSetupClientInternal peerDevice](self->_underlyingSwiftObject, "peerDevice");
}

- (void)setPeerDevice:(id)a3
{
  -[WFSetupClientInternal setPeerDevice:](self->_underlyingSwiftObject, "setPeerDevice:", a3);
}

- (id)setupProgressEventHandler
{
  return -[WFSetupClientInternal setupProgressEventHandler](self->_underlyingSwiftObject, "setupProgressEventHandler");
}

- (void)setSetupProgressEventHandler:(id)a3
{
  -[WFSetupClientInternal setSetupProgressEventHandler:](self->_underlyingSwiftObject, "setSetupProgressEventHandler:", a3);
}

- (id)userInteractionProgressEventHandler
{
  return -[WFSetupClientInternal userInteractionProgressEventHandler](self->_underlyingSwiftObject, "userInteractionProgressEventHandler");
}

- (void)setUserInteractionProgressEventHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFSetupClient underlyingSwiftObject](self, "underlyingSwiftObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserInteractionProgressEventHandler:", v4);

}

- (id)showPINHandler
{
  return -[WFSetupClientInternal showPinHandler](self->_underlyingSwiftObject, "showPinHandler");
}

- (void)setShowPINHandler:(id)a3
{
  -[WFSetupClientInternal setShowPinHandler:](self->_underlyingSwiftObject, "setShowPinHandler:", a3);
}

- (id)receivedObjectHandler
{
  return -[WFSetupClientInternal receivedObjectHandler](self->_underlyingSwiftObject, "receivedObjectHandler");
}

- (void)setReceivedObjectHandler:(id)a3
{
  -[WFSetupClientInternal setReceivedObjectHandler:](self->_underlyingSwiftObject, "setReceivedObjectHandler:", a3);
}

- (id)securePairingCompletionHandler
{
  return -[WFSetupClientInternal setupSecurePairingCompletionHandler](self->_underlyingSwiftObject, "setupSecurePairingCompletionHandler");
}

- (void)setSecurePairingCompletionHandler:(id)a3
{
  -[WFSetupClientInternal setSetupSecurePairingCompletionHandler:](self->_underlyingSwiftObject, "setSetupSecurePairingCompletionHandler:", a3);
}

- (void)activate
{
  -[WFSetupClientInternal activate](self->_underlyingSwiftObject, "activate");
}

- (void)invalidate
{
  -[WFSetupClientInternal invalidate](self->_underlyingSwiftObject, "invalidate");
}

- (void)sendUserInteractionEvent:(id)a3 withEncryption:(BOOL)a4 responseHandler:(id)a5
{
  -[WFSetupClientInternal sendUserInteractionEventInEvent:withEncryption:responseHandler:](self->_underlyingSwiftObject, "sendUserInteractionEventInEvent:withEncryption:responseHandler:", a3, a4, a5);
}

- (void)sendObject:(id)a3 encrypted:(BOOL)a4
{
  -[WFSetupClientInternal sendObject:encrypted:](self->_underlyingSwiftObject, "sendObject:encrypted:", a3, a4);
}

- (CUMessageSession)messageSessionTemplate
{
  return -[WFSetupClientInternal messageSessionTemplate](self->_underlyingSwiftObject, "messageSessionTemplate");
}

- (id)progressEventHandler
{
  return self->_progressEventHandler;
}

- (void)setProgressEventHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (WFSetupClientInternal)underlyingSwiftObject
{
  return (WFSetupClientInternal *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingSwiftObject, 0);
  objc_storeStrong(&self->_progressEventHandler, 0);
}

@end
