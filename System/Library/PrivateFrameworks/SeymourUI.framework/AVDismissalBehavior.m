@implementation AVDismissalBehavior

- (void)willMoveToContext:(id)a3
{
  id v3;

  objc_opt_self();
  v3 = (id)swift_dynamicCastObjCClass();
  if (v3)
    swift_unknownObjectRetain();
  swift_unknownObjectWeakAssign();

}

- (void)seymourBehaviorContext:(id)a3 didRecieveDoneButtonTapWithDismissalBlock:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC9SeymourUI19AVDismissalBehavior *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_22B4AB2F8((uint64_t)sub_22B4AB2EC, v7);

  swift_release();
}

- (_TtC9SeymourUI19AVDismissalBehavior)init
{
  objc_super v4;

  swift_unknownObjectWeakInit();
  *(AVSeymourBehaviorContext **)((char *)&self->super._behaviorContext
                               + OBJC_IVAR____TtC9SeymourUI19AVDismissalBehavior_delegate) = 0;
  swift_unknownObjectWeakInit();
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for AVDismissalBehavior();
  return -[AVDismissalBehavior init](&v4, sel_init);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  sub_22B119BC0((uint64_t)self + OBJC_IVAR____TtC9SeymourUI19AVDismissalBehavior_delegate);
}

@end
