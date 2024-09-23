@implementation NIPrivacyAuthorizationManager

- (NIPrivacyAuthorizationManager)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NIPrivacyAuthorizationManager;
  return -[NIPrivacyAuthorizationManager init](&v3, "init");
}

- (void)clearStateForPid:(int)a3
{
  std::mutex *v4;
  int v5;

  v5 = a3;
  v4 = (std::mutex *)((char *)self + 8);
  std::mutex::lock((std::mutex *)((char *)self + 8));
  sub_10002A478((_QWORD *)self + 9, &v5);
  std::mutex::unlock(v4);
}

- (int)authorizationStatusForSession:(id)a3 promptUserIfUndetermined:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t *v7;
  int v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  _QWORD *v21;
  _QWORD v23[4];
  __int128 v24;
  uint64_t v25;
  _OWORD v26[2];
  id v27;
  _OWORD v28[2];
  unsigned int v29;
  unsigned int *v30;
  __int128 buf;
  uint64_t v32;

  v4 = a4;
  v6 = a3;
  v29 = objc_msgSend(v6, "pid");
  std::mutex::lock((std::mutex *)((char *)self + 8));
  v7 = sub_10002A4AC((_QWORD *)self + 9, (int *)&v29);
  if (v7)
  {
    v8 = *((_DWORD *)v7 + 6);
    std::mutex::unlock((std::mutex *)((char *)self + 8));
  }
  else
  {
    std::mutex::unlock((std::mutex *)((char *)self + 8));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "displayName"));
    v10 = v9 == 0;

    if (v10)
    {
      v13 = qword_10085F520;
      if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_FAULT))
        sub_1003CB6CC(v13);
      v8 = 0;
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "connection"));
      v12 = v11;
      if (v11)
        objc_msgSend(v11, "auditToken");
      else
        memset(v28, 0, sizeof(v28));
      v27 = 0;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[LSBundleRecord bundleRecordForAuditToken:error:](LSBundleRecord, "bundleRecordForAuditToken:error:", v28, &v27));
      v15 = v27;

      if (!v14 || v15)
      {
        v19 = (id)qword_10085F520;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "displayName"));
          sub_1003CB70C(v20, (uint64_t)v15, (uint8_t *)&buf, v19);
        }

        v8 = 0;
      }
      else if (v4)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "displayName"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "connection"));
        v18 = v17;
        if (v17)
          objc_msgSend(v17, "auditToken");
        else
          memset(v26, 0, sizeof(v26));
        -[NIPrivacyAuthorizationManager presentUserAuthorizationPrompt:forAuditToken:withBundleRecord:](self, "presentUserAuthorizationPrompt:forAuditToken:withBundleRecord:", v16, v26, v14);

        std::mutex::lock((std::mutex *)((char *)self + 8));
        v30 = &v29;
        v21 = sub_10002A6D4((uint64_t)self + 72, (int *)&v29, (uint64_t)&unk_100472CF8, &v30);
        *(_OWORD *)(v21 + 3) = buf;
        v21[5] = v32;
        std::mutex::unlock((std::mutex *)((char *)self + 8));
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_10002A1B8;
        v23[3] = &unk_1007FA7B8;
        v24 = buf;
        v25 = v32;
        AnalyticsSendEventLazy(CFSTR("com.apple.nearbyinteraction.auth"), v23);
        v8 = buf;
      }
      else
      {
        v8 = 2;
      }

    }
  }

  return v8;
}

- (AuthorizationState)presentUserAuthorizationPrompt:(SEL)a3 forAuditToken:(id)a4 withBundleRecord:(id *)a5
{
  id v8;
  void *v9;
  __int128 v10;
  int v11;
  NSObject *v12;
  const __CFString *v13;
  AuthorizationState *result;
  _OWORD v15[2];
  uint8_t buf[4];
  id v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;
  void *v21;

  v8 = a6;
  retstr->var0 = 2;
  retstr->var1.var0.__null_state_ = 0;
  retstr->var1.__engaged_ = 0;
  v20 = kTCCAccessCheckOptionPrompt;
  v21 = &__kCFBooleanTrue;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
  v10 = *(_OWORD *)&a5->var0[4];
  v15[0] = *(_OWORD *)a5->var0;
  v15[1] = v10;
  v11 = TCCAccessCheckAuditToken(kTCCServiceNearbyInteraction, v15, v9);
  v12 = qword_10085F520;
  if (os_log_type_enabled((os_log_t)qword_10085F520, OS_LOG_TYPE_DEFAULT))
  {
    v13 = CFSTR("YES");
    if (!v11)
      v13 = CFSTR("NO");
    *(_DWORD *)buf = 138412546;
    v17 = v8;
    v18 = 2112;
    v19 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "#bundle Application: %@, hasAccessToNearbyInteraction: %@", buf, 0x16u);
  }
  if (v11)
    retstr->var0 = 3;
  else
    retstr->var0 = 4;
  retstr->var1.var0.__val_ = sub_10000883C();
  retstr->var1.__engaged_ = 1;

  return result;
}

- (void).cxx_destruct
{
  sub_10002AB34((uint64_t)self + 72);
  std::mutex::~mutex((std::mutex *)((char *)self + 8));
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 850045863;
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_QWORD *)self + 12) = 0;
  *((_DWORD *)self + 26) = 1065353216;
  return self;
}

@end
