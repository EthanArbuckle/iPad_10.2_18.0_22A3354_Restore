@implementation PromotionalParallaxContentView

- (_TtC16MusicApplication30PromotionalParallaxContentView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication30PromotionalParallaxContentView *)sub_41FFC4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication30PromotionalParallaxContentView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_425228();
}

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  CGRect result;

  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  -[PromotionalParallaxContentView frame](&v6, "frame");
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
  objc_class *ObjectType;
  _TtC16MusicApplication30PromotionalParallaxContentView *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  objc_super v18;
  objc_super v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v19.receiver = self;
  v19.super_class = ObjectType;
  v9 = self;
  -[PromotionalParallaxContentView frame](&v19, "frame");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v18.receiver = v9;
  v18.super_class = ObjectType;
  -[PromotionalParallaxContentView setFrame:](&v18, "setFrame:", x, y, width, height);
  sub_421078(v11, v13, v15, v17);

}

- (void)layoutSubviews
{
  _TtC16MusicApplication30PromotionalParallaxContentView *v2;

  v2 = self;
  sub_4211C8();

}

- (void)music_inheritedLayoutInsetsDidChange
{
  char *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = (char *)v3.receiver;
  -[PromotionalParallaxContentView music_inheritedLayoutInsetsDidChange](&v3, "music_inheritedLayoutInsetsDidChange");
  if (*(_QWORD *)(*(_QWORD *)&v2[OBJC_IVAR____TtC16MusicApplication30PromotionalParallaxContentView_thumbnailArtworkComponent]
                 + 96))
    objc_msgSend(v2, "setNeedsLayout", v3.receiver, v3.super_class);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC16MusicApplication30PromotionalParallaxContentView *v6;

  v5 = a3;
  v6 = self;
  sub_422B08(a3);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication30PromotionalParallaxContentView_additionalContentStackView));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication30PromotionalParallaxContentView_backgroundArtworkComponent));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication30PromotionalParallaxContentView_backgroundArtworkCachingReference));
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication30PromotionalParallaxContentView_didInvalidatePreferredBaseHeight), *(_QWORD *)&self->additionalContentStackView[OBJC_IVAR____TtC16MusicApplication30PromotionalParallaxContentView_didInvalidatePreferredBaseHeight]);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication30PromotionalParallaxContentView_thumbnailArtworkComponent));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication30PromotionalParallaxContentView_pageHeaderContentView));
  swift_bridgeObjectRelease(*(_QWORD *)&self->additionalContentStackView[OBJC_IVAR____TtC16MusicApplication30PromotionalParallaxContentView_title]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->additionalContentStackView[OBJC_IVAR____TtC16MusicApplication30PromotionalParallaxContentView_subtitle]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication30PromotionalParallaxContentView_backgroundOverlayColor));
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication30PromotionalParallaxContentView_videoLooperDidChangeHandler), *(_QWORD *)&self->additionalContentStackView[OBJC_IVAR____TtC16MusicApplication30PromotionalParallaxContentView_videoLooperDidChangeHandler]);
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication30PromotionalParallaxContentView_videoLooperDidFailHandler), *(_QWORD *)&self->additionalContentStackView[OBJC_IVAR____TtC16MusicApplication30PromotionalParallaxContentView_videoLooperDidFailHandler]);
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication30PromotionalParallaxContentView_isPlayingDidChangeHandler), *(_QWORD *)&self->additionalContentStackView[OBJC_IVAR____TtC16MusicApplication30PromotionalParallaxContentView_isPlayingDidChangeHandler]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication30PromotionalParallaxContentView_bottomHairlineView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication30PromotionalParallaxContentView_gradientView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication30PromotionalParallaxContentView_backgroundOverlayView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication30PromotionalParallaxContentView_thumbnailArtworkShadowView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication30PromotionalParallaxContentView_titleCompositingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication30PromotionalParallaxContentView_collapsedTitleCompositingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication30PromotionalParallaxContentView_subtitleCompositingView));
}

@end
