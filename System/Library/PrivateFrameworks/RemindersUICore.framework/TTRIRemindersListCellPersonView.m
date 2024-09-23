@implementation TTRIRemindersListCellPersonView

- (_TtC15RemindersUICore31TTRIRemindersListCellPersonView)initWithFrame:(CGRect)a3
{
  objc_class *ObjectType;
  _QWORD *v5;
  _TtC15RemindersUICore31TTRIRemindersListCellPersonView *v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC15RemindersUICore31TTRIRemindersListCellPersonView_contact) = 0;
  v5 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC15RemindersUICore31TTRIRemindersListCellPersonView_name);
  *v5 = 0;
  v5[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC15RemindersUICore31TTRIRemindersListCellPersonView_avatarViewController) = 0;
  v8.receiver = self;
  v8.super_class = ObjectType;
  v6 = -[TTRIRemindersListCellAttributePillView initWithFrame:](&v8, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  sub_1B4567850();
  sub_1B45679F4();

  return v6;
}

- (_TtC15RemindersUICore31TTRIRemindersListCellPersonView)initWithCoder:(id)a3
{
  return (_TtC15RemindersUICore31TTRIRemindersListCellPersonView *)sub_1B4567BF4(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore31TTRIRemindersListCellPersonView_contact));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore31TTRIRemindersListCellPersonView_avatarViewController));
}

@end
