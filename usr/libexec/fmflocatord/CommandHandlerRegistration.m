@implementation CommandHandlerRegistration

- (void)handleCommand
{
  dispatch_time_t v3;
  _QWORD block[5];

  -[CommandHandlerRegistration _beginXPCTransaction](self, "_beginXPCTransaction");
  v3 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100020304;
  block[3] = &unk_100055230;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
  -[CommandHandler didHandleCommandWithAckData:](self, "didHandleCommandWithAckData:", 0);
}

- (void)sendAckWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[CommandHandler provider](self, "provider"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CommandHandler commandParams](self, "commandParams"));
  objc_msgSend(v6, "ackRegisterCommand:withCompletion:", v5, v4);

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

@end
