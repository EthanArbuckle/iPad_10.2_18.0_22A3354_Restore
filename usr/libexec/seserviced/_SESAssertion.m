@implementation _SESAssertion

- (_SESAssertion)initWithRemoteObject:(id)a3 keyIdentifier:(id)a4 appletIdentifier:(id)a5 options:(id)a6 queue:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _SESAssertion *v18;
  _SESAssertion *v19;
  uint64_t v20;
  NSData *keyIdentifier;
  uint64_t v22;
  NSData *appletIdentifier;
  uint64_t v24;
  NSString *assertionID;
  objc_super v27;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v27.receiver = self;
  v27.super_class = (Class)_SESAssertion;
  v18 = -[_SESAssertion init](&v27, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong(&v18->_remoteObject, a3);
    objc_storeStrong((id *)&v19->_queue, a7);
    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "hexStringAsData"));
    keyIdentifier = v19->_keyIdentifier;
    v19->_keyIdentifier = (NSData *)v20;

    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "hexStringAsData"));
    appletIdentifier = v19->_appletIdentifier;
    v19->_appletIdentifier = (NSData *)v22;

    objc_storeStrong((id *)&v19->_options, a6);
    v24 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v19));
    assertionID = v19->_assertionID;
    v19->_assertionID = (NSString *)v24;

  }
  return v19;
}

+ (id)validateEntitlements:(id)a3 appletIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  unsigned __int8 v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v21;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "hexStringAsData"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[_SESSessionClientInfo withConnection:](_SESSessionClientInfo, "withConnection:", v6));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("A000000809434343444B417631"), "hexStringAsData"));
  if (objc_msgSend(v9, "isEqualToData:", v7))
  {
    v10 = objc_msgSend(v8, "dckSessionEntitlement");

    if ((v10 & 1) != 0)
      goto LABEL_7;
  }
  else
  {

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("A000000909ACCE5501"), "hexStringAsData"));
  if (!objc_msgSend(v11, "isEqualToData:", v7))
  {

    goto LABEL_9;
  }
  v12 = objc_msgSend(v8, "acwgSessionEntitlement");

  if ((v12 & 1) == 0)
  {
LABEL_9:
    v16 = SESDefaultLogObject(v13, v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = SESErrorDomain;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "clientName"));
    v19 = SESCreateAndLogError(0, v17, v18, 0, CFSTR("Client %@ missing entitlement to create assertion for %@"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(v19);

    goto LABEL_10;
  }
LABEL_7:
  v15 = 0;
LABEL_10:

  return v15;
}

- (id)start
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  OS_os_transaction *keepAlive;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  unsigned int v17;
  OS_os_transaction *v18;
  void *v19;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint8_t buf[4];
  _SESAssertion *v27;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = SESDefaultLogObject(v3, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v27 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "SESAssertion start %@", buf, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("A000000809434343444B417631"), "hexStringAsData"));
  v8 = objc_msgSend(v7, "isEqualToData:", self->_appletIdentifier);

  if (!v8)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("A000000909ACCE5501"), "hexStringAsData"));
    v17 = objc_msgSend(v16, "isEqualToData:", self->_appletIdentifier);

    if (!v17)
    {
LABEL_9:
      v18 = (OS_os_transaction *)os_transaction_create("com.apple.seserviced._assertion.ostransaction");
      v19 = 0;
      keepAlive = self->_keepAlive;
      self->_keepAlive = v18;
      goto LABEL_10;
    }
    keepAlive = (OS_os_transaction *)objc_claimAutoreleasedReturnValue(+[LyonExternal shared](_TtC10seserviced12LyonExternal, "shared"));
    -[OS_os_transaction updatePassSelectionState:](keepAlive, "updatePassSelectionState:", 1);
LABEL_8:

    goto LABEL_9;
  }
  v9 = &unk_100342000;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[AlishaExternal shared](_TtC10seserviced14AlishaExternal, "shared"));
  keepAlive = (OS_os_transaction *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "getEndpointWithKeyIdentifier:", self->_keyIdentifier));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[OS_os_transaction bleUUID](keepAlive, "bleUUID"));
  if (v12)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[AlishaExternal shared](_TtC10seserviced14AlishaExternal, "shared"));
    objc_msgSend(v15, "onAssertionAcquiredWithIdentifier:for:", self->_assertionID, self->_keyIdentifier);

    goto LABEL_8;
  }
  v21 = SESDefaultLogObject(v13, v14);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = SESErrorDomain;
  if (keepAlive)
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[OS_os_transaction bleUUID](keepAlive, "bleUUID"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSData asHexString](self->_keyIdentifier, "asHexString"));
  v24 = SESCreateAndLogError(0, v22, v23, 4, CFSTR("Endpoint does not exist %d or is not paired %d for key identifier %@"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(v24);

  if (keepAlive)
LABEL_10:

  return v19;
}

- (void)stop
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  unsigned int v7;
  OS_os_transaction *keepAlive;
  id remoteObject;
  void (**didEndCallback)(id, _SESAssertion *);
  id v11;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_remoteObject)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("A000000809434343444B417631"), "hexStringAsData"));
    v4 = objc_msgSend(v3, "isEqualToData:", self->_appletIdentifier);

    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[AlishaExternal shared](_TtC10seserviced14AlishaExternal, "shared"));
      objc_msgSend(v5, "onAssertionReleasedWithIdentifier:for:", self->_assertionID, self->_keyIdentifier);
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("A000000909ACCE5501"), "hexStringAsData"));
      v7 = objc_msgSend(v6, "isEqualToData:", self->_appletIdentifier);

      if (!v7)
        goto LABEL_7;
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[LyonExternal shared](_TtC10seserviced12LyonExternal, "shared"));
      objc_msgSend(v5, "updatePassSelectionState:", 0);
    }

LABEL_7:
    keepAlive = self->_keepAlive;
    self->_keepAlive = 0;

    remoteObject = self->_remoteObject;
    self->_remoteObject = 0;

    didEndCallback = (void (**)(id, _SESAssertion *))self->_didEndCallback;
    if (didEndCallback)
    {
      didEndCallback[2](didEndCallback, self);
      v11 = self->_didEndCallback;
      self->_didEndCallback = 0;

    }
  }
}

- (void)invalidateInternal
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  _SESAssertion *v8;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = SESDefaultLogObject(v3, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "SESAssertion invalidateInternal %@", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(self->_remoteObject, "didInvalidate");
  -[_SESAssertion stop](self, "stop");
}

- (void)invalidate:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10005CE40;
  v7[3] = &unk_100303078;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 64, 1);
}

- (void)setConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (id)didEndCallback
{
  return self->_didEndCallback;
}

- (void)setDidEndCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didEndCallback, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_assertionID, 0);
  objc_storeStrong((id *)&self->_keepAlive, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_appletIdentifier, 0);
  objc_storeStrong((id *)&self->_keyIdentifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_remoteObject, 0);
}

@end
