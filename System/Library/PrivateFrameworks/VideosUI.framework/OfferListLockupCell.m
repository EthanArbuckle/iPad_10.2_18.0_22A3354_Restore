@implementation OfferListLockupCell

- (_TtC8VideosUI19OfferListLockupCell)initWithFrame:(CGRect)a3
{
  _TtC8VideosUI19OfferListLockupCell *result;

  sub_1D9CF1570();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUI19OfferListLockupCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9CF1610();
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  char v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  OUTLINED_FUNCTION_38_10(self);
  v4 = OUTLINED_FUNCTION_47_2();
  sub_1D9CF169C(v4, v5);
  OUTLINED_FUNCTION_28_2();
  OUTLINED_FUNCTION_63_0();
  OUTLINED_FUNCTION_59();
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)vui_setHighlighted:(BOOL)a3
{
  _TtC8VideosUI19OfferListLockupCell *v4;

  v4 = self;
  sub_1D9CF1858(a3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (void)vui_prepareForReuse
{
  _TtC8VideosUI19OfferListLockupCell *v2;

  v2 = self;
  sub_1D9CF1904();
  OUTLINED_FUNCTION_5_8(v2);
}

- (void).cxx_destruct
{
  swift_release();
  OUTLINED_FUNCTION_36_3(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                               + OBJC_IVAR____TtC8VideosUI19OfferListLockupCell_containerView));
}

@end
