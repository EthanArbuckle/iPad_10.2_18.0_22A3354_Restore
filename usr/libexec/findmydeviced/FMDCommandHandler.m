@implementation FMDCommandHandler

- (FMDCommandHandler)initWithParams:(id)a3 provider:(id)a4
{
  id v6;
  id v7;
  FMDCommandHandler *v8;
  FMDCommandHandler *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)FMDCommandHandler;
  v8 = -[FMDCommandHandler init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    -[FMDCommandHandler setCommandParams:](v8, "setCommandParams:", v6);
    -[FMDCommandHandler setProvider:](v9, "setProvider:", v7);
    -[FMDCommandHandler setRequiresAsynchronousAck:](v9, "setRequiresAsynchronousAck:", 0);
  }

  return v9;
}

- (void)executeCommand
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  uint8_t buf[4];
  void *v15;

  v3 = sub_1000031B8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_100227934(self, v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMDStartupRegisterManager sharedInstance](FMDStartupRegisterManager, "sharedInstance"));
  objc_msgSend(v5, "eventDidOccur:", 9);

  if (-[FMDCommandHandler isPreviouslyHandledCommand](self, "isPreviouslyHandledCommand"))
  {
    v6 = sub_1000031B8();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler fm_logID](self, "fm_logID"));
      *(_DWORD *)buf = 138412290;
      v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ already seen before. Ignoring this & sending the same ack as last time...", buf, 0xCu);

    }
    -[FMDCommandHandler requiresAsynchronousAck](self, "requiresAsynchronousAck");
  }
  else
  {
    -[FMDCommandHandler handleCommand](self, "handleCommand");
    if (-[FMDCommandHandler requiresAsynchronousAck](self, "requiresAsynchronousAck"))
      return;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler provider](self, "provider"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandID](self, "commandID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "futureForCommandId:", v10));

  if (v11)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000377DC;
    v13[3] = &unk_1002C15E8;
    v13[4] = self;
    v12 = objc_msgSend(v11, "addCompletionBlock:", v13);
  }
  else
  {
    -[FMDCommandHandler sendAckWithCompletion:](self, "sendAckWithCompletion:", &stru_1002C2C58);
  }

}

- (void)dealloc
{
  objc_super v3;

  -[FMDCommandHandler setProvider:](self, "setProvider:", 0);
  v3.receiver = self;
  v3.super_class = (Class)FMDCommandHandler;
  -[FMDCommandHandler dealloc](&v3, "dealloc");
}

- (NSString)commandName
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("cmd")));

  return (NSString *)v3;
}

- (NSString)commandID
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("id")));

  return (NSString *)v3;
}

- (BOOL)isPreviouslyHandledCommand
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandName](self, "commandName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("command-%@-id"), v3));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMPreferencesUtil stringForKey:inDomain:](FMPreferencesUtil, "stringForKey:inDomain:", v4, kFMDPrefDomain));
  if (v5
    && (v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandID](self, "commandID")),
        v7 = objc_msgSend(v6, "isEqualToString:", v5),
        v6,
        (v7 & 1) != 0))
  {
    v8 = 1;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandContext](self, "commandContext"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "lastCompletedIntentDictionary"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("id")));

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandID](self, "commandID"));
      v8 = objc_msgSend(v12, "isEqualToString:", v11);

    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (NSDictionary)ackDataForCommand
{
  NSDictionary *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = self->_ackDataForCommand;
  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandContext](self, "commandContext"));

    if (v4)
    {
      v3 = (NSDictionary *)&off_1002D9390;
    }
    else
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandName](self, "commandName"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("command-%@-ackData"), v5));

      v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue(+[FMPreferencesUtil dictionaryForKey:inDomain:](FMPreferencesUtil, "dictionaryForKey:inDomain:", v6, kFMDPrefDomain));
    }
  }
  return v3;
}

- (void)didHandleCommandWithAckData:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v12 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandContext](self, "commandContext"));

  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandName](self, "commandName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("command-%@-id"), v5));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandName](self, "commandName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("command-%@-ackData"), v7));

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandID](self, "commandID"));
    +[FMPreferencesUtil setString:forKey:inDomain:](FMPreferencesUtil, "setString:forKey:inDomain:", v9, v6, kFMDPrefDomain);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandID](self, "commandID"));
    if (v10)
      v11 = v12;
    else
      v11 = 0;
    +[FMPreferencesUtil setDictionary:forKey:inDomain:](FMPreferencesUtil, "setDictionary:forKey:inDomain:", v11, v8, kFMDPrefDomain);

  }
  -[FMDCommandHandler setAckDataForCommand:](self, "setAckDataForCommand:", v12);
  if (-[FMDCommandHandler requiresAsynchronousAck](self, "requiresAsynchronousAck"))
    -[FMDCommandHandler sendAckWithCompletion:](self, "sendAckWithCompletion:", &stru_1002C2C78);

}

- (void)sendAckWithCompletion:(id)a3
{
  if (a3)
    (*((void (**)(id, uint64_t))a3 + 2))(a3, 1);
}

- (id)fm_logID
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandName](self, "commandName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Command-%@(0x%p)"), v3, self));

  return v4;
}

- (NSDictionary)commandParams
{
  return self->_commandParams;
}

- (void)setCommandParams:(id)a3
{
  objc_storeStrong((id *)&self->_commandParams, a3);
}

- (FMDCommandContext)commandContext
{
  return self->_commandContext;
}

- (void)setCommandContext:(id)a3
{
  objc_storeStrong((id *)&self->_commandContext, a3);
}

- (FMDServiceProvider)provider
{
  return (FMDServiceProvider *)objc_loadWeakRetained((id *)&self->_provider);
}

- (void)setProvider:(id)a3
{
  objc_storeWeak((id *)&self->_provider, a3);
}

- (void)setAckDataForCommand:(id)a3
{
  objc_storeStrong((id *)&self->_ackDataForCommand, a3);
}

- (BOOL)requiresAsynchronousAck
{
  return self->_requiresAsynchronousAck;
}

- (void)setRequiresAsynchronousAck:(BOOL)a3
{
  self->_requiresAsynchronousAck = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ackDataForCommand, 0);
  objc_destroyWeak((id *)&self->_provider);
  objc_storeStrong((id *)&self->_commandContext, 0);
  objc_storeStrong((id *)&self->_commandParams, 0);
}

@end
