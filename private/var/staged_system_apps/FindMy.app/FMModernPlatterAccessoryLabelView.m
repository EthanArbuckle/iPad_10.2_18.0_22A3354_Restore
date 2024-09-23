@implementation FMModernPlatterAccessoryLabelView

- (_TtC6FindMy33FMModernPlatterAccessoryLabelView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  objc_class *v10;
  _TtC6FindMy33FMModernPlatterAccessoryLabelView *result;

  v5 = OBJC_IVAR____TtC6FindMy33FMModernPlatterAccessoryLabelView_label;
  v6 = objc_allocWithZone((Class)UILabel);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");
  v8 = OBJC_IVAR____TtC6FindMy33FMModernPlatterAccessoryLabelView_chevron;
  v9 = sub_1003434F4();
  v10 = (objc_class *)objc_msgSend(objc_allocWithZone((Class)UIImageView), "initWithImage:", v9);

  *(Class *)((char *)&self->super.super.super.super.isa + v8) = v10;
  result = (_TtC6FindMy33FMModernPlatterAccessoryLabelView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001004A4C70, "FindMy/FMModernPlatterView.swift", 32, 2, 163, 0);
  __break(1u);
  return result;
}

- (_TtC6FindMy33FMModernPlatterAccessoryLabelView)initWithFrame:(CGRect)a3
{
  _TtC6FindMy33FMModernPlatterAccessoryLabelView *result;

  result = (_TtC6FindMy33FMModernPlatterAccessoryLabelView *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMModernPlatterAccessoryLabelView", 40, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy33FMModernPlatterAccessoryLabelView_label));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy33FMModernPlatterAccessoryLabelView_chevron));
}

@end
