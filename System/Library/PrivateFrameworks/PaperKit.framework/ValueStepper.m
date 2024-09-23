@implementation ValueStepper

- (_TtC8PaperKit12ValueStepper)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized ValueStepper.init(coder:)();
}

- (void)didTapLeftButton
{
  _TtC8PaperKit12ValueStepper *v2;

  v2 = self;
  ValueStepper.didTapLeftButton()();

}

- (void)didTapRightButton
{
  _TtC8PaperKit12ValueStepper *v2;

  v2 = self;
  ValueStepper.didTapRightButton()();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v4 = a3;
  v5 = v6.receiver;
  -[ValueStepper traitCollectionDidChange:](&v6, sel_traitCollectionDidChange_, v4);
  ValueStepper.updateUI()();

}

- (_TtC8PaperKit12ValueStepper)initWithFrame:(CGRect)a3
{
  _TtC8PaperKit12ValueStepper *result;

  result = (_TtC8PaperKit12ValueStepper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit12ValueStepper_decreaseButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit12ValueStepper_increaseButton));

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit12ValueStepper_contentStackView));
  swift_bridgeObjectRelease();
}

@end
