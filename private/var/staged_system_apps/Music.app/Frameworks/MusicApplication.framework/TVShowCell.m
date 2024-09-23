@implementation TVShowCell

- (_TtC16MusicApplication10TVShowCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication10TVShowCell *)TVShowCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication10TVShowCell)initWithCoder:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  _TtC16MusicApplication10TVShowCell *result;

  v4 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplication10TVShowCell_title);
  *v4 = 0;
  v4[1] = 0xE000000000000000;
  v5 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplication10TVShowCell_subtitle);
  *v5 = 0;
  v5[1] = 0xE000000000000000;
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC16MusicApplication10TVShowCell_textComponents);
  v7 = a3;
  *v6 = _s16MusicApplication10TVShowCellC14textComponents33_8C9A864756C05C79127AAB0A92CC6C03LLAC04TextF0AELLVvpfi_0();
  v6[1] = v8;
  v6[2] = v9;

  result = (_TtC16MusicApplication10TVShowCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/TVShowCell.swift", 33, 2, 32, 0);
  __break(1u);
  return result;
}

- (NSString)title
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication10TVShowCell_title);
}

- (void)setTitle:(id)a3
{
  sub_185C50(self, (uint64_t)a2, a3, (void (*)(uint64_t, uint64_t))sub_8A136C);
}

- (NSString)subtitle
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication10TVShowCell_subtitle);
}

- (void)setSubtitle:(id)a3
{
  sub_185C50(self, (uint64_t)a2, a3, (void (*)(uint64_t, uint64_t))sub_8A1440);
}

+ (UIEdgeInsets)visualContentInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  if (qword_14AB8A0 != -1)
    swift_once(&qword_14AB8A0, sub_782A64);
  v3 = *((double *)&xmmword_1580E30 + 1);
  v2 = *(double *)&xmmword_1580E30;
  v4 = *(double *)&qword_1580E40;
  v5 = unk_1580E48;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication10TVShowCell_title]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication10TVShowCell_subtitle]);
  v3 = (char *)self + OBJC_IVAR____TtC16MusicApplication10TVShowCell_textComponents;
  v4 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                  + OBJC_IVAR____TtC16MusicApplication10TVShowCell_textComponents);
  v5 = *((_QWORD *)v3 + 1);
  swift_bridgeObjectRelease(*((_QWORD *)v3 + 2));
  swift_release(v5);
  swift_release(v4);
}

@end
