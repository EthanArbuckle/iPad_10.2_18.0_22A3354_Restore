@implementation TTRITreeTableView

- (_TtC9Reminders17TTRITreeTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  double height;
  double width;
  double y;
  double x;
  char *v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = (char *)self + OBJC_IVAR____TtC9Reminders17TTRITreeTableView_contextMenuDelegate;
  *((_QWORD *)v10 + 1) = 0;
  swift_unknownObjectWeakInit(v10, 0);
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for TTRITreeTableView();
  return -[TTRITreeTableView initWithFrame:style:](&v12, "initWithFrame:style:", a4, x, y, width, height);
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5
{
  char *v9;
  uint64_t Strong;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(void);
  id v15;
  id v16;
  _TtC9Reminders17TTRITreeTableView *v17;
  void *v18;

  v9 = (char *)self + OBJC_IVAR____TtC9Reminders17TTRITreeTableView_contextMenuDelegate;
  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC9Reminders17TTRITreeTableView_contextMenuDelegate);
  if (Strong)
  {
    v12 = Strong;
    v13 = *((_QWORD *)v9 + 1);
    swift_getObjectType(Strong, v11);
    v14 = *(uint64_t (**)(void))(v13 + 8);
    v15 = a3;
    v16 = a4;
    swift_unknownObjectRetain(a5);
    v17 = self;
    v18 = (void *)v14();

    swift_unknownObjectRelease(a5);
    swift_unknownObjectRelease(v12);
  }
  else
  {
    v18 = 0;
  }
  return v18;
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 dismissalPreviewForItemWithIdentifier:(id)a5
{
  char *v9;
  uint64_t Strong;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(void);
  id v15;
  id v16;
  _TtC9Reminders17TTRITreeTableView *v17;
  void *v18;

  v9 = (char *)self + OBJC_IVAR____TtC9Reminders17TTRITreeTableView_contextMenuDelegate;
  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC9Reminders17TTRITreeTableView_contextMenuDelegate);
  if (Strong)
  {
    v12 = Strong;
    v13 = *((_QWORD *)v9 + 1);
    swift_getObjectType(Strong, v11);
    v14 = *(uint64_t (**)(void))(v13 + 16);
    v15 = a3;
    v16 = a4;
    swift_unknownObjectRetain(a5);
    v17 = self;
    v18 = (void *)v14();

    swift_unknownObjectRelease(a5);
    swift_unknownObjectRelease(v12);
  }
  else
  {
    v18 = 0;
  }
  return v18;
}

- (_TtC9Reminders17TTRITreeTableView)initWithCoder:(id)a3
{
  char *v5;
  objc_super v7;

  v5 = (char *)self + OBJC_IVAR____TtC9Reminders17TTRITreeTableView_contextMenuDelegate;
  *((_QWORD *)v5 + 1) = 0;
  swift_unknownObjectWeakInit(v5, 0);
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for TTRITreeTableView();
  return -[TTRITreeTableView initWithCoder:](&v7, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  sub_1000381C8((uint64_t)self + OBJC_IVAR____TtC9Reminders17TTRITreeTableView_contextMenuDelegate);
}

@end
