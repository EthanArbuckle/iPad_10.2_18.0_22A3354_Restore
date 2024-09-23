@implementation PosterRackTopButton

- (void)layoutSubviews
{
  _TtC11PosterBoard19PosterRackTopButton *v2;

  v2 = self;
  sub_1CBB2B448();

}

- (_TtC11PosterBoard19PosterRackTopButton)initWithFrame:(CGRect)a3
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
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC11PosterBoard19PosterRackTopButton_contentWidthForCalculatedFittingFont) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for PosterRackTopButton();
  return -[PosterRackTopButton initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC11PosterBoard19PosterRackTopButton)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC11PosterBoard19PosterRackTopButton_contentWidthForCalculatedFittingFont) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PosterRackTopButton();
  return -[PosterRackTopButton initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
