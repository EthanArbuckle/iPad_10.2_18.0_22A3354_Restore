@implementation TTRIBoardReminderCellBackgroundStrokeView

- (void)layoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType(self, a2);
  v2 = v3.receiver;
  -[TTRIBoardReminderCellBackgroundStrokeView layoutSubviews](&v3, "layoutSubviews");
  sub_1003E65DC();

}

- (_TtC9Reminders41TTRIBoardReminderCellBackgroundStrokeView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  uint64_t v9;
  void *v10;
  _TtC9Reminders41TTRIBoardReminderCellBackgroundStrokeView *v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9Reminders41TTRIBoardReminderCellBackgroundStrokeView_strokeWidth) = 0;
  v9 = OBJC_IVAR____TtC9Reminders41TTRIBoardReminderCellBackgroundStrokeView_strokeColor;
  v10 = (void *)objc_opt_self(UIColor);
  v11 = self;
  *(Class *)((char *)&self->super.super.super.isa + v9) = (Class)objc_msgSend(v10, "tintColor");

  v13.receiver = v11;
  v13.super_class = ObjectType;
  return -[TTRIBoardReminderCellBackgroundStrokeView initWithFrame:](&v13, "initWithFrame:", x, y, width, height);
}

- (_TtC9Reminders41TTRIBoardReminderCellBackgroundStrokeView)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = a3;
  return (_TtC9Reminders41TTRIBoardReminderCellBackgroundStrokeView *)sub_1003E6810(v3, v4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders41TTRIBoardReminderCellBackgroundStrokeView_strokeColor));
}

@end
