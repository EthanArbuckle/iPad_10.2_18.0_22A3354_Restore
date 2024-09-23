@implementation MLHostAPSListener

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v6;
  _TtC7mlhostd17MLHostAPSListener *v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  _TtC7mlhostd17MLHostAPSListener *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;

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
  if (qword_100050F28 != -1)
    swift_once(&qword_100050F28, sub_10001E040);
  v14 = type metadata accessor for Logger(0);
  v15 = sub_10000A8E8(v14, (uint64_t)qword_100052B80);
  v16 = Logger.logObject.getter(v15);
  v17 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "Received public push token", v18, 2u);
    swift_slowDealloc(v18, -1, -1);
  }

  sub_10000AB44(v9, v11);
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v6;
  id v7;
  _TtC7mlhostd17MLHostAPSListener *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_100009C20(a4);

}

- (_TtC7mlhostd17MLHostAPSListener)init
{
  objc_class *ObjectType;
  _QWORD *v4;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7mlhostd17MLHostAPSListener_handleMessage);
  *v4 = nullsub_1;
  v4[1] = 0;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return -[MLHostAPSListener init](&v6, "init");
}

- (void).cxx_destruct
{
  swift_release(*(_QWORD *)&self->handleMessage[OBJC_IVAR____TtC7mlhostd17MLHostAPSListener_handleMessage]);
}

@end
