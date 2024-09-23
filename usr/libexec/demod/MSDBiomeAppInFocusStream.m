@implementation MSDBiomeAppInFocusStream

+ (id)collectAppUsageDataFrom:(id)a3 to:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  NSObject *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  _QWORD v37[5];
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint8_t buf[4];
  id v45;

  v5 = a3;
  v6 = a4;
  v7 = v5;
  v8 = v6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v10 = BiomeLibrary();
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "App"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "InFocus"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "publisher"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[BMPairedEventSession sessionPublisherWithStreamPublisher:startingBlock:sessionKeyBlock:options:](BMPairedEventSession, "sessionPublisherWithStreamPublisher:startingBlock:sessionKeyBlock:options:", v14, &stru_10013FEA0, &stru_10013FEE0, 0));

  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = sub_1000B12D8;
  v42 = sub_1000B12E8;
  v43 = 0;
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_1000B12F0;
  v37[3] = &unk_10013FF08;
  v37[4] = &v38;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3254779904;
  v33[2] = sub_1000B1404;
  v33[3] = &unk_10013FF30;
  v16 = v7;
  v35 = v16;
  v17 = v8;
  v36 = v17;
  v18 = v9;
  v34 = v18;
  v19 = objc_msgSend(v15, "sinkWithBookmark:completion:receiveInput:", 0, v37, v33);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[BMPairedEventSession openSessionsFromBookmark:](BMPairedEventSession, "openSessionsFromBookmark:", v39[5]));
  v21 = sub_1000604F0();
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = objc_msgSend(v20, "count");
    *(_DWORD *)buf = 134349056;
    v45 = v23;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Number of open events:  %{public}lu", buf, 0xCu);
  }

  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3254779904;
  v29[2] = sub_1000B1740;
  v29[3] = &unk_10013FF68;
  v24 = v16;
  v31 = v24;
  v25 = v17;
  v32 = v25;
  v26 = v18;
  v30 = v26;
  objc_msgSend(v20, "enumerateObjectsUsingBlock:", v29);
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "sortedArrayUsingComparator:", &stru_10013FFB8));

  _Block_object_dispose(&v38, 8);
  return v27;
}

+ (id)eventSessionToAppUsage:(id)a3
{
  id var1;
  id var0;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  _QWORD v14[5];
  _QWORD v15[5];

  var1 = a3.var1;
  var0 = a3.var0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3.var0, "absoluteTimestamp"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(var1, "absoluteTimestamp"));
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "timeIntervalSinceDate:", v5);
    v8 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v8 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.0));
  }
  v9 = (void *)v8;
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(var0, "bundleID"));
  if (-[__CFString containsString:](v10, "containsString:", CFSTR("/")))
  {
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString lastPathComponent](v10, "lastPathComponent"));

    v10 = CFSTR("<unknown>");
  }
  else
  {
    v11 = CFSTR("<unknown>");
  }
  v14[0] = CFSTR("bundleID");
  v14[1] = CFSTR("executableName");
  v15[0] = v10;
  v15[1] = v11;
  v14[2] = CFSTR("sessionStartTime");
  v14[3] = CFSTR("sessionEndTime");
  v15[2] = v5;
  v15[3] = v7;
  v14[4] = CFSTR("appDuration");
  v15[4] = v9;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 5));

  return v12;
}

+ (BOOL)timeRange:(id)a3 subsumes:(id)a4
{
  id var1;
  id var0;
  id v6;
  id v7;
  unsigned __int8 v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  NSObject *v16;
  uint64_t v17;

  var1 = a4.var1;
  var0 = a4.var0;
  v6 = a3.var1;
  v7 = a3.var0;
  if (objc_msgSend(a3.var0, "isEarlierDateThan:", a4.var0))
    v8 = objc_msgSend(v6, "isLaterDateThan:", var1);
  else
    v8 = 0;
  v9 = sub_1000604F0();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "toString"));
    objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "toString"));
    sub_1000CC74C();
  }

  v12 = sub_1000604F0();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(var0, "toString"));
    objc_claimAutoreleasedReturnValue(objc_msgSend(var1, "toString"));
    sub_1000CC708();
  }

  v15 = sub_1000604F0();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    sub_1000CC69C(v8, v16, v17);

  return v8;
}

+ (void)printBMAppInfocusEvent:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;

  v3 = a3;
  v4 = sub_1000604F0();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_1000CC99C(v3, v5);

  v6 = sub_1000604F0();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    sub_1000CC924(v3, v7);

  v8 = sub_1000604F0();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    sub_1000CC8A0(v3, v9);

  v10 = sub_1000604F0();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    sub_1000CC828(v3, v11);

  v12 = sub_1000604F0();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    sub_1000CC790(v3, v13);

}

@end
