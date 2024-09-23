@implementation KeyCommandCenter

- (void)handleKeyCommandWithSender:(id)a3
{
  _TtC5TeaUI16KeyCommandCenter *v4;
  _BYTE v5[32];

  swift_unknownObjectRetain();
  v4 = self;
  sub_1B16BA3AC();
  swift_unknownObjectRelease();
  KeyCommandCenter.handleKeyCommand(sender:)((uint64_t)v5);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  _TtC5TeaUI16KeyCommandCenter *v5;
  _TtC5TeaUI16KeyCommandCenter *v6;
  char v7;
  _OWORD v9[2];

  if (a4)
  {
    v5 = self;
    swift_unknownObjectRetain();
    sub_1B16BA3AC();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v9, 0, sizeof(v9));
    v6 = self;
  }
  v7 = KeyCommandCenter.canPerformAction(_:withSender:)();

  sub_1B1406294((uint64_t)v9, (unint64_t *)&qword_1ED188590);
  return v7 & 1;
}

- (_TtC5TeaUI16KeyCommandCenter)init
{
  KeyCommandCenter.init()();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B13E418C((uint64_t)self + OBJC_IVAR____TtC5TeaUI16KeyCommandCenter_stagedTracker);
}

@end
