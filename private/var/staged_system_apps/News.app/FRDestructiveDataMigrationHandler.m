@implementation FRDestructiveDataMigrationHandler

- (void)handleMigration
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRDestructiveDataMigrationHandler privateDataActionProvider](self, "privateDataActionProvider"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000069C8;
  v4[3] = &unk_1000DE4B8;
  v4[4] = self;
  objc_msgSend(v3, "consumeActionsUpToDestructiveActionSyncWithBlock:", v4);

}

- (FRDestructiveDataMigrationHandler)initWithPrivateDataActionProvider:(id)a3 defaultsDataDestructionItems:(id)a4
{
  id v7;
  id v8;
  FRDestructiveDataMigrationHandler *v9;
  FRDestructiveDataMigrationHandler *v10;
  NSArray *v11;
  NSArray *defaultsDataDestructionItems;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  if (!v7 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100082DBC();
    if (v8)
      goto LABEL_6;
  }
  else if (v8)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100082CF4();
LABEL_6:
  v14.receiver = self;
  v14.super_class = (Class)FRDestructiveDataMigrationHandler;
  v9 = -[FRDestructiveDataMigrationHandler init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_privateDataActionProvider, a3);
    v11 = (NSArray *)objc_msgSend(v8, "copy");
    defaultsDataDestructionItems = v10->_defaultsDataDestructionItems;
    v10->_defaultsDataDestructionItems = v11;

  }
  return v10;
}

- (FCDestructivePrivateDataActionProvider)privateDataActionProvider
{
  return self->_privateDataActionProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultsDataDestructionItems, 0);
  objc_storeStrong((id *)&self->_privateDataActionProvider, 0);
}

- (FRDestructiveDataMigrationHandler)init
{
  id v2;
  void *v3;
  id v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  id v12;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v2 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v6 = "-[FRDestructiveDataMigrationHandler init]";
    v7 = 2080;
    v8 = "FRDestructiveDataMigrationHandler.m";
    v9 = 1024;
    v10 = 29;
    v11 = 2114;
    v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FRDestructiveDataMigrationHandler init]"));
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v3, 0));

  objc_exception_throw(v4);
}

- (void)setPrivateDataActionProvider:(id)a3
{
  objc_storeStrong((id *)&self->_privateDataActionProvider, a3);
}

- (NSArray)defaultsDataDestructionItems
{
  return self->_defaultsDataDestructionItems;
}

- (void)setDefaultsDataDestructionItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

@end
