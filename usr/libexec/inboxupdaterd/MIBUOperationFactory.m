@implementation MIBUOperationFactory

+ (id)sharedInstance
{
  if (qword_100068890 != -1)
    dispatch_once(&qword_100068890, &stru_100055848);
  return (id)qword_100068888;
}

- (id)buildCurrentOperationWithDelegate:(id)a3
{
  id v4;
  unint64_t v5;
  NSObject *v6;
  void *v7;
  int v9;
  unint64_t v10;

  v4 = a3;
  v5 = +[MIBUOperation currentOperationCode](MIBUOperation, "currentOperationCode");
  if (qword_100068958 != -1)
    dispatch_once(&qword_100068958, &stru_100055868);
  v6 = qword_100068950;
  if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 134217984;
    v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Current ongoing operation code is %lu", (uint8_t *)&v9, 0xCu);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MIBUOperationFactory buildOperationFromCode:andDelegate:](self, "buildOperationFromCode:andDelegate:", v5, v4));

  return v7;
}

- (id)buildOperationFromCode:(unint64_t)a3 andDelegate:(id)a4
{
  id v5;
  __objc2_class *v6;
  NSObject *v7;

  v5 = a4;
  if (a3)
  {
    if (a3 == 2)
    {
      v6 = MIBUDiagnosticsOperation;
      goto LABEL_6;
    }
    if (a3 == 1)
    {
      v6 = MIBUSoftwareUpdateOperation;
LABEL_6:
      a3 = (unint64_t)objc_msgSend([v6 alloc], "initWithDelegate:", v5);
      goto LABEL_12;
    }
    if (qword_100068958 != -1)
      dispatch_once(&qword_100068958, &stru_100055888);
    v7 = qword_100068950;
    if (os_log_type_enabled((os_log_t)qword_100068950, OS_LOG_TYPE_ERROR))
      sub_10003B23C(a3, v7);
    a3 = 0;
  }
LABEL_12:

  return (id)a3;
}

@end
