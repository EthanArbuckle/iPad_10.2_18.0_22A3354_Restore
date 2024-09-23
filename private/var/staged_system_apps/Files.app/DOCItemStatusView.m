@implementation DOCItemStatusView

- (_TtC5Files17DOCItemStatusView)initWithFrame:(CGRect)a3
{
  return (_TtC5Files17DOCItemStatusView *)sub_10003FFC8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (UIColor)tintColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCItemStatusView();
  return -[DOCItemStatusView tintColor](&v3, "tintColor");
}

- (void)setTintColor:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCItemStatusView();
  -[DOCItemStatusView setTintColor:](&v4, "setTintColor:", a3);
}

- (_TtC5Files17DOCItemStatusView)initWithCoder:(id)a3
{
  return (_TtC5Files17DOCItemStatusView *)sub_1003FDB7C(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Files17DOCItemStatusView_statusImageFontStyle));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Files17DOCItemStatusView_progressCompletedColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Files17DOCItemStatusView_progressBackgroundRingColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Files17DOCItemStatusView____lazy_storage___statusButton));

}

@end
