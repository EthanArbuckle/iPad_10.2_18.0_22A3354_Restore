@implementation PhotoContentView

- (_TtC10MobileMail16PhotoContentView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10030A86C();
}

- (void)layoutSubviews
{
  _TtC10MobileMail16PhotoContentView *v2;

  v2 = self;
  sub_10030AA2C();

}

- (_TtC10MobileMail16PhotoContentView)initWithFrame:(CGRect)a3
{
  return (_TtC10MobileMail16PhotoContentView *)sub_10030AC3C();
}

- (void).cxx_destruct
{
  sub_100307F20((uint64_t)self + OBJC_IVAR____TtC10MobileMail16PhotoContentView_appliedConfiguration);

  sub_100309EE0((uint64_t)self + OBJC_IVAR____TtC10MobileMail16PhotoContentView_cornerConfiguration);
  sub_1001F20D8((id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail16PhotoContentView____lazy_storage___avatarViewController));
}

@end
