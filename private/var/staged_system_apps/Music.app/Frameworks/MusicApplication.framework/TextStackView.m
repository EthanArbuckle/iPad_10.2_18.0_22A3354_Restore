@implementation TextStackView

- (void)layoutSubviews
{
  _TtC16MusicApplication13TextStackView *v2;

  v2 = self;
  TextStackView.layoutSubviews()();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  CGFloat width;
  _TtC16MusicApplication13TextStackView *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12[8];
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = -[TextStackView traitCollection](v5, "traitCollection");
  objc_msgSend(v6, "displayScale");
  v8 = v7;

  if (height <= 5.99231045e307)
    v9 = height;
  else
    v9 = 5.99231045e307;
  sub_704160(v12, 0.0, 0.0, width, v9, v8);
  sub_95058(v12);

  v10 = *(double *)&v12[3];
  v11 = *(double *)&v12[4];
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC16MusicApplication13TextStackView *v6;
  _TtC16MusicApplication13TextStackView *v7;
  UITraitCollection_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.isa = (Class)a3;
  TextStackView.traitCollectionDidChange(_:)(v8);

}

- (_TtC16MusicApplication13TextStackView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication13TextStackView *)TextStackView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication13TextStackView)initWithCoder:(id)a3
{
  id v3;
  _TtC16MusicApplication13TextStackView *v4;

  v3 = a3;
  v4 = (_TtC16MusicApplication13TextStackView *)sub_7120F0((uint64_t)v3);

  return v4;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication13TextStackView_textDrawingCache));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication13TextStackView_textShadow));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC16MusicApplication13TextStackView_orderedComponents));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC16MusicApplication13TextStackView_indexedComponents));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC16MusicApplication13TextStackView_recycledTextDrawingViews));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication13TextStackView_textDrawingCacheInvalidationNotificationObserver));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC16MusicApplication13TextStackView_cacheKeyStackViewLayoutMetrics));
}

@end
