@implementation _SiriIdleURLHandlingTask

- (void)performTask
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  -[RichMapsActivityCreatingTaskImpl taskStarted](self, "taskStarted");
  v3 = sub_100431A4C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "_SiriIdleURLHandlingTask has been run", v5, 2u);
  }

  -[URLHandlingTask taskFailed](self, "taskFailed");
}

@end
