@implementation AuthorizationServiceClient

- (_TtC11SessionCoreP33_3EB6553D2992046DCD21680C8109860026AuthorizationServiceClient)init
{
  _TtC11SessionCoreP33_3EB6553D2992046DCD21680C8109860026AuthorizationServiceClient *result;

  result = (_TtC11SessionCoreP33_3EB6553D2992046DCD21680C8109860026AuthorizationServiceClient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11SessionCoreP33_3EB6553D2992046DCD21680C8109860026AuthorizationServiceClient_connection));
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (BOOL)setActivitiesAuthorizationForBundleIdentifier:(id)a3 options:(id)a4 error:(id *)a5
{
  return sub_1C142171C(self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, (void (*)(uint64_t, uint64_t, char *))sub_1C1421394);
}

- (BOOL)setFrequentPushesEnabledForBundleIdentifier:(id)a3 options:(id)a4 error:(id *)a5
{
  return sub_1C142171C(self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, (void (*)(uint64_t, uint64_t, char *))sub_1C142150C);
}

- (BOOL)clearActivitiesAuthorizationForBundleIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _TtC11SessionCoreP33_3EB6553D2992046DCD21680C8109860026AuthorizationServiceClient *v8;

  v5 = sub_1C1426A88();
  v7 = v6;
  v8 = self;
  sub_1C14218D0(v5, v7);
  swift_bridgeObjectRelease();

  return 1;
}

- (BOOL)areActivitiesEnabledForCurrentProcess
{
  _TtC11SessionCoreP33_3EB6553D2992046DCD21680C8109860026AuthorizationServiceClient *v2;
  char v3;

  v2 = self;
  v3 = sub_1C1421B58();

  return v3 & 1;
}

- (id)activityAuthorizationsCountForBundleIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC11SessionCoreP33_3EB6553D2992046DCD21680C8109860026AuthorizationServiceClient *v7;
  void *v8;

  v4 = sub_1C1426A88();
  v6 = v5;
  v7 = self;
  v8 = (void *)sub_1C1421D20(v4, v6);

  swift_bridgeObjectRelease();
  return v8;
}

- (BOOL)subscribeToAuthorizationLevelChangesForBundleIdentifier:(id)a3
{
  return sub_1C1422908(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))sub_1C1421FB4);
}

- (BOOL)unsubscribeToAuthorizationLevelChangesForBundleIdentifier:(id)a3
{
  return sub_1C1422908(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))sub_1C1422160);
}

- (BOOL)areActivitiesEnabledForBundleIdentifier:(id)a3
{
  return sub_1C1422908(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t))sub_1C1422300);
}

- (BOOL)areFrequentPushesEnabledForCurrentProcess
{
  _TtC11SessionCoreP33_3EB6553D2992046DCD21680C8109860026AuthorizationServiceClient *v2;
  char v3;

  v2 = self;
  v3 = sub_1C14224BC();

  return v3 & 1;
}

- (BOOL)areFrequentPushesEnabledForBundleIdentifier:(id)a3
{
  return sub_1C1422908(self, (uint64_t)a2, (uint64_t)a3, sub_1C14226F0);
}

@end
