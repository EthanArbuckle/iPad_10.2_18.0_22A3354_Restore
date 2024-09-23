@implementation PRNSXPCConnection

- (PRNSXPCConnection)initWithConnection:(id)a3
{
  id v5;
  PRNSXPCConnection *v6;
  PRNSXPCConnection *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PRNSXPCConnection;
  v6 = -[PRNSXPCConnection init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    v7->_maxAllowedOutgoingMessages = 1000;
    atomic_store(0, &v7->outgoingMessagesCount.__a_.__a_value);
  }

  return v7;
}

- (void)actOnRemoteObjectAndScheduleBarrierBlock:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  void *v6;
  atomic<unsigned long> *p_outgoingMessagesCount;
  unint64_t v8;
  unint64_t v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSXPCConnection *connection;
  _QWORD v17[5];
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  NSErrorUserInfoKey v25;
  const __CFString *v26;

  v4 = (void (**)(id, _QWORD))a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_10029AF58;
  v23 = sub_10029AF68;
  v24 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PRNSXPCConnection connection](self, "connection"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10029AF70;
  v18[3] = &unk_100811EA0;
  v18[4] = &v19;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v18));

  if (v20[5])
  {
    v4[2](v4, 0);
  }
  else
  {
    p_outgoingMessagesCount = &self->outgoingMessagesCount;
    do
    {
      v8 = __ldaxr(&p_outgoingMessagesCount->__a_.__a_value);
      v9 = v8 + 1;
    }
    while (__stlxr(v8 + 1, &p_outgoingMessagesCount->__a_.__a_value));
    if (v9 <= -[PRNSXPCConnection maxAllowedOutgoingMessages](self, "maxAllowedOutgoingMessages"))
    {
      ((void (*)(void (**)(id, _QWORD), void *, uint64_t))v4[2])(v4, v6, v20[5]);
      if (__ROR8__(0x8F5C28F5C28F5C29 * v9, 2) <= 0x28F5C28F5C28F5CuLL)
      {
        connection = self->_connection;
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_10029AF80;
        v17[3] = &unk_1007FB340;
        v17[4] = self;
        -[NSXPCConnection scheduleSendBarrierBlock:](connection, "scheduleSendBarrierBlock:", v17);
      }
    }
    else
    {
      v10 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_ERROR))
        sub_1003E56D0(v9, v10);
      v25 = NSLocalizedDescriptionKey;
      v26 = CFSTR("FATAL CLIENT ERROR: Client hasn't dequeued xpc messages. Invalidating connection.");
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
      v12 = PRErrorWithCodeAndUserInfo(2001, v11);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      v14 = (void *)v20[5];
      v20[5] = v13;

      ((void (*)(void (**)(id, _QWORD), _QWORD, uint64_t))v4[2])(v4, 0, v20[5]);
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[PRNSXPCConnection connection](self, "connection"));
      objc_msgSend(v15, "invalidate");

    }
  }

  _Block_object_dispose(&v19, 8);
}

- (void)invalidate
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PRNSXPCConnection connection](self, "connection"));
  objc_msgSend(v3, "invalidate");

  -[PRNSXPCConnection setConnection:](self, "setConnection:", 0);
}

- (unint64_t)maxAllowedOutgoingMessages
{
  return self->_maxAllowedOutgoingMessages;
}

- (void)setMaxAllowedOutgoingMessages:(unint64_t)a3
{
  self->_maxAllowedOutgoingMessages = a3;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
