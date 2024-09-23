@implementation CollectionRichHeaderView

- (_TtC8VideosUI24CollectionRichHeaderView)initWithFrame:(CGRect)a3
{
  _TtC8VideosUI24CollectionRichHeaderView *result;

  sub_1D9ACA1D0();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUI24CollectionRichHeaderView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9ACA250();
}

- (void)prepareForReuse
{
  _TtC8VideosUI24CollectionRichHeaderView *v2;

  v2 = self;
  sub_1D9ACA7EC((SEL *)&selRef_prepareForReuse);
  OUTLINED_FUNCTION_5_8(v2);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  OUTLINED_FUNCTION_14_27(self);
  OUTLINED_FUNCTION_21_4();
  sub_1D9ACA314();
  OUTLINED_FUNCTION_28_2();
  OUTLINED_FUNCTION_59();
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  _TtC8VideosUI24CollectionRichHeaderView *v2;

  v2 = self;
  sub_1D9ACA450();
  OUTLINED_FUNCTION_5_8(v2);
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double v5;
  double v6;
  CGSize result;

  OUTLINED_FUNCTION_14_27(self);
  OUTLINED_FUNCTION_21_4();
  sub_1D9ACA31C(a4);
  OUTLINED_FUNCTION_28_2();
  OUTLINED_FUNCTION_59();
  result.height = v6;
  result.width = v5;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI24CollectionRichHeaderView_hostingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI24CollectionRichHeaderView____lazy_storage___hostingContainerView));
}

@end
