@implementation RectangleHistoryCellWithScreenshot

- (_TtC7Measure34RectangleHistoryCellWithScreenshot)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC7Measure34RectangleHistoryCellWithScreenshot *)sub_100107C5C(a3, (uint64_t)a4, v6);
}

- (_TtC7Measure34RectangleHistoryCellWithScreenshot)initWithCoder:(id)a3
{
  return (_TtC7Measure34RectangleHistoryCellWithScreenshot *)sub_100107E44(a3);
}

- (void)prepareForReuse
{
  _TtC7Measure34RectangleHistoryCellWithScreenshot *v2;

  v2 = self;
  sub_100107FD0();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure34RectangleHistoryCellWithScreenshot_screenshot));
}

@end
