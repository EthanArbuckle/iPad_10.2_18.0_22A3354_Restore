@implementation RadioStationCell

- (_TtC16MusicApplication16RadioStationCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication16RadioStationCell *)sub_1D43BC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication16RadioStationCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1D5F64();
}

- (NSString)supertitle
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication16RadioStationCell_supertitle);
}

- (void)setSupertitle:(id)a3
{
  sub_185C50(self, (uint64_t)a2, a3, (void (*)(uint64_t, uint64_t))sub_1D4874);
}

- (NSString)title
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication16RadioStationCell_title);
}

- (void)setTitle:(id)a3
{
  sub_185C50(self, (uint64_t)a2, a3, (void (*)(uint64_t, uint64_t))sub_1D4968);
}

- (NSString)stationDescription
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication16RadioStationCell_stationDescription);
}

- (void)setStationDescription:(id)a3
{
  sub_185C50(self, (uint64_t)a2, a3, (void (*)(uint64_t, uint64_t))sub_1D4A64);
}

- (BOOL)accessibilityIsExplicit
{
  uint64_t v2;
  char v3;

  v2 = *(_QWORD *)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication16RadioStationCell_badgeView];
  if (v2)
    v3 = sub_A32CDC(0, *(_QWORD *)(v2 + OBJC_IVAR____TtC16MusicApplication9BadgeView_badgeSet));
  else
    v3 = 0;
  return v3 & 1;
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication16RadioStationCell_supertitle]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication16RadioStationCell_title]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication16RadioStationCell_stationDescription]);

  v3 = *(_QWORD *)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication16RadioStationCell_textComponents];
  v4 = *(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication16RadioStationCell_textComponents];
  v5 = *(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication16RadioStationCell_textComponents + 8];
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication16RadioStationCell_textComponents
                                                                    + 16]);
  swift_release(v5);
  swift_release(v4);
  swift_release(v3);
  v6 = &self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication16RadioStationCell_uniformTextComponents];
  v7 = *(_QWORD *)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication16RadioStationCell_uniformTextComponents];
  v8 = *((_QWORD *)v6 + 1);
  v9 = *((_QWORD *)v6 + 2);
  swift_bridgeObjectRelease(*((_QWORD *)v6 + 3));
  swift_release(v9);
  swift_release(v8);
  swift_release(v7);
}

@end
