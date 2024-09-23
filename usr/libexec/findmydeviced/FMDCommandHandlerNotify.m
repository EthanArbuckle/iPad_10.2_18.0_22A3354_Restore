@implementation FMDCommandHandlerNotify

- (void)handleCommand
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  FMDUserNotificationContent *v11;
  void *v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  int v16;
  uint64_t v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("title")));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("body")));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("category")));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("deviceId")));

  if (v4)
  {
    if (v6)
    {
      if (v8)
      {
        if (v10)
        {
          v11 = objc_alloc_init(FMDUserNotificationContent);
          -[FMDUserNotificationContent setTitle:](v11, "setTitle:", v4);
          -[FMDUserNotificationContent setBody:](v11, "setBody:", v6);
          -[FMDUserNotificationContent setCategoryIdentifier:](v11, "setCategoryIdentifier:", v8);
          -[FMDUserNotificationContent setDeviceId:](v11, "setDeviceId:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[FMDFMIPManager sharedInstance](FMDFMIPManager, "sharedInstance"));
          objc_msgSend(v12, "addNotificationRequest:completion:", v11, &stru_1002C2B98);

          -[FMDCommandHandler didHandleCommandWithAckData:](self, "didHandleCommandWithAckData:", 0);
          goto LABEL_13;
        }
        v13 = 3;
      }
      else
      {
        v13 = 2;
      }
    }
    else
    {
      v13 = 1;
    }
  }
  else
  {
    v13 = 0;
  }
  v14 = sub_1000031B8();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 134217984;
    v17 = v13;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Notify command failed; missing : %lu",
      (uint8_t *)&v16,
      0xCu);
  }

  -[FMDCommandHandler didHandleCommandWithAckData:](self, "didHandleCommandWithAckData:", 0);
LABEL_13:

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
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  FMDActingRequestDecorator *v20;
  id v21;
  id v22;
  FMDActingRequestDecorator *v23;
  FMDRequestAckNotify *v24;
  void *v25;
  void *v26;
  FMDRequestAckNotify *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint8_t buf[8];
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ackURL")));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler provider](self, "provider"));
  if (v6)
  {
    v8 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v6));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler ackDataForCommand](self, "ackDataForCommand"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("status")));
    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("status")));
      v29 = (int)objc_msgSend(v11, "intValue");

    }
    else
    {
      v29 = 200;
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", CFSTR("udid")));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "fm_nullToNil"));

    v16 = v7;
    v30 = v9;
    v31 = v4;
    if (objc_msgSend(v15, "length"))
    {
      v17 = objc_msgSend(objc_alloc((Class)FMDAccessoryIdentifier), "initWithString:", v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "accessoryRegistry"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "accessoryForIdentifier:", v17));

      v7 = v16;
    }
    else
    {
      v19 = 0;
    }
    v20 = [FMDActingRequestDecorator alloc];
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_10002FC7C;
    v35[3] = &unk_1002C1D48;
    v36 = v19;
    v21 = v7;
    v37 = v21;
    v22 = v19;
    v23 = -[FMDActingRequestDecorator initWithDeviceContextGenerator:deviceInfoGenerator:serverContextGenerator:requestHeaderGenerator:](v20, "initWithDeviceContextGenerator:deviceInfoGenerator:serverContextGenerator:requestHeaderGenerator:", &stru_1002C2BB8, v35, 0, 0);
    v24 = [FMDRequestAckNotify alloc];
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "account"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[FMDCommandHandler commandParams](self, "commandParams"));
    v27 = -[FMDRequestAckNotify initWithAccount:messageCommand:cmdStatusCode:ackURL:](v24, "initWithAccount:messageCommand:cmdStatusCode:ackURL:", v25, v26, v29, v8);

    -[FMDRequest setDecorator:](v27, "setDecorator:", v23);
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10002FD04;
    v33[3] = &unk_1002C1130;
    v4 = v31;
    v34 = v31;
    -[FMDRequest setCompletionHandler:](v27, "setCompletionHandler:", v33);
    v28 = v21;
    v7 = v16;
    objc_msgSend(v28, "enqueueRequest:", v27);

  }
  else
  {
    v12 = sub_1000031B8();
    v8 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Not acking the message command because there is no ack URL", buf, 2u);
    }
  }

}

@end
