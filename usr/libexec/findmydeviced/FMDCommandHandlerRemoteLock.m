@implementation FMDCommandHandlerRemoteLock

- (void)handleCommand
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler provider](self, "provider"));
  v8 = qword_100306B78;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("newPasscode")));

  objc_msgSend(v3, "setPasscodeLock:statusCode:", v5, &v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v8));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("status"));

  -[FMDCommandHandler didHandleCommandWithAckData:](self, "didHandleCommandWithAckData:", v6);
}

- (void)sendAckWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  signed int v10;
  uint64_t v11;
  NSObject *v12;
  FMDRequestAckLock *v13;
  void *v14;
  FMDRequestAckLock *v15;
  id v16;
  uint8_t v17[8];
  _QWORD v18[4];
  id v19;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ackURL")));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler provider](self, "provider"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler ackDataForCommand](self, "ackDataForCommand"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("status")));
  v10 = objc_msgSend(v9, "intValue");

  if (v6)
  {
    v11 = v10;
    v12 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v6));
    v13 = [FMDRequestAckLock alloc];
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
    v15 = -[FMDRequestAckLock initWithProvider:lockCommand:cmdStatusCode:ackURL:](v13, "initWithProvider:lockCommand:cmdStatusCode:ackURL:", v7, v14, v11, v12);

    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100020458;
    v18[3] = &unk_1002C1130;
    v19 = v4;
    -[FMDRequest setCompletionHandler:](v15, "setCompletionHandler:", v18);
    objc_msgSend(v7, "enqueueRequest:", v15);

  }
  else
  {
    v16 = sub_1000031B8();
    v12 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Not acking the lock command because there is no ack URL", v17, 2u);
    }
  }

}

@end
