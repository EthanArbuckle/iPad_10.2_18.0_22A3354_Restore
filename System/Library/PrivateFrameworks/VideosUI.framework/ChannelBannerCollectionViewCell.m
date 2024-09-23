@implementation ChannelBannerCollectionViewCell

- (_TtC8VideosUI31ChannelBannerCollectionViewCell)initWithFrame:(CGRect)a3
{
  _TtC8VideosUI31ChannelBannerCollectionViewCell *result;

  sub_1D9DF534C();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtC8VideosUI31ChannelBannerCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D9DF53F8();
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  _TtC8VideosUI31ChannelBannerCollectionViewCell *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  v5 = self;
  OUTLINED_FUNCTION_21_4();
  sub_1D9DF548C(a4);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI31ChannelBannerCollectionViewCell_bannerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI31ChannelBannerCollectionViewCell_transitionBackgroundView));
  swift_release();
}

- (void)onSystemTraitCollectionDidChange:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC8VideosUI31ChannelBannerCollectionViewCell *v8;
  uint64_t v9;

  v4 = sub_1DA13F0B0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DA13F080();
  v8 = self;
  sub_1D9DF6F08();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

@end
