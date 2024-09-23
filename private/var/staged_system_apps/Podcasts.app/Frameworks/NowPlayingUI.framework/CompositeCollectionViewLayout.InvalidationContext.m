@implementation CompositeCollectionViewLayout.InvalidationContext

- (_TtCC12NowPlayingUI29CompositeCollectionViewLayout19InvalidationContext)init
{
  char *v3;
  objc_class *v4;
  objc_super v6;

  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtCC12NowPlayingUI29CompositeCollectionViewLayout19InvalidationContext_componentInvalidationReferences) = (Class)_swiftEmptyArrayStorage;
  v3 = (char *)self
     + OBJC_IVAR____TtCC12NowPlayingUI29CompositeCollectionViewLayout19InvalidationContext_sourceComponentItem;
  v4 = (objc_class *)type metadata accessor for CompositeCollectionViewLayout.InvalidationContext();
  *((_QWORD *)v3 + 1) = 0;
  *((_QWORD *)v3 + 2) = 0;
  *(_QWORD *)v3 = 0;
  v3[24] = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return -[CompositeCollectionViewLayout.InvalidationContext init](&v6, "init");
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.isa
                                     + OBJC_IVAR____TtCC12NowPlayingUI29CompositeCollectionViewLayout19InvalidationContext_componentInvalidationReferences));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.isa
                                      + OBJC_IVAR____TtCC12NowPlayingUI29CompositeCollectionViewLayout19InvalidationContext_sourceComponentItem));
}

@end
