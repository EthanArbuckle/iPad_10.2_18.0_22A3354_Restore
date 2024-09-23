@implementation DOCNodeContextMenuConfiguration

- (_TtC5Files31DOCNodeContextMenuConfiguration)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5Files31DOCNodeContextMenuConfiguration_nodes) = (Class)_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC5Files31DOCNodeContextMenuConfiguration_presentingNode) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCNodeContextMenuConfiguration();
  return -[DOCNodeContextMenuConfiguration init](&v3, "init");
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtC5Files31DOCNodeContextMenuConfiguration_nodes));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.isa
                                      + OBJC_IVAR____TtC5Files31DOCNodeContextMenuConfiguration_presentingNode));
}

@end
