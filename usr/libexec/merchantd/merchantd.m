int main(int argc, const char **argv, const char **envp)
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  int result;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  void **v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;

  v3 = (void *)objc_opt_self(NSNotificationCenter, argv, envp);
  v4 = objc_msgSend(v3, "defaultCenter");
  v18 = sub_100003750;
  v19 = 0;
  v14 = _NSConcreteStackBlock;
  v15 = 1107296256;
  v16 = sub_100003760;
  v17 = &unk_1000040C0;
  v5 = _Block_copy(&v14);
  v6 = objc_msgSend(v4, "addObserverForName:object:queue:usingBlock:", NSCurrentLocaleDidChangeNotification, 0, 0, v5);
  _Block_release(v5);

  qword_100008028 = (uint64_t)v6;
  v7 = static Queues.main.getter();
  v18 = sub_10000381C;
  v19 = 0;
  v14 = _NSConcreteStackBlock;
  v15 = 1107296256;
  v16 = sub_10000385C;
  v17 = &unk_1000040E8;
  v8 = _Block_copy(&v14);
  swift_release(v19);
  dispatch_sync(v7, v8);

  _Block_release(v8);
  result = swift_isEscapingClosureAtFileLocation(0, &unk_100003A2F, 70, 22, 18, 1);
  if ((result & 1) == 0)
  {
    v12 = objc_msgSend((id)objc_opt_self(NSRunLoop, v10, v11), "currentRunLoop");
    objc_msgSend(v12, "run");

    v13 = objc_msgSend(v3, "defaultCenter");
    objc_msgSend(v13, "removeObserver:", qword_100008028);

    exit(0);
  }
  __break(1u);
  return result;
}

void sub_100003750()
{
  exit(0);
}

uint64_t sub_100003760(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void (*v9)(char *);
  uint64_t v11;

  v4 = type metadata accessor for Notification(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin();
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(void (**)(char *))(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a2);
  swift_retain(v8);
  v9(v7);
  swift_release(v8);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_100003804(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100003814(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

void sub_10000381C()
{
  id v0;

  type metadata accessor for Daemon(0);
  v0 = (id)static Daemon.shared.getter();
  Daemon.registerServiceListeners()();

}

uint64_t sub_10000385C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}
