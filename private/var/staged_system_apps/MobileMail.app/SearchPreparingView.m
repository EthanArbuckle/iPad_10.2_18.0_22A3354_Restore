@implementation SearchPreparingView

- (void)updateWith:(id)a3
{
  id v4;
  _TtC10MobileMail19SearchPreparingView *v5;

  v4 = a3;
  v5 = self;
  sub_10032FDF4(a3);

}

- (_TtC10MobileMail19SearchPreparingView)initWithFrame:(CGRect)a3
{
  return (_TtC10MobileMail19SearchPreparingView *)sub_10032FEC0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10MobileMail19SearchPreparingView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1003308E4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail19SearchPreparingView_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail19SearchPreparingView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail19SearchPreparingView_explanationLabel));
  sub_1001F20D8((id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail19SearchPreparingView_indexStatus));
}

@end
