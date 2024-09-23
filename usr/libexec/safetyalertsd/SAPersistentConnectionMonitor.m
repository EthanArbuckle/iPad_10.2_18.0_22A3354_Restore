@implementation SAPersistentConnectionMonitor

- (SAPersistentConnectionMonitor)initWithQueue:(id)a3 forNetwork:(int)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  _DWORD v10[2];
  __int16 v11;
  const char *v12;

  v6 = a3;
  if (!a4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[PCInterfaceMonitor sharedInstanceForIdentifier:](PCInterfaceMonitor, "sharedInstanceForIdentifier:", 0));
    objc_msgSend(v7, "addDelegate:queue:", self, v6);
    goto LABEL_5;
  }
  if (a4 == 1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[PCInterfaceMonitor sharedInstanceForIdentifier:](PCInterfaceMonitor, "sharedInstanceForIdentifier:", 1));
    objc_msgSend(v7, "addDelegate:queue:", self, v6);
LABEL_5:

    goto LABEL_8;
  }
  v8 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_ERROR))
  {
    v10[0] = 68289026;
    v10[1] = 0;
    v11 = 2082;
    v12 = "";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#saNwReachMonitor,init,invalid type\"}", (uint8_t *)v10, 0x12u);
  }
LABEL_8:
  self->nwType = a4;

  return self;
}

- (void)interfaceReachabilityChanged:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  unsigned int v7;
  int nwType;
  void *reachabilityInstance;
  unsigned int v10;
  NSObject *v11;
  unsigned int v12;
  double *v13;
  double v14;
  unsigned __int8 v15;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  unsigned int v21;
  __int16 v22;
  unsigned int v23;

  v4 = a3;
  v5 = objc_autoreleasePoolPush();
  v6 = (id)SALogObjectGeneral;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_msgSend(v4, "isInternetReachable");
    nwType = self->nwType;
    *(_DWORD *)buf = 68289538;
    v17 = 0;
    v18 = 2082;
    v19 = "";
    v20 = 1026;
    v21 = v7;
    v22 = 1026;
    v23 = nwType;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#saNwReachMonitor,interfaceReachabilityChanged\", \"reachable\":%{public}d, \"type\":%{public}d}", buf, 0x1Eu);
  }

  reachabilityInstance = self->reachabilityInstance;
  if (reachabilityInstance)
  {
    v10 = objc_msgSend(v4, "isInternetReachable");
    v15 = v10;
    v11 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *((_DWORD *)reachabilityInstance + 30);
      *(_DWORD *)buf = 68289538;
      v17 = 0;
      v18 = 2082;
      v19 = "";
      v20 = 1026;
      v21 = v12;
      v22 = 1026;
      v23 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#saNwReachMonitor,onNetworkReachabilityChanged\", \"type\":%{public}d, \"isConnected\":%{public}hhd}", buf, 0x1Eu);
    }
    v13 = (double *)sub_10003D044();
    v14 = 0.0;
    if (v13[7] != 0.0)
      v14 = 1.0;
    sub_10006DA74((unsigned __int8 *)reachabilityInstance + 48, &v15, v14);
  }
  objc_autoreleasePoolPop(v5);

}

- (void)setReachabilityInstance:(void *)a3
{
  self->reachabilityInstance = a3;
}

- (BOOL)getReachability
{
  int nwType;
  void *v3;
  unsigned __int8 v4;
  BOOL v5;

  nwType = self->nwType;
  if (nwType)
  {
    if (nwType != 1)
      return 0;
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[PCInterfaceMonitor sharedInstanceForIdentifier:](PCInterfaceMonitor, "sharedInstanceForIdentifier:", 1));
    v4 = objc_msgSend(v3, "isInternetReachable");
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[PCInterfaceMonitor sharedInstanceForIdentifier:](PCInterfaceMonitor, "sharedInstanceForIdentifier:", 0));
    v4 = objc_msgSend(v3, "isInternetReachable");
  }
  v5 = v4;

  return v5;
}

@end
