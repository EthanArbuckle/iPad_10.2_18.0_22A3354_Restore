@implementation CPXConnection

- (CPXConnection)initWithIDSDeviceConnection:(id)a3 idsMessageContext:(id)a4 localSocket:(int)a5 bridgeSocket:(int)a6 localCompletion:(id)a7 bridgeCompletion:(id)a8 serviceName:(id)a9 servicePort:(unint64_t)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  CPXConnection *v21;
  id v22;
  id localCompletion;
  id v24;
  id bridgeCompletion;
  CPXConnection *v26;
  uint8_t buf[16];
  objc_super v30;

  v16 = a3;
  v17 = a4;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v30.receiver = self;
  v30.super_class = (Class)CPXConnection;
  v21 = -[CPXConnection init](&v30, "init");
  if (!v21)
  {
LABEL_7:
    v26 = v21;
    goto LABEL_11;
  }
  if (v16)
  {
    if (!v17 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "idsMessageContext was unexpectedly nil. This connection will not be boosted", buf, 2u);
    }
    objc_storeStrong((id *)&v21->_idsDeviceConnection, a3);
    objc_storeStrong((id *)&v21->_boostingMessageContext, a4);
    v21->_localSocket = a5;
    v21->_bridgeSocket = a6;
    v22 = objc_retainBlock(v18);
    localCompletion = v21->_localCompletion;
    v21->_localCompletion = v22;

    v24 = objc_retainBlock(v19);
    bridgeCompletion = v21->_bridgeCompletion;
    v21->_bridgeCompletion = v24;

    objc_storeStrong((id *)&v21->_serviceName, a9);
    v21->_servicePort = a10;
    goto LABEL_7;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "idsDeviceConnection cannot be nil!", buf, 2u);
  }
  v26 = 0;
LABEL_11:

  return v26;
}

- (int)localSocket
{
  return self->_localSocket;
}

- (int)bridgeSocket
{
  return self->_bridgeSocket;
}

- (id)localCompletion
{
  return self->_localCompletion;
}

- (id)bridgeCompletion
{
  return self->_bridgeCompletion;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (unint64_t)servicePort
{
  return self->_servicePort;
}

- (IDSDeviceConnection)idsDeviceConnection
{
  return self->_idsDeviceConnection;
}

- (IDSMessageContext)boostingMessageContext
{
  return self->_boostingMessageContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_boostingMessageContext, 0);
  objc_storeStrong((id *)&self->_idsDeviceConnection, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong(&self->_bridgeCompletion, 0);
  objc_storeStrong(&self->_localCompletion, 0);
}

@end
