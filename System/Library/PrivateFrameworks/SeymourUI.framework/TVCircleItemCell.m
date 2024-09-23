@implementation TVCircleItemCell

- (_TtC9SeymourUI16TVCircleItemCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI16TVCircleItemCell *)sub_22B3F520C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI16TVCircleItemCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B3F62A0();
}

- (void)prepareForReuse
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  objc_class *v6;
  _TtC9SeymourUI16TVCircleItemCell *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255B861D0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (objc_class *)type metadata accessor for TVCircleItemCell();
  v11.receiver = self;
  v11.super_class = v6;
  v7 = self;
  -[TVFocusableCollectionViewCell prepareForReuse](&v11, sel_prepareForReuse);
  v8 = type metadata accessor for ShelfCellItemInfo();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v5, 1, 1, v8);
  v9 = (uint64_t)v7 + OBJC_IVAR____TtC9SeymourUI16TVCircleItemCell_itemInfo;
  swift_beginAccess();
  sub_22B16882C((uint64_t)v5, v9);
  swift_endAccess();

}

- (UILabel)accessibilityTitleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC9SeymourUI16TVCircleItemCell_titleLabel));
}

- (void).cxx_destruct
{
  sub_22B119BC0((uint64_t)self + OBJC_IVAR____TtC9SeymourUI16TVCircleItemCell_delegate);
  sub_22B168AF8((uint64_t)self + OBJC_IVAR____TtC9SeymourUI16TVCircleItemCell_itemInfo);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI16TVCircleItemCell_tvArtworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI16TVCircleItemCell_titleLabel));
}

@end
