@implementation FeaturedShowcaseCell

- (_TtC16MusicApplication20FeaturedShowcaseCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication20FeaturedShowcaseCell *)sub_4724CC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication20FeaturedShowcaseCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_474FF4();
}

- (NSString)headline
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication20FeaturedShowcaseCell_headline);
}

- (void)setHeadline:(id)a3
{
  sub_473114((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC16MusicApplication20FeaturedShowcaseCell_headline, (void (*)(uint64_t, uint64_t))sub_472A38);
}

- (NSString)title
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication20FeaturedShowcaseCell_title);
}

- (void)setTitle:(id)a3
{
  sub_473114((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC16MusicApplication20FeaturedShowcaseCell_title, (void (*)(uint64_t, uint64_t))sub_472CFC);
}

- (NSString)subtitle
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication20FeaturedShowcaseCell_subtitle);
}

- (void)setSubtitle:(id)a3
{
  sub_473114((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC16MusicApplication20FeaturedShowcaseCell_subtitle, (void (*)(uint64_t, uint64_t))sub_472FC0);
}

- (NSString)descriptionText
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication20FeaturedShowcaseCell_descriptionText);
}

- (void)setDescriptionText:(id)a3
{
  sub_473114((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC16MusicApplication20FeaturedShowcaseCell_descriptionText, (void (*)(uint64_t, uint64_t))sub_4731CC);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC16MusicApplication20FeaturedShowcaseCell *v6;

  v5 = a3;
  v6 = self;
  sub_473AE0(a3);

}

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  sub_473D1C(self, (uint64_t)a2, (SEL *)&selRef_bounds);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  sub_473D70(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, (const char **)&selRef_bounds, (SEL *)&selRef_setBounds_);
}

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  sub_473D1C(self, (uint64_t)a2, (SEL *)&selRef_frame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  sub_473D70(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, (const char **)&selRef_frame, (SEL *)&selRef_setFrame_);
}

- (void)layoutSubviews
{
  _TtC16MusicApplication20FeaturedShowcaseCell *v2;

  v2 = self;
  sub_473F10();

}

- (NSString)accessibilityHeadline
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;
  uint64_t v7;
  _BYTE v8[24];

  v2 = (uint64_t *)((char *)self + OBJC_IVAR____TtC16MusicApplication20FeaturedShowcaseCell_textComponents);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC16MusicApplication20FeaturedShowcaseCell_textComponents, v8, 0, 0);
  v3 = *v2;
  swift_beginAccess(*v2 + 112, &v7, 0, 0);
  v4 = *(_QWORD *)(v3 + 120);
  swift_bridgeObjectRetain(v4);
  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (NSString)accessibilityTitle
{
  char *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;
  uint64_t v7;
  _BYTE v8[24];

  v2 = (char *)self + OBJC_IVAR____TtC16MusicApplication20FeaturedShowcaseCell_textComponents;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC16MusicApplication20FeaturedShowcaseCell_textComponents, v8, 0, 0);
  v3 = *((_QWORD *)v2 + 1);
  swift_beginAccess(v3 + 112, &v7, 0, 0);
  v4 = *(_QWORD *)(v3 + 120);
  swift_bridgeObjectRetain(v4);
  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (NSString)accessibilitySubtitle
{
  char *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;
  uint64_t v7;
  _BYTE v8[24];

  v2 = (char *)self + OBJC_IVAR____TtC16MusicApplication20FeaturedShowcaseCell_textComponents;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC16MusicApplication20FeaturedShowcaseCell_textComponents, v8, 0, 0);
  v3 = *((_QWORD *)v2 + 2);
  swift_beginAccess(v3 + 112, &v7, 0, 0);
  v4 = *(_QWORD *)(v3 + 120);
  swift_bridgeObjectRetain(v4);
  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (NSString)accessibilityDescription
{
  char *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;
  uint64_t v7;
  _BYTE v8[24];

  v2 = (char *)self + OBJC_IVAR____TtC16MusicApplication20FeaturedShowcaseCell_textComponents;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC16MusicApplication20FeaturedShowcaseCell_textComponents, v8, 0, 0);
  v3 = *((_QWORD *)v2 + 3);
  swift_beginAccess(v3 + 112, &v7, 0, 0);
  v4 = *(_QWORD *)(v3 + 120);
  swift_bridgeObjectRetain(v4);
  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (void).cxx_destruct
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication20FeaturedShowcaseCell_headline]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication20FeaturedShowcaseCell_title]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication20FeaturedShowcaseCell_subtitle]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication20FeaturedShowcaseCell_descriptionText]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication20FeaturedShowcaseCell_badgeView));
  v3 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplication20FeaturedShowcaseCell_textComponents);
  v4 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                  + OBJC_IVAR____TtC16MusicApplication20FeaturedShowcaseCell_textComponents);
  v5 = v3[1];
  v6 = v3[2];
  v7 = v3[3];
  swift_bridgeObjectRelease(v3[4]);
  swift_release(v7);
  swift_release(v6);
  swift_release(v5);
  swift_release(v4);
}

@end
