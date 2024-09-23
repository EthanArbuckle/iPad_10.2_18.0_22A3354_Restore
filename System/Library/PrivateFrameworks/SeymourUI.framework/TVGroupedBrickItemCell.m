@implementation TVGroupedBrickItemCell

- (_TtC9SeymourUI22TVGroupedBrickItemCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI22TVGroupedBrickItemCell *)sub_22B1A4EF0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI22TVGroupedBrickItemCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B1A7114();
}

- (void)prepareForReuse
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  objc_class *v6;
  _TtC9SeymourUI22TVGroupedBrickItemCell *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255B861D0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (objc_class *)type metadata accessor for TVGroupedBrickItemCell();
  v11.receiver = self;
  v11.super_class = v6;
  v7 = self;
  -[TVFocusableCollectionViewCell prepareForReuse](&v11, sel_prepareForReuse);
  v8 = type metadata accessor for ShelfCellItemInfo();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v5, 1, 1, v8);
  v9 = (uint64_t)v7 + OBJC_IVAR____TtC9SeymourUI22TVGroupedBrickItemCell_itemInfo;
  swift_beginAccess();
  sub_22B16882C((uint64_t)v5, v9);
  swift_endAccess();

}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  id v7;
  _TtC9SeymourUI22TVGroupedBrickItemCell *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_22B1A6280(v6, (uint64_t)v7);

}

- (UILabel)accessibilityTitleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC9SeymourUI22TVGroupedBrickItemCell_titleLabel));
}

- (UILabel)accessibilitySubtitleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC9SeymourUI22TVGroupedBrickItemCell_subtitleLabel));
}

- (void).cxx_destruct
{
  void *v3;

  sub_22B119BC0((uint64_t)self + OBJC_IVAR____TtC9SeymourUI22TVGroupedBrickItemCell_delegate);
  sub_22B168AF8((uint64_t)self + OBJC_IVAR____TtC9SeymourUI22TVGroupedBrickItemCell_itemInfo);
  v3 = *(UIViewController **)((char *)&self->super.super.super.super._viewDelegate
                            + OBJC_IVAR____TtC9SeymourUI22TVGroupedBrickItemCell_layout);
  objc_release(*(id *)((char *)&self->super.super.super.super._viewFlags
                     + OBJC_IVAR____TtC9SeymourUI22TVGroupedBrickItemCell_layout));

  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22TVGroupedBrickItemCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22TVGroupedBrickItemCell_floatingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22TVGroupedBrickItemCell_textStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22TVGroupedBrickItemCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22TVGroupedBrickItemCell_subtitleLabel));
}

@end
