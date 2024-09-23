@implementation PosterCell

- (_TtC16MusicApplication10PosterCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication10PosterCell *)sub_C4744(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication10PosterCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_CC8B4();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  id v6;
  double v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  v4 = a3;
  v5 = v8.receiver;
  -[VerticalLockupCollectionViewCell traitCollectionDidChange:](&v8, "traitCollectionDidChange:", v4);
  v6 = objc_msgSend(v5, "traitCollection", v8.receiver, v8.super_class);
  v7 = sub_CC4DC(v6, *((_BYTE *)v5 + OBJC_IVAR____TtC16MusicApplication10PosterCell_displayStyle));

  sub_9DBF34(v7);
  sub_C513C();

}

- (NSString)overlayTitleText
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication10PosterCell_overlayTitleText);
}

- (void)setOverlayTitleText:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _TtC16MusicApplication10PosterCell *v9;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v7 = v6;
  v8 = a3;
  v9 = self;
  sub_C5868(v5, v7);

}

- (UIImage)materialImage
{
  if (*((_BYTE *)&self->super.super.super.super.super.super.super.isa
       + OBJC_IVAR____TtC16MusicApplication10PosterCell_displayStyle) == 2)
    return (UIImage *)objc_msgSend((*(id **)((char *)&self->super.super.super.super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication32VerticalLockupCollectionViewCell_artworkComponent))[18], "image");
  else
    return (UIImage *)0;
}

- (void)layoutSubviews
{
  _TtC16MusicApplication10PosterCell *v2;

  v2 = self;
  sub_C78F4();

}

- (void)setNeedsLayout
{
  uint64_t v3;
  _TtC16MusicApplication10PosterCell *v4;

  sub_4E684(0, (unint64_t *)&qword_14AD360, OS_dispatch_queue_ptr);
  v3 = swift_allocObject(&unk_1344948, 24, 7);
  *(_QWORD *)(v3 + 16) = self;
  v4 = self;
  static OS_dispatch_queue.asyncOnMainIfNeeded(_:)((uint64_t (*)(void))sub_CCE80, v3);
  swift_release(v3);

}

- (NSString)description
{
  _TtC16MusicApplication10PosterCell *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_C91A4();
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (NSString)accessibilityTitle
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication10PosterCell_title);
}

- (NSString)accessibilitySubtitle
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication10PosterCell_subtitle);
}

- (NSString)accessibilityDescriptionText
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication10PosterCell_descriptionText);
}

- (NSString)accessibilityAltText
{
  unint64_t v2;
  unint64_t v3;
  NSString v4;

  v2 = *(_QWORD *)&self->super.super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication10PosterCell_altText];
  if (v2)
    v3 = v2;
  else
    v3 = 0xE000000000000000;
  swift_bridgeObjectRetain(v2);
  v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  return (NSString *)v4;
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  swift_bridgeObjectRelease(*(_QWORD *)&self->super.super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication10PosterCell_title]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication10PosterCell_subtitle]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication10PosterCell_descriptionText]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication10PosterCell_overlayTitleText]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication10PosterCell_overlaySubtitleText]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication10PosterCell_altText]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication10PosterCell_badgeText]);
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication10PosterCell_videoLooperDidChangeHandler), *(_QWORD *)&self->super.super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication10PosterCell_videoLooperDidChangeHandler]);
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication10PosterCell_videoLooperDidFailHandler), *(_QWORD *)&self->super.super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication10PosterCell_videoLooperDidFailHandler]);
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication10PosterCell_isPlayingDidChangeHandler), *(_QWORD *)&self->super.super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication10PosterCell_isPlayingDidChangeHandler]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication10PosterCell_badgeView));
  v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.super.isa
                  + OBJC_IVAR____TtC16MusicApplication10PosterCell_textComponents);
  v4 = *(_QWORD *)&self->super.super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication10PosterCell_textComponents];
  v5 = *(_QWORD *)&self->super.super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication10PosterCell_textComponents + 8];
  v6 = *(_QWORD *)&self->super.super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication10PosterCell_textComponents
                                                     + 16];
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication10PosterCell_textComponents
                                                                          + 24]);
  swift_release(v6);
  swift_release(v5);
  swift_release(v4);
  swift_release(v3);
  sub_CC708(*(uint64_t *)((char *)&self->super.super.super.super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication10PosterCell____lazy_storage___overlayTextComponents), *(_QWORD *)&self->super.super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication10PosterCell____lazy_storage___overlayTextComponents], *(_QWORD *)&self->super.super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication10PosterCell____lazy_storage___overlayTextComponents+ 8]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication10PosterCell____lazy_storage___overlayTextStackView));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication10PosterCell_measurementTextStackViewComponent));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication10PosterCell____lazy_storage___measurementTextStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication10PosterCell____lazy_storage___gradientBottomView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication10PosterCell____lazy_storage___gradientTopView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication10PosterCell_shadowBackdropView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication10PosterCell____lazy_storage___symbolButton));
}

@end
