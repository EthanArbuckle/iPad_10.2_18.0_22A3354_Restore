@implementation ShowcaseCell

- (_TtC16MusicApplication12ShowcaseCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication12ShowcaseCell *)sub_1E2400(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication12ShowcaseCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1E5678();
}

- (void)layoutSubviews
{
  _TtC16MusicApplication12ShowcaseCell *v2;

  v2 = self;
  sub_1E3558();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC16MusicApplication12ShowcaseCell *v6;

  v5 = a3;
  v6 = self;
  sub_1E3E8C(a3);

}

- (NSString)accessibilityHeadline
{
  unsigned __int8 *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;
  uint64_t v7;
  _BYTE v8[24];

  v2 = &self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication12ShowcaseCell_textComponents];
  swift_beginAccess((char *)self + OBJC_IVAR____TtC16MusicApplication12ShowcaseCell_textComponents, v8, 0, 0);
  v3 = *(_QWORD *)v2;
  swift_beginAccess(*(_QWORD *)v2 + 112, &v7, 0, 0);
  v4 = *(_QWORD *)(v3 + 120);
  swift_bridgeObjectRetain(v4);
  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (NSString)accessibilityTitle
{
  unsigned __int8 *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;
  uint64_t v7;
  _BYTE v8[24];

  v2 = &self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication12ShowcaseCell_textComponents];
  swift_beginAccess((char *)self + OBJC_IVAR____TtC16MusicApplication12ShowcaseCell_textComponents, v8, 0, 0);
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
  unsigned __int8 *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;
  uint64_t v7;
  _BYTE v8[24];

  v2 = &self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication12ShowcaseCell_textComponents];
  swift_beginAccess((char *)self + OBJC_IVAR____TtC16MusicApplication12ShowcaseCell_textComponents, v8, 0, 0);
  v3 = *((_QWORD *)v2 + 2);
  swift_beginAccess(v3 + 112, &v7, 0, 0);
  v4 = *(_QWORD *)(v3 + 120);
  swift_bridgeObjectRetain(v4);
  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (BOOL)accessibilityIsExplicit
{
  uint64_t v2;
  char v3;

  v2 = *(_QWORD *)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication12ShowcaseCell_badgeView];
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

  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication12ShowcaseCell_headline]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication12ShowcaseCell_title]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication12ShowcaseCell_subtitle]);

  v3 = *(_QWORD *)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication12ShowcaseCell_textComponents];
  v4 = *(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication12ShowcaseCell_textComponents];
  v5 = *(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication12ShowcaseCell_textComponents + 8];
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication12ShowcaseCell_textComponents
                                                                    + 16]);
  swift_release(v5);
  swift_release(v4);
  swift_release(v3);
  swift_release(*(_QWORD *)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication12ShowcaseCell_measurementTextStackViewComponent]);

}

@end
