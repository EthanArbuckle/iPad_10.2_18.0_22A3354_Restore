@implementation CategoryFilterBar

- (_TtC8VideosUI17CategoryFilterBar)init
{
  _TtC8VideosUI17CategoryFilterBar *result;

  sub_1D97FB0A0();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void)layoutSubviews
{
  _TtC8VideosUI17CategoryFilterBar *v2;

  v2 = self;
  sub_1D97FB4E4();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC8VideosUI17CategoryFilterBar *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v3 = self;
  sub_1D97FB5FC();
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (_TtC8VideosUI17CategoryFilterBar)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9AE0D70();
}

- (void)categoryButtonTapped:(id)a3
{
  id v4;
  _TtC8VideosUI17CategoryFilterBar *v5;

  v4 = a3;
  v5 = self;
  sub_1D9AE1724((uint64_t)v4);

}

- (_TtC8VideosUI17CategoryFilterBar)initWithFrame:(CGRect)a3
{
  sub_1D9AE1A64();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1D97B50A8(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC8VideosUI17CategoryFilterBar_selectionHandler));
  sub_1D9AE0A90(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC8VideosUI17CategoryFilterBar_selectedCategory), *(_QWORD *)((char *)&self->super.super.super._responderFlags+ OBJC_IVAR____TtC8VideosUI17CategoryFilterBar_selectedCategory));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI17CategoryFilterBar_selectedButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI17CategoryFilterBar____lazy_storage___selectedButtonBackgroundView));
}

@end
