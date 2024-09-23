@implementation FeaturedPlaylistCell

- (_TtC16MusicApplication20FeaturedPlaylistCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication20FeaturedPlaylistCell *)sub_262280(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication20FeaturedPlaylistCell)initWithCoder:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  _TtC16MusicApplication20FeaturedPlaylistCell *result;

  v4 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplication20FeaturedPlaylistCell_name);
  *v4 = 0;
  v4[1] = 0xE000000000000000;
  v5 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplication20FeaturedPlaylistCell_descriptionText);
  *v5 = 0;
  v5[1] = 0xE000000000000000;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC16MusicApplication20FeaturedPlaylistCell_badgeView) = 0;
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC16MusicApplication20FeaturedPlaylistCell_textComponents);
  v7 = a3;
  *v6 = sub_262AE0();
  v6[1] = v8;
  v6[2] = v9;

  result = (_TtC16MusicApplication20FeaturedPlaylistCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/FeaturedPlaylistCell.swift", 43, 2, 30, 0);
  __break(1u);
  return result;
}

- (NSString)name
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication20FeaturedPlaylistCell_name);
}

- (void)setName:(id)a3
{
  sub_185C50(self, (uint64_t)a2, a3, (void (*)(uint64_t, uint64_t))sub_2626B4);
}

- (NSString)descriptionText
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication20FeaturedPlaylistCell_descriptionText);
}

- (void)setDescriptionText:(id)a3
{
  sub_185C50(self, (uint64_t)a2, a3, (void (*)(uint64_t, uint64_t))sub_262788);
}

+ (UIEdgeInsets)visualContentInsets
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int128 v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _BYTE v14[24];
  UIEdgeInsets result;

  v2 = sub_262AE0();
  v4 = v3;
  v6 = v5;
  if (qword_14AB8E8 != -1)
    swift_once(&qword_14AB8E8, sub_7A5960);
  v7 = xmmword_1580EB0;
  v8 = qword_1580EC8;
  swift_beginAccess(v4 + 32, v14, 0, 0);
  v9 = *(double *)(v4 + 104);
  swift_bridgeObjectRelease(v6);
  swift_release(v4);
  swift_release(v2);
  *(_QWORD *)&v11 = v7 >> 64;
  *(_QWORD *)&v10 = v7;
  v12 = v9;
  v13 = *(double *)&v8;
  result.right = v13;
  result.bottom = v12;
  result.left = v11;
  result.top = v10;
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication20FeaturedPlaylistCell_name]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication20FeaturedPlaylistCell_descriptionText]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication20FeaturedPlaylistCell_badgeView));
  v3 = (char *)self + OBJC_IVAR____TtC16MusicApplication20FeaturedPlaylistCell_textComponents;
  v4 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                  + OBJC_IVAR____TtC16MusicApplication20FeaturedPlaylistCell_textComponents);
  v5 = *((_QWORD *)v3 + 1);
  swift_bridgeObjectRelease(*((_QWORD *)v3 + 2));
  swift_release(v5);
  swift_release(v4);
}

@end
