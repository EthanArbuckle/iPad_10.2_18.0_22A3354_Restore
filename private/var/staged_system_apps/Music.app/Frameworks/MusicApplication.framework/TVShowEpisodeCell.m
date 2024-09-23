@implementation TVShowEpisodeCell

- (_TtC16MusicApplication17TVShowEpisodeCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication17TVShowEpisodeCell *)sub_99228C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication17TVShowEpisodeCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_994754();
}

- (NSString)headline
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication17TVShowEpisodeCell_headline);
}

- (void)setHeadline:(id)a3
{
  sub_185C50(self, (uint64_t)a2, a3, (void (*)(uint64_t, uint64_t))sub_9929C8);
}

- (NSString)title
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication17TVShowEpisodeCell_title);
}

- (void)setTitle:(id)a3
{
  sub_185C50(self, (uint64_t)a2, a3, (void (*)(uint64_t, uint64_t))sub_992A9C);
}

- (NSString)descriptionText
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication17TVShowEpisodeCell_descriptionText);
}

- (void)setDescriptionText:(id)a3
{
  sub_185C50(self, (uint64_t)a2, a3, (void (*)(uint64_t, uint64_t))sub_992B74);
}

- (void)clearArtworkCatalogs
{
  _TtC16MusicApplication17TVShowEpisodeCell *v2;

  v2 = self;
  sub_993484();

}

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  sub_9935B8(self, (uint64_t)a2, (SEL *)&selRef_frame);
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
  _TtC16MusicApplication17TVShowEpisodeCell *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  sub_993670((SEL *)&selRef_frame, (SEL *)&selRef_setFrame_, x, y, width, height);

}

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  sub_9935B8(self, (uint64_t)a2, (SEL *)&selRef_bounds);
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
  _TtC16MusicApplication17TVShowEpisodeCell *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  sub_993670((SEL *)&selRef_bounds, (SEL *)&selRef_setBounds_, x, y, width, height);

}

- (void)layoutSubviews
{
  _TtC16MusicApplication17TVShowEpisodeCell *v2;

  v2 = self;
  sub_993778();

}

- (_TtC16MusicApplication21VideoHeaderLockupView)accessibilityHeaderLockupView
{
  return (_TtC16MusicApplication21VideoHeaderLockupView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                  + OBJC_IVAR____TtC16MusicApplication17TVShowEpisodeCell_headerLockupView));
}

- (_TtC16MusicApplication13TextStackView)accessibilityHeadlineTextStackView
{
  return (_TtC16MusicApplication13TextStackView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                          + OBJC_IVAR____TtC16MusicApplication17TVShowEpisodeCell_headlineTextStackView));
}

- (_TtC16MusicApplication13TextStackView)accessibilityTextStackView
{
  return (_TtC16MusicApplication13TextStackView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                          + OBJC_IVAR____TtC16MusicApplication17TVShowEpisodeCell_textStackView));
}

- (_TtC16MusicApplication13TextStackView)accessibilityDescriptionTextStackView
{
  return (_TtC16MusicApplication13TextStackView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                          + OBJC_IVAR____TtC16MusicApplication17TVShowEpisodeCell_descriptionTextStackView));
}

- (UIImageView)accessibilityChevronImageView
{
  _TtC16MusicApplication17TVShowEpisodeCell *v2;
  id v3;

  v2 = self;
  v3 = sub_993C4C();

  return (UIImageView *)v3;
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication17TVShowEpisodeCell_playHandler), *(_QWORD *)&self->headline[OBJC_IVAR____TtC16MusicApplication17TVShowEpisodeCell_playHandler]);
  sub_18A2AC((uint64_t)self + OBJC_IVAR____TtC16MusicApplication17TVShowEpisodeCell_artworkCornerTreatment);
  sub_9AFF4(*(void **)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication17TVShowEpisodeCell_artworkPlaceholder), *(void **)&self->headline[OBJC_IVAR____TtC16MusicApplication17TVShowEpisodeCell_artworkPlaceholder], *(void **)&self->headline[OBJC_IVAR____TtC16MusicApplication17TVShowEpisodeCell_artworkPlaceholder + 8], *(void **)&self->title[OBJC_IVAR____TtC16MusicApplication17TVShowEpisodeCell_artworkPlaceholder]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication17TVShowEpisodeCell_lockupImageArtworkCatalog));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication17TVShowEpisodeCell_artworkCachingReference));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication17TVShowEpisodeCell_textDrawingCache));
  v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC16MusicApplication17TVShowEpisodeCell_textComponents);
  v4 = *(_QWORD *)&self->headline[OBJC_IVAR____TtC16MusicApplication17TVShowEpisodeCell_textComponents];
  v5 = *(_QWORD *)&self->headline[OBJC_IVAR____TtC16MusicApplication17TVShowEpisodeCell_textComponents + 8];
  swift_bridgeObjectRelease();
  swift_release(v5);
  swift_release(v4);
  swift_release(v3);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication17TVShowEpisodeCell_headerLockupView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication17TVShowEpisodeCell_headlineTextStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication17TVShowEpisodeCell_textStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication17TVShowEpisodeCell_descriptionTextStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication17TVShowEpisodeCell____lazy_storage___chevronImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication17TVShowEpisodeCell_bottomHairlineView));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication17TVShowEpisodeCell_tapGestureRecognizerHandler));
}

+ (void)visualContentInsets
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[24];

  v0 = sub_9943A8();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  if (qword_14ABC50 != -1)
    swift_once(&qword_14ABC50, sub_993C30);
  if (!((unint64_t)v6 >> 62))
  {
    v7 = *(_QWORD *)((char *)&dword_10 + (v6 & 0xFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain();
    if (v7)
      goto LABEL_5;
LABEL_15:
    swift_bridgeObjectRelease();
    goto LABEL_16;
  }
  if (v6 < 0)
    v10 = v6;
  else
    v10 = v6 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain();
  v7 = _CocoaArrayWrapper.endIndex.getter(v10);
  if (!v7)
    goto LABEL_15;
LABEL_5:
  v8 = v7 - 1;
  if (__OFSUB__(v7, 1))
  {
    __break(1u);
    goto LABEL_18;
  }
  if ((v6 & 0xC000000000000001) != 0)
  {
LABEL_18:
    v9 = specialized _ArrayBuffer._getElementSlowPath(_:)(v8, v6);
    goto LABEL_10;
  }
  if ((v8 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v8 < *(_QWORD *)((char *)&dword_10 + (v6 & 0xFFFFFFFFFFFFF8)))
  {
    v9 = *(_QWORD *)(v6 + 8 * v8 + 32);
    swift_retain(v9);
LABEL_10:
    swift_bridgeObjectRelease();
    swift_beginAccess(v9 + 32, v11, 0, 0);
    swift_release(v9);
LABEL_16:
    swift_bridgeObjectRelease();
    swift_release(v4);
    swift_release(v2);
    swift_release(v0);
    return;
  }
  __break(1u);
}

@end
