@implementation CustomRoomMusicVideoCell

- (_TtC16MusicApplication24CustomRoomMusicVideoCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication24CustomRoomMusicVideoCell *)sub_33162C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication24CustomRoomMusicVideoCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_333E98();
}

- (NSString)headlineText
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication24CustomRoomMusicVideoCell_headlineText);
}

- (void)setHeadlineText:(id)a3
{
  sub_185C50(self, (uint64_t)a2, a3, (void (*)(uint64_t, uint64_t))sub_331A20);
}

- (NSString)title
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication24CustomRoomMusicVideoCell_title);
}

- (void)setTitle:(id)a3
{
  sub_185C50(self, (uint64_t)a2, a3, (void (*)(uint64_t, uint64_t))sub_331B48);
}

- (NSString)subtitle
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication24CustomRoomMusicVideoCell_subtitle);
}

- (void)setSubtitle:(id)a3
{
  sub_185C50(self, (uint64_t)a2, a3, (void (*)(uint64_t, uint64_t))sub_331C70);
}

- (NSString)descriptionText
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication24CustomRoomMusicVideoCell_descriptionText);
}

- (void)setDescriptionText:(id)a3
{
  sub_185C50(self, (uint64_t)a2, a3, (void (*)(uint64_t, uint64_t))sub_331D98);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CustomRoomMusicVideoCell(0);
  v4 = a3;
  v5 = v7.receiver;
  -[VerticalLockupCollectionViewCell traitCollectionDidChange:](&v7, "traitCollectionDidChange:", v4);
  v6 = objc_msgSend(v5, "traitCollection", v7.receiver, v7.super_class);
  if (objc_msgSend(v6, "horizontalSizeClass"))
    sub_332E54();

}

- (void)layoutSubviews
{
  _TtC16MusicApplication24CustomRoomMusicVideoCell *v2;

  v2 = self;
  sub_332780();

}

+ (UIEdgeInsets)visualContentInsets
{
  uint64_t v2;
  double v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  _BYTE v9[24];
  uint64_t v10[3];
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  UIEdgeInsets result;

  sub_333BDC(v10);
  v2 = v11;
  swift_beginAccess(v11 + 32, v9, 0, 0);
  v3 = *(double *)(v2 + 104);
  swift_release(v10[0]);
  swift_release(v10[1]);
  v4 = v10[2];
  swift_release(v2);
  swift_release(v4);
  v13 = v12;
  sub_95058(&v13);
  v5 = 0.0;
  v6 = 0.0;
  v7 = 0.0;
  v8 = v3;
  result.right = v7;
  result.bottom = v8;
  result.left = v6;
  result.top = v5;
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  swift_bridgeObjectRelease(*(_QWORD *)&self->super.super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication24CustomRoomMusicVideoCell_headlineText]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication24CustomRoomMusicVideoCell_title]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication24CustomRoomMusicVideoCell_subtitle]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication24CustomRoomMusicVideoCell_descriptionText]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication24CustomRoomMusicVideoCell_badgeView));
  v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.super.isa
                  + OBJC_IVAR____TtC16MusicApplication24CustomRoomMusicVideoCell_textComponents);
  v4 = *(_QWORD *)&self->super.super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication24CustomRoomMusicVideoCell_textComponents];
  v5 = *(_QWORD *)&self->super.super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication24CustomRoomMusicVideoCell_textComponents
                                                     + 8];
  v6 = *(_QWORD *)&self->super.super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication24CustomRoomMusicVideoCell_textComponents
                                                     + 16];
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication24CustomRoomMusicVideoCell_textComponents
                                                                          + 24]);
  swift_release(v6);
  swift_release(v5);
  swift_release(v4);
  swift_release(v3);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication24CustomRoomMusicVideoCell_headlineTextDrawingView));
}

@end
