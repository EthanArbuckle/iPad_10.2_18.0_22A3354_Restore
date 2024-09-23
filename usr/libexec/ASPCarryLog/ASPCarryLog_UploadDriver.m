@implementation ASPCarryLog_UploadDriver

- (int)_DRResponseConversion:(unsigned __int8)a3
{
  if (a3 == 2)
    return 2;
  else
    return a3 == 1;
}

- (int)uploadFile:(id)a3 TaskingId:(id)a4 DeviceId:(id)a5 LogType:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  const __CFString *v15;
  id v16;

  v15 = CFSTR("DeviceID");
  v16 = a5;
  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));

  ASPCarryLog_UploadFileToDP(v12, CFSTR("com.apple.coreos.nand"), v11, CFSTR("com.apple.nand.iolog"), v13, v9);
  return 1;
}

- (int)allowToParticipateTaskingId:(id)a3 DeviceId:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  int v16;
  id v18;
  const __CFString *v19;
  id v20;

  v6 = a3;
  v7 = a4;
  v19 = CFSTR("DeviceID");
  v20 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
  if (&_DRShouldEnableLogGathering)
  {
    v18 = 0;
    v9 = DRShouldEnableLogGathering(CFSTR("com.apple.coreos.nand"), v6, v8, CFSTR("com.apple.nand.iolog"), &v18);
    v10 = v18;
    if (!v10)
    {
      v16 = -[ASPCarryLog_UploadDriver _DRResponseConversion:](self, "_DRResponseConversion:", v9);
      goto LABEL_9;
    }
    v11 = v10;
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedDescription")));
    v13 = objc_msgSend(v12, "UTF8String");

    v14 = oslog;
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
      sub_100041D90((uint64_t)v13, v14);

  }
  else
  {
    v15 = oslog;
    if (os_log_type_enabled((os_log_t)oslog, OS_LOG_TYPE_ERROR))
      sub_1000414EC(v15);
  }
  v16 = 0;
LABEL_9:

  return v16;
}

@end
