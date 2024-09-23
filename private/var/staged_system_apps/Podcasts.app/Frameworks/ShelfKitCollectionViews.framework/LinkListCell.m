@implementation LinkListCell

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v4 = a3;
  v5 = v6.receiver;
  -[LinkListCell traitCollectionDidChange:](&v6, "traitCollectionDidChange:", v4);
  sub_1D9F0C();
  objc_msgSend(v5, "setNeedsUpdateConstraints", v6.receiver, v6.super_class);

}

- (void)updateConstraints
{
  _TtC23ShelfKitCollectionViews12LinkListCell *v2;

  v2 = self;
  sub_1DB31C();

}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC23ShelfKitCollectionViews12LinkListCell *v9;
  uint64_t v10;

  v5 = type metadata accessor for UICellConfigurationState(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_1DB73C();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (_TtC23ShelfKitCollectionViews12LinkListCell)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews12LinkListCell *)sub_1DBA28(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews12LinkListCell)initWithCoder:(id)a3
{
  return (_TtC23ShelfKitCollectionViews12LinkListCell *)sub_1DBB80(a3);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews12LinkListCell_objectGraph));
  v3 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews12LinkListCell_config;
  v4 = type metadata accessor for UIListContentConfiguration(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease(*(_QWORD *)&self->objectGraph[OBJC_IVAR____TtC23ShelfKitCollectionViews12LinkListCell_accessoryText]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews12LinkListCell_leadingSeparatorConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews12LinkListCell_trailingSeparatorConstraint));
  swift_release(*(_QWORD *)&self->objectGraph[OBJC_IVAR____TtC23ShelfKitCollectionViews12LinkListCell_deletionUITriggered]);
}

@end
