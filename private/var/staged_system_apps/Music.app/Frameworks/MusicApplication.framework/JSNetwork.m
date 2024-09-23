@implementation JSNetwork

- (void)dealloc
{
  objc_class *ObjectType;
  void *v4;
  _TtC11MusicJSCore9JSNetwork *v5;
  id v6;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (void *)objc_opt_self(ICEnvironmentMonitor);
  v5 = self;
  v6 = objc_msgSend(v4, "sharedMonitor");
  objc_msgSend(v6, "unregisterObserver:", v5);

  v7.receiver = v5;
  v7.super_class = ObjectType;
  -[JSObject dealloc](&v7, "dealloc");
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore9JSNetwork_operatorName]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore9JSNetwork_connectionTypeHeader]);
}

- (void)environmentMonitorDidChangeNetworkType:(id)a3
{
  sub_F98168(self, (uint64_t)a2, a3, (uint64_t)&unk_13DCAE0, (uint64_t (*)(void))sub_F985E8);
}

- (void)environmentMonitorDidChangeTelephonyStatus:(id)a3
{
  sub_F98168(self, (uint64_t)a2, a3, (uint64_t)&unk_13DCAB8, (uint64_t (*)(void))sub_F985E4);
}

@end
