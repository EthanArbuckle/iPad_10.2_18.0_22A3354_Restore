@implementation TTRIReminderPrintPageRenderer

- (int64_t)numberOfPages
{
  _TtC9Reminders29TTRIReminderPrintPageRenderer *v2;
  uint64_t v3;
  int64_t v4;
  int64_t v5;

  v2 = self;
  sub_1004BBE70((uint64_t)v2, v3);
  v5 = v4;

  return v5;
}

- (void)prepareForDrawingPages:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  objc_class *ObjectType;
  char *v7;
  objc_super v8;

  length = a3.length;
  location = a3.location;
  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v7 = (char *)self + OBJC_IVAR____TtC9Reminders29TTRIReminderPrintPageRenderer_pageRange;
  *(_QWORD *)v7 = location;
  *((_QWORD *)v7 + 1) = length;
  v7[16] = 0;
  v8.receiver = self;
  v8.super_class = ObjectType;
  -[TTRIReminderPrintPageRenderer prepareForDrawingPages:](&v8, "prepareForDrawingPages:", location, length);
}

- (void)drawContentForPageAtIndex:(int64_t)a3 inRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  objc_super v9;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType(self, a2);
  -[TTRIReminderPrintPageRenderer drawContentForPageAtIndex:inRect:](&v9, "drawContentForPageAtIndex:inRect:", a3, x, y, width, height);
}

- (void)drawFooterForPageAtIndex:(int64_t)a3 inRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  CGFloat x;
  __n128 v9;
  _TtC9Reminders29TTRIReminderPrintPageRenderer *v10;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = self;
  v9.n128_f64[0] = x;
  sub_1004BC330(a3, v9, y, width, height);

}

- (_TtC9Reminders29TTRIReminderPrintPageRenderer)init
{
  _TtC9Reminders29TTRIReminderPrintPageRenderer *result;

  result = (_TtC9Reminders29TTRIReminderPrintPageRenderer *)_swift_stdlib_reportUnimplementedInitializer("Reminders.TTRIReminderPrintPageRenderer", 39, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.isa
                         + OBJC_IVAR____TtC9Reminders29TTRIReminderPrintPageRenderer_renderingUtils));
}

@end
