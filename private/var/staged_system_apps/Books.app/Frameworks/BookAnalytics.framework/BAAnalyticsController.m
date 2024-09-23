@implementation BAAnalyticsController

- (_TtC13BookAnalytics9BATracker)applicationTracker
{
  id *v2;
  _BYTE v4[24];

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___BAAnalyticsController_applicationTracker);
  swift_beginAccess((char *)self + OBJC_IVAR___BAAnalyticsController_applicationTracker, v4, 0, 0);
  return (_TtC13BookAnalytics9BATracker *)*v2;
}

- (void)setApplicationTracker:(id)a3
{
  void **v4;
  void *v5;
  id v6;
  _BYTE v7[24];

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___BAAnalyticsController_applicationTracker);
  swift_beginAccess((char *)self + OBJC_IVAR___BAAnalyticsController_applicationTracker, v7, 1, 0);
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (BAUserConfiguration)userConfiguration
{
  return (BAUserConfiguration *)sub_1251C4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BAAnalyticsController_userConfiguration);
}

- (void)setUserConfiguration:(id)a3
{
  sub_125264((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___BAAnalyticsController_userConfiguration);
}

- (BAAnalyticsControllerDelegate)delegate
{
  return (BAAnalyticsControllerDelegate *)sub_1251C4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BAAnalyticsController_delegate);
}

- (void)setDelegate:(id)a3
{
  sub_125264((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___BAAnalyticsController_delegate);
}

- (BAAnalyticsControllerConfigurationProvider)configurationProvider
{
  return (BAAnalyticsControllerConfigurationProvider *)sub_1251C4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BAAnalyticsController_configurationProvider);
}

- (void)setConfigurationProvider:(id)a3
{
  sub_125264((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___BAAnalyticsController_configurationProvider);
}

- (NSDate)sessionStartTime
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  os_unfair_lock_s *v8;
  BAAnalyticsController *v9;
  uint64_t v10;
  uint64_t v11;
  Class isa;
  uint64_t v14;

  v3 = sub_71B4(&qword_29F018);
  __chkstk_darwin(v3);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BAAnalyticsController_lockProtectedData);
  v7 = v6 + *(_QWORD *)(class metadata base offset for ManagedBuffer + *(_QWORD *)v6 + 16);
  v8 = (os_unfair_lock_s *)(v6 + ((*(unsigned int *)(*(_QWORD *)v6 + 48) + 3) & 0x1FFFFFFFCLL));
  v9 = self;
  os_unfair_lock_lock(v8);
  sub_12558C(v7, (uint64_t)v5);
  os_unfair_lock_unlock(v8);

  v10 = type metadata accessor for Date(0);
  v11 = *(_QWORD *)(v10 - 8);
  isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v5, 1, v10) != 1)
  {
    isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v11 + 8))(v5, v10);
  }
  return (NSDate *)isa;
}

- (BAAnalyticsController)init
{
  return (BAAnalyticsController *)AnalyticsController.init()();
}

- (void)dealloc
{
  BAAnalyticsController *v3;
  NSObject *v4;
  BAAnalyticsController *v5;
  objc_super v6;

  if (*((_BYTE *)&self->super.isa + OBJC_IVAR___BAAnalyticsController_privateDataQueueActive) == 1)
  {
    v3 = self;
  }
  else
  {
    v4 = *(NSObject **)((char *)&self->super.isa + OBJC_IVAR___BAAnalyticsController_privateDataQueue);
    v5 = self;
    dispatch_resume(v4);
  }
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AnalyticsController();
  -[BAAnalyticsController dealloc](&v6, "dealloc");
}

- (void).cxx_destruct
{
  SEL v3;
  id v4;
  id v5;
  int64_t v6;
  id v7;
  BOOL v8;
  id v9;
  SEL v10;
  id v11;
  id v12;
  int64_t v13;
  id v14;
  BOOL v15;
  id v16;

  swift_release(*(BAEventReporter **)((char *)&self->super.isa + OBJC_IVAR___BAAnalyticsController_sessionManager), v3, v4, v5, v6, v7, v8, v9);
  sub_130DE8((uint64_t)self + OBJC_IVAR___BAAnalyticsController_userConfiguration);
  sub_130DE8((uint64_t)self + OBJC_IVAR___BAAnalyticsController_delegate);
  sub_130DE8((uint64_t)self + OBJC_IVAR___BAAnalyticsController_configurationProvider);

  swift_release(*(BAEventReporter **)((char *)&self->super.isa + OBJC_IVAR___BAAnalyticsController_lockProtectedData), v10, v11, v12, v13, v14, v15, v16);
}

- (void)start
{
  BAAnalyticsController *v2;

  v2 = self;
  sub_125E34();

}

- (void)setReferralURL:(id)a3 app:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  BAEventReporter *v13;
  BAEventReporter *v14;
  BAAnalyticsController *v15;
  SEL v16;
  id v17;
  id v18;
  id v19;
  int64_t v20;
  int64_t v21;
  id v22;
  uint64_t v23;

  v7 = type metadata accessor for URL(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4, v11);
  v14 = v13;
  v15 = self;
  sub_126CD0((uint64_t)v10, v12, (unint64_t)v14);

  swift_bridgeObjectRelease(v14, v16, v17, v18, v19, v20, v21, v22);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)setTreatmentData:(id)a3
{
  id v5;
  BAAnalyticsController *v6;

  v5 = a3;
  v6 = self;
  sub_12785C((uint64_t)a3);

}

- (void)appendUserExperience:(id)a3
{
  BAEventReporter *v4;
  BAEventReporter *v5;
  uint64_t v6;
  uint64_t v7;
  os_unfair_lock_s *v8;
  BAAnalyticsController *v9;
  SEL v10;
  id v11;
  id v12;
  id v13;
  int64_t v14;
  int64_t v15;
  id v16;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
  v5 = v4;
  v6 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___BAAnalyticsController_lockProtectedData);
  v7 = v6 + *(_QWORD *)(class metadata base offset for ManagedBuffer + *(_QWORD *)v6 + 16);
  v8 = (os_unfair_lock_s *)(v6 + ((*(unsigned int *)(*(_QWORD *)v6 + 48) + 3) & 0x1FFFFFFFCLL));
  v9 = self;
  os_unfair_lock_lock(v8);
  sub_130DD0(v7);
  os_unfair_lock_unlock(v8);
  sub_128DC0();

  swift_bridgeObjectRelease(v5, v10, v11, v12, v13, v14, v15, v16);
}

- (void)setLaunchedFromShortcutItem
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR___BAAnalyticsController_launchedFromShortcutItem) = 1;
}

- (void)unsetLaunchedFromShortcutItem
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR___BAAnalyticsController_launchedFromShortcutItem) = 0;
}

- (void)resetPrivateData:(id)a3
{
  objc_class *v4;
  objc_class *v5;
  BAEventReporter *v6;
  uint64_t (*v7)();
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  BOOL v12;
  void *v13;
  BAAnalyticsController *v14;

  v4 = (objc_class *)_Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = (BAEventReporter *)swift_allocObject(&unk_27DCE8, 24, 7);
    v6[1].super.isa = v5;
    v7 = sub_131568;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v14 = self;
  sub_127FC4((uint64_t)v7, (uint64_t)v6);
  sub_130DC0((uint64_t)v7, v6, v8, v9, v10, v11, v12, v13);

}

- (BOOL)waitForSessionEnd:(double)a3
{
  BAAnalyticsController *v4;
  BOOL v5;

  v4 = self;
  v5 = sub_128908(a3);

  return v5;
}

- (void)refreshSessionDataIfActive
{
  BAAnalyticsController *v2;

  v2 = self;
  sub_128DC0();

}

- (id)contentPrivateIDForContentID:(id)a3
{
  return sub_12C75C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))AnalyticsController.contentPrivateID(for:));
}

- (id)contentUserIDForContentID:(id)a3
{
  return sub_12C75C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))AnalyticsController.contentUserID(for:));
}

- (void)performAfterPrivateDataFetchedWithCompletionHandler:(id)a3
{
  objc_class *v4;
  BAEventReporter *v5;
  BAAnalyticsController *v6;
  SEL v7;
  id v8;
  id v9;
  int64_t v10;
  id v11;
  BOOL v12;
  id v13;

  v4 = (objc_class *)_Block_copy(a3);
  v5 = (BAEventReporter *)swift_allocObject(&unk_27DCC0, 24, 7);
  v5[1].super.isa = v4;
  v6 = self;
  AnalyticsController.performAfterPrivateDataFetched(completionHandler:)((objc_class *)sub_130DB8, (uint64_t)v5);

  swift_release(v5, v7, v8, v9, v10, v11, v12, v13);
}

- (id)newSessionAssertion
{
  return sub_12CAC4((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_newAssertion);
}

- (id)newSessionExtendingAssertion
{
  return sub_12CAC4((uint64_t)self, (uint64_t)a2, (SEL *)&selRef_newExtendingAssertion);
}

- (void)privateDataChanged:(id)a3
{
  BAEventReporter *v4;
  BAAnalyticsController *v5;
  SEL v6;
  id v7;
  id v8;
  id v9;
  int64_t v10;
  int64_t v11;
  id v12;

  v4 = (BAEventReporter *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String, &type metadata for String, &protocol witness table for String);
  v5 = self;
  AnalyticsController.privateDataChanged(_:)((Swift::OpaquePointer)v4);

  swift_bridgeObjectRelease(v4, v6, v7, v8, v9, v10, v11, v12);
}

- (void)countingAssertProviderTransitionToZero:(id)a3
{
  id v4;
  BAAnalyticsController *v5;

  v4 = a3;
  v5 = self;
  _s13BookAnalytics0B10ControllerC32countingAssertProviderTransition6toZeroySo019BUCountingAssertionF0C_tF_0();

}

- (void)countingAssertProviderTransitionToNonZero:(id)a3
{
  id v4;
  BAAnalyticsController *v5;

  v4 = a3;
  v5 = self;
  _s13BookAnalytics0B10ControllerC32countingAssertProviderTransition9toNonZeroySo019BUCountingAssertionF0C_tF_0();

}

@end
