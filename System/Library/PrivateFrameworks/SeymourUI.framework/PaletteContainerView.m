@implementation PaletteContainerView

- (NSArray)interactions
{
  void *v2;
  _TtC9SeymourUI20PaletteContainerView *v3;
  id v4;
  void *v5;

  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI20PaletteContainerView_containerView);
  v3 = self;
  v4 = objc_msgSend(v2, sel_interactions);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255BAE6C8);
  sub_22BA808BC();

  v5 = (void *)sub_22BA808A4();
  swift_bridgeObjectRelease();
  return (NSArray *)v5;
}

- (void)setInteractions:(id)a3
{
  void *v4;
  _TtC9SeymourUI20PaletteContainerView *v5;
  id v6;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255BAE6C8);
  sub_22BA808BC();
  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI20PaletteContainerView_containerView);
  v5 = self;
  v6 = (id)sub_22BA808A4();
  swift_bridgeObjectRelease();
  objc_msgSend(v4, sel_setInteractions_, v6);

}

- (_TtC9SeymourUI20PaletteContainerView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _OWORD *v8;
  __int128 v9;
  _TtC9SeymourUI20PaletteContainerView *result;

  v5 = OBJC_IVAR____TtC9SeymourUI20PaletteContainerView_containerView;
  type metadata accessor for PaletteContainerView.ContainerView();
  v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  v8 = (_OWORD *)((char *)self + OBJC_IVAR____TtC9SeymourUI20PaletteContainerView_contentInsets);
  v9 = *(_OWORD *)(MEMORY[0x24BEBE158] + 16);
  *v8 = *MEMORY[0x24BEBE158];
  v8[1] = v9;

  result = (_TtC9SeymourUI20PaletteContainerView *)sub_22BA815D0();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC9SeymourUI20PaletteContainerView *v2;

  v2 = self;
  sub_22B81FEF0();

}

- (void)addInteraction:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI20PaletteContainerView_containerView), sel_addInteraction_, a3);
}

- (void)removeInteraction:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI20PaletteContainerView_containerView), sel_removeInteraction_, a3);
}

- (_TtC9SeymourUI20PaletteContainerView)initWithFrame:(CGRect)a3
{
  _TtC9SeymourUI20PaletteContainerView *result;

  result = (_TtC9SeymourUI20PaletteContainerView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI20PaletteContainerView_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI20PaletteContainerView_containerView));
}

@end
