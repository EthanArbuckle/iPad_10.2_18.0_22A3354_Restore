@implementation CLClientManagerAdapter

- (void)setClients:(id)a3 significantLocationChangeTo:(BOOL)a4
{
  _BOOL4 v4;
  __int128 *v6;
  id v7;
  void *v8;
  double Current;
  void *__dst[2];
  char v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  void *v20;
  char v21;
  void *__p;
  char v23;

  v4 = a4;
  v6 = (__int128 *)sub_100006B68(a3, (uint64_t)a2);
  if (v6)
  {
    sub_1001AF190((char *)__dst, v6);
    v7 = +[CLClientKeyPath clientKeyPathFromName:](CLClientKeyPath, "clientKeyPathFromName:", __dst);
    if (v23 < 0)
      operator delete(__p);
    if (v21 < 0)
      operator delete(v20);
    if (v19 < 0)
      operator delete(v18);
    if (v17 < 0)
      operator delete(v16);
    if (v15 < 0)
      operator delete(v14);
    if (v13 < 0)
      operator delete(v12);
    if (v11 < 0)
      operator delete(__dst[0]);
    v8 = -[CLClientManagerAdapter adaptee](self, "adaptee");
    Current = CFAbsoluteTimeGetCurrent();
    sub_100194D94((uint64_t)v8, (uint64_t)v7, 3, v4, 0, 0, Current);
  }
}

- (void)fetchLocationClientKeysWithReply:(id)a3
{
  NSMutableSet *v4;

  v4 = sub_1002407E4((uint64_t)-[CLClientManagerAdapter adaptee](self, "adaptee"));
  (*((void (**)(id, NSMutableSet *))a3 + 2))(a3, v4);
}

- (void)dingAllActiveTranscriptSubscriptions
{
  uint64_t *v2;
  __n128 v3;

  v2 = -[CLClientManagerAdapter adaptee](self, "adaptee");
  sub_100091DB0(v2[127], v3);
}

- (int)syncgetRegistrationResultToAuthorizationStatus:(int)a3
{
  int v4;

  v4 = a3;
  return sub_1001A0310((uint64_t)-[CLClientManagerAdapter adaptee](self, "adaptee"), &v4);
}

- (void)handleProvisionalIntermediationForService:(unint64_t)a3 forClientKey:(id)a4 at:(id)a5 withReply:(id)a6
{
  id v7;
  id v11;
  CLClientKeyPath *v17;
  void *v18;
  _OWORD v19[10];
  int v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  int v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  unint64_t v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;

  v7 = a5;
  if (!a5)
  {
    v11 = objc_alloc((Class)CLLocation);
    v21 = 0;
    v22 = 0;
    v23 = xmmword_101BAFC90;
    __asm { FMOV            V0.2D, #-1.0 }
    v24 = _Q0;
    v25 = _Q0;
    v26 = _Q0;
    v20 = 0xFFFF;
    v27 = 0;
    v28 = 0xBFF0000000000000;
    v29 = 0;
    v30 = 0;
    v32 = 0xBFF0000000000000;
    v31 = 0;
    v33 = 0x7FFFFFFF;
    v35 = 0;
    v36 = 0;
    v34 = 0;
    v37 = 0;
    v7 = objc_msgSend(v11, "initWithClientLocation:", &v20);
  }
  v17 = +[CLClientKeyPath clientKeyPathWithLegacyClientKey:](CLClientKeyPath, "clientKeyPathWithLegacyClientKey:", a4);
  v18 = -[CLClientManagerAdapter adaptee](self, "adaptee");
  if (v7)
    objc_msgSend(v7, "clientLocation");
  else
    memset(v19, 0, 156);
  sub_100066E70((uint64_t)v18, a3, (uint64_t)v17, v19, (void (**)(_QWORD, _QWORD))a6);
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
  objc_msgSend(a3, "sync:", a4);
}

- (void)markReceivingLocationInformation:(id)a3
{
  id v4;
  void *v5[2];
  char v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  void *v15;
  char v16;
  void *__p;
  char v18;

  (*((void (**)(void **__return_ptr, id, SEL))a3 + 2))(v5, a3, a2);
  v4 = +[CLClientKeyPath clientKeyPathFromName:](CLClientKeyPath, "clientKeyPathFromName:", v5);
  if (v18 < 0)
    operator delete(__p);
  if (v16 < 0)
    operator delete(v15);
  if (v14 < 0)
    operator delete(v13);
  if (v12 < 0)
    operator delete(v11);
  if (v10 < 0)
    operator delete(v9);
  if (v8 < 0)
    operator delete(v7);
  if (v6 < 0)
    operator delete(v5[0]);
  sub_10019808C((uint64_t)-[CLClientManagerAdapter adaptee](self, "adaptee"), (uint64_t)v4, 1, 0);
}

- (int)syncgetClientEffectiveRegistrationResultWithTransientAwareness:(id)a3
{
  id v4;
  void *v6[2];
  char v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  void *v16;
  char v17;
  void *__p;
  char v19;

  (*((void (**)(void **__return_ptr, id, SEL))a3 + 2))(v6, a3, a2);
  v4 = +[CLClientKeyPath clientKeyPathFromName:](CLClientKeyPath, "clientKeyPathFromName:", v6);
  if (v19 < 0)
    operator delete(__p);
  if (v17 < 0)
    operator delete(v16);
  if (v15 < 0)
    operator delete(v14);
  if (v13 < 0)
    operator delete(v12);
  if (v11 < 0)
    operator delete(v10);
  if (v9 < 0)
    operator delete(v8);
  if (v7 < 0)
    operator delete(v6[0]);
  return sub_10008545C((uint64_t)-[CLClientManagerAdapter adaptee](self, "adaptee"), (uint64_t)v4);
}

- (id)syncgetNonSystemLocationClientKeys
{
  return sub_10006C42C((uint64_t)-[CLClientManagerAdapter adaptee](self, "adaptee"));
}

- (void)adaptee
{
  void *result;

  result = -[CLNotifierServiceAdapter notifier](self, "notifier");
  if (result)
  return result;
}

- (void)wakeUpLaunchdManagedClient:(id)a3
{
  CLNotifierBase *v4;
  void *__p[2];
  char v6;

  sub_1015A2E04(__p, (char *)objc_msgSend(a3, "UTF8String"));
  v4 = -[CLNotifierServiceAdapter notifier](self, "notifier");
  if (v4)
  sub_10002B1F4((uint64_t)v4, (uint64_t *)__p);
  if (v6 < 0)
    operator delete(__p[0]);
}

- (BOOL)syncgetHasAuthorizedClients
{
  return sub_1002408AC((uint64_t)-[CLClientManagerAdapter adaptee](self, "adaptee"));
}

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5;

  v5 = a4 + 1;
  if (a4 + 1 < (unint64_t)objc_msgSend(a3, "count"))
    objc_msgSend(objc_msgSend(a3, "objectAtIndexedSubscript:", v5), "becameFatallyBlocked:index:", a3, v5);
}

+ (id)getSilo
{
  if (qword_102304AB0 != -1)
    dispatch_once(&qword_102304AB0, &stru_102154070);
  return (id)qword_102304AA8;
}

- (CLClientManagerAdapter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLClientManagerAdapter;
  return -[CLClientManagerAdapter initWithInboundProtocol:outboundProtocol:](&v3, "initWithInboundProtocol:outboundProtocol:", &OBJC_PROTOCOL___CLClientManagerProtocol, &OBJC_PROTOCOL___CLClientManagerClientProtocol);
}

- (void)beginService
{
  CLClientManagerAdapter *v3;
  SEL v4;

  -[CLNotifierServiceAdapter setAdaptedNotifier:](self, "setAdaptedNotifier:", sub_1007B7988((uint64_t)-[CLClientManagerAdapter universe](self, "universe")));
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
  {
    v3 = (CLClientManagerAdapter *)sub_101909AF4();
    -[CLClientManagerAdapter endService](v3, v4);
  }
}

- (void)endService
{
  CLNotifierBase *v2;

  v2 = -[CLNotifierServiceAdapter notifier](self, "notifier");
  (*((void (**)(CLNotifierBase *))v2->var0 + 2))(v2);
}

- (void)doAsync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLClientManagerAdapter adaptee](self, "adaptee"));
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLClientManagerAdapter adaptee](self, "adaptee"));
  (*((void (**)(id))a4 + 2))(a4);
}

- (BOOL)syncgetDoSync:(id)a3
{
  (*((void (**)(id, void *))a3 + 2))(a3, -[CLClientManagerAdapter adaptee](self, "adaptee"));
  return 0;
}

- (void)setProvisionalAuthorization:(id)a3
{
  __int128 *v4;
  id v5;
  void *v6;
  id v7;
  void *__dst[2];
  char v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  void *__p;
  char v21;

  v4 = (__int128 *)sub_100006B68(a3, (uint64_t)a2);
  if (v4)
  {
    sub_1001AF190((char *)__dst, v4);
    v5 = +[CLClientKeyPath clientKeyPathFromName:](CLClientKeyPath, "clientKeyPathFromName:", __dst);
    if (v21 < 0)
      operator delete(__p);
    if (v19 < 0)
      operator delete(v18);
    if (v17 < 0)
      operator delete(v16);
    if (v15 < 0)
      operator delete(v14);
    if (v13 < 0)
      operator delete(v12);
    if (v11 < 0)
      operator delete(v10);
    if (v9 < 0)
      operator delete(__dst[0]);
    v6 = -[CLClientManagerAdapter adaptee](self, "adaptee");
    v7 = sub_100195B0C((uint64_t)v6, (uint64_t)v5);
    sub_1007F1470((uint64_t)v6, (uint64_t)v7, 0, 0);
  }
}

- (void)setClients:(id)a3 regionOfType:(int)a4 to:(BOOL)a5
{
  _BOOL4 v5;
  __int128 *v8;
  id v9;
  void *__dst[2];
  char v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  void *v20;
  char v21;
  void *__p;
  char v23;

  v5 = a5;
  v8 = (__int128 *)sub_100006B68(a3, (uint64_t)a2);
  if (v8)
  {
    sub_1001AF190((char *)__dst, v8);
    v9 = +[CLClientKeyPath clientKeyPathFromName:](CLClientKeyPath, "clientKeyPathFromName:", __dst);
    if (v23 < 0)
      operator delete(__p);
    if (v21 < 0)
      operator delete(v20);
    if (v19 < 0)
      operator delete(v18);
    if (v17 < 0)
      operator delete(v16);
    if (v15 < 0)
      operator delete(v14);
    if (v13 < 0)
      operator delete(v12);
    if (v11 < 0)
      operator delete(__dst[0]);
    sub_1007BFFF4((uint64_t)-[CLClientManagerAdapter adaptee](self, "adaptee"), (uint64_t)v9, a4, v5);
  }
}

- (void)setClients:(id)a3 transcriptSessionChangeTo:(BOOL)a4
{
  _BOOL4 v4;
  __int128 *v6;
  id v7;
  void *v8;
  double Current;
  void *__dst[2];
  char v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  void *v20;
  char v21;
  void *__p;
  char v23;

  v4 = a4;
  v6 = (__int128 *)sub_100006B68(a3, (uint64_t)a2);
  if (v6)
  {
    sub_1001AF190((char *)__dst, v6);
    v7 = +[CLClientKeyPath clientKeyPathFromName:](CLClientKeyPath, "clientKeyPathFromName:", __dst);
    if (v23 < 0)
      operator delete(__p);
    if (v21 < 0)
      operator delete(v20);
    if (v19 < 0)
      operator delete(v18);
    if (v17 < 0)
      operator delete(v16);
    if (v15 < 0)
      operator delete(v14);
    if (v13 < 0)
      operator delete(v12);
    if (v11 < 0)
      operator delete(__dst[0]);
    v8 = -[CLClientManagerAdapter adaptee](self, "adaptee");
    Current = CFAbsoluteTimeGetCurrent();
    sub_100194D94((uint64_t)v8, (uint64_t)v7, 16, v4, 0, 0, Current);
  }
}

- (void)setClients:(id)a3 significantLocationVisitTo:(BOOL)a4
{
  _BOOL4 v4;
  __int128 *v6;
  id v7;
  void *v8;
  double Current;
  void *__dst[2];
  char v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  void *v20;
  char v21;
  void *__p;
  char v23;

  v4 = a4;
  v6 = (__int128 *)sub_100006B68(a3, (uint64_t)a2);
  if (v6)
  {
    sub_1001AF190((char *)__dst, v6);
    v7 = +[CLClientKeyPath clientKeyPathFromName:](CLClientKeyPath, "clientKeyPathFromName:", __dst);
    if (v23 < 0)
      operator delete(__p);
    if (v21 < 0)
      operator delete(v20);
    if (v19 < 0)
      operator delete(v18);
    if (v17 < 0)
      operator delete(v16);
    if (v15 < 0)
      operator delete(v14);
    if (v13 < 0)
      operator delete(v12);
    if (v11 < 0)
      operator delete(__dst[0]);
    v8 = -[CLClientManagerAdapter adaptee](self, "adaptee");
    Current = CFAbsoluteTimeGetCurrent();
    sub_100194D94((uint64_t)v8, (uint64_t)v7, 6, v4, 0, 0, Current);
  }
}

- (void)setClients:(id)a3 locationPushTo:(BOOL)a4
{
  _BOOL4 v4;
  __int128 *v6;
  id v7;
  void *v8;
  double Current;
  void *__dst[2];
  char v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  void *v20;
  char v21;
  void *__p;
  char v23;

  v4 = a4;
  v6 = (__int128 *)sub_100006B68(a3, (uint64_t)a2);
  if (v6)
  {
    sub_1001AF190((char *)__dst, v6);
    v7 = +[CLClientKeyPath clientKeyPathFromName:](CLClientKeyPath, "clientKeyPathFromName:", __dst);
    if (v23 < 0)
      operator delete(__p);
    if (v21 < 0)
      operator delete(v20);
    if (v19 < 0)
      operator delete(v18);
    if (v17 < 0)
      operator delete(v16);
    if (v15 < 0)
      operator delete(v14);
    if (v13 < 0)
      operator delete(v12);
    if (v11 < 0)
      operator delete(__dst[0]);
    v8 = -[CLClientManagerAdapter adaptee](self, "adaptee");
    Current = CFAbsoluteTimeGetCurrent();
    sub_100194D94((uint64_t)v8, (uint64_t)v7, 15, v4, 0, 0, Current);
  }
}

- (void)considerPromptingForTranscriptSession:(id)a3 dictionary:(id)a4 requestType:(int)a5 withReply:(id)a6
{
  sub_1007BD7E0((uint64_t)-[CLClientManagerAdapter adaptee](self, "adaptee"), (uint64_t)+[CLClientKeyPath clientKeyPathWithLegacyClientKey:](CLClientKeyPath, "clientKeyPathWithLegacyClientKey:", a3), (uint64_t)a4, a5, (uint64_t)a6);
}

- (void)updatePillButtonChoiceForOutstandingPrompt:(int)a3
{
  *((_DWORD *)-[CLClientManagerAdapter adaptee](self, "adaptee") + 78) = a3;
}

- (void)updatePromptedLatitude:(double)a3 longitude:(double)a4
{
  CLLocationCoordinate2D *v6;

  v6 = -[CLClientManagerAdapter adaptee](self, "adaptee");
  v6[20] = CLLocationCoordinate2DMake(a3, a4);
}

- (void)markClientTemporaryAuthorizationGranted:(BOOL)a3 forClientKey:(id)a4 andAuditToken:(id *)a5 byLocationButton:(BOOL)a6 voiceInteractionEnabled:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  CLClientKeyPath *v11;
  void *v12;
  uint64_t v13;

  v7 = a7;
  v8 = a6;
  v9 = a3;
  v11 = +[CLClientKeyPath clientKeyPathWithLegacyClientKey:](CLClientKeyPath, "clientKeyPathWithLegacyClientKey:", a4);
  v12 = -[CLClientManagerAdapter adaptee](self, "adaptee");
  sub_1007C4CE8((uint64_t)v12, (uint64_t)v11, v13, v9, v8, v7);
}

- (void)markTemporaryPreciseAuthorizationGranted:(BOOL)a3 forClientKey:(id)a4
{
  sub_1007C5140((uint64_t)-[CLClientManagerAdapter adaptee](self, "adaptee"), +[CLClientKeyPath clientKeyPathWithLegacyClientKey:](CLClientKeyPath, "clientKeyPathWithLegacyClientKey:", a4), a3);
}

- (void)tearDownLocationAuthPrompt:(id)a3
{
  sub_1007EABB4((uint64_t)-[CLClientManagerAdapter adaptee](self, "adaptee"), 2, +[CLClientKeyPath clientKeyPathWithLegacyClientKey:](CLClientKeyPath, "clientKeyPathWithLegacyClientKey:", a3));
}

- (void)markClientEmergencyEnablementTransition:(BOOL)a3
{
  sub_1007C52D8((uint64_t)-[CLClientManagerAdapter adaptee](self, "adaptee"), a3, 0, 0);
}

- (void)markClientEmergencyEnablementTransition:(BOOL)a3 shouldOverrideDeauthorization:(BOOL)a4 forBeneficiary:(id)a5
{
  _BOOL4 v6;
  unsigned int v7;
  CLClientKeyPath *v9;

  v6 = a4;
  v7 = a3;
  if ((objc_msgSend(a5, "isEqualToString:", CFSTR("*nobody*")) & 1) != 0)
    v9 = 0;
  else
    v9 = +[CLClientKeyPath clientKeyPathWithLegacyClientKey:](CLClientKeyPath, "clientKeyPathWithLegacyClientKey:", a5);
  sub_1007C52D8((uint64_t)-[CLClientManagerAdapter adaptee](self, "adaptee"), v7, v6, (uint64_t)v9);
}

- (void)takeInUseAssertionForClientKey:(id)a3 reason:(id)a4 assertionLevel:(int)a5 withReply:(id)a6
{
  id v9;
  void *v10;
  std::string __p;
  std::string v12[3];

  v9 = sub_100195B0C((uint64_t)-[CLClientManagerAdapter adaptee](self, "adaptee"), (uint64_t)+[CLClientKeyPath clientKeyPathWithLegacyClientKey:](CLClientKeyPath, "clientKeyPathWithLegacyClientKey:", a3));
  v10 = -[CLClientManagerAdapter adaptee](self, "adaptee");
  sub_1015A2E04(&__p, (char *)objc_msgSend(a4, "UTF8String"));
  sub_1007C0D0C((uint64_t)v10, (uint64_t)v9, &__p, a5, v12);
  sub_1007E0A44();
}

- (void)inUseAssertionInvalidatedDueToWatchConnectivityForClientKey:(id)a3
{
  sub_1007C1AC8((uint64_t)-[CLClientManagerAdapter adaptee](self, "adaptee"), (uint64_t)+[CLClientKeyPath clientKeyPathWithClientKey:](CLClientKeyPath, "clientKeyPathWithClientKey:", a3));
}

- (void)reduceAccuracy:(id)a3 withReply:(id)a4
{
  void *v6;
  __int128 v7[10];

  v6 = -[CLClientManagerAdapter adaptee](self, "adaptee");
  if (a3)
    objc_msgSend(a3, "clientLocation");
  else
    memset(v7, 0, 156);
  sub_1007C8B2C((uint64_t)v6, v7, (uint64_t)a4);
}

- (void)onCapabilityChange
{
  _QWORD *v2;
  void *v3;
  _QWORD v4[5];

  v2 = -[CLClientManagerAdapter adaptee](self, "adaptee");
  v3 = (void *)v2[17];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1007F20E4;
  v4[3] = &unk_102153AE8;
  v4[4] = v2;
  objc_msgSend(v3, "iterateAllAnchorKeyPathsWithBlock:", v4);
}

- (void)appLaunchedByAppLifecycleManager:(id)a3
{
  sub_1007E0C40((uint64_t)-[CLClientManagerAdapter adaptee](self, "adaptee"), (uint64_t)+[CLClientKeyPath clientKeyPathWithLegacyClientKey:](CLClientKeyPath, "clientKeyPathWithLegacyClientKey:", a3));
}

- (void)performMigrationWithReply:(id)a3
{
  sub_1007E1074((uint64_t)-[CLClientManagerAdapter adaptee](self, "adaptee"));
  if (a3)
    (*((void (**)(id))a3 + 2))(a3);
}

- (void)resetNotificationConsumedForIdentifier:(id)a3
{
  sub_1007E1314((uint64_t)-[CLClientManagerAdapter adaptee](self, "adaptee"), a3);
}

- (void)setClientBackgroundIndicator:(id)a3 enabled:(BOOL)a4 entity:(id)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10[2];
  char v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  void *v20;
  char v21;
  void *__p;
  char v23;

  v6 = a4;
  (*((void (**)(void **__return_ptr, id, SEL))a3 + 2))(v10, a3, a2);
  v8 = +[CLClientKeyPath clientKeyPathFromName:](CLClientKeyPath, "clientKeyPathFromName:", v10);
  if (v23 < 0)
    operator delete(__p);
  if (v21 < 0)
    operator delete(v20);
  if (v19 < 0)
    operator delete(v18);
  if (v17 < 0)
    operator delete(v16);
  if (v15 < 0)
    operator delete(v14);
  if (v13 < 0)
    operator delete(v12);
  if (v11 < 0)
    operator delete(v10[0]);
  v9 = -[CLClientManagerAdapter adaptee](self, "adaptee");
  objc_msgSend(a5, "UTF8String");
  sub_1007E18D4((uint64_t)v9, (uint64_t)v8, v6);
}

- (void)setClientAuthorization:(id)a3 zoneIdentifier:(id)a4 subIdentityIdentifier:(id)a5 status:(int)a6 correctiveCompensation:(int)a7 mayIncreaseAuth:(BOOL)a8 entity:(id)a9
{
  _BOOL4 v9;
  uint64_t v10;
  id v15;
  unsigned int v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21[2];
  char v22;
  void *v23;
  char v24;
  void *v25;
  char v26;
  void *v27;
  char v28;
  void *v29;
  char v30;
  void *v31;
  char v32;
  void *__p;
  char v34;

  v9 = a8;
  v10 = *(_QWORD *)&a7;
  (*((void (**)(void **__return_ptr, id, SEL))a3 + 2))(v21, a3, a2);
  v15 = +[CLClientKeyPath clientKeyPathFromName:](CLClientKeyPath, "clientKeyPathFromName:", v21);
  if (v34 < 0)
    operator delete(__p);
  if (v32 < 0)
    operator delete(v31);
  if (v30 < 0)
    operator delete(v29);
  if (v28 < 0)
    operator delete(v27);
  if (v26 < 0)
    operator delete(v25);
  if (v24 < 0)
    operator delete(v23);
  if (v22 < 0)
    operator delete(v21[0]);
  if ((unint64_t)a4 | (unint64_t)a5)
  {
    if (a4)
      v16 = 122;
    else
      v16 = 0;
    if (a5)
      v17 = a5;
    else
      v17 = a4;
    if (a5)
      v18 = 119;
    else
      v18 = v16;
    v15 = objc_msgSend(v15, "clientKeyPathWithReplacementSubIdentityId:subIdentityType:", v17, v18);
  }
  v19 = -[CLClientManagerAdapter adaptee](self, "adaptee");
  objc_msgSend(a9, "UTF8String");
  sub_1007DD8CC((uint64_t)v19, (uint64_t)v15, a6, v10, v20, v9, 1);
}

- (void)setLastLocationSettingsEventSource:(id)a3
{
  char *v4;
  std::string __str;

  v4 = -[CLClientManagerAdapter adaptee](self, "adaptee");
  sub_1015A2E04(&__str, (char *)objc_msgSend(a3, "UTF8String"));
  std::string::operator=((std::string *)(v4 + 952), &__str);
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);
}

- (void)sendMetricForFunctionCallsForClientKey:(id)a3 info:(id)a4
{
  sub_1007D11B4((uint64_t)-[CLClientManagerAdapter adaptee](self, "adaptee"), +[CLClientKeyPath clientKeyPathWithClientAnchor:anchorType:](CLClientKeyPath, "clientKeyPathWithClientAnchor:anchorType:", a3, 105), a4);
}

- (void)reportLocationUtilityEvent:(int)a3 atDate:(id)a4
{
  sub_1007C23C0((uint64_t)-[CLClientManagerAdapter adaptee](self, "adaptee"), *(uint64_t *)&a3, a4);
}

- (void)resetClient:(id)a3
{
  sub_1007C3390((uint64_t)-[CLClientManagerAdapter adaptee](self, "adaptee"), (uint64_t)+[CLClientKeyPath clientKeyPathWithLegacyClientKey:](CLClientKeyPath, "clientKeyPathWithLegacyClientKey:", a3));
}

- (void)resetClients
{
  sub_1007DB688((uint64_t)-[CLClientManagerAdapter adaptee](self, "adaptee"));
}

- (void)setClient:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7[2];
  char v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  void *v15;
  char v16;
  void *v17;
  char v18;
  void *__p;
  char v20;

  (*((void (**)(void **__return_ptr, id, SEL))a3 + 2))(v7, a3, a2);
  v4 = +[CLClientKeyPath clientKeyPathFromName:](CLClientKeyPath, "clientKeyPathFromName:", v7);
  if (v20 < 0)
    operator delete(__p);
  if (v18 < 0)
    operator delete(v17);
  if (v16 < 0)
    operator delete(v15);
  if (v14 < 0)
    operator delete(v13);
  if (v12 < 0)
    operator delete(v11);
  if (v10 < 0)
    operator delete(v9);
  if (v8 < 0)
    operator delete(v7[0]);
  v5 = -[CLClientManagerAdapter adaptee](self, "adaptee");
  v6 = sub_100195B0C((uint64_t)v5, (uint64_t)v4);
  sub_1007D4958((uint64_t)v5, v6, 1);
}

- (void)setPurpose:(id)a3 forClient:(id)a4
{
  id v6;
  void *v7[2];
  char v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  void *v15;
  char v16;
  void *v17;
  char v18;
  void *__p;
  char v20;

  (*((void (**)(void **__return_ptr, id, SEL))a4 + 2))(v7, a4, a2);
  v6 = +[CLClientKeyPath clientKeyPathFromName:](CLClientKeyPath, "clientKeyPathFromName:", v7);
  if (v20 < 0)
    operator delete(__p);
  if (v18 < 0)
    operator delete(v17);
  if (v16 < 0)
    operator delete(v15);
  if (v14 < 0)
    operator delete(v13);
  if (v12 < 0)
    operator delete(v11);
  if (v10 < 0)
    operator delete(v9);
  if (v8 < 0)
    operator delete(v7[0]);
  sub_1007E1F44((uint64_t)-[CLClientManagerAdapter adaptee](self, "adaptee"), (uint64_t)v6, (uint64_t)a3);
}

- (BOOL)syncgetSetLocationServicesEnabledStatically:(BOOL)a3 withEventSource:(id)a4
{
  void *v6;
  void *__p[2];
  char v9;

  v6 = -[CLClientManagerAdapter adaptee](self, "adaptee");
  sub_1015A2E04(__p, (char *)objc_msgSend(a4, "UTF8String"));
  sub_1007BC5C8((uint64_t)v6, a3, (uint64_t *)__p);
  if (v9 < 0)
    operator delete(__p[0]);
  return 1;
}

- (void)checkAppInstallationStatus
{
  sub_1007C72C0((uint64_t)-[CLClientManagerAdapter adaptee](self, "adaptee"));
}

- (void)appsWithClientKeysAreInstalledOnAPairedDevice:(id)a3
{
  sub_1007E205C((id *)-[CLClientManagerAdapter adaptee](self, "adaptee"), a3);
}

- (void)setAllowableAuthorizationMask:(unint64_t)a3 forClientKey:(id)a4
{
  sub_1001AD98C((uint64_t)-[CLClientManagerAdapter adaptee](self, "adaptee"), (uint64_t)+[CLClientKeyPath clientKeyPathWithLegacyClientKey:](CLClientKeyPath, "clientKeyPathWithLegacyClientKey:", a4), a3, 0);
}

- (id)syncgetCopyClients
{
  void *v2;
  uint64_t v3;

  v2 = -[CLClientManagerAdapter adaptee](self, "adaptee");
  return sub_1007E21C4((uint64_t)v2, v3, 0);
}

- (id)syncgetLocationClientKeys
{
  return sub_1002407E4((uint64_t)-[CLClientManagerAdapter adaptee](self, "adaptee"));
}

- (id)syncgetNonSystemLocationClientKey
{
  std::string *p_p;
  NSString *v3;
  std::string __p;

  memset(&__p, 0, sizeof(__p));
  if (sub_1007E2928((uint64_t)-[CLClientManagerAdapter adaptee](self, "adaptee"), &__p))
  {
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_p = &__p;
    else
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", p_p);
  }
  else
  {
    v3 = 0;
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  return v3;
}

- (void)fetchClientStaticRegistrationResult:(id)a3 withReply:(id)a4
{
  id v6;
  id v7;
  void *v8[2];
  char v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  void *__p;
  char v21;

  (*((void (**)(void **__return_ptr, id, SEL))a3 + 2))(v8, a3, a2);
  v6 = +[CLClientKeyPath clientKeyPathFromName:](CLClientKeyPath, "clientKeyPathFromName:", v8);
  if (v21 < 0)
    operator delete(__p);
  if (v19 < 0)
    operator delete(v18);
  if (v17 < 0)
    operator delete(v16);
  if (v15 < 0)
    operator delete(v14);
  if (v13 < 0)
    operator delete(v12);
  if (v11 < 0)
    operator delete(v10);
  if (v9 < 0)
    operator delete(v8[0]);
  v7 = sub_1007BCDC4((uint64_t)-[CLClientManagerAdapter adaptee](self, "adaptee"), (uint64_t)v6);
  if (a4)
    (*((void (**)(id, id))a4 + 2))(a4, v7);
}

- (void)getIncidentalUseModeForClient:(id)a3 withReply:(id)a4
{
  id v6;
  void *v7[2];
  char v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  void *v15;
  char v16;
  void *v17;
  char v18;
  void *__p;
  char v20;

  (*((void (**)(void **__return_ptr, id, SEL))a3 + 2))(v7, a3, a2);
  v6 = +[CLClientKeyPath clientKeyPathFromName:](CLClientKeyPath, "clientKeyPathFromName:", v7);
  if (v20 < 0)
    operator delete(__p);
  if (v18 < 0)
    operator delete(v17);
  if (v16 < 0)
    operator delete(v15);
  if (v14 < 0)
    operator delete(v13);
  if (v12 < 0)
    operator delete(v11);
  if (v10 < 0)
    operator delete(v9);
  if (v8 < 0)
    operator delete(v7[0]);
  sub_1007C2098((uint64_t)-[CLClientManagerAdapter adaptee](self, "adaptee"), (uint64_t)v6, (uint64_t)a4);
}

- (void)registerCircularInterestZoneForClientKey:(id)a3 withId:(id)a4 latitude:(double)a5 longitude:(double)a6 serviceMaskOperator:(int)a7 provenanceType:(int)a8 radius:(double)a9 withReply:(id)a10
{
  void *v18;
  void *__p[2];
  char v20;
  void *v21[2];
  char v22;

  v18 = -[CLClientManagerAdapter adaptee](self, "adaptee");
  sub_1015A2E04(v21, (char *)objc_msgSend(a3, "UTF8String"));
  sub_1015A2E04(__p, (char *)objc_msgSend(a4, "UTF8String"));
  sub_1007E2DFC((uint64_t)v18, (uint64_t)v21, (uint64_t)__p, 1, 0, a7, a8, 1, a5, a6, a9, 0, (uint64_t)a10);
  if (v20 < 0)
    operator delete(__p[0]);
  if (v22 < 0)
    operator delete(v21[0]);
}

- (void)registerPhenolicInterestZoneForClientKey:(id)a3 withId:(id)a4 phenolicLocation:(int)a5 serviceMaskOperator:(int)a6 provenanceType:(int)a7 withReply:(id)a8
{
  uint64_t v11;
  void *v14;
  void *__p[2];
  char v16;
  void *v17[2];
  char v18;

  v11 = *(_QWORD *)&a5;
  v14 = -[CLClientManagerAdapter adaptee](self, "adaptee");
  sub_1015A2E04(v17, (char *)objc_msgSend(a3, "UTF8String"));
  sub_1015A2E04(__p, (char *)objc_msgSend(a4, "UTF8String"));
  sub_1007E2DFC((uint64_t)v14, (uint64_t)v17, (uint64_t)__p, 2, v11, a6, a7, 1, -1.0, -1.0, -1.0, 0, (uint64_t)a8);
  if (v16 < 0)
    operator delete(__p[0]);
  if (v18 < 0)
    operator delete(v17[0]);
}

- (void)setRelevance:(BOOL)a3 forInterestZoneWithId:(id)a4 registeredForClientKey:(id)a5 withReply:(id)a6
{
  _BOOL8 v9;
  void *v10;
  void *__p[2];
  char v12;
  void *v13[2];
  char v14;

  v9 = a3;
  v10 = -[CLClientManagerAdapter adaptee](self, "adaptee");
  sub_1015A2E04(v13, (char *)objc_msgSend(a5, "UTF8String"));
  sub_1015A2E04(__p, (char *)objc_msgSend(a4, "UTF8String"));
  sub_1007E3AE0((uint64_t)v10, (char *)v13, (char *)__p, v9, (uint64_t)a6);
  if (v12 < 0)
    operator delete(__p[0]);
  if (v14 < 0)
    operator delete(v13[0]);
}

- (void)setRelevance:(BOOL)a3 forInterestZoneWithId:(id)a4 registeredForClientKey:(id)a5
{
  _BOOL8 v7;
  void *v8;
  void *__p[2];
  char v10;
  void *v11[2];
  char v12;

  v7 = a3;
  v8 = -[CLClientManagerAdapter adaptee](self, "adaptee");
  sub_1015A2E04(v11, (char *)objc_msgSend(a5, "UTF8String"));
  sub_1015A2E04(__p, (char *)objc_msgSend(a4, "UTF8String"));
  sub_1007E3AE0((uint64_t)v8, (char *)v11, (char *)__p, v7, 0);
  if (v10 < 0)
    operator delete(__p[0]);
  if (v12 < 0)
    operator delete(v11[0]);
}

- (void)deleteInterestZoneWithId:(id)a3 registeredForClientKey:(id)a4 withReply:(id)a5
{
  void *v8;
  void *__p[2];
  char v10;
  void *v11[2];
  char v12;

  v8 = -[CLClientManagerAdapter adaptee](self, "adaptee");
  sub_1015A2E04(v11, (char *)objc_msgSend(a4, "UTF8String"));
  sub_1015A2E04(__p, (char *)objc_msgSend(a3, "UTF8String"));
  sub_1007E40B8((uint64_t)v8, (char *)v11, (char *)__p, (uint64_t)a5);
  if (v10 < 0)
    operator delete(__p[0]);
  if (v12 < 0)
    operator delete(v11[0]);
}

- (void)setIncidentalUseMode:(int)a3 forClient:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7[2];
  char v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  void *v15;
  char v16;
  void *v17;
  char v18;
  void *__p;
  char v20;

  v4 = *(_QWORD *)&a3;
  (*((void (**)(void **__return_ptr, id, SEL))a4 + 2))(v7, a4, a2);
  v6 = +[CLClientKeyPath clientKeyPathFromName:](CLClientKeyPath, "clientKeyPathFromName:", v7);
  if (v20 < 0)
    operator delete(__p);
  if (v18 < 0)
    operator delete(v17);
  if (v16 < 0)
    operator delete(v15);
  if (v14 < 0)
    operator delete(v13);
  if (v12 < 0)
    operator delete(v11);
  if (v10 < 0)
    operator delete(v9);
  if (v8 < 0)
    operator delete(v7[0]);
  sub_1007C3608((uint64_t)-[CLClientManagerAdapter adaptee](self, "adaptee"), v4, (uint64_t)v6);
}

- (void)setLocationButtonUseMode:(int)a3 forClient:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7[2];
  char v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  void *v15;
  char v16;
  void *v17;
  char v18;
  void *__p;
  char v20;

  v4 = *(_QWORD *)&a3;
  (*((void (**)(void **__return_ptr, id, SEL))a4 + 2))(v7, a4, a2);
  v6 = +[CLClientKeyPath clientKeyPathFromName:](CLClientKeyPath, "clientKeyPathFromName:", v7);
  if (v20 < 0)
    operator delete(__p);
  if (v18 < 0)
    operator delete(v17);
  if (v16 < 0)
    operator delete(v15);
  if (v14 < 0)
    operator delete(v13);
  if (v12 < 0)
    operator delete(v11);
  if (v10 < 0)
    operator delete(v9);
  if (v8 < 0)
    operator delete(v7[0]);
  sub_1007C3988((uint64_t)-[CLClientManagerAdapter adaptee](self, "adaptee"), v4, (uint64_t)v6);
}

- (BOOL)syncgetIsMapsANonSystemLocationClient
{
  return sub_1007E4724((uint64_t)-[CLClientManagerAdapter adaptee](self, "adaptee"), (uint64_t)+[CLClientKeyPath clientKeyPathWithClientAnchor:anchorType:](CLClientKeyPath, "clientKeyPathWithClientAnchor:anchorType:", CFSTR("com.apple.Maps"), 105));
}

- (id)syncgetApplyArchivedAuthorizationDecisionsAndDie:(id)a3 unlessTokenMatches:(id)a4
{
  return sub_1007CA8E0((uint64_t)-[CLClientManagerAdapter adaptee](self, "adaptee"), (uint64_t)a3, a4);
}

- (id)syncgetArchivedAuthorizationDecisions
{
  return sub_1007CA500((uint64_t)-[CLClientManagerAdapter adaptee](self, "adaptee"));
}

- (void)checkWeakPersistentClientWithIdentifier:(id)a3
{
  void *v4;
  void *v5[2];
  char v6;
  void *__p;
  char v8;

  v4 = -[CLClientManagerAdapter adaptee](self, "adaptee");
  (*((void (**)(void **__return_ptr, id))a3 + 2))(v5, a3);
  sub_1007BFE34((uint64_t)v4, (uint64_t *)v5);
  if (v8 < 0)
    operator delete(__p);
  if (v6 < 0)
    operator delete(v5[0]);
}

- (void)setTemporaryAuthorizationStatusInfoForClient:(id)a3 data:(id)a4
{
  id v6;
  void *v7[2];
  char v8;
  void *v9;
  char v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  void *v15;
  char v16;
  void *v17;
  char v18;
  void *__p;
  char v20;

  (*((void (**)(void **__return_ptr, id, SEL))a3 + 2))(v7, a3, a2);
  v6 = +[CLClientKeyPath clientKeyPathFromName:](CLClientKeyPath, "clientKeyPathFromName:", v7);
  if (v20 < 0)
    operator delete(__p);
  if (v18 < 0)
    operator delete(v17);
  if (v16 < 0)
    operator delete(v15);
  if (v14 < 0)
    operator delete(v13);
  if (v12 < 0)
    operator delete(v11);
  if (v10 < 0)
    operator delete(v9);
  if (v8 < 0)
    operator delete(v7[0]);
  sub_1007E4984((uint64_t)-[CLClientManagerAdapter adaptee](self, "adaptee"), (uint64_t)v6, (uint64_t)a4);
}

- (id)syncgetTemporaryAuthorizationStatusForClient:(id)a3
{
  id v4;
  void *v6[2];
  char v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  void *v16;
  char v17;
  void *__p;
  char v19;

  (*((void (**)(void **__return_ptr, id, SEL))a3 + 2))(v6, a3, a2);
  v4 = +[CLClientKeyPath clientKeyPathFromName:](CLClientKeyPath, "clientKeyPathFromName:", v6);
  if (v19 < 0)
    operator delete(__p);
  if (v17 < 0)
    operator delete(v16);
  if (v15 < 0)
    operator delete(v14);
  if (v13 < 0)
    operator delete(v12);
  if (v11 < 0)
    operator delete(v10);
  if (v9 < 0)
    operator delete(v8);
  if (v7 < 0)
    operator delete(v6[0]);
  return sub_1007E58BC((uint64_t)-[CLClientManagerAdapter adaptee](self, "adaptee"), (uint64_t)v4);
}

- (double)syncgetAndSetOrChangeAppClipAuthorizationTime:(double)a3 forClient:(id)a4
{
  id v6;
  void *v8[2];
  char v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  void *__p;
  char v21;

  (*((void (**)(void **__return_ptr, id, SEL))a4 + 2))(v8, a4, a2);
  v6 = +[CLClientKeyPath clientKeyPathFromName:](CLClientKeyPath, "clientKeyPathFromName:", v8);
  if (v21 < 0)
    operator delete(__p);
  if (v19 < 0)
    operator delete(v18);
  if (v17 < 0)
    operator delete(v16);
  if (v15 < 0)
    operator delete(v14);
  if (v13 < 0)
    operator delete(v12);
  if (v11 < 0)
    operator delete(v10);
  if (v9 < 0)
    operator delete(v8[0]);
  sub_1007E5EC0((uint64_t)-[CLClientManagerAdapter adaptee](self, "adaptee"), v6, a3);
  return -1.0;
}

- (void)triggerClearAppClipAuthorizationIfNecessary
{
  sub_1007E62D8((uint64_t)-[CLClientManagerAdapter adaptee](self, "adaptee"), 14400.0);
}

- (void)triggerAnalyticsCollect
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1007D01AC;
  v2[3] = &unk_102131FE8;
  v2[4] = -[CLClientManagerAdapter adaptee](self, "adaptee");
  AnalyticsSendEventLazy(CFSTR("com.apple.locationd.client.statistics"), v2);
}

- (void)handleLiveActivityUpdate:(id)a3
{
  sub_1007E662C((uint64_t)-[CLClientManagerAdapter adaptee](self, "adaptee"), a3);
}

- (void)calculateCheeseCoverage:(id)a3 interestInterval:(id)a4 withOptions:(id)a5 lookbackWindowStartDate:(id)a6 withReply:(id)a7
{
  sub_1007D1D18((uint64_t)-[CLClientManagerAdapter adaptee](self, "adaptee"), (uint64_t)+[CLClientKeyPath clientKeyPathWithLegacyClientKey:](CLClientKeyPath, "clientKeyPathWithLegacyClientKey:", a3), a4, a5, (uint64_t)a6, (uint64_t)a7);
}

- (void)getClientManagerInternalStateWithReply:(id)a3
{
  id v4;

  v4 = sub_1007D0934((uint64_t)-[CLClientManagerAdapter adaptee](self, "adaptee"));
  (*((void (**)(id, id))a3 + 2))(a3, v4);
}

@end
