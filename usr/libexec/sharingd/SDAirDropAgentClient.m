@implementation SDAirDropAgentClient

- (OS_nw_agent_client)client
{
  return (OS_nw_agent_client *)objc_autoreleaseReturnValue((id)swift_unknownObjectRetain(*(Class *)((char *)&self->super.isa
                                                                                                  + OBJC_IVAR____TtC16DaemoniOSLibrary20SDAirDropAgentClient_client)));
}

- (NSUUID)id
{
  return (NSUUID *)UUID._bridgeToObjectiveC()().super.isa;
}

- (NSString)bundleID
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->client[OBJC_IVAR____TtC16DaemoniOSLibrary20SDAirDropAgentClient_bundleID];
  swift_bridgeObjectRetain(v2);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (int)pid
{
  return *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary20SDAirDropAgentClient_pid);
}

- (NSDate)startTime
{
  return (NSDate *)Date._bridgeToObjectiveC()().super.isa;
}

- (id)browseResponse
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD v6[5];
  uint64_t v7;

  v2 = *(_QWORD *)&self->client[OBJC_IVAR____TtC16DaemoniOSLibrary20SDAirDropAgentClient_browseResponse];
  v6[4] = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16DaemoniOSLibrary20SDAirDropAgentClient_browseResponse);
  v7 = v2;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 1107296256;
  v6[2] = sub_100424770;
  v6[3] = &unk_10072EC70;
  v3 = _Block_copy(v6);
  v4 = v7;
  swift_retain();
  swift_release(v4);
  return v3;
}

- (_TtC16DaemoniOSLibrary20SDAirDropAgentClient)init
{
  _TtC16DaemoniOSLibrary20SDAirDropAgentClient *result;

  result = (_TtC16DaemoniOSLibrary20SDAirDropAgentClient *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "DaemoniOSLibrary/SDAirDropAgentClient.swift", 43, 2, 40, 0);
  __break(1u);
  return result;
}

- (_TtC16DaemoniOSLibrary20SDAirDropAgentClient)initWithClient:(id)a3 browseDescriptor:(id)a4 browseResponse:(id)a5
{
  void *v7;
  uint64_t v8;
  _TtC16DaemoniOSLibrary20SDAirDropAgentClient *v9;

  v7 = _Block_copy(a5);
  v8 = swift_allocObject(&unk_10072EC58, 24, 7);
  *(_QWORD *)(v8 + 16) = v7;
  swift_unknownObjectRetain(a3);
  swift_unknownObjectRetain(a4);
  v9 = (_TtC16DaemoniOSLibrary20SDAirDropAgentClient *)sub_10053AA48((uint64_t)a3, (uint64_t)a4, (uint64_t)sub_1003805C8, v8);
  swift_unknownObjectRelease(a3);
  swift_unknownObjectRelease(a4);
  swift_release(v8);
  return v9;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC16DaemoniOSLibrary20SDAirDropAgentClient_client));
  v3 = (char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary20SDAirDropAgentClient_id;
  v4 = type metadata accessor for UUID(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease(*(_QWORD *)&self->client[OBJC_IVAR____TtC16DaemoniOSLibrary20SDAirDropAgentClient_bundleID]);
  v5 = (char *)self + OBJC_IVAR____TtC16DaemoniOSLibrary20SDAirDropAgentClient_startTime;
  v6 = type metadata accessor for Date(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_release(*(_QWORD *)&self->client[OBJC_IVAR____TtC16DaemoniOSLibrary20SDAirDropAgentClient_browseResponse]);
}

@end
