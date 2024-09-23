@implementation DMDConfigurationSourceEventsOperation

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)main
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD v8[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DMDConfigurationSourceTaskOperation controller](self, "controller"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "delegate"));
  v5 = objc_opt_respondsToSelector(v4, "configurationSourceController:fetchEventsWithCompletionHandler:");
  if ((v5 & 1) != 0)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10003199C;
    v8[3] = &unk_1000BAB88;
    v8[4] = self;
    objc_msgSend(v4, "configurationSourceController:fetchEventsWithCompletionHandler:", v3, v8);
  }
  else
  {
    v6 = DMFConfigurationEngineLog(v5);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1000746B4(v7);

    -[DMDConfigurationSourceEventsOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
  }

}

@end
