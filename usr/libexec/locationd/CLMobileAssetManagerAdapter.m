@implementation CLMobileAssetManagerAdapter

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5;

  v5 = a4 + 1;
  if (a4 + 1 < (unint64_t)objc_msgSend(a3, "count"))
    objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", v5), "becameFatallyBlocked:index:", a3, v5);
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
  objc_msgSend(a3, "sync:", a4);
}

+ (id)getSilo
{
  if (qword_10230EB40 != -1)
    dispatch_once(&qword_10230EB40, &stru_1021B4420);
  return (id)qword_10230EB38;
}

- (CLMobileAssetManagerAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLMobileAssetManagerAdapter;
  return -[CLMobileAssetManagerAdapter initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLMobileAssetManagerProtocol, &OBJC_PROTOCOL___CLMobileAssetManagerClientProtocol);
}

- (void)beginService
{
  -[CLNotifierServiceAdapter setAdaptedNotifier:](self, "setAdaptedNotifier:", sub_1013DEC7C((uint64_t)-[CLMobileAssetManagerAdapter universe](self, "universe")));
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
    sub_101951C08();
}

- (void)endService
{
  CLNotifierBase *v2;

  v2 = -[CLNotifierServiceAdapter notifier](self, "notifier");
  (*((void (**)(CLNotifierBase *))v2->var0 + 2))(v2);
}

- (void)adaptee
{
  void *result;

  result = -[CLNotifierServiceAdapter notifier](self, "notifier");
  if (result)
  return result;
}

- (void)doAsync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLMobileAssetManagerAdapter adaptee](self, "adaptee"));
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLMobileAssetManagerAdapter adaptee](self, "adaptee"));
  (*((void (**)(id))a4 + 2))(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLMobileAssetManagerAdapter adaptee](self, "adaptee"));
  return 0;
}

- (void)getAssetVersionInfoFor:(int)a3 withReply:(id)a4
{
  int v6;
  id v7;
  NSObject *v8;
  unsigned int v9;
  unsigned int v10;
  uint8_t buf[4];
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  __int16 v19;
  unsigned int v20;
  __int16 v21;
  unsigned int v22;

  v9 = -1;
  v10 = -1;
  v6 = sub_100D69E80((uint64_t)-[CLNotifierServiceAdapter notifier](self, "notifier") + 120, a3, &v10, &v9);
  if ((v6 & 1) != 0)
    v7 = 0;
  else
    v7 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.MobileAsset"), 1, 0);
  if (qword_1022A02A0 != -1)
    dispatch_once(&qword_1022A02A0, &stru_1021B45C8);
  v8 = qword_1022A02A8;
  if (os_log_type_enabled((os_log_t)qword_1022A02A8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 68290050;
    v12 = 0;
    v13 = 2082;
    v14 = "";
    v15 = 1026;
    v16 = a3;
    v17 = 1026;
    v18 = v6;
    v19 = 1026;
    v20 = v10;
    v21 = 1026;
    v22 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#CLMAM,getAssetVersionInfo\", \"asset descriptor\":%{public}d, \"successful\":%{public}hhd, \"compatibility version\":%{public}d, \"content version\":%{public}d}", buf, 0x2Au);
  }
  (*((void (**)(id, id, _QWORD, _QWORD))a4 + 2))(a4, v7, v10, v9);
}

- (void)deleteCurrentAssetFor:(int)a3 withReply:(id)a4
{
  int v5;
  int v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  const char *v10;
  uint8_t *v11;
  _DWORD v12[4];
  uint8_t buf[4];
  int v14;
  __int16 v15;
  const char *v16;

  v5 = sub_100D6A08C((uint64_t)-[CLNotifierServiceAdapter notifier](self, "notifier") + 120, a3);
  if (v5)
  {
    v6 = v5;
    if (qword_1022A02A0 != -1)
      dispatch_once(&qword_1022A02A0, &stru_1021B45C8);
    v7 = qword_1022A02A8;
    if (os_log_type_enabled((os_log_t)qword_1022A02A8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67240192;
      v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "#CLMAM,deleteCurrentAsset,failed with error,%{public}d", buf, 8u);
    }
    if (sub_1001BFF7C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1022A02A0 != -1)
        dispatch_once(&qword_1022A02A0, &stru_1021B45C8);
      v12[0] = 67240192;
      v12[1] = v6;
      _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A02A8, 2, "#CLMAM,deleteCurrentAsset,failed with error,%{public}d", v12, 8);
      v11 = (uint8_t *)v10;
      sub_100512490("Generic", 1, 0, 2, "-[CLMobileAssetManagerAdapter deleteCurrentAssetFor:withReply:]", "%s\n", v10);
      if (v11 != buf)
        free(v11);
    }
    v8 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("com.apple.locationd.MobileAsset"), v6, 0);
  }
  else
  {
    if (qword_1022A02A0 != -1)
      dispatch_once(&qword_1022A02A0, &stru_1021B45C8);
    v9 = qword_1022A02A8;
    if (os_log_type_enabled((os_log_t)qword_1022A02A8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68289026;
      v14 = 0;
      v15 = 2082;
      v16 = "";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#CLMAM,deleteCurrentAsset,succeeded\"}", buf, 0x12u);
    }
    v8 = 0;
  }
  (*((void (**)(id, id))a4 + 2))(a4, v8);
}

- (void)copyNearbyAssetSettingsWithReply:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  int v8;
  id v9;
  uint8_t buf[4];
  id v11;

  v4 = sub_100D6A274((uint64_t)-[CLNotifierServiceAdapter notifier](self, "notifier") + 120);
  if (qword_1022A02A0 != -1)
    dispatch_once(&qword_1022A02A0, &stru_1021B45C8);
  v5 = qword_1022A02A8;
  if (os_log_type_enabled((os_log_t)qword_1022A02A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#CLMAM,copyNearbyAssetSettingsWithReply,returning dict,%{private}@", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A02A0 != -1)
      dispatch_once(&qword_1022A02A0, &stru_1021B45C8);
    v8 = 138477827;
    v9 = v4;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A02A8, 0, "#CLMAM,copyNearbyAssetSettingsWithReply,returning dict,%{private}@", &v8, 12);
    v7 = (uint8_t *)v6;
    sub_100512490("Generic", 1, 0, 2, "-[CLMobileAssetManagerAdapter copyNearbyAssetSettingsWithReply:]", "%s\n", v6);
    if (v7 != buf)
      free(v7);
  }
  (*((void (**)(id, id))a3 + 2))(a3, v4);
}

- (void)copyNearbyAssetSettingsOfAccessoryFile:(id)a3 withReply:(id)a4
{
  id v5;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  int v9;
  id v10;
  uint8_t buf[4];
  id v12;

  v5 = sub_100D6A54C((uint64_t)-[CLNotifierServiceAdapter notifier](self, "notifier") + 120, a3);
  if (qword_1022A02A0 != -1)
    dispatch_once(&qword_1022A02A0, &stru_1021B45C8);
  v6 = qword_1022A02A8;
  if (os_log_type_enabled((os_log_t)qword_1022A02A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#CLMAM,copyNearbyAssetSettingsOfAccessoryFileWithReplay,returning dict,%{private}@", buf, 0xCu);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A02A0 != -1)
      dispatch_once(&qword_1022A02A0, &stru_1021B45C8);
    v9 = 138477827;
    v10 = v5;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A02A8, 0, "#CLMAM,copyNearbyAssetSettingsOfAccessoryFileWithReplay,returning dict,%{private}@", &v9, 12);
    v8 = (uint8_t *)v7;
    sub_100512490("Generic", 1, 0, 2, "-[CLMobileAssetManagerAdapter copyNearbyAssetSettingsOfAccessoryFile:withReply:]", "%s\n", v7);
    if (v8 != buf)
      free(v8);
  }
  (*((void (**)(id, id))a4 + 2))(a4, v5);
}

- (void)copyRoutineAssetSettingsWithReply:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  unsigned int v8;
  unsigned int v9;
  int v10;
  id v11;
  __int16 v12;
  unsigned int v13;
  __int16 v14;
  unsigned int v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  unsigned int v19;
  __int16 v20;
  unsigned int v21;

  v8 = -1;
  v9 = -1;
  v4 = sub_100D6A82C((uint64_t)-[CLNotifierServiceAdapter notifier](self, "notifier") + 120, &v9, &v8);
  if (qword_1022A02A0 != -1)
    dispatch_once(&qword_1022A02A0, &stru_1021B45C8);
  v5 = qword_1022A02A8;
  if (os_log_type_enabled((os_log_t)qword_1022A02A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138478339;
    v17 = v4;
    v18 = 1026;
    v19 = v9;
    v20 = 1026;
    v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#CLMAM,copyRoutineAssetSettings,returning dict,%{private}@,compatibilityVersion,%{public}d,contentVersion,%{public}d", buf, 0x18u);
  }
  if (sub_1001BFF7C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1022A02A0 != -1)
      dispatch_once(&qword_1022A02A0, &stru_1021B45C8);
    v10 = 138478339;
    v11 = v4;
    v12 = 1026;
    v13 = v9;
    v14 = 1026;
    v15 = v8;
    _os_log_send_and_compose_impl(2, 0, buf, 1628, &_mh_execute_header, qword_1022A02A8, 0, "#CLMAM,copyRoutineAssetSettings,returning dict,%{private}@,compatibilityVersion,%{public}d,contentVersion,%{public}d", &v10, 24);
    v7 = (uint8_t *)v6;
    sub_100512490("Generic", 1, 0, 2, "-[CLMobileAssetManagerAdapter copyRoutineAssetSettingsWithReply:]", "%s\n", v6);
    if (v7 != buf)
      free(v7);
  }
  (*((void (**)(id, id, _QWORD, _QWORD))a3 + 2))(a3, v4, v9, v8);
}

@end
