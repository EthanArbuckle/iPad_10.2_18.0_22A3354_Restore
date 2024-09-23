@implementation NSKeyedArchiver

+ (id)crl_securelyArchiveRoot:(id)a3
{
  id v3;
  void *v4;
  id v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  void *v15;
  NSObject *v17;
  uint64_t v18;
  objc_class *v19;
  NSString *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint8_t buf[4];
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  id v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  id v42;

  v3 = a3;
  v24 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v24));
  v5 = v24;
  if (!v4)
  {
    v6 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101231C98);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    {
      v17 = v7;
      v19 = (objc_class *)objc_opt_class(v5, v18);
      v20 = NSStringFromClass(v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "domain"));
      v23 = objc_msgSend(v5, "code");
      *(_DWORD *)buf = 67111170;
      v26 = v6;
      v27 = 2082;
      v28 = "+[NSKeyedArchiver(CRLAdditions) crl_securelyArchiveRoot:]";
      v29 = 2082;
      v30 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/NSKeyedArchiver_CRLAdditions.m";
      v31 = 1024;
      v32 = 17;
      v33 = 2112;
      v34 = v3;
      v35 = 2114;
      v36 = v21;
      v37 = 2114;
      v38 = v22;
      v39 = 2048;
      v40 = v23;
      v41 = 2112;
      v42 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Unable to encode object %@: errorClass=%{public}@, domain=%{public}@, code=%zd (%@) ", buf, 0x54u);

    }
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_101231CB8);
    v8 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE81F0(v8, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[NSKeyedArchiver(CRLAdditions) crl_securelyArchiveRoot:]"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/NSKeyedArchiver_CRLAdditions.m"));
    v12 = (objc_class *)objc_opt_class(v5, v11);
    v13 = NSStringFromClass(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "domain"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 17, 0, "Unable to encode object %@: errorClass=%{public}@, domain=%{public}@, code=%zd (%@) ", v3, v14, v15, objc_msgSend(v5, "code"), v5);

  }
  return v4;
}

@end
