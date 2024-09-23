@implementation TVProgramBrickItemCell

- (_TtC9SeymourUI22TVProgramBrickItemCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI22TVProgramBrickItemCell *)sub_22B7A8010(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI22TVProgramBrickItemCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B7AB0F4();
}

- (void)prepareForReuse
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  objc_class *v6;
  _TtC9SeymourUI22TVProgramBrickItemCell *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255B861D0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (objc_class *)type metadata accessor for TVProgramBrickItemCell();
  v11.receiver = self;
  v11.super_class = v6;
  v7 = self;
  -[TVFocusableCollectionViewCell prepareForReuse](&v11, sel_prepareForReuse);
  v8 = type metadata accessor for ShelfCellItemInfo();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v5, 1, 1, v8);
  v9 = (uint64_t)v7 + OBJC_IVAR____TtC9SeymourUI22TVProgramBrickItemCell_itemInfo;
  swift_beginAccess();
  sub_22B16882C((uint64_t)v5, v9);
  swift_endAccess();

}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  id v7;
  _TtC9SeymourUI22TVProgramBrickItemCell *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_22B7A96C0(v6, v7);

}

- (void).cxx_destruct
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  _OWORD v8[10];

  sub_22B119BC0((uint64_t)self + OBJC_IVAR____TtC9SeymourUI22TVProgramBrickItemCell_delegate);
  sub_22B168AF8((uint64_t)self + OBJC_IVAR____TtC9SeymourUI22TVProgramBrickItemCell_itemInfo);
  v3 = *(_OWORD *)((char *)&self->super.super.super.super._viewFlags
                 + OBJC_IVAR____TtC9SeymourUI22TVProgramBrickItemCell_layout
                 + 8);
  v8[6] = *(_OWORD *)((char *)&self->super.super.super.super._viewDelegate
                    + OBJC_IVAR____TtC9SeymourUI22TVProgramBrickItemCell_layout);
  v8[7] = v3;
  v4 = *(_OWORD *)((char *)&self->super.super.super.super._minimumSafeAreaInsets.left
                 + OBJC_IVAR____TtC9SeymourUI22TVProgramBrickItemCell_layout);
  v8[8] = *(_OWORD *)((char *)&self->super.super.super.super._viewFlags
                    + OBJC_IVAR____TtC9SeymourUI22TVProgramBrickItemCell_layout
                    + 24);
  v8[9] = v4;
  v5 = *(_OWORD *)((char *)&self->super.super.super.super._swiftAnimationInfo
                 + OBJC_IVAR____TtC9SeymourUI22TVProgramBrickItemCell_layout);
  v8[2] = *(_OWORD *)((char *)&self->super.super.super.super._cachedTraitCollection
                    + OBJC_IVAR____TtC9SeymourUI22TVProgramBrickItemCell_layout);
  v8[3] = v5;
  v6 = *(_OWORD *)((char *)&self->super.super.super.super._window
                 + OBJC_IVAR____TtC9SeymourUI22TVProgramBrickItemCell_layout);
  v8[4] = *(_OWORD *)((char *)&self->super.super.super.super._layerRetained
                    + OBJC_IVAR____TtC9SeymourUI22TVProgramBrickItemCell_layout);
  v8[5] = v6;
  v7 = *(_OWORD *)((char *)&self->super.super.super.super.super.__layeringSceneIdentity
                 + OBJC_IVAR____TtC9SeymourUI22TVProgramBrickItemCell_layout);
  v8[0] = *(_OWORD *)((char *)&self->super.super.super.super.super.super.isa
                    + OBJC_IVAR____TtC9SeymourUI22TVProgramBrickItemCell_layout);
  v8[1] = v7;
  sub_22B7AB068((uint64_t)v8);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22TVProgramBrickItemCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22TVProgramBrickItemCell_floatingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22TVProgramBrickItemCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22TVProgramBrickItemCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22TVProgramBrickItemCell_episodesLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22TVProgramBrickItemCell_iconStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22TVProgramBrickItemCell_bottomTextStack));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22TVProgramBrickItemCell_recencyIcon));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22TVProgramBrickItemCell_gradient));
}

@end
