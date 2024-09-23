@implementation VirtualEventService

- (_TtC14dockaccessoryd19VirtualEventService)init
{
  return (_TtC14dockaccessoryd19VirtualEventService *)sub_1001A2118();
}

- (void)dealloc
{
  void *v2;
  _TtC14dockaccessoryd19VirtualEventService *v3;
  objc_super v4;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14dockaccessoryd19VirtualEventService_eventService);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14dockaccessoryd19VirtualEventService_eventService) = 0;
  v3 = self;

  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for VirtualEventService(0);
  -[VirtualEventService dealloc](&v4, "dealloc");
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC14dockaccessoryd19VirtualEventService_logger;
  v4 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC14dockaccessoryd19VirtualEventService_properties));

}

- (BOOL)setProperty:(id)a3 forKey:(id)a4 forService:(id)a5
{
  id v8;
  _TtC14dockaccessoryd19VirtualEventService *v9;
  _TtC14dockaccessoryd19VirtualEventService *v10;
  _QWORD v12[4];
  _OWORD v13[2];

  if (a3)
  {
    v8 = a4;
    swift_unknownObjectRetain(a5);
    v9 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v13);

    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v13, 0, sizeof(v13));
    swift_unknownObjectRetain(a5);
    v10 = self;
  }
  _bridgeAnyObjectToAny(_:)(v12);

  swift_unknownObjectRelease(a5);
  sub_100090E88(v12);
  sub_1000BF88C((uint64_t)v13);
  return 0;
}

- (id)propertyForKey:(id)a3 forService:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _TtC14dockaccessoryd19VirtualEventService *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void *v15;
  _QWORD v17[4];
  __int128 v18;
  uint64_t v19;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v8 = v7;
  swift_unknownObjectRetain(a4);
  v9 = self;
  _bridgeAnyObjectToAny(_:)(v17);
  swift_unknownObjectRelease(a4);
  sub_1001A29C4(v6, v8, &v18);

  swift_bridgeObjectRelease(v8);
  sub_100090E88(v17);
  v10 = v19;
  if (!v19)
    return 0;
  v11 = sub_10009B038(&v18, v19);
  v12 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v12 + 16))(v14);
  v15 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v14, v10);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v10);
  sub_100090E88(&v18);
  return v15;
}

- (id)copyEventMatching:(id)a3 forService:(id)a4
{
  uint64_t v6;
  _TtC14dockaccessoryd19VirtualEventService *v7;
  _QWORD v9[4];

  if (a3)
    v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  else
    v6 = 0;
  swift_unknownObjectRetain(a4);
  v7 = self;
  _bridgeAnyObjectToAny(_:)(v9);

  swift_bridgeObjectRelease(v6);
  swift_unknownObjectRelease(a4);
  sub_100090E88(v9);
  return 0;
}

- (BOOL)setOutputEvent:(id)a3 forService:(id)a4
{
  id v6;
  _TtC14dockaccessoryd19VirtualEventService *v7;
  _QWORD v9[4];

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v7 = self;
  _bridgeAnyObjectToAny(_:)(v9);

  swift_unknownObjectRelease(a4);
  sub_100090E88(v9);
  return 0;
}

- (void)notification:(int64_t)a3 withProperty:(id)a4 forService:(id)a5
{
  uint64_t v8;
  _TtC14dockaccessoryd19VirtualEventService *v9;
  _QWORD v10[4];

  if (a4)
    v8 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  else
    v8 = 0;
  swift_unknownObjectRetain(a5);
  v9 = self;
  _bridgeAnyObjectToAny(_:)(v10);
  swift_unknownObjectRelease(a5);
  sub_1001A2DDC(a3);

  swift_bridgeObjectRelease(v8);
  sub_100090E88(v10);
}

@end
