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
  v4 = sub_1000057B4(&qword_1004C2CB8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC9MusicCore26EnvironmentMonitorObserver__isNetworkConstrained;
  v6 = sub_1000057B4(&qword_1004BF240);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC9MusicCore26EnvironmentMonitorObserver__thermalLevel;
  v8 = sub_1000057B4(&qword_1004C2CD8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9MusicCore26EnvironmentMonitorObserver_environmentMonitor));
}

- (void)environmentMonitorDidChangeNetworkReachability:(id)a3
{
  sub_10020F3E4(self, (uint64_t)a2, a3, (uint64_t)&unk_10047EF30, (uint64_t)&unk_1004C2DE8);
}

- (void)environmentMonitorDidChangeNetworkType:(id)a3
{
  sub_10020F3E4(self, (uint64_t)a2, a3, (uint64_t)&unk_10047EF08, (uint64_t)&unk_1004C2DE0);
}

- (void)environmentMonitorDidChangeThermalLevel:(id)a3
{
  sub_10020F3E4(self, (uint64_t)a2, a3, (uint64_t)&unk_10047EEE0, (uint64_t)&unk_1004C2DD8);
}

@end
