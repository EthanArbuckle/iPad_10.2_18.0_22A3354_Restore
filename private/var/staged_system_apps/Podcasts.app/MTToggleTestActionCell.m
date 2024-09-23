@implementation MTToggleTestActionCell

- (_TtC8Podcasts22MTToggleTestActionCell)initWithCoder:(id)a3
{
  id v4;
  _TtC8Podcasts22MTToggleTestActionCell *result;

  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8Podcasts22MTToggleTestActionCell_switchView) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8Podcasts22MTToggleTestActionCell_toggleAction) = 0;
  v4 = a3;

  result = (_TtC8Podcasts22MTToggleTestActionCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0x726F707075736E55, 0xEB00000000646574, "Podcasts/MTTestActionListViewController.swift", 45, 2, 138, 0);
  __break(1u);
  return result;
}

- (_TtC8Podcasts22MTToggleTestActionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (_TtC8Podcasts22MTToggleTestActionCell *)sub_1001B0200(a3, (uint64_t)a4, v6);
}

- (void)prepareForReuse
{
  _TtC8Podcasts22MTToggleTestActionCell *v2;

  v2 = self;
  sub_1001B02F0();

}

- (void)switchActionWithSender:(id)a3
{
  _TtC8Podcasts22MTToggleTestActionCell *v5;
  uint64_t v6;
  _TtC8Podcasts22MTToggleTestActionCell *v7;
  _OWORD v8[2];

  if (a3)
  {
    v5 = self;
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v8, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v7 = self;
  }
  sub_1001B05F4();

  sub_1000485DC((uint64_t)v8);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Podcasts22MTToggleTestActionCell_switchView));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC8Podcasts22MTToggleTestActionCell_toggleAction));
}

@end
