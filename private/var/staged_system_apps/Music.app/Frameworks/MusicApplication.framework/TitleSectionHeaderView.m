@implementation TitleSectionHeaderView

- (_TtC16MusicApplication22TitleSectionHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication22TitleSectionHeaderView *)TitleSectionHeaderView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication22TitleSectionHeaderView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s16MusicApplication22TitleSectionHeaderViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4;
  _TtC16MusicApplication22TitleSectionHeaderView *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = sub_3AA6EC(v4);

  return v6;
}

- (NSString)supertitle
{
  return (NSString *)sub_319EE0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_supertitle);
}

- (void)setSupertitle:(id)a3
{
  sub_3A29AC((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_supertitle, (void (*)(uint64_t))sub_3A2230);
}

- (NSString)title
{
  return (NSString *)sub_319EE0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_title);
}

- (void)setTitle:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  id v10;
  _TtC16MusicApplication22TitleSectionHeaderView *v11;
  uint64_t v12;
  Swift::String v13;
  char v14[24];

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v7 = v6;
  v8 = (uint64_t *)((char *)self + OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_title);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_title, v14, 1, 0);
  v9 = v8[1];
  *v8 = v5;
  v8[1] = v7;
  v10 = a3;
  v11 = self;
  swift_bridgeObjectRelease(v9);
  v12 = v8[1];
  swift_bridgeObjectRetain();
  v13 = String.trim()();
  swift_bridgeObjectRelease(v12);
  TextStackView.Component.textValue.setter(v13._countAndFlagsBits, (uint64_t)v13._object);
  -[TitleSectionHeaderView setNeedsLayout](v11, "setNeedsLayout");

}

- (NSString)subtitle
{
  return (NSString *)sub_319EE0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_subtitle);
}

- (void)setSubtitle:(id)a3
{
  sub_3A29AC((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_subtitle, (void (*)(uint64_t))sub_3A2AC8);
}

- (void)layoutSubviews
{
  _TtC16MusicApplication22TitleSectionHeaderView *v2;

  v2 = self;
  TitleSectionHeaderView.layoutSubviews()();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC16MusicApplication22TitleSectionHeaderView *v6;
  _TtC16MusicApplication22TitleSectionHeaderView *v7;
  UITraitCollection_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.isa = (Class)a3;
  TitleSectionHeaderView.traitCollectionDidChange(_:)(v8);

}

- (void)music_inheritedLayoutInsetsDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TitleSectionHeaderView(0);
  v2 = v3.receiver;
  -[TitleSectionHeaderView music_inheritedLayoutInsetsDidChange](&v3, "music_inheritedLayoutInsetsDidChange");
  objc_msgSend(v2, "setNeedsLayout", v3.receiver, v3.super_class);

}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  _BYTE *v5;
  uint64_t v6;
  void *v7;
  _BYTE *v8;
  unsigned __int8 v9;
  char v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for TitleSectionHeaderView(0);
  v4 = a3;
  v5 = v11.receiver;
  -[TitleSectionHeaderView applyLayoutAttributes:](&v11, "applyLayoutAttributes:", v4);
  objc_opt_self(UICollectionViewTableLayoutAttributes);
  v6 = swift_dynamicCastObjCClass(v4);
  if (v6)
  {
    v7 = (void *)v6;
    v8 = v4;
    v9 = objc_msgSend(v7, "floating", v11.receiver, v11.super_class);
    v10 = v5[OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_floating];
    v5[OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_floating] = v9;
    sub_3A7E10(v10);

    v5 = v8;
  }

}

- (UIColor)backgroundColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TitleSectionHeaderView(0);
  return -[TitleSectionHeaderView backgroundColor](&v3, "backgroundColor");
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  char *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TitleSectionHeaderView(0);
  v4 = a3;
  v5 = (char *)v7.receiver;
  -[TitleSectionHeaderView setBackgroundColor:](&v7, "setBackgroundColor:", v4);
  v6 = *(void **)&v5[OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_externalBackgroundColor];
  *(_QWORD *)&v5[OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_externalBackgroundColor] = a3;

}

- (UIView)accessibilityAdditionalContentView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                           + OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_additionalContentView));
}

- (UIButton)accessibilitySystemStyleButton
{
  return (UIButton *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                             + OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_systemStyleButton));
}

- (void).cxx_destruct
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  swift_bridgeObjectRelease(*(_QWORD *)&self->forSizing[OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_supertitle]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->forSizing[OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_title]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->forSizing[OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_subtitle]);
  v3 = *(_QWORD *)&self->forSizing[OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_systemStyleButtonAttributedTitle];
  objc_release(*(id *)&self->supertitle[OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_systemStyleButtonAttributedTitle
                                      + 15]);
  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_systemStyleButtonPossibleAttributedTitles));
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_accessoryButtonHandler), *(_QWORD *)&self->forSizing[OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_accessoryButtonHandler]);
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_textTappedHandler), *(_QWORD *)&self->forSizing[OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_textTappedHandler]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_imageArtworkCatalog));
  sub_18A2AC((uint64_t)self + OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_imageArtworkCornerTreatment);
  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_artworkPlaceholder);
  v5 = *(void **)&self->forSizing[OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_artworkPlaceholder];
  v6 = *(void **)&self->supertitle[OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_artworkPlaceholder + 7];
  objc_release(*(id *)&self->supertitle[OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_artworkPlaceholder
                                      + 15]);

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_additionalContentView));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_textDrawingCache));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_artworkCachingReference));
  v7 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_textComponents);
  v8 = *(_QWORD *)&self->forSizing[OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_textComponents];
  v9 = *(_QWORD *)&self->supertitle[OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_textComponents + 7];
  swift_bridgeObjectRelease(*(_QWORD *)&self->supertitle[OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_textComponents
                                                       + 15]);
  swift_release(v9);
  swift_release(v8);
  swift_release(v7);
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView____lazy_storage___artworkComponent));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_topHairlineView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_bottomHairlineView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_titleTextDrawingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_subtitleTextDrawingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_supertitleTextDrawingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_systemStyleButton));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_tapGestureRecognizerHandler));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_tapGestureRecognizer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_floatingBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_chevronImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_externalBackgroundColor));
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_layoutInvalidationHandler), *(_QWORD *)&self->forSizing[OBJC_IVAR____TtC16MusicApplication22TitleSectionHeaderView_layoutInvalidationHandler]);
}

@end
