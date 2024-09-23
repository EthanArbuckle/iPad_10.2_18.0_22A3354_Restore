@implementation ReaderView

- (_TtC8StocksUI10ReaderView)initWithFrame:(CGRect)a3
{
  return (_TtC8StocksUI10ReaderView *)sub_1DC227F88(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8StocksUI10ReaderView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1DC228524();
}

- (void)layoutSubviews
{
  _TtC8StocksUI10ReaderView *v2;

  v2 = self;
  sub_1DC2282A4();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI10ReaderView_contentBackgroundColor));

}

@end
