@implementation TVFilterResultDetailHeaderCell

- (BOOL)canBecomeFocused
{
  _TtC9SeymourUI30TVFilterResultDetailHeaderCell *v2;
  unsigned __int8 v3;

  v2 = self;
  v3 = sub_22B32D938();

  return v3 & 1;
}

- (NSArray)preferredFocusEnvironments
{
  void *v2;
  _TtC9SeymourUI30TVFilterResultDetailHeaderCell *v3;
  id v4;
  unint64_t v5;
  void *v6;

  v2 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI30TVFilterResultDetailHeaderCell_buttonStackView);
  v3 = self;
  v4 = objc_msgSend(v2, sel_arrangedSubviews);
  sub_22B0F1718(0, (unint64_t *)&qword_255B853E0);
  v5 = sub_22BA808BC();

  sub_22B8AD56C(v5);
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255B83DD0);
  v6 = (void *)sub_22BA808A4();
  swift_bridgeObjectRelease();
  return (NSArray *)v6;
}

- (_TtC9SeymourUI30TVFilterResultDetailHeaderCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI30TVFilterResultDetailHeaderCell *)sub_22B32DB0C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI30TVFilterResultDetailHeaderCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B32FD74();
}

- (void)prepareForReuse
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  objc_class *v6;
  _TtC9SeymourUI30TVFilterResultDetailHeaderCell *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255B861D0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (objc_class *)type metadata accessor for TVFilterResultDetailHeaderCell();
  v11.receiver = self;
  v11.super_class = v6;
  v7 = self;
  -[TVFilterResultDetailHeaderCell prepareForReuse](&v11, sel_prepareForReuse);
  v8 = type metadata accessor for ShelfCellItemInfo();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v5, 1, 1, v8);
  v9 = (uint64_t)v7 + OBJC_IVAR____TtC9SeymourUI30TVFilterResultDetailHeaderCell_itemInfo;
  swift_beginAccess();
  sub_22B16882C((uint64_t)v5, v9);
  swift_endAccess();

}

- (void)primaryActionButtonPressed:(id)a3
{
  uint64_t v5;
  __n128 v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _TtC9SeymourUI30TVFilterResultDetailHeaderCell *v13;
  uint64_t v14;

  v5 = type metadata accessor for ShelfItemAction();
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x22E2F3FFC]((char *)self + OBJC_IVAR____TtC9SeymourUI30TVFilterResultDetailHeaderCell_delegate, v6);
  if (v9)
  {
    v10 = v9;
    v11 = swift_storeEnumTagMultiPayload();
    MEMORY[0x24BDAC7A8](v11);
    *(&v14 - 4) = 0;
    *((_BYTE *)&v14 - 24) = 1;
    *(&v14 - 2) = (uint64_t)v8;
    *(&v14 - 1) = v10;
    v12 = a3;
    v13 = self;
    sub_22B174F8C(v13, sub_22B1688BC, &v14 - 6, v10);
    swift_unknownObjectRelease();
    sub_22B1688C0((uint64_t)v8);

  }
}

- (void)secondaryActionButtonPressed:(id)a3
{
  id v4;
  _TtC9SeymourUI30TVFilterResultDetailHeaderCell *v5;

  v4 = a3;
  v5 = self;
  sub_22B3302E8();

}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  id v7;
  _TtC9SeymourUI30TVFilterResultDetailHeaderCell *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_22B32F13C(v6, (uint64_t)v7);

}

- (UILabel)accessibilityTitleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC9SeymourUI30TVFilterResultDetailHeaderCell_titleLabel));
}

- (UILabel)accessibilitySubtitleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC9SeymourUI30TVFilterResultDetailHeaderCell_subtitleLabel));
}

- (UILabel)accessibilityActionLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC9SeymourUI30TVFilterResultDetailHeaderCell_actionLabel));
}

- (void).cxx_destruct
{
  sub_22B119BC0((uint64_t)self + OBJC_IVAR____TtC9SeymourUI30TVFilterResultDetailHeaderCell_delegate);
  sub_22B168AF8((uint64_t)self + OBJC_IVAR____TtC9SeymourUI30TVFilterResultDetailHeaderCell_itemInfo);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVFilterResultDetailHeaderCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVFilterResultDetailHeaderCell_floatingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVFilterResultDetailHeaderCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVFilterResultDetailHeaderCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVFilterResultDetailHeaderCell_actionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVFilterResultDetailHeaderCell_labelStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVFilterResultDetailHeaderCell_buttonStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVFilterResultDetailHeaderCell_focusGuide));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVFilterResultDetailHeaderCell_labelStackViewTrailingConstraint));
}

@end
