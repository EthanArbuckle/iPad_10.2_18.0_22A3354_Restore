@implementation ActionButtonContainerView

- (_TtC9SeymourUI25ActionButtonContainerView)initWithCoder:(id)a3
{
  id v5;
  _TtC9SeymourUI25ActionButtonContainerView *result;

  *(_QWORD *)((char *)&self->super.super._responderFlags + OBJC_IVAR____TtC9SeymourUI25ActionButtonContainerView_delegate) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI25ActionButtonContainerView_buttonActions) = (Class)MEMORY[0x24BEE4AF8];
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI25ActionButtonContainerView_rootStackView) = 0;
  v5 = a3;

  result = (_TtC9SeymourUI25ActionButtonContainerView *)sub_22BA815D0();
  __break(1u);
  return result;
}

- (void)actionButtonTapped:(id)a3
{
  id v4;
  _TtC9SeymourUI25ActionButtonContainerView *v5;

  v4 = a3;
  v5 = self;
  sub_22B6AD5F4(v4);

}

- (_TtC9SeymourUI25ActionButtonContainerView)initWithFrame:(CGRect)a3
{
  _TtC9SeymourUI25ActionButtonContainerView *result;

  result = (_TtC9SeymourUI25ActionButtonContainerView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_22B119BC0((uint64_t)self + OBJC_IVAR____TtC9SeymourUI25ActionButtonContainerView_delegate);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI25ActionButtonContainerView_templateBuilder);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI25ActionButtonContainerView_viewFactory);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI25ActionButtonContainerView_rootStackView));
}

@end
