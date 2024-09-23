@implementation MenuCell

- (_TtC16MusicApplication8MenuCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication8MenuCell *)sub_B4BE14(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication8MenuCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_B4E90C();
}

- (NSString)titleText
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication8MenuCell_titleText);
}

- (void)setTitleText:(id)a3
{
  sub_185C50(self, (uint64_t)a2, a3, (void (*)(uint64_t, uint64_t))sub_B4C14C);
}

- (NSString)detailText
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication8MenuCell_detailText);
}

- (void)setDetailText:(id)a3
{
  sub_185C50(self, (uint64_t)a2, a3, (void (*)(uint64_t, uint64_t))sub_B4C274);
}

- (NSString)accessoryText
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication8MenuCell_accessoryText];
  if (v2)
  {
    swift_bridgeObjectRetain(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication8MenuCell_accessoryText]);
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
  _TtC16MusicApplication8MenuCell *v9;

  if (a3)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  v6 = (uint64_t *)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication8MenuCell_accessoryText];
  v7 = *(_QWORD *)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication8MenuCell_accessoryText];
  v8 = *(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication8MenuCell_accessoryText];
  *v6 = v4;
  v6[1] = v5;
  v9 = self;
  sub_B4C450(v7, v8);

  swift_bridgeObjectRelease();
}

- (BOOL)accessibilityIsDimmed
{
  return self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication8MenuCell_accessibilityIsDimmed];
}

- (void)setAccessibilityIsDimmed:(BOOL)a3
{
  self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication8MenuCell_accessibilityIsDimmed] = a3;
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4;
  _TtC16MusicApplication8MenuCell *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = sub_B4ED4C(v4);

  return v6;
}

- (void)layoutSubviews
{
  _TtC16MusicApplication8MenuCell *v2;

  v2 = self;
  sub_B4C758();

}

- (void)tintColorDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MenuCell(0);
  v2 = v3.receiver;
  -[MenuCell tintColorDidChange](&v3, "tintColorDidChange");
  sub_B4DB4C();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC16MusicApplication8MenuCell *v6;

  v5 = a3;
  v6 = self;
  sub_B4CB64(a3);

}

- (void)prepareForReuse
{
  char *v2;
  char *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for MenuCell(0);
  v2 = (char *)v4.receiver;
  -[HorizontalLockupCollectionViewCell prepareForReuse](&v4, "prepareForReuse");
  sub_B4DB4C();
  v3 = &v2[OBJC_IVAR____TtC16MusicApplication8MenuCell_notificationBadgeValue];
  *(_QWORD *)v3 = 0;
  v3[8] = 1;

}

- (BOOL)isEditing
{
  return sub_B4D254(self, (uint64_t)a2, (SEL *)&selRef_isEditing);
}

- (void)setEditing:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *v5;
  _TtC16MusicApplication8MenuCell *v6;
  unsigned int v7;
  objc_super v8;
  objc_super v9;

  v3 = a3;
  v5 = (objc_class *)type metadata accessor for MenuCell(0);
  v9.receiver = self;
  v9.super_class = v5;
  v6 = self;
  v7 = -[HorizontalLockupCollectionViewCell isEditing](&v9, "isEditing");
  v8.receiver = v6;
  v8.super_class = v5;
  -[HorizontalLockupCollectionViewCell setEditing:](&v8, "setEditing:", v3);
  if (v7 != -[MenuCell isEditing](v6, "isEditing"))
    sub_B4DB4C();

}

- (BOOL)isHighlighted
{
  return sub_B4D254(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *v5;
  _TtC16MusicApplication8MenuCell *v6;
  unsigned int v7;
  objc_super v8;
  objc_super v9;

  v3 = a3;
  v5 = (objc_class *)type metadata accessor for MenuCell(0);
  v9.receiver = self;
  v9.super_class = v5;
  v6 = self;
  v7 = -[MenuCell isHighlighted](&v9, "isHighlighted");
  v8.receiver = v6;
  v8.super_class = v5;
  -[MenuCell setHighlighted:](&v8, "setHighlighted:", v3);
  if (v7 != -[MenuCell isHighlighted](v6, "isHighlighted"))
    sub_B4DB4C();

}

- (BOOL)isSelected
{
  return sub_B4D254(self, (uint64_t)a2, (SEL *)&selRef_isSelected);
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *v5;
  _TtC16MusicApplication8MenuCell *v6;
  unsigned int v7;
  objc_super v8;
  objc_super v9;

  v3 = a3;
  v5 = (objc_class *)type metadata accessor for MenuCell(0);
  v9.receiver = self;
  v9.super_class = v5;
  v6 = self;
  v7 = -[HorizontalLockupCollectionViewCell isSelected](&v9, "isSelected");
  v8.receiver = v6;
  v8.super_class = v5;
  -[HorizontalLockupCollectionViewCell setSelected:](&v8, "setSelected:", v3);
  if (v7 != -[MenuCell isSelected](v6, "isSelected")
    || -[MenuCell isSelected](v6, "isSelected") && -[MenuCell isEditing](v6, "isEditing"))
  {
    sub_B4DB4C();
  }

}

- (int64_t)accessoryType
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MenuCell(0);
  return -[MenuCell accessoryType](&v3, "accessoryType");
}

- (void)setAccessoryType:(int64_t)a3
{
  objc_class *v5;
  _TtC16MusicApplication8MenuCell *v6;
  id v7;
  objc_super v8;
  objc_super v9;

  v5 = (objc_class *)type metadata accessor for MenuCell(0);
  v9.receiver = self;
  v9.super_class = v5;
  v6 = self;
  v7 = -[MenuCell accessoryType](&v9, "accessoryType");
  v8.receiver = v6;
  v8.super_class = v5;
  -[MenuCell setAccessoryType:](&v8, "setAccessoryType:", a3);
  sub_B4D418(v7);

}

- (void)switchValueChanged:(id)a3
{
  id v4;
  _TtC16MusicApplication8MenuCell *v5;

  v4 = a3;
  v5 = self;
  sub_B4D880(v4);

}

- (void).cxx_destruct
{
  void *v3;
  void *v4;

  sub_64880((uint64_t)self + OBJC_IVAR____TtC16MusicApplication8MenuCell_delegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_15C188(*(id *)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication8MenuCell_titleCustomDeselectedTextColor]);
  v3 = *(void **)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication8MenuCell_textComponents + 8];
  v4 = *(void **)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication8MenuCell_textComponents + 16];
  swift_release();
  swift_release();

}

@end
