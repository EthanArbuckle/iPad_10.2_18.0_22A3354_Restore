@implementation CloudSyncBugReporter

- (_TtC8Podcasts20CloudSyncBugReporter)init
{
  objc_class *ObjectType;
  _QWORD *v4;
  void *v5;
  _TtC8Podcasts20CloudSyncBugReporter *v6;
  id v7;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Podcasts20CloudSyncBugReporter_bugReporter);
  v5 = (void *)objc_opt_self(PFAutoBugCaptureBugReporter);
  v6 = self;
  v7 = objc_msgSend(v5, "sharedInstance");
  v4[3] = sub_100017E34();
  v4[4] = &protocol witness table for PFAutoBugCaptureBugReporter;
  *v4 = v7;

  v9.receiver = v6;
  v9.super_class = ObjectType;
  return -[CloudSyncBugReporter init](&v9, "init");
}

- (void)report:(int64_t)a3 userInfo:(id)a4
{
  unint64_t v6;
  _TtC8Podcasts20CloudSyncBugReporter *v7;

  if (a4)
    v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  else
    v6 = 0;
  v7 = self;
  sub_1002977BC(a3, v6);

  swift_bridgeObjectRelease(v6);
}

- (void)reportNonFollowedShowsSyncIssue:(int64_t)a3 version:(id)a4 userInfo:(id)a5
{
  sub_100297FE0(self, (uint64_t)a2, a3, (uint64_t)a4, (unint64_t)a5, 4uLL);
}

- (void)reportInterestSyncIssue:(int64_t)a3 version:(id)a4 userInfo:(id)a5
{
  sub_100297FE0(self, (uint64_t)a2, a3, (uint64_t)a4, (unint64_t)a5, 5uLL);
}

- (void)reportSubscriptionsSyncIssue:(int64_t)a3 subscriptionSyncType:(int64_t)a4 version:(id)a5 userInfo:(id)a6
{
  id v6;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  _TtC8Podcasts20CloudSyncBugReporter *v13;

  v6 = a6;
  if (a5)
  {
    v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
    v12 = v11;
    if (!v6)
      goto LABEL_4;
    goto LABEL_3;
  }
  v10 = 0;
  v12 = 0;
  if (a6)
LABEL_3:
    v6 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v6, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
LABEL_4:
  v13 = self;
  if ((unint64_t)a4 <= 1)
    sub_100297AC0(a3, a4, v10, v12, (unint64_t)v6);
  swift_bridgeObjectRelease(v6);
  swift_bridgeObjectRelease(v12);

}

- (void)reportBookmarksSyncIssue:(int64_t)a3 bookmarksSyncType:(int64_t)a4 version:(id)a5 userInfo:(id)a6
{
  id v6;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  _TtC8Podcasts20CloudSyncBugReporter *v13;
  _TtC8Podcasts20CloudSyncBugReporter *v14;

  v6 = a6;
  if (a5)
  {
    v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
    v11 = v10;
    if (!v6)
      goto LABEL_4;
    goto LABEL_3;
  }
  v9 = 0;
  v11 = 0;
  if (a6)
LABEL_3:
    v6 = (id)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v6, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
LABEL_4:
  if (a4)
  {
    if (a4 != 1)
    {
      v14 = self;
      goto LABEL_12;
    }
    v12 = 3;
  }
  else
  {
    v12 = 2;
  }
  v13 = self;
  sub_100297AC0(a3, v12, v9, v11, (unint64_t)v6);
LABEL_12:
  swift_bridgeObjectRelease(v6);
  swift_bridgeObjectRelease(v11);

}

- (void)reportSyncAuthenticationErrorFor:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  _TtC8Podcasts20CloudSyncBugReporter *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_100298258(v6, v7);

}

- (void).cxx_destruct
{
  sub_10003D380((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Podcasts20CloudSyncBugReporter_bugReporter));
}

@end
