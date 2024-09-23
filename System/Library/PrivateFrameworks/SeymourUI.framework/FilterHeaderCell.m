@implementation FilterHeaderCell

- (_TtC9SeymourUI16FilterHeaderCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI16FilterHeaderCell *)sub_22B5A818C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI16FilterHeaderCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B5A9C54();
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  id v4;
  objc_super v5;
  CGRect v6;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FilterHeaderCell();
  v2 = (char *)v5.receiver;
  -[FilterHeaderCell layoutSubviews](&v5, sel_layoutSubviews);
  v3 = *(void **)&v2[OBJC_IVAR____TtC9SeymourUI16FilterHeaderCell_filterButton];
  v4 = objc_msgSend(v3, sel_layer, v5.receiver, v5.super_class);
  objc_msgSend(v3, sel_bounds);
  objc_msgSend(v4, sel_setCornerRadius_, CGRectGetHeight(v6) * 0.5);

}

- (void)prepareForReuse
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  objc_class *v6;
  _TtC9SeymourUI16FilterHeaderCell *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255B861D0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (objc_class *)type metadata accessor for FilterHeaderCell();
  v11.receiver = self;
  v11.super_class = v6;
  v7 = self;
  -[FilterHeaderCell prepareForReuse](&v11, sel_prepareForReuse);
  v8 = type metadata accessor for ShelfCellItemInfo();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v5, 1, 1, v8);
  v9 = (uint64_t)v7 + OBJC_IVAR____TtC9SeymourUI16FilterHeaderCell_itemInfo;
  swift_beginAccess();
  sub_22B16882C((uint64_t)v5, v9);
  swift_endAccess();

}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height;
  double width;
  _TtC9SeymourUI16FilterHeaderCell *v9;
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
  v10 = -[FilterHeaderCell contentView](v9, sel_contentView);
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

- (void)tintColorDidChange
{
  _TtC9SeymourUI16FilterHeaderCell *v2;

  v2 = self;
  sub_22B5A8EF4();

}

- (void)tappedFilterButton:(id)a3
{
  uint64_t v5;
  __n128 v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _TtC9SeymourUI16FilterHeaderCell *v13;
  uint64_t v14;

  v5 = type metadata accessor for ShelfItemAction();
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x22E2F3FFC]((char *)self + OBJC_IVAR____TtC9SeymourUI16FilterHeaderCell_delegate, v6);
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

- (void)textSizeChanged:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC9SeymourUI16FilterHeaderCell *v8;
  uint64_t v9;

  v4 = sub_22BA79344();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22BA79320();
  v8 = self;
  sub_22B5A9264();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void).cxx_destruct
{
  sub_22B119BC0((uint64_t)self + OBJC_IVAR____TtC9SeymourUI16FilterHeaderCell_delegate);
  sub_22B0FB1DC((uint64_t)self + OBJC_IVAR____TtC9SeymourUI16FilterHeaderCell_itemInfo, &qword_255B861D0);
  sub_22B0FB1DC((uint64_t)self + OBJC_IVAR____TtC9SeymourUI16FilterHeaderCell_localizer, &qword_255B9FC98);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI16FilterHeaderCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI16FilterHeaderCell_filterButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI16FilterHeaderCell_titleLabelTrailingToFilterButtonLeadingConstraint));
}

@end
