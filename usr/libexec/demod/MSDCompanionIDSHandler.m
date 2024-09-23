@implementation MSDCompanionIDSHandler

- (void)start
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MSDCompanionIDSHandler;
  -[MSDIDSHandler start](&v10, "start");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDIDSHandler idsService](self, "idsService"));
  objc_msgSend(v3, "setProtobufAction:forIncomingRequestsOfType:", "handleHeartbeat:", 5);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDIDSHandler idsService](self, "idsService"));
  objc_msgSend(v4, "setProtobufAction:forIncomingResponsesOfType:", "handlePairedWatchCommandResponse:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDIDSHandler idsService](self, "idsService"));
  objc_msgSend(v5, "setProtobufAction:forIncomingResponsesOfType:", "handlePairedWatchCommandResponse:", 1);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDIDSHandler idsService](self, "idsService"));
  objc_msgSend(v6, "setProtobufAction:forIncomingResponsesOfType:", "handlePairedWatchCommandResponse:", 2);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDIDSHandler idsService](self, "idsService"));
  objc_msgSend(v7, "setProtobufAction:forIncomingResponsesOfType:", "handlePairedWatchCommandResponse:", 3);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDIDSHandler idsService](self, "idsService"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDIDSHandler idsServiceQueue](self, "idsServiceQueue"));
  objc_msgSend(v8, "addDelegate:queue:", self, v9);

}

- (void)handleHeartbeat:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint8_t v7[8];
  uint64_t v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "data"));
  v8 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v3, 0, &v8));
  v5 = sub_1000604F0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received heartbeat from paired watch.", v7, 2u);
  }

}

- (void)handlePairedWatchCommandResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  unsigned int v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD);
  id v15;
  NSObject *v16;
  _BOOL4 v17;
  id v18;
  uint8_t buf[4];
  unint64_t v20;
  __int16 v21;
  void *v22;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "data"));
  v18 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v5, 0, &v18));
  v7 = v18;
  v8 = objc_msgSend(v4, "type");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("RequestResult")));
  v10 = objc_msgSend(v9, "BOOLValue");

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "context"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "incomingResponseIdentifier"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDIDSHandler responseHandlers](self, "responseHandlers"));
  v14 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", v12));

  v15 = sub_1000604F0();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (v14)
  {
    if (v17)
    {
      *(_DWORD *)buf = 134218242;
      v20 = v8;
      v21 = 2114;
      v22 = v12;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Received ACK for type: %ld identifier: %{public}@", buf, 0x16u);
    }

    ((void (**)(_QWORD, id))v14)[2](v14, v10);
    v16 = objc_claimAutoreleasedReturnValue(-[MSDIDSHandler responseHandlers](self, "responseHandlers"));
    -[NSObject removeObjectForKey:](v16, "removeObjectForKey:", v12);
  }
  else if (v17)
  {
    *(_DWORD *)buf = 138543362;
    v20 = (unint64_t)v12;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Received ACK for unknown request identifier: %{public}@", buf, 0xCu);
  }

}

@end
