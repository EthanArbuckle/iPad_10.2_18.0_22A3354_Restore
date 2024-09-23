@implementation ContentUnavailableFixedHeightCell

- (NSArray)preferredFocusEnvironments
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255B84960);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_22BA90150;
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI33ContentUnavailableFixedHeightCell_contentUnavailableView);
  *(_QWORD *)(v3 + 32) = v4;
  sub_22BA808D4();
  v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255B83DD0);
  v6 = (void *)sub_22BA808A4();
  swift_bridgeObjectRelease();
  return (NSArray *)v6;
}

- (_TtC9SeymourUI33ContentUnavailableFixedHeightCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI33ContentUnavailableFixedHeightCell *)sub_22B1A93C0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI33ContentUnavailableFixedHeightCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B1AA244();
}

- (void)prepareForReuse
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  objc_class *v6;
  _TtC9SeymourUI33ContentUnavailableFixedHeightCell *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255B861D0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (objc_class *)type metadata accessor for ContentUnavailableFixedHeightCell();
  v11.receiver = self;
  v11.super_class = v6;
  v7 = self;
  -[ContentUnavailableFixedHeightCell prepareForReuse](&v11, sel_prepareForReuse);
  v8 = type metadata accessor for ShelfCellItemInfo();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v5, 1, 1, v8);
  v9 = (uint64_t)v7 + OBJC_IVAR____TtC9SeymourUI33ContentUnavailableFixedHeightCell_itemInfo;
  swift_beginAccess();
  sub_22B16882C((uint64_t)v5, v9);
  swift_endAccess();
  objc_msgSend(*(id *)((char *)&v7->super.super.super.super.super.isa+ OBJC_IVAR____TtC9SeymourUI33ContentUnavailableFixedHeightCell_contentUnavailableView), sel_smu_updateWithType_text_secondaryText_image_buttonTitle_buttonPrimaryAction_, 0, 0, 0, 0, 0, 0);

}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height;
  double width;
  _TtC9SeymourUI33ContentUnavailableFixedHeightCell *v9;
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
  v10 = -[ContentUnavailableFixedHeightCell contentView](v9, sel_contentView);
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

- (void).cxx_destruct
{
  sub_22B119BC0((uint64_t)self + OBJC_IVAR____TtC9SeymourUI33ContentUnavailableFixedHeightCell_delegate);
  sub_22B168AF8((uint64_t)self + OBJC_IVAR____TtC9SeymourUI33ContentUnavailableFixedHeightCell_itemInfo);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI33ContentUnavailableFixedHeightCell_contentUnavailableView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI33ContentUnavailableFixedHeightCell_contentBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI33ContentUnavailableFixedHeightCell_cellHeightConstraint));
}

@end
