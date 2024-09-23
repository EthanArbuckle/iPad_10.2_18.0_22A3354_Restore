@implementation BrowsingVideoModel.ControlSource

- (float)minValue
{
  return sub_1AAB8E260();
}

- (void)setMinValue:(float)a3
{
  sub_1AAB8E290(a3);
}

- (float)maxValue
{
  return sub_1AAB8E2C0();
}

- (void)setMaxValue:(float)a3
{
  sub_1AAB8E2F0(a3);
}

- (float)currentValue
{
  return sub_1AAB8E320();
}

- (void)setCurrentValue:(float)a3
{
  sub_1AAB8E350(a3);
}

- (BOOL)isPlaying
{
  return sub_1AAB8E384() & 1;
}

- (void)setPlaying:(BOOL)a3
{
  sub_1AAB8E3B8(a3);
}

- (BOOL)isLoading
{
  return sub_1AAB8E3EC() & 1;
}

- (void)setLoading:(BOOL)a3
{
  sub_1AAB8E420(a3);
}

- (NSString)currentValueText
{
  return (NSString *)sub_1AAB8E46C(self, (uint64_t)a2, (void (*)(void))sub_1AAB8E43C);
}

- (void)setCurrentValueText:(id)a3
{
  sub_1AAB8E4EC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1AAB8E454);
}

- (NSString)maxValueText
{
  return (NSString *)sub_1AAB8E46C(self, (uint64_t)a2, (void (*)(void))sub_1AAB8E4A8);
}

- (void)setMaxValueText:(id)a3
{
  sub_1AAB8E4EC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1AAB8E550);
}

- (NSArray)timeRangeMarks
{
  void *v2;

  sub_1AAB8E5B4();
  sub_1AAB74D50(0, (unint64_t *)&unk_1EEBB9CD0);
  v2 = (void *)sub_1AB08D5B8();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setTimeRangeMarks:(id)a3
{
  uint64_t v4;
  _TtCC15PhotosUIPrivate18BrowsingVideoModelP33_3E2DB3DF5DA24823FD948C2812C855DC13ControlSource *v5;

  sub_1AAB74D50(0, (unint64_t *)&unk_1EEBB9CD0);
  v4 = sub_1AB08D5C4();
  v5 = self;
  sub_1AAB8E630(v4);

}

- (_TtCC15PhotosUIPrivate18BrowsingVideoModelP33_3E2DB3DF5DA24823FD948C2812C855DC13ControlSource)init
{
  return (_TtCC15PhotosUIPrivate18BrowsingVideoModelP33_3E2DB3DF5DA24823FD948C2812C855DC13ControlSource *)sub_1AAB8E648();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
