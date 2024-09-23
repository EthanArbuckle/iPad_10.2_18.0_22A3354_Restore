@implementation WFSetupServer

- (WFSetupServer)init
{
  WFSetupServer *v2;
  uint64_t v3;
  WFSetupServerInternal *underlyingSwiftObject;
  WFSetupServer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFSetupServer;
  v2 = -[WFSetupServer init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    underlyingSwiftObject = v2->_underlyingSwiftObject;
    v2->_underlyingSwiftObject = (WFSetupServerInternal *)v3;

    v5 = v2;
  }

  return v2;
}

- (id)completionHandler
{
  return -[WFSetupServerInternal completionHandler](self->_underlyingSwiftObject, "completionHandler");
}

- (void)setCompletionHandler:(id)a3
{
  -[WFSetupServerInternal setCompletionHandler:](self->_underlyingSwiftObject, "setCompletionHandler:", a3);
}

- (id)receivedObjectHandler
{
  return -[WFSetupServerInternal receivedObjectHandler](self->_underlyingSwiftObject, "receivedObjectHandler");
}

- (void)setReceivedObjectHandler:(id)a3
{
  -[WFSetupServerInternal setReceivedObjectHandler:](self->_underlyingSwiftObject, "setReceivedObjectHandler:", a3);
}

- (OS_dispatch_queue)dispatchQueue
{
  return -[WFSetupServerInternal dispatchQueue](self->_underlyingSwiftObject, "dispatchQueue");
}

- (void)setDispatchQueue:(id)a3
{
  -[WFSetupServerInternal setDispatchQueue:](self->_underlyingSwiftObject, "setDispatchQueue:", a3);
}

- (void)setSetupPromptPinHandler:(id)a3
{
  -[WFSetupServerInternal setSetupPromptPinHandler:](self->_underlyingSwiftObject, "setSetupPromptPinHandler:", a3);
}

- (id)setupPromptPinHandler
{
  return -[WFSetupServerInternal setupPromptPinHandler](self->_underlyingSwiftObject, "setupPromptPinHandler");
}

- (id)setupProgressEventHandler
{
  return -[WFSetupServerInternal setupProgressEventHandler](self->_underlyingSwiftObject, "setupProgressEventHandler");
}

- (void)setSetupProgressEventHandler:(id)a3
{
  -[WFSetupServerInternal setSetupProgressEventHandler:](self->_underlyingSwiftObject, "setSetupProgressEventHandler:", a3);
}

- (id)userInteractionProgressEventHandler
{
  return -[WFSetupServerInternal userInteractionProgressEventHandler](self->_underlyingSwiftObject, "userInteractionProgressEventHandler");
}

- (void)setUserInteractionProgressEventHandler:(id)a3
{
  -[WFSetupServerInternal setUserInteractionProgressEventHandler:](self->_underlyingSwiftObject, "setUserInteractionProgressEventHandler:", a3);
}

- (_TtC10TDGSharing33WFSetupServerAnisetteDataProvider)anisetteDataProvider
{
  return -[WFSetupServerInternal anisetteDataProvider](self->_underlyingSwiftObject, "anisetteDataProvider");
}

- (void)prepareToRun
{
  -[WFSetupServerInternal prepareToRun](self->_underlyingSwiftObject, "prepareToRun");
}

- (void)activate
{
  -[WFSetupServerInternal activate](self->_underlyingSwiftObject, "activate");
}

- (void)invalidate
{
  -[WFSetupServerInternal invalidate](self->_underlyingSwiftObject, "invalidate");
}

- (void)sendObject:(id)a3 withEncryption:(BOOL)a4
{
  -[WFSetupServerInternal sendObjectWithObject:encrypted:](self->_underlyingSwiftObject, "sendObjectWithObject:encrypted:", a3, a4);
}

- (void)sendSetupAction:(unsigned int)a3 info:(id)a4 responseHandler:(id)a5
{
  -[WFSetupServerInternal sendSetupWithAction:info:responseHandler:](self->_underlyingSwiftObject, "sendSetupWithAction:info:responseHandler:", *(_QWORD *)&a3, a4, a5);
}

- (void)sendUserInteractionEvent:(id)a3 withEncryption:(BOOL)a4 responseHandler:(id)a5
{
  -[WFSetupServerInternal sendUserInteractionEventInEvent:withEncryption:responseHandler:](self->_underlyingSwiftObject, "sendUserInteractionEventInEvent:withEncryption:responseHandler:", a3, a4, a5);
}

- (void)tryPIN:(id)a3
{
  -[WFSetupServerInternal tryPin:](self->_underlyingSwiftObject, "tryPin:", a3);
}

- (void)startSecureChannelWithResetFlag:(BOOL)a3 completion:(id)a4
{
  -[WFSetupServerInternal startSecureChannelPairingWith:completion:](self->_underlyingSwiftObject, "startSecureChannelPairingWith:completion:", a3, a4);
}

- (void)startSecureChannelWithResetFlag:(BOOL)a3 context:(id)a4 completion:(id)a5
{
  -[WFSetupServerInternal startSecureChannelPairingWith:context:completion:](self->_underlyingSwiftObject, "startSecureChannelPairingWith:context:completion:", a3, a4, a5);
}

- (WFSetupServerInternal)underlyingSwiftObject
{
  return (WFSetupServerInternal *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingSwiftObject, 0);
}

@end
