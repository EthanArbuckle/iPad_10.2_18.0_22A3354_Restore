@implementation UpsellOfferView

- (void)dealloc
{
  _TtC8VideosUI15UpsellOfferView *v2;

  v2 = self;
  sub_1D9B45030();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  OUTLINED_FUNCTION_120((uint64_t)OBJC_IVAR____TtC8VideosUI15UpsellOfferView_coverArtImageView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI15UpsellOfferView_tagsView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI15UpsellOfferView_contextImageView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI15UpsellOfferView_titleLabel);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI15UpsellOfferView_descriptionLabel);
  swift_release();
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI15UpsellOfferView_backgroundImageView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI15UpsellOfferView_storedGradientLayer);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI15UpsellOfferView_storedGradientView);
  OUTLINED_FUNCTION_120(OBJC_IVAR____TtC8VideosUI15UpsellOfferView_contentLogoView);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI15UpsellOfferView_contentTextLabel));
}

- (void)handleGroupWatchActivityStateDidChange:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC8VideosUI15UpsellOfferView *v8;
  uint64_t v9;

  v4 = sub_1DA13F0B0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DA13F080();
  v8 = self;
  sub_1D9B45C74();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (CGSize)vui_sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  OUTLINED_FUNCTION_14_27(self);
  sub_1D9B45E1C(v4, v3);
  OUTLINED_FUNCTION_28_2();
  OUTLINED_FUNCTION_63_0();
  OUTLINED_FUNCTION_59();
  result.height = v6;
  result.width = v5;
  return result;
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double v4;
  double v5;
  double v7;
  double v8;
  CGSize result;

  OUTLINED_FUNCTION_14_27(self);
  sub_1D9B46CF4(a4, v5, v4);
  OUTLINED_FUNCTION_28_2();
  OUTLINED_FUNCTION_63_0();
  OUTLINED_FUNCTION_59();
  result.height = v8;
  result.width = v7;
  return result;
}

- (_TtC8VideosUI15UpsellOfferView)initWithFrame:(CGRect)a3
{
  _TtC8VideosUI15UpsellOfferView *result;

  sub_1D9B46D34();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUI15UpsellOfferView)initWithCoder:(id)a3
{
  _TtC8VideosUI15UpsellOfferView *result;

  sub_1D9B46E70(a3);
  OUTLINED_FUNCTION_2_1();
  return result;
}

@end
