@implementation ContextMenuButton

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  sub_1005C47D8(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (SEL *)&selRef_contextMenuInteraction_willDisplayMenuForConfiguration_animator_);
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  sub_1005C47D8(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (SEL *)&selRef_contextMenuInteraction_willEndForConfiguration_animator_);
}

- (_TtC5Books17ContextMenuButton)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC5Books17ContextMenuButton_contextMenuInteractionDelegate);
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for ContextMenuButton();
  return -[ContextMenuButton initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
}

- (_TtC5Books17ContextMenuButton)initWithCoder:(id)a3
{
  objc_super v6;

  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC5Books17ContextMenuButton_contextMenuInteractionDelegate);
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ContextMenuButton();
  return -[ContextMenuButton initWithCoder:](&v6, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  sub_1001FE9A0((uint64_t)self + OBJC_IVAR____TtC5Books17ContextMenuButton_contextMenuInteractionDelegate);
}

@end
