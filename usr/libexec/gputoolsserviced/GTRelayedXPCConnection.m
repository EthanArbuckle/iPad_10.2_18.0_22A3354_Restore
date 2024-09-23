@implementation GTRelayedXPCConnection

- (GTRelayedXPCConnection)initWithConnection:(id)a3 relayPort:(unint64_t)a4 relayPid:(int)a5
{
  id v9;
  GTRelayedXPCConnection *v10;
  GTRelayedXPCConnection *v11;
  GTRelayedXPCConnection *v12;
  objc_super v14;

  v9 = a3;
  if (v9)
  {
    v14.receiver = self;
    v14.super_class = (Class)GTRelayedXPCConnection;
    v10 = -[GTRelayedXPCConnection init](&v14, "init");
    v11 = v10;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_connection, a3);
      v11->_relayPort = a4;
      v11->_relayPid = a5;
      v11->_handleDeviceLocally = 0;
    }
    self = v11;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (GTRelayedXPCConnection)initWithConnection:(id)a3
{
  return -[GTRelayedXPCConnection initWithConnection:relayPort:relayPid:](self, "initWithConnection:relayPort:relayPid:", a3, 0, 0);
}

- (void)updateRelayPort:(unint64_t)a3 pid:(int)a4
{
  self->_relayPort = a3;
  self->_relayPid = a4;
}

- (void)setHandleDeviceLocally
{
  self->_handleDeviceLocally = 1;
}

- (OS_xpc_object)connection
{
  return (OS_xpc_object *)-[GTXPCConnection connection](self->_connection, "connection");
}

- (OS_xpc_object)error
{
  return (OS_xpc_object *)-[GTXPCConnection error](self->_connection, "error");
}

- (void)setError:(id)a3
{
  -[GTXPCConnection setError:](self->_connection, "setError:", a3);
}

- (void)activateWithMessageHandler:(id)a3 andErrorHandler:(id)a4
{
  -[GTXPCConnection activateWithMessageHandler:andErrorHandler:](self->_connection, "activateWithMessageHandler:andErrorHandler:", a3, a4);
}

- (void)cancel
{
  -[GTXPCConnection cancel](self->_connection, "cancel");
}

- (void)deregisterDispatcher:(unint64_t)a3
{
  -[GTXPCConnection deregisterDispatcher:](self->_connection, "deregisterDispatcher:", a3);
}

- (void)dispatchMessage:(id)a3 replyConnection:(id)a4
{
  -[GTXPCConnection dispatchMessage:replyConnection:](self->_connection, "dispatchMessage:replyConnection:", a3, a4);
}

- (unint64_t)registerDispatcher:(id)a3
{
  return (unint64_t)-[GTXPCConnection registerDispatcher:](self->_connection, "registerDispatcher:", a3);
}

- (void)registerDispatcher:(id)a3 forPort:(unint64_t)a4
{
  -[GTXPCConnection registerDispatcher:forPort:](self->_connection, "registerDispatcher:forPort:", a3, a4);
}

- (void)_setRoutingPropertiesForMessage:(id)a3
{
  id v4;
  uint64_t relayPort;
  uint64_t relayPid;
  xpc_object_t xdict;

  v4 = a3;
  relayPort = self->_relayPort;
  xdict = v4;
  if (relayPort)
  {
    xpc_dictionary_set_uint64(v4, "_remoteDeviceRelayPort", relayPort);
    v4 = xdict;
  }
  relayPid = self->_relayPid;
  if ((_DWORD)relayPid)
  {
    xpc_dictionary_set_uint64(xdict, "_remoteDeviceRelayPid", relayPid);
    v4 = xdict;
  }
  if (self->_handleDeviceLocally)
  {
    xpc_dictionary_set_flag(xdict, "_flags", 4);
    v4 = xdict;
  }

}

- (void)sendMessage:(id)a3
{
  id v4;

  v4 = a3;
  -[GTRelayedXPCConnection _setRoutingPropertiesForMessage:](self, "_setRoutingPropertiesForMessage:", v4);
  -[GTXPCConnection sendMessage:](self->_connection, "sendMessage:", v4);

}

- (void)sendMessage:(id)a3 replyHandler:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[GTRelayedXPCConnection _setRoutingPropertiesForMessage:](self, "_setRoutingPropertiesForMessage:", v7);
  -[GTXPCConnection sendMessage:replyHandler:](self->_connection, "sendMessage:replyHandler:", v7, v6);

}

- (void)sendMessageAndWaitForDelivery:(id)a3
{
  id v4;

  v4 = a3;
  -[GTRelayedXPCConnection _setRoutingPropertiesForMessage:](self, "_setRoutingPropertiesForMessage:", v4);
  -[GTXPCConnection sendMessageAndWaitForDelivery:](self->_connection, "sendMessageAndWaitForDelivery:", v4);

}

- (id)sendMessageWithReplySync:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[GTRelayedXPCConnection _setRoutingPropertiesForMessage:](self, "_setRoutingPropertiesForMessage:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GTXPCConnection sendMessageWithReplySync:error:](self->_connection, "sendMessageWithReplySync:error:", v6, a4));

  return v7;
}

- (BOOL)isTrusted
{
  return -[GTXPCConnection isTrusted](self->_connection, "isTrusted");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
