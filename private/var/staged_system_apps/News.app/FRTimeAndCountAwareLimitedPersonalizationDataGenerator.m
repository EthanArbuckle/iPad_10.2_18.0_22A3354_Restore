@implementation FRTimeAndCountAwareLimitedPersonalizationDataGenerator

- (FRTimeAndCountAwareLimitedPersonalizationDataGenerator)initWithGenerator:(id)a3 configurationManager:(id)a4
{
  id v7;
  id v8;
  FRTimeAndCountAwareLimitedPersonalizationDataGenerator *v9;
  FRTimeAndCountAwareLimitedPersonalizationDataGenerator *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  if (!v7 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1000827D8();
    if (v8)
      goto LABEL_6;
  }
  else if (v8)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100082710();
LABEL_6:
  v12.receiver = self;
  v12.super_class = (Class)FRTimeAndCountAwareLimitedPersonalizationDataGenerator;
  v9 = -[FRTimeAndCountAwareLimitedPersonalizationDataGenerator init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_generator, a3);
    objc_storeStrong((id *)&v10->_configurationManager, a4);
  }

  return v10;
}

- (FRTimeAndCountAwareLimitedPersonalizationDataGenerator)init
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
    v6 = "-[FRTimeAndCountAwareLimitedPersonalizationDataGenerator init]";
    v7 = 2080;
    v8 = "FRLimitedPersonalizationDataGenerator.m";
    v9 = 1024;
    v10 = 23;
    v11 = 2114;
    v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FRTimeAndCountAwareLimitedPersonalizationDataGenerator init]"));
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v3, 0));

  objc_exception_throw(v4);
}

- (void)generateDerivedDataWithMaxAggregateCount:(unint64_t)a3 qualityOfService:(int64_t)a4 completion:(id)a5
{
  id v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  _QWORD block[5];
  id v13;
  unint64_t v14;

  v8 = a5;
  v9 = FCDispatchQueueForQualityOfService(a4);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006A8D4;
  block[3] = &unk_1000DE420;
  block[4] = self;
  v13 = v8;
  v14 = a3;
  v11 = v8;
  dispatch_async(v10, block);

}

- (FCPersonalizationDataGeneratorType)generator
{
  return self->_generator;
}

- (FCCoreConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationManager, 0);
  objc_storeStrong((id *)&self->_generator, 0);
}

@end
