@implementation YeQHj6zXMU2P8KDh

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000215AC;
  block[3] = &unk_1004CE9E0;
  block[4] = a1;
  if (qword_1005115E0 != -1)
    dispatch_once(&qword_1005115E0, block);
  return (id)qword_1005115D8;
}

- (YeQHj6zXMU2P8KDh)init
{
  OS_os_log *v3;
  OS_os_log *pqeBGOQoC53XfqEz;

  v3 = (OS_os_log *)os_log_create("com.apple.asd", "dfLog");
  pqeBGOQoC53XfqEz = self->pqeBGOQoC53XfqEz;
  self->pqeBGOQoC53XfqEz = v3;

  return self;
}

+ (BOOL)sensitiveLoggingEnabled
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("debug.log-sensitive-data"));

  return v3;
}

- (void)cGauGmZFPJJkT1d3:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *pqeBGOQoC53XfqEz;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;

  v4 = a3;
  if (+[YeQHj6zXMU2P8KDh sensitiveLoggingEnabled](YeQHj6zXMU2P8KDh, "sensitiveLoggingEnabled"))
  {
    v18 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "description"));
    v6 = (unint64_t)objc_msgSend(v5, "length");
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = (v6 >> 9) + 1;
      v10 = 1;
      do
      {
        if (v7 - v8 >= 0x200)
          v11 = 512;
        else
          v11 = v7 - v8;
        pqeBGOQoC53XfqEz = self->pqeBGOQoC53XfqEz;
        if (os_log_type_enabled(pqeBGOQoC53XfqEz, OS_LOG_TYPE_DEFAULT))
        {
          v13 = pqeBGOQoC53XfqEz;
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "substringWithRange:", v8, v11));
          *(_DWORD *)buf = 134218498;
          v20 = v10;
          v21 = 2048;
          v22 = v9;
          v23 = 2112;
          v24 = v14;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "InVal for IB (part %lu of %lu):\n%@", buf, 0x20u);

        }
        v8 += v11;
        ++v10;
      }
      while (v8 < v7);
    }

    v4 = v18;
  }
  else
  {
    v15 = self->pqeBGOQoC53XfqEz;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = v15;
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allKeys"));
      *(_DWORD *)buf = 138412290;
      v20 = (uint64_t)v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "InVal keys for IB: %@", buf, 0xCu);

    }
  }

}

- (void)zQehSLHqShQPYsHo:(id)a3 kidVYacbY8LCJT8v:(_eipjLVDiD7LNwlPc *)a4
{
  id v6;
  NSObject *pqeBGOQoC53XfqEz;
  _BOOL4 v8;
  unsigned int var0;
  unsigned int var1;
  NSObject *v11;
  id v12;
  void *v13;
  unsigned int v14;
  unsigned int v15;
  int v16;
  unsigned int v17;
  __int16 v18;
  unsigned int v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;

  v6 = a3;
  pqeBGOQoC53XfqEz = self->pqeBGOQoC53XfqEz;
  v8 = os_log_type_enabled(pqeBGOQoC53XfqEz, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v8)
    {
      var0 = a4->var0;
      var1 = a4->var1;
      v11 = pqeBGOQoC53XfqEz;
      v12 = objc_msgSend(v6, "qfSDGTGvqd3Hruzg");
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "GyF0atX3JpCKc9pK"));
      v16 = 67109890;
      v17 = var0;
      v18 = 1024;
      v19 = var1;
      v20 = 2048;
      v21 = v12;
      v22 = 2112;
      v23 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "DF[%x, %d]: EC %ld, V: %@", (uint8_t *)&v16, 0x22u);

    }
  }
  else if (v8)
  {
    v14 = a4->var0;
    v15 = a4->var1;
    v16 = 67109376;
    v17 = v14;
    v18 = 1024;
    v19 = v15;
    _os_log_impl((void *)&_mh_execute_header, pqeBGOQoC53XfqEz, OS_LOG_TYPE_INFO, "DF[%x, %d]: nil", (uint8_t *)&v16, 0xEu);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->pqeBGOQoC53XfqEz, 0);
}

@end
