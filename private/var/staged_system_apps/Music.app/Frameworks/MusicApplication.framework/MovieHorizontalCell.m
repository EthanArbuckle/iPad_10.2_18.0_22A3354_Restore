@implementation MovieHorizontalCell

- (_TtC16MusicApplication19MovieHorizontalCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication19MovieHorizontalCell *)sub_998E0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication19MovieHorizontalCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_9AE78();
}

- (NSString)title
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication19MovieHorizontalCell_title];
  swift_bridgeObjectRetain(v2);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (void)setTitle:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _TtC16MusicApplication19MovieHorizontalCell *v8;
  id v9;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v7 = v6;
  v9 = a3;
  v8 = self;
  sub_99DF8(v5, v7);

}

- (NSDate)releaseDate
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  unsigned __int8 *v6;
  uint64_t v7;
  uint64_t v8;
  Class isa;
  _BYTE v12[24];

  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_14AD5F0);
  __chkstk_darwin(v3);
  v5 = &v12[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v6 = &self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication19MovieHorizontalCell_releaseDate];
  swift_beginAccess(v6, v12, 0, 0);
  sub_9AB3C((uint64_t)v6, (uint64_t)v5);
  v7 = type metadata accessor for Date(0);
  v8 = *(_QWORD *)(v7 - 8);
  isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSDate *)isa;
}

- (void)setReleaseDate:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  unsigned __int8 *v14;
  _TtC16MusicApplication19MovieHorizontalCell *v15;
  _BYTE v16[24];
  _BYTE v17[24];

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_14AD5F0);
  __chkstk_darwin(v5);
  v7 = &v16[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = __chkstk_darwin(v8);
  v11 = &v16[-v10];
  if (a3)
  {
    static Date._unconditionallyBridgeFromObjectiveC(_:)(a3, v9);
    v12 = type metadata accessor for Date(0);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 0, 1, v12);
  }
  else
  {
    v13 = type metadata accessor for Date(0);
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v11, 1, 1, v13);
  }
  v14 = &self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication19MovieHorizontalCell_releaseDate];
  swift_beginAccess((char *)self + OBJC_IVAR____TtC16MusicApplication19MovieHorizontalCell_releaseDate, v17, 0, 0);
  sub_9AB3C((uint64_t)v14, (uint64_t)v7);
  swift_beginAccess(v14, v16, 33, 0);
  v15 = self;
  sub_9AFAC((uint64_t)v11, (uint64_t)v14);
  swift_endAccess(v16);
  sub_9A104((uint64_t)v7);
  sub_56024((uint64_t)v11, (uint64_t *)&unk_14AD5F0);
  sub_56024((uint64_t)v7, (uint64_t *)&unk_14AD5F0);

}

+ (UIEdgeInsets)visualContentInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 10.0;
  v3 = 0.0;
  v4 = 10.0;
  v5 = 10.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void).cxx_destruct
{
  unsigned __int8 *v3;
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication19MovieHorizontalCell_title]);
  sub_56024((uint64_t)self + OBJC_IVAR____TtC16MusicApplication19MovieHorizontalCell_releaseDate, (uint64_t *)&unk_14AD5F0);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication19MovieHorizontalCell_contentRatingAndWhatever]);
  v3 = &self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication19MovieHorizontalCell_detailTextComponents];
  v4 = *(_QWORD *)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication19MovieHorizontalCell_detailTextComponents];
  v5 = *((_QWORD *)v3 + 1);
  swift_bridgeObjectRelease(*((_QWORD *)v3 + 2));
  swift_release(v5);
  swift_release(v4);
}

@end
