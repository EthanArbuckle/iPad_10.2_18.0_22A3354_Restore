@implementation EnvironmentMonitorObserver

- (_TtC9MusicCore26EnvironmentMonitorObserver)init
{
  return (_TtC9MusicCore26EnvironmentMonitorObserver *)EnvironmentMonitorObserver.init()();
}

- (void)dealloc
{
  objc_class *ObjectType;
  void *v4;
  _TtC9MusicCore26EnvironmentMonitorObserver *v5;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType(self);
  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9MusicCore26EnvironmentMonitorObserver_environmentMonitor);
  v5 = self;
  objc_msgSend(v4, "unregisterObserver:", v5);
  v6.receiver = v5;
  v6.super_class = ObjectType;
  -[EnvironmentMonitorObserver dealloc](&v6, "dealloc");
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;

  v3 = (char *)self + OBJC_IVAR____TtC9MusicCore26EnvironmentMonitorObserver__networkType;
  v4 = sub_10000B4C8(&qword_100555C58);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC9MusicCore26EnvironmentMonitorObserver__isNetworkConstrained;
  v6 = sub_10000B4C8(&qword_1005521E0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC9MusicCore26EnvironmentMonitorObserver__thermalLevel;
  v8 = sub_10000B4C8(&qword_100555C78);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9MusicCore26EnvironmentMonitorObserver_environmentMonitor));
}

- (void)environmentMonitorDidChangeNetworkReachability:(id)a3
{
  sub_1002900C0(self, (uint64_t)a2, a3, (uint64_t)&unk_100514578, (uint64_t)&unk_100555D88);
}

- (void)environmentMonitorDidChangeNetworkType:(id)a3
{
  sub_1002900C0(self, (uint64_t)a2, a3, (uint64_t)&unk_100514550, (uint64_t)&unk_100555D80);
}

- (void)environmentMonitorDidChangeThermalLevel:(id)a3
{
  sub_1002900C0(self, (uint64_t)a2, a3, (uint64_t)&unk_100514528, (uint64_t)&unk_100555D78);
}

@end
