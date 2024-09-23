@implementation BICCacheStats

+ (void)prepare
{
  if (qword_30DBD8 != -1)
    dispatch_once(&qword_30DBD8, &stru_290368);
}

+ (void)logOperation:(id)a3 forRequest:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  unint64_t v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  unint64_t v27;
  __int16 v28;
  id v29;

  v6 = a3;
  v7 = a4;
  v8 = mach_absolute_time();
  if (qword_30DBE8)
  {
    v9 = v8;
    v11 = dword_30DBE0;
    v10 = *(unsigned int *)algn_30DBE4;
    v12 = BCImageCacheLog();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = v9 * v11 / v10 / 0x186A0;
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
      *(_DWORD *)buf = 138413058;
      v23 = v15;
      v24 = 2112;
      v25 = v6;
      v26 = 2048;
      v27 = v14;
      v28 = 2048;
      v29 = objc_msgSend(v7, "generation");
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "BICCacheStats: Request$%@,%@,%llu,%lu", buf, 0x2Au);

    }
  }
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_AC3A8;
  v18[3] = &unk_28C9C8;
  v20 = v6;
  v21 = a1;
  v19 = v7;
  v16 = v6;
  v17 = v7;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_30DBF0);
  sub_AC3A8((uint64_t)v18);
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_30DBF0);

}

+ (void)logDescribedImage:(id)a3 withComment:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSString *v10;
  NSObject *v11;
  id v12;
  id v13;
  NSString *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;

  v5 = a3;
  v6 = a4;
  if (qword_30DBE8)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
    if (!objc_msgSend(v7, "isEqualToString:", qword_30DBE8))
    {
      if (!v7 || !qword_30DBE8)
        goto LABEL_16;
      v23 = BCImageCacheLog();
      v11 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v7;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "BICCacheStats: Skip %@", buf, 0xCu);
      }
      goto LABEL_15;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "image"));
    v9 = objc_msgSend(v8, "CGImage");

    if (!v9)
    {
LABEL_16:

      goto LABEL_17;
    }
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ID_%@-Timestamp_%llu-%@.png"), v7, mach_absolute_time() * dword_30DBE0 / *(unsigned int *)algn_30DBE4 / 0xF4240, v6);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    v12 = objc_alloc_init((Class)CIContext);
    v13 = objc_msgSend(objc_alloc((Class)CIImage), "initWithCGImage:", v9);
    v14 = NSTemporaryDirectory();
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringByAppendingPathComponent:", v11));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v16));

    v24 = 0;
    objc_msgSend(v12, "writePNGRepresentationOfImage:toURL:format:colorSpace:options:error:", v13, v17, kCIFormatRGBA8, objc_msgSend(v13, "colorSpace"), &__NSDictionary0__struct, &v24);
    v18 = v24;
    v19 = BCImageCacheLog();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    v21 = v20;
    if (v18)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "absoluteString"));
        *(_DWORD *)buf = 138412802;
        v26 = v22;
        v27 = 2112;
        v28 = v6;
        v29 = 2112;
        v30 = v18;
        _os_log_error_impl(&dword_0, v21, OS_LOG_TYPE_ERROR, "BICCacheStats: Failed to %@ for %@, %@", buf, 0x20u);
LABEL_13:

      }
    }
    else if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "absoluteString"));
      *(_DWORD *)buf = 138412546;
      v26 = v22;
      v27 = 2112;
      v28 = v6;
      _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "BICCacheStats: %@ for %@", buf, 0x16u);
      goto LABEL_13;
    }

LABEL_15:
    goto LABEL_16;
  }
LABEL_17:

}

+ (void)incrementCounter:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  int v6;
  id v7;

  v3 = a3;
  if (qword_30DBE8)
  {
    v4 = BCImageCacheLog();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "BICCacheStats: Counter$%@,1", (uint8_t *)&v6, 0xCu);
    }

  }
}

+ (void)addToCounter:(id)a3 amount:(unint64_t)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  unint64_t v11;

  v5 = a3;
  if (qword_30DBE8)
  {
    v6 = BCImageCacheLog();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = 138412546;
      v9 = v5;
      v10 = 2048;
      v11 = a4;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "BICCacheStats: Counter$%@,%llu", (uint8_t *)&v8, 0x16u);
    }

  }
}

+ (void)logCounter:(id)a3 amount:(unint64_t)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  unint64_t v11;

  v5 = a3;
  if (qword_30DBE8)
  {
    v6 = BCImageCacheLog();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = 138412546;
      v9 = v5;
      v10 = 2048;
      v11 = a4;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "BICCacheStats: Value$%@,%llu", (uint8_t *)&v8, 0x16u);
    }

  }
}

+ (id)operationToLogString:(id)a3
{
  uint64_t v3;
  id v4;
  id v5;

  v3 = qword_30DC00;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&qword_30DC00, &stru_290388);
  v5 = objc_msgSend((id)qword_30DBF8, "indexOfObject:", v4);

  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lu,"), v5);
}

@end
