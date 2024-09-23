@implementation NavigationAlertsOnlyOverrideSynchronizationTask

- (_TtC4Maps47NavigationAlertsOnlyOverrideSynchronizationTask)initWithPlatformController:(id)a3 userDefaults:(id)a4 audioPreferences:(id)a5
{
  return (_TtC4Maps47NavigationAlertsOnlyOverrideSynchronizationTask *)sub_10003A350(a3, a4, a5);
}

- (void)dealloc
{
  _TtC4Maps47NavigationAlertsOnlyOverrideSynchronizationTask *v2;

  v2 = self;
  sub_10003A618();
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC4Maps47NavigationAlertsOnlyOverrideSynchronizationTask_platformController);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC4Maps47NavigationAlertsOnlyOverrideSynchronizationTask_userDefaults));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC4Maps47NavigationAlertsOnlyOverrideSynchronizationTask_audioPreferences));
  swift_bridgeObjectRelease(*(_QWORD *)&self->platformController[OBJC_IVAR____TtC4Maps47NavigationAlertsOnlyOverrideSynchronizationTask_audioKey]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->platformController[OBJC_IVAR____TtC4Maps47NavigationAlertsOnlyOverrideSynchronizationTask_signKey]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->platformController[OBJC_IVAR____TtC4Maps47NavigationAlertsOnlyOverrideSynchronizationTask_persistedConfigurationKey]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC4Maps47NavigationAlertsOnlyOverrideSynchronizationTask_initialGuidanceConfiguration));
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  _TtC4Maps47NavigationAlertsOnlyOverrideSynchronizationTask *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  objc_class *v18;
  id v19;
  _TtC4Maps47NavigationAlertsOnlyOverrideSynchronizationTask *v20;
  _OWORD v21[2];

  if (a3)
  {
    v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v12 = v11;
    if (a4)
      goto LABEL_3;
LABEL_6:
    memset(v21, 0, sizeof(v21));
    v19 = a5;
    v20 = self;
    if (a5)
      goto LABEL_4;
LABEL_7:
    v18 = 0;
    goto LABEL_8;
  }
  v10 = 0;
  v12 = 0;
  if (!a4)
    goto LABEL_6;
LABEL_3:
  swift_unknownObjectRetain(a4);
  v13 = a5;
  v14 = self;
  _bridgeAnyObjectToAny(_:)(v21);
  swift_unknownObjectRelease(a4);
  if (!a5)
    goto LABEL_7;
LABEL_4:
  type metadata accessor for NSKeyValueChangeKey(0);
  v16 = v15;
  v17 = sub_10003C9D0();
  v18 = (objc_class *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a5, v16, (char *)&type metadata for Any + 8, v17);

LABEL_8:
  sub_10003B234(v10, v12, (uint64_t)v21, v18, (uint64_t)a6);

  swift_bridgeObjectRelease(v18);
  swift_bridgeObjectRelease(v12);
  sub_10000C180((uint64_t)v21);
}

- (void)applicationWillTerminate
{
  uint64_t Strong;
  void *v4;
  id v5;
  _TtC4Maps47NavigationAlertsOnlyOverrideSynchronizationTask *v6;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC4Maps47NavigationAlertsOnlyOverrideSynchronizationTask_platformController);
  if (Strong)
  {
    v4 = (void *)Strong;
    v6 = self;
    v5 = objc_msgSend(v4, "currentNavigationSession");

    if (v5)
    {

      sub_10003BBFC();
    }

  }
}

- (_TtC4Maps47NavigationAlertsOnlyOverrideSynchronizationTask)init
{
  _TtC4Maps47NavigationAlertsOnlyOverrideSynchronizationTask *result;

  result = (_TtC4Maps47NavigationAlertsOnlyOverrideSynchronizationTask *)_swift_stdlib_reportUnimplementedInitializer("Maps.NavigationAlertsOnlyOverrideSynchronizationTask", 52, "init()", 6, 0);
  __break(1u);
  return result;
}

+ (int64_t)creationPreference
{
  return 1;
}

- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  _TtC4Maps47NavigationAlertsOnlyOverrideSynchronizationTask *v12;
  uint64_t v13;
  id v14;
  _TtC4Maps47NavigationAlertsOnlyOverrideSynchronizationTask *v15;

  if (a5)
  {
    v8 = objc_opt_self(NavigationSession);
    v9 = swift_dynamicCastObjCClass(a5, v8);
    if (v9)
    {
      v10 = (void *)v9;
      v11 = a3;
      swift_unknownObjectRetain(a4);
      v12 = self;
      swift_unknownObjectRetain(a5);
      sub_10003C0B0(v10);

LABEL_7:
      swift_unknownObjectRelease(a4);
      swift_unknownObjectRelease(a5);

      return;
    }
  }
  if (a4)
  {
    v13 = objc_opt_self(NavigationSession);
    if (swift_dynamicCastObjCClass(a4, v13))
    {
      v14 = a3;
      swift_unknownObjectRetain(a4);
      v15 = self;
      swift_unknownObjectRetain(a5);
      sub_10003BBFC();

      goto LABEL_7;
    }
  }
}

@end
