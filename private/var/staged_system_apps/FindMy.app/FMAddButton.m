@implementation FMAddButton

- (_TtC6FindMy11FMAddButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1001DDBBC();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitButton;
}

- (NSString)accessibilityLabel
{
  void *v2;
  _TtC6FindMy11FMAddButton *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSString v8;

  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy11FMAddButton_titleLabel);
  v3 = self;
  v4 = objc_msgSend(v2, "text");
  if (v4)
  {
    v5 = v4;
    static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
    v7 = v6;

    v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {

    v8 = 0;
  }
  return (NSString *)v8;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  _TtC6FindMy11FMAddButton *v5;

  v4 = a3;
  v5 = self;
  sub_1001DD4DC();

}

- (void)layoutSubviews
{
  _TtC6FindMy11FMAddButton *v2;

  v2 = self;
  sub_1001DD728();

}

- (_TtC6FindMy11FMAddButton)initWithFrame:(CGRect)a3
{
  _TtC6FindMy11FMAddButton *result;

  result = (_TtC6FindMy11FMAddButton *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMAddButton", 18, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy11FMAddButton_iconViewLeadingConstraint));
}

@end
