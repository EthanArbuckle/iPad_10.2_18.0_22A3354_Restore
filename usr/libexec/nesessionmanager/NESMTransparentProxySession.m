@implementation NESMTransparentProxySession

- (void)setConfigurationWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t isKindOfClass;
  uint64_t v11;
  char v12;
  unsigned int v13;
  _QWORD *v14;
  uint64_t v15;
  NSObject *v16;
  objc_super v17;
  _QWORD v18[4];
  id v19;
  NESMTransparentProxySession *v20;
  id v21;
  id v22;
  id location;
  uint8_t buf[4];
  NESMTransparentProxySession *v25;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NESMVPNSession pluginConfigurationEntities](self, "pluginConfigurationEntities"));
  objc_initWeak(&location, self);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10007C618;
  v18[3] = &unk_1000BE718;
  objc_copyWeak(&v22, &location);
  v6 = v4;
  v21 = v6;
  v7 = v5;
  v19 = v7;
  v20 = self;
  v8 = objc_retainBlock(v18);
  v9 = objc_opt_class(NETransparentProxyNetworkSettings);
  isKindOfClass = objc_opt_isKindOfClass(v7, v9);
  v12 = isKindOfClass;
  if ((isKindOfClass & 1) == 0)
  {
    v15 = ne_log_obj(isKindOfClass, v11);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v25 = self;
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@: Plugin configuration is not a NETransparentProxyNetworkSettings object", buf, 0xCu);
    }

    v14 = v6;
    goto LABEL_7;
  }
  v13 = objc_msgSend(v7, "isFullyTransparent");
  v14 = v8;
  if (v13)
  {
LABEL_7:
    ((void (*)(_QWORD *, _QWORD))v14[2])(v14, v12 & 1);
    goto LABEL_8;
  }
  v17.receiver = self;
  v17.super_class = (Class)NESMTransparentProxySession;
  -[NESMFlowDivertSession setConfigurationWithCompletionHandler:](&v17, "setConfigurationWithCompletionHandler:", v8);
LABEL_8:

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

}

- (void)plugin:(id)a3 didStartWithPID:(int)a4 error:(id)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = *(_QWORD *)&a4;
  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NESMSession server](self, "server"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "primaryPhysicalInterface"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "interfaceName"));
  sub_100017BE0(v9, v12);

  v13 = (id)objc_claimAutoreleasedReturnValue(-[NESMVPNSession stateHandler](self, "stateHandler"));
  objc_msgSend(v13, "handlePlugin:didStartWithPID:error:", v9, v5, v8);

}

@end
