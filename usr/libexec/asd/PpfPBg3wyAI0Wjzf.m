@implementation PpfPBg3wyAI0Wjzf

+ (id)sharedInstance
{
  if (qword_100511588 != -1)
    dispatch_once(&qword_100511588, &stru_1004CEB48);
  return (id)qword_100511580;
}

+ (BOOL)initializeNFHardwareManagerState
{
  void *v2;
  ASNFHardwareMonitor *v3;
  unsigned int v4;
  BOOL v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NFHardwareManager sharedHardwareManager](NFHardwareManager, "sharedHardwareManager"));
  v3 = objc_opt_new(ASNFHardwareMonitor);
  objc_msgSend(v2, "registerEventListener:", v3);
  v4 = objc_msgSend(v2, "getHwSupport");
  if (v4 == 2)
  {
    v5 = 1;
  }
  else if (v4 == 4)
  {
    v5 = 0;
  }
  else
  {
    -[ASNFHardwareMonitor waitForNotification](v3, "waitForNotification");
    v5 = objc_msgSend(v2, "getHwSupport") == 2;
  }
  objc_msgSend(v2, "unregisterEventListener:", v3);

  return v5;
}

- (void)ILEFYKTi2wz6Hf5l:(id)a3
{
  void (**v3)(id, uint64_t, uint64_t, uint64_t);
  id v4;
  dispatch_semaphore_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  NSObject *v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v3 = (void (**)(id, uint64_t, uint64_t, uint64_t))a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = sub_100016F80;
  v31 = sub_100016F90;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_100016F80;
  v25 = sub_100016F90;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_100016F80;
  v19 = sub_100016F90;
  v20 = 0;
  if (+[PpfPBg3wyAI0Wjzf initializeNFHardwareManagerState](PpfPBg3wyAI0Wjzf, "initializeNFHardwareManagerState"))
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NFSecureElement embeddedSecureElement](NFSecureElement, "embeddedSecureElement"));
    if (v4)
    {
      v5 = dispatch_semaphore_create(0);
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NFHardwareManager sharedHardwareManager](NFHardwareManager, "sharedHardwareManager"));
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_100016F98;
      v9[3] = &unk_1004CEB70;
      v12 = &v27;
      v13 = &v21;
      v14 = &v15;
      v4 = v4;
      v10 = v4;
      v7 = v5;
      v11 = v7;
      v8 = objc_msgSend(v6, "startSecureElementManagerSessionWithPriority:", v9);

      dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
    }
  }
  else
  {
    v4 = 0;
  }
  v3[2](v3, v16[5], v22[5], v28[5]);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
}

@end
