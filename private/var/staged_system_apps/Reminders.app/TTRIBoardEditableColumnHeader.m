@implementation TTRIBoardEditableColumnHeader

+ (Class)containerViewClass
{
  uint64_t v2;

  v2 = type metadata accessor for TTRNoAnimationContainerStackView(0, a2);
  return (Class)swift_getObjCClassFromMetadata(v2);
}

- (_TtC9Reminders29TTRIBoardEditableColumnHeader)initWithFrame:(CGRect)a3
{
  return (_TtC9Reminders29TTRIBoardEditableColumnHeader *)sub_100506388(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)self, (uint64_t)a2);
}

- (_TtC9Reminders29TTRIBoardEditableColumnHeader)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = a3;
  return (_TtC9Reminders29TTRIBoardEditableColumnHeader *)sub_100506734(v3, v4);
}

- (void)prepareForReuse
{
  uint64_t v2;
  _TtC9Reminders29TTRIBoardEditableColumnHeader *v3;

  v3 = self;
  sub_1005068B0((uint64_t)v3, v2);

}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC9Reminders29TTRIBoardEditableColumnHeader *v9;
  uint64_t v10;
  uint64_t v11;

  v5 = type metadata accessor for UICellConfigurationState(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_100506A60((uint64_t)v8, v10);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)invalidateIntrinsicContentSize
{
  _TtC9Reminders29TTRIBoardEditableColumnHeader *v2;

  v2 = self;
  sub_100506CA0();

}

- (void)layoutSubviews
{
  _TtC9Reminders29TTRIBoardEditableColumnHeader *v2;

  v2 = self;
  sub_100506E08();

}

- (void).cxx_destruct
{
  swift_release();
  sub_1000381C8((uint64_t)&self->NUICollectionViewContainerCell_opaque[OBJC_IVAR____TtC9Reminders29TTRIBoardEditableColumnHeader_delegate]);
  sub_1000381C8((uint64_t)&self->NUICollectionViewContainerCell_opaque[OBJC_IVAR____TtC9Reminders29TTRIBoardEditableColumnHeader_dragInteractionHandler]);

  sub_1000073A0((uint64_t)&self->NUICollectionViewContainerCell_opaque[OBJC_IVAR____TtC9Reminders29TTRIBoardEditableColumnHeader_nameModule], (uint64_t *)&unk_1006653B0);
}

@end
