@implementation FMDCommandHandlerIdentityV5

- (void)handleCommand
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  FMDIdentityInfo *v12;
  dispatch_time_t v13;
  FMDIdentityInfo *v14;
  id v15;
  NSObject *v16;
  uint8_t v17[16];
  _QWORD block[5];
  FMDIdentityInfo *v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[FMXPCTransactionManager sharedInstance](FMXPCTransactionManager, "sharedInstance"));
  objc_msgSend(v3, "beginTransaction:", CFSTR("kFMDCommandHandlerIdentityV5TransactionName"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FMDStartupRegisterManager sharedInstance](FMDStartupRegisterManager, "sharedInstance"));
  objc_msgSend(v4, "eventDidOccur:", 11);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("timeoutInSec")));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("timeoutInSec")));
    v9 = (uint64_t)objc_msgSend(v8, "integerValue");

  }
  else
  {
    v9 = 60;
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("id")));

  v12 = -[FMDIdentityInfo initWithVersion:timeoutIntervalInSec:commandID:]([FMDIdentityInfo alloc], "initWithVersion:timeoutIntervalInSec:commandID:", 5, v9, v11);
  v13 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100053A1C;
  block[3] = &unk_1002C13E8;
  block[4] = self;
  v19 = v12;
  v14 = v12;
  dispatch_after(v13, (dispatch_queue_t)&_dispatch_main_q, block);
  v15 = sub_1000031B8();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Scheduled identityV5", v17, 2u);
  }

  -[FMDCommandHandler didHandleCommandWithAckData:](self, "didHandleCommandWithAckData:", 0);
}

- (void)sendAckWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  FMDRequestAckIdentity *v9;
  void *v10;
  FMDRequestAckIdentity *v11;
  id v12;
  uint8_t v13[8];
  _QWORD v14[4];
  id v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ackURL")));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler provider](self, "provider"));
  if (v6)
  {
    v8 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v6));
    v9 = [FMDRequestAckIdentity alloc];
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
    v11 = -[FMDRequestAckIdentity initWithProvider:identityCommand:commandFailureReason:ackURL:](v9, "initWithProvider:identityCommand:commandFailureReason:ackURL:", v7, v10, 0, v8);

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100053BFC;
    v14[3] = &unk_1002C1130;
    v15 = v4;
    -[FMDRequest setCompletionHandler:](v11, "setCompletionHandler:", v14);
    objc_msgSend(v7, "enqueueRequest:", v11);

  }
  else
  {
    v12 = sub_1000031B8();
    v8 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Not acking the identity command because there is no ack URL", v13, 2u);
    }
  }

}

@end
