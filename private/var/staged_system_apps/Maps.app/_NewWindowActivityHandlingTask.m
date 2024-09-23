@implementation _NewWindowActivityHandlingTask

- (void)performTask
{
  void *v3;
  void *v4;
  void *v5;
  MapsActivity *v6;
  MapsActivity *v7;
  void *v8;
  unsigned int v9;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  NewWindowAction *v14;
  void *v15;
  RichMapsActivity *v16;
  uint8_t v17[16];
  uint8_t buf[16];

  -[RichMapsActivityCreatingTaskImpl taskStarted](self, "taskStarted");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UserActivityHandlingTask userActivity](self, "userActivity"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bs")));
  if (v5)
  {
    v6 = -[MapsActivity initWithBzip2CompressedData:]([MapsActivity alloc], "initWithBzip2CompressedData:", v5);
    v7 = v6;
    if (!v6)
    {
      v12 = sub_100431A4C();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "_NewWindowActivityHandlingTask no mapsActivity from data", v17, 2u);
      }

      -[RichMapsActivityCreatingTaskImpl taskFailed](self, "taskFailed");
      goto LABEL_17;
    }
    if (-[MapsActivity hasDisplayOptions](v6, "hasDisplayOptions"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivity displayOptions](v7, "displayOptions"));
      if ((objc_msgSend(v8, "hasCamera") & 1) != 0)
      {
        v9 = 0;
      }
      else
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[MapsActivity displayOptions](v7, "displayOptions"));
        v9 = objc_msgSend(v15, "hasCenterSpan") ^ 1;

      }
      v14 = objc_alloc_init(NewWindowAction);
      if (!v9)
        goto LABEL_16;
    }
    else
    {
      v14 = objc_alloc_init(NewWindowAction);
    }
    -[MapsAction setUserLocationAccuracy:](v14, "setUserLocationAccuracy:", kCLLocationAccuracyBest);
LABEL_16:
    v16 = -[RichMapsActivity initWithMapsActivity:mapsAction:]([RichMapsActivity alloc], "initWithMapsActivity:mapsAction:", v7, v14);
    -[UserActivityHandlingTask taskFinished:](self, "taskFinished:", v16);

LABEL_17:
    goto LABEL_18;
  }
  v10 = sub_100431A4C();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "_NewWindowActivityHandlingTask no compressed data", buf, 2u);
  }

  -[RichMapsActivityCreatingTaskImpl taskFailed](self, "taskFailed");
LABEL_18:

}

@end
