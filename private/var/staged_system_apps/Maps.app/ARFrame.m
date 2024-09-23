@implementation ARFrame

- (float)indoorConfidence
{
  void *v3;
  void *v4;
  float v5;
  float v6;
  id v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  id v13;
  int v15;
  ARFrame *v16;
  __int16 v17;
  double v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ARFrame _observationWithIdentifier:](self, "_observationWithIdentifier:", CFSTR("indoor")));
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "confidence");
    v6 = v5;
    v7 = sub_100B96F5C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v15 = 134349312;
      v16 = self;
      v17 = 2048;
      v18 = v6;
      v9 = "[%{public}p] Got indoor confidence: %f";
      v10 = v8;
      v11 = OS_LOG_TYPE_DEBUG;
      v12 = 22;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v10, v11, v9, (uint8_t *)&v15, v12);
    }
  }
  else
  {
    v13 = sub_100B96F5C();
    v8 = objc_claimAutoreleasedReturnValue(v13);
    v6 = -1.0;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v15 = 134349056;
      v16 = self;
      v9 = "[%{public}p] Could not find indoor observation";
      v10 = v8;
      v11 = OS_LOG_TYPE_ERROR;
      v12 = 12;
      goto LABEL_6;
    }
  }

  return v6;
}

- (float)outdoorConfidence
{
  void *v3;
  void *v4;
  float v5;
  float v6;
  id v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  id v13;
  int v15;
  ARFrame *v16;
  __int16 v17;
  double v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ARFrame _observationWithIdentifier:](self, "_observationWithIdentifier:", CFSTR("outdoor")));
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "confidence");
    v6 = v5;
    v7 = sub_100B96F5C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v15 = 134349312;
      v16 = self;
      v17 = 2048;
      v18 = v6;
      v9 = "[%{public}p] Got outdoor confidence: %f";
      v10 = v8;
      v11 = OS_LOG_TYPE_DEBUG;
      v12 = 22;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v10, v11, v9, (uint8_t *)&v15, v12);
    }
  }
  else
  {
    v13 = sub_100B96F5C();
    v8 = objc_claimAutoreleasedReturnValue(v13);
    v6 = -1.0;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v15 = 134349056;
      v16 = self;
      v9 = "[%{public}p] Could not find outdoor observation";
      v10 = v8;
      v11 = OS_LOG_TYPE_ERROR;
      v12 = 12;
      goto LABEL_6;
    }
  }

  return v6;
}

- (id)_observationWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ARFrame _observations](self, "_observations"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100B9717C;
  v10[3] = &unk_1011E7698;
  v11 = v4;
  v6 = v4;
  v7 = sub_10039E1FC(v5, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return v8;
}

- (id)_observations
{
  id AssociatedObject;
  void *v4;
  id v5;
  void *v6;
  objc_class *v7;
  id v8;
  unsigned int v9;
  id v10;
  void *v11;
  objc_class *v12;
  NSObject *v13;
  void *v14;
  unsigned int v15;
  id v16;
  void *v17;
  id v18;
  NSObject *v19;
  id v20;
  id v21;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  _BYTE buf[24];
  void *v31;
  uint64_t *v32;

  AssociatedObject = objc_getAssociatedObject(self, off_1014BB1C8);
  v4 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  if (v4)
  {
    v5 = v4;
  }
  else
  {
    v25 = 0;
    v26 = &v25;
    v27 = 0x2050000000;
    v6 = (void *)qword_1014D4288;
    v28 = qword_1014D4288;
    if (!qword_1014D4288)
    {
      *(_QWORD *)buf = _NSConcreteStackBlock;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = sub_100B975AC;
      v31 = &unk_1011AFF60;
      v32 = &v25;
      sub_100B975AC((uint64_t)buf);
      v6 = (void *)v26[3];
    }
    v7 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v25, 8);
    v8 = objc_alloc_init(v7);
    v24 = 0;
    v9 = objc_msgSend(v8, "setRevision:error:", 3737841665, &v24);
    v10 = v24;
    if (v9)
    {
      v25 = 0;
      v26 = &v25;
      v27 = 0x2050000000;
      v11 = (void *)qword_1014D4290;
      v28 = qword_1014D4290;
      if (!qword_1014D4290)
      {
        *(_QWORD *)buf = _NSConcreteStackBlock;
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = sub_100B976D4;
        v31 = &unk_1011AFF60;
        v32 = &v25;
        sub_100B976D4((uint64_t)buf);
        v11 = (void *)v26[3];
      }
      v12 = objc_retainAutorelease(v11);
      _Block_object_dispose(&v25, 8);
      v13 = objc_msgSend([v12 alloc], "initWithCVPixelBuffer:orientation:options:", -[ARFrame capturedImage](self, "capturedImage"), 1, &__NSDictionary0__struct);
      v29 = v8;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v29, 1));
      v23 = v10;
      v15 = -[NSObject performRequests:error:](v13, "performRequests:error:", v14, &v23);
      v16 = v23;

      if (v15)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "results"));
        v18 = sub_100B96F5C();
        v19 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134349314;
          *(_QWORD *)&buf[4] = self;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v17;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "[%{public}p] Got observation results: %@", buf, 0x16u);
        }
      }
      else
      {
        v21 = sub_100B96F5C();
        v19 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134349314;
          *(_QWORD *)&buf[4] = self;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v16;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "[%{public}p] Error performing observation request: %@", buf, 0x16u);
        }
        v17 = &__NSArray0__struct;
      }

    }
    else
    {
      v20 = sub_100B96F5C();
      v13 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134349314;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v10;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "[%{public}p] Error setting private revision: %@", buf, 0x16u);
      }
      v17 = &__NSArray0__struct;
      v16 = v10;
    }

    objc_setAssociatedObject(self, off_1014BB1C8, v17, (void *)0x303);
    v5 = v17;

  }
  return v5;
}

@end
