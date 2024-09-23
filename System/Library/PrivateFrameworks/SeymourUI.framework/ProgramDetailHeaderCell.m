@implementation ProgramDetailHeaderCell

- (_TtC9SeymourUI23ProgramDetailHeaderCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI23ProgramDetailHeaderCell *)sub_22B4E9B40(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI23ProgramDetailHeaderCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B4EC3A0();
}

- (void)didMoveToWindow
{
  id v2;
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for ProgramDetailHeaderCell();
  v2 = v10.receiver;
  -[ProgramDetailHeaderCell didMoveToWindow](&v10, sel_didMoveToWindow);
  v3 = objc_msgSend(v2, sel_window, v10.receiver, v10.super_class);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, sel_bounds);
    v6 = v5;
    v8 = v7;
    v9 = objc_msgSend(v2, sel_traitCollection);
    sub_22B4EC900(v6, v8);

    v2 = v9;
  }

}

- (void)layoutSubviews
{
  _TtC9SeymourUI23ProgramDetailHeaderCell *v2;

  v2 = self;
  sub_22B4EA3AC();

}

- (void)prepareForReuse
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  objc_class *v6;
  _TtC9SeymourUI23ProgramDetailHeaderCell *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255B861D0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (objc_class *)type metadata accessor for ProgramDetailHeaderCell();
  v11.receiver = self;
  v11.super_class = v6;
  v7 = self;
  -[ProgramDetailHeaderCell prepareForReuse](&v11, sel_prepareForReuse);
  v8 = type metadata accessor for ShelfCellItemInfo();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v5, 1, 1, v8);
  v9 = (uint64_t)v7 + OBJC_IVAR____TtC9SeymourUI23ProgramDetailHeaderCell_itemInfo;
  swift_beginAccess();
  sub_22B16882C((uint64_t)v5, v9);
  swift_endAccess();

}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height;
  double width;
  _TtC9SeymourUI23ProgramDetailHeaderCell *v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v9 = self;
  v10 = -[ProgramDetailHeaderCell contentView](v9, sel_contentView);
  *(float *)&v11 = a4;
  *(float *)&v12 = a5;
  objc_msgSend(v10, sel_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_, width, height, v11, v12);
  v14 = v13;
  v16 = v15;

  v17 = v14;
  v18 = v16;
  result.height = v18;
  result.width = v17;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC9SeymourUI23ProgramDetailHeaderCell *v6;

  v5 = a3;
  v6 = self;
  sub_22B4EA63C(a3);

}

- (void)playButtonTapped:(id)a3
{
  uint64_t v5;
  __n128 v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _TtC9SeymourUI23ProgramDetailHeaderCell *v13;
  uint64_t v14;

  v5 = type metadata accessor for ShelfItemAction();
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x22E2F3FFC]((char *)self + OBJC_IVAR____TtC9SeymourUI23ProgramDetailHeaderCell_delegate, v6);
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
    sub_22B174F8C(v13, sub_22B1688FC, &v14 - 6, v10);
    swift_unknownObjectRelease();
    sub_22B1688C0((uint64_t)v8);

  }
}

- (void).cxx_destruct
{
  sub_22B119BC0((uint64_t)self + OBJC_IVAR____TtC9SeymourUI23ProgramDetailHeaderCell_delegate);
  sub_22B168AF8((uint64_t)self + OBJC_IVAR____TtC9SeymourUI23ProgramDetailHeaderCell_itemInfo);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23ProgramDetailHeaderCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23ProgramDetailHeaderCell_contentLayoutGuide));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23ProgramDetailHeaderCell_vibrantShadowView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23ProgramDetailHeaderCell_textContainer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23ProgramDetailHeaderCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23ProgramDetailHeaderCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23ProgramDetailHeaderCell_previewButtonPlatter));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23ProgramDetailHeaderCell_previewButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23ProgramDetailHeaderCell_contentLayoutGuideLeftConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23ProgramDetailHeaderCell_contentLayoutGuideTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23ProgramDetailHeaderCell_contentLayoutGuideWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23ProgramDetailHeaderCell_previewButtonRightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23ProgramDetailHeaderCell_previewButtonWidthConstraint));
}

@end
