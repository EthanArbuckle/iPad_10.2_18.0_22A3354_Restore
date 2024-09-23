@implementation TPSNetworkPathMonitor

+ (TPSNetworkPathMonitor)sharedMonitor
{
  if (qword_1ED03D1D8 != -1)
    swift_once();
  return (TPSNetworkPathMonitor *)(id)qword_1ED03D330;
}

- (void)addObserverForKey:(id)a3 using:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  TPSNetworkPathMonitor *v12;
  uint64_t v13;

  v6 = sub_19A990B0C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78]();
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  sub_19A990AF4();
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v10;
  v12 = self;
  NetworkMonitorProxy.addObserver(for:using:)((uint64_t)v9, (uint64_t)sub_19A968128, v11);

  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)stop
{
  TPSNetworkPathMonitor *v2;

  v2 = self;
  NetworkMonitorProxy.stop()();

}

- (void)start
{
  TPSNetworkPathMonitor *v2;

  v2 = self;
  NetworkMonitorProxy.start()();

}

- (void)removeObserverForKey:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  TPSNetworkPathMonitor *v8;
  uint64_t v9;

  v4 = sub_19A990B0C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_19A990AF4();
  v8 = self;
  NetworkMonitorProxy.removeObserver(_:)((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

+ (BOOL)isNetworkError:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v10;
  id v12;

  v3 = a3;
  v4 = objc_msgSend(v3, sel_domain);
  v5 = sub_19A990D58();
  v7 = v6;

  if (v5 == sub_19A990D58() && v7 == v8)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v10 = sub_19A991298();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v10 & 1) == 0)
    {

      return 0;
    }
  }
  v12 = objc_msgSend(v3, sel_code);

  return v12 == (id)-1009;
}

- (TPSNetworkPathMonitor)init
{
  TPSNetworkPathMonitor *result;

  result = (TPSNetworkPathMonitor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
}

@end
