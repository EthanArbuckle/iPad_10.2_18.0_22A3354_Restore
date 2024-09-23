@implementation TTRIRemindersListTreeTableView

- (CGPoint)contentOffset
{
  double v2;
  double v3;
  objc_super v4;
  CGPoint result;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType(self, a2);
  -[TTRIRemindersListTreeTableView contentOffset](&v4, "contentOffset");
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setContentOffset:(CGPoint)a3
{
  double y;
  double x;
  uint64_t v5;
  _TtC9Reminders30TTRIRemindersListTreeTableView *v6;

  y = a3.y;
  x = a3.x;
  v6 = self;
  sub_100124E0C(x, y, (uint64_t)v6, v5);

}

- (BOOL)_accessibilityShouldUseFallbackForVisibleContentInset
{
  return 1;
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (_TtC9Reminders30TTRIRemindersListTreeTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  _QWORD *v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v11 = (Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC9Reminders30TTRIRemindersListTreeTableView_ownerViewControllerFor52010514);
  *v11 = 0;
  v11[1] = 0;
  v13.receiver = self;
  v13.super_class = ObjectType;
  return -[TTRITreeTableView initWithFrame:style:](&v13, "initWithFrame:style:", a4, x, y, width, height);
}

- (_TtC9Reminders30TTRIRemindersListTreeTableView)initWithCoder:(id)a3
{
  objc_class *ObjectType;
  _QWORD *v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v6 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC9Reminders30TTRIRemindersListTreeTableView_ownerViewControllerFor52010514);
  *v6 = 0;
  v6[1] = 0;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return -[TTRITreeTableView initWithCoder:](&v8, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  sub_1000381B8(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC9Reminders30TTRIRemindersListTreeTableView_ownerViewControllerFor52010514), *(_QWORD *)&self->super.contextMenuDelegate[OBJC_IVAR____TtC9Reminders30TTRIRemindersListTreeTableView_ownerViewControllerFor52010514]);
}

@end
