@implementation MusicVideoHorizontalCell

- (_TtC16MusicApplication24MusicVideoHorizontalCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication24MusicVideoHorizontalCell *)sub_A60D74(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication24MusicVideoHorizontalCell)initWithCoder:(id)a3
{
  unsigned __int8 *v4;
  unsigned __int8 *v5;
  unsigned __int8 *v6;
  id v7;
  _TtC16MusicApplication24MusicVideoHorizontalCell *result;

  self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication24MusicVideoHorizontalCell_layoutStyle] = 0;
  v4 = &self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication24MusicVideoHorizontalCell_title];
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = 0xE000000000000000;
  v5 = &self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication24MusicVideoHorizontalCell_subtitle];
  *(_QWORD *)v5 = 0;
  *((_QWORD *)v5 + 1) = 0xE000000000000000;
  v6 = &self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication24MusicVideoHorizontalCell_additionalDescription];
  *(_QWORD *)v6 = 0;
  *((_QWORD *)v6 + 1) = 0xE000000000000000;
  v7 = a3;

  result = (_TtC16MusicApplication24MusicVideoHorizontalCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/MusicVideoHorizontalCell.swift", 47, 2, 30, 0);
  __break(1u);
  return result;
}

- (NSString)title
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication24MusicVideoHorizontalCell_title);
}

- (void)setTitle:(id)a3
{
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  id v8;
  _TtC16MusicApplication24MusicVideoHorizontalCell *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = (uint64_t *)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication24MusicVideoHorizontalCell_title];
  *v6 = v5;
  v6[1] = v7;
  v8 = a3;
  v9 = self;
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)&v9->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication24MusicVideoHorizontalCell_textComponents];
  v11 = *v6;
  v12 = v6[1];
  swift_retain(v10);
  swift_bridgeObjectRetain();
  TextStackView.Component.textValue.setter(v11, v12);

  swift_release(v10);
}

- (NSString)subtitle
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication24MusicVideoHorizontalCell_subtitle);
}

- (void)setSubtitle:(id)a3
{
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  id v8;
  _TtC16MusicApplication24MusicVideoHorizontalCell *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = (uint64_t *)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication24MusicVideoHorizontalCell_subtitle];
  *v6 = v5;
  v6[1] = v7;
  v8 = a3;
  v9 = self;
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)&v9->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication24MusicVideoHorizontalCell_textComponents];
  v11 = *v6;
  v12 = v6[1];
  swift_retain(v10);
  swift_bridgeObjectRetain();
  TextStackView.Component.textValue.setter(v11, v12);

  swift_release(v10);
}

- (NSString)additionalDescription
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication24MusicVideoHorizontalCell_additionalDescription);
}

- (void)setAdditionalDescription:(id)a3
{
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  id v8;
  _TtC16MusicApplication24MusicVideoHorizontalCell *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = (uint64_t *)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication24MusicVideoHorizontalCell_additionalDescription];
  *v6 = v5;
  v6[1] = v7;
  v8 = a3;
  v9 = self;
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)&v9->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication24MusicVideoHorizontalCell_textComponents
                                              + 8];
  v11 = *v6;
  v12 = v6[1];
  swift_retain(v10);
  swift_bridgeObjectRetain();
  TextStackView.Component.textValue.setter(v11, v12);

  swift_release(v10);
}

- (void).cxx_destruct
{
  unsigned __int8 *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication24MusicVideoHorizontalCell_title]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication24MusicVideoHorizontalCell_subtitle]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication24MusicVideoHorizontalCell_additionalDescription]);
  v3 = &self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication24MusicVideoHorizontalCell_textComponents];
  v4 = *(_QWORD *)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication24MusicVideoHorizontalCell_textComponents];
  v5 = *((_QWORD *)v3 + 1);
  v6 = *((_QWORD *)v3 + 2);
  swift_bridgeObjectRelease(*((_QWORD *)v3 + 3));
  swift_release(v6);
  swift_release(v5);
  swift_release(v4);
}

@end
