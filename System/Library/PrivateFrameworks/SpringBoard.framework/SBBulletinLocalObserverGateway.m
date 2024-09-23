@implementation SBBulletinLocalObserverGateway

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__SBBulletinLocalObserverGateway_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_31 != -1)
    dispatch_once(&sharedInstance_onceToken_31, block);
  return (id)sharedInstance_sharedInstance_5;
}

void __48__SBBulletinLocalObserverGateway_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sharedInstance_5;
  sharedInstance_sharedInstance_5 = (uint64_t)v1;

}

- (SBBulletinLocalObserverGateway)init
{
  SBBulletinLocalObserverGateway *v2;
  void *Serial;
  uint64_t v4;
  BBObserver *bbObserver;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBBulletinLocalObserverGateway;
  v2 = -[SBBulletinLocalObserverGateway init](&v7, sel_init);
  if (v2)
  {
    SBGuidedAccessPrepare();
    Serial = (void *)BSDispatchQueueCreateSerial();
    objc_msgSend(MEMORY[0x1E0D036B8], "gatewayWithQueue:calloutQueue:name:priority:", Serial, MEMORY[0x1E0C80D38], *MEMORY[0x1E0D03678], 3);
    v4 = objc_claimAutoreleasedReturnValue();
    bbObserver = v2->_bbObserver;
    v2->_bbObserver = (BBObserver *)v4;

    -[BBObserver setDelegate:](v2->_bbObserver, "setDelegate:", v2);
    -[BBObserver setObserverFeed:](v2->_bbObserver, "setObserverFeed:", 65023);

  }
  return v2;
}

- (void)observer:(id)a3 addBulletin:(id)a4 forFeed:(unint64_t)a5 playLightsAndSirens:(BOOL)a6 withReply:(id)a7
{
  _BOOL4 v8;
  id v11;
  void (**v12)(id, _QWORD);
  os_log_t *v13;
  void *v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  int v24;
  int v25;
  uint64_t v26;
  char v27;
  void *v28;
  int v29;
  int v30;
  int v31;
  void *v32;
  unsigned int v33;
  os_log_t v34;
  NSObject *v35;
  void *v36;
  void *v37;
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  _BYTE v42[10];
  unint64_t v43;
  _BYTE v44[10];
  __int16 v45;
  _BOOL4 v46;
  uint64_t v47;

  v8 = a6;
  v47 = *MEMORY[0x1E0C80C00];
  v38 = a3;
  v11 = a4;
  v12 = (void (**)(id, _QWORD))a7;
  v13 = (os_log_t *)MEMORY[0x1E0DC5F80];
  v14 = (void *)*MEMORY[0x1E0DC5F80];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0DC5F80], OS_LOG_TYPE_DEFAULT))
  {
    v15 = v14;
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "publisherMatchID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "un_logDigest");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sectionID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v40 = v17;
    v41 = 2114;
    *(_QWORD *)v42 = v19;
    *(_WORD *)&v42[8] = 2048;
    v43 = a5;
    *(_WORD *)v44 = 2114;
    *(_QWORD *)&v44[2] = v20;
    v45 = 1024;
    v46 = v8;
    _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "%@ adding bulletin %{public}@ for feed %lu in section %{public}@ playLightsAndSirens: %{BOOL}u", buf, 0x30u);

  }
  +[SBBacklightController sharedInstance](SBBacklightController, "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "screenIsOn");

  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "isUILocked");

  v25 = v22 & (v24 ^ 1);
  +[SBConferenceManager sharedInstance](SBConferenceManager, "sharedInstance");
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend((id)v26, "inFaceTime");

  LOBYTE(v26) = SBGuidedAccessIsActive();
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "isCaptured");

  v30 = v29 & (objc_msgSend(MEMORY[0x1E0CEA950], "_isProbablyBeingRecorded") ^ 1);
  if ((v26 & 1) != 0)
    v30 = 1;
  if ((v27 & 1) != 0)
    v31 = 1;
  else
    v31 = v30;
  objc_msgSend((id)SBApp, "notificationDispatcher");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "isCarDestinationActive");

  v34 = *v13;
  if (os_log_type_enabled(*v13, OS_LOG_TYPE_DEFAULT))
  {
    v35 = v34;
    objc_msgSend(v11, "publisherMatchID");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "un_logDigest");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v40 = v37;
    v41 = 1024;
    *(_DWORD *)v42 = v25 & (v31 ^ 1) | v33;
    *(_WORD *)&v42[4] = 1024;
    *(_DWORD *)&v42[6] = v25;
    LOWORD(v43) = 1024;
    *(_DWORD *)((char *)&v43 + 2) = v31;
    HIWORD(v43) = 1024;
    *(_DWORD *)v44 = v33;
    _os_log_impl(&dword_1D0540000, v35, OS_LOG_TYPE_DEFAULT, "Notification %{public}@ should alert: %{BOOL}u [ isDeviceInUse = %{BOOL}u isDeviceBusy = %{BOOL}u isCarPlayActive = %{BOOL}u ]", buf, 0x24u);

  }
  v12[2](v12, v25 & (v31 ^ 1) | v33);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bbObserver, 0);
}

@end
