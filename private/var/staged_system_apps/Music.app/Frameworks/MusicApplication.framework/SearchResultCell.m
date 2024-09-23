@implementation SearchResultCell

- (_TtC16MusicApplication16SearchResultCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication16SearchResultCell *)sub_8B4114(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication16SearchResultCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_8B7008();
}

- (NSString)title
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication16SearchResultCell_title);
}

- (void)setTitle:(id)a3
{
  sub_185C50(self, (uint64_t)a2, a3, (void (*)(uint64_t, uint64_t))sub_8B48C4);
}

- (NSString)subtitle
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication16SearchResultCell_subtitle);
}

- (void)setSubtitle:(id)a3
{
  sub_185C50(self, (uint64_t)a2, a3, (void (*)(uint64_t, uint64_t))sub_8B49EC);
}

- (NSString)additionalDescription
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication16SearchResultCell_additionalDescription);
}

- (void)setAdditionalDescription:(id)a3
{
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC16MusicApplication16SearchResultCell *v11;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = (uint64_t *)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication16SearchResultCell_additionalDescription];
  v7 = *(_QWORD *)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication16SearchResultCell_additionalDescription];
  v8 = *(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication16SearchResultCell_additionalDescription];
  *v6 = v5;
  v6[1] = v9;
  v10 = a3;
  v11 = self;
  sub_8B4C78(v7, v8);

  swift_bridgeObjectRelease();
}

- (void)layoutSubviews
{
  _TtC16MusicApplication16SearchResultCell *v2;

  v2 = self;
  sub_8B4D94();

}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4;
  _TtC16MusicApplication16SearchResultCell *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = -[SearchResultCell traitCollection](v5, "traitCollection");
  sub_8B6CB4(v6);

  objc_msgSend(v4, "frame");
  objc_msgSend(v4, "setFrame:");

  return v4;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC16MusicApplication16SearchResultCell *v6;

  v5 = a3;
  v6 = self;
  sub_8B5360(a3);

}

- (BOOL)accessibilityIsExplicit
{
  uint64_t v2;
  char v3;

  v2 = *(_QWORD *)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication16SearchResultCell_badgeView];
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
  uint64_t v6;

  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication16SearchResultCell_title]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication16SearchResultCell_subtitle]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication16SearchResultCell_additionalDescription]);

  v3 = *(_QWORD *)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication16SearchResultCell_textComponents];
  v4 = *(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication16SearchResultCell_textComponents];
  v5 = *(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication16SearchResultCell_textComponents + 8];
  v6 = *(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication16SearchResultCell_textComponents
                                               + 16];
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication16SearchResultCell_textComponents
                                                                    + 24]);
  swift_release(v6);
  swift_release(v5);
  swift_release(v4);
  swift_release(v3);

}

@end
