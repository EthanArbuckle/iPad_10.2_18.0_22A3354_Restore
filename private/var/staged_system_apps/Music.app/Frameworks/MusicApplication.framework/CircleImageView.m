@implementation CircleImageView

- (_TtC16MusicApplication15CircleImageView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication15CircleImageView *)CircleImageView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication15CircleImageView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s16MusicApplication15CircleImageViewC5coderACSo7NSCoderC_tcfc_0();
}

- (void)layoutSubviews
{
  _TtC16MusicApplication15CircleImageView *v2;

  v2 = self;
  CircleImageView.layoutSubviews()();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC16MusicApplication15CircleImageView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = CircleImageView.sizeThatFits(_:)(width, height);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication15CircleImageView_ownerArtworkCatalog));
  swift_bridgeObjectRelease(*(_QWORD *)&self->ownerArtworkCatalog[OBJC_IVAR____TtC16MusicApplication15CircleImageView_title]);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication15CircleImageView_textDrawingCache));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication15CircleImageView_artworkCachingReference));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication15CircleImageView_artworkContainerView));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication15CircleImageView_artworkComponent));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication15CircleImageView_textStackView));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication15CircleImageView____lazy_storage___titleLabel));
}

@end
