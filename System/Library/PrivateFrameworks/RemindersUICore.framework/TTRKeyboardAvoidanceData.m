@implementation TTRKeyboardAvoidanceData

- (_TtC15RemindersUICoreP33_8F03EA6F046ABEC42AD2CA420BBDA77124TTRKeyboardAvoidanceData)init
{
  objc_class *ObjectType;
  _OWORD *v4;
  _OWORD *v5;
  _OWORD *v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (_OWORD *)((char *)self
                + OBJC_IVAR____TtC15RemindersUICoreP33_8F03EA6F046ABEC42AD2CA420BBDA77124TTRKeyboardAvoidanceData_willShowNotificationToken);
  *v4 = 0u;
  v4[1] = 0u;
  v5 = (_OWORD *)((char *)self
                + OBJC_IVAR____TtC15RemindersUICoreP33_8F03EA6F046ABEC42AD2CA420BBDA77124TTRKeyboardAvoidanceData_willHideNotificationToken);
  *v5 = 0u;
  v5[1] = 0u;
  v6 = (_OWORD *)((char *)self
                + OBJC_IVAR____TtC15RemindersUICoreP33_8F03EA6F046ABEC42AD2CA420BBDA77124TTRKeyboardAvoidanceData_willChangeFrameNotificationToken);
  *v6 = 0u;
  v6[1] = 0u;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return -[TTRKeyboardAvoidanceData init](&v8, sel_init);
}

- (void).cxx_destruct
{
  sub_1B4314F88((uint64_t)self+ OBJC_IVAR____TtC15RemindersUICoreP33_8F03EA6F046ABEC42AD2CA420BBDA77124TTRKeyboardAvoidanceData_willShowNotificationToken);
  sub_1B4314F88((uint64_t)self+ OBJC_IVAR____TtC15RemindersUICoreP33_8F03EA6F046ABEC42AD2CA420BBDA77124TTRKeyboardAvoidanceData_willHideNotificationToken);
  sub_1B4314F88((uint64_t)self+ OBJC_IVAR____TtC15RemindersUICoreP33_8F03EA6F046ABEC42AD2CA420BBDA77124TTRKeyboardAvoidanceData_willChangeFrameNotificationToken);
}

@end
