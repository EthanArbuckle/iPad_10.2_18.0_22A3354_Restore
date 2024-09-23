@implementation TitleSectionHeaderView

- (_TtC12NowPlayingUI22TitleSectionHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC12NowPlayingUI22TitleSectionHeaderView *)sub_75BF8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12NowPlayingUI22TitleSectionHeaderView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_79EDC();
}

- (NSString)title
{
  return (NSString *)sub_761B8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC12NowPlayingUI22TitleSectionHeaderView_title);
}

- (void)setTitle:(id)a3
{
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _TtC12NowPlayingUI22TitleSectionHeaderView *v10;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC12NowPlayingUI22TitleSectionHeaderView_title);
  v6 = *(_QWORD *)&self->forSizing[OBJC_IVAR____TtC12NowPlayingUI22TitleSectionHeaderView_title];
  *v5 = v4;
  v5[1] = v7;
  v10 = self;
  swift_bridgeObjectRelease(v6);
  v8 = *v5;
  v9 = v5[1];
  swift_bridgeObjectRetain(v9);
  sub_5129C(v8, v9);
  -[TitleSectionHeaderView setNeedsLayout](v10, "setNeedsLayout");

}

- (NSString)subtitle
{
  return (NSString *)sub_761B8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC12NowPlayingUI22TitleSectionHeaderView_subtitle);
}

- (void)setSubtitle:(id)a3
{
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  _TtC12NowPlayingUI22TitleSectionHeaderView *v8;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC12NowPlayingUI22TitleSectionHeaderView_subtitle);
  v6 = *(_QWORD *)&self->forSizing[OBJC_IVAR____TtC12NowPlayingUI22TitleSectionHeaderView_subtitle];
  *v5 = v4;
  v5[1] = v7;
  v8 = self;
  swift_bridgeObjectRelease(v6);
  sub_7625C();

}

- (void)layoutSubviews
{
  _TtC12NowPlayingUI22TitleSectionHeaderView *v2;

  v2 = self;
  sub_767BC();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC12NowPlayingUI22TitleSectionHeaderView *v6;

  v5 = a3;
  v6 = self;
  sub_77FA8((uint64_t)a3);

}

- (void)music_inheritedLayoutInsetsDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TitleSectionHeaderView();
  v2 = v3.receiver;
  -[TitleSectionHeaderView music_inheritedLayoutInsetsDidChange](&v3, "music_inheritedLayoutInsetsDidChange");
  objc_msgSend(v2, "setNeedsLayout", v3.receiver, v3.super_class);

}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _BYTE *v9;
  unsigned __int8 v10;
  char v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for TitleSectionHeaderView();
  v4 = a3;
  v5 = v12.receiver;
  -[TitleSectionHeaderView applyLayoutAttributes:](&v12, "applyLayoutAttributes:", v4);
  v6 = objc_opt_self(UICollectionViewTableLayoutAttributes);
  v7 = swift_dynamicCastObjCClass(v4, v6);
  if (v7)
  {
    v8 = (void *)v7;
    v9 = v4;
    v10 = objc_msgSend(v8, "floating", v12.receiver, v12.super_class);
    v11 = v5[OBJC_IVAR____TtC12NowPlayingUI22TitleSectionHeaderView_floating];
    v5[OBJC_IVAR____TtC12NowPlayingUI22TitleSectionHeaderView_floating] = v10;
    sub_78354(v11);

    v5 = v9;
  }

}

- (void)preferredContentSizeDidChangeWithNewContentSizeCategory:(id)a3
{
  id v4;
  _TtC12NowPlayingUI22TitleSectionHeaderView *v5;

  v4 = a3;
  v5 = self;
  sub_7A288();

}

- (UIColor)backgroundColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TitleSectionHeaderView();
  return -[TitleSectionHeaderView backgroundColor](&v3, "backgroundColor");
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  char *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TitleSectionHeaderView();
  v4 = a3;
  v5 = (char *)v7.receiver;
  -[TitleSectionHeaderView setBackgroundColor:](&v7, "setBackgroundColor:", v4);
  v6 = *(void **)&v5[OBJC_IVAR____TtC12NowPlayingUI22TitleSectionHeaderView_externalBackgroundColor];
  *(_QWORD *)&v5[OBJC_IVAR____TtC12NowPlayingUI22TitleSectionHeaderView_externalBackgroundColor] = a3;

}

- (UIView)accessibilityAdditionalContentView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                           + OBJC_IVAR____TtC12NowPlayingUI22TitleSectionHeaderView_additionalContentView));
}

- (UIButton)accessibilitySystemStyleButton
{
  return (UIButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                             + OBJC_IVAR____TtC12NowPlayingUI22TitleSectionHeaderView_systemStyleButton));
}

- (UIButton)accessibilityImageButton
{
  return (UIButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                             + OBJC_IVAR____TtC12NowPlayingUI22TitleSectionHeaderView_imageButton));
}

- (NSString)accessibilityTitle
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->forSizing[OBJC_IVAR____TtC12NowPlayingUI22TitleSectionHeaderView_title];
  swift_bridgeObjectRetain(v2);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease(*(_QWORD *)&self->forSizing[OBJC_IVAR____TtC12NowPlayingUI22TitleSectionHeaderView_title]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->forSizing[OBJC_IVAR____TtC12NowPlayingUI22TitleSectionHeaderView_subtitle]);
  sub_791D4(*(void **)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC12NowPlayingUI22TitleSectionHeaderView_imageStyleButtonArtworkPlaceholder), *(_QWORD *)&self->forSizing[OBJC_IVAR____TtC12NowPlayingUI22TitleSectionHeaderView_imageStyleButtonArtworkPlaceholder], self->title[OBJC_IVAR____TtC12NowPlayingUI22TitleSectionHeaderView_imageStyleButtonArtworkPlaceholder + 7]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI22TitleSectionHeaderView_imageStyleButtonArtworkCatalog));
  v3 = *(_QWORD *)&self->forSizing[OBJC_IVAR____TtC12NowPlayingUI22TitleSectionHeaderView_systemStyleButtonAttributedTitle];
  objc_release(*(id *)&self->title[OBJC_IVAR____TtC12NowPlayingUI22TitleSectionHeaderView_systemStyleButtonAttributedTitle
                                 + 15]);
  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC12NowPlayingUI22TitleSectionHeaderView_systemStyleButtonPossibleAttributedTitles));
  sub_145A0(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC12NowPlayingUI22TitleSectionHeaderView_buttonHandler), *(_QWORD *)&self->forSizing[OBJC_IVAR____TtC12NowPlayingUI22TitleSectionHeaderView_buttonHandler]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI22TitleSectionHeaderView_additionalContentView));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC12NowPlayingUI22TitleSectionHeaderView_textDrawingCache));
  v4 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC12NowPlayingUI22TitleSectionHeaderView_textComponents);
  v5 = *(_QWORD *)&self->forSizing[OBJC_IVAR____TtC12NowPlayingUI22TitleSectionHeaderView_textComponents];
  swift_bridgeObjectRelease(*(_QWORD *)&self->title[OBJC_IVAR____TtC12NowPlayingUI22TitleSectionHeaderView_textComponents
                                                  + 7]);
  swift_release(v5);
  swift_release(v4);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI22TitleSectionHeaderView_topHairlineView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI22TitleSectionHeaderView_bottomHairlineView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI22TitleSectionHeaderView_titleTextDrawingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI22TitleSectionHeaderView_subtitleTextDrawingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI22TitleSectionHeaderView_systemStyleButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI22TitleSectionHeaderView_imageButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI22TitleSectionHeaderView_floatingBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12NowPlayingUI22TitleSectionHeaderView_externalBackgroundColor));
  sub_145A0(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC12NowPlayingUI22TitleSectionHeaderView_layoutInvalidationHandler), *(_QWORD *)&self->forSizing[OBJC_IVAR____TtC12NowPlayingUI22TitleSectionHeaderView_layoutInvalidationHandler]);
}

@end
