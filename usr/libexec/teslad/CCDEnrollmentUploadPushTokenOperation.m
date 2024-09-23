@implementation CCDEnrollmentUploadPushTokenOperation

- (id)errorForStatusCode:(int64_t)a3 responseData:(id)a4
{
  void *v4;
  void *v5;
  id v6;
  void *v7;

  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 0x190)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[CCDError cloudConfigErrorInResponse:](CCDError, "cloudConfigErrorInResponse:", a4));
    v5 = v4;
    if (v4)
      v6 = v4;
    else
      v6 = (id)objc_claimAutoreleasedReturnValue(+[CCDError internalErrorWithCode:](CCDError, "internalErrorWithCode:", 34000));
    v7 = v6;

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CCDError teslaServiceDownError](CCDError, "teslaServiceDownError"));
  }
  return v7;
}

- (id)responseWithResponseData:(id)a3 contentType:(id)a4 outError:(id *)a5
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  void *v13;

  v11 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", a3, 1, &v11));
  v6 = v11;
  v9 = *(NSObject **)(DEPLogObjects(v6, v7, v8) + 8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Upload push token Response: %{public}@", buf, 0xCu);
  }

  return v5;
}

@end
