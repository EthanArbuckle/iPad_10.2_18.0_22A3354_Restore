@implementation MultiChoiceCell

- (_TtC16MusicApplication15MultiChoiceCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication15MultiChoiceCell *)sub_20218C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication15MultiChoiceCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_2040A4();
}

- (NSString)title
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication15MultiChoiceCell_title);
}

- (void)setTitle:(id)a3
{
  sub_185C50(self, (uint64_t)a2, a3, (void (*)(uint64_t, uint64_t))sub_202518);
}

- (NSString)subtitle
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication15MultiChoiceCell_subtitle);
}

- (void)setSubtitle:(id)a3
{
  sub_185C50(self, (uint64_t)a2, a3, (void (*)(uint64_t, uint64_t))sub_202640);
}

- (void)layoutSubviews
{
  _TtC16MusicApplication15MultiChoiceCell *v2;

  v2 = self;
  sub_202E14();

}

- (void)tintColorDidChange
{
  _TtC16MusicApplication15MultiChoiceCell *v2;

  v2 = self;
  sub_2033C0();

}

- (BOOL)accessibilityIsSelectedChoice
{
  return self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication15MultiChoiceCell_accessibilityIsSelectedChoice];
}

- (void)setAccessibilityIsSelectedChoice:(BOOL)a3
{
  self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication15MultiChoiceCell_accessibilityIsSelectedChoice] = a3;
}

- (void).cxx_destruct
{
  uint64_t v3;

  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication15MultiChoiceCell_title]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication15MultiChoiceCell_subtitle]);

  v3 = *(_QWORD *)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication15MultiChoiceCell_textComponents];
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication15MultiChoiceCell_textComponents]);
  swift_release(v3);

}

@end
