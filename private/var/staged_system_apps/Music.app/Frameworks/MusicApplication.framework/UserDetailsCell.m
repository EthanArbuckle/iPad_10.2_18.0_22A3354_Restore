@implementation UserDetailsCell

- (_TtC16MusicApplication15UserDetailsCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication15UserDetailsCell *)sub_74DDA4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication15UserDetailsCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_74F73C();
}

- (NSString)title
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication15UserDetailsCell_title);
}

- (void)setTitle:(id)a3
{
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  _TtC16MusicApplication15UserDetailsCell *v8;
  id v9;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = (uint64_t *)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication15UserDetailsCell_title];
  *v6 = v5;
  v6[1] = v7;
  v9 = a3;
  v8 = self;
  swift_bridgeObjectRelease();
  sub_74E290();

}

- (NSString)subtitle
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication15UserDetailsCell_subtitle);
}

- (void)setSubtitle:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _TtC16MusicApplication15UserDetailsCell *v8;
  id v9;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v7 = v6;
  v9 = a3;
  v8 = self;
  sub_74E908(v5, v7);

}

- (NSString)accessoryText
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication15UserDetailsCell_accessoryText];
  if (v2)
  {
    swift_bridgeObjectRetain(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication15UserDetailsCell_accessoryText]);
    v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v2);
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (void)setAccessoryText:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  _TtC16MusicApplication15UserDetailsCell *v9;

  if (a3)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  v6 = (uint64_t *)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication15UserDetailsCell_accessoryText];
  v7 = *(_QWORD *)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication15UserDetailsCell_accessoryText];
  v8 = *(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication15UserDetailsCell_accessoryText];
  *v6 = v4;
  v6[1] = v5;
  v9 = self;
  sub_74EAA4(v7, v8);

  swift_bridgeObjectRelease();
}

- (UIMenu)accessoryButtonMenu
{
  return (UIMenu *)*(id *)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication15UserDetailsCell_accessoryButtonMenu];
}

- (void)setAccessoryButtonMenu:(id)a3
{
  _TtC16MusicApplication15UserDetailsCell *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_74F808(a3);

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC16MusicApplication15UserDetailsCell *v6;

  v5 = a3;
  v6 = self;
  sub_74EC18((uint64_t)a3);

}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4;
  _TtC16MusicApplication15UserDetailsCell *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a3;
  v5 = self;
  v6 = -[UserDetailsCell traitCollection](v5, "traitCollection");
  sub_74F500();
  v8 = v7;
  v10 = v9;
  sub_711550(v11, v6, 0, 0);

  swift_bridgeObjectRelease();
  swift_release(v10);
  swift_release(v8);
  objc_msgSend(v4, "frame");
  objc_msgSend(v4, "setFrame:");

  return v4;
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;

  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication15UserDetailsCell_title]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication15UserDetailsCell_subtitle]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication15UserDetailsCell_accessoryText]);

  v3 = *(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication15UserDetailsCell_textComponents];
  v4 = *(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication15UserDetailsCell_textComponents + 8];
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication15UserDetailsCell_textComponents
                                                                    + 16]);
  swift_release(v4);
  swift_release(v3);

}

@end
