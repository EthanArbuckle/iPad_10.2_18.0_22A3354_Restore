@implementation CommandHandler

- (CommandHandler)initWithParams:(id)a3 provider:(id)a4
{
  id v6;
  id v7;
  CommandHandler *v8;
  CommandHandler *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CommandHandler;
  v8 = -[CommandHandler init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    -[CommandHandler setCommandParams:](v8, "setCommandParams:", v6);
    -[CommandHandler setProvider:](v9, "setProvider:", v7);
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

  v3 = sub_10001C4E8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_100033B28(self, v4);

  -[CommandHandler _beginXPCTransaction](self, "_beginXPCTransaction");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[StartupRegisterManager sharedInstance](StartupRegisterManager, "sharedInstance"));
  objc_msgSend(v5, "eventDidOccur:", 9);

  if (-[CommandHandler isPreviouslyHandledCommand](self, "isPreviouslyHandledCommand"))
  {
    v6 = sub_10001C4E8();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      sub_100033A94(self, v7);

  }
  else
  {
    -[CommandHandler handleCommand](self, "handleCommand");
  }
  -[CommandHandler sendAckWithCompletion:](self, "sendAckWithCompletion:", &stru_1000553C0);
  -[CommandHandler _endXPCTransaction](self, "_endXPCTransaction");
}

- (void)dealloc
{
  objc_super v3;

  -[CommandHandler setProvider:](self, "setProvider:", 0);
  v3.receiver = self;
  v3.super_class = (Class)CommandHandler;
  -[CommandHandler dealloc](&v3, "dealloc");
}

- (NSString)commandName
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CommandHandler commandParams](self, "commandParams"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("cmd")));

  return (NSString *)v3;
}

- (NSString)commandID
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CommandHandler commandParams](self, "commandParams"));
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CommandHandler commandName](self, "commandName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("command-%@-id"), v3));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMPreferencesUtil stringForKey:inDomain:](FMPreferencesUtil, "stringForKey:inDomain:", v4, CFSTR("com.apple.icloud.fmflocatord")));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CommandHandler commandID](self, "commandID"));
    v7 = objc_msgSend(v6, "isEqualToString:", v5);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSDictionary)ackDataForCommand
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CommandHandler commandName](self, "commandName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("command-%@-ackData"), v2));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FMPreferencesUtil dictionaryForKey:inDomain:](FMPreferencesUtil, "dictionaryForKey:inDomain:", v3, CFSTR("com.apple.icloud.fmflocatord")));
  return (NSDictionary *)v4;
}

- (void)didHandleCommandWithAckData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CommandHandler commandName](self, "commandName"));
  v11 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("command-%@-id"), v5));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CommandHandler commandName](self, "commandName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("command-%@-ackData"), v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CommandHandler commandID](self, "commandID"));
  +[FMPreferencesUtil setString:forKey:inDomain:](FMPreferencesUtil, "setString:forKey:inDomain:", v8, v11, CFSTR("com.apple.icloud.fmflocatord"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CommandHandler commandID](self, "commandID"));
  if (v9)
    v10 = v4;
  else
    v10 = 0;
  +[FMPreferencesUtil setDictionary:forKey:inDomain:](FMPreferencesUtil, "setDictionary:forKey:inDomain:", v10, v7, CFSTR("com.apple.icloud.fmflocatord"));

}

- (void)sendAckWithCompletion:(id)a3
{
  if (a3)
    (*((void (**)(id, uint64_t))a3 + 2))(a3, 1);
}

- (id)loggingID
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CommandHandler commandName](self, "commandName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Command-%@(0x%X)"), v3, self));

  return v4;
}

- (void)_beginXPCTransaction
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%X"), v5, self));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[FMXPCTransactionManager sharedInstance](FMXPCTransactionManager, "sharedInstance"));
  objc_msgSend(v6, "beginTransaction:", v7);

}

- (void)_endXPCTransaction
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%X"), v5, self));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[FMXPCTransactionManager sharedInstance](FMXPCTransactionManager, "sharedInstance"));
  objc_msgSend(v6, "endTransaction:", v7);

}

- (NSDictionary)commandParams
{
  return self->_commandParams;
}

- (void)setCommandParams:(id)a3
{
  objc_storeStrong((id *)&self->_commandParams, a3);
}

- (FindBaseServiceProvider)provider
{
  return (FindBaseServiceProvider *)objc_loadWeakRetained((id *)&self->_provider);
}

- (void)setProvider:(id)a3
{
  objc_storeWeak((id *)&self->_provider, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_provider);
  objc_storeStrong((id *)&self->_commandParams, 0);
}

@end
