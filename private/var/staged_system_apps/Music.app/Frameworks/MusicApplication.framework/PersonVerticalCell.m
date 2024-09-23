@implementation PersonVerticalCell

- (_TtC16MusicApplication18PersonVerticalCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication18PersonVerticalCell *)sub_4BF260(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication18PersonVerticalCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_4C1034();
}

- (NSString)title
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication18PersonVerticalCell_title);
}

- (void)setTitle:(id)a3
{
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC16MusicApplication18PersonVerticalCell *v11;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC16MusicApplication18PersonVerticalCell_title);
  v7 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                  + OBJC_IVAR____TtC16MusicApplication18PersonVerticalCell_title);
  v8 = *(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication18PersonVerticalCell_title];
  *v6 = v5;
  v6[1] = v9;
  v10 = a3;
  v11 = self;
  sub_4BFF0C(v7, v8);

  swift_bridgeObjectRelease(v8);
}

- (NSString)subtitle
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication18PersonVerticalCell_subtitle);
}

- (void)setSubtitle:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _TtC16MusicApplication18PersonVerticalCell *v8;
  id v9;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v7 = v6;
  v9 = a3;
  v8 = self;
  sub_4C00A0(v5, v7);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC16MusicApplication18PersonVerticalCell *v6;

  v5 = a3;
  v6 = self;
  sub_4C0200(a3);

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication18PersonVerticalCell_title]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication18PersonVerticalCell_subtitle]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication18PersonVerticalCell_badgeView));
  v3 = (char *)self + OBJC_IVAR____TtC16MusicApplication18PersonVerticalCell_textComponents;
  v4 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                  + OBJC_IVAR____TtC16MusicApplication18PersonVerticalCell_textComponents);
  v5 = *((_QWORD *)v3 + 1);
  swift_bridgeObjectRelease(*((_QWORD *)v3 + 2));
  swift_release(v5);
  swift_release(v4);
}

+ (double)visualContentInsets
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  double v4;
  _BYTE v6[24];
  _BYTE v7[264];
  _BYTE v8[264];
  __int128 v9[5];
  __int128 v10[5];

  if (qword_14AB328 != -1)
    swift_once(&qword_14AB328, sub_4C07CC);
  v10[2] = xmmword_14CE2E0;
  v10[3] = *(_OWORD *)&qword_14CE2F0;
  v10[4] = xmmword_14CE300;
  v10[0] = xmmword_14CE2C0;
  v10[1] = xmmword_14CE2D0;
  v0 = type metadata accessor for TextStackView.Component();
  swift_initStackObject(v0, v8);
  v1 = TextStackView.Component.init(identifier:labelProperties:)(0x656C746974, 0xE500000000000000, v10);
  sub_2AB3E0((uint64_t)v10);
  v2 = qword_14AB330;
  swift_retain(v1);
  if (v2 != -1)
    swift_once(&qword_14AB330, sub_4C08A8);
  v9[2] = xmmword_14CE330;
  v9[3] = *(_OWORD *)&qword_14CE340;
  v9[4] = xmmword_14CE350;
  v9[0] = xmmword_14CE310;
  v9[1] = xmmword_14CE320;
  swift_initStackObject(v0, v7);
  v3 = TextStackView.Component.init(identifier:labelProperties:)(0x656C746974627573, 0xE800000000000000, v9);
  sub_2AB3E0((uint64_t)v9);
  if (qword_14AB8E8 != -1)
    swift_once(&qword_14AB8E8, sub_7A5960);
  v4 = *(double *)&xmmword_1580EB0;
  swift_beginAccess(v1 + 32, v6, 0, 0);
  swift_release(v3);
  swift_release_n(v1, 2);
  return v4;
}

@end
