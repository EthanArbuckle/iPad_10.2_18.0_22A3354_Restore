@implementation TVEditorialCollectionBrickItemCell

- (_TtC9SeymourUI34TVEditorialCollectionBrickItemCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI34TVEditorialCollectionBrickItemCell *)sub_22B5E0518(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI34TVEditorialCollectionBrickItemCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B5E2B0C();
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for TVEditorialCollectionBrickItemCell();
  v2 = (char *)v13.receiver;
  -[TVEditorialCollectionBrickItemCell layoutSubviews](&v13, sel_layoutSubviews);
  v3 = *(void **)&v2[OBJC_IVAR____TtC9SeymourUI34TVEditorialCollectionBrickItemCell_gradientLayer];
  v4 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC9SeymourUI34TVEditorialCollectionBrickItemCell_floatingView], sel_contentView, v13.receiver, v13.super_class);
  objc_msgSend(v4, sel_bounds);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  objc_msgSend(v3, sel_setFrame_, v6, v8, v10, v12);
}

- (void)prepareForReuse
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  objc_class *v6;
  _TtC9SeymourUI34TVEditorialCollectionBrickItemCell *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255B861D0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (objc_class *)type metadata accessor for TVEditorialCollectionBrickItemCell();
  v11.receiver = self;
  v11.super_class = v6;
  v7 = self;
  -[TVFocusableCollectionViewCell prepareForReuse](&v11, sel_prepareForReuse);
  v8 = type metadata accessor for ShelfCellItemInfo();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v5, 1, 1, v8);
  v9 = (uint64_t)v7 + OBJC_IVAR____TtC9SeymourUI34TVEditorialCollectionBrickItemCell_itemInfo;
  swift_beginAccess();
  sub_22B16882C((uint64_t)v5, v9);
  swift_endAccess();

}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height;
  double width;
  _TtC9SeymourUI34TVEditorialCollectionBrickItemCell *v9;
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
  v10 = -[TVEditorialCollectionBrickItemCell contentView](v9, sel_contentView);
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
  sub_22B119BC0((uint64_t)self + OBJC_IVAR____TtC9SeymourUI34TVEditorialCollectionBrickItemCell_delegate);
  sub_22B168AF8((uint64_t)self + OBJC_IVAR____TtC9SeymourUI34TVEditorialCollectionBrickItemCell_itemInfo);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34TVEditorialCollectionBrickItemCell_floatingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34TVEditorialCollectionBrickItemCell_tvArtworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super._animationInfo
                     + OBJC_IVAR____TtC9SeymourUI34TVEditorialCollectionBrickItemCell_layout));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34TVEditorialCollectionBrickItemCell_bottomTextStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34TVEditorialCollectionBrickItemCell_footnoteLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34TVEditorialCollectionBrickItemCell_recencyIconView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34TVEditorialCollectionBrickItemCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34TVEditorialCollectionBrickItemCell_gradientLayer));
}

@end
