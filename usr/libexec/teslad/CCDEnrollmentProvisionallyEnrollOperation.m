@implementation CCDEnrollmentProvisionallyEnrollOperation

- (id)errorForStatusCode:(int64_t)a3 responseData:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v5 = a4;
  if (a3 == 403 || a3 == 401)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CCDError cloudConfigErrorInResponse:](CCDError, "cloudConfigErrorInResponse:", v5));
    v8 = v7;
    if (v7)
      v9 = v7;
    else
      v9 = (id)objc_claimAutoreleasedReturnValue(+[CCDError internalErrorWithCode:](CCDError, "internalErrorWithCode:", 34000));
    v10 = v9;

  }
  else
  {
    if (a3 == 400)
      v6 = objc_claimAutoreleasedReturnValue(+[CCDError invalidDeviceError](CCDError, "invalidDeviceError"));
    else
      v6 = objc_claimAutoreleasedReturnValue(+[CCDError teslaServiceDownError](CCDError, "teslaServiceDownError"));
    v10 = (void *)v6;
  }

  return v10;
}

- (id)responseWithResponseData:(id)a3 contentType:(id)a4 outError:(id *)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  id v19;
  void *v20;
  id v22;
  uint8_t buf[4];
  id v24;

  v7 = a3;
  v10 = *(NSObject **)(DEPLogObjects(v7, v8, v9) + 8);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = v10;
    v12 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v7, 4);
    *(_DWORD *)buf = 138543362;
    v24 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Enrollment Response: %{public}@", buf, 0xCu);

  }
  v22 = 0;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v7, 1, &v22));
  v14 = v22;
  v17 = v14;
  if (v14)
  {
    v18 = *(NSObject **)(DEPLogObjects(v14, v15, v16) + 8);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v17;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Error: %@", buf, 0xCu);
    }
    v19 = 0;
    if (a5)
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[CCDError badFormatError](CCDError, "badFormatError"));
  }
  else
  {
    if (-[CCDEnrollmentProvisionallyEnrollOperation _validateEnrollmentResponse:error:](self, "_validateEnrollmentResponse:error:", v13, a5))
    {
      v20 = v13;
    }
    else
    {
      v20 = 0;
    }
    v19 = v20;
  }

  return v19;
}

- (BOOL)_validateEnrollmentResponse:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  _BOOL8 v13;
  uint64_t v14;
  uint64_t v15;
  const __CFString *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  id v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  _BOOL4 v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  NSObject *v35;
  uint8_t v37[24];

  v5 = a3;
  v8 = *(NSObject **)(DEPLogObjects(v5, v6, v7) + 8);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v37 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Validating enrollment response", v37, 2u);
  }
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("enrollment_type")));
  v12 = *(NSObject **)(DEPLogObjects(v9, v10, v11) + 8);
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    v16 = CFSTR("No enrollment type received");
    if (v9)
      v16 = v9;
    *(_DWORD *)v37 = 138543362;
    *(_QWORD *)&v37[4] = v16;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Enrollment type: %{public}@", v37, 0xCu);
  }
  if (!v9)
  {
    v21 = *(NSObject **)(DEPLogObjects(v13, v14, v15) + 8);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v37 = 138543362;
      *(_QWORD *)&v37[4] = CFSTR("enrollment_type");
      v22 = "No enrollment type information. There needs to be a %{public}@ section in the response.";
      v23 = v21;
      v24 = 12;
LABEL_19:
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, v22, v37, v24);
    }
LABEL_20:
    v31 = (id)objc_claimAutoreleasedReturnValue(+[CCDError badFormatError](CCDError, "badFormatError", *(_OWORD *)v37));
    goto LABEL_21;
  }
  if (!-[__CFString isEqualToString:](v9, "isEqualToString:", CFSTR("PROVISIONAL_ENROLLMENT")))
  {
    v25 = -[__CFString isEqualToString:](v9, "isEqualToString:", CFSTR("REGULAR_ENROLLMENT"));
    v26 = (int)v25;
    v29 = *(NSObject **)(DEPLogObjects(v25, v27, v28) + 8);
    v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
    if (v26)
    {
      if (v30)
      {
        *(_WORD *)v37 = 0;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "This device is already enrolled.", v37, 2u);
      }
      v31 = (id)objc_claimAutoreleasedReturnValue(+[CCDError deviceAlreadyEnrolledError](CCDError, "deviceAlreadyEnrolledError"));
LABEL_21:
      v20 = v31;
      if (!a4)
        goto LABEL_29;
      goto LABEL_27;
    }
    if (v30)
    {
      *(_WORD *)v37 = 0;
      v22 = "Enrollment type is not recognized.";
      v23 = v29;
      v24 = 2;
      goto LABEL_19;
    }
    goto LABEL_20;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ce_expiry_ts")));
  if (v19)
  {
    v20 = 0;
  }
  else
  {
    v34 = *(NSObject **)(DEPLogObjects(0, v17, v18) + 8);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v37 = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "No expiry date received", v37, 2u);
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[CCDError badFormatError](CCDError, "badFormatError"));
  }

  if (a4)
  {
LABEL_27:
    if (v20)
    {
      v31 = objc_retainAutorelease(v20);
      *a4 = v31;
    }
  }
LABEL_29:
  v35 = *(NSObject **)(DEPLogObjects(v31, v32, v33) + 8);
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v37 = 0;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "Enrollment response is validated successfully.", v37, 2u);
  }

  return v20 == 0;
}

@end
