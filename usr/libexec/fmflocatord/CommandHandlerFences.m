@implementation CommandHandlerFences

- (void)handleCommand
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  void **v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CommandHandler commandParams](self, "commandParams"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("fences")));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fm_map:", &stru_100055AD0));
  v6 = sub_10001C4E8();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    sub_100034904((uint64_t)v5, v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CommandHandler commandParams](self, "commandParams"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("fenceVersion")));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CommandHandler commandParams](self, "commandParams"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("triggerurl")));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CommandHandler commandParams](self, "commandParams"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("validityDurationInSecs")));

  if (v13)
    objc_msgSend(v13, "doubleValue");
  else
    v14 = 0x40BC200000000000;
  v18 = _NSConcreteStackBlock;
  v19 = 3221225472;
  v20 = sub_10001A880;
  v21 = &unk_100055AF8;
  v22 = v5;
  v23 = v9;
  v25 = v14;
  v24 = v11;
  v15 = v11;
  v16 = v9;
  v17 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &v18);
  -[CommandHandler didHandleCommandWithAckData:](self, "didHandleCommandWithAckData:", 0, v18, v19, v20, v21);

}

- (void)sendAckWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[CommandHandler provider](self, "provider"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CommandHandler commandParams](self, "commandParams"));
  objc_msgSend(v6, "ackFencesCommand:withCompletion:", v5, v4);

}

@end
