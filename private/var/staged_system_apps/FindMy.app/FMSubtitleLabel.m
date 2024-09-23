@implementation FMSubtitleLabel

- (_TtC6FindMy15FMSubtitleLabel)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for FMSubtitleLabel();
  return -[FMSubtitleLabel initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (NSString)accessibilityLabel
{
  _TtC6FindMy15FMSubtitleLabel *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_100348FE0();
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

- (_TtC6FindMy15FMSubtitleLabel)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMSubtitleLabel();
  return -[FMSubtitleLabel initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
