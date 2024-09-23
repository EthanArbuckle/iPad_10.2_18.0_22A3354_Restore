@implementation MIBUOperation

+ (unint64_t)currentOperationCode
{
  void *v2;
  void *v3;
  unint64_t v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MIBUDefaultPreferences objectForKey:](MIBUDefaultPreferences, "objectForKey:", CFSTR("CurrentOperation")));
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "unsignedIntValue");
  else
    v4 = 0;

  return v4;
}

- (MIBUOperation)initWithDelegate:(id)a3
{
  id v4;
  MIBUOperation *v5;
  MIBUOperation *v6;
  NSString *v7;
  id v8;
  dispatch_queue_t v9;
  NSError *error;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MIBUOperation;
  v5 = -[MIBUOperation init](&v12, "init");
  v6 = v5;
  if (v5)
  {
    -[MIBUOperation setOpCode:](v5, "setOpCode:", 0);
    -[MIBUOperation setDelegate:](v6, "setDelegate:", v4);
    v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.mibu_%@_op_queue"), objc_opt_class(v6));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v7));
    v9 = dispatch_queue_create((const char *)objc_msgSend(v8, "UTF8String"), 0);
    -[MIBUOperation setSyncQueue:](v6, "setSyncQueue:", v9);

    error = v6->_error;
    v6->_error = 0;

  }
  return v6;
}

- (void)resume
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[MIBUOperation syncQueue](self, "syncQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100013D84;
  block[3] = &unk_100055CF0;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)terminateNow
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[MIBUOperation syncQueue](self, "syncQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100013DF8;
  block[3] = &unk_100055CF0;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (NSDictionary)details
{
  return 0;
}

- (BOOL)inProgress
{
  unint64_t v3;

  v3 = +[MIBUOperation currentOperationCode](MIBUOperation, "currentOperationCode");
  if (v3)
    LOBYTE(v3) = v3 == -[MIBUOperation opCode](self, "opCode");
  return v3;
}

- (BOOL)saveOpCode
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[MIBUOperation opCode](self, "opCode")));
  v3 = +[MIBUDefaultPreferences setObject:forKey:](MIBUDefaultPreferences, "setObject:forKey:", v2, CFSTR("CurrentOperation"));

  return v3;
}

- (BOOL)isCommandAllowed:(id)a3
{
  return 1;
}

- (NSError)error
{
  return self->_error;
}

- (unint64_t)opCode
{
  return self->_opCode;
}

- (void)setOpCode:(unint64_t)a3
{
  self->_opCode = a3;
}

- (MIBUOperationDelegate)delegate
{
  return (MIBUOperationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)syncQueue
{
  return self->_syncQueue;
}

- (void)setSyncQueue:(id)a3
{
  objc_storeStrong((id *)&self->_syncQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
