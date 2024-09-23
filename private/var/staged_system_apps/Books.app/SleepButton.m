@implementation SleepButton

- (void)setImage:(id)a3 forState:(unint64_t)a4
{
  _TtC5Books11SleepButton *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  objc_super v10;

  v5 = self;
  if (a3)
  {
    objc_msgSend(a3, "size");
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = (Class *)((char *)&v5->super.super.super.super.super.isa + OBJC_IVAR____TtC5Books11SleepButton_imageSize);
  *v8 = v6;
  v8[1] = v7;
  v9 = -[SleepButton state](v5, "state");
  v10.receiver = v5;
  v10.super_class = (Class)type metadata accessor for SleepButton();
  -[SleepButton setImage:forState:](&v10, "setImage:forState:", a3, v9);

}

- (CGSize)intrinsicContentSize
{
  double *v2;
  double v3;
  _TtC5Books11SleepButton *v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v2 = (double *)((char *)self + OBJC_IVAR____TtC5Books11SleepButton_calculatedSize);
  v3 = *(double *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC5Books11SleepButton_calculatedSize);
  v4 = self;
  if (v3 == 0.0)
  {
    sub_10035B9B8();
    v3 = *v2;
  }
  v5 = v2[1];

  v6 = v3;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)layoutSubviews
{
  _TtC5Books11SleepButton *v2;

  v2 = self;
  sub_10035B248();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double *v3;
  double v4;
  _TtC5Books11SleepButton *v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v3 = (double *)((char *)self + OBJC_IVAR____TtC5Books11SleepButton_calculatedSize);
  v4 = *(double *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC5Books11SleepButton_calculatedSize);
  v5 = self;
  if (v4 == 0.0)
  {
    sub_10035B9B8();
    v4 = *v3;
  }
  v6 = v3[1];

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (NSString)accessibilityLabel
{
  uint64_t v2;
  _TtC5Books11SleepButton *v3;
  uint64_t v4;
  NSString v5;

  v2 = qword_1009CE170;
  v3 = self;
  if (v2 != -1)
    swift_once(&qword_1009CE170, sub_10035B47C);
  v4 = *(_QWORD *)algn_1009DCCD8;
  swift_bridgeObjectRetain(*(_QWORD *)algn_1009DCCD8);

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (NSString)accessibilityValue
{
  return (NSString *)sub_10035B798(self, (uint64_t)a2, (void (*)(void))sub_10035B6D4);
}

- (NSString)largeContentTitle
{
  return (NSString *)sub_10035B798(self, (uint64_t)a2, (void (*)(void))sub_10035B800);
}

- (unint64_t)accessibilityTraits
{
  id v2;
  unint64_t v3;
  UIAccessibilityTraits v4;
  UIAccessibilityTraits v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for SleepButton();
  v2 = v7.receiver;
  v3 = -[SleepButton accessibilityTraits](&v7, "accessibilityTraits");
  if (*((_BYTE *)v2 + OBJC_IVAR____TtC5Books11SleepButton_showsDuration) == 1)
  {
    v4 = UIAccessibilityTraitUpdatesFrequently;

    if ((v4 & ~v3) != 0)
      v5 = v4;
    else
      v5 = 0;
    v3 |= v5;
  }
  else
  {

  }
  return v3;
}

- (void)setAccessibilityTraits:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for SleepButton();
  -[SleepButton setAccessibilityTraits:](&v4, "setAccessibilityTraits:", a3);
}

- (_TtC5Books11SleepButton)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _QWORD *v7;
  _QWORD *v8;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC5Books11SleepButton_fixedHeight) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC5Books11SleepButton_internalPadding) = 0;
  v7 = (Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC5Books11SleepButton_calculatedSize);
  *v7 = 0;
  v7[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC5Books11SleepButton_duration) = 0;
  v8 = (Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC5Books11SleepButton_imageSize);
  *v8 = 0;
  v8[1] = 0;
  *((_BYTE *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC5Books11SleepButton_showsDuration) = 0;
  *((_BYTE *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC5Books11SleepButton_showsHours) = 0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for SleepButton();
  return -[SleepButton initWithFrame:](&v10, "initWithFrame:", x, y, width, height);
}

- (_TtC5Books11SleepButton)initWithCoder:(id)a3
{
  return (_TtC5Books11SleepButton *)sub_10035BC7C(a3);
}

@end
