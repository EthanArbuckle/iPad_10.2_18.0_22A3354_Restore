@implementation NSProgress

+ (id)crl_progressWithCRLProgress:(id)a3 totalUnitCount:(int64_t)a4
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  int64_t v10;
  double v11;
  id v12;
  void *v13;
  int v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  CRLProgressUserInfoObject *v20;
  void **v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  id v26;
  id v27[2];
  id from;
  id location;
  uint8_t buf[24];

  v5 = a3;
  v6 = objc_msgSend(objc_alloc((Class)NSProgress), "initWithParent:userInfo:", 0, 0);
  objc_msgSend(v6, "setTotalUnitCount:", a4);
  objc_msgSend(v5, "maxValue");
  v8 = v7;
  if ((objc_msgSend(v5, "isIndeterminate") & 1) == 0 && v8 > 0.0)
  {
    objc_msgSend(v5, "value");
    objc_msgSend(v6, "setCompletedUnitCount:", (uint64_t)(v9 / v8 * (double)(uint64_t)objc_msgSend(v6, "totalUnitCount")));
  }
  v10 = 10;
  if (a4 > 10)
    v10 = a4;
  if (v8 > 0.0)
    v11 = v8 / (double)v10;
  else
    v11 = (double)v10;
  objc_initWeak(&location, v5);
  objc_initWeak(&from, v6);
  v12 = &_dispatch_main_q;
  v22 = _NSConcreteStackBlock;
  v23 = 3221225472;
  v24 = sub_1002BA330;
  v25 = &unk_10124CBF8;
  objc_copyWeak(&v26, &location);
  objc_copyWeak(v27, &from);
  v27[1] = (id)a4;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "addProgressObserverWithValueInterval:queue:handler:", &_dispatch_main_q, &v22, v11));

  if (!v13)
  {
    v14 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124CC18);
    v15 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E194BC(v14, v15);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124CC38);
    v16 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
      sub_100E02830(v17, buf, v14, (os_log_t)v16);
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[NSProgress(NSProgress_CRLAdditions) crl_progressWithCRLProgress:totalUnitCount:]"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/NSProgress_CRLAdditions.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, 70, 0, "invalid nil value for '%{public}s'", "progressObserver", v22, v23, v24, v25);

  }
  v20 = objc_alloc_init(CRLProgressUserInfoObject);
  -[CRLProgressUserInfoObject setProgress:](v20, "setProgress:", v5);
  -[CRLProgressUserInfoObject setProgressObserver:](v20, "setProgressObserver:", v13);
  objc_msgSend(v6, "setUserInfoObject:forKey:", v20, CFSTR("CRLProgressUserInfoKey"));

  objc_destroyWeak(v27);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v6;
}

+ (id)crl_progressWithChildren:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  void *i;
  void *v10;
  NSProgressKind v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *j;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];

  v3 = a3;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v24;
    v8 = 1;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        v6 += (uint64_t)objc_msgSend(v10, "totalUnitCount");
        v11 = (NSProgressKind)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "kind"));
        LODWORD(v10) = v11 == NSProgressKindFile;

        v8 &= v10;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
    v8 = 1;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSProgress discreteProgressWithTotalUnitCount:](NSProgress, "discreteProgressWithTotalUnitCount:", v6));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v13 = v3;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v20;
    do
    {
      for (j = 0; j != v15; j = (char *)j + 1)
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(v12, "addChild:withPendingUnitCount:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)j), objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)j), "totalUnitCount", (_QWORD)v19));
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v15);
  }

  if (v8)
    objc_msgSend(v12, "setKind:", NSProgressKindFile);

  return v12;
}

- (void)crl_stopObservingCRLProgress
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  *(_QWORD *)&v3 = objc_opt_class(CRLProgressUserInfoObject, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSProgress userInfo](self, "userInfo", v3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("CRLProgressUserInfoKey")));
  v8 = sub_100221D0C(v5, v7);
  v11 = (id)objc_claimAutoreleasedReturnValue(v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "progress"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "progressObserver"));
  objc_msgSend(v9, "removeProgressObserver:", v10);

}

- (int64_t)crl_pendingUnitCountForIncompleteProgress:(int64_t)a3
{
  int64_t v5;
  int64_t v6;
  int64_t v7;
  int64_t v8;

  v5 = -[NSProgress totalUnitCount](self, "totalUnitCount");
  v6 = -[NSProgress completedUnitCount](self, "completedUnitCount");
  v7 = v5 - v6;
  if (v5 - v6 < 0)
    v7 = v6 - v5;
  v8 = (unint64_t)v7 >> 1;
  if (v7 > a3)
    v8 = a3;
  if ((unint64_t)v7 < 2 && v7 < a3)
    return 0;
  else
    return v8;
}

@end
