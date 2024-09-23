@implementation ScalableImageView

- (int64_t)contentMode
{
  _TtC5TeaUI17ScalableImageView *v2;
  id v3;

  v2 = self;
  v3 = sub_1B16A932C();

  return (int64_t)v3;
}

- (void)setContentMode:(int64_t)a3
{
  _TtC5TeaUI17ScalableImageView *v4;

  v4 = self;
  sub_1B16A9384(a3);

}

- (_TtC5TeaUI17ScalableImageView)initWithFrame:(CGRect)a3
{
  return (_TtC5TeaUI17ScalableImageView *)sub_1B16A93A0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC5TeaUI17ScalableImageView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1B16A9624();
}

- (void)layoutSubviews
{
  _TtC5TeaUI17ScalableImageView *v2;

  v2 = self;
  sub_1B16A96D0();

}

- (void).cxx_destruct
{

}

@end
