@implementation FRURLRouterManager

- (FRURLRouterManager)init
{
  FRURLRouterManager *v2;
  NSMutableArray *v3;
  NSMutableArray *routers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FRURLRouterManager;
  v2 = -[FRURLRouterManager init](&v6, "init");
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    routers = v2->_routers;
    v2->_routers = v3;

  }
  return v2;
}

- (void)addRoutable:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[FRURLRouterManager routers](self, "routers"));
  objc_msgSend(v5, "addObject:", v4);

}

- (NSMutableArray)routers
{
  return self->_routers;
}

- (BOOL)handleOpenURL:(id)a3 options:(id)a4 analyticsReferral:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  __int128 v14;
  uint64_t v15;
  void *i;
  void *v17;
  NSObject *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = FRNavigationLog;
  if (os_log_type_enabled((os_log_t)FRNavigationLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v26 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "URLRouterManager received URL to handle <%{public}@>", buf, 0xCu);
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FRURLRouterManager routers](self, "routers"));
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v13)
  {
    v15 = *(_QWORD *)v22;
    *(_QWORD *)&v14 = 138543618;
    v20 = v14;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v18 = FRNavigationLog;
        if (os_log_type_enabled((os_log_t)FRNavigationLog, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v20;
          v26 = v8;
          v27 = 2112;
          v28 = v17;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "URLRouterManager sending URL <%{public}@> to router %@", buf, 0x16u);
        }
        if ((objc_msgSend(v17, "handleOpenURL:options:analyticsReferral:", v8, v9, v10, v20) & 1) != 0)
        {
          LOBYTE(v13) = 1;
          goto LABEL_15;
        }
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
      if (v13)
        continue;
      break;
    }
  }
LABEL_15:

  return (char)v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routers, 0);
}

@end
