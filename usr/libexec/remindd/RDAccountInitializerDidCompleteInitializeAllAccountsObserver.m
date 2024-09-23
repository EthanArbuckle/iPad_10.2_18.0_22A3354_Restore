@implementation RDAccountInitializerDidCompleteInitializeAllAccountsObserver

- (RDAccountInitializerDidCompleteInitializeAllAccountsObserver)initWithHandler:(id)a3 queue:(id)a4
{
  void *v6;
  uint64_t v7;
  void (**v8)();
  id v9;
  objc_super v11;

  v6 = _Block_copy(a3);
  v7 = swift_allocObject(&unk_1007F1C30, 24, 7);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = (void (**)())((char *)self + OBJC_IVAR___RDAccountInitializerDidCompleteInitializeAllAccountsObserver_handler);
  *v8 = sub_1003B01E8;
  v8[1] = (void (*)())v7;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___RDAccountInitializerDidCompleteInitializeAllAccountsObserver_queue) = (Class)a4;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for RDAccountInitializer.DidCompleteInitializeAllAccountsObserver();
  v9 = a4;
  return -[RDAccountInitializerDidCompleteInitializeAllAccountsObserver init](&v11, "init");
}

- (void)observe
{
  void *v3;
  RDAccountInitializerDidCompleteInitializeAllAccountsObserver *v4;
  id v5;
  id v6;

  v3 = (void *)objc_opt_self(NSNotificationCenter);
  v4 = self;
  v5 = objc_msgSend(v3, "defaultCenter");
  v6 = v5;
  if (qword_1008373B0 != -1)
  {
    swift_once(&qword_1008373B0, sub_1003AAB88);
    v5 = v6;
  }
  objc_msgSend(v5, "addObserver:selector:name:object:", v4, "didCompleteInitializeAllAccounts:", qword_100871EC0, 0);

}

- (void)unobserve
{
  void *v3;
  RDAccountInitializerDidCompleteInitializeAllAccountsObserver *v4;
  id v5;
  id v6;

  v3 = (void *)objc_opt_self(NSNotificationCenter);
  v4 = self;
  v5 = objc_msgSend(v3, "defaultCenter");
  v6 = v5;
  if (qword_1008373B0 != -1)
  {
    swift_once(&qword_1008373B0, sub_1003AAB88);
    v5 = v6;
  }
  objc_msgSend(v5, "removeObserver:name:object:", v4, qword_100871EC0, 0);

}

- (void)didCompleteInitializeAllAccounts:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  __n128 v7;
  uint64_t v8;
  char *v9;
  RDAccountInitializerDidCompleteInitializeAllAccountsObserver *v10;
  uint64_t v11;

  v5 = type metadata accessor for Notification(0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = __chkstk_darwin(v5);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  v10 = self;
  sub_1003AAEA0((uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
}

- (RDAccountInitializerDidCompleteInitializeAllAccountsObserver)init
{
  RDAccountInitializerDidCompleteInitializeAllAccountsObserver *result;

  result = (RDAccountInitializerDidCompleteInitializeAllAccountsObserver *)_swift_stdlib_reportUnimplementedInitializer("remindd.DidCompleteInitializeAllAccountsObserver", 48, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(_QWORD *)&self->handler[OBJC_IVAR___RDAccountInitializerDidCompleteInitializeAllAccountsObserver_handler]);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___RDAccountInitializerDidCompleteInitializeAllAccountsObserver_queue));
}

@end
