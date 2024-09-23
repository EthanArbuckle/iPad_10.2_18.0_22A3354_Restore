@implementation TTRListAppearanceBadgeGridView

- (_TtC9Reminders30TTRListAppearanceBadgeGridView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  unsigned __int8 *v9;
  unsigned __int8 *v10;
  _TtC9Reminders30TTRListAppearanceBadgeGridView *v11;
  id v12;
  _TtC9Reminders30TTRListAppearanceBadgeGridView *v13;
  id v14;
  objc_super v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v9 = &self->superclass_opaque[OBJC_IVAR____TtC9Reminders30TTRListAppearanceBadgeGridView_delegate];
  *((_QWORD *)v9 + 1) = 0;
  swift_unknownObjectWeakInit(v9, 0);
  v10 = &self->superclass_opaque[OBJC_IVAR____TtC9Reminders30TTRListAppearanceBadgeGridView_indexOfSelectedItem];
  *(_QWORD *)v10 = 0;
  v10[8] = 1;
  v16.receiver = self;
  v16.super_class = ObjectType;
  v11 = -[TTRListAppearanceBadgeGridView initWithFrame:](&v16, "initWithFrame:", x, y, width, height);
  v12 = objc_allocWithZone((Class)UITapGestureRecognizer);
  v13 = v11;
  v14 = objc_msgSend(v12, "initWithTarget:action:", v13, "didTap:");
  -[TTRListAppearanceBadgeGridView addGestureRecognizer:](v13, "addGestureRecognizer:", v14);

  return v13;
}

- (_TtC9Reminders30TTRListAppearanceBadgeGridView)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;

  v3 = a3;
  return (_TtC9Reminders30TTRListAppearanceBadgeGridView *)sub_10024520C(v3, v4);
}

- (void)didTap:(id)a3
{
  id v4;
  _TtC9Reminders30TTRListAppearanceBadgeGridView *v5;

  v4 = a3;
  v5 = self;
  sub_100245498(v4);

}

- (void).cxx_destruct
{
  sub_1000381C8((uint64_t)&self->superclass_opaque[OBJC_IVAR____TtC9Reminders30TTRListAppearanceBadgeGridView_delegate]);
}

@end
