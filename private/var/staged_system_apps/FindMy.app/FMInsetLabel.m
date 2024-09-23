@implementation FMInsetLabel

- (void)drawTextInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC6FindMy12FMInsetLabel *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  sub_1000E0A6C(x, y, width, height);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC6FindMy12FMInsetLabel *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = sub_1000E0B64(width, height);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (CGSize)intrinsicContentSize
{
  _TtC6FindMy12FMInsetLabel *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v2 = self;
  v3 = sub_1000E0C7C();
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (_TtC6FindMy12FMInsetLabel)initWithFrame:(CGRect)a3
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
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy12FMInsetLabel_topInset) = (Class)0x4020000000000000;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy12FMInsetLabel_leftInset) = (Class)0x4020000000000000;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy12FMInsetLabel_bottomInset) = (Class)0x4020000000000000;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy12FMInsetLabel_rightInset) = (Class)0x4020000000000000;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for FMInsetLabel();
  return -[FMInsetLabel initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC6FindMy12FMInsetLabel)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy12FMInsetLabel_topInset) = (Class)0x4020000000000000;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy12FMInsetLabel_leftInset) = (Class)0x4020000000000000;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy12FMInsetLabel_bottomInset) = (Class)0x4020000000000000;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy12FMInsetLabel_rightInset) = (Class)0x4020000000000000;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMInsetLabel();
  return -[FMInsetLabel initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
