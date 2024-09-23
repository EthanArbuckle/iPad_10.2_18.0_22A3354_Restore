@implementation CCDDeviceUploadRetrieveOrganizationsOperation

- (id)responseWithResponseData:(id)a3 contentType:(id)a4 statusCode:(int64_t)a5 retryNeeded:(BOOL *)a6 outError:(id *)a7
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  int v21;
  id v22;

  v9 = a3;
  v12 = v9;
  *a6 = 0;
  if (v9)
  {
    v13 = *(NSObject **)(DEPLogObjects(v9, v10, v11) + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v13;
      v15 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v12, 4);
      v21 = 138543362;
      v22 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Response: %{public}@", (uint8_t *)&v21, 0xCu);

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v12, 1, a7));
    if (v17)
    {
      v18 = (void *)objc_opt_new(NSMutableDictionary, v16);
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, kDEPDeviceUploadOrganizationsKey);
      v19 = objc_msgSend(v18, "copy");

    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

@end
