@implementation PersonCell

- (_TtC16MusicApplication10PersonCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication10PersonCell *)sub_96DAAC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication10PersonCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_96E88C();
}

- (NSString)personName
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication10PersonCell_personName];
  swift_bridgeObjectRetain(v2);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (void)setPersonName:(id)a3
{
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  _TtC16MusicApplication10PersonCell *v8;
  Swift::String v9;
  id v10;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = (uint64_t *)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication10PersonCell_personName];
  *v6 = v5;
  v6[1] = v7;
  v10 = a3;
  v8 = self;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v9 = String.trim()();
  swift_bridgeObjectRelease();
  TextStackView.Component.textValue.setter(v9._countAndFlagsBits, (uint64_t)v9._object);
  -[PersonCell setNeedsLayout](v8, "setNeedsLayout");

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  _TtC16MusicApplication10PersonCell *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = -[PersonCell traitCollection](v5, "traitCollection");
  sub_96E4F0(v6, *(_QWORD *)&v5->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication10PersonCell_textComponents]);
  sub_96E098();

}

- (void).cxx_destruct
{
  unsigned __int8 *v3;
  uint64_t v4;

  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication10PersonCell_personName]);
  v3 = &self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication10PersonCell_textComponents];
  v4 = *(_QWORD *)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication10PersonCell_textComponents];
  swift_bridgeObjectRelease(*((_QWORD *)v3 + 1));
  swift_release(v4);
}

@end
