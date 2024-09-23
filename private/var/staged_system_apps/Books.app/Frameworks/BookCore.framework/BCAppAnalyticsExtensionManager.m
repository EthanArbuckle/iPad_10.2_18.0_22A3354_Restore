@implementation BCAppAnalyticsExtensionManager

- (BAAnalyticsController)analyticsController
{
  id *v2;
  _BYTE v4[24];

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___BCAppAnalyticsExtensionManager_analyticsController);
  swift_beginAccess((char *)self + OBJC_IVAR___BCAppAnalyticsExtensionManager_analyticsController, v4, 0, 0);
  return (BAAnalyticsController *)*v2;
}

- (void)setAnalyticsController:(id)a3
{
  void **v4;
  void *v5;
  id v6;
  _BYTE v7[24];

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___BCAppAnalyticsExtensionManager_analyticsController);
  swift_beginAccess((char *)self + OBJC_IVAR___BCAppAnalyticsExtensionManager_analyticsController, v7, 1, 0);
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (BCAppAnalyticsExtensionManager)initWithUploadsEnabled:(BOOL)a3
{
  id v5;
  BCAppAnalyticsExtensionManager *v6;
  objc_class *v7;
  objc_super v9;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BCAppAnalyticsExtensionManager_assertion) = 0;
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR___BCAppAnalyticsExtensionManager_viewController, 0);
  *((_BYTE *)&self->super.isa + OBJC_IVAR___BCAppAnalyticsExtensionManager_uploadsEnabled) = a3;
  v5 = objc_allocWithZone((Class)type metadata accessor for AnalyticsController(0));
  v6 = self;
  v7 = (objc_class *)objc_msgSend(v5, "init");
  *(Class *)((char *)&v6->super.isa + OBJC_IVAR___BCAppAnalyticsExtensionManager_analyticsController) = v7;

  v9.receiver = v6;
  v9.super_class = (Class)type metadata accessor for AppAnalyticsExtensionManager();
  return -[BCAppAnalyticsExtensionManager init](&v9, "init");
}

- (BCAppAnalyticsExtensionManager)init
{
  id v3;
  BCAppAnalyticsExtensionManager *v4;
  objc_class *v5;
  objc_super v7;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BCAppAnalyticsExtensionManager_assertion) = 0;
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR___BCAppAnalyticsExtensionManager_viewController, 0);
  *((_BYTE *)&self->super.isa + OBJC_IVAR___BCAppAnalyticsExtensionManager_uploadsEnabled) = 1;
  v3 = objc_allocWithZone((Class)type metadata accessor for AnalyticsController(0));
  v4 = self;
  v5 = (objc_class *)objc_msgSend(v3, "init");
  *(Class *)((char *)&v4->super.isa + OBJC_IVAR___BCAppAnalyticsExtensionManager_analyticsController) = v5;

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for AppAnalyticsExtensionManager();
  return -[BCAppAnalyticsExtensionManager init](&v7, "init");
}

- (void)setupTrackingForRootViewController:(id)a3
{
  id v4;
  BCAppAnalyticsExtensionManager *v5;

  v4 = a3;
  v5 = self;
  sub_1956AC(v4);

}

- (void)startSession
{
  void **v3;
  void *v4;
  BCAppAnalyticsExtensionManager *v5;
  objc_class *v6;
  uint64_t v7;
  _BYTE v8[24];

  v3 = (void **)((char *)&self->super.isa + OBJC_IVAR___BCAppAnalyticsExtensionManager_analyticsController);
  swift_beginAccess((char *)self + OBJC_IVAR___BCAppAnalyticsExtensionManager_analyticsController, v8, 0, 0);
  v4 = *v3;
  v5 = self;
  v6 = (objc_class *)objc_msgSend(v4, "newSessionAssertion");
  v7 = *(uint64_t *)((char *)&v5->super.isa + OBJC_IVAR___BCAppAnalyticsExtensionManager_assertion);
  *(Class *)((char *)&v5->super.isa + OBJC_IVAR___BCAppAnalyticsExtensionManager_assertion) = v6;
  swift_unknownObjectRelease(v7);
  if (qword_30AB00 != -1)
    swift_once(&qword_30AB00, sub_18B014);
  RCDataContainer.deployStagedDataIfNeeded()();

}

- (void)endSession
{
  uint64_t v3;
  void *v4;
  BCAppAnalyticsExtensionManager *v5;

  v3 = OBJC_IVAR___BCAppAnalyticsExtensionManager_assertion;
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___BCAppAnalyticsExtensionManager_assertion);
  v5 = self;
  if (v4)
  {
    objc_msgSend(v4, "invalidate");
    v4 = *(Class *)((char *)&self->super.isa + v3);
  }
  *(Class *)((char *)&self->super.isa + v3) = 0;

  swift_unknownObjectRelease(v4);
}

- (void)waitForSessionEndWithTimeout:(double)a3
{
  void **v5;
  void *v6;
  BCAppAnalyticsExtensionManager *v7;
  id v8;
  _BYTE v9[24];

  v5 = (void **)((char *)&self->super.isa + OBJC_IVAR___BCAppAnalyticsExtensionManager_analyticsController);
  swift_beginAccess((char *)self + OBJC_IVAR___BCAppAnalyticsExtensionManager_analyticsController, v9, 0, 0);
  v6 = *v5;
  v7 = self;
  v8 = v6;
  dispatch thunk of AnalyticsController.waitForSessionEnd(_:)(a3);

}

- (void)appSessionDidTerminate
{
  BCAppAnalyticsExtensionManager *v3;
  id v4;

  type metadata accessor for AppManager(0);
  v3 = self;
  v4 = (id)static AppManager.shared.getter();
  dispatch thunk of AppManager.appSessionDidTerminate()();

}

- (void).cxx_destruct
{

  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___BCAppAnalyticsExtensionManager_assertion));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR___BCAppAnalyticsExtensionManager_viewController);
}

- (void)analyticsControllerDidStartSession:(id)a3
{
  id v4;
  BCAppAnalyticsExtensionManager *v5;

  v4 = a3;
  v5 = self;
  _s8BookCore28AppAnalyticsExtensionManagerC15didStartSession4withy0aD00D10ControllerC_tF_0();

}

- (void)analyticsController:(BAAnalyticsController *)a3 resetSessionWithCompletion:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  BAAnalyticsController *v15;
  BCAppAnalyticsExtensionManager *v16;
  uint64_t v17;
  uint64_t v18;

  v7 = sub_16B968(&qword_30C8A0);
  __chkstk_darwin(v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_294A10, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_294A38, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_30C6E8;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_294A60, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_30C6F0;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  v17 = sub_19FFA0((uint64_t)v9, (uint64_t)&unk_30C8C0, (uint64_t)v14);
  swift_release(v17);
}

- (id)analyticsSessionDataForKey:(id)a3
{
  id v4;
  BCAppAnalyticsExtensionManager *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  _QWORD v13[3];
  uint64_t v14;

  v4 = a3;
  v5 = self;
  AppAnalyticsExtensionManager.analyticsSessionData(for:)((uint64_t)v4, (uint64_t)v13);

  v6 = v14;
  if (!v14)
    return 0;
  v7 = sub_185554(v13, v14);
  v8 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v8 + 16))(v10);
  v11 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v10, v6);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v6);
  sub_184A38(v13);
  return v11;
}

- (BOOL)analyticsSessionDataIsMainWindow
{
  return 1;
}

- (BOOL)analyticsSessionDataIsParallel
{
  return 0;
}

- (NSArray)additionalEventProcessors
{
  return (NSArray *)Array._bridgeToObjectiveC()().super.isa;
}

@end
