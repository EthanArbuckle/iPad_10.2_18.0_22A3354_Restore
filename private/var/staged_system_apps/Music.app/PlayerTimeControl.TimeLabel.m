@implementation PlayerTimeControl.TimeLabel

- (UIColor)textColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR____TtCC5Music17PlayerTimeControl9TimeLabel_multipliedTextColor));
}

- (void)setTextColor:(id)a3
{
  _TtCC5Music17PlayerTimeControl9TimeLabel *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_1002DDA6C(a3);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtCC5Music17PlayerTimeControl9TimeLabel *v6;

  v5 = a3;
  v6 = self;
  sub_1002DD244((uint64_t)a3);

}

- (_TtCC5Music17PlayerTimeControl9TimeLabel)initWithFrame:(CGRect)a3
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
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtCC5Music17PlayerTimeControl9TimeLabel_multipliedTextColor) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for PlayerTimeControl.TimeLabel();
  return -[PlayerTimeControl.TimeLabel initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtCC5Music17PlayerTimeControl9TimeLabel)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtCC5Music17PlayerTimeControl9TimeLabel_multipliedTextColor) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PlayerTimeControl.TimeLabel();
  return -[PlayerTimeControl.TimeLabel initWithCoder:](&v5, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC5Music17PlayerTimeControl9TimeLabel_multipliedTextColor));
}

@end
