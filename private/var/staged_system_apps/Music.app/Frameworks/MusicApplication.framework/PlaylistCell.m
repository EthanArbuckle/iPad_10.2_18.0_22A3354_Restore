@implementation PlaylistCell

- (_TtC16MusicApplication12PlaylistCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication12PlaylistCell *)sub_4256B0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication12PlaylistCell)initWithCoder:(id)a3
{
  unsigned __int8 *v4;
  unsigned __int8 *v5;
  uint64_t *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  _TtC16MusicApplication12PlaylistCell *result;

  v4 = &self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication12PlaylistCell_title];
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = 0xE000000000000000;
  v5 = &self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication12PlaylistCell_subtitle];
  *(_QWORD *)v5 = 0;
  *((_QWORD *)v5 + 1) = 0xE000000000000000;
  v6 = (uint64_t *)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication12PlaylistCell_textComponents];
  v7 = a3;
  *v6 = sub_426284();
  v6[1] = v8;
  v6[2] = v9;

  result = (_TtC16MusicApplication12PlaylistCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/PlaylistCell.swift", 35, 2, 28, 0);
  __break(1u);
  return result;
}

- (NSString)title
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication12PlaylistCell_title);
}

- (void)setTitle:(id)a3
{
  sub_185C50(self, (uint64_t)a2, a3, (void (*)(uint64_t, uint64_t))sub_425BD8);
}

- (NSString)subtitle
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication12PlaylistCell_subtitle);
}

- (void)setSubtitle:(id)a3
{
  sub_185C50(self, (uint64_t)a2, a3, (void (*)(uint64_t, uint64_t))sub_425CAC);
}

- (BOOL)isDisabled
{
  return self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication34HorizontalLockupCollectionViewCell_isDisabled];
}

- (void)setIsDisabled:(BOOL)a3
{
  uint64_t v4;
  double v5;
  _TtC16MusicApplication12PlaylistCell *v6;

  v4 = OBJC_IVAR____TtC16MusicApplication34HorizontalLockupCollectionViewCell_isDisabled;
  self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication34HorizontalLockupCollectionViewCell_isDisabled] = a3;
  v6 = self;
  sub_4C5898();
  v5 = 1.0;
  if (self->super.UICollectionViewTableCell_opaque[v4])
    v5 = 0.5;
  objc_msgSend(*(id *)(*(_QWORD *)&v6->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication34HorizontalLockupCollectionViewCell_artworkComponent]+ 144), "setAlpha:", v5);

}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4;
  _TtC16MusicApplication12PlaylistCell *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = -[PlaylistCell traitCollection](v5, "traitCollection");
  sub_4C8EE0(v6, *(_QWORD *)&v5->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication12PlaylistCell_textComponents + 8], 102.0, 102.0, 7.0, 0.0, 7.0, 16.0);

  objc_msgSend(v4, "frame");
  objc_msgSend(v4, "setFrame:");

  return v4;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC16MusicApplication12PlaylistCell *v6;

  v5 = a3;
  v6 = self;
  sub_425F20((uint64_t)a3);

}

- (void).cxx_destruct
{
  unsigned __int8 *v3;
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication12PlaylistCell_title]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication12PlaylistCell_subtitle]);
  v3 = &self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication12PlaylistCell_textComponents];
  v4 = *(_QWORD *)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication12PlaylistCell_textComponents];
  v5 = *((_QWORD *)v3 + 1);
  swift_bridgeObjectRelease(*((_QWORD *)v3 + 2));
  swift_release(v5);
  swift_release(v4);
}

@end
