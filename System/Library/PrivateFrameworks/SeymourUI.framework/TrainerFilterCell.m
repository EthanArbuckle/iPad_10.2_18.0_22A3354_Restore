@implementation TrainerFilterCell

- (_TtC9SeymourUI17TrainerFilterCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI17TrainerFilterCell *)sub_22B40392C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI17TrainerFilterCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B404E0C();
}

- (void)layoutSubviews
{
  _TtC9SeymourUI17TrainerFilterCell *v2;

  v2 = self;
  sub_22B404094();

}

- (void)prepareForReuse
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  objc_class *v6;
  _TtC9SeymourUI17TrainerFilterCell *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255B861D0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (objc_class *)type metadata accessor for TrainerFilterCell();
  v11.receiver = self;
  v11.super_class = v6;
  v7 = self;
  -[TrainerFilterCell prepareForReuse](&v11, sel_prepareForReuse);
  v8 = type metadata accessor for ShelfCellItemInfo();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v5, 1, 1, v8);
  v9 = (uint64_t)v7 + OBJC_IVAR____TtC9SeymourUI17TrainerFilterCell_itemInfo;
  swift_beginAccess();
  sub_22B16882C((uint64_t)v5, v9);
  swift_endAccess();

}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height;
  double width;
  _TtC9SeymourUI17TrainerFilterCell *v9;
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
  v10 = -[TrainerFilterCell contentView](v9, sel_contentView);
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
  _TtC9SeymourUI17TrainerFilterCell *v6;

  v5 = a3;
  v6 = self;
  sub_22B404318(a3);

}

- (void).cxx_destruct
{
  void *v3;
  void *v4;
  void *v5;

  sub_22B119BC0((uint64_t)self + OBJC_IVAR____TtC9SeymourUI17TrainerFilterCell_delegate);
  sub_22B168AF8((uint64_t)self + OBJC_IVAR____TtC9SeymourUI17TrainerFilterCell_itemInfo);
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC9SeymourUI17TrainerFilterCell_layout);
  v4 = *(void **)((char *)&self->super.super.super.super._responderFlags
                + OBJC_IVAR____TtC9SeymourUI17TrainerFilterCell_layout);
  v5 = *(FBSSceneIdentityToken **)((char *)&self->super.super.super.super.__layeringSceneIdentity
                                 + OBJC_IVAR____TtC9SeymourUI17TrainerFilterCell_layout);
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI17TrainerFilterCell_platter));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI17TrainerFilterCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI17TrainerFilterCell_artworkContainer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI17TrainerFilterCell_artworkView));
}

@end
