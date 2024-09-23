@implementation TTRIQuickBarTabBar

- (_TtC15RemindersUICore18TTRIQuickBarTabBar)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  objc_class *v9;
  _TtC15RemindersUICore18TTRIQuickBarTabBar *v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *(_QWORD *)((char *)&self->super.super._responderFlags + OBJC_IVAR____TtC15RemindersUICore18TTRIQuickBarTabBar_delegate) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC15RemindersUICore18TTRIQuickBarTabBar_items) = 0;
  v9 = (objc_class *)MEMORY[0x1E0DEE9E8];
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC15RemindersUICore18TTRIQuickBarTabBar_markedItemIDs) = (Class)MEMORY[0x1E0DEE9E8];
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC15RemindersUICore18TTRIQuickBarTabBar_enabledItemIDs) = v9;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC15RemindersUICore18TTRIQuickBarTabBar_stackView) = 0;
  v12.receiver = self;
  v12.super_class = ObjectType;
  v10 = -[TTRIQuickBarTabBar initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  sub_1B43FBE14();

  return v10;
}

- (_TtC15RemindersUICore18TTRIQuickBarTabBar)initWithCoder:(id)a3
{
  return (_TtC15RemindersUICore18TTRIQuickBarTabBar *)sub_1B43FC100(a3);
}

- (void)buttonTouchDown:(id)a3
{
  _TtC15RemindersUICore18TTRIQuickBarTabBar *v4;
  _TtC15RemindersUICore18TTRIQuickBarTabBar *v5;
  _OWORD v6[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1B4907C4C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  sub_1B43FC42C((uint64_t)v6);

  sub_1B41EA560((uint64_t)v6, &qword_1ED4ED170);
}

- (void)buttonAction:(id)a3
{
  _TtC15RemindersUICore18TTRIQuickBarTabBar *v4;
  _BYTE v5[32];

  swift_unknownObjectRetain();
  v4 = self;
  sub_1B4907C4C();
  swift_unknownObjectRelease();
  sub_1B43FC5C8((uint64_t)v5);

  __swift_destroy_boxed_opaque_existential_0((uint64_t)v5);
}

- (void).cxx_destruct
{
  sub_1B41F4748((uint64_t)self + OBJC_IVAR____TtC15RemindersUICore18TTRIQuickBarTabBar_delegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore18TTRIQuickBarTabBar_stackView));
}

@end
