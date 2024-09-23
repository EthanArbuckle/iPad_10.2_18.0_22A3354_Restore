@implementation CDKnowledgeDaemonConnection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daemon, 0);
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_authorizedEventStreamsToRead, 0);
}

- (void)executeQuery:(id)a3 reply:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;

  v17 = a3;
  v6 = (void (**)(id, _QWORD, void *))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemonConnection authorizedEventStreamsToRead](self, "authorizedEventStreamsToRead"));

  if (!v7)
    goto LABEL_8;
  v8 = (void *)objc_opt_class(v17);
  if (objc_msgSend(v8, "isEqual:", objc_opt_class(_DKEventQuery)))
  {
    v9 = v17;
    v10 = objc_alloc((Class)NSMutableSet);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "eventStreams"));
    v12 = objc_msgSend(v10, "initWithArray:", v11);

    if (!objc_msgSend(v12, "count")
      || (v13 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemonConnection authorizedEventStreamsToRead](self, "authorizedEventStreamsToRead")), objc_msgSend(v12, "minusSet:", v13), v13, objc_msgSend(v12, "count")))
    {

      goto LABEL_6;
    }
    v15 = objc_msgSend(v9, "resultType");

    if (v15)
      goto LABEL_6;
LABEL_8:
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemonConnection processName](self, "processName"));
    objc_msgSend(v17, "setClientName:", v16);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemonConnection daemon](self, "daemon"));
    objc_msgSend(v14, "executeQuery:reply:", v17, v6);
    goto LABEL_9;
  }
LABEL_6:
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemonConnection unauthorizedClientError](self, "unauthorizedClientError"));
  v6[2](v6, 0, v14);
LABEL_9:

}

- (NSString)processName
{
  return self->_processName;
}

- (CDKnowledgeDaemon)daemon
{
  return self->_daemon;
}

- (NSSet)authorizedEventStreamsToRead
{
  return self->_authorizedEventStreamsToRead;
}

- (id)unauthorizedClientError
{
  uint64_t v2;
  void *v3;
  void *v4;
  NSErrorUserInfoKey v6;
  const __CFString *v7;

  v2 = _DKErrorDomain;
  v6 = NSLocalizedDescriptionKey;
  v7 = CFSTR("unauthorized client");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v2, 9, v3));

  return v4;
}

- (void)saveObjects:(id)a3 reply:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = (void (**)(id, _QWORD, void *))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemonConnection authorizedEventStreamsToRead](self, "authorizedEventStreamsToRead"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemonConnection unauthorizedClientError](self, "unauthorizedClientError"));
    v6[2](v6, 0, v8);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemonConnection daemon](self, "daemon"));
    objc_msgSend(v8, "saveObjects:reply:", v9, v6);
  }

}

- (void)deleteObjects:(id)a3 reply:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = (void (**)(id, _QWORD, void *))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemonConnection authorizedEventStreamsToRead](self, "authorizedEventStreamsToRead"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemonConnection unauthorizedClientError](self, "unauthorizedClientError"));
    v6[2](v6, 0, v8);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemonConnection daemon](self, "daemon"));
    objc_msgSend(v8, "deleteObjects:reply:", v9, v6);
  }

}

- (void)deleteAllEventsInEventStreamNamed:(id)a3 reply:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = (void (**)(id, _QWORD, void *))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemonConnection authorizedEventStreamsToRead](self, "authorizedEventStreamsToRead"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemonConnection unauthorizedClientError](self, "unauthorizedClientError"));
    v6[2](v6, 0, v8);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemonConnection daemon](self, "daemon"));
    objc_msgSend(v8, "deleteAllEventsInEventStreamNamed:reply:", v9, v6);
  }

}

- (void)deleteAllEventsMatchingPredicate:(id)a3 reply:(id)a4
{
  void (**v6)(id, _QWORD, void *);
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = (void (**)(id, _QWORD, void *))a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemonConnection authorizedEventStreamsToRead](self, "authorizedEventStreamsToRead"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemonConnection unauthorizedClientError](self, "unauthorizedClientError"));
    v6[2](v6, 0, v8);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemonConnection daemon](self, "daemon"));
    objc_msgSend(v8, "deleteAllEventsMatchingPredicate:reply:", v9, v6);
  }

}

- (void)synchronizeWithReply:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  id v6;

  v4 = (void (**)(id, _QWORD))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemonConnection authorizedEventStreamsToRead](self, "authorizedEventStreamsToRead"));

  if (v5)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemonConnection unauthorizedClientError](self, "unauthorizedClientError"));
    v4[2](v4, 0);
  }
  else
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemonConnection daemon](self, "daemon"));
    objc_msgSend(v6, "synchronizeWithReply:", v4);
  }

}

- (void)synchronizeWithUrgency:(unint64_t)a3 client:(id)a4 reply:(id)a5
{
  void (**v8)(id, _QWORD, void *);
  void *v9;
  void *v10;
  id v11;

  v11 = a4;
  v8 = (void (**)(id, _QWORD, void *))a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemonConnection authorizedEventStreamsToRead](self, "authorizedEventStreamsToRead"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemonConnection unauthorizedClientError](self, "unauthorizedClientError"));
    v8[2](v8, 0, v10);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemonConnection daemon](self, "daemon"));
    objc_msgSend(v10, "synchronizeWithUrgency:client:reply:", a3, v11, v8);
  }

}

- (void)deleteRemoteState:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  id v6;

  v4 = (void (**)(id, _QWORD))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemonConnection authorizedEventStreamsToRead](self, "authorizedEventStreamsToRead"));

  if (v5)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemonConnection unauthorizedClientError](self, "unauthorizedClientError"));
    v4[2](v4, 0);
  }
  else
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemonConnection daemon](self, "daemon"));
    objc_msgSend(v6, "deleteRemoteState:", v4);
  }

}

- (void)sourceDeviceIdentityWithReply:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  id v6;

  v4 = (void (**)(id, _QWORD))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemonConnection authorizedEventStreamsToRead](self, "authorizedEventStreamsToRead"));

  if (v5)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemonConnection unauthorizedClientError](self, "unauthorizedClientError"));
    v4[2](v4, 0);
  }
  else
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemonConnection daemon](self, "daemon"));
    objc_msgSend(v6, "sourceDeviceIdentityWithReply:", v4);
  }

}

- (void)deviceUUIDWithReply:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  id v6;

  v4 = (void (**)(id, _QWORD))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemonConnection authorizedEventStreamsToRead](self, "authorizedEventStreamsToRead"));

  if (v5)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemonConnection unauthorizedClientError](self, "unauthorizedClientError"));
    v4[2](v4, 0);
  }
  else
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemonConnection daemon](self, "daemon"));
    objc_msgSend(v6, "deviceUUIDWithReply:", v4);
  }

}

- (void)confirmDatabaseConnectionWithReply:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemonConnection daemon](self, "daemon"));
  objc_msgSend(v5, "confirmDatabaseConnectionWithReply:", v4);

}

- (void)requestBiomeEndpoint:(BOOL)a3 reply:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[CDKnowledgeDaemonConnection daemon](self, "daemon"));
  objc_msgSend(v7, "requestBiomeEndpoint:reply:", v4, v6);

}

- (void)setAuthorizedEventStreamsToRead:(id)a3
{
  objc_storeStrong((id *)&self->_authorizedEventStreamsToRead, a3);
}

- (void)setProcessName:(id)a3
{
  objc_storeStrong((id *)&self->_processName, a3);
}

- (void)setDaemon:(id)a3
{
  objc_storeStrong((id *)&self->_daemon, a3);
}

@end
