@implementation STUSetCoursePermissionOperation

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  BOOL v10;
  uint64_t v11;
  void *v12;
  _UNKNOWN **v13;
  uint64_t v14;
  objc_super v16;

  v6 = a3;
  v16.receiver = a1;
  v16.super_class = (Class)&OBJC_METACLASS___STUSetCoursePermissionOperation;
  if (!objc_msgSendSuper2(&v16, "validateRequest:error:", v6, a4))
    goto LABEL_14;
  v7 = objc_opt_class(CRKSetCoursePermissionRequest);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    if (a4)
    {
      v11 = CRKErrorWithCodeAndUserInfo(2, &off_1000D4050);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
LABEL_13:
      v10 = 0;
      *a4 = v12;
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "feature"));

  if (!v8)
  {
    if (a4)
    {
      v13 = &off_1000D4078;
LABEL_12:
      v14 = CATErrorWithCodeAndUserInfo(2, v13);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v14);
      goto LABEL_13;
    }
LABEL_14:
    v10 = 0;
    goto LABEL_15;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "permission"));

  if (!v9)
  {
    if (a4)
    {
      v13 = &off_1000D40A0;
      goto LABEL_12;
    }
    goto LABEL_14;
  }
  v10 = 1;
LABEL_15:

  return v10;
}

- (void)runWithRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  unsigned int v17;
  id v18;
  const __CFString *v19;
  const __CFString *v20;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "courseIdentifier"));

  if (v5
    && (v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context")),
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "configurationManager")),
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "courseIdentifier")),
        v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "enrollmentRecordWithIdentifier:", v8)),
        v8,
        v7,
        v6,
        v9))
  {
    v19 = CFSTR("kCRKItemNameErrorKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "courseIdentifier"));
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringValue"));
    v12 = (void *)v11;
    v13 = CFSTR("<nil>");
    if (v11)
      v13 = (const __CFString *)v11;
    v20 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1));
    v15 = CRKErrorWithCodeAndUserInfo(12, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    -[STUSetCoursePermissionOperation endOperationWithError:](self, "endOperationWithError:", v16);

  }
  else
  {
    v18 = 0;
    v17 = -[STUSetCoursePermissionOperation updatePermissionForEnrollmentRecord:error:](self, "updatePermissionForEnrollmentRecord:error:", 0, &v18);
    v9 = v18;
    if (v17)
      -[STUSetCoursePermissionOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
    else
      -[STUSetCoursePermissionOperation endOperationWithError:](self, "endOperationWithError:", v9);
  }

}

- (BOOL)updatePermissionForEnrollmentRecord:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  unsigned __int8 v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  void *i;
  uint64_t v29;
  STUFeatureToken *v30;
  void *v31;
  void *v32;
  unsigned int v33;
  void *v34;
  void *v35;
  uint64_t v36;
  const __CFString *v37;
  void *v38;
  uint64_t v39;
  unsigned __int8 v41;
  void *v42;
  id v43;
  id obj;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  const __CFString *v50;
  const __CFString *v51;
  uint8_t buf[4];
  STUSetCoursePermissionOperation *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUSetCoursePermissionOperation request](self, "request"));
  if (qword_1000FC6E0 != -1)
    dispatch_once(&qword_1000FC6E0, &stru_1000CBF48);
  v8 = (void *)qword_1000FC6D8;
  if (os_log_type_enabled((os_log_t)qword_1000FC6D8, OS_LOG_TYPE_INFO))
  {
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "permission"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "feature"));
    *(_DWORD *)buf = 138543874;
    v53 = self;
    v54 = 2114;
    v55 = v10;
    v56 = 2114;
    v57 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%{public}@: Setting permission: %{public}@ for feature: %{public}@", buf, 0x20u);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "feature"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "configurationManager"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[STUFeatureFactory featureForCRKFeature:enrollmentRecord:configurationManager:](STUFeatureFactory, "featureForCRKFeature:enrollmentRecord:configurationManager:", v12, v6, v14));

  v16 = objc_msgSend(v15, "isModifiable");
  if ((v16 & 1) != 0)
  {
    v17 = objc_msgSend(v15, "permission");
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "permission"));
    v19 = objc_msgSend(v18, "unsignedIntegerValue");

    if (v17 != v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "permission"));
      v21 = objc_msgSend(v20, "unsignedIntegerValue");

      if ((v21 & 2) != 0)
      {
        v41 = v16;
        v42 = v15;
        v43 = v6;
        v22 = v7;
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "tokenAuthenticator"));

        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        v48 = 0u;
        obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "authenticatedTokens"));
        v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
        if (v25)
        {
          v26 = v25;
          v27 = *(_QWORD *)v46;
          do
          {
            for (i = 0; i != v26; i = (char *)i + 1)
            {
              if (*(_QWORD *)v46 != v27)
                objc_enumerationMutation(obj);
              v29 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i);
              v30 = -[STUFeatureToken initWithString:]([STUFeatureToken alloc], "initWithString:", v29);
              v31 = (void *)objc_claimAutoreleasedReturnValue(-[STUFeatureToken feature](v30, "feature"));
              v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "feature"));
              v33 = objc_msgSend(v31, "isEqualToString:", v32);

              if (v33)
                objc_msgSend(v24, "deauthenticateToken:", v29);

            }
            v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
          }
          while (v26);
        }

        v15 = v42;
        v6 = v43;
        v7 = v22;
        v16 = v41;
      }
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "permission"));
      objc_msgSend(v15, "setPermission:", objc_msgSend(v34, "unsignedIntegerValue"));

      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v35, "postNotificationName:object:", CRKStudentPermissionsDidChangeNotificationName, 0);
LABEL_23:

    }
  }
  else if (a4)
  {
    v50 = CFSTR("kCRKFeatureErrorKey");
    v36 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "feature"));
    v35 = (void *)v36;
    v37 = CFSTR("<nil>");
    if (v36)
      v37 = (const __CFString *)v36;
    v51 = v37;
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1));
    v39 = CRKErrorWithCodeAndUserInfo(111, v38);
    *a4 = (id)objc_claimAutoreleasedReturnValue(v39);

    goto LABEL_23;
  }

  return v16;
}

@end
