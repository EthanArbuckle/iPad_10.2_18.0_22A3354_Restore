@implementation WRM_QMINasClient

- (void)notifyStreamingEBHState:(unsigned __int8)a3
{
  unsigned int v3;
  uint64_t v5;
  const qmi::MutableMessageBase *v6;
  void *v7;
  _QWORD v8[5];
  void *mClient;
  uint64_t v10;
  int v11;
  uint64_t v12;
  void *v13;
  _BYTE v14[32];
  _QWORD aBlock[5];

  v3 = a3;
  v5 = qmi::MutableMessageBase::MutableMessageBase((qmi::MutableMessageBase *)v14, 0x5568u);
  *sub_100019A80(v5, 20) = v3;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("QMI.NAS.%d: notifyStreamingEBHState state: %d "), self->mSub, v3);
  mClient = self->mClient;
  v10 = QMIServiceMsg::create((QMIServiceMsg *)v14, v6);
  v11 = 25000;
  v12 = 0;
  v13 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100019408;
  v8[3] = &unk_1002027C0;
  v8[4] = self;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 3221225472;
  aBlock[2] = sub_100018764;
  aBlock[3] = &unk_100202940;
  aBlock[4] = v8;
  v7 = _Block_copy(aBlock);
  v13 = v7;
  if (v10)
  {
    qmi::Client::send(mClient, &mClient);
    v7 = v13;
  }
  if (v7)
    _Block_release(v7);
  qmi::MutableMessageBase::~MutableMessageBase((qmi::MutableMessageBase *)v14);
}

- (void)notifyAVStatus:(unsigned __int8)a3 :(unsigned __int16)a4
{
  unsigned int v4;
  unsigned int v5;
  char *v7;
  const qmi::MutableMessageBase *v8;
  void *v9;
  _QWORD v10[5];
  void *mClient;
  uint64_t v12;
  int v13;
  uint64_t v14;
  void *v15;
  _BYTE v16[32];
  _QWORD aBlock[5];

  v4 = a4;
  v5 = a3;
  qmi::MutableMessageBase::MutableMessageBase((qmi::MutableMessageBase *)v16, 0x5568u);
  v7 = sub_100019A0C((uint64_t)v16, 18);
  *v7 = v5;
  *((_WORD *)v7 + 1) = v4;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("QMI.NAS.%d: notifyAVStatus state: %d, BW: %d"), self->mSub, v5, v4);
  mClient = self->mClient;
  v12 = QMIServiceMsg::create((QMIServiceMsg *)v16, v8);
  v13 = 25000;
  v14 = 0;
  v15 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000194A4;
  v10[3] = &unk_1002027C0;
  v10[4] = self;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 3221225472;
  aBlock[2] = sub_100018764;
  aBlock[3] = &unk_100202940;
  aBlock[4] = v10;
  v9 = _Block_copy(aBlock);
  v15 = v9;
  if (v12)
  {
    qmi::Client::send(mClient, &mClient);
    v9 = v15;
  }
  if (v9)
    _Block_release(v9);
  qmi::MutableMessageBase::~MutableMessageBase((qmi::MutableMessageBase *)v16);
}

- (WRM_QMINasClient)initWithSub:(int64_t)a3
{
  WRM_QMINasClient *v4;
  dispatch_queue_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WRM_QMINasClient;
  v4 = -[WRM_QMINasClient init](&v7, "init");
  if (v4)
  {
    v5 = dispatch_queue_create("com.apple.WirelessRadioManager.QMINasClient", 0);
    v4->mQueue = (OS_dispatch_queue *)v5;
    if (!v5)
    {
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 16, CFSTR("QMI: failed to create the client queue, use main_queue instead."));
      v4->mQueue = (OS_dispatch_queue *)&_dispatch_main_q;
    }
    v4->mSub = a3;
    -[WRM_QMINasClient initNewClient](v4, "initNewClient");
    v4->mQmiClientRunning = 0;
    v4->mIsEnhancedSisSupported = 0;
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
    -[WRM_QMINasClient stop](self, "stop");
    qmi::Client::release((qmi::Client *)self->mClient);
  }
  v4.receiver = self;
  v4.super_class = (Class)WRM_QMINasClient;
  -[WRM_QMINasClient dealloc](&v4, "dealloc");
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

- (void)registerQmiIndHandler
{
  -[WRM_QMINasClient bindQMIClientToSlotType:](self, "bindQMIClientToSlotType:", self->mSub);
  -[WRM_QMINasClient sendNasIndicationRegister](self, "sendNasIndicationRegister");
  -[WRM_QMINasClient sendNasConfigSigInfo2Request](self, "sendNasConfigSigInfo2Request");
  -[WRM_QMINasClient setHandlerNasSigInfoInd](self, "setHandlerNasSigInfoInd");
  -[WRM_QMINasClient setHandlerNasVoiceLqmInd](self, "setHandlerNasVoiceLqmInd");
  -[WRM_QMINasClient setHandlerSisNrAvailableInfoInd](self, "setHandlerSisNrAvailableInfoInd");
  -[WRM_QMINasClient setHandlerLocationDbInfo](self, "setHandlerLocationDbInfo");
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
  id v3;
  _QWORD block[6];

  v3 = objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "getCTService");
  self->mIsEnhancedSisSupported = objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "isEnhancedSisSupported");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("QMI.NAS.%d: client started.\n"), self->mSub);
  -[WRM_QMINasClient registerQmiIndHandler](self, "registerQmiIndHandler");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("QMI.NAS.%d: client register sig info.\n"), self->mSub);
  self->mQmiClientRunning = 1;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100099D38;
  block[3] = &unk_100201B18;
  block[4] = v3;
  block[5] = self;
  dispatch_async((dispatch_queue_t)objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "getQueue"), block);
}

- (void)stopped
{
  id v3;
  _QWORD block[6];

  v3 = objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "getCTService");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("QMI.NAS.%d: client stopped.\n"), self->mSub);
  self->mQmiClientRunning = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100099E34;
  block[3] = &unk_100201B18;
  block[4] = v3;
  block[5] = self;
  dispatch_async((dispatch_queue_t)objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "getQueue"), block);
}

- (void)errored
{
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("QMI.NAS.%d: client errored/crashed?!.\n"), self->mSub);
}

- (void)sendNasIndicationRegister
{
  const qmi::MutableMessageBase *v3;
  void *v4;
  _QWORD v5[5];
  void *mClient;
  uint64_t v7;
  int v8;
  uint64_t v9;
  void *v10;
  _BYTE v11[32];
  _QWORD aBlock[5];

  qmi::MutableMessageBase::MutableMessageBase((qmi::MutableMessageBase *)v11, 3u);
  *sub_10009DA28((uint64_t)v11, 25) = 1;
  *sub_10009DC78((uint64_t)v11, 224) = 1;
  if (self->mIsEnhancedSisSupported)
    *sub_10009DEC8((uint64_t)v11, 225) = 1;
  *sub_10009E118((uint64_t)v11, 226) = 1;
  mClient = self->mClient;
  v7 = QMIServiceMsg::create((QMIServiceMsg *)v11, v3);
  v8 = 25000;
  v9 = 0;
  v10 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100099FD8;
  v5[3] = &unk_1002027C0;
  v5[4] = self;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 3221225472;
  aBlock[2] = sub_10009E368;
  aBlock[3] = &unk_100202940;
  aBlock[4] = v5;
  v4 = _Block_copy(aBlock);
  v10 = v4;
  if (v7)
  {
    qmi::Client::send(mClient, &mClient);
    v4 = v10;
  }
  if (v4)
    _Block_release(v4);
  qmi::MutableMessageBase::~MutableMessageBase((qmi::MutableMessageBase *)v11);
}

- (void)sendSisNrAvailableRequest
{
  const qmi::MutableMessageBase *v3;
  void *v4;
  _QWORD v5[5];
  void *mClient;
  uint64_t v7;
  int v8;
  uint64_t v9;
  void *v10;
  _BYTE v11[32];
  _QWORD aBlock[5];

  if (self->mClient && self->mIsEnhancedSisSupported)
  {
    qmi::MutableMessageBase::MutableMessageBase((qmi::MutableMessageBase *)v11, 0x5570u);
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("QMI.NAS.%d: nas::SisNrAvailable::Request sent."), self->mSub);
    mClient = self->mClient;
    v7 = QMIServiceMsg::create((QMIServiceMsg *)v11, v3);
    v8 = 25000;
    v9 = 0;
    v10 = 0;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10009A188;
    v5[3] = &unk_1002027C0;
    v5[4] = self;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 3221225472;
    aBlock[2] = sub_10009E4E4;
    aBlock[3] = &unk_100202940;
    aBlock[4] = v5;
    v4 = _Block_copy(aBlock);
    v10 = v4;
    if (v7)
    {
      qmi::Client::send(mClient, &mClient);
      v4 = v10;
    }
    if (v4)
      _Block_release(v4);
    qmi::MutableMessageBase::~MutableMessageBase((qmi::MutableMessageBase *)v11);
  }
}

- (void)sendNasConfigSigInfo2Request
{
  char *v3;
  char *v4;
  char *v5;
  char *v6;
  char *v7;
  char *v8;
  char *v9;
  char *v10;
  char *v11;
  const qmi::MutableMessageBase *v12;
  void *v13;
  _QWORD v14[5];
  void *mClient;
  uint64_t v16;
  int v17;
  uint64_t v18;
  void *v19;
  _BYTE v20[32];
  _QWORD aBlock[5];

  qmi::MutableMessageBase::MutableMessageBase((qmi::MutableMessageBase *)v20, 0x6Cu);
  v3 = sub_10009E660((uint64_t)v20, 34);
  sub_10009A3E0((uint64_t)v3, (char **)v3);
  v4 = sub_10009EA1C((uint64_t)v20, 36);
  sub_10009A564((uint64_t)v4, (char **)v4);
  v5 = sub_10009ED24((uint64_t)v20, 38);
  sub_10009A830((uint64_t)v5, (char **)v5);
  v6 = sub_10009F02C((uint64_t)v20, 40);
  sub_10009AB04((uint64_t)v6, (char **)v6);
  v7 = sub_10009F334((uint64_t)v20, 51);
  sub_10009A564((uint64_t)v7, (char **)v7);
  v8 = sub_10009F63C((uint64_t)v20, 56);
  sub_10009A830((uint64_t)v8, (char **)v8);
  v9 = sub_10009F944((uint64_t)v20, 53);
  sub_10009AB04((uint64_t)v9, (char **)v9);
  v10 = sub_10009FC4C((uint64_t)v20, 30);
  sub_10009A3E0((uint64_t)v10, (char **)v10);
  v11 = sub_10009FF54((uint64_t)v20, 32);
  sub_10009B1C8((uint64_t)v11, (char **)v11);
  *(_WORD *)sub_1000A025C((uint64_t)v20, 42) = 769;
  *(_WORD *)sub_1000A04B4((uint64_t)v20, 55) = 769;
  mClient = self->mClient;
  v16 = QMIServiceMsg::create((QMIServiceMsg *)v20, v12);
  v17 = 25000;
  v18 = 0;
  v19 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10009B5EC;
  v14[3] = &unk_1002027C0;
  v14[4] = self;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1000A070C;
  aBlock[3] = &unk_100202940;
  aBlock[4] = v14;
  v13 = _Block_copy(aBlock);
  v19 = v13;
  if (v16)
  {
    qmi::Client::send(mClient, &mClient);
    v13 = v19;
  }
  if (v13)
    _Block_release(v13);
  qmi::MutableMessageBase::~MutableMessageBase((qmi::MutableMessageBase *)v20);
}

- (void)setHandlerNasSigInfoInd
{
  id v3;
  void *mClient;
  xpc_object_t v5;
  xpc_object_t v6;
  _QWORD v7[6];
  xpc_object_t values[2];
  char *keys[2];
  void (*v10)(uint64_t, uint64_t);
  void *v11;
  _QWORD *v12;

  v3 = +[WRM_EnhancedCTService wrm_EnhancedCTServiceSingleton](WRM_EnhancedCTService, "wrm_EnhancedCTServiceSingleton");
  mClient = self->mClient;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10009B7C8;
  v7[3] = &unk_100203F60;
  v7[4] = v3;
  v7[5] = self;
  keys[0] = (char *)_NSConcreteStackBlock;
  keys[1] = (char *)3221225472;
  v10 = sub_1000A0C30;
  v11 = &unk_100202940;
  v12 = v7;
  qmi::Client::setIndHandler(mClient, 81, keys);
  if (self->mSub == 1)
  {
    v5 = xpc_dictionary_create(0, 0, 0);
    *(_OWORD *)keys = *(_OWORD *)off_100203F80;
    values[0] = xpc_uint64_create(0x198uLL);
    values[1] = v5;
    v6 = xpc_dictionary_create((const char *const *)keys, values, 2uLL);
    objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "updateControllerState:", v6);
    xpc_release(values[0]);
    xpc_release(v6);
    xpc_release(v5);
  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("QMI.NAS.%d: Non primary sub, skip update WRMCoreTelephonyRawLinkQuality"), self->mSub);
  }
}

- (void)setHandlerSisNrAvailableInfoInd
{
  void *mClient;
  _QWORD v4[5];
  _QWORD v5[5];

  mClient = self->mClient;
  if (mClient)
  {
    if (self->mIsEnhancedSisSupported)
    {
      v4[0] = _NSConcreteStackBlock;
      v4[1] = 3221225472;
      v4[2] = sub_10009BDA4;
      v4[3] = &unk_1002027C0;
      v4[4] = self;
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_1000A0E94;
      v5[3] = &unk_100202940;
      v5[4] = v4;
      qmi::Client::setIndHandler(mClient, 21872, v5);
    }
  }
}

- (void)setHandlerNasVoiceLqmInd
{
  void *mClient;
  _QWORD v3[5];

  if (self->mSub == 1)
  {
    mClient = self->mClient;
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_1000A10F8;
    v3[3] = &unk_100202940;
    v3[4] = &stru_100203FB8;
    qmi::Client::setIndHandler(mClient, 21873, v3);
  }
}

- (void)bindQMIClientToSlotType:(int64_t)a3
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

  qmi::MutableMessageBase::MutableMessageBase((qmi::MutableMessageBase *)v13, 0x45u);
  *sub_1000A1274((uint64_t)v13, 1) = a3 != 1;
  mClient = self->mClient;
  v9 = QMIServiceMsg::create((QMIServiceMsg *)v13, v5);
  v10 = 25000;
  v11 = 0;
  v12 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10009C240;
  v7[3] = &unk_1002027C0;
  v7[4] = self;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1000A14C4;
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

- (void)querySignalSinr
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

  qmi::MutableMessageBase::MutableMessageBase((qmi::MutableMessageBase *)v10, 2u);
  *sub_1000A1640((uint64_t)v10, 19) = 0;
  *sub_1000A1898((uint64_t)v10, 20) = 0;
  *sub_1000A1AF0((uint64_t)v10, 21) = 0;
  *sub_1000A1D48((uint64_t)v10, 24) = 0;
  *sub_1000A1FA0((uint64_t)v10, 27) = 0;
  *sub_1000A21FC((uint64_t)v10, 28) = 0;
  mClient = self->mClient;
  v6 = QMIServiceMsg::create((QMIServiceMsg *)v10, v3);
  v7 = 25000;
  v8 = 0;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1000A2454;
  aBlock[3] = &unk_100202940;
  aBlock[4] = &stru_100204000;
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

- (void)notifyBBCallState:(unsigned __int8)a3 :(unsigned __int8)a4 :(unsigned __int8)a5 :(unsigned __int8)a6
{
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  char *v11;
  const qmi::MutableMessageBase *v12;
  void *v13;
  _QWORD v14[5];
  void *mClient;
  uint64_t v16;
  int v17;
  uint64_t v18;
  void *v19;
  _BYTE v20[32];
  _QWORD aBlock[5];

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v9 = a3;
  qmi::MutableMessageBase::MutableMessageBase((qmi::MutableMessageBase *)v20, 0x5568u);
  v11 = sub_1000A25D0((uint64_t)v20, 16);
  *v11 = v9;
  v11[1] = v8;
  v11[2] = v7;
  v11[3] = v6;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("QMI.NAS.%d: VoIP app: %d, Call State: %d, CallType: %d, telephonyCall: %d "), self->mSub, v9, v8, v7, v6);
  mClient = self->mClient;
  v16 = QMIServiceMsg::create((QMIServiceMsg *)v20, v12);
  v17 = 25000;
  v18 = 0;
  v19 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10009C5D0;
  v14[3] = &unk_1002027C0;
  v14[4] = self;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 3221225472;
  aBlock[2] = sub_100018764;
  aBlock[3] = &unk_100202940;
  aBlock[4] = v14;
  v13 = _Block_copy(aBlock);
  v19 = v13;
  if (v16)
  {
    qmi::Client::send(mClient, &mClient);
    v13 = v19;
  }
  if (v13)
    _Block_release(v13);
  qmi::MutableMessageBase::~MutableMessageBase((qmi::MutableMessageBase *)v20);
}

- (void)notifyBBLockState:(unsigned __int8)a3 :(unsigned __int8)a4
{
  unsigned int v4;
  unsigned int v5;
  char *v7;
  const qmi::MutableMessageBase *v8;
  void *v9;
  _QWORD v10[5];
  void *mClient;
  uint64_t v12;
  int v13;
  uint64_t v14;
  void *v15;
  _BYTE v16[32];
  _QWORD aBlock[5];

  v4 = a4;
  v5 = a3;
  qmi::MutableMessageBase::MutableMessageBase((qmi::MutableMessageBase *)v16, 0x5568u);
  v7 = sub_1000A2868((uint64_t)v16, 17);
  *v7 = v5;
  v7[1] = v4;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("QMI.NAS.%d: Screen unlock status %d, Screen Status: %d "), self->mSub, v5, v4);
  mClient = self->mClient;
  v12 = QMIServiceMsg::create((QMIServiceMsg *)v16, v8);
  v13 = 25000;
  v14 = 0;
  v15 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10009C7B4;
  v10[3] = &unk_1002027C0;
  v10[4] = self;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 3221225472;
  aBlock[2] = sub_100018764;
  aBlock[3] = &unk_100202940;
  aBlock[4] = v10;
  v9 = _Block_copy(aBlock);
  v15 = v9;
  if (v12)
  {
    qmi::Client::send(mClient, &mClient);
    v9 = v15;
  }
  if (v9)
    _Block_release(v9);
  qmi::MutableMessageBase::~MutableMessageBase((qmi::MutableMessageBase *)v16);
}

- (void)notifyFTDupelicationState:(unsigned __int8)a3
{
  unsigned int v3;
  uint64_t v5;
  const qmi::MutableMessageBase *v6;
  void *v7;
  _QWORD v8[5];
  void *mClient;
  uint64_t v10;
  int v11;
  uint64_t v12;
  void *v13;
  _BYTE v14[32];
  _QWORD aBlock[5];

  v3 = a3;
  v5 = qmi::MutableMessageBase::MutableMessageBase((qmi::MutableMessageBase *)v14, 0x5568u);
  *sub_1000A2B14(v5, 19) = v3;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("QMI.NAS.%d: notifyFTDupelicationState state: %d "), self->mSub, v3);
  mClient = self->mClient;
  v10 = QMIServiceMsg::create((QMIServiceMsg *)v14, v6);
  v11 = 25000;
  v12 = 0;
  v13 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10009C97C;
  v8[3] = &unk_1002027C0;
  v8[4] = self;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 3221225472;
  aBlock[2] = sub_100018764;
  aBlock[3] = &unk_100202940;
  aBlock[4] = v8;
  v7 = _Block_copy(aBlock);
  v13 = v7;
  if (v10)
  {
    qmi::Client::send(mClient, &mClient);
    v7 = v13;
  }
  if (v7)
    _Block_release(v7);
  qmi::MutableMessageBase::~MutableMessageBase((qmi::MutableMessageBase *)v14);
}

- (void)setBBSAState:(BOOL)a3 :(unsigned __int8)a4
{
  unsigned int v4;
  _BOOL4 v5;
  const qmi::MutableMessageBase *v7;
  void *v8;
  _QWORD v9[5];
  void *mClient;
  uint64_t v11;
  int v12;
  uint64_t v13;
  void *v14;
  _BYTE v15[32];
  _QWORD aBlock[5];

  v4 = a4;
  v5 = a3;
  qmi::MutableMessageBase::MutableMessageBase((qmi::MutableMessageBase *)v15, 0x556Au);
  if (objc_msgSend(+[WRM_HandoverManager WRM_HandoverManagerSingleton](WRM_HandoverManager, "WRM_HandoverManagerSingleton"), "isSaAllowedOnWiFiAssociation:", self->mSub))
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("QMI.NAS.%d: setBBSAState SaAllowedOnWiFiAssociation"), self->mSub);
  }
  else
  {
    *sub_1000A2DB0((uint64_t)v15, 16) = v5;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("QMI.NAS.%d: setBBSAState disabled : %d "), self->mSub, v5);
    *sub_1000A3000((uint64_t)v15, 18) = v4;
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("QMI.NAS.%d: setBBSAState slot mask: %d"), self->mSub, v4);
    mClient = self->mClient;
    v11 = QMIServiceMsg::create((QMIServiceMsg *)v15, v7);
    v12 = 25000;
    v13 = 0;
    v14 = 0;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10009CBC0;
    v9[3] = &unk_1002027C0;
    v9[4] = self;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 3221225472;
    aBlock[2] = sub_1000A3250;
    aBlock[3] = &unk_100202940;
    aBlock[4] = v9;
    v8 = _Block_copy(aBlock);
    v14 = v8;
    if (v11)
    {
      qmi::Client::send(mClient, &mClient);
      v8 = v14;
    }
    if (v8)
      _Block_release(v8);
  }
  qmi::MutableMessageBase::~MutableMessageBase((qmi::MutableMessageBase *)v15);
}

- (void)setHandlerLocationDbInfo
{
  void *mClient;
  void *v4;
  const qmi::MutableMessageBase *v5;
  void *v6;
  _QWORD v7[5];
  void *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  void *v12;
  _BYTE v13[32];
  _QWORD v14[5];
  _QWORD v15[5];
  void **aBlock;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  void *v19;
  _QWORD *v20;

  mClient = self->mClient;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10009CE0C;
  v15[3] = &unk_1002027C0;
  v15[4] = self;
  aBlock = _NSConcreteStackBlock;
  v17 = 3221225472;
  v18 = sub_1000A34B4;
  v19 = &unk_100202940;
  v20 = v15;
  qmi::Client::setIndHandler(mClient, 21868, &aBlock);
  v4 = self->mClient;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10009CED4;
  v14[3] = &unk_1002027C0;
  v14[4] = self;
  aBlock = _NSConcreteStackBlock;
  v17 = 3221225472;
  v18 = sub_1000A3800;
  v19 = &unk_100202940;
  v20 = v14;
  qmi::Client::setIndHandler(v4, 21869, &aBlock);
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 22, CFSTR("QMI.NAS.%d: send nas::WrmSdmLocationDbInfoRegister::Request"), self->mSub);
  qmi::MutableMessageBase::MutableMessageBase((qmi::MutableMessageBase *)v13, 0x556Cu);
  v8 = self->mClient;
  v9 = QMIServiceMsg::create((QMIServiceMsg *)v13, v5);
  v10 = 25000;
  v11 = 0;
  v12 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10009D0D0;
  v7[3] = &unk_1002027C0;
  v7[4] = self;
  aBlock = _NSConcreteStackBlock;
  v17 = 3221225472;
  v18 = sub_1000A3A64;
  v19 = &unk_100202940;
  v20 = v7;
  v6 = _Block_copy(&aBlock);
  v12 = v6;
  if (v9)
  {
    qmi::Client::send(v8, &v8);
    v6 = v12;
  }
  if (v6)
    _Block_release(v6);
  qmi::MutableMessageBase::~MutableMessageBase((qmi::MutableMessageBase *)v13);
}

- (void)setWrmSdmLocationDbPushOneEntryForCellType:(int64_t)a3 cellType:(int)a4 anchorCellBandwidth:(unsigned int)a5 mmWavePresent:(BOOL)a6 downlinkThroughput:(unsigned int)a7 sampleCount:(unsigned int)a8 deploymentCount:(unsigned int)a9
{
  NSObject *mQueue;
  _QWORD v10[5];
  int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  BOOL v16;

  mQueue = self->mQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10009D254;
  v10[3] = &unk_1002026E8;
  v10[4] = self;
  v11 = a4;
  v12 = a5;
  v16 = a6;
  v13 = a7;
  v14 = a8;
  v15 = a9;
  dispatch_async(mQueue, v10);
}

- (void)sendWrmSdmLocationDbInfo:(int64_t)a3 dbAvailable:(BOOL)a4 mcc:(unsigned int)a5 mnc:(unsigned int)a6 cellId:(unint64_t)a7
{
  NSObject *mQueue;
  _QWORD v8[6];
  unsigned int v9;
  unsigned int v10;
  BOOL v11;

  mQueue = self->mQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10009D588;
  v8[3] = &unk_1002040C8;
  v11 = a4;
  v9 = a5;
  v10 = a6;
  v8[4] = self;
  v8[5] = a7;
  dispatch_async(mQueue, v8);
}

- (void).cxx_destruct
{
  WRM_LocationDbCellEntry *begin;
  WRM_LocationDbCellEntry *v4;
  WRM_LocationDbCellEntry *v5;
  WRM_LocationDbCellEntry *v6;

  begin = self->mLocationDbInfo.sadcCellInfoList.__begin_;
  if (begin)
  {
    self->mLocationDbInfo.sadcCellInfoList.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->mLocationDbInfo.saCellInfoList.__begin_;
  if (v4)
  {
    self->mLocationDbInfo.saCellInfoList.__end_ = v4;
    operator delete(v4);
  }
  v5 = self->mLocationDbInfo.lteNsaCellInfoList.__begin_;
  if (v5)
  {
    self->mLocationDbInfo.lteNsaCellInfoList.__end_ = v5;
    operator delete(v5);
  }
  v6 = self->mLocationDbInfo.lteCellInfoList.__begin_;
  if (v6)
  {
    self->mLocationDbInfo.lteCellInfoList.__end_ = v6;
    operator delete(v6);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 152) = 0u;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 120) = 0u;
  *(_OWORD *)((char *)self + 104) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  return self;
}

@end
