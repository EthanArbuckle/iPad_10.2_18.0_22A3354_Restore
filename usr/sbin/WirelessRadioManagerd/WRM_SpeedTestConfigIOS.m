@implementation WRM_SpeedTestConfigIOS

- (WRM_SpeedTestConfigIOS)init
{
  WRM_SpeedTestConfigIOS *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  NPTPerformanceTest *v7;
  objc_super v9;
  void **v10;
  uint64_t v11;
  Class (*v12)(uint64_t);
  void *v13;
  __int128 *v14;
  __int128 v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  uint64_t v19;

  v9.receiver = self;
  v9.super_class = (Class)WRM_SpeedTestConfigIOS;
  v2 = -[WRM_SpeedTestConfigIOS init](&v9, "init");
  v2->inProgress = 0;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("CellularThroughput: CellularTest init"));
  if (!qword_1002711D0)
  {
    v15 = off_100203A78;
    v16 = 0;
    qword_1002711D0 = _sl_dlopen(&v15, 0);
  }
  if (!qword_1002711D0)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("CellularThroughput: runtime check for presence of NPTKit.framework failed"));
    return 0;
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("CellularThroughput: runtime check for presence of NPTKit.framework passed"));
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("CellularThroughput: Creating Configuration"));
  *(_QWORD *)&v15 = 0;
  *((_QWORD *)&v15 + 1) = &v15;
  v16 = 0x3052000000;
  v17 = sub_100089FA8;
  v18 = sub_100089FB8;
  v3 = (void *)qword_1002711D8;
  v19 = qword_1002711D8;
  if (!qword_1002711D8)
  {
    v10 = _NSConcreteStackBlock;
    v11 = 3221225472;
    v12 = sub_100089FC4;
    v13 = &unk_100201B40;
    v14 = &v15;
    sub_100089FC4((uint64_t)&v10);
    v3 = *(void **)(*((_QWORD *)&v15 + 1) + 40);
  }
  _Block_object_dispose(&v15, 8);
  v4 = objc_msgSend(v3, "defaultConfigurationCellular");
  v5 = v4;
  if (!v4)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("CellularThroughput: performanceTestWithConfig is nil"));
    return 0;
  }
  objc_msgSend(v4, "setInterfaceType:", 0);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("CellularThroughput: performanceTestWithConfig.interfaceType: %d"), objc_msgSend(v5, "interfaceType"));
  objc_msgSend(v5, "setDownloadSize:", 100);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("CellularThroughput: performanceTestWithConfig.downloadSize: %d"), objc_msgSend(v5, "downloadSize"));
  objc_msgSend(v5, "setClientName:", CFSTR("analyticsAutomation"));
  *(_QWORD *)&v15 = 0;
  *((_QWORD *)&v15 + 1) = &v15;
  v16 = 0x3052000000;
  v17 = sub_100089FA8;
  v18 = sub_100089FB8;
  v6 = (void *)qword_1002711E0;
  v19 = qword_1002711E0;
  if (!qword_1002711E0)
  {
    v10 = _NSConcreteStackBlock;
    v11 = 3221225472;
    v12 = sub_10008A0BC;
    v13 = &unk_100201B40;
    v14 = &v15;
    sub_10008A0BC((uint64_t)&v10);
    v6 = *(void **)(*((_QWORD *)&v15 + 1) + 40);
  }
  _Block_object_dispose(&v15, 8);
  v7 = (NPTPerformanceTest *)objc_msgSend(v6, "performanceTestWithConfiguration:", v5);
  v2->performanceTest = v7;
  if (!v7)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("CellularThroughput: performanceTest is nil"));
    return 0;
  }
  return v2;
}

- (void)startDownloadTest:(id)a3
{
  const __CFString *v5;
  NPTPerformanceTest *v6;
  NPTPerformanceTest *performanceTest;
  _QWORD v8[6];

  if (self->performanceTest)
  {
    if (!self->inProgress)
    {
      self->inProgress = 1;
      v6 = self->performanceTest;
      -[NPTPerformanceTest startMetadataCollectionWithCompletion:](self->performanceTest, "startMetadataCollectionWithCompletion:", 0);
      performanceTest = self->performanceTest;
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_100089B78;
      v8[3] = &unk_100203A58;
      v8[4] = self;
      v8[5] = a3;
      -[NPTPerformanceTest startDownloadWithCompletion:](performanceTest, "startDownloadWithCompletion:", v8);
      return;
    }
    v5 = CFSTR("Download task already started");
  }
  else
  {
    v5 = CFSTR("NPTPerformanceTest instance nil, bailing out");
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, v5);
  if (a3)
    (*((void (**)(id, const __CFString *))a3 + 2))(a3, CFSTR("NO"));
}

- (void)abort
{
  NPTPerformanceTest *performanceTest;

  performanceTest = self->performanceTest;
  if (performanceTest)
    -[NPTPerformanceTest cancelAllNetworking](performanceTest, "cancelAllNetworking");
  self->inProgress = 0;
}

- (BOOL)inProgress
{
  return self->inProgress;
}

@end
