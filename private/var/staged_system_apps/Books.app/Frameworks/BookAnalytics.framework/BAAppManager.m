@implementation BAAppManager

+ (BAAppManager)sharedManager
{
  if (qword_295978 != -1)
    swift_once(&qword_295978, sub_11A7E8);
  return (BAAppManager *)(id)qword_29FB10;
}

- (BAAppManager)init
{
  return (BAAppManager *)sub_11AA20();
}

- (void)startAppSessionWithApplicationGroupIdentifier:(id)a3 enableUploads:(BOOL)a4
{
  uint64_t v6;
  BAEventReporter *v7;
  BAEventReporter *v8;
  BAAppManager *v9;
  SEL v10;
  id v11;
  id v12;
  id v13;
  int64_t v14;
  int64_t v15;
  id v16;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
  v8 = v7;
  v9 = self;
  sub_11AC8C(v6, (uint64_t)v8, a4);

  swift_bridgeObjectRelease(v8, v10, v11, v12, v13, v14, v15, v16);
}

- (void)appSessionDidTerminate
{
  BAAppManager *v2;

  v2 = self;
  AppSessionManager.appSessionDidTerminate(timeout:)(1.0);

}

- (void).cxx_destruct
{
  void *v2;
  void *v3;
  int64_t v4;
  void *v5;
  BOOL v6;
  void *v7;
  SEL v9;
  id v10;
  id v11;
  id v12;
  int64_t v13;
  int64_t v14;
  id v15;
  SEL v16;
  id v17;
  id v18;
  int64_t v19;
  id v20;
  BOOL v21;
  id v22;
  SEL v23;
  id v24;
  id v25;
  int64_t v26;
  id v27;
  BOOL v28;
  id v29;

  swift_release(*(BAEventReporter **)((char *)&self->super.isa + OBJC_IVAR___BAAppManager_appSessionManager), a2, v2, v3, v4, v5, v6, v7);

  swift_bridgeObjectRelease(*(BAEventReporter **)&self->appSessionManager[OBJC_IVAR___BAAppManager_applicationGroupIdentifier], v9, v10, v11, v12, v13, v14, v15);
  swift_release(*(BAEventReporter **)((char *)&self->super.isa + OBJC_IVAR___BAAppManager_debugProcessor), v16, v17, v18, v19, v20, v21, v22);
  swift_release(*(BAEventReporter **)((char *)&self->super.isa + OBJC_IVAR___BAAppManager_flushManager), v23, v24, v25, v26, v27, v28, v29);
  sub_11CDA0((uint64_t)self + OBJC_IVAR___BAAppManager_targetURL);
}

- (void)privacyAcknowledgementNotification:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;

  v4 = type metadata accessor for Notification(0, a2);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  sub_11D1A8();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (NSURL)url
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  BAAppManager *v7;
  NSURL *v8;
  void *v9;
  void *v10;
  uint64_t v12;

  v3 = type metadata accessor for URL(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  AppManager.url.getter((uint64_t)v6);

  URL._bridgeToObjectiveC()(v8);
  v10 = v9;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (NSURL *)v10;
}

- (NSString)name
{
  BAAppManager *v2;
  int v3;
  unint64_t v4;
  BAEventReporter *v5;
  NSString v6;
  SEL v7;
  id v8;
  id v9;
  id v10;
  int64_t v11;
  int64_t v12;
  id v13;

  v2 = self;
  v3 = sub_11C59C();
  v4 = 0xE800000000000000;
  if (v3 != 2)
    v4 = 0xE900000000000067;
  if (v3 == 1)
    v5 = (BAEventReporter *)0xE900000000000076;
  else
    v5 = (BAEventReporter *)v4;

  v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v5, v7, v8, v9, v10, v11, v12, v13);
  return (NSString *)v6;
}

- (NSString)sharedContainerIdentifier
{
  char *v2;
  uint64_t v3;
  NSString v4;
  _BYTE v6[24];

  v2 = (char *)self + OBJC_IVAR___BAAppManager_applicationGroupIdentifier;
  swift_beginAccess((char *)self + OBJC_IVAR___BAAppManager_applicationGroupIdentifier, v6, 0, 0);
  v3 = *((_QWORD *)v2 + 1);
  if (!v3)
    return (NSString *)0;
  swift_bridgeObjectRetain(v3);
  v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  return (NSString *)v4;
}

@end
