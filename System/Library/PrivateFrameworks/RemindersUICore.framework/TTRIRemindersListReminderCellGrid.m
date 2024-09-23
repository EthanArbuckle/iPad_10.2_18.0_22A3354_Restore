@implementation TTRIRemindersListReminderCellGrid

- (void)layoutMarginsDidChange
{
  char *v2;
  void (*v3)(uint64_t);
  uint64_t v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v2 = (char *)v5.receiver;
  -[TTRIRemindersListReminderCellGrid layoutMarginsDidChange](&v5, sel_layoutMarginsDidChange);
  v3 = *(void (**)(uint64_t))&v2[OBJC_IVAR____TtC15RemindersUICore33TTRIRemindersListReminderCellGrid_layoutMarginsDidUpdate];
  if (v3)
  {
    v4 = swift_retain();
    v3(v4);
    sub_1B41E1CB4((uint64_t)v3);
  }

}

- (_TtC15RemindersUICore33TTRIRemindersListReminderCellGrid)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  _QWORD *v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC15RemindersUICore33TTRIRemindersListReminderCellGrid_layoutMarginsDidUpdate);
  *v9 = 0;
  v9[1] = 0;
  v11.receiver = self;
  v11.super_class = ObjectType;
  return -[NUIContainerGridView initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (_TtC15RemindersUICore33TTRIRemindersListReminderCellGrid)initWithArrangedSubviewRows:(id)a3
{
  objc_class *ObjectType;
  _QWORD *v6;
  _QWORD *v7;
  _TtC15RemindersUICore33TTRIRemindersListReminderCellGrid *v8;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4E55A0);
    sub_1B4906DAC();
    v6 = (Class *)((char *)&self->super.super.super.super.super.isa
                 + OBJC_IVAR____TtC15RemindersUICore33TTRIRemindersListReminderCellGrid_layoutMarginsDidUpdate);
    *v6 = 0;
    v6[1] = 0;
    a3 = (id)sub_1B4906DA0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = (Class *)((char *)&self->super.super.super.super.super.isa
                 + OBJC_IVAR____TtC15RemindersUICore33TTRIRemindersListReminderCellGrid_layoutMarginsDidUpdate);
    *v7 = 0;
    v7[1] = 0;
  }
  v10.receiver = self;
  v10.super_class = ObjectType;
  v8 = -[NUIContainerGridView initWithArrangedSubviewRows:](&v10, sel_initWithArrangedSubviewRows_, a3);

  return v8;
}

- (_TtC15RemindersUICore33TTRIRemindersListReminderCellGrid)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  _QWORD *v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  v6 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC15RemindersUICore33TTRIRemindersListReminderCellGrid_layoutMarginsDidUpdate);
  *v6 = 0;
  v6[1] = 0;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return -[TTRIRemindersListReminderCellGrid initWithCoder:](&v8, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  sub_1B41E1CB4(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC15RemindersUICore33TTRIRemindersListReminderCellGrid_layoutMarginsDidUpdate));
}

@end
