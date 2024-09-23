@implementation RankedMusicVideoVerticalCell

- (_TtC16MusicApplication28RankedMusicVideoVerticalCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication28RankedMusicVideoVerticalCell *)sub_96F004(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication28RankedMusicVideoVerticalCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_97020C();
}

- (NSString)title
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication28RankedMusicVideoVerticalCell_title);
}

- (void)setTitle:(id)a3
{
  sub_185C50(self, (uint64_t)a2, a3, (void (*)(uint64_t, uint64_t))sub_96F4EC);
}

- (NSString)artistName
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication28RankedMusicVideoVerticalCell_artistName);
}

- (void)setArtistName:(id)a3
{
  sub_185C50(self, (uint64_t)a2, a3, (void (*)(uint64_t, uint64_t))sub_96F5C4);
}

- (void)layoutSubviews
{
  _TtC16MusicApplication28RankedMusicVideoVerticalCell *v2;

  v2 = self;
  sub_96F684();

}

+ (UIEdgeInsets)visualContentInsets
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int128 v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _BYTE v14[24];
  UIEdgeInsets result;

  v2 = sub_96FD8C();
  v4 = v3;
  v6 = v5;
  if (qword_14ABC28 != -1)
    swift_once(&qword_14ABC28, sub_96FA94);
  v7 = xmmword_14EAB88;
  swift_beginAccess(v6 + 32, v14, 0, 0);
  v8 = *(double *)(v6 + 104);
  v9 = qword_14EABA0;
  swift_bridgeObjectRelease();
  swift_release(v6);
  swift_release(v4);
  swift_release(v2);
  *(_QWORD *)&v11 = v7 >> 64;
  *(_QWORD *)&v10 = v7;
  v12 = v8;
  v13 = *(double *)&v9;
  result.right = v13;
  result.bottom = v12;
  result.left = v11;
  result.top = v10;
  return result;
}

- (NSString)accessibilityRankString
{
  uint64_t v2;
  uint64_t v3;
  NSString v4;
  _BYTE v6[24];

  v2 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                  + OBJC_IVAR____TtC16MusicApplication28RankedMusicVideoVerticalCell_textComponents);
  swift_beginAccess(v2 + 112, v6, 0, 0);
  v3 = *(_QWORD *)(v2 + 120);
  swift_bridgeObjectRetain(v3);
  v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  return (NSString *)v4;
}

- (BOOL)accessibilityIsExplicit
{
  uint64_t v2;
  char v3;

  v2 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                  + OBJC_IVAR____TtC16MusicApplication28RankedMusicVideoVerticalCell_badgeView);
  if (v2)
    v3 = sub_A32CDC(0, *(_QWORD *)(v2 + OBJC_IVAR____TtC16MusicApplication9BadgeView_badgeSet));
  else
    v3 = 0;
  return v3 & 1;
}

- (void).cxx_destruct
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication28RankedMusicVideoVerticalCell_title]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication28RankedMusicVideoVerticalCell_artistName]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication28RankedMusicVideoVerticalCell_badgeView));
  v3 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplication28RankedMusicVideoVerticalCell_textComponents);
  v4 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                  + OBJC_IVAR____TtC16MusicApplication28RankedMusicVideoVerticalCell_textComponents);
  v5 = v3[1];
  v6 = v3[2];
  swift_bridgeObjectRelease(v3[3]);
  swift_release(v6);
  swift_release(v5);
  swift_release(v4);
}

@end
