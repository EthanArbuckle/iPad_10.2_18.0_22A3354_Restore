@implementation PushHelperService

- (void)dealloc
{
  _TtC13appleaccountd17PushHelperService *v2;

  v2 = self;
  sub_1001912DC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13appleaccountd17PushHelperService____lazy_storage___localQueue));

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC13appleaccountd17PushHelperService_delegates));
  swift_bridgeObjectRelease(*(_QWORD *)&self->$__lazy_storage_$_localQueue[OBJC_IVAR____TtC13appleaccountd17PushHelperService_apsEnvironment]);
  sub_1000144D8(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13appleaccountd17PushHelperService_publicToken), *(_QWORD *)&self->$__lazy_storage_$_localQueue[OBJC_IVAR____TtC13appleaccountd17PushHelperService_publicToken]);

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC13appleaccountd17PushHelperService_topics));
}

- (_TtC13appleaccountd17PushHelperService)init
{
  return (_TtC13appleaccountd17PushHelperService *)sub_1001914D4();
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v6;
  _TtC13appleaccountd17PushHelperService *v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  _TtC13appleaccountd17PushHelperService *v13;

  if (a4)
  {
    v6 = a3;
    v7 = self;
    v8 = a4;
    v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v11 = v10;

  }
  else
  {
    v12 = a3;
    v13 = self;
    v9 = 0;
    v11 = 0xF000000000000000;
  }
  sub_1001915CC((uint64_t)a3, v9, v11);
  sub_1000144D8(v9, v11);

}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v7;
  id v8;
  _TtC13appleaccountd17PushHelperService *v9;

  v7 = a3;
  v8 = a4;
  v9 = self;
  sub_10019193C((uint64_t)a3, a4);

}

- (void)connection:(id)a3 didChangeConnectedStatus:(BOOL)a4
{
  sub_100191D00(a4);
}

- (void)connectionDidReconnect:(id)a3
{
  uint64_t v4;
  _TtC13appleaccountd17PushHelperService *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  __n128 v9;
  os_log_type_t v10;
  uint8_t *v11;
  id v12;

  v4 = qword_10028ADB0;
  v12 = a3;
  v5 = self;
  if (v4 != -1)
    swift_once(&qword_10028ADB0, sub_100046CC8);
  v6 = type metadata accessor for Logger(0);
  v7 = sub_100005288(v6, (uint64_t)qword_1002A8990);
  v8 = Logger.logObject.getter(v7);
  v10 = static os_log_type_t.default.getter(v9);
  if (os_log_type_enabled(v8, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v10, "AA PushHelperService got reconnected to APS", v11, 2u);
    swift_slowDealloc(v11, -1, -1);
  }

}

@end
