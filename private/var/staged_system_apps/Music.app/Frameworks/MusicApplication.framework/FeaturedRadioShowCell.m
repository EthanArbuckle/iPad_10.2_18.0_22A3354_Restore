@implementation FeaturedRadioShowCell

- (_TtC16MusicApplication21FeaturedRadioShowCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication21FeaturedRadioShowCell *)sub_556B50(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication21FeaturedRadioShowCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_557A3C();
}

- (NSString)headline
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication21FeaturedRadioShowCell_headline);
}

- (void)setHeadline:(id)a3
{
  sub_185C50(self, (uint64_t)a2, a3, (void (*)(uint64_t, uint64_t))sub_55702C);
}

- (NSString)title
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication21FeaturedRadioShowCell_title);
}

- (void)setTitle:(id)a3
{
  sub_185C50(self, (uint64_t)a2, a3, (void (*)(uint64_t, uint64_t))sub_557100);
}

- (NSString)subtitle
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication21FeaturedRadioShowCell_subtitle);
}

- (void)setSubtitle:(id)a3
{
  sub_185C50(self, (uint64_t)a2, a3, (void (*)(uint64_t, uint64_t))sub_5571D8);
}

- (BOOL)accessibilityIsExplicit
{
  uint64_t v2;
  char v3;

  v2 = *(_QWORD *)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication21FeaturedRadioShowCell_badgeView];
  if (v2)
    v3 = sub_A32CDC(0, *(_QWORD *)(v2 + OBJC_IVAR____TtC16MusicApplication9BadgeView_badgeSet));
  else
    v3 = 0;
  return v3 & 1;
}

- (void).cxx_destruct
{
  unsigned __int8 *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication21FeaturedRadioShowCell_headline]);

  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication21FeaturedRadioShowCell_title]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication21FeaturedRadioShowCell_subtitle]);

  v3 = &self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication21FeaturedRadioShowCell_textComponents];
  v4 = *(_QWORD *)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication21FeaturedRadioShowCell_textComponents];
  v5 = *((_QWORD *)v3 + 1);
  v6 = *((_QWORD *)v3 + 2);
  swift_bridgeObjectRelease(*((_QWORD *)v3 + 3));
  swift_release(v6);
  swift_release(v5);
  swift_release(v4);
}

@end
