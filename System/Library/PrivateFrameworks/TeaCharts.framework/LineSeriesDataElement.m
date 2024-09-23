@implementation LineSeriesDataElement

- (CGRect)accessibilityFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  sub_1B8206434(self, (uint64_t)a2, (void (*)(void))sub_1B8205B1C);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setAccessibilityFrame:(CGRect)a3
{
  nullsub_1((__n128)a3.origin, *(__n128 *)&a3.origin.y, (__n128)a3.size, *(__n128 *)&a3.size.height);
}

- (NSString)accessibilityLabel
{
  return (NSString *)sub_1B8205C94(self, (uint64_t)a2, (void (*)(void))sub_1B8205BCC);
}

- (void)setAccessibilityLabel:(id)a3
{
  sub_1B8205DAC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1B8205C80);
}

- (NSString)accessibilityValue
{
  return (NSString *)sub_1B8205C94(self, (uint64_t)a2, (void (*)(void))sub_1B8205CF8);
}

- (void)setAccessibilityValue:(id)a3
{
  sub_1B8205DAC(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1B82080DC);
}

- (_TtC9TeaChartsP33_9EE3010B3705A23DEDCE010A1E35708921LineSeriesDataElement)initWithAccessibilityContainer:(id)a3
{
  swift_unknownObjectRetain();
  sub_1B820EA80();
  swift_unknownObjectRelease();
  sub_1B8205E1C();
}

- (_TtC9TeaChartsP33_9EE3010B3705A23DEDCE010A1E35708921LineSeriesDataElement)init
{
  sub_1B8205E94();
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
