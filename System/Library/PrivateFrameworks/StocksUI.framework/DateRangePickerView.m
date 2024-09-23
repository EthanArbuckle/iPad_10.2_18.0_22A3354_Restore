@implementation DateRangePickerView

- (_TtC8StocksUI19DateRangePickerView)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC8StocksUI19DateRangePickerView *result;

  v4 = (Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8StocksUI19DateRangePickerView_onChange);
  *v4 = 0;
  v4[1] = 0;
  v5 = a3;

  result = (_TtC8StocksUI19DateRangePickerView *)sub_1DC409838();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC8StocksUI19DateRangePickerView *v2;

  v2 = self;
  sub_1DC27B508();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC8StocksUI19DateRangePickerView *v6;

  v5 = a3;
  v6 = self;
  sub_1DC27B79C((uint64_t)a3);

}

- (_TtC8StocksUI19DateRangePickerView)initWithFrame:(CGRect)a3
{
  _TtC8StocksUI19DateRangePickerView *result;

  result = (_TtC8StocksUI19DateRangePickerView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8StocksUI19DateRangePickerView_styler);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI19DateRangePickerView_segmentedControl));
  sub_1DC0E81D0(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC8StocksUI19DateRangePickerView_onChange));
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  id v2;
  unint64_t v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DateRangePickerView();
  v2 = v6.receiver;
  v3 = -[DateRangePickerView accessibilityTraits](&v6, sel_accessibilityTraits);
  v4 = *MEMORY[0x1E0DC4650];

  return v4 | v3;
}

- (NSString)accessibilityValue
{
  _TtC8StocksUI19DateRangePickerView *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  sub_1DC27BAE4();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1DC408A1C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (void)accessibilityIncrement
{
  _TtC8StocksUI19DateRangePickerView *v2;

  v2 = self;
  sub_1DC27BBF4();

}

- (void)accessibilityDecrement
{
  _TtC8StocksUI19DateRangePickerView *v2;

  v2 = self;
  sub_1DC27BFE4();

}

- (BOOL)accessibilityActivate
{
  return 1;
}

@end
