@implementation _FileURLHandlingTask

- (void)performTask
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  unsigned int v7;
  OpenTraceAction *v8;
  void *v9;
  void *v10;
  RichMapsActivity *v11;
  id v12;
  NSObject *v13;
  const char *v14;
  uint8_t *v15;
  id v16;
  OpenTraceAction *v17;
  __int16 v18;
  uint8_t buf[2];

  -[RichMapsActivityCreatingTaskImpl taskStarted](self, "taskStarted");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[URLHandlingTask url](self, "url"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pathExtension"));
  v5 = objc_msgSend(v4, "isEqual:", CFSTR("navtrace"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
    v7 = objc_msgSend(v6, "canPlayTrace");

    if (v7)
    {
      v8 = [OpenTraceAction alloc];
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[URLHandlingTask url](self, "url"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "path"));
      v17 = -[OpenTraceAction initWithFilePath:](v8, "initWithFilePath:", v10);

      v11 = -[RichMapsActivity initWithMapsAction:]([RichMapsActivity alloc], "initWithMapsAction:", v17);
      -[URLHandlingTask taskFinished:](self, "taskFinished:", v11);

      return;
    }
    v16 = sub_100431A4C();
    v13 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v14 = "_FileURLHandlingTask can not play traces";
      v15 = buf;
      goto LABEL_8;
    }
  }
  else
  {
    v12 = sub_100431A4C();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v18 = 0;
      v14 = "_FileURLHandlingTask can not play file (not a navtrace extension)";
      v15 = (uint8_t *)&v18;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, v14, v15, 2u);
    }
  }

  -[URLHandlingTask taskFailed](self, "taskFailed");
}

@end
