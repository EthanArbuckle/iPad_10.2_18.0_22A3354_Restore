@implementation WRM_QMIDsdClient

- (void)handleBandwidthEstimationInd:(Indication *)a3
{
  id v5;
  id v6;
  _QWORD v7[7];
  _QWORD v8[9];
  _QWORD v9[7];
  _QWORD v10[7];
  _QWORD v11[6];
  _QWORD v12[12];
  _QWORD v13[7];
  _QWORD v14[3];
  char v15;
  _QWORD v16[3];
  int v17;
  _QWORD v18[3];
  char v19;
  _QWORD v20[3];
  char v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  _QWORD *v26;

  v5 = +[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton");
  v6 = +[WRM_EnhancedCTService wrm_EnhancedCTServiceSingleton](WRM_EnhancedCTService, "wrm_EnhancedCTServiceSingleton");
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v21 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v19 = 0;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v17 = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v15 = 0;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("==========QMI.DSD client Bandwidth Estimation received=========\n"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000520F8;
  v13[3] = &unk_1002027E8;
  v13[4] = v14;
  v13[5] = v16;
  v13[6] = &v22;
  v26 = v13;
  sub_10005301C((qmi::MessageBase *)a3, 22, (unint64_t)&v26);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100052164;
  v12[3] = &unk_100202810;
  v12[8] = v14;
  v12[9] = v16;
  v12[4] = self;
  v12[5] = v6;
  v12[10] = v20;
  v12[11] = v18;
  v12[6] = v5;
  v12[7] = &v22;
  v26 = v12;
  sub_100053104((qmi::MessageBase *)a3, 1, (unint64_t)&v26);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("===QMI.DSD.%u Configured Max Bandwidth===\n"), *((unsigned __int8 *)v23 + 24));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10005248C;
  v11[3] = &unk_100202838;
  v11[4] = v6;
  v11[5] = &v22;
  v26 = v11;
  sub_1000531EC((qmi::MessageBase *)a3, 16, &v26);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("===QMI.DSD.%u Downlink Bandwidth Estimation===\n"), *((unsigned __int8 *)v23 + 24));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100052534;
  v10[3] = &unk_100202860;
  v10[5] = v5;
  v10[6] = &v22;
  v10[4] = v6;
  v26 = v10;
  sub_1000532D4((qmi::MessageBase *)a3, 17, &v26);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("===QMI.DSD.%u Uplink Bandwidth Estimation===\n"), *((unsigned __int8 *)v23 + 24));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100052650;
  v9[3] = &unk_100202888;
  v9[5] = v5;
  v9[6] = &v22;
  v9[4] = v6;
  v26 = v9;
  sub_1000533BC((qmi::MessageBase *)a3, 18, &v26);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("===QMI.DSD.%u Connected State Summary===\n"), *((unsigned __int8 *)v23 + 24));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100018BB0;
  v8[3] = &unk_1002028B0;
  v8[6] = &v22;
  v8[7] = v20;
  v8[4] = v6;
  v8[5] = v5;
  v8[8] = v18;
  v26 = v8;
  sub_1000534A4((qmi::MessageBase *)a3, 19, (unint64_t)&v26);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("===QMI.DSD.%u RLGS Info===\n"), *((unsigned __int8 *)v23 + 24));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100052740;
  v7[3] = &unk_1002028D8;
  v7[5] = v5;
  v7[6] = &v22;
  v7[4] = v6;
  v26 = v7;
  sub_100019664((qmi::MessageBase *)a3, 20, (unint64_t)&v26);
  _Block_object_dispose(v14, 8);
  _Block_object_dispose(v16, 8);
  _Block_object_dispose(v18, 8);
  _Block_object_dispose(v20, 8);
  _Block_object_dispose(&v22, 8);
}

- (WRM_QMIDsdClient)initWithSub:(int64_t)a3
{
  WRM_QMIDsdClient *v4;
  dispatch_queue_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WRM_QMIDsdClient;
  v4 = -[WRM_QMIDsdClient init](&v7, "init");
  if (v4)
  {
    v5 = dispatch_queue_create("com.apple.WirelessRadioManager.QMIDsdClient", 0);
    v4->mQueue = (OS_dispatch_queue *)v5;
    if (!v5)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 16, CFSTR("QMI.DSD failed to create the DSD client queue, use main_queue instead."));
      v4->mQueue = (OS_dispatch_queue *)&_dispatch_main_q;
    }
    v4->mSub = a3;
    -[WRM_QMIDsdClient initNewClient](v4, "initNewClient");
    v4->mQmiClientRunning = 0;
    v4->mSlotOneCellID = 0;
    v4->mSlotTwoCellID = 0;
  }
  return v4;
}

- (void)dealloc
{
  NSObject *mQueue;
  objc_super v4;

  mQueue = self->mQueue;
  if (mQueue)
    dispatch_release(mQueue);
  if (self->mClient)
  {
    -[WRM_QMIDsdClient stop](self, "stop");
    qmi::Client::release((qmi::Client *)self->mClient);
  }
  v4.receiver = self;
  v4.super_class = (Class)WRM_QMIDsdClient;
  -[WRM_QMIDsdClient dealloc](&v4, "dealloc");
}

- (void)start
{
  qmi::Client *mClient;

  mClient = (qmi::Client *)self->mClient;
  if (mClient)
    qmi::Client::start(mClient);
}

- (void)stop
{
  qmi::Client *mClient;

  mClient = (qmi::Client *)self->mClient;
  if (mClient)
    qmi::Client::stop(mClient);
}

- (BOOL)qmiClientRunning
{
  return self->mQmiClientRunning;
}

- (void)initNewClient
{
  operator new();
}

- (void)started
{
  uint64_t v3;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("QMI.DSD client started.\n"));
  if (self->mSub == 1)
    v3 = 1;
  else
    v3 = 2;
  -[WRM_QMIDsdClient bindQMIClientToSlotType:](self, "bindQMIClientToSlotType:", v3);
  self->mQmiClientRunning = 1;
}

- (void)stopped
{
  id v3;
  _QWORD v4[6];

  v3 = objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "getCTService");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("QMI.DSD client stopped.\n"));
  self->mQmiClientRunning = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100051F98;
  v4[3] = &unk_100201B18;
  v4[4] = v3;
  v4[5] = self;
  dispatch_async((dispatch_queue_t)objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "getQueue"), v4);
}

- (void)errored
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("QMI: DSDclient errored/crashed?!.\n"));
}

- (void)handleDataSystemStatusInd:(Indication *)a3
{
  _QWORD v5[5];
  _QWORD *v6;

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("QMI.DSD client system status report received\n"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100052048;
  v5[3] = &unk_1002027C0;
  v5[4] = self;
  v6 = v5;
  sub_100052F08((qmi::MessageBase *)a3, 16, (unint64_t)&v6);
}

- (void)sendRegisterIndicationRequest
{
  const qmi::MutableMessageBase *v3;
  void *v4;
  void *mClient;
  uint64_t v6;
  int v7;
  uint64_t v8;
  void *v9;
  _BYTE v10[32];
  _QWORD aBlock[5];

  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("QMI.DSD send dsd::RegisterIndication::Request\n"));
  qmi::MutableMessageBase::MutableMessageBase((qmi::MutableMessageBase *)v10, 0x38u);
  *sub_10005358C((uint64_t)v10, 161) = 1;
  mClient = self->mClient;
  v6 = QMIServiceMsg::create((QMIServiceMsg *)v10, v3);
  v7 = 25000;
  v8 = 0;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 3221225472;
  aBlock[2] = sub_100053810;
  aBlock[3] = &unk_100202940;
  aBlock[4] = &stru_100202918;
  v4 = _Block_copy(aBlock);
  v9 = v4;
  if (v6)
  {
    qmi::Client::send(mClient, &mClient);
    v4 = v9;
  }
  if (v4)
    _Block_release(v4);
  qmi::MutableMessageBase::~MutableMessageBase((qmi::MutableMessageBase *)v10);
}

- (void)bindQMIClientToSlotType:(int)a3
{
  const qmi::MutableMessageBase *v5;
  void *v6;
  _QWORD v7[5];
  void *mClient;
  uint64_t v9;
  int v10;
  uint64_t v11;
  void *v12;
  _BYTE v13[32];
  _QWORD aBlock[5];

  qmi::MutableMessageBase::MutableMessageBase((qmi::MutableMessageBase *)v13, 0x27u);
  *(_DWORD *)sub_10005398C((uint64_t)v13, 1) = a3;
  mClient = self->mClient;
  v9 = QMIServiceMsg::create((QMIServiceMsg *)v13, v5);
  v10 = 25000;
  v11 = 0;
  v12 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100052AA8;
  v7[3] = &unk_1002027C0;
  v7[4] = self;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 3221225472;
  aBlock[2] = sub_100053BE4;
  aBlock[3] = &unk_100202940;
  aBlock[4] = v7;
  v6 = _Block_copy(aBlock);
  v12 = v6;
  if (v9)
  {
    qmi::Client::send(mClient, &mClient);
    v6 = v12;
  }
  if (v6)
    _Block_release(v6);
  qmi::MutableMessageBase::~MutableMessageBase((qmi::MutableMessageBase *)v13);
}

@end
