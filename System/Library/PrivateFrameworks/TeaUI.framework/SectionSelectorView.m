@implementation SectionSelectorView

- (_TtC5TeaUI19SectionSelectorView)initWithFrame:(CGRect)a3
{
  return (_TtC5TeaUI19SectionSelectorView *)sub_1B14F2144();
}

- (_TtC5TeaUI19SectionSelectorView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1B14F2644();
}

- (void)layoutSubviews
{
  _TtC5TeaUI19SectionSelectorView *v2;

  v2 = self;
  sub_1B14F281C();

}

- (CGSize)intrinsicContentSize
{
  _TtC5TeaUI19SectionSelectorView *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v2 = self;
  v3 = sub_1B14F1AF0();
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void).cxx_destruct
{
  sub_1B13C076C((uint64_t)self + OBJC_IVAR____TtC5TeaUI19SectionSelectorView_delegate);
  sub_1B13C076C((uint64_t)self + OBJC_IVAR____TtC5TeaUI19SectionSelectorView_dataSource);
  OUTLINED_FUNCTION_43(OBJC_IVAR____TtC5TeaUI19SectionSelectorView_textColor);
  OUTLINED_FUNCTION_43(OBJC_IVAR____TtC5TeaUI19SectionSelectorView_scrollView);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_43(OBJC_IVAR____TtC5TeaUI19SectionSelectorView_unselectedButtonFont);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI19SectionSelectorView_selectedButtonFont));
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  id v7;
  _TtC5TeaUI19SectionSelectorView *v8;

  v7 = a3;
  v8 = self;
  sub_1B14F2FCC((uint64_t)v8, &a5->x);

}

- (void)accessibilityIncrement
{
  self;
  sub_1B14F3254();
}

- (void)accessibilityDecrement
{
  self;
  sub_1B14F3328();
}

@end
