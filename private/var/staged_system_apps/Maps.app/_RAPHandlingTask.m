@implementation _RAPHandlingTask

- (_RAPHandlingTask)initWithData:(id)a3 recordIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  _RAPHandlingTask *v9;
  _RAPHandlingTask *v10;
  _RAPHandlingTask *v11;
  id v12;
  NSObject *v13;
  objc_super v15;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(objc_alloc((Class)GEORPProblemStatusResponse), "initWithData:", v6);
  if (v8)
  {
    v15.receiver = self;
    v15.super_class = (Class)_RAPHandlingTask;
    v9 = -[NotificationHandlingTask initWithData:recordIdentifier:](&v15, "initWithData:recordIdentifier:", v6, v7);
    v10 = v9;
    if (v9)
      objc_storeStrong((id *)&v9->_response, v8);
    self = v10;
    v11 = self;
  }
  else
  {
    v12 = sub_100431A4C();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "_AnnounceHandlingTask GEORPProblemStatusResponse nil with data", buf, 2u);
    }

    v11 = 0;
  }

  return v11;
}

- (void)performTask
{
  RichMapsActivity *v3;
  PresentRAPAction *v4;

  -[RichMapsActivityCreatingTaskImpl taskStarted](self, "taskStarted");
  -[NotificationHandlingTask _clearBulletin](self, "_clearBulletin");
  v4 = -[PresentRAPAction initWithResponse:]([PresentRAPAction alloc], "initWithResponse:", self->_response);
  v3 = -[RichMapsActivity initWithMapsAction:]([RichMapsActivity alloc], "initWithMapsAction:", v4);
  -[RichMapsActivityCreatingTaskImpl taskFinished:](self, "taskFinished:", v3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
}

@end
