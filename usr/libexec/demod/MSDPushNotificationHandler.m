@implementation MSDPushNotificationHandler

+ (id)sharedInstance
{
  if (qword_100175228 != -1)
    dispatch_once(&qword_100175228, &stru_10013E2D0);
  return (id)qword_100175220;
}

- (MSDPushNotificationHandler)init
{
  MSDPushNotificationHandler *v2;
  MSDPushNotificationHandler *v3;
  MSDPushNotificationHandler *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MSDPushNotificationHandler;
  v2 = -[MSDPushNotificationHandler init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    -[MSDPushNotificationHandler setApsConnection:](v2, "setApsConnection:", 0);
    -[MSDPushNotificationHandler setApsToken:](v3, "setApsToken:", 0);
    v4 = v3;
  }

  return v3;
}

- (void)enablePushNotifications
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDPushNotificationHandler apsConnection](self, "apsConnection"));

  if (!v3)
  {
    v4 = objc_alloc((Class)APSConnection);
    v5 = APSEnvironmentProduction;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDWorkQueueSet sharedInstance](MSDWorkQueueSet, "sharedInstance"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pollingQueue"));
    v8 = objc_msgSend(v4, "initWithEnvironmentName:namedDelegatePort:queue:", v5, CFSTR("com.apple.aps.mobilestoredemoport"), v7);
    -[MSDPushNotificationHandler setApsConnection:](self, "setApsConnection:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDPushNotificationHandler apsConnection](self, "apsConnection"));
    objc_msgSend(v9, "setDelegate:", self);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDPushNotificationHandler apsConnection](self, "apsConnection"));
    objc_msgSend(v10, "requestTokenForTopic:identifier:", CFSTR("com.apple.ist.demounit.demodevicenotifications"), &stru_100141020);

    v12 = (id)objc_claimAutoreleasedReturnValue(-[MSDPushNotificationHandler apsConnection](self, "apsConnection"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", CFSTR("com.apple.ist.demounit.demodevicenotifications")));
    objc_msgSend(v12, "setEnabledTopics:", v11);

  }
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  unsigned int v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  id v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  unsigned int v36;
  id v37;
  _BOOL4 v38;
  void *v39;
  id v40;
  NSObject *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  const char *v51;
  __int16 v52;
  id v53;

  v4 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topic"));
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.ist.demounit.demodevicenotifications")))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
    v7 = sub_1000604F0();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      sub_1000BBA60((uint64_t)v6, v8, v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("action")));
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("ping_hub"));

    if (v11)
    {
      v12 = sub_1000604F0();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v50) = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Received request to ping the hub.", (uint8_t *)&v50, 2u);
      }

      v14 = objc_claimAutoreleasedReturnValue(+[MSDMailProcessor sharedInstance](MSDMailProcessor, "sharedInstance"));
      -[NSObject sendPushNotificationPing](v14, "sendPushNotificationPing");
      goto LABEL_32;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("action")));
    v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("collect_logs"));

    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("parameters")));
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKey:", CFSTR("url")));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKey:", CFSTR("retryAttempts")));
      v19 = objc_msgSend(v18, "integerValue");

      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKey:", CFSTR("headers")));
      v21 = sub_1000604F0();
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v50 = 138543618;
        v51 = (const char *)v14;
        v52 = 2048;
        v53 = v19;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Received request to collect MobileStoreDemo logs. Upload url: %{public}@, retry attempts: %ld", (uint8_t *)&v50, 0x16u);
      }

      v23 = (void *)objc_claimAutoreleasedReturnValue(+[MSDS3UploadHandler sharedInstance](MSDS3UploadHandler, "sharedInstance"));
      objc_msgSend(v23, "uploadDemoLogsTo:HttpHeaders:andMaxAttempts:", v14, v20, v19);

      goto LABEL_32;
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("action")));
    v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("demo_device_lock"));

    if (v25)
    {
      if (!os_variant_has_internal_content("com.apple.mobilestoredemod"))
      {
LABEL_33:

        goto LABEL_34;
      }
      v14 = objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
      if (!-[NSObject isDDLDevice](v14, "isDDLDevice")
        || !-[NSObject isContentFrozen](v14, "isContentFrozen"))
      {
        v42 = sub_1000604F0();
        v27 = objc_claimAutoreleasedReturnValue(v42);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          sub_1000BB9AC(v27, v43, v44, v45, v46, v47, v48, v49);
        goto LABEL_31;
      }
      if ((-[NSObject unenrollWithObliteration:preserveESim:callUnregister:preserveDDLFlag:](v14, "unenrollWithObliteration:preserveESim:callUnregister:preserveDDLFlag:", 0, 1, 0, 1) & 1) == 0)
      {
        v26 = sub_1000604F0();
        v27 = objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          sub_1000BB978(v27, v28, v29, v30, v31, v32, v33, v34);
        goto LABEL_31;
      }
    }
    else
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("action")));
      v36 = objc_msgSend(v35, "isEqualToString:", CFSTR("discover"));

      v37 = sub_1000604F0();
      v14 = objc_claimAutoreleasedReturnValue(v37);
      v38 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      if (v36)
      {
        if (v38)
        {
          v50 = 136315138;
          v51 = "-[MSDPushNotificationHandler connection:didReceiveIncomingMessage:]";
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s - INFO - Received request to flash the device.", (uint8_t *)&v50, 0xCu);
        }

        v14 = objc_claimAutoreleasedReturnValue(+[MSDAVFlashlight sharedInstance](MSDAVFlashlight, "sharedInstance"));
        v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("parameters")));
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v27, "objectForKey:", CFSTR("flashDeviceDuration")));
        if ((-[NSObject flash:](v14, "flash:", objc_msgSend(v39, "unsignedIntegerValue")) & 1) == 0)
        {
          v40 = sub_1000604F0();
          v41 = objc_claimAutoreleasedReturnValue(v40);
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
            sub_1000BB9E0(v41);

        }
        goto LABEL_31;
      }
      if (v38)
      {
        v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("action")));
        v50 = 138543362;
        v51 = (const char *)v27;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Received invalid command from DU. %{public}@", (uint8_t *)&v50, 0xCu);
LABEL_31:

      }
    }
LABEL_32:

    goto LABEL_33;
  }
LABEL_34:

}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  void *v7;
  id v8;
  NSObject *v9;

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "hexStringRepresentation", a3));
  -[MSDPushNotificationHandler setApsToken:](self, "setApsToken:", v7);

  v8 = sub_1000604F0();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    sub_1000BBACC(self, v9);

}

- (NSString)apsToken
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setApsToken:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (APSConnection)apsConnection
{
  return (APSConnection *)objc_getProperty(self, a2, 16, 1);
}

- (void)setApsConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_apsConnection, 0);
  objc_storeStrong((id *)&self->_apsToken, 0);
}

@end
