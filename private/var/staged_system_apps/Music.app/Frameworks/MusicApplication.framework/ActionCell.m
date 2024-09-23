@implementation ActionCell

- (_TtC16MusicApplication10ActionCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication10ActionCell *)sub_90ECD0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication10ActionCell)initWithCoder:(id)a3
{
  unsigned __int8 *v5;
  unsigned __int8 *v6;
  void *v7;
  id v8;
  id v9;
  _TtC16MusicApplication10ActionCell *result;

  v5 = &self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication10ActionCell_title];
  *(_QWORD *)v5 = 0;
  *((_QWORD *)v5 + 1) = 0xE000000000000000;
  self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication10ActionCell_titleAlignment] = 4;
  v6 = &self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication10ActionCell_textComponents];
  v7 = (void *)objc_opt_self(UIColor);
  v8 = a3;
  v9 = objc_msgSend(v7, "whiteColor");
  *(_QWORD *)v6 = 0;
  v6[8] = 4;
  *((_QWORD *)v6 + 2) = v9;

  result = (_TtC16MusicApplication10ActionCell *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000000010C4100, "MusicApplication/ActionCell.swift", 33, 2, 33, 0);
  __break(1u);
  return result;
}

- (NSString)title
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication10ActionCell_title];
  swift_bridgeObjectRetain(v2);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (void)setTitle:(id)a3
{
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  id v8;
  _TtC16MusicApplication10ActionCell *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE v13[24];

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = (uint64_t *)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication10ActionCell_title];
  *v6 = v5;
  v6[1] = v7;
  v8 = a3;
  v9 = self;
  swift_bridgeObjectRelease();
  swift_beginAccess((char *)v9 + OBJC_IVAR____TtC16MusicApplication10ActionCell_textComponents, v13, 33, 0);
  v10 = sub_90EFF4();
  swift_endAccess(v13);
  v11 = *v6;
  v12 = v6[1];
  swift_bridgeObjectRetain();
  TextStackView.Component.textValue.setter(v11, v12);
  -[ActionCell setNeedsLayout](v9, "setNeedsLayout", swift_release(v10).n128_f64[0]);

}

- (BOOL)isHighlighted
{
  return sub_90F5F0(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *v5;
  _TtC16MusicApplication10ActionCell *v6;
  unsigned int v7;
  objc_super v8;
  objc_super v9;

  v3 = a3;
  v5 = (objc_class *)type metadata accessor for ActionCell(0);
  v9.receiver = self;
  v9.super_class = v5;
  v6 = self;
  v7 = -[ActionCell isHighlighted](&v9, "isHighlighted");
  v8.receiver = v6;
  v8.super_class = v5;
  -[ActionCell setHighlighted:](&v8, "setHighlighted:", v3);
  if (v7 != -[ActionCell isHighlighted](v6, "isHighlighted"))
    sub_90F7A8();

}

- (BOOL)isSelected
{
  return sub_90F5F0(self, (uint64_t)a2, (SEL *)&selRef_isSelected);
}

- (void)setSelected:(BOOL)a3
{
  _TtC16MusicApplication10ActionCell *v4;

  v4 = self;
  sub_90F670(a3);

}

- (void)tintColorDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ActionCell(0);
  v2 = v3.receiver;
  -[ActionCell tintColorDidChange](&v3, "tintColorDidChange");
  sub_90F7A8();

}

- (void).cxx_destruct
{
  id v3;

  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication10ActionCell_title]);
  v3 = *(id *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication10ActionCell_textComponents + 8];
  swift_release(*(_QWORD *)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication10ActionCell_textComponents]);

}

@end
