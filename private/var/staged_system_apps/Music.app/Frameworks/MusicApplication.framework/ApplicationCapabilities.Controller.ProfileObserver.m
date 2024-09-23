@implementation ApplicationCapabilities.Controller.ProfileObserver

- (_TtCCV9MusicCore23ApplicationCapabilities10ControllerP33_3C92A9FA31E0FE3D8D536795352BB0D115ProfileObserver)init
{
  _TtCCV9MusicCore23ApplicationCapabilities10ControllerP33_3C92A9FA31E0FE3D8D536795352BB0D115ProfileObserver *v3;
  void *v4;
  _TtCCV9MusicCore23ApplicationCapabilities10ControllerP33_3C92A9FA31E0FE3D8D536795352BB0D115ProfileObserver *v5;
  _TtCCV9MusicCore23ApplicationCapabilities10ControllerP33_3C92A9FA31E0FE3D8D536795352BB0D115ProfileObserver *result;
  _TtCCV9MusicCore23ApplicationCapabilities10ControllerP33_3C92A9FA31E0FE3D8D536795352BB0D115ProfileObserver *v7;
  objc_super v8;

  swift_weakInit((char *)self+ OBJC_IVAR____TtCCV9MusicCore23ApplicationCapabilities10ControllerP33_3C92A9FA31E0FE3D8D536795352BB0D115ProfileObserver_controller);
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ApplicationCapabilities.Controller.ProfileObserver();
  v3 = -[ApplicationCapabilities.Controller.ProfileObserver init](&v8, "init");
  v4 = (void *)objc_opt_self(MCProfileConnection);
  v5 = v3;
  result = (_TtCCV9MusicCore23ApplicationCapabilities10ControllerP33_3C92A9FA31E0FE3D8D536795352BB0D115ProfileObserver *)objc_msgSend(v4, "sharedConnection");
  if (result)
  {
    v7 = result;
    -[ApplicationCapabilities.Controller.ProfileObserver registerObserver:](result, "registerObserver:", v5);

    return v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)dealloc
{
  void *v3;
  _TtCCV9MusicCore23ApplicationCapabilities10ControllerP33_3C92A9FA31E0FE3D8D536795352BB0D115ProfileObserver *v4;
  id v5;
  void *v6;
  objc_super v7;

  v3 = (void *)objc_opt_self(MCProfileConnection);
  v4 = self;
  v5 = objc_msgSend(v3, "sharedConnection");
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, "unregisterObserver:", v4);

    v7.receiver = v4;
    v7.super_class = (Class)type metadata accessor for ApplicationCapabilities.Controller.ProfileObserver();
    -[ApplicationCapabilities.Controller.ProfileObserver dealloc](&v7, "dealloc");
  }
  else
  {
    __break(1u);
  }
}

- (void).cxx_destruct
{
  swift_weakDestroy((char *)self+ OBJC_IVAR____TtCCV9MusicCore23ApplicationCapabilities10ControllerP33_3C92A9FA31E0FE3D8D536795352BB0D115ProfileObserver_controller);
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  sub_C4485C((char *)self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))sub_C47F20);
}

- (void)profileConnectionDidReceiveRestrictionChangedNotification:(id)a3 userInfo:(id)a4
{
  sub_C4485C((char *)self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))sub_C47F20);
}

- (void)profileConnectionDidReceiveProfileListChangedNotification:(id)a3 userInfo:(id)a4
{
  sub_C4485C((char *)self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(void))sub_C47F20);
}

@end
