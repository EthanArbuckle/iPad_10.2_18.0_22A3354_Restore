@implementation _DASExtensionHostContext

+ (id)_extensionAuxiliaryHostProtocol
{
  if (qword_1001ABE78 != -1)
    dispatch_once(&qword_1001ABE78, &stru_1001604C8);
  return (id)qword_1001ABE80;
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (qword_1001ABE88 != -1)
    dispatch_once(&qword_1001ABE88, &stru_1001604E8);
  return (id)qword_1001ABE90;
}

- (int)pid
{
  void *v2;
  int v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_DASExtensionHostContext _auxiliaryConnection](self, "_auxiliaryConnection"));
  v3 = objc_msgSend(v2, "processIdentifier");

  return v3;
}

- (id)remoteContextWithError:(id *)a3
{
  void *v4;
  void *v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_1000D87A0;
  v12 = sub_1000D87B0;
  v13 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_DASExtensionHostContext _auxiliaryConnection](self, "_auxiliaryConnection"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000D87B8;
  v7[3] = &unk_100160510;
  v7[4] = &v8;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v7));

  if (a3)
    *a3 = objc_retainAutorelease((id)v9[5]);
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (void)activityCompletedWithStatus:(unsigned __int8)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v3 = a3;
  v5 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("plugin")));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Host received notice that extension is finished", v7, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_DASExtensionHostContext contextPlugin](self, "contextPlugin"));
  objc_msgSend(v6, "extensionDidFinishWithStatus:", v3);

}

- (_DASPlugin)contextPlugin
{
  return (_DASPlugin *)objc_getProperty(self, a2, 8, 1);
}

- (void)setContextPlugin:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextPlugin, 0);
}

@end
