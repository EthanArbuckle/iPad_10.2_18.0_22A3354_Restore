@implementation CalMCSignpost

+ (void)endLaunchToView:(int64_t)a3 extended:(BOOL)a4
{
  _BOOL4 v4;
  const char *v5;
  NSObject *v6;
  _BOOL4 v7;
  const char *v8;
  int v9;
  const char *v10;

  v4 = a4;
  if ((unint64_t)a3 > 4)
    v5 = "unknown";
  else
    v5 = (&off_1001B5130)[a3];
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "calendarSignpostHandle"));
  v7 = os_signpost_enabled(v6);
  if (v4)
  {
    if (v7)
    {
      v9 = 136446210;
      v10 = v5;
      v8 = "ExtendedLaunch";
LABEL_9:
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, v8, " enableTelemetry=YES LaunchedView=%{public, signpost.telemetry:string1, Name=LaunchedView}s", (uint8_t *)&v9, 0xCu);
    }
  }
  else if (v7)
  {
    v9 = 136446210;
    v10 = v5;
    v8 = "Launch";
    goto LABEL_9;
  }

}

+ (void)beginLaunch:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v4;
  _BOOL4 v5;
  const char *v6;
  uint8_t *v7;
  __int16 v8;
  __int16 v9;

  v3 = a3;
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "calendarSignpostHandle"));
  v5 = os_signpost_enabled(v4);
  if (v3)
  {
    if (v5)
    {
      v9 = 0;
      v6 = "ExtendedLaunch";
      v7 = (uint8_t *)&v9;
LABEL_6:
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, v6, " enableTelemetry=YES ", v7, 2u);
    }
  }
  else if (v5)
  {
    v8 = 0;
    v6 = "Launch";
    v7 = (uint8_t *)&v8;
    goto LABEL_6;
  }

}

+ (id)calendarSignpostHandle
{
  if (qword_1001F64B8 != -1)
    dispatch_once(&qword_1001F64B8, &stru_1001B5110);
  return (id)qword_1001F64B0;
}

@end
