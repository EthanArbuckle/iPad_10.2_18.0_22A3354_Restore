@implementation _PresentVehicleListURLHandlingTask

- (void)performTask
{
  id v3;
  NSObject *v4;
  PresentVehicleListAction *v5;
  RichMapsActivity *v6;
  uint8_t v7[16];

  -[RichMapsActivityCreatingTaskImpl taskStarted](self, "taskStarted");
  v3 = sub_100431A4C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "_SiriIdleURLHandlingTask has been run", v7, 2u);
  }

  v5 = objc_alloc_init(PresentVehicleListAction);
  v6 = -[RichMapsActivity initWithMapsAction:]([RichMapsActivity alloc], "initWithMapsAction:", v5);
  -[URLHandlingTask taskFinished:](self, "taskFinished:", v6);

}

@end
