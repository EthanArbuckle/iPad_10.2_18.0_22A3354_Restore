@implementation TVSessionInstructionsView

- (_TtC9SeymourUI25TVSessionInstructionsView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B4FC374();
}

- (void)startButtonTapped
{
  _TtC9SeymourUI25TVSessionInstructionsView *v2;

  v2 = self;
  sub_22B4FB624();

}

- (NSArray)preferredFocusEnvironments
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255B84960);
  v3 = swift_allocObject();
  v4 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC9SeymourUI25TVSessionInstructionsView_startWorkoutView);
  *(_OWORD *)(v3 + 16) = xmmword_22BA90150;
  v5 = *(void **)(v4 + OBJC_IVAR____TtC9SeymourUI16StartWorkoutView_playButton);
  *(_QWORD *)(v3 + 32) = v5;
  sub_22BA808D4();
  v6 = v5;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255B83DD0);
  v7 = (void *)sub_22BA808A4();
  swift_bridgeObjectRelease();
  return (NSArray *)v7;
}

- (_TtC9SeymourUI25TVSessionInstructionsView)initWithFrame:(CGRect)a3
{
  _TtC9SeymourUI25TVSessionInstructionsView *result;

  result = (_TtC9SeymourUI25TVSessionInstructionsView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI25TVSessionInstructionsView_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI25TVSessionInstructionsView_workoutTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI25TVSessionInstructionsView_workoutDetailLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI25TVSessionInstructionsView_gymKitLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI25TVSessionInstructionsView_gymKitConnectingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI25TVSessionInstructionsView_gymKitConnectedView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI25TVSessionInstructionsView_startWorkoutView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI25TVSessionInstructionsView_stackView));
}

@end
