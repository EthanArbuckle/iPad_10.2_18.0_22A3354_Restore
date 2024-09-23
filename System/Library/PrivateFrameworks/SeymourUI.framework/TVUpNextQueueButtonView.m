@implementation TVUpNextQueueButtonView

- (NSArray)preferredFocusEnvironments
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255B84960);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_22BA90150;
  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI23TVUpNextQueueButtonView_button);
  *(_QWORD *)(v3 + 32) = v4;
  sub_22BA808D4();
  v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255B83DD0);
  v6 = (void *)sub_22BA808A4();
  swift_bridgeObjectRelease();
  return (NSArray *)v6;
}

- (_TtC9SeymourUI23TVUpNextQueueButtonView)init
{
  return (_TtC9SeymourUI23TVUpNextQueueButtonView *)sub_22BA111BC();
}

- (_TtC9SeymourUI23TVUpNextQueueButtonView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC9SeymourUI23TVUpNextQueueButtonView *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI23TVUpNextQueueButtonView_layout) = (Class)0x4050800000000000;
  v5 = OBJC_IVAR____TtC9SeymourUI23TVUpNextQueueButtonView_buttonContentView;
  v6 = objc_allocWithZone((Class)type metadata accessor for TVUpNextQueueButtonContentView());
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9SeymourUI23TVUpNextQueueButtonView_hideItemCountConstraints) = (Class)MEMORY[0x24BEE4AF8];

  result = (_TtC9SeymourUI23TVUpNextQueueButtonView *)sub_22BA815D0();
  __break(1u);
  return result;
}

- (_TtC9SeymourUI23TVUpNextQueueButtonView)initWithFrame:(CGRect)a3
{
  _TtC9SeymourUI23TVUpNextQueueButtonView *result;

  result = (_TtC9SeymourUI23TVUpNextQueueButtonView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23TVUpNextQueueButtonView_buttonContentView));
  swift_bridgeObjectRelease();
}

@end
