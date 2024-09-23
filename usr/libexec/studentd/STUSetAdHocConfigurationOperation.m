@implementation STUSetAdHocConfigurationOperation

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___STUSetAdHocConfigurationOperation;
  if (!objc_msgSendSuper2(&v11, "validateRequest:error:", v6, a4))
    goto LABEL_6;
  v7 = objc_opt_class(CRKSetAdHocConfigurationRequest);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    if (a4)
    {
      v9 = CRKErrorWithCodeAndUserInfo(2, &off_1000D3308);
      v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue(v9);
      goto LABEL_7;
    }
LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  v8 = 1;
LABEL_7:

  return v8;
}

- (void)runWithRequest:(id)a3
{
  id v4;
  unsigned int v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  STUSetAdHocConfigurationOperation *v15;

  v4 = a3;
  v5 = objc_msgSend(v4, "merge");
  v6 = sub_10002A6DC();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v8)
    {
      *(_DWORD *)buf = 138543362;
      v15 = self;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%{public}@: Merging in ad hoc configuration", buf, 0xCu);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "daemon"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10002A71C;
    v12[3] = &unk_1000CA5E0;
    v12[4] = self;
    v13 = v4;
    objc_msgSend(v10, "fetchAdHocConfiguration:", v12);

  }
  else
  {
    if (v8)
    {
      *(_DWORD *)buf = 138543362;
      v15 = self;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%{public}@: Replacing ad-hoc configuration", buf, 0xCu);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "configuration"));
    -[STUSetAdHocConfigurationOperation setConfiguration:](self, "setConfiguration:", v11);

  }
}

- (id)housekeepConfiguration:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  id v11;

  v3 = a3;
  v4 = objc_msgSend(v3, "mutableCopy");
  v5 = kCRKAdHocConfigurationRemoteLearningMaxIdleLengthKey;
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", kCRKAdHocConfigurationRemoteLearningMaxIdleLengthKey));
  if (v6)
  {
    v7 = (void *)v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v5));
    objc_msgSend(v8, "doubleValue");
    v10 = v9;

    if (v10 <= 0.0)
      objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, v5);
  }
  v11 = objc_msgSend(v4, "copy");

  return v11;
}

- (void)setConfiguration:(id)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  STUSetAdHocConfigurationOperation *v11;
  __int16 v12;
  void *v13;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUSetAdHocConfigurationOperation housekeepConfiguration:](self, "housekeepConfiguration:", a3));
  v5 = sub_10002A6DC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    v11 = self;
    v12 = 2114;
    v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%{public}@: Setting ad-hoc configuration to: %{public}@", buf, 0x16u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "daemon"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002AD30;
  v9[3] = &unk_1000CA240;
  v9[4] = self;
  objc_msgSend(v8, "setAdHocConfiguration:completion:", v4, v9);

}

@end
