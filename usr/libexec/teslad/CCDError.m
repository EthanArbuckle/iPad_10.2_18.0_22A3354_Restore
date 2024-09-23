@implementation CCDError

+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 description:(id)a5 errorType:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSBundle *v16;
  void *v17;
  void *v18;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v13 = v12;
  if (!v10)
  {
    v16 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(CCDGatekeeper));
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Unknown error"), &stru_100019AB0, 0));
    objc_msgSend(v13, "setObject:forKey:", v18, NSLocalizedDescriptionKey);

    if (!v11)
      goto LABEL_4;
    goto LABEL_3;
  }
  objc_msgSend(v12, "setObject:forKey:", v10, NSLocalizedDescriptionKey);
  if (v11)
LABEL_3:
    objc_msgSend(v13, "setObject:forKey:", v11, CFSTR("CloudConfigurationErrorType"));
LABEL_4:
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v9, a4, v13));

  return v14;
}

+ (id)internalErrorWithCode:(int64_t)a3
{
  NSBundle *v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(CCDGatekeeper));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("The device failed to request configuration from the cloud."), &stru_100019AB0, 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "errorWithDomain:code:description:errorType:", CFSTR("MCCloudConfigurationErrorDomain"), a3, v7, CFSTR("CloudConfigurationFatalError")));

  return v8;
}

+ (id)badFormatError
{
  NSBundle *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(CCDGatekeeper));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("The cloud configuration for this device is invalid."), &stru_100019AB0, 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "errorWithDomain:code:description:errorType:", CFSTR("MCCloudConfigurationErrorDomain"), 34003, v5, CFSTR("CloudConfigurationFatalError")));

  return v6;
}

+ (id)maxRetriesExceededErrorWithUnderlyingError:(id)a3
{
  id v4;
  NSBundle *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v4 = a3;
  v5 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(CCDGatekeeper));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("The cloud configuration server is unavailable."), &stru_100019AB0, 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "errorWithDomain:code:description:errorType:", CFSTR("MCCloudConfigurationErrorDomain"), 34006, v7, CFSTR("CloudConfigurationFatalError")));

  if (v4)
  {
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userInfo"));
    v10 = (void *)v9;
    if (v9)
      v11 = (void *)v9;
    else
      v11 = &__NSDictionary0__struct;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v11));

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "cleanNSError:", v4));
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, NSUnderlyingErrorKey);

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "domain"));
    v15 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v14, objc_msgSend(v8, "code"), v12));

    v8 = (void *)v15;
  }

  return v8;
}

+ (id)invalidDeviceError
{
  NSBundle *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(CCDGatekeeper));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("The cloud configuration service could not verify the identity of this device."), &stru_100019AB0, 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "errorWithDomain:code:description:errorType:", CFSTR("MCCloudConfigurationErrorDomain"), 33023, v5, CFSTR("CloudConfigurationFatalError")));

  return v6;
}

+ (id)teslaServiceDownError
{
  NSBundle *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(CCDGatekeeper));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("The cloud configuration server is unavailable or busy."), &stru_100019AB0, 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "errorWithDomain:code:description:errorType:", CFSTR("MCCloudConfigurationErrorDomain"), 34004, v5, CFSTR("CloudConfigurationFatalError")));

  return v6;
}

+ (id)serviceBusyError
{
  NSBundle *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(CCDGatekeeper));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("The cloud configuration server is busy. Please try again later."), &stru_100019AB0, 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "errorWithDomain:code:description:errorType:", CFSTR("MCCloudConfigurationErrorDomain"), 34005, v5, CFSTR("CloudConfigurationFatalError")));

  return v6;
}

+ (id)serverTrustError
{
  NSBundle *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(CCDGatekeeper));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("The cloud configuration server could not be verified."), &stru_100019AB0, 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "errorWithDomain:code:description:errorType:", CFSTR("MCCloudConfigurationErrorDomain"), 34008, v5, CFSTR("CloudConfigurationFatalError")));

  return v6;
}

+ (id)invalidSignatureError
{
  NSBundle *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(CCDGatekeeper));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Invalid signature."), &stru_100019AB0, 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "errorWithDomain:code:description:errorType:", CFSTR("MCCloudConfigurationErrorDomain"), 33016, v5, CFSTR("CloudConfigurationFatalError")));

  return v6;
}

+ (id)invalidProfileError
{
  NSBundle *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(CCDGatekeeper));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Invalid Device Enrollment Program configuration."), &stru_100019AB0, 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "errorWithDomain:code:description:errorType:", CFSTR("MCCloudConfigurationErrorDomain"), 33002, v5, CFSTR("CloudConfigurationFatalError")));

  return v6;
}

+ (id)profileNotActiveError
{
  NSBundle *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(CCDGatekeeper));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Device Enrollment Program configuration is not active."), &stru_100019AB0, 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "errorWithDomain:code:description:errorType:", CFSTR("MCCloudConfigurationErrorDomain"), 33017, v5, CFSTR("CloudConfigurationFatalError")));

  return v6;
}

+ (id)profileNotFoundError
{
  NSBundle *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(CCDGatekeeper));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Device Enrollment Program configuration can not be found."), &stru_100019AB0, 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "errorWithDomain:code:description:errorType:", CFSTR("MCCloudConfigurationErrorDomain"), 33024, v5, CFSTR("CloudConfigurationFatalError")));

  return v6;
}

+ (id)deviceNotFoundError
{
  NSBundle *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(CCDGatekeeper));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Device can not be found."), &stru_100019AB0, 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "errorWithDomain:code:description:errorType:", CFSTR("MCCloudConfigurationErrorDomain"), 33025, v5, CFSTR("CloudConfigurationFatalError")));

  return v6;
}

+ (id)deviceAlreadyEnrolledError
{
  NSBundle *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(CCDGatekeeper));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("This device is already enrolled in the Device Enrollment Program."), &stru_100019AB0, 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "errorWithDomain:code:description:errorType:", CFSTR("MCCloudConfigurationErrorDomain"), 33018, v5, CFSTR("CloudConfigurationFatalError")));

  return v6;
}

+ (id)deviceNotEnrolledError
{
  NSBundle *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(CCDGatekeeper));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("This device is not enrolled in the Device Enrollment Program."), &stru_100019AB0, 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "errorWithDomain:code:description:errorType:", CFSTR("MCCloudConfigurationErrorDomain"), 33005, v5, CFSTR("CloudConfigurationFatalError")));

  return v6;
}

+ (id)nonceExpiredError
{
  NSBundle *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(CCDGatekeeper));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Nonce expired."), &stru_100019AB0, 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "errorWithDomain:code:description:errorType:", CFSTR("MCCloudConfigurationErrorDomain"), 33014, v5, CFSTR("CloudConfigurationFatalError")));

  return v6;
}

+ (id)_errorStringForResponse:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  int v13;
  void *v14;

  v3 = a3;
  if (v3 && (v4 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v3, 4)) != 0)
  {
    v5 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceCharacterSet](NSCharacterSet, "whitespaceCharacterSet"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v6));

    v11 = *(NSObject **)(DEPLogObjects(v8, v9, v10) + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138543362;
      v14 = v7;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Error response for request: %{public}@", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)cloudConfigErrorInResponse:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_errorStringForResponse:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_cloudConfigErrorResponses"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

  return v6;
}

+ (id)_cloudConfigErrorResponses
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006C20;
  block[3] = &unk_1000188D8;
  block[4] = a1;
  if (qword_100021620 != -1)
    dispatch_once(&qword_100021620, block);
  return (id)qword_100021628;
}

+ (id)cleanNSError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    v21 = 0;
    goto LABEL_23;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "userInfo"));

  if (!v5)
  {
    v21 = v4;
    goto LABEL_23;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allKeys"));

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (!v9)
    goto LABEL_18;
  v10 = v9;
  v11 = *(_QWORD *)v25;
  do
  {
    for (i = 0; i != v10; i = (char *)i + 1)
    {
      if (*(_QWORD *)v25 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v13));

      if (objc_msgSend(v13, "isEqualToString:", NSUnderlyingErrorKey))
      {
        v16 = objc_opt_class(NSError);
        if ((objc_opt_isKindOfClass(v15, v16) & 1) == 0)
          goto LABEL_15;
        v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "cleanNSError:", v15));

        v15 = (void *)v17;
      }
      else
      {
        v18 = objc_opt_class(NSString);
        if ((objc_opt_isKindOfClass(v15, v18) & 1) == 0)
        {
          v19 = objc_opt_class(NSNumber);
          if ((objc_opt_isKindOfClass(v15, v19) & 1) == 0)
            goto LABEL_15;
        }
      }
      if (!v15)
        continue;
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, v13);
LABEL_15:

    }
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  }
  while (v10);
LABEL_18:

  if (!objc_msgSend(v6, "count"))
  {

    v6 = 0;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "domain"));
  v21 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v20, objc_msgSend(v4, "code"), v6));

LABEL_23:
  return v21;
}

@end
