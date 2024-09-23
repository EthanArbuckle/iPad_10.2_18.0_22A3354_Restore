@implementation WCM_P2PNANController

- (WCM_P2PNANController)init
{
  WCM_P2PNANController *v2;
  WCM_P2PNANController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WCM_P2PNANController;
  v2 = -[WCM_Controller init](&v5, "init");
  v3 = v2;
  if (v2)
    *((_BYTE *)&v2->super.mProcessId + 4) = 0;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("P2PNANController Init"));
  return v3;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)WCM_P2PNANController;
  -[WCM_Controller dealloc](&v2, "dealloc");
}

- (void)handleMessage:(id)a3
{
  uint64_t uint64;

  uint64 = xpc_dictionary_get_uint64(a3, "kMessageId");
  if (uint64)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Received P2PNAN message-id: %lld"), uint64);
    if (uint64 == 2701)
      -[WCM_P2PNANController handleNANOn:](self, "handleNANOn:", a3);
    else
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("P2P NAN controller dropping message-id %lld"), uint64);
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("Received empty P2PNAN messageId."));
  }
}

- (void)handleDisconnection:(id)a3
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("P2PNANController handleDisconnection"));
  -[WCM_P2PNANController setMNanEnabled:](self, "setMNanEnabled:", 0);
  objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "updateControllerState:", 2703);
}

- (void)handleNANOn:(id)a3
{
  xpc_object_t dictionary;
  _BOOL8 v5;

  dictionary = xpc_dictionary_get_dictionary(a3, "kMessageArgs");
  v5 = xpc_dictionary_get_BOOL(dictionary, "kWCMP2PNANOn");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 2, CFSTR("Received from P2P NAN Controller NANOn:(%d -> %d)"), -[WCM_P2PNANController mNanEnabled](self, "mNanEnabled"), v5);
  if (v5 != -[WCM_P2PNANController mNanEnabled](self, "mNanEnabled"))
  {
    -[WCM_P2PNANController setMNanEnabled:](self, "setMNanEnabled:", v5);
    objc_msgSend(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"), "updateControllerState:", 2703);
  }
}

- (BOOL)mNanEnabled
{
  return *((_BYTE *)&self->super.mProcessId + 4);
}

- (void)setMNanEnabled:(BOOL)a3
{
  *((_BYTE *)&self->super.mProcessId + 4) = a3;
}

@end
