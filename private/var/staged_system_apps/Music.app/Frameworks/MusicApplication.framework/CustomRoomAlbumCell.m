@implementation CustomRoomAlbumCell

- (_TtC16MusicApplication19CustomRoomAlbumCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication19CustomRoomAlbumCell *)sub_AAEFD0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication19CustomRoomAlbumCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_AB1B10();
}

- (NSString)headlineText
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication19CustomRoomAlbumCell_headlineText);
}

- (void)setHeadlineText:(id)a3
{
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC16MusicApplication19CustomRoomAlbumCell *v11;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC16MusicApplication19CustomRoomAlbumCell_headlineText);
  v7 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                  + OBJC_IVAR____TtC16MusicApplication19CustomRoomAlbumCell_headlineText);
  v8 = *(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication19CustomRoomAlbumCell_headlineText];
  *v6 = v5;
  v6[1] = v9;
  v10 = a3;
  v11 = self;
  sub_AAF5D8(v7, v8);

  swift_bridgeObjectRelease();
}

- (NSString)title
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication19CustomRoomAlbumCell_title);
}

- (void)setTitle:(id)a3
{
  sub_185C50(self, (uint64_t)a2, a3, (void (*)(uint64_t, uint64_t))sub_AAF774);
}

- (NSString)subtitle
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication19CustomRoomAlbumCell_subtitle);
}

- (void)setSubtitle:(id)a3
{
  sub_185C50(self, (uint64_t)a2, a3, (void (*)(uint64_t, uint64_t))sub_AAF848);
}

- (NSString)descriptionText
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication19CustomRoomAlbumCell_descriptionText);
}

- (void)setDescriptionText:(id)a3
{
  sub_185C50(self, (uint64_t)a2, a3, (void (*)(uint64_t, uint64_t))sub_AAF920);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CustomRoomAlbumCell(0);
  v4 = a3;
  v5 = v7.receiver;
  -[VerticalLockupCollectionViewCell traitCollectionDidChange:](&v7, "traitCollectionDidChange:", v4);
  v6 = objc_msgSend(v5, "traitCollection", v7.receiver, v7.super_class);
  if (objc_msgSend(v6, "horizontalSizeClass"))
    sub_AB0940();

}

- (void)layoutSubviews
{
  _TtC16MusicApplication19CustomRoomAlbumCell *v2;

  v2 = self;
  sub_AB0378();

}

+ (UIEdgeInsets)visualContentInsets
{
  uint64_t v2;
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  _BYTE v9[24];
  UIEdgeInsets result;

  sub_AB1748();
  v3 = v2;
  swift_beginAccess(v2 + 32, v9, 0, 0);
  v4 = *(double *)(v3 + 104);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  v5 = 0.0;
  v6 = 0.0;
  v7 = 0.0;
  v8 = v4;
  result.right = v7;
  result.bottom = v8;
  result.left = v6;
  result.top = v5;
  return result;
}

- (void).cxx_destruct
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication19CustomRoomAlbumCell_headlineText]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication19CustomRoomAlbumCell_title]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication19CustomRoomAlbumCell_subtitle]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication19CustomRoomAlbumCell_descriptionText]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication19CustomRoomAlbumCell_badgeView));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication19CustomRoomAlbumCell_headlineTextComponent));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication19CustomRoomAlbumCell_headlineTextDrawingView));
  v3 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplication19CustomRoomAlbumCell_itemTextComponents);
  v4 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                  + OBJC_IVAR____TtC16MusicApplication19CustomRoomAlbumCell_itemTextComponents);
  v5 = v3[1];
  v6 = v3[2];
  swift_bridgeObjectRelease(v3[3]);
  swift_release(v6);
  swift_release(v5);
  swift_release(v4);
}

@end
