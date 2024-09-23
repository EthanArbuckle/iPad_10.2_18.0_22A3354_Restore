@implementation CCDEnrollmentRetrieveCloudConfigurationOperation

- (id)errorForStatusCode:(int64_t)a3 responseData:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  if (a3 == 401)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CCDError cloudConfigErrorInResponse:](CCDError, "cloudConfigErrorInResponse:", v6));
    v9 = v8;
    if (v8)
      v10 = v8;
    else
      v10 = (id)objc_claimAutoreleasedReturnValue(+[CCDError internalErrorWithCode:](CCDError, "internalErrorWithCode:", 34000));
    v7 = v10;

  }
  else if (a3 == 400)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CCDError cloudConfigErrorInResponse:](CCDError, "cloudConfigErrorInResponse:", v6));
    -[CCDEnrollmentRetrieveCloudConfigurationOperation _setLockdownCloudConfigAvailableKeyIfNeededWithError:](self, "_setLockdownCloudConfigAvailableKeyIfNeededWithError:", v7);
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CCDError teslaServiceDownError](CCDError, "teslaServiceDownError"));
  }

  return v7;
}

- (id)responseWithResponseData:(id)a3 contentType:(id)a4 outError:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  unsigned __int8 v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  NSObject *v44;
  id v45;
  id v46;
  id v47;
  uint8_t buf[4];
  id v49;

  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CCDFeatures depResponseDataFromData:](CCDFeatures, "depResponseDataFromData:", a3));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CCDFeatures depResponseContentTypeFromContentType:](CCDFeatures, "depResponseContentTypeFromContentType:", v8));

  v11 = objc_msgSend(v10, "containsString:", CFSTR("text/plain"));
  if ((_DWORD)v11)
  {
    v14 = (id)objc_claimAutoreleasedReturnValue(+[CCDError cloudConfigErrorInResponse:](CCDError, "cloudConfigErrorInResponse:", v9));
    v17 = *(NSObject **)(DEPLogObjects(v14, v15, v16) + 8);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v49 = v14;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Got 200 response with error: %@", buf, 0xCu);
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "domain"));
    if (!objc_msgSend(v18, "isEqualToString:", CFSTR("MCCloudConfigurationErrorDomain"))
      || objc_msgSend(v14, "code") == (id)33024
      || objc_msgSend(v14, "code") == (id)33025)
    {

    }
    else
    {
      v45 = objc_msgSend(v14, "code");

      if (v45 != (id)33017)
      {
        if (a5)
        {
          v14 = objc_retainAutorelease(v14);
          v30 = 0;
          *a5 = v14;
          goto LABEL_20;
        }
        goto LABEL_19;
      }
    }
    v22 = *(NSObject **)(DEPLogObjects(v19, v20, v21) + 8);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v49 = v14;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Return an empty configuration and ignore the MDM server error: %@ ", buf, 0xCu);
    }
LABEL_19:
    v30 = 0;
    goto LABEL_20;
  }
  v23 = *(NSObject **)(DEPLogObjects(v11, v12, v13) + 8);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    v24 = v23;
    v25 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v9, 4);
    *(_DWORD *)buf = 138543362;
    v49 = v25;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "Enrollment Response: %{public}@", buf, 0xCu);

  }
  v47 = 0;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v9, 1, &v47));
  v14 = v47;
  v29 = *(NSObject **)(DEPLogObjects(v14, v27, v28) + 8);
  if (v14)
  {
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v49 = v14;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Error: %@", buf, 0xCu);
    }
    v30 = 0;
LABEL_16:
    if (a5)
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[CCDError badFormatError](CCDError, "badFormatError"));

    goto LABEL_19;
  }
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "Validating cloud configuration", buf, 2u);
  }
  v46 = 0;
  v32 = -[CCDEnrollmentRetrieveCloudConfigurationOperation _convertCloudConfigDictionary:toManagedConfiguration:](self, "_convertCloudConfigDictionary:toManagedConfiguration:", v26, &v46);
  v33 = v46;
  v30 = v33;
  if ((v32 & 1) == 0)
  {
    v44 = *(NSObject **)(DEPLogObjects(v33, v34, v35) + 8);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_INFO, "Cloud configuration is invalid.", buf, 2u);
    }
    goto LABEL_16;
  }
  CFPreferencesSetAppValue(CFSTR("LockdownCloudConfigurationAvailable"), kCFBooleanTrue, CFSTR("com.apple.managedconfiguration.notbackedup"));
  v39 = *(NSObject **)(DEPLogObjects(v36, v37, v38) + 8);
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Wait for preferences to flush its caches", buf, 2u);
  }
  v40 = _CFPreferencesFlushCachesForIdentifier(CFSTR("com.apple.managedconfiguration.notbackedup"), CFSTR("mobile"));
  v43 = *(NSObject **)(DEPLogObjects(v40, v41, v42) + 8);
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Disk is updated with the cloud configuration preference.", buf, 2u);
  }

  v14 = 0;
LABEL_20:

  return v30;
}

- (BOOL)_convertCloudConfigDictionary:(id)a3 toManagedConfiguration:(id *)a4
{
  id v6;
  void *v7;
  _BOOL4 v8;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v8 = +[CCDValidation validateCloudConfiguration:withResultDictionary:](CCDValidation, "validateCloudConfiguration:withResultDictionary:", v6, v7);

  if (v8)
  {
    -[CCDEnrollmentRetrieveCloudConfigurationOperation _setEnrolledDeviceRequirementsIfNeededForCloudConfigurationDictionary:](self, "_setEnrolledDeviceRequirementsIfNeededForCloudConfigurationDictionary:", v7);
    if (a4)
      *a4 = objc_retainAutorelease(v7);
  }

  return v8;
}

- (void)_setEnrolledDeviceRequirementsIfNeededForCloudConfigurationDictionary:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  unsigned int v8;
  uint8_t v9[16];

  v3 = a3;
  v6 = *(NSObject **)(DEPLogObjects(v3, v4, v5) + 8);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Enrolled devices require supervision and enrollment should be mandatory. Setting supervision and mandatory keys.", v9, 2u);
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("IsSupervised"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("IsMandatory"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("IsMultiUser")));
  v8 = objc_msgSend(v7, "BOOLValue");

  if (v8)
  {
    objc_msgSend(v3, "removeObjectForKey:", CFSTR("MAIDHasCredential"));
    objc_msgSend(v3, "removeObjectForKey:", CFSTR("MAIDUsername"));
  }

}

- (void)_setLockdownCloudConfigAvailableKeyIfNeededWithError:(id)a3
{
  id v3;
  BOOL v4;
  id v5;

  v3 = a3;
  if (v3)
  {
    v5 = v3;
    v4 = objc_msgSend(v3, "code") == (id)33005;
    v3 = v5;
    if (v4)
    {
      CFPreferencesSetAppValue(CFSTR("LockdownCloudConfigurationAvailable"), kCFBooleanFalse, CFSTR("com.apple.managedconfiguration.notbackedup"));
      CFPreferencesAppSynchronize(CFSTR("com.apple.managedconfiguration.notbackedup"));
      v3 = v5;
    }
  }

}

@end
