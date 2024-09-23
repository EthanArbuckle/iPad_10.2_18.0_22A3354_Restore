@implementation TTRIRemindersBoardBackgroundView

- (_TtC9Reminders32TTRIRemindersBoardBackgroundView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  char *v9;
  _TtC9Reminders32TTRIRemindersBoardBackgroundView *v10;
  id v11;
  _TtC9Reminders32TTRIRemindersBoardBackgroundView *v12;
  id v13;
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v9 = (char *)self + OBJC_IVAR____TtC9Reminders32TTRIRemindersBoardBackgroundView_delegate;
  *((_QWORD *)v9 + 1) = 0;
  swift_unknownObjectWeakInit(v9, 0);
  v15.receiver = self;
  v15.super_class = ObjectType;
  v10 = -[TTRIRemindersBoardBackgroundView initWithFrame:](&v15, "initWithFrame:", x, y, width, height);
  v11 = objc_allocWithZone((Class)UITapGestureRecognizer);
  v12 = v10;
  v13 = objc_msgSend(v11, "initWithTarget:action:", v12, "tapGestureAction:");
  -[TTRIRemindersBoardBackgroundView addGestureRecognizer:](v12, "addGestureRecognizer:", v13);

  return v12;
}

- (_TtC9Reminders32TTRIRemindersBoardBackgroundView)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = a3;
  return (_TtC9Reminders32TTRIRemindersBoardBackgroundView *)sub_100261AEC(v3, v4);
}

- (void)tapGestureAction:(id)a3
{
  _TtC9Reminders32TTRIRemindersBoardBackgroundView *v5;
  _TtC9Reminders32TTRIRemindersBoardBackgroundView *v6;
  _OWORD v7[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v7);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v7, 0, sizeof(v7));
    v6 = self;
  }
  sub_100261BEC((uint64_t)v7);

  sub_10002CAA0((uint64_t)v7);
}

- (void).cxx_destruct
{
  sub_1000381C8((uint64_t)self + OBJC_IVAR____TtC9Reminders32TTRIRemindersBoardBackgroundView_delegate);
}

@end
