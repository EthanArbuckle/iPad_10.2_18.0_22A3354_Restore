@implementation PersonHorizontalCell

- (_TtC16MusicApplication20PersonHorizontalCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication20PersonHorizontalCell *)sub_352DE4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication20PersonHorizontalCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_354668();
}

- (BOOL)showsContextMenu
{
  return 0;
}

- (void)layoutSubviews
{
  _TtC16MusicApplication20PersonHorizontalCell *v2;

  v2 = self;
  sub_3536E4();

}

- (NSString)accessibilityPersonName
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication20PersonHorizontalCell_name);
}

- (NSString)accessibilityPersonSubtitle
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication20PersonHorizontalCell_subtitle);
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;

  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication20PersonHorizontalCell_name]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication20PersonHorizontalCell_subtitle]);
  v3 = *(_QWORD *)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication20PersonHorizontalCell_textComponents];
  v4 = *(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication20PersonHorizontalCell_textComponents];
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication20PersonHorizontalCell_textComponents
                                                                    + 8]);
  swift_release(v4);
  swift_release(v3);

}

@end
