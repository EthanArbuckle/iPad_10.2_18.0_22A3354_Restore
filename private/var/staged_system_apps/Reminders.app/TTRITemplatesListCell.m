@implementation TTRITemplatesListCell

- (UICellConfigurationState)_bridgedConfigurationState
{
  objc_class *ObjectType;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _TtC9Reminders21TTRITemplatesListCell *v11;
  UICellConfigurationState *v12;
  uint64_t v13;
  Class isa;
  _BYTE v17[24];
  objc_super v18;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v4 = sub_10002A750(&qword_1006582E0);
  __chkstk_darwin(v4);
  v6 = &v17[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v7 = type metadata accessor for UICellConfigurationState(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = &v17[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v18.receiver = self;
  v18.super_class = ObjectType;
  v11 = self;
  v12 = -[TTRITemplatesListCell _bridgedConfigurationState](&v18, "_bridgedConfigurationState");
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)(v12);

  v13 = (uint64_t)v11 + OBJC_IVAR____TtC9Reminders21TTRITemplatesListCell_viewModel;
  swift_beginAccess((char *)v11 + OBJC_IVAR____TtC9Reminders21TTRITemplatesListCell_viewModel, v17, 0, 0);
  sub_100266D04(v13, (uint64_t)v6);
  sub_100376160((uint64_t)v6);

  isa = UICellConfigurationState._bridgeToObjectiveC()().super.super.isa;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return (UICellConfigurationState *)isa;
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC9Reminders21TTRITemplatesListCell *v9;
  uint64_t v10;

  v5 = type metadata accessor for UICellConfigurationState(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_100376310((uint64_t)v8);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (NSArray)accessibilityElements
{
  return (NSArray *)0;
}

- (NSString)accessibilityLabel
{
  _TtC9Reminders21TTRITemplatesListCell *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_100377BC0();
  v4 = v3;

  if (v4)
  {
    v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (NSArray)accessibilityCustomActions
{
  _TtC9Reminders21TTRITemplatesListCell *v2;
  uint64_t v3;
  unint64_t v4;
  NSArray v5;

  v2 = self;
  v4 = sub_100378010((uint64_t)v2, v3);

  if (v4)
  {
    sub_100005ED8(0, (unint64_t *)&unk_1006466C0, UIAccessibilityCustomAction_ptr);
    v5.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v4);
  }
  else
  {
    v5.super.isa = 0;
  }
  return (NSArray *)v5.super.isa;
}

- (void)setAccessibilityCustomActions:(id)isa
{
  objc_class *ObjectType;
  uint64_t v6;
  uint64_t v7;
  _TtC9Reminders21TTRITemplatesListCell *v8;
  double v9;
  _TtC9Reminders21TTRITemplatesListCell *v10;
  objc_super v11;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  if (isa)
  {
    v6 = sub_100005ED8(0, (unint64_t *)&unk_1006466C0, UIAccessibilityCustomAction_ptr);
    v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(isa, v6);
    v8 = self;
    isa = Array._bridgeToObjectiveC()().super.isa;
    *(_QWORD *)&v9 = swift_bridgeObjectRelease(v7).n128_u64[0];
  }
  else
  {
    v10 = self;
  }
  v11.receiver = self;
  v11.super_class = ObjectType;
  -[TTRITemplatesListCell setAccessibilityCustomActions:](&v11, "setAccessibilityCustomActions:", isa, v9);

}

- (_TtC9Reminders21TTRITemplatesListCell)initWithFrame:(CGRect)a3
{
  return (_TtC9Reminders21TTRITemplatesListCell *)sub_10037837C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)self, (uint64_t)a2);
}

- (_TtC9Reminders21TTRITemplatesListCell)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = a3;
  return (_TtC9Reminders21TTRITemplatesListCell *)sub_10037849C(v3, v4);
}

- (void).cxx_destruct
{
  sub_1000073A0((uint64_t)self + OBJC_IVAR____TtC9Reminders21TTRITemplatesListCell_viewModel, &qword_1006582E0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders21TTRITemplatesListCell_listContentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders21TTRITemplatesListCell_badgeContainerView));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC9Reminders21TTRITemplatesListCell_badgeViewConstraints));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders21TTRITemplatesListCell_separatorConstraint));
  sub_1000381B8(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC9Reminders21TTRITemplatesListCell_infoButtonMenuProvider), *(_QWORD *)&self->listContentView[OBJC_IVAR____TtC9Reminders21TTRITemplatesListCell_infoButtonMenuProvider]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders21TTRITemplatesListCell____lazy_storage___infoButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders21TTRITemplatesListCell____lazy_storage___placeholderImageForBadge));
}

@end
