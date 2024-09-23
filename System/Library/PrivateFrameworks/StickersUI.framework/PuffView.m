@implementation PuffView

- (void)layoutSubviews
{
  _TtC10StickersUI8PuffView *v2;

  v2 = self;
  sub_247A79728();

}

- (_TtC10StickersUI8PuffView)initWithCoder:(id)a3
{
  char *v4;
  id v5;
  _TtC10StickersUI8PuffView *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10StickersUI8PuffView_angle) = 0;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC10StickersUI8PuffView_favorsCenter) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC10StickersUI8PuffView_delegate;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10StickersUI8PuffView____lazy_storage___imageView) = 0;
  v5 = a3;

  result = (_TtC10StickersUI8PuffView *)sub_247A81250();
  __break(1u);
  return result;
}

- (_TtC10StickersUI8PuffView)initWithFrame:(CGRect)a3
{
  sub_247A7A138();
}

- (void).cxx_destruct
{
  sub_247A7B078((uint64_t)self + OBJC_IVAR____TtC10StickersUI8PuffView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10StickersUI8PuffView____lazy_storage___imageView));
}

@end
