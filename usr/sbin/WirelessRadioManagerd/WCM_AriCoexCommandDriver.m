@implementation WCM_AriCoexCommandDriver

+ (id)singleton
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD block[5];

  v2 = a1;
  objc_sync_enter(v2);
  v3 = dlopen("/usr/lib/libARI.dylib", 1);
  v4 = dlopen("/usr/lib/libICEClient.dylib", 1);
  v5 = 0;
  if (v3 && v4)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000A5D60;
    block[3] = &unk_100203228;
    block[4] = v2;
    if (qword_100271230 != -1)
      dispatch_once(&qword_100271230, block);
    v5 = (id)qword_100271228;
  }
  objc_sync_exit(v2);

  return v5;
}

- (WCM_AriCoexCommandDriver)init
{
  WCM_AriCoexCommandDriver *v2;
  WCM_AriCoexCommandDriver *v3;
  WCM_AriCoexCommandHandler *mAriCoexCommandHandler;
  WCM_CellularController *mCellularController;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WCM_AriCoexCommandDriver;
  v2 = -[WCM_AriCoexCommandDriver init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    mAriCoexCommandHandler = v2->mAriCoexCommandHandler;
    v2->mAriCoexCommandHandler = 0;

    mCellularController = v3->mCellularController;
    v3->mCellularController = 0;

  }
  return v3;
}

- (void)createCommandHandlerForAriVersion:(unsigned int)a3
{
  __objc2_class *v4;
  WCM_AriCoexCommandHandler *v5;
  WCM_AriCoexCommandHandler *mAriCoexCommandHandler;
  WCM_AriCoexCommandHandler *v7;

  if (a3 == 2)
  {
    v4 = WCM_AriCoexCommandHandlerV2;
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    v4 = WCM_AriCoexCommandHandler;
LABEL_5:
    v5 = (WCM_AriCoexCommandHandler *)objc_alloc_init(v4);
    mAriCoexCommandHandler = self->mAriCoexCommandHandler;
    self->mAriCoexCommandHandler = v5;
    goto LABEL_7;
  }
  mAriCoexCommandHandler = self->mAriCoexCommandHandler;
  self->mAriCoexCommandHandler = 0;
LABEL_7:

  v7 = self->mAriCoexCommandHandler;
  if (v7)
  {
    if (self->mCellularController)
      -[WCM_AriCoexCommandHandler setCellularController:](v7, "setCellularController:");
  }
}

- (void)handleEvent:(id)a3
{
  id v4;
  WCM_AriCoexCommandHandler *mAriCoexCommandHandler;
  id v6;

  v4 = a3;
  mAriCoexCommandHandler = self->mAriCoexCommandHandler;
  v6 = v4;
  if (mAriCoexCommandHandler)
    -[WCM_AriCoexCommandHandler handleEvent:](mAriCoexCommandHandler, "handleEvent:", v4);
  else
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("Error: ARI driver handle event -- WCM_AriCoexCommandHandler is NULL..."));

}

- (void)setCellularController:(id)a3
{
  WCM_AriCoexCommandHandler *mAriCoexCommandHandler;
  id v6;

  v6 = a3;
  objc_storeStrong((id *)&self->mCellularController, a3);
  mAriCoexCommandHandler = self->mAriCoexCommandHandler;
  if (mAriCoexCommandHandler)
    -[WCM_AriCoexCommandHandler setCellularController:](mAriCoexCommandHandler, "setCellularController:", v6);
  else
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("Warning: ARI driver set cellular controller-- WCM_AriCoexCommandHandler is NULL. Will set it later..."));

}

- (void)connectBaseband
{
  WCM_AriCoexCommandHandler *mAriCoexCommandHandler;

  mAriCoexCommandHandler = self->mAriCoexCommandHandler;
  if (mAriCoexCommandHandler)
    -[WCM_AriCoexCommandHandler connectBaseband](mAriCoexCommandHandler, "connectBaseband");
  else
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("Error: ARI driver connect baseband -- WCM_AriCoexCommandHandler is NULL..."));
}

- (void)handleRc1DynamicPolicy:(id)a3 SubId:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  WCM_AriCoexCommandHandler *mAriCoexCommandHandler;
  id v8;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  mAriCoexCommandHandler = self->mAriCoexCommandHandler;
  v8 = v6;
  if (mAriCoexCommandHandler)
    -[WCM_AriCoexCommandHandler handleRc1DynamicPolicy:SubId:](mAriCoexCommandHandler, "handleRc1DynamicPolicy:SubId:", v6, v4);
  else
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("Error: ARI driver set RC1 policy -- WCM_AriCoexCommandHandler is NULL..."));

}

- (void)setAntennaBlockingPolicyForPlatformId:(unint64_t)a3 activeSubId:(unint64_t)a4
{
  WCM_AriCoexCommandHandler *mAriCoexCommandHandler;

  mAriCoexCommandHandler = self->mAriCoexCommandHandler;
  if (mAriCoexCommandHandler)
    -[WCM_AriCoexCommandHandler setAntennaBlockingPolicyForPlatformId:activeSubId:](mAriCoexCommandHandler, "setAntennaBlockingPolicyForPlatformId:activeSubId:", a3, a4);
  else
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("Error: ARI driver set antenna blocking policy -- WCM_AriCoexCommandHandler is NULL..."));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mCellularController, 0);
  objc_storeStrong((id *)&self->mAriCoexCommandHandler, 0);
}

@end
