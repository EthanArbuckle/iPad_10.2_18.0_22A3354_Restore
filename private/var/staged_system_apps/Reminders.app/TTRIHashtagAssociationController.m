@implementation TTRIHashtagAssociationController

- (void)renameTagAlertTextFieldDidChange:(id)a3
{
  _TtC9Reminders32TTRIHashtagAssociationController *v5;
  _TtC9Reminders32TTRIHashtagAssociationController *v6;
  _OWORD v7[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v7);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v7, 0, sizeof(v7));
    v6 = self;
  }
  sub_100107238((uint64_t)v7);

  sub_10002CAA0((uint64_t)v7);
}

- (_TtC9Reminders32TTRIHashtagAssociationController)init
{
  _TtC9Reminders32TTRIHashtagAssociationController *result;

  result = (_TtC9Reminders32TTRIHashtagAssociationController *)_swift_stdlib_reportUnimplementedInitializer("Reminders.TTRIHashtagAssociationController", 42, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC9Reminders32TTRIHashtagAssociationController_presenter));
}

@end
