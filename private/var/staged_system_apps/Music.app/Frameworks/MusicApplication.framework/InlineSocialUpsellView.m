@implementation InlineSocialUpsellView

- (_TtC16MusicApplication22InlineSocialUpsellView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication22InlineSocialUpsellView *)InlineSocialUpsellView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication22InlineSocialUpsellView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s16MusicApplication22InlineSocialUpsellViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  sub_188BF8(self, (uint64_t)a2, (SEL *)&selRef_frame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC16MusicApplication22InlineSocialUpsellView *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  InlineSocialUpsellView.frame.setter(x, y, width, height);

}

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  sub_188BF8(self, (uint64_t)a2, (SEL *)&selRef_bounds);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC16MusicApplication22InlineSocialUpsellView *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  InlineSocialUpsellView.bounds.setter(x, y, width, height);

}

- (void)layoutSubviews
{
  _TtC16MusicApplication22InlineSocialUpsellView *v2;

  v2 = self;
  InlineSocialUpsellView.layoutSubviews()();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  _TtC16MusicApplication22InlineSocialUpsellView *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  width = a3.width;
  v4 = self;
  v5 = -[InlineSocialUpsellView traitCollection](v4, "traitCollection");
  InlineSocialUpsellView.preferredHeight(traitCollection:containerWidth:)(v5, width);
  v7 = v6;

  v8 = width;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC16MusicApplication22InlineSocialUpsellView *v6;
  _TtC16MusicApplication22InlineSocialUpsellView *v7;
  UITraitCollection_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.isa = (Class)a3;
  InlineSocialUpsellView.traitCollectionDidChange(_:)(v8);

}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;

  swift_bridgeObjectRelease(*(_QWORD *)&self->title[OBJC_IVAR____TtC16MusicApplication22InlineSocialUpsellView_title]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->title[OBJC_IVAR____TtC16MusicApplication22InlineSocialUpsellView_subtitle]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->title[OBJC_IVAR____TtC16MusicApplication22InlineSocialUpsellView_primaryButtonTitle]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication22InlineSocialUpsellView_lockupImageArtworkCatalog));
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication22InlineSocialUpsellView_closeButtonHandler), *(_QWORD *)&self->title[OBJC_IVAR____TtC16MusicApplication22InlineSocialUpsellView_closeButtonHandler]);
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication22InlineSocialUpsellView_primaryButtonHandler), *(_QWORD *)&self->title[OBJC_IVAR____TtC16MusicApplication22InlineSocialUpsellView_primaryButtonHandler]);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication22InlineSocialUpsellView_artworkCachingReference));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication22InlineSocialUpsellView_textDrawingCache));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication22InlineSocialUpsellView_textStackView));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication22InlineSocialUpsellView_artworkComponent));
  v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC16MusicApplication22InlineSocialUpsellView_textComponents);
  v4 = *(_QWORD *)&self->title[OBJC_IVAR____TtC16MusicApplication22InlineSocialUpsellView_textComponents];
  swift_bridgeObjectRelease(*(_QWORD *)&self->title[OBJC_IVAR____TtC16MusicApplication22InlineSocialUpsellView_textComponents
                                                  + 8]);
  swift_release(v4);
  swift_release(v3);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication22InlineSocialUpsellView____lazy_storage___closeButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication22InlineSocialUpsellView____lazy_storage___primaryButton));
}

@end
