@implementation FMDCommandHandlerRegistration

- (void)handleCommand
{
  dispatch_time_t v3;
  _QWORD block[5];

  v3 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AC6B0;
  block[3] = &unk_1002C1328;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
  -[FMDCommandHandler didHandleCommandWithAckData:](self, "didHandleCommandWithAckData:", 0);
}

- (void)sendAckWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  FMDActingRequestDecorator *v16;
  id v17;
  id v18;
  FMDActingRequestDecorator *v19;
  FMDRequestAckRegister *v20;
  void *v21;
  void *v22;
  FMDRequestAckRegister *v23;
  void *v24;
  uint8_t buf[8];
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ackURL")));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler provider](self, "provider"));
  if (v6)
  {
    v8 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v6));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("udid")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fm_nullToNil"));

    v24 = v4;
    if (objc_msgSend(v11, "length"))
    {
      v12 = objc_msgSend(objc_alloc((Class)FMDAccessoryIdentifier), "initWithString:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "accessoryRegistry"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "accessoryForIdentifier:", v12));

    }
    else
    {
      v14 = 0;
    }
    v16 = [FMDActingRequestDecorator alloc];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1000ACBB8;
    v28[3] = &unk_1002C1D48;
    v29 = v14;
    v17 = v7;
    v30 = v17;
    v18 = v14;
    v19 = -[FMDActingRequestDecorator initWithDeviceContextGenerator:deviceInfoGenerator:serverContextGenerator:requestHeaderGenerator:](v16, "initWithDeviceContextGenerator:deviceInfoGenerator:serverContextGenerator:requestHeaderGenerator:", &stru_1002C4CA0, v28, 0, 0);
    v20 = [FMDRequestAckRegister alloc];
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "account"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
    v23 = -[FMDRequestAckRegister initWithAccount:registerCommand:ackURL:](v20, "initWithAccount:registerCommand:ackURL:", v21, v22, v8);

    -[FMDRequest setDecorator:](v23, "setDecorator:", v19);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000ACC40;
    v26[3] = &unk_1002C1130;
    v4 = v24;
    v27 = v24;
    -[FMDRequest setCompletionHandler:](v23, "setCompletionHandler:", v26);
    objc_msgSend(v17, "enqueueRequest:", v23);

  }
  else
  {
    v15 = sub_1000031B8();
    v8 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Not acking the register command because there is no ack URL", buf, 2u);
    }
  }

}

@end
