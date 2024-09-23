@implementation GroupedBrickItemCell

- (_TtC9SeymourUI20GroupedBrickItemCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI20GroupedBrickItemCell *)sub_22B7128C0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI20GroupedBrickItemCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B714FB0();
}

- (void)prepareForReuse
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  objc_class *v6;
  _TtC9SeymourUI20GroupedBrickItemCell *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255B861D0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (objc_class *)type metadata accessor for GroupedBrickItemCell();
  v11.receiver = self;
  v11.super_class = v6;
  v7 = self;
  -[GroupedBrickItemCell prepareForReuse](&v11, sel_prepareForReuse);
  v8 = type metadata accessor for ShelfCellItemInfo();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v5, 1, 1, v8);
  v9 = (uint64_t)v7 + OBJC_IVAR____TtC9SeymourUI20GroupedBrickItemCell_itemInfo;
  swift_beginAccess();
  sub_22B16882C((uint64_t)v5, v9);
  swift_endAccess();

}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height;
  double width;
  _TtC9SeymourUI20GroupedBrickItemCell *v9;
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
  v10 = -[GroupedBrickItemCell contentView](v9, sel_contentView);
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
  _TtC9SeymourUI20GroupedBrickItemCell *v6;

  v5 = a3;
  v6 = self;
  sub_22B713200(a3);

}

- (void).cxx_destruct
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  _OWORD v7[9];

  sub_22B119BC0((uint64_t)self + OBJC_IVAR____TtC9SeymourUI20GroupedBrickItemCell_delegate);
  sub_22B168AF8((uint64_t)self + OBJC_IVAR____TtC9SeymourUI20GroupedBrickItemCell_itemInfo);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI20GroupedBrickItemCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI20GroupedBrickItemCell_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI20GroupedBrickItemCell_headerLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI20GroupedBrickItemCell_container));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI20GroupedBrickItemCell_textLayoutGuide));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI20GroupedBrickItemCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI20GroupedBrickItemCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI20GroupedBrickItemCell_separator));
  v3 = *(_OWORD *)((char *)&self->super.super.super._viewFlags
                 + OBJC_IVAR____TtC9SeymourUI20GroupedBrickItemCell_styleProvider
                 + 8);
  v7[6] = *(_OWORD *)((char *)&self->super.super.super._viewDelegate
                    + OBJC_IVAR____TtC9SeymourUI20GroupedBrickItemCell_styleProvider);
  v7[7] = v3;
  v7[8] = *(_OWORD *)((char *)&self->super.super.super._viewFlags
                    + OBJC_IVAR____TtC9SeymourUI20GroupedBrickItemCell_styleProvider
                    + 24);
  v4 = *(_OWORD *)((char *)&self->super.super.super._swiftAnimationInfo
                 + OBJC_IVAR____TtC9SeymourUI20GroupedBrickItemCell_styleProvider);
  v7[2] = *(_OWORD *)((char *)&self->super.super.super._cachedTraitCollection
                    + OBJC_IVAR____TtC9SeymourUI20GroupedBrickItemCell_styleProvider);
  v7[3] = v4;
  v5 = *(_OWORD *)((char *)&self->super.super.super._window
                 + OBJC_IVAR____TtC9SeymourUI20GroupedBrickItemCell_styleProvider);
  v7[4] = *(_OWORD *)((char *)&self->super.super.super._layerRetained
                    + OBJC_IVAR____TtC9SeymourUI20GroupedBrickItemCell_styleProvider);
  v7[5] = v5;
  v6 = *(_OWORD *)((char *)&self->super.super.super.super.__layeringSceneIdentity
                 + OBJC_IVAR____TtC9SeymourUI20GroupedBrickItemCell_styleProvider);
  v7[0] = *(_OWORD *)((char *)&self->super.super.super.super.super.isa
                    + OBJC_IVAR____TtC9SeymourUI20GroupedBrickItemCell_styleProvider);
  v7[1] = v6;
  sub_22B7155E4((uint64_t)v7);
}

@end
