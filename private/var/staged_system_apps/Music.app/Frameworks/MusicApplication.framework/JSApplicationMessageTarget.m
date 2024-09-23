@implementation JSApplicationMessageTarget

- (NSString)targetIdentifier
{
  char *v2;
  uint64_t v3;
  NSString v4;
  _BYTE v6[24];

  v2 = (char *)self + OBJC_IVAR____TtC11MusicJSCore26JSApplicationMessageTarget_targetIdentifier;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC11MusicJSCore26JSApplicationMessageTarget_targetIdentifier, v6, 0, 0);
  v3 = *((_QWORD *)v2 + 1);
  swift_bridgeObjectRetain();
  v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  return (NSString *)v4;
}

- (void)setTargetIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  _TtC11MusicJSCore26JSApplicationMessageTarget *v10;
  char v11[24];

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC11MusicJSCore26JSApplicationMessageTarget_targetIdentifier);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC11MusicJSCore26JSApplicationMessageTarget_targetIdentifier, v11, 1, 0);
  v8 = *v7;
  v9 = v7[1];
  *v7 = v4;
  v7[1] = v6;
  v10 = self;
  sub_EFDAE4(v8, v9);

  swift_bridgeObjectRelease();
}

- (void)messageCoordinator:(id)a3 didUpdatePriorityMessage:(id)a4 forTarget:(id)a5
{
  id v7;
  id v8;
  _TtC11MusicJSCore26JSApplicationMessageTarget *v9;

  v7 = a3;
  v8 = a4;
  v9 = self;
  sub_F01518(a4);

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore26JSApplicationMessageTarget_targetIdentifier]);
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC11MusicJSCore26JSApplicationMessageTarget_priorityMessage));
}

@end
