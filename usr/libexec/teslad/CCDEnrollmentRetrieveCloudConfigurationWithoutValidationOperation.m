@implementation CCDEnrollmentRetrieveCloudConfigurationWithoutValidationOperation

- (id)responseWithResponseData:(id)a3 contentType:(id)a4 outError:(id *)a5
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  id v23;
  const __CFString *v24;
  id v25;
  uint8_t buf[4];
  id v27;

  v6 = a3;
  v7 = objc_msgSend(a4, "containsString:", CFSTR("text/plain"));
  if ((_DWORD)v7)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CCDError cloudConfigErrorInResponse:](CCDError, "cloudConfigErrorInResponse:", v6));
    v13 = *(NSObject **)(DEPLogObjects(v10, v11, v12) + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Got 200 response with error: %@", buf, 0xCu);
    }
    v24 = CFSTR("Response");
    v25 = v6;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));
  }
  else
  {
    v15 = *(NSObject **)(DEPLogObjects(v7, v8, v9) + 8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v16 = v15;
      v17 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v6, 4);
      *(_DWORD *)buf = 138543362;
      v27 = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Enrollment Response: %{public}@", buf, 0xCu);

    }
    v23 = 0;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v6, 0, &v23));
    v18 = v23;
    v10 = v18;
    if (v18)
    {
      v21 = *(NSObject **)(DEPLogObjects(v18, v19, v20) + 8);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v10;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Error: %@", buf, 0xCu);
      }
    }
  }

  return v14;
}

@end
