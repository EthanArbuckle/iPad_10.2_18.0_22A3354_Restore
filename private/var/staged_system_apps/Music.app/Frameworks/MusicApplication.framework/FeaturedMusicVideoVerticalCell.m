@implementation FeaturedMusicVideoVerticalCell

- (_TtC16MusicApplication30FeaturedMusicVideoVerticalCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication30FeaturedMusicVideoVerticalCell *)sub_3853F4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication30FeaturedMusicVideoVerticalCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_38712C();
}

- (NSString)title
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication30FeaturedMusicVideoVerticalCell_title);
}

- (void)setTitle:(id)a3
{
  sub_185C50(self, (uint64_t)a2, a3, (void (*)(uint64_t, uint64_t))sub_385A4C);
}

- (NSString)artistName
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication30FeaturedMusicVideoVerticalCell_artistName);
}

- (void)setArtistName:(id)a3
{
  sub_185C50(self, (uint64_t)a2, a3, (void (*)(uint64_t, uint64_t))sub_385B20);
}

- (NSDate)releaseDate
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  Class isa;
  _BYTE v12[24];

  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_14AD5F0);
  __chkstk_darwin(v3);
  v5 = &v12[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v6 = (char *)self + OBJC_IVAR____TtC16MusicApplication30FeaturedMusicVideoVerticalCell_releaseDate;
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
  char *v14;
  _TtC16MusicApplication30FeaturedMusicVideoVerticalCell *v15;
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
  v14 = (char *)self + OBJC_IVAR____TtC16MusicApplication30FeaturedMusicVideoVerticalCell_releaseDate;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC16MusicApplication30FeaturedMusicVideoVerticalCell_releaseDate, v17, 0, 0);
  sub_9AB3C((uint64_t)v14, (uint64_t)v7);
  swift_beginAccess(v14, v16, 33, 0);
  v15 = self;
  sub_9AFAC((uint64_t)v11, (uint64_t)v14);
  swift_endAccess(v16);
  sub_385E1C((uint64_t)v7);
  sub_56024((uint64_t)v11, (uint64_t *)&unk_14AD5F0);
  sub_56024((uint64_t)v7, (uint64_t *)&unk_14AD5F0);

}

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  sub_386228(self, (uint64_t)a2, (SEL *)&selRef_frame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  sub_38627C(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, (SEL *)&selRef_frame, (SEL *)&selRef_setFrame_);
}

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  sub_386228(self, (uint64_t)a2, (SEL *)&selRef_bounds);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  sub_38627C(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, (SEL *)&selRef_bounds, (SEL *)&selRef_setBounds_);
}

- (void)layoutSubviews
{
  _TtC16MusicApplication30FeaturedMusicVideoVerticalCell *v2;

  v2 = self;
  sub_3864BC();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC16MusicApplication30FeaturedMusicVideoVerticalCell *v6;

  v5 = a3;
  v6 = self;
  sub_386738((uint64_t)a3);

}

- (NSString)accessibilityDateReleasedText
{
  uint64_t v2;
  uint64_t v3;
  NSString v4;
  _BYTE v6[24];

  v2 = *(_QWORD *)&self->super.super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication30FeaturedMusicVideoVerticalCell_textComponents
                                                     + 8];
  swift_beginAccess(v2 + 112, v6, 0, 0);
  v3 = *(_QWORD *)(v2 + 120);
  swift_bridgeObjectRetain(v3);
  v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  return (NSString *)v4;
}

- (void).cxx_destruct
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  swift_bridgeObjectRelease(*(_QWORD *)&self->super.super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication30FeaturedMusicVideoVerticalCell_title]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication30FeaturedMusicVideoVerticalCell_artistName]);
  sub_56024((uint64_t)self + OBJC_IVAR____TtC16MusicApplication30FeaturedMusicVideoVerticalCell_releaseDate, (uint64_t *)&unk_14AD5F0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication30FeaturedMusicVideoVerticalCell_badgeView));
  v3 = (Class *)((char *)&self->super.super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplication30FeaturedMusicVideoVerticalCell_textComponents);
  v4 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.super.isa
                  + OBJC_IVAR____TtC16MusicApplication30FeaturedMusicVideoVerticalCell_textComponents);
  v5 = v3[1];
  v6 = v3[2];
  swift_bridgeObjectRelease(v3[3]);
  swift_release(v6);
  swift_release(v5);
  swift_release(v4);
}

+ (void)visualContentInsets
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[24];

  v0 = sub_386C7C();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  if (qword_14AAFE0 != -1)
    swift_once(&qword_14AAFE0, sub_3868D4);
  if (!((unint64_t)v6 >> 62))
  {
    v7 = *(_QWORD *)((char *)&dword_10 + (v6 & 0xFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain();
    if (v7)
      goto LABEL_5;
LABEL_15:
    swift_bridgeObjectRelease(v6);
    goto LABEL_16;
  }
  if (v6 < 0)
    v10 = v6;
  else
    v10 = v6 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain();
  v7 = _CocoaArrayWrapper.endIndex.getter(v10);
  if (!v7)
    goto LABEL_15;
LABEL_5:
  v8 = v7 - 1;
  if (__OFSUB__(v7, 1))
  {
    __break(1u);
    goto LABEL_18;
  }
  if ((v6 & 0xC000000000000001) != 0)
  {
LABEL_18:
    v9 = specialized _ArrayBuffer._getElementSlowPath(_:)(v8, v6);
    goto LABEL_10;
  }
  if ((v8 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v8 < *(_QWORD *)((char *)&dword_10 + (v6 & 0xFFFFFFFFFFFFF8)))
  {
    v9 = *(_QWORD *)(v6 + 8 * v8 + 32);
    swift_retain(v9);
LABEL_10:
    swift_bridgeObjectRelease(v6);
    swift_beginAccess(v9 + 32, v11, 0, 0);
    swift_release(v9);
LABEL_16:
    swift_bridgeObjectRelease(v6);
    swift_release(v4);
    swift_release(v2);
    swift_release(v0);
    return;
  }
  __break(1u);
}

@end
