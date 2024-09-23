@implementation StandardFilterCell

- (_TtC9SeymourUI18StandardFilterCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI18StandardFilterCell *)sub_22B401794(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI18StandardFilterCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B402F50();
}

- (void)layoutSubviews
{
  char *v2;
  id v3;
  double v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for StandardFilterCell();
  v2 = (char *)v5.receiver;
  -[StandardFilterCell layoutSubviews](&v5, sel_layoutSubviews);
  v3 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC9SeymourUI18StandardFilterCell_platter], sel_layer, v5.receiver, v5.super_class);
  objc_msgSend(v2, sel_bounds);
  objc_msgSend(v3, sel_setCornerRadius_, v4 * 0.5);

}

- (void)prepareForReuse
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  objc_class *v6;
  _TtC9SeymourUI18StandardFilterCell *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255B861D0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (objc_class *)type metadata accessor for StandardFilterCell();
  v11.receiver = self;
  v11.super_class = v6;
  v7 = self;
  -[StandardFilterCell prepareForReuse](&v11, sel_prepareForReuse);
  v8 = type metadata accessor for ShelfCellItemInfo();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v5, 1, 1, v8);
  v9 = (uint64_t)v7 + OBJC_IVAR____TtC9SeymourUI18StandardFilterCell_itemInfo;
  swift_beginAccess();
  sub_22B16882C((uint64_t)v5, v9);
  swift_endAccess();

}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height;
  double width;
  _TtC9SeymourUI18StandardFilterCell *v9;
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
  v10 = -[StandardFilterCell contentView](v9, sel_contentView);
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
  _TtC9SeymourUI18StandardFilterCell *v6;

  v5 = a3;
  v6 = self;
  sub_22B4023AC(a3);

}

- (void).cxx_destruct
{
  char *v3;
  void *v4;
  void *v5;
  id v6;

  sub_22B119BC0((uint64_t)self + OBJC_IVAR____TtC9SeymourUI18StandardFilterCell_delegate);
  sub_22B168AF8((uint64_t)self + OBJC_IVAR____TtC9SeymourUI18StandardFilterCell_itemInfo);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18StandardFilterCell_platter));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI18StandardFilterCell_titleLabel));
  v3 = (char *)self + OBJC_IVAR____TtC9SeymourUI18StandardFilterCell_styleProvider;
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI18StandardFilterCell_styleProvider);
  v6 = (id)*((_QWORD *)v3 + 1);
  v5 = (void *)*((_QWORD *)v3 + 2);
  swift_bridgeObjectRelease();

}

@end
