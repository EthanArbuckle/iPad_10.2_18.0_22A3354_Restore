@implementation LineHistoryCellWithScreenshot

- (_TtC7Measure29LineHistoryCellWithScreenshot)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC7Measure29LineHistoryCellWithScreenshot *)sub_100021E6C(a3, (uint64_t)a4, v6);
}

- (_TtC7Measure29LineHistoryCellWithScreenshot)initWithCoder:(id)a3
{
  return (_TtC7Measure29LineHistoryCellWithScreenshot *)sub_100022054(a3);
}

- (void)prepareForReuse
{
  _TtC7Measure29LineHistoryCellWithScreenshot *v2;

  v2 = self;
  sub_1000221E0();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Measure29LineHistoryCellWithScreenshot_screenshot));
}

@end
