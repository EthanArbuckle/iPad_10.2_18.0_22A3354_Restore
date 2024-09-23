@implementation SearchBar

- (_TtC8VideosUI9SearchBar)initWithFrame:(CGRect)a3
{
  sub_1D97B97D0();
}

- (void)layoutSubviews
{
  _TtC8VideosUI9SearchBar *v2;

  v2 = self;
  sub_1D97B9828();
  OUTLINED_FUNCTION_5_8(v2);
}

- (_TtC8VideosUI9SearchBar)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1DA02FA78();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  _TtC8VideosUI9SearchBar *v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  width = a3.width;
  v4 = self;
  v5 = sub_1DA02FB58();
  OUTLINED_FUNCTION_195();
  v6 = v5;
  v7 = width;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)setShowsScopeBar:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v5;
  _TtC8VideosUI9SearchBar *v6;

  v5 = a3;
  v6 = self;
  sub_1DA030104(v5, a4);
  OUTLINED_FUNCTION_5_8(v6);
}

- (BOOL)_shouldSendContentChangedNotificationsIfOnlyMarkedTextChanged
{
  return 1;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI9SearchBar____lazy_storage___categoryFilterBar));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI9SearchBar____lazy_storage___queryDescriptionBar));
}

@end
