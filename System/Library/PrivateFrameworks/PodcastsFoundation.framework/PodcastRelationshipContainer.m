@implementation PodcastRelationshipContainer

- (_TtC18PodcastsFoundation28PodcastRelationshipContainer)init
{
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18PodcastsFoundation28PodcastRelationshipContainer_data) = (Class)MEMORY[0x1E0DEE9D8];
  v5.receiver = self;
  v5.super_class = ObjectType;
  return -[PodcastRelationshipContainer init](&v5, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
